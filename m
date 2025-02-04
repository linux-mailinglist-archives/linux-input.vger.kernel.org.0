Return-Path: <linux-input+bounces-9755-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A3914A27482
	for <lists+linux-input@lfdr.de>; Tue,  4 Feb 2025 15:39:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 591671882692
	for <lists+linux-input@lfdr.de>; Tue,  4 Feb 2025 14:39:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16DFE2135D1;
	Tue,  4 Feb 2025 14:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HZHgFwDq"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F8B821323B;
	Tue,  4 Feb 2025 14:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738679975; cv=none; b=T4BEKwa6XKn5f5MYPMThZwDXekUmydgMBLfF636a9YJO7gEBVpTTPratZsZAUaxB3OuZGawXu8qqru+1omGpZIc6Ft7eUU706mivk0yHoSTEe4OQPX/eZRVdCdF685HidvraAjv9CKCJ5SMUPqFVN5tRdhEZ55HRrImIPSDBI9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738679975; c=relaxed/simple;
	bh=Ul7vuVjk0tJdv9W7QCQCkdt1AV8p/rA8see/wdF2iY4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uiaXvbJoleICeRuv9+Fftj2icBghmjXC7q4qsTgWl155e8bD42x6QT8fxCNAJlnheaiA25KSqNCy0VX627ysRpS9s4CRSEN4WDvLrIHJAemezboMWHxm0MN0h5M6faRZUwfDjxWperK9NadE+mWETp7LLMyImXJx8nmyAAOJqJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HZHgFwDq; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-21670dce0a7so117670495ad.1;
        Tue, 04 Feb 2025 06:39:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738679972; x=1739284772; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=tx+Bjgi8wA7mlSIk+aE6ZfY+yz7jaFoTfW2mAfd1fGI=;
        b=HZHgFwDqvC5LL3o7+ETfn5ebq5FR76IpfTEh6BY9aqR+tnVaFlacrcmcK4yY0HCwSr
         Zn/G2wEIMIp5oSbXfQ1nd/L3U0e4X6vdGZrWxRctv/tHQDSrPL0Q4Yvcf5we7Y1WPV9C
         pzeqmiqLmwyh6prV+jBlAj5GkxEHVt8RbibCeeMeyMWiMwYqWBR3Zhi+3S8+k9mM6Z14
         cGLsi0y51qQdkZ7QnoQHe6eaY4nYns1nXwwbYarVGrJKN1kvZ+260/NTm6mFpoyMLgjr
         /CUiqpYLawdeemNvudWXP8iU39LG2J3+0b9ea/TCyC15sqf6FCMjKuZ/GkX8qGWRx0nv
         ES4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738679972; x=1739284772;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tx+Bjgi8wA7mlSIk+aE6ZfY+yz7jaFoTfW2mAfd1fGI=;
        b=RtOxfh1JL6wx26zIbW5+ZwjBvqiqhxvojsMUZ/WAJWm4aXVXNMa2NxkKkHzHPji7bX
         ENU0dP7ACOj2LpbTr/jeVRO+2l7JzcdTzfCHoXICwQ+XB5IXPk5IzM3tHr9dc8aj0WvW
         5P8He18vxLCM3c8Z9Le81uWLsOMk1/AWt/KB5nEHhmL5X3qkE7CmjqT83IJmFwhj7GXn
         gPFxvUHgYrL+lUsBazn8CwU5wzprdShMB+4VOuwvHSJ8+VDghKbbDzd3tZPemn4TFj29
         ZP9DLZSDDab1vbsrS5UvvbMfmb6CmweSuK/583iV8Erm29kkl5vq2+1eCnrScdTbwBYO
         vA3w==
