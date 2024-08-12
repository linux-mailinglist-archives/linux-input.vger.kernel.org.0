Return-Path: <linux-input+bounces-5518-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7810A94EFBF
	for <lists+linux-input@lfdr.de>; Mon, 12 Aug 2024 16:38:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 013A2B2206A
	for <lists+linux-input@lfdr.de>; Mon, 12 Aug 2024 14:38:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DBB8180A80;
	Mon, 12 Aug 2024 14:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZK09HQGH"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D586117E44F;
	Mon, 12 Aug 2024 14:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723473479; cv=none; b=HGnt4j6Y5KtDv8JHfLR0uEuPYfd4X1/itoW2+oR/YOTrLtdjeavc5rOiUc6c1YSrwxbZp3QH4w4qobXDwdpnKxAEHAKvH8zwTuFkiBPNqh2yIP+C8UPoYUQ515tGZgtuQsCY/y5iIP5wUp1RZoUdl7YgRas/PE8/+A9DHMg3bGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723473479; c=relaxed/simple;
	bh=vYpmm6IWxvTWAp4hWXbZ/e1bWFCm6Gcb9VoeSsEQaVg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EazT5QfOq9Z0IXfQYubwZIDsAjQto4XVTYZmPlaJX4ZLsLAT1tYiELjPKjtww2oVony7e5eVU+WRkySu/Y8EEIOIC3ghWG7R7cBZoZd0GKb7D5exeTmn4eav1thVWc1Juh8VuIT1fwxSr7NT/5ZG9ViHeB6FfnozXTp+MXBAYs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZK09HQGH; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4280ca0791bso32872795e9.1;
        Mon, 12 Aug 2024 07:37:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723473476; x=1724078276; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BW9gtUGuTkGyTfXs/SLkCzXlPT74jyhYIpSzLHEFQhY=;
        b=ZK09HQGHpdf4vd3Wf1UMt4M+fGLbRvI6N3DpbTdzXboHsTkBUVspw3P1P3mi272cZM
         tLfUHqCYw1OsaZ5WrQfpVrmEE0Ta2qdyZqAR6uKrDOhYqBqmU+SajcRjyYdoqhsQ1Uj4
         HVweOBdpJ1dQsJFKstJOMxMx48j4/5aOfDD+aznvZFFVHYrTWN1QV2u5LtYhwnyt7rBj
         qSqg9H/q03HAdI6EMn1w8ox2QsS4iRBJttLjf6Ya+Wgh03pTl/aDAP1Z6Ni9zMmNF4NK
         TdbL4mjT0+LBPwFLNZ40uUZjjpEKiGbUADyj5mPIB6NeW+ZTPlyHjqwK9Kqjm3z3+ooF
         jG7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723473476; x=1724078276;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BW9gtUGuTkGyTfXs/SLkCzXlPT74jyhYIpSzLHEFQhY=;
        b=eAbLKRc6RPI3d45/zB1wvZY3Pko7qYOr6EDeJonAx5dwGzyvyN6V4iRcQLdzfOFawC
         bIZ/XnSiDtuzZbHYuxwNavifNfBVgrc9OQQ2dmRvArvefALUALLSdwmSWs/6OzwVgiai
         Kteq/gYVVBFmPP3tshqHnSOrJIp+sHfdE6QUjQrhJSO8lU2RvMkB2NbsWT6X+VeiSc8D
         atI4A8EW8bVKvKnlcdh5uEc2UHMjpY9gaB0gF4ypqYht7z6FCLMxYaOCvLuA4vPOuuzc
         h1pDLVPJgdAruaPNPAG8Pk31oYtPrxlhbJgF59HNrxHpbHQVrUWJyeqkwpu36l9vPfp3
         bdRg==
