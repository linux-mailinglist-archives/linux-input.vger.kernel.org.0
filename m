Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C2D35FEE47
	for <lists+linux-input@lfdr.de>; Fri, 14 Oct 2022 15:00:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229583AbiJNNAN (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 14 Oct 2022 09:00:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229579AbiJNNAM (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 14 Oct 2022 09:00:12 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA31BEA378
        for <linux-input@vger.kernel.org>; Fri, 14 Oct 2022 06:00:09 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id l14-20020a05600c1d0e00b003c6ecc94285so12796wms.1
        for <linux-input@vger.kernel.org>; Fri, 14 Oct 2022 06:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=qStvpSy4VQeGcoXIRx/aoxJuoTT/1cohobtLab2QMao=;
        b=Apan3zCMfsxZuMH3tSiBNhiRfUIFSkk7ISpq9tueM0eqscXaDfrp1cgzAum3h2UMIF
         ka8UtN7kV0pCHMOLx6UKZumw64/0BhHl/Wudm34893Pl+ZdsV9uNSDYXp/McoeJz0qRP
         tGmG94HRxkePlEJGKGqDidA8jBdT4632qzP3i+tTpKaViksVLsn01i/xKF9BJVfNNIVr
         FSua7M6hr3IU5NzmJRhTzu+wwZezyk4cdOyM7nw4imaTRcdYcD+Mqb0x2KErf8R0eVEF
         B6Y93jBUBm8sNbBruDt9BSuwhruH2nGLpfgz/MmuF5PPRIpivdkFyRrYveQ8ESjf2cqH
         Hr+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qStvpSy4VQeGcoXIRx/aoxJuoTT/1cohobtLab2QMao=;
        b=RnQM07f4tCCdSZ2dVH+zqcqamlc4ZS4aNwKNmu7D3DxxqLEDjXWFR0EdSsM3sM9lLa
         CJM3k//8K32POwYRQ68rUUcLpqzdwsDWyuH6v/oUELdiefcqRsyvX/hYGdtG+LR7oGxj
         HAhRP3ZP0ajQEGy1RLJBc5aqmxC3ZHhJu4x/iLCBO334YmfWDrgfuvmUXoH/ZWxwguww
         lk86PC9OXVnsXPpDS4pC+M9bWFQtk4kek2owETtSNUJmId1EYq9ztue0e1XOIkBAFNel
         MIMaPE6NBndW/u5biULYcX8PruzGBrJyzuUcspgJ93TKfyaskFDN9dAQ2UG3q7l8SKkP
         RzKA==
X-Gm-Message-State: ACrzQf1DXE1fxbBueZzWn6nPdIcLYsqen4KN1XPNPJpG/gXURctS+XYc
        9flxedujbUqvd8IvRP22IpnRMw==
X-Google-Smtp-Source: AMsMyM7qMz01Yb0croVRTaKiNn5F9m19pglMjM4IpyFj11C+D4Ca1UintzYK54ZUgemcWucCT8VbJA==
X-Received: by 2002:a05:600c:4f53:b0:3b4:9aad:7845 with SMTP id m19-20020a05600c4f5300b003b49aad7845mr3503544wmq.159.1665752407890;
        Fri, 14 Oct 2022 06:00:07 -0700 (PDT)
Received: from localhost ([2a01:cb19:8ae2:e700:f916:30c4:a44d:8229])
        by smtp.gmail.com with ESMTPSA id bv16-20020a0560001f1000b0022e6f0d0d7csm2235595wrb.18.2022.10.14.06.00.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Oct 2022 06:00:07 -0700 (PDT)
From:   Mattijs Korpershoek <mkorpershoek@baylibre.com>
To:     Vicki Pfau <vi@endrift.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Michael Cullen <michael@michaelcullen.name>,
        Marcos Alano <marcoshalano@gmail.com>,
        linux-input@vger.kernel.org
Cc:     Vicki Pfau <vi@endrift.com>
Subject: Re: [PATCH] Input: xpad - fix PowerA EnWired Controller guide button
In-Reply-To: <20221006221209.2016372-1-vi@endrift.com>
References: <20221006221209.2016372-1-vi@endrift.com>
Date:   Fri, 14 Oct 2022 15:00:05 +0200
Message-ID: <87v8omzhka.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Vicki,

Thank you for your patch.

On Thu, Oct 06, 2022 at 15:12, Vicki Pfau <vi@endrift.com> wrote:

> Some Xbox One controllers require more complete versions of the controller
> start-up sequence used in official software in order to function properly.
> This patch adds a usb_set_interface call that matches official startup and
> nominally disabled the audio interface, which isn't supported in the xpad
> driver in the first place.
>
> Signed-off-by: Vicki Pfau <vi@endrift.com>
> ---
>  drivers/input/joystick/xpad.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
> index 18190b529bca..6449665d7b61 100644
> --- a/drivers/input/joystick/xpad.c
> +++ b/drivers/input/joystick/xpad.c
> @@ -1509,6 +1509,13 @@ static int xpad_start_input(struct usb_xpad *xpad)
>  		return -EIO;
>  
>  	if (xpad->xtype == XTYPE_XBOXONE) {
> +		/* Explicitly disable the audio interface. This is needed for some
> +		 * controllers, such as the PowerA Enhanced Wired Controller
> +		 * for Series X|S (0x20d6:0x200e) to report the guide button */
> +		error = usb_set_interface(xpad->udev, 1, 0);

Can't we call this in probe() ?
It seems suspicious to be called here as the usb_set_interace() doc
states:

"Also, drivers must not change altsettings while urbs are scheduled for
endpoints in that interface;"

However, we just called usb_submit_urb() before. I'm not 100% sure but I
think we are contradicting the documentation here.


> +		if (error)

Shouldn't we call usb_kill_urb() here before returing the error?
It seems that's what is done in the other error path below.

> +			return error;
> +
>  		error = xpad_start_xbox_one(xpad);
>  		if (error) {
>  			usb_kill_urb(xpad->irq_in);
> -- 
> 2.38.0
