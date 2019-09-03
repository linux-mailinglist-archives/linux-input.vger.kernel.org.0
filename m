Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3EC47A5F4F
	for <lists+linux-input@lfdr.de>; Tue,  3 Sep 2019 04:33:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726731AbfICCdf convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-input@lfdr.de>); Mon, 2 Sep 2019 22:33:35 -0400
Received: from emcscan.emc.com.tw ([192.72.220.5]:35595 "EHLO
        emcscan.emc.com.tw" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725981AbfICCdf (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 2 Sep 2019 22:33:35 -0400
X-IronPort-AV: E=Sophos;i="5.56,253,1539619200"; 
   d="scan'208";a="32010529"
Received: from unknown (HELO webmail.emc.com.tw) ([192.168.10.1])
  by emcscan.emc.com.tw with SMTP; 03 Sep 2019 10:33:34 +0800
Received: from 192.168.55.71
        by webmail.emc.com.tw with Mail2000 ESMTPA Server V7.00(122352:0:AUTH_LOGIN)
        (envelope-from <johnny.chuang@emc.com.tw>); Tue, 03 Sep 2019 10:33:33 +0800 (CST)
From:   "Johnny.Chuang" <johnny.chuang@emc.com.tw>
To:     "'Dmitry Torokhov'" <dmitry.torokhov@gmail.com>
Cc:     <linux-kernel@vger.kernel.org>, <linux-input@vger.kernel.org>,
        =?big5?B?J1NUUkQyLb2ytGa8YCc=?= <jennifer.tsai@emc.com.tw>,
        =?big5?B?J1NUUkQyLbOvsVKp+rhnsnon?= <james.chen@emc.com.tw>,
        =?big5?B?J7Hns9W1vic=?= <paul.liang@emc.com.tw>,
        "'jeff'" <jeff.chuang@emc.com.tw>
References: <1566958886-25756-1-git-send-email-johnny.chuang@emc.com.tw> <000601d55d49$05878160$10968420$@emc.com.tw> <20190829182933.GD187474@dtor-ws>
In-Reply-To: <20190829182933.GD187474@dtor-ws>
Subject: RE: [PATCH] Input: elants_i2c - return real value of elants_i2c_initialize()
Date:   Tue, 3 Sep 2019 10:33:33 +0800
Message-ID: <001e01d561ff$fb3d7000$f1b85000$@emc.com.tw>
MIME-Version: 1.0
Content-Type: text/plain;
        charset="big5"
Content-Transfer-Encoding: 8BIT
X-Mailer: Microsoft Outlook 14.0
Thread-Index: AQFmeLP5IfQOHpOgOs9iM2bs2d5OHQE/UdUoAQf8D7yn5NEZcA==
Content-Language: zh-tw
x-dg-ref: PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcMDUwMTBcYXBwZGF0YVxyb2FtaW5nXDA5ZDg0OWI2LTMyZDMtNGE0MC04NWVlLTZiODRiYTI5ZTM1Ylxtc2dzXG1zZy0zOGM2Yjg0MC1jZGYzLTExZTktODBkYy03YzVjZjg3NDk0NzhcYW1lLXRlc3RcMzhjNmI4NDItY2RmMy0xMWU5LTgwZGMtN2M1Y2Y4NzQ5NDc4Ym9keS50eHQiIHN6PSIxODA4IiB0PSIxMzIxMTk1MTYxMzU0MzUxODQiIGg9InkzM0pvY3p4U0UrSWVVMGRYdEIwWUU0aHhBND0iIGlkPSIiIGJsPSIwIiBibz0iMSIvPjwvbWV0YT4=
x-dg-rorf: true
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Dmitry,

Thanks for your explanation.
If I want to abandon this patch, what's step I need to do?

Many thanks,
Johnny
-----Original Message-----
From: 'Dmitry Torokhov' [mailto:dmitry.torokhov@gmail.com] 
Sent: Friday, August 30, 2019 2:30 AM
To: Johnny.Chuang
Cc: linux-kernel@vger.kernel.org; linux-input@vger.kernel.org; STRD2-蔡惠嬋;
STRD2-陳崇明經理; '梁博翔'; 'jeff'
Subject: Re: [PATCH] Input: elants_i2c - return real value of
elants_i2c_initialize()

Hi Johnny,

On Wed, Aug 28, 2019 at 10:33:46AM +0800, Johnny.Chuang wrote:
> The return value of elants_i2c_initialize() was always 0.
> It maybe register input device when initialize fail.

We do not want to return error here, because it will abort probe, and then
we will not be able to initiate firmware flash flow so we can attempt to
recover the device.

If you want to try you can change the ts->iap_mode before trying to register
input device, but then you need to be very careful about registering and
unregistering it later, after flashing or re-flashing firmware.

> 
> Signed-off-by: Johnny Chuang <johnny.chuang@emc.com.tw>
> ---
>  drivers/input/touchscreen/elants_i2c.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/input/touchscreen/elants_i2c.c
> b/drivers/input/touchscreen/elants_i2c.c
> index d4ad24e..9c9816f 100644
> --- a/drivers/input/touchscreen/elants_i2c.c
> +++ b/drivers/input/touchscreen/elants_i2c.c
> @@ -571,7 +571,7 @@ static int elants_i2c_initialize(struct elants_data
*ts)
>  	if (error)
>  		ts->iap_mode = ELAN_IAP_RECOVERY;
>  
> -	return 0;
> +	return error;
>  }
>  
>  /*
> --
> 2.7.4
> 

Thanks.

-- 
Dmitry

