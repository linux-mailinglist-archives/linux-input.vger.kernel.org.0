Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E0AF56C7505
	for <lists+linux-input@lfdr.de>; Fri, 24 Mar 2023 02:30:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229847AbjCXBaj (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 23 Mar 2023 21:30:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229639AbjCXBai (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 23 Mar 2023 21:30:38 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 357FD61AB
        for <linux-input@vger.kernel.org>; Thu, 23 Mar 2023 18:30:38 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id d13so273577pjh.0
        for <linux-input@vger.kernel.org>; Thu, 23 Mar 2023 18:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679621437;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lXa+KdBGwe+0oUHxohTWrDGF+Fdvf/CETu0e67Y7ecY=;
        b=K92Il4a9lwmcnfguHjdfGOqzX0zTRlHzvFmaRnigAYrI2+rR3NKe07H8s0nihs+E6t
         lbtquqzlofa/4yLAKtpMxRYiNRC8oyr686b2BZDcUZNZ7G7wtvH7DEOqt8X9iHw+q9K6
         PRTFh1Eqlg7p5bR0HZstqD6EOtYiuDTiN2EkbUxRJFANrpl+G8wCdv79cJGrqrC5htlV
         nZE2QOv2kGNPhhgXeckhMiwaMDtU/uI/v1W74jiFoMzRvwmPwbgTEYUVjaAVSl1CHv7u
         s/okjoE0GlgHSZsBFTiA5TxzoKOjgLieNaGtVGbGxGbSvG39RAqtFmYo8FcF/LedI/Ze
         OhtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679621437;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lXa+KdBGwe+0oUHxohTWrDGF+Fdvf/CETu0e67Y7ecY=;
        b=VXdivpBUKlMHkJ1H8jG26zkO1Ih8p8zJWgTB3rMdTEQ6Tao+CbQCdUZZYGKfst5cHn
         VovTJcKCtTks0UHXTNnmIQ8qpl4cm/6MlSwwH5BI/BLRzQdFs7GDkVfLB+AyXv9xzFAk
         6Gxu3aPkjLP6Stz2B/WjjUIYFZH7IBpizcqpAMJyJ7ohZ2LBqCCBTRmJhKVRkluAdwKS
         B0PeAFTSQdGj4n0+cZkGnSs5nj1f8rpKXJDfdVlg8cTuHR/LKYeKdFmRiKFnD8+CrFPf
         gCDXEv1RTbR4jeyze4Zi6uybxHlINtro0fmWkdBxFE/2RS1Yh5r5WjeoCM5FDww4pfB3
         oTtA==
X-Gm-Message-State: AO0yUKUBemtb+cVSVKisfD36R5vNoElWRLnjD3vthKly9RsGFaez4oU/
        TP0Ll2Qz70E63ei7xy9O+jQsbPRJM4w=
X-Google-Smtp-Source: AK7set81P4YGvpzpDWLIItuqA1hadQsSYn1OYV4YdhYQD0/Gub9yaAsVekruoPCTinzP0E2IHFJoKw==
X-Received: by 2002:a05:6a20:4c9f:b0:db:c52b:1b1 with SMTP id fq31-20020a056a204c9f00b000dbc52b01b1mr1291498pzb.11.1679621437528;
        Thu, 23 Mar 2023 18:30:37 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:f5e9:5a97:54ee:6f66])
        by smtp.gmail.com with ESMTPSA id i21-20020aa787d5000000b00571cdbd0771sm12557650pfo.102.2023.03.23.18.30.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 18:30:36 -0700 (PDT)
Date:   Thu, 23 Mar 2023 18:30:34 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Vicki Pfau <vi@endrift.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, Pavel Rojtberg <rojtberg@gmail.com>,
        Andrey Smirnov <andrew.smirnov@gmail.com>
Subject: Re: [PATCH 1/3] Input: xpad - fix support for some third-party
 controllers
Message-ID: <ZBz9OnKq1/UWddk9@google.com>
References: <20230225012147.276489-1-vi@endrift.com>
 <20230225012147.276489-2-vi@endrift.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230225012147.276489-2-vi@endrift.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Feb 24, 2023 at 05:21:46PM -0800, Vicki Pfau wrote:
> Some third-party controllers, such as the HORPIAD FPS for Nintendo Switch and
> Gamesir-G3w, require a specific packet that the first-party XInput driver sends
> before it will start sending reports. It's not currently known what this packet
> does, but since the first-party driver always sends it's unlikely that this
> could cause issues with existing controllers.
> 
> Co-authored-by: Andrey Smirnov <andrew.smirnov@gmail.com>
> Signed-off-by: Vicki Pfau <vi@endrift.com>
> ---
>  drivers/input/joystick/xpad.c | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
> index 403b57e8176b..04af2213407f 100644
> --- a/drivers/input/joystick/xpad.c
> +++ b/drivers/input/joystick/xpad.c
> @@ -265,6 +265,7 @@ static const struct xpad_device {
>  	{ 0x0f0d, 0x0067, "HORIPAD ONE", 0, XTYPE_XBOXONE },
>  	{ 0x0f0d, 0x0078, "Hori Real Arcade Pro V Kai Xbox One", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOXONE },
>  	{ 0x0f0d, 0x00c5, "Hori Fighting Commander ONE", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOXONE },
> +	{ 0x0f0d, 0x00dc, "HORIPAD FPS for Nintendo Switch", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOX360 },
>  	{ 0x0f30, 0x010b, "Philips Recoil", 0, XTYPE_XBOX },
>  	{ 0x0f30, 0x0202, "Joytech Advanced Controller", 0, XTYPE_XBOX },
>  	{ 0x0f30, 0x8888, "BigBen XBMiniPad Controller", 0, XTYPE_XBOX },
> @@ -2020,6 +2021,27 @@ static int xpad_probe(struct usb_interface *intf, const struct usb_device_id *id
>  		goto err_free_in_urb;
>  	}
>  
> +	if (xpad->xtype == XTYPE_XBOX360) {
> +		/* Some third-party controllers Xbox 360-style controllers
> +		 * require this message to finish initialization */
> +		uint8_t dummy[20];
> +		int ret;
> +
> +		usb_control_msg_recv(udev, 0,
> +				     /* bRequest */ 0x01,
> +				     /* bmRequestType */
> +				     USB_TYPE_VENDOR | USB_DIR_IN |
> +				     USB_RECIP_INTERFACE,
> +				     /* wValue */ 0x100,
> +				     /* wIndex */ 0x00,
> +				     dummy, sizeof(dummy),
> +				     25,
> +				     GFP_KERNEL);
> +		if (ret)
> +			dev_warn(&xpad->dev->dev,
> +				 "unable to receive magic message: %d\n", ret);

You are not setting "ret", how was this tested?

> +	}
> +
>  	ep_irq_in = ep_irq_out = NULL;
>  
>  	for (i = 0; i < 2; i++) {
> -- 
> 2.39.2
> 

-- 
Dmitry