X-Forwarded-Encrypted: i=1; AJvYcCWJFsH2rxkOp2LgXBMieJCHLZQ5jXof1G7CP4xjl5j0lxYvxQCz0Ty61eocnv9N0sZZA+tP4YLKc92XwoFTVMplH630D2NZ242Fv6kUPf2QtGxhnIpdAMR01L3AJOqZBhisuO6oXfJ+rOifJUCKyrwfawLXIrQwnESOz1mUh/Jx6OeDOs7/bwgT
X-Gm-Message-State: AOJu0YxfSNF3PgQFOCtFY3NFsIZvt9nlpmGsxpzSf3BHBA2RWVIoeylF
	L0Gbpq+js0tdD5LLIXhGLc8k8cEFV4khlK4HqO8DAexNYEL3i8U+
X-Google-Smtp-Source: AGHT+IF1X0MFC6vec6Yd5Z1mZzxtjCnVZihagDGlip6NRPmK99S8zh1AUd1KtzdLy/AdO4ckdhZgPg==
X-Received: by 2002:a05:600c:468a:b0:427:ab29:30cf with SMTP id 5b1f17b1804b1-429d47f4acdmr5367505e9.4.1723473475811;
        Mon, 12 Aug 2024 07:37:55 -0700 (PDT)
Received: from localhost ([185.220.101.106])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36e4cfefe71sm7757884f8f.62.2024.08.12.07.37.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Aug 2024 07:37:55 -0700 (PDT)
Date: Mon, 12 Aug 2024 17:37:54 +0300
From: Maxim Mikityanskiy <maxtram95@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Ike Panhc <ike.pan@canonical.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org,
	Jonathan Denose <jdenose@chromium.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, stable@vger.kernel.org
Subject: Re: [PATCH] platform/x86: ideapad-laptop: Stop calling
 i8042_command()
Message-ID: <ZroaE5Q6OdGe6ewz@mail.gmail.com>
References: <20240805141608.170844-1-hdegoede@redhat.com>
 <ZrDwF919M0YZTqde@mail.gmail.com>
 <5c5120a7-4739-4d92-a5b8-9b9c60edc3b7@redhat.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5c5120a7-4739-4d92-a5b8-9b9c60edc3b7@redhat.com>

On Mon, 05 Aug 2024 at 17:45:19 +0200, Hans de Goede wrote:
> On 8/5/24 5:30 PM, Maxim Mikityanskiy wrote:
> > That means, userspace is not filtering out events upon receiving
> > KEY_TOUCHPAD_OFF. If we wanted to rely on that, we would need to send
> > KEY_TOUCHPAD_TOGGLE from the driver, but we actually can't, because Z570
> > is weird. It maintains the touchpad state in firmware to light up the
> > status LED, but the firmware doesn't do the actual touchpad disablement.
> > 
> > That is, if we use TOGGLE, the LED will get out of sync. If we use
> > ON/OFF, the touchpad won't be disabled, unless we do it in the kernel.
> 
> Ack.
> 
> So how about this instead:
> 
> diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
> index 1ace711f7442..b7fa06f793cb 100644
> --- a/drivers/platform/x86/ideapad-laptop.c
> +++ b/drivers/platform/x86/ideapad-laptop.c
> @@ -1574,7 +1574,7 @@ static void ideapad_sync_touchpad_state(struct ideapad_private *priv, bool send_
>  	 * touchpad off and on. We send KEY_TOUCHPAD_OFF and
>  	 * KEY_TOUCHPAD_ON to not to get out of sync with LED
>  	 */
> -	if (priv->features.ctrl_ps2_aux_port)
> +	if (send_events && priv->features.ctrl_ps2_aux_port)
>  		i8042_command(&param, value ? I8042_CMD_AUX_ENABLE : I8042_CMD_AUX_DISABLE);
>  
>  	/*
> 
> Maxmime, if you still have your Z570 can you check if the touchpad state after a suspend/resume
> correctly reflects the state before suspend/resume in both touchpad on / off states ?

*Maxim

Just a heads-up, my Z570 now belongs to a family member, we'll test what
you asked, but right now there is a btrfs corruption on that laptop that
we need to fix first, it interferes with kernel compilation =/

Sorry for the delay.

