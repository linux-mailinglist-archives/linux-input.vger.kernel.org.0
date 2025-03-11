Return-Path: <linux-input+bounces-10705-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A1CD7A5B83E
	for <lists+linux-input@lfdr.de>; Tue, 11 Mar 2025 06:09:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 559F818905E8
	for <lists+linux-input@lfdr.de>; Tue, 11 Mar 2025 05:09:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF37E1E5B83;
	Tue, 11 Mar 2025 05:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tx5OK/tr"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CAE41CA9C;
	Tue, 11 Mar 2025 05:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741669768; cv=none; b=omtXX30BEWuRfhd+ugZ1DVulJsJB6cILKJ73lOl61VkTmL87mt77zz6tt6+K0zfr8wGeMrypjz8sTfgZr0ieVyWstSkZOvSy0TPeAY79rdz6kyp7Hl8QoFCHbJWLKYKP/m4HYigddBLPj9UFZF7CBL9eRt4cb5jIh4W6aDhRhWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741669768; c=relaxed/simple;
	bh=szPTbQX8ub+gJITeHt7+qztGeP736USbvzR9YZkzPWY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RGR3i7c7TC7lMFdU+d8XXWXUAL1oi2xELVSxMcsc+sS0qzS5US07hhTW+UWH4ZZOO9vxTYP8gMx61ggJ9ARjXFj1RvyqJhUgcjmcgOb3C8tOmtHrbgOblQu6gb3qCuzaoDvWHWOs/CyDjvHXfFqEdN7Bk5j9MhYN6HMne26fZYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tx5OK/tr; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-223959039f4so99785945ad.3;
        Mon, 10 Mar 2025 22:09:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741669767; x=1742274567; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=n4KhD9AXiV/vH2JoWEUcvtMF0yMzInAf7cgiESBdhb4=;
        b=Tx5OK/trsMVdYbMR3j26S7rz3f5bTCNT+dtQ5iutqi1nxtt/FSWCuRiLQr906nlSih
         5DF22HUbWO30JNlkfQIkrt81zHo68/A/3MJiqY7ZJOMxQl3dRqweoFXDJ+pqsjBpT2Ga
         ghkZkWVKdUacbODMNb9uBa/l5kI6iUXNjYOs2LeaD2KmlNKq7ZvKkiTykCEhte7jO9Fe
         kUjKOtIFwZj2dtfXNb4np54FtFHqYo0eeqHX/ORwFEl4FjMl4SPfqdwSEh8iiQR1EipS
         K4sSs57TuRYGQTSdhsgit6gP937+2khem5Uzwo3pXlzUhGbYCGJQLFWNLnLabJwn2Td6
         Su1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741669767; x=1742274567;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n4KhD9AXiV/vH2JoWEUcvtMF0yMzInAf7cgiESBdhb4=;
        b=qrneEGqFE63WjEuEhKdupGWBuJXXvs4/oPuZsP9y/UwLdFCW9zER8TWrMYoCstLt0H
         5qEsG3bMPGqRvXFY/zPy8cZzlsHVVgajRfSnv90PZMhn5t2gyLhloBEhv5K/NyLaC7YD
         7Nb1kb+jJbt1HTnqMbqutJJZHf9Tsq9XgsiCnmAG6uLIuK99NkeM+8dtM5j69SmaWBLl
         gQv5Ded77AMGj10O5DgR0BfNJ5zjBWIWFzeV+THhcAZvhJyAW4nLWJUs31VkNp9hIWV5
         6e0bBNCrk1v/bGvy1iXGocdUp8QiDai8IgIzQIrC45f84U1bAsrNoVqJ5Em9d8qDWVTD
         PC9g==
