Return-Path: <linux-input+bounces-1141-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B77D825B28
	for <lists+linux-input@lfdr.de>; Fri,  5 Jan 2024 20:38:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0ABC21C2380C
	for <lists+linux-input@lfdr.de>; Fri,  5 Jan 2024 19:38:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BEFD35F16;
	Fri,  5 Jan 2024 19:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gsWhBZck"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A48D035F13
	for <linux-input@vger.kernel.org>; Fri,  5 Jan 2024 19:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704483525;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g8xb0dX8wmYFSQez9BPOUsmJAJQrCsKrYS+t03Jg7oM=;
	b=gsWhBZckXXT8F2J01JyXav8pSX86ZW4SSYOa+/mkxdrHFUYc9hUydDMz5lrD7EjgQlxXnY
	xte3Kx9RDOGpH6ojDzg/46qDBWSRPgiNs5dCX258dPH0bLmncQzTpy10nCxREjEWw9pIqT
	4nLOGyFqJ31cCYiTcgGAw1OHcnxEQyI=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-546-tyRB9UBCOWSsFDzdsoaQow-1; Fri, 05 Jan 2024 14:38:44 -0500
X-MC-Unique: tyRB9UBCOWSsFDzdsoaQow-1
Received: by mail-lj1-f197.google.com with SMTP id 38308e7fff4ca-2ccc360edc4so16222101fa.0
        for <linux-input@vger.kernel.org>; Fri, 05 Jan 2024 11:38:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704483522; x=1705088322;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g8xb0dX8wmYFSQez9BPOUsmJAJQrCsKrYS+t03Jg7oM=;
        b=SW5gglUsxDqBDR+8HkFWcwzZGfKnXbpwe6soO8AHHdPeIoxNl0LYaDWhHUodd8olFX
         W8U2X66RU/XNYYlGls1V7QbTWomYEjDCHIKBpE/ggp7ZBqMAbL63aaTxBq03aMA7Mh4T
         48pZMVP9cwjPqelRpWdntVbJ9nVcE8SXUd5ah5RE5AeOe034ISItkkqVB1DEiD06i93b
         YpQfsYfJ3gP1P8GO9Pzp/fRO0in3I5T/suBm6rmji/wLGKKLb6zK1MPS74pnYE/lygCb
         J7K1RG+5aKxosJyWVS6oBuHqM13+9EesYhf376cnWfe3ix2v4jOvGy1JfALd66eFZYlr
         WqjA==
X-Gm-Message-State: AOJu0YyeTuPrr4IxntfHlW+Ex0hwaT/qFk0RgsByuKrm2NIqN6Br0zmE
	IAWrnFjU81UKfgKTmfYtMWZMyudwHOzZEMYd13QF05VQtXSivUbquIrcw33HYM9bSRREaumvWLA
	gTANCpS1qVLKf89cgcj9dltdZLh6g3KU=
X-Received: by 2002:a05:6512:118d:b0:50e:7915:ace5 with SMTP id g13-20020a056512118d00b0050e7915ace5mr1587550lfr.134.1704483522653;
        Fri, 05 Jan 2024 11:38:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGUfmMYvnacfzeY8g7i/3fjcnLJejVHaa9koxzIqFra33gGiYe7538UfJpBYNUwiHjn0M9a1g==
X-Received: by 2002:a05:6512:118d:b0:50e:7915:ace5 with SMTP id g13-20020a056512118d00b0050e7915ace5mr1587541lfr.134.1704483522295;
        Fri, 05 Jan 2024 11:38:42 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id oq8-20020a170906cc8800b00a293280c16csm1083021ejb.223.2024.01.05.11.38.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Jan 2024 11:38:41 -0800 (PST)
Message-ID: <fdc70b33-bfc7-4674-8aa0-44faccc33dc6@redhat.com>
Date: Fri, 5 Jan 2024 20:38:41 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] i8042: Add forcenorestore quirk to leave
 controller untouched even on s3
To: Werner Sembach <wse@tuxedocomputers.com>, dmitry.torokhov@gmail.com
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240104183118.779778-1-wse@tuxedocomputers.com>
 <20240104183118.779778-2-wse@tuxedocomputers.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240104183118.779778-2-wse@tuxedocomputers.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 1/4/24 19:31, Werner Sembach wrote:
> On s3 resume the i8042 driver tries to restore the controller to a known
> state by reinitializing things, however this can confuse the controller
> with different effects. Mostly occasionally unresponsive keyboards after
> resume.
> 
> These issues do not rise on s0ix resume as here the controller is assumed
> to preserved its state from before suspend.
> 
> This patch adds a quirk for devices where the reinitialization on s3 resume
> is not needed and might be harmful as described above. It does this by
> using the s0ix resume code path at selected locations.
> 
> This new quirk goes beyond what the preexisting reset=never quirk does,
> which only skips some reinitialization steps.
> 
> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
> Cc: stable@vger.kernel.org

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans



