Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D71A266E390
	for <lists+linux-input@lfdr.de>; Tue, 17 Jan 2023 17:29:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231970AbjAQQ3k (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 17 Jan 2023 11:29:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231641AbjAQQ3e (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 17 Jan 2023 11:29:34 -0500
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A409F402FD
        for <linux-input@vger.kernel.org>; Tue, 17 Jan 2023 08:29:32 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id f19-20020a1c6a13000000b003db0ef4dedcso374041wmc.4
        for <linux-input@vger.kernel.org>; Tue, 17 Jan 2023 08:29:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:to:from
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hk7Iadk1SuZiYeIpoIvc7zdTIsuCdC1z9QHZwptqB+E=;
        b=Q1uOlzAVbJUMhEOUphXyQH3hMzEaOBcYIIpbNbzxwH9WvzkqwEMKsdx1lZHbYCVjIE
         LAXWjjE/pjA5NvKairtaDbgmU6/iZ0DSLPq87tCp3bFeSvk4kg2pzsymU50gK1sOJ/Tu
         oHdo2PR9oDOuIeqIoO/VlBYKbYZnlWRNcVzyaT8RcLbs8fofMxZfoqnnbyZ0Ybrs7sud
         uP90+b4e86tFcmA06HxA/k/Whksgo9IptZBWz86fSMwU4S6TmEu3ZH7Lfr8NIY2BjFMB
         Dm/IQliPpo9fe2kW37ibQLS2nZBJD9l7DM+D0GOdLKxghFNuredypUU93Uu8dVkWBLK6
         xP6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hk7Iadk1SuZiYeIpoIvc7zdTIsuCdC1z9QHZwptqB+E=;
        b=FvdUKWZwAP1EbrImRFrfxeBf97Z+h6fhVD6jkaRqbNif/w4twyixRPqLf5EerfvP0j
         Q4RFnClMLlLbYUaqacsRdDUe0ymJQH5u2p1+4Kq6LtaRRK/KBg1fRJ7JFm+hcEIrD9s9
         tOxpd0JOcXQp0Na0M+g/HbAH3edstoa9nHliBRWBWG4HnOGorPmQs2KZj5I7PRSxNGKY
         uBl3lDP+c06VItmQt+n711U7Pf4L1aiXtiH5VzGkirCNfTLK5G6G7+J0lP2zXFrA7FRa
         A+oVmbe2gTwhu96URXSZ+KaMCTxOdSW6F6ev7aMQ2YqpUODPp2Gk9qa6eGw2tQ4BBTQd
         RaWw==
X-Gm-Message-State: AFqh2kpkWKP+aFfQUJ0EBexw2nivUy3I8kP3f5IJvjt666w3sTVyXKVu
        AdEUkK0IKW6aQOO6cwXE8A3GUHKLYk4aXtud
X-Google-Smtp-Source: AMrXdXsW09yq5dhrV9kVMdA7LXWotR247OyI3+TRKF7x49uZ8xs3xjfgjsUDM8vX3iYFKzBW4RivKw==
X-Received: by 2002:a05:600c:4e05:b0:3db:1d8:9f25 with SMTP id b5-20020a05600c4e0500b003db01d89f25mr3670700wmq.2.1673972971226;
        Tue, 17 Jan 2023 08:29:31 -0800 (PST)
Received: from localhost ([82.66.159.240])
        by smtp.gmail.com with ESMTPSA id q15-20020adfab0f000000b002bde7999cd6sm11117281wrc.61.2023.01.17.08.29.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jan 2023 08:29:30 -0800 (PST)
From:   Mattijs Korpershoek <mkorpershoek@baylibre.com>
To:     Walt Holman <walt@holmansrus.com>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-input@vger.kernel.org
Subject: Re: PATCH: Add devce IDs for Logitech G923 Xbox Steering Wheel
In-Reply-To: <743753078.40.1672170394290.JavaMail.zimbra@holmansrus.com>
References: <743753078.40.1672170394290.JavaMail.zimbra@holmansrus.com>
Date:   Tue, 17 Jan 2023 17:29:29 +0100
Message-ID: <87v8l5ktue.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hello Walt,

Thank you for your patch.

On Tue, Dec 27, 2022 at 13:46, Walt Holman <walt@holmansrus.com> wrote:

> Hello,
>
> This patch adds support for the Logitech G923 Xbox edition steering wheel. This uses the hid-logitech-hidpp kernel module and from my testing, force feedback and all buttons work. This requires the usb_modeswitch application to setup the device in PC mode with a magic string that is the same as the Logitech 920 wheel. Originally I had massaged a patch I found for this wheel, however, much of it was unnecessary and I culled it back to just adding the ID's. Let me know if you need anything else or have any questions. Thanks,

It looks like this patch has been sent as an attachment, not inline. The
subject also looks invalid.

It should be in the lines of:
[PATCH] HID: quirks: Add quirk for Logitech G923 Xbox steering wheel

To make sure your patch gets picked up by a maintainer, can you please
resend it as a plain-text email, following the standard kernel
procedure?

Here are some links to help you preparing your submission:
https://www.kernel.org/doc/html/latest/process/submitting-patches.html#no-mime-no-links-no-compression-no-attachments-just-plain-text

If you are new to kernel development, the b4 tool could also help you
preparing your change and finding the right receivers:
https://people.kernel.org/monsieuricon/sending-a-kernel-patch-with-b4-part-1

Hope that helps,
Mattijs

>
> Signed-off-by: Walt Holman walt@holmansrus.com
> diff -u2 -r linux-source/drivers/hid/hid-ids.h linux-target/drivers/hid/hid-ids.h
> --- linux-source/drivers/hid/hid-ids.h	2022-12-21 10:48:12.000000000 -0600
> +++ linux-target/drivers/hid/hid-ids.h	2022-12-22 12:50:16.403880137 -0600
> @@ -820,4 +820,5 @@
>  #define USB_DEVICE_ID_LOGITECH_G29_WHEEL	0xc24f
>  #define USB_DEVICE_ID_LOGITECH_G920_WHEEL	0xc262
> +#define USB_DEVICE_ID_LOGITECH_G923_XBOX_WHEEL	0xc26e
>  #define USB_DEVICE_ID_LOGITECH_WINGMAN_F3D	0xc283
>  #define USB_DEVICE_ID_LOGITECH_FORCE3D_PRO	0xc286
> diff -u2 -r linux-source/drivers/hid/hid-logitech-hidpp.c linux-target/drivers/hid/hid-logitech-hidpp.c
> --- linux-source/drivers/hid/hid-logitech-hidpp.c	2022-12-21 10:48:12.000000000 -0600
> +++ linux-target/drivers/hid/hid-logitech-hidpp.c	2022-12-22 12:53:36.335755199 -0600
> @@ -4341,4 +4341,7 @@
>  	  HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, USB_DEVICE_ID_LOGITECH_G920_WHEEL),
>  		.driver_data = HIDPP_QUIRK_CLASS_G920 | HIDPP_QUIRK_FORCE_OUTPUT_REPORTS},
> +	{ /* Logitech G923 Wheel (Xbox version) over USB */
> +	  HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, USB_DEVICE_ID_LOGITECH_G923_XBOX_WHEEL),
> +		.driver_data = HIDPP_QUIRK_CLASS_G920 | HIDPP_QUIRK_FORCE_OUTPUT_REPORTS },
>  	{ /* Logitech G Pro Gaming Mouse over USB */
>  	  HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, 0xC088) },