X-Forwarded-Encrypted: i=1; AJvYcCUoQmd67bkXlfDrA2y6OjWeFuIMZwsZPx0v1GGlOMqxiXiXxlQ28HNirJwaV9GPRJpn9BwwHB35duHkNmc=@vger.kernel.org, AJvYcCV94vtFjR9oMdpp3tFb100dy/vUW0yvnC/s84f4htfniAo46q690oqAU/NAuhlOFDiEcu+q3TRTeeqH@vger.kernel.org, AJvYcCW+oD9lrX2zvK2zhZd6KI7MacB1dhaFtOsulsB/NYAkjeJDEIvtR8mNffo9VoqVNyDuotEvjekya9Q=@vger.kernel.org, AJvYcCW6SAxX4FwsuMMuNFSCdcXJYPsUhM0wOSeowUWYykAf6hXOWs5dGFptuYLWCAfNfkNVyEDby5n4XmvjHIUz@vger.kernel.org, AJvYcCWMRMgKCArAi8sTbm+AnTJJj0qJpvdY8gvobmoo9blD0BzSNx3SEdlO2FwfIjhce4MCrfKI2hCURo+ErgE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyOG7srq7gD7cd9KTzNSeb3iKRcQ2l2toloLrI67/crTm8U4lhR
	R5iXbTOaHoGBY9sNgQymprJQZCB//Xze9/uGqLgeTbxHoof6ABhi
X-Gm-Gg: ASbGnculg1OzF2GcRf/fvjU/loS6+5V399IxrEUB+12B2y3hswNKUBr/pOPbe7JQJPm
	qZ+nLY26l65q2EO14iKt9z/jsg8hj9P7ezTsfvetxVyFgRVSZCHzrv2v0j3OgR6Q959of4FsUpQ
	mCB31NEkCN75NR4kbJzpSjqcic790VU4/WAKbfnj06V10xqCjunFLLRAcyMNe4f45OdirWgZ/Kl
	AWZDUR7UBDSMokRI3SIKFbiqYRh2q3HCkr7rwZfYFHOd5CXLlNbWrcLhDkJ09OaL6HqDomIZLWY
	1T2NZe8YYJNauc4qU1H79k99yOG0FDDYVyY1JvqnbpRHRKsJHjurgzUe5aIObdvl
X-Google-Smtp-Source: AGHT+IGkGAZRdhCjfdECHrWAM9MD6v36XY808HIWferzRLR2zZj+9PXX00kKoUEZKVMpjZEe1nIWqg==
X-Received: by 2002:a17:902:e80e:b0:215:30d1:36fa with SMTP id d9443c01a7336-21dd7dcb183mr384586555ad.39.1738679972477;
        Tue, 04 Feb 2025 06:39:32 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f06e72c27sm13591925ad.114.2025.02.04.06.39.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Feb 2025 06:39:31 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <1b32dfcb-5966-495a-ad48-903650888ee9@roeck-us.net>
Date: Tue, 4 Feb 2025 06:39:29 -0800
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: Fix spelling and grammatical issues
To: Purva Yeshi <purvayeshi550@gmail.com>, jikos@kernel.org,
 bentiss@kernel.org, corbet@lwn.net, jdelvare@suse.com
Cc: skhan@linuxfoundation.org, linux-usb@vger.kernel.org,
 linux-input@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org
References: <20250204134806.28218-1-purvayeshi550@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20250204134806.28218-1-purvayeshi550@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/4/25 05:48, Purva Yeshi wrote:
> Fix several spelling and grammatical errors across multiple
> documentation files.
> 
> Signed-off-by: Purva Yeshi <purvayeshi550@gmail.com>
> ---
>   Documentation/hid/hiddev.rst                | 4 ++--
>   Documentation/hid/intel-ish-hid.rst         | 2 +-
>   Documentation/hid/uhid.rst                  | 2 +-
>   Documentation/hwmon/abituguru-datasheet.rst | 8 ++++----
>   Documentation/hwmon/abituguru.rst           | 2 +-
>   5 files changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/Documentation/hid/hiddev.rst b/Documentation/hid/hiddev.rst
> index 9b82c7f896aa..073485f84793 100644
> --- a/Documentation/hid/hiddev.rst
> +++ b/Documentation/hid/hiddev.rst
> @@ -15,10 +15,10 @@ To support these disparate requirements, the Linux USB system provides
>   HID events to two separate interfaces:
>   * the input subsystem, which converts HID events into normal input
>   device interfaces (such as keyboard, mouse and joystick) and a
> -normalised event interface - see Documentation/input/input.rst
> +normalized event interface - see Documentation/input/input.rst

Is US spelling now mandated in the Linux kernel ?

Either case, this should be  multiple patches, at least one per subsystem
or even better one per driver.

Guenter