> ---
>  drivers/input/serio/i8042-acpipnpio.h | 10 +++++++---
>  drivers/input/serio/i8042.c           | 10 +++++++---
>  2 files changed, 14 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/input/serio/i8042-acpipnpio.h b/drivers/input/serio/i8042-acpipnpio.h
> index b585b1dab870e..10ec4534e5e14 100644
> --- a/drivers/input/serio/i8042-acpipnpio.h
> +++ b/drivers/input/serio/i8042-acpipnpio.h
> @@ -83,6 +83,7 @@ static inline void i8042_write_command(int val)
>  #define SERIO_QUIRK_KBDRESET		BIT(12)
>  #define SERIO_QUIRK_DRITEK		BIT(13)
>  #define SERIO_QUIRK_NOPNP		BIT(14)
> +#define SERIO_QUIRK_FORCENORESTORE	BIT(15)
>  
>  /* Quirk table for different mainboards. Options similar or identical to i8042
>   * module parameters.
> @@ -1657,6 +1658,8 @@ static void __init i8042_check_quirks(void)
>  	if (quirks & SERIO_QUIRK_NOPNP)
>  		i8042_nopnp = true;
>  #endif
> +	if (quirks & SERIO_QUIRK_FORCENORESTORE)
> +		i8042_forcenorestore = true;
>  }
>  #else
>  static inline void i8042_check_quirks(void) {}
> @@ -1690,7 +1693,7 @@ static int __init i8042_platform_init(void)
>  
>  	i8042_check_quirks();
>  
> -	pr_debug("Active quirks (empty means none):%s%s%s%s%s%s%s%s%s%s%s%s%s\n",
> +	pr_debug("Active quirks (empty means none):%s%s%s%s%s%s%s%s%s%s%s%s%s%s\n",
>  		i8042_nokbd ? " nokbd" : "",
>  		i8042_noaux ? " noaux" : "",
>  		i8042_nomux ? " nomux" : "",
> @@ -1710,10 +1713,11 @@ static int __init i8042_platform_init(void)
>  		"",
>  #endif
>  #ifdef CONFIG_PNP
> -		i8042_nopnp ? " nopnp" : "");
> +		i8042_nopnp ? " nopnp" : "",
>  #else
> -		"");
> +		"",
>  #endif
> +		i8042_forcenorestore ? " forcenorestore" : "");
>  
>  	retval = i8042_pnp_init();
>  	if (retval)
> diff --git a/drivers/input/serio/i8042.c b/drivers/input/serio/i8042.c
> index 9fbb8d31575ae..2233d93f90e81 100644
> --- a/drivers/input/serio/i8042.c
> +++ b/drivers/input/serio/i8042.c
> @@ -115,6 +115,10 @@ module_param_named(nopnp, i8042_nopnp, bool, 0);
>  MODULE_PARM_DESC(nopnp, "Do not use PNP to detect controller settings");
>  #endif
>  
> +static bool i8042_forcenorestore;
> +module_param_named(forcenorestore, i8042_forcenorestore, bool, 0);
> +MODULE_PARM_DESC(forcenorestore, "Force no restore on s3 resume, copying s2idle behaviour");
> +
>  #define DEBUG
>  #ifdef DEBUG
>  static bool i8042_debug;
> @@ -1232,7 +1236,7 @@ static int i8042_pm_suspend(struct device *dev)
>  {
>  	int i;
>  
> -	if (pm_suspend_via_firmware())
> +	if (!i8042_forcenorestore && pm_suspend_via_firmware())
>  		i8042_controller_reset(true);
>  
>  	/* Set up serio interrupts for system wakeup. */
> @@ -1248,7 +1252,7 @@ static int i8042_pm_suspend(struct device *dev)
>  
>  static int i8042_pm_resume_noirq(struct device *dev)
>  {
> -	if (!pm_resume_via_firmware())
> +	if (i8042_forcenorestore || !pm_resume_via_firmware())
>  		i8042_interrupt(0, NULL);
>  
>  	return 0;
> @@ -1271,7 +1275,7 @@ static int i8042_pm_resume(struct device *dev)
>  	 * not restore the controller state to whatever it had been at boot
>  	 * time, so we do not need to do anything.
>  	 */
> -	if (!pm_suspend_via_firmware())
> +	if (i8042_forcenorestore || !pm_suspend_via_firmware())
>  		return 0;
>  
>  	/*


