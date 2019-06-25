Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C8C47526F8
	for <lists+linux-input@lfdr.de>; Tue, 25 Jun 2019 10:44:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728774AbfFYIod convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-input@lfdr.de>); Tue, 25 Jun 2019 04:44:33 -0400
Received: from eu-smtp-delivery-151.mimecast.com ([207.82.80.151]:33079 "EHLO
        eu-smtp-delivery-151.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727770AbfFYIod (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 25 Jun 2019 04:44:33 -0400
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-64-2CgliomXP9qa0e1tUxO66g-1; Tue, 25 Jun 2019 09:44:30 +0100
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) with Microsoft SMTP
 Server (TLS) id 15.0.1347.2; Tue, 25 Jun 2019 09:44:29 +0100
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
 AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id 15.00.1347.000;
 Tue, 25 Jun 2019 09:44:29 +0100
From:   David Laight <David.Laight@ACULAB.COM>
To:     'Dmitry Torokhov' <dmitry.torokhov@gmail.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
CC:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Benoit Parrot <bparrot@ti.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 1/2] Input: edt-ft5x06 - use get_unaligned_be16()
Thread-Topic: [PATCH 1/2] Input: edt-ft5x06 - use get_unaligned_be16()
Thread-Index: AQHVKY1hAj6tejpQ3kG1+0ev0Psa8KasERZw
Date:   Tue, 25 Jun 2019 08:44:29 +0000
Message-ID: <011d62995b20493f977ead43f4b494a2@AcuMS.aculab.com>
References: <20190623063153.261546-1-dmitry.torokhov@gmail.com>
In-Reply-To: <20190623063153.261546-1-dmitry.torokhov@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
X-MC-Unique: 2CgliomXP9qa0e1tUxO66g-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Dmitry Torokhov
> Sent: 23 June 2019 07:32
> 
> Instead of doing conversion by hand, let's use the proper accessors.
> 
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
>  drivers/input/touchscreen/edt-ft5x06.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/edt-ft5x06.c b/drivers/input/touchscreen/edt-ft5x06.c
> index c639ebce914c..ec770226e119 100644
> --- a/drivers/input/touchscreen/edt-ft5x06.c
> +++ b/drivers/input/touchscreen/edt-ft5x06.c
> @@ -27,6 +27,7 @@
>  #include <linux/gpio/consumer.h>
>  #include <linux/input/mt.h>
>  #include <linux/input/touchscreen.h>
> +#include <asm/unaligned.h>
> 
>  #define WORK_REGISTER_THRESHOLD		0x00
>  #define WORK_REGISTER_REPORT_RATE	0x08
> @@ -239,8 +240,8 @@ static irqreturn_t edt_ft5x06_ts_isr(int irq, void *dev_id)
>  		if (tsdata->version == EDT_M06 && type == TOUCH_EVENT_DOWN)
>  			continue;
> 
> -		x = ((buf[0] << 8) | buf[1]) & 0x0fff;
> -		y = ((buf[2] << 8) | buf[3]) & 0x0fff;
> +		x = get_unaligned_be16(buf) & 0x0fff;
> +		y = get_unaligned_be16(buf + 2) & 0x0fff;

You might as well delete the pointless masking with 0xff.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)

