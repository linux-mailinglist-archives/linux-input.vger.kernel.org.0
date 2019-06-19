Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B41E84AF01
	for <lists+linux-input@lfdr.de>; Wed, 19 Jun 2019 02:25:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729061AbfFSAZA (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 18 Jun 2019 20:25:00 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:47026 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729050AbfFSAY7 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 18 Jun 2019 20:24:59 -0400
Received: by mail-pf1-f196.google.com with SMTP id 81so8587370pfy.13;
        Tue, 18 Jun 2019 17:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=asl8nEGPBFR80gDIdoz4WOZJFFMieyc8VT4m7EGPaHs=;
        b=hSDnD8Ga5CgNeqzWpzg4YsI+aMuTNejgx1vMs/XrR+3yXlnnAPC5lsFmPvmmydEwK9
         vQjGXGkP0mSnSzSalp088CxRt51DMPIKGotHumqrI5blaHsNZilFO3zbZsle+z2RwZ8H
         ce44IuUS6x1bUaU+IRLHCzfOYsoD9FFZQEGwQLnP0lXo76RmTqtOLwA/aN7nRWiatKV7
         XiztcCnpKM/+gJhTeSvNbL0rtGHuzdadYDXM1WAuBW793hnEfPhLoRNbvMqtLIAol7jQ
         O+lGoMRr1BjlpbGmUBOTecSNB5IY8XaF3Lhu5rDyZQL85d859KfHL5JsJN3dI+16mlgi
         usXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=asl8nEGPBFR80gDIdoz4WOZJFFMieyc8VT4m7EGPaHs=;
        b=Adoa20ME3siptSKnuNXhsGAFh9HzpG8c3FOsJI4c9HELihxtuU30bybkyeo8AN05N2
         eMWyqWc/U7zprUAUtyPnZjroxAZynwhgdAYzwEnDCIDQtiq2Ayvyal2ATJa1u9HK5Bjx
         OY+2EDJhwWRjOJtbjUV5758RV7V/Gj2MbAC4gzZglg1cnzabpeNkYOcaLYLu8WkPFXoJ
         19oofWUOUy5ipaH/i+EMDErb5d2GvMwIAKwJ0Y9Q5GpMZNSm1Gqh+VVLMcb06IGH7Zf6
         RXvUrgnL5KBirD/PzxNJzlkKFE8NrkIqVBFtEI9zinTXykQf7ZIaGVodA9tuuVkPDfbx
         gNVQ==
X-Gm-Message-State: APjAAAW/+2g4rrYhZ2CuUKhN0gopbvNnVbbpgH/wiVxkdAW5PnGeMAZ0
        ViGWvxpeGsRtK0T7fumtEnhBSz0G
X-Google-Smtp-Source: APXvYqxe1ImPm+jGw2cV1RSoD72mFDmuzAzflBCt2DKZxHhaH/uhtMOeF/HDQUjgO9eRu6MpsCQRjA==
X-Received: by 2002:aa7:8641:: with SMTP id a1mr3893757pfo.177.1560903898911;
        Tue, 18 Jun 2019 17:24:58 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id 11sm272733pfw.33.2019.06.18.17.24.58
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 18 Jun 2019 17:24:58 -0700 (PDT)
Date:   Tue, 18 Jun 2019 17:24:56 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Tim Schumacher <timschumi@gmx.de>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH resend] Input: iforce - Add the Saitek R440 Force Wheel
Message-ID: <20190619002456.GD62571@dtor-ws>
References: <20190612140903.20058-1-timschumi@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190612140903.20058-1-timschumi@gmx.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Jun 12, 2019 at 04:09:03PM +0200, Tim Schumacher wrote:
> Signed-off-by: Tim Schumacher <timschumi@gmx.de>

Applied, thank you.

> ---
> Please note that I do NOT own this device.
> 
> I'm adding this based on the fact that this is an iforce-based
> device and that the Windows driver for the R440 works for the
> Logitech WingMan Formula Force after replacing the device/vendor
> IDs (I got the vendor/device IDs from there as well).
> 
> Please don't add this patch if adding devices based on that is
> not ok.
> 
> This patch is a resend of the patch I sent back in November,
> which apparently went unnoticed.
> ---
>  drivers/input/joystick/iforce/iforce-main.c | 1 +
>  drivers/input/joystick/iforce/iforce-usb.c  | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/drivers/input/joystick/iforce/iforce-main.c b/drivers/input/joystick/iforce/iforce-main.c
> index 55f5b7bb4cac..e000e7d5b4c1 100644
> --- a/drivers/input/joystick/iforce/iforce-main.c
> +++ b/drivers/input/joystick/iforce/iforce-main.c
> @@ -55,6 +55,7 @@ static struct iforce_device iforce_device[] = {
>  	{ 0x05ef, 0x8888, "AVB Top Shot Force Feedback Racing Wheel",	btn_wheel, abs_wheel, ff_iforce }, //?
>  	{ 0x061c, 0xc0a4, "ACT LABS Force RS",                          btn_wheel, abs_wheel, ff_iforce }, //?
>  	{ 0x061c, 0xc084, "ACT LABS Force RS",				btn_wheel, abs_wheel, ff_iforce },
> +	{ 0x06a3, 0xff04, "Saitek R440 Force Wheel",			btn_wheel, abs_wheel, ff_iforce }, //?
>  	{ 0x06f8, 0x0001, "Guillemot Race Leader Force Feedback",	btn_wheel, abs_wheel, ff_iforce }, //?
>  	{ 0x06f8, 0x0001, "Guillemot Jet Leader Force Feedback",	btn_joystick, abs_joystick_rudder, ff_iforce },
>  	{ 0x06f8, 0x0004, "Guillemot Force Feedback Racing Wheel",	btn_wheel, abs_wheel, ff_iforce }, //?
> diff --git a/drivers/input/joystick/iforce/iforce-usb.c b/drivers/input/joystick/iforce/iforce-usb.c
> index f1569ae8381b..afbcd1a522d4 100644
> --- a/drivers/input/joystick/iforce/iforce-usb.c
> +++ b/drivers/input/joystick/iforce/iforce-usb.c
> @@ -202,6 +202,7 @@ static const struct usb_device_id iforce_usb_ids[] = {
>  	{ USB_DEVICE(0x05ef, 0x8888) },		/* AVB Top Shot FFB Racing Wheel */
>  	{ USB_DEVICE(0x061c, 0xc0a4) },         /* ACT LABS Force RS */
>  	{ USB_DEVICE(0x061c, 0xc084) },         /* ACT LABS Force RS */
> +	{ USB_DEVICE(0x06a3, 0xff04) },		/* Saitek R440 Force Wheel */
>  	{ USB_DEVICE(0x06f8, 0x0001) },		/* Guillemot Race Leader Force Feedback */
>  	{ USB_DEVICE(0x06f8, 0x0003) },		/* Guillemot Jet Leader Force Feedback */
>  	{ USB_DEVICE(0x06f8, 0x0004) },		/* Guillemot Force Feedback Racing Wheel */
> --
> 2.22.0
> 

-- 
Dmitry