X-Forwarded-Encrypted: i=1; AJvYcCWPduDrEtUaj9uGudCI4PXmerkmNv4eKRqxuRREnJDqVmDoNwZPnkess/r7KxeZfnTo2BzfN2IcLDIAyOE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6opmLBs+d69od8IIIYmx0JELE68QWeFM+FjNxneHIkH5jY8GI
	p0m4bI029GsnXlqSbc0CcNKv27uS6yIUZ1WHKTPUi26eHSxFR2pX
X-Gm-Gg: ASbGncs3CPFO9EiyHgxeC2tobEI/O7d3mjK6PDcr55ScbVqILIi4J1+RvppbBFy3Fpz
	Ll9odO2MmUAcsQrq4oLIcJ3voyrK61wiTHct6l1czu5dSZa9TUbFq+He6h6nUAm8JXI0udCuXra
	PxCK7J+h7mYl2VS0FQjJOm7o0537FF7FZE3pRkdWaEKwgn80KNCYCk+TbbaG0XEmytZXgNGs1+a
	VsggXjp75nUkg3VKJHT9kv+18x+cFZrKoDj+f0JRhgwLVFhMCGX1GofHqe9pKGCmmkmrkIzCiMM
	ub3CM11dfdZ3sBazbJUsZvYCWNkO3mbhrV21trEi80OJ
X-Google-Smtp-Source: AGHT+IGCSJeg6lOkx+ryXRSoD/HFXBAGt4n82r1GjKJMtUbJQG1WxjEPT+XrgKO2OFeDFfl2ljy3fg==
X-Received: by 2002:a17:903:22cc:b0:224:1943:c5c with SMTP id d9443c01a7336-2242888d0d9mr231616155ad.15.1741669766401;
        Mon, 10 Mar 2025 22:09:26 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:eb9f:29c2:9ede:46d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22410a9d147sm88150065ad.208.2025.03.10.22.09.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 22:09:26 -0700 (PDT)
Date: Mon, 10 Mar 2025 22:09:23 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	"Rafael J. Wysocki" <rafael@kernel.org>
Subject: Re: [PATCH] Input: hisi_powerkey: Enable system-wakeup for s2idle
Message-ID: <Z8_Fgx4YWwdpB1XK@google.com>
References: <20250306115021.797426-1-ulf.hansson@linaro.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250306115021.797426-1-ulf.hansson@linaro.org>

Hi Ulf,

On Thu, Mar 06, 2025 at 12:50:21PM +0100, Ulf Hansson wrote:
> To wake up the system from s2idle when pressing the power-button, let's
> convert from using pm_wakeup_event() to pm_wakeup_dev_event(), as it allows
> us to specify the "hard" in-parameter, which needs to be set for s2idle.

I was looking at pm_wakeup_event() and pm_wakeup_dev_event() and I am
afraid I do not understand the distinction. Why would we want to
abort suspend by only by some wakeup sources and not by others? And why
does a driver need to know whether a system uses s2idle or some other
implementation of low power state?

FWIW we have Chromebooks that use S0ix and Chromebooks that use S3 as
well as ARM Chromebooks and I do not think they use
pm_wakeup_dev_event() variant.

I'm cc-ing Rafael to give us some guidance.

> 
> Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
> ---
>  drivers/input/misc/hisi_powerkey.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/input/misc/hisi_powerkey.c b/drivers/input/misc/hisi_powerkey.c
> index d3c293a95d32..d315017324d9 100644
> --- a/drivers/input/misc/hisi_powerkey.c
> +++ b/drivers/input/misc/hisi_powerkey.c
> @@ -30,7 +30,7 @@ static irqreturn_t hi65xx_power_press_isr(int irq, void *q)
>  {
>  	struct input_dev *input = q;
>  
> -	pm_wakeup_event(input->dev.parent, MAX_HELD_TIME);
> +	pm_wakeup_dev_event(input->dev.parent, MAX_HELD_TIME, true);
>  	input_report_key(input, KEY_POWER, 1);
>  	input_sync(input);
>  
> -- 
> 2.43.0
> 

Thanks.

-- 
Dmitry

