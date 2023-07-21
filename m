Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6D4A375D7ED
	for <lists+linux-input@lfdr.de>; Sat, 22 Jul 2023 01:44:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229744AbjGUXoY (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 21 Jul 2023 19:44:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229503AbjGUXoX (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 21 Jul 2023 19:44:23 -0400
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BED030DD
        for <linux-input@vger.kernel.org>; Fri, 21 Jul 2023 16:44:22 -0700 (PDT)
Received: by mail-ot1-x32d.google.com with SMTP id 46e09a7af769-6bb14c05d77so827608a34.2
        for <linux-input@vger.kernel.org>; Fri, 21 Jul 2023 16:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689983061; x=1690587861;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZE/BZJmaaGU2utCK0mtrdkn4HBEq81pT8hQcdwF/PLE=;
        b=Yj3vq9KGFtzQQqyItHiMElCcv7jxUt2YSoS5lE0YhchQ2W31cD8blXSgGoEHgdATrr
         hcqwhQkF517Zfb1qu1iU7vlerXCwqaFPHg6eonh8T+sCnf+69yg+Ugy9t3348+ZyMXs7
         +BxT3lz8s+87z/hMt/NMFgFNS2TBN/uepLlxF/oS33LCjl75GFnQlomOqC86xO1SwjeW
         SRtaFdOT8/+fFN+/aOvRYu0sGJQQccDx74LmMoHEROSz3RS3X+iZP4Ouwpbx/lmEKAWk
         8s0FgzhDX3zrxxNu+DspncZA09cAANSYnBU6xodfZcgHSRRjhq/Zp+MAOdzow794yHVx
         GZow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689983061; x=1690587861;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZE/BZJmaaGU2utCK0mtrdkn4HBEq81pT8hQcdwF/PLE=;
        b=N2oEeyKGQ4ol7W4HPY2ooSTTO65NsKC6ZExrsVJV1WR7A04ORQRKGItz8MIN1Sorvp
         1K8t4aEiRWtJyo8cdU+3n99SkmJHAtNbpKfUeOtvy+7fDQwa9aC2iKWyle+s8KB25POb
         7qxIOKcA2G623NIHMXwwJZQdg+OIDHV2WIRWAkXbtBhfh86wp0uNQAvRPtxPta5682lE
         MhsIA8MpqOpQvH2OuIk3OUjjMQehTloHuHxXlE7F6l/dOBpa6boE4FNjy4cNAlTNfNsf
         675jUvTyTbxr4Z9Oltns7MGmEt76U6C2QTV1g4KKJONn8ljrAbUdxtS0pdQgKy6Pv5j3
         1U/A==
X-Gm-Message-State: ABy/qLaGEslZ9L47Cqx2cPuJhpz83s4fvP1/iHSi+pqH4czNE8XCTGik
        smBoiBA+gb63YQuI3YSJnQE=
X-Google-Smtp-Source: APBJJlEc0Hk/fozgpO1Nms05+8llt4MD+q+7FmgTRhhMq90tFbG4TL3JCQLTs62pd1srG5GluwJwSw==
X-Received: by 2002:a05:6870:40c6:b0:1ba:7f7c:b928 with SMTP id l6-20020a05687040c600b001ba7f7cb928mr3938925oal.55.1689983061052;
        Fri, 21 Jul 2023 16:44:21 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:fd88:dbb:fc42:8207])
        by smtp.gmail.com with ESMTPSA id c70-20020a633549000000b00551df489590sm3616617pga.12.2023.07.21.16.44.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jul 2023 16:44:20 -0700 (PDT)
Date:   Fri, 21 Jul 2023 16:44:18 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Friedrich Vock <friedrich.vock@gmx.de>
Cc:     linux-input@vger.kernel.org,
        Mario Limonciello <mario.limonciello@amd.com>
Subject: Re: [PATCH] Input: i8042 - Add quirk for polling the KBD port
Message-ID: <ZLsYUlSMIK0Gtr21@google.com>
References: <20230530153644.17262-1-friedrich.vock@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230530153644.17262-1-friedrich.vock@gmx.de>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FSL_HELO_FAKE,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Friedrich,

