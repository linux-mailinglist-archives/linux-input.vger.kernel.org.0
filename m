Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E9608740F4F
	for <lists+linux-input@lfdr.de>; Wed, 28 Jun 2023 12:51:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229622AbjF1KvE convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-input@lfdr.de>); Wed, 28 Jun 2023 06:51:04 -0400
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:44413 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231290AbjF1Kum (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 28 Jun 2023 06:50:42 -0400
X-GND-Sasl: hadess@hadess.net
X-GND-Sasl: hadess@hadess.net
X-GND-Sasl: hadess@hadess.net
X-GND-Sasl: hadess@hadess.net
X-GND-Sasl: hadess@hadess.net
Received: by mail.gandi.net (Postfix) with ESMTPSA id D08F2FF803;
        Wed, 28 Jun 2023 10:50:40 +0000 (UTC)
Message-ID: <51ab0acb9e903798dc10ef4fe11eb726df76517b.camel@hadess.net>
Subject: Re: [RESEND PATCH 2/2] HID: logitech-hidpp: Add support for the Pro
 X Superlight
From:   Bastien Nocera <hadess@hadess.net>
To:     Mavroudis Chatzilazaridis <mavchatz@protonmail.com>,
        jikos@kernel.org
Cc:     linux-input@vger.kernel.org, benjamin.tissoires@redhat.com,
        lains@riseup.net
Date:   Wed, 28 Jun 2023 12:50:34 +0200
In-Reply-To: <20230625162131.17921-2-mavchatz@protonmail.com>
References: <20230625162131.17921-1-mavchatz@protonmail.com>
         <20230625162131.17921-2-mavchatz@protonmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.48.3 (3.48.3-1.fc38) 
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, 2023-06-25 at 16:21 +0000, Mavroudis Chatzilazaridis wrote:
> This patch adds support for the Pro X Superlight. Tested over USB.

Could you please list which functionality this gains the device?
Battery reporting? Hi-res scrolling? Something else?

> 
> Co-developed-by: Filipe Laíns <lains@riseup.net>
> Signed-off-by: Filipe Laíns <lains@riseup.net>
> Signed-off-by: Mavroudis Chatzilazaridis <mavchatz@protonmail.com>
> ---
>  drivers/hid/hid-logitech-hidpp.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-
> logitech-hidpp.c
> index 5e1a412fd28f..a718535fb87d 100644
> --- a/drivers/hid/hid-logitech-hidpp.c
> +++ b/drivers/hid/hid-logitech-hidpp.c
> @@ -4616,6 +4616,8 @@ static const struct hid_device_id
> hidpp_devices[] = {
>                 .driver_data = HIDPP_QUIRK_CLASS_G920 |
> HIDPP_QUIRK_FORCE_OUTPUT_REPORTS },
>         { /* Logitech G Pro Gaming Mouse over USB */
>           HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, 0xC088) },
> +       { /* Logitech G Pro X Superlight Gaming Mouse over USB */
> +         HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, 0xC094) },
> 
>         { /* G935 Gaming Headset */
>           HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, 0x0a87),
> --
> 2.34.1
> 
> 

