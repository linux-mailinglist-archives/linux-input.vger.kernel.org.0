Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F3C5716012A
	for <lists+linux-input@lfdr.de>; Sun, 16 Feb 2020 00:42:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726340AbgBOXmP (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 15 Feb 2020 18:42:15 -0500
Received: from mail-pf1-f196.google.com ([209.85.210.196]:41435 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726275AbgBOXmP (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 15 Feb 2020 18:42:15 -0500
Received: by mail-pf1-f196.google.com with SMTP id j9so6900330pfa.8;
        Sat, 15 Feb 2020 15:42:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=zBsjCn468WTGT/oy+fBMtes2F6D7F/Y2VPHhTxZnAPA=;
        b=U4w8UrINOvtJAf5QVoCPoOopv31OO3KCArq3KkSilhpHfO6C98gFbXUlWsqCicw8UE
         nhs45wOxdZc9vmCyKWVq11yg9jgPLY3DsJAGchcmTOS6Waz208veookXm4InM9h81Zhu
         cy3v44uGNCzq+3xqGFmVfR3dhnktovnQXCiG1AiUkyV3XO8oR3AVfiecKandsdjt2/vG
         ktjZhkW3qP05sL2OvBwTso1tLLIWHm3F8+SReGaA69AePS4t0j4qGbywuEcdx8WuPS1x
         0r5Chcy7nNqqh8RoiGcrrDSgmFfht++lq2NG627cmB7KqaG97CAyBNNuIgEs8/IUyJsB
         w9CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=zBsjCn468WTGT/oy+fBMtes2F6D7F/Y2VPHhTxZnAPA=;
        b=es+t3awWn/pj260emQshYDvqHRk5estvUxJbCSqXTmX88Llz90MzRAfA6sO/JlgcZy
         2e8/MPpJSoD9fyq1vW0MjrJ7bc/ZUDxEO59Tpp4iktaNRmiGEwZFXo6xlizr2FPbqsDg
         OYO4ohH7M91Gl0woStxnAITsI/oU5/5YVSfH++skuJ6rrJR2gduWOWh2CZ4JodqV3Py5
         qPQcIbeb+4p01a71AULJC2AAtY1CPOV+PWqTjVD+Dfd9PBBmZ+CjUos6Yl4Ym1cZ2QJ0
         J4mWVJ3eXvVRULLqVdCgLnQQ0VPO2c7Fehqa0obcnmB8hEnhUwW4TDLVtuATOt/9Imgq
         gbhw==
X-Gm-Message-State: APjAAAUxcTuss/gs8YrvD48GPdHW1n83AvFiBODeI1jilTm3zijR7nN4
        GQecSkBfF2nUIa6nEzFJa+s=
X-Google-Smtp-Source: APXvYqyiCCglLn70UE+afnXnqNGyyYjJ95AFwEPC9P1Z3qIPCg2Ilc1MqAQqnjaHwo5LcDcXSto6Cw==
X-Received: by 2002:a63:2a13:: with SMTP id q19mr10152806pgq.82.1581810135002;
        Sat, 15 Feb 2020 15:42:15 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id 144sm11955123pfc.45.2020.02.15.15.42.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Feb 2020 15:42:14 -0800 (PST)
Date:   Sat, 15 Feb 2020 15:42:12 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Nick Reitemeyer <nick.reitemeyer@web.de>
Cc:     robh+dt@kernel.org, stephan@gerhold.net,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 3/3] Input: tm2-touchkey - add support for Coreriver
 TC360 variant
Message-ID: <20200215234212.GK183709@dtor-ws>
References: <20200121141525.3404-1-nick.reitemeyer@web.de>
 <20200121141525.3404-3-nick.reitemeyer@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200121141525.3404-3-nick.reitemeyer@web.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Jan 21, 2020 at 03:15:26PM +0100, Nick Reitemeyer wrote:
> The Coreriver TouchCore 360 is like the midas board touchkey, but it is using a fixed regulator.
> 
> Signed-off-by: Nick Reitemeyer <nick.reitemeyer@web.de>

Applied, thank you.

> ---
>  drivers/input/keyboard/tm2-touchkey.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/input/keyboard/tm2-touchkey.c b/drivers/input/keyboard/tm2-touchkey.c
> index 14b55bacdd0f..fb078e049413 100644
> --- a/drivers/input/keyboard/tm2-touchkey.c
> +++ b/drivers/input/keyboard/tm2-touchkey.c
> @@ -75,6 +75,14 @@ static struct touchkey_variant aries_touchkey_variant = {
>  	.cmd_led_off = ARIES_TOUCHKEY_CMD_LED_OFF,
>  };
> 
> +static const struct touchkey_variant tc360_touchkey_variant = {
> +	.keycode_reg = 0x00,
> +	.base_reg = 0x00,
> +	.fixed_regulator = true,
> +	.cmd_led_on = TM2_TOUCHKEY_CMD_LED_ON,
> +	.cmd_led_off = TM2_TOUCHKEY_CMD_LED_OFF,
> +};
> +
>  static int tm2_touchkey_led_brightness_set(struct led_classdev *led_dev,
>  					    enum led_brightness brightness)
>  {
> @@ -327,6 +335,9 @@ static const struct of_device_id tm2_touchkey_of_match[] = {
>  	}, {
>  		.compatible = "cypress,aries-touchkey",
>  		.data = &aries_touchkey_variant,
> +	}, {
> +		.compatible = "coreriver,tc360-touchkey",
> +		.data = &tc360_touchkey_variant,
>  	},
>  	{ },
>  };
> --
> 2.23.0
> 

-- 
Dmitry