On Tue, May 30, 2023 at 05:36:44PM +0200, Friedrich Vock wrote:
> It seems like there are some devices in the ASUS TUF A16 laptops that
> just don't send any keyboard interrupts until you read from the KBD port.

I am sorry, but continuously polling keyboard port will absolutely wreck
battery life on these devices, so this can not be a real solution.

I wonder if this is yet another example of incorrect IRQ 1 polarity
override on devices with AMD chipsets (CC-ing Mario).

> 
> Signed-off-by: Friedrich Vock <friedrich.vock@gmx.de>
> ---
>  drivers/input/serio/i8042-acpipnpio.h | 30 +++++++++++++++--
>  drivers/input/serio/i8042.c           | 47 ++++++++++++++++++++++-----
>  drivers/input/serio/i8042.h           |  2 +-
>  3 files changed, 67 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/input/serio/i8042-acpipnpio.h b/drivers/input/serio/i8042-acpipnpio.h
> index 028e45bd050b..be2e72aaa658 100644
> --- a/drivers/input/serio/i8042-acpipnpio.h
> +++ b/drivers/input/serio/i8042-acpipnpio.h
> @@ -83,6 +83,7 @@ static inline void i8042_write_command(int val)
>  #define SERIO_QUIRK_KBDRESET		BIT(12)
>  #define SERIO_QUIRK_DRITEK		BIT(13)
>  #define SERIO_QUIRK_NOPNP		BIT(14)
> +#define SERIO_QUIRK_POLL_KBD            BIT(15)
> 
>  /* Quirk table for different mainboards. Options similar or identical to i8042
>   * module parameters.
> @@ -99,6 +100,26 @@ static const struct dmi_system_id i8042_dmi_quirk_table[] __initconst = {
>  		},
>  		.driver_data = (void *)(SERIO_QUIRK_NOMUX)
>  	},
> +	/* Some laptops seem to not trigger any keyboard interrupts at all,
> +	 * even when there is data available. On these devices, manually
> +	 * polling the keyboard port is required.
> +	 */
> +	{
> +		/* ASUS TUF Gaming A16 with Ryzen 7 7735HS */
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "FA617NS"),
> +		},
> +		.driver_data = (void *)(SERIO_QUIRK_POLL_KBD)
> +	},
> +	{
> +		/* ASUS TUF Gaming A16 with Ryzen 9 7940HS */
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "FA617XS"),
> +		},
> +		.driver_data = (void *)(SERIO_QUIRK_POLL_KBD)
> +	},
>  	{
>  		.matches = {
>  			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
> @@ -1634,6 +1655,8 @@ static void __init i8042_check_quirks(void)
>  	if (quirks & SERIO_QUIRK_NOPNP)
>  		i8042_nopnp = true;
>  #endif
> +	if (quirks & SERIO_QUIRK_POLL_KBD)
> +		i8042_poll_kbd = true;
>  }
>  #else
>  static inline void i8042_check_quirks(void) {}
> @@ -1667,7 +1690,7 @@ static int __init i8042_platform_init(void)
> 
>  	i8042_check_quirks();
> 
> -	pr_debug("Active quirks (empty means none):%s%s%s%s%s%s%s%s%s%s%s%s%s\n",
> +	pr_debug("Active quirks (empty means none):%s%s%s%s%s%s%s%s%s%s%s%s%s%s\n",
>  		i8042_nokbd ? " nokbd" : "",
>  		i8042_noaux ? " noaux" : "",
>  		i8042_nomux ? " nomux" : "",
> @@ -1687,10 +1710,11 @@ static int __init i8042_platform_init(void)
>  		"",
>  #endif
>  #ifdef CONFIG_PNP
> -		i8042_nopnp ? " nopnp" : "");
> +		i8042_nopnp ? " nopnp" : "",
>  #else
> -		"");
> +		"",
>  #endif
> +		i8042_poll_kbd ? "poll_kbd" : "");
> 
>  	retval = i8042_pnp_init();
>  	if (retval)
> diff --git a/drivers/input/serio/i8042.c b/drivers/input/serio/i8042.c
> index 6dac7c1853a5..7212263d3a41 100644
> --- a/drivers/input/serio/i8042.c
> +++ b/drivers/input/serio/i8042.c
> @@ -115,6 +115,10 @@ module_param_named(nopnp, i8042_nopnp, bool, 0);
>  MODULE_PARM_DESC(nopnp, "Do not use PNP to detect controller settings");
>  #endif
> 
> +static bool i8042_poll_kbd;
> +module_param_named(poll_kbd, i8042_poll_kbd, bool, 0);
> +MODULE_PARM_DESC(poll_kbd, "Continuously poll the KBD port instead of relying on interrupts");
> +
>  #define DEBUG
>  #ifdef DEBUG
>  static bool i8042_debug;
> @@ -178,6 +182,24 @@ static irqreturn_t i8042_interrupt(int irq, void *dev_id);
>  static bool (*i8042_platform_filter)(unsigned char data, unsigned char str,
>  				     struct serio *serio);
> 
> +#define POLL_TIME 1
> +static void i8042_poll_func(struct timer_list *timer)
> +{
> +	unsigned char status;
> +	unsigned long flags;
> +
> +	do {
> +		spin_lock_irqsave(&i8042_lock, flags);
> +		status = i8042_read_status();
> +		spin_unlock_irqrestore(&i8042_lock, flags);
> +		if (status & I8042_STR_OBF)
> +			i8042_interrupt(0, NULL);
> +	} while (status & I8042_STR_OBF);
> +	mod_timer(timer, jiffies + msecs_to_jiffies(POLL_TIME));
> +}
> +
> +DEFINE_TIMER(poll_timer, i8042_poll_func);
> +
>  void i8042_lock_chip(void)
>  {
>  	mutex_lock(&i8042_mutex);
> @@ -1437,13 +1459,15 @@ static void i8042_unregister_ports(void)
>  	}
>  }
> 
> +
>  static void i8042_free_irqs(void)
>  {
>  	if (i8042_aux_irq_registered)
>  		free_irq(I8042_AUX_IRQ, i8042_platform_device);
> -	if (i8042_kbd_irq_registered)
> +	if (i8042_poll_kbd)
> +		del_timer(&poll_timer);
> +	else if (i8042_kbd_irq_registered)
>  		free_irq(I8042_KBD_IRQ, i8042_platform_device);
> -
>  	i8042_aux_irq_registered = i8042_kbd_irq_registered = false;
>  }
> 
> @@ -1497,10 +1521,14 @@ static int i8042_setup_kbd(void)
>  	if (error)
>  		return error;
> 
> -	error = request_irq(I8042_KBD_IRQ, i8042_interrupt, IRQF_SHARED,
> -			    "i8042", i8042_platform_device);
> -	if (error)
> -		goto err_free_port;
> +	if (i8042_poll_kbd)
> +		mod_timer(&poll_timer, msecs_to_jiffies(POLL_TIME));
> +	else {
> +		error = request_irq(I8042_KBD_IRQ, i8042_interrupt, IRQF_SHARED,
> +				    "i8042", i8042_platform_device);
> +		if (error)
> +			goto err_free_port;
> +	}
> 
>  	error = i8042_enable_kbd_port();
>  	if (error)
> @@ -1510,8 +1538,11 @@ static int i8042_setup_kbd(void)
>  	return 0;
> 
>   err_free_irq:
> -	free_irq(I8042_KBD_IRQ, i8042_platform_device);
> - err_free_port:
> +	if (i8042_poll_kbd)
> +		del_timer(&poll_timer);
> +	else
> +		free_irq(I8042_KBD_IRQ, i8042_platform_device);
> +err_free_port:
>  	i8042_free_kbd_port();
>  	return error;
>  }
> --
> 2.40.1
> 

Thanks.

-- 
Dmitry
