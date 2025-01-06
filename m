Return-Path: <linux-input+bounces-8945-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 73278A01F6C
	for <lists+linux-input@lfdr.de>; Mon,  6 Jan 2025 07:57:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 093EC3A3A4E
	for <lists+linux-input@lfdr.de>; Mon,  6 Jan 2025 06:57:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AAE5194A64;
	Mon,  6 Jan 2025 06:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EfjpnBz/"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3825617C;
	Mon,  6 Jan 2025 06:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736146625; cv=none; b=GINHEaBW4xr4WTvtnFjtHYOmrPwwNzTschVe6V61n13qCP1HyS6dPy1GMbu+TP6PrLw4m3MEZROjsnmxl30PtWjKxOmHJVtr9G1l0J5Oj4Vq1w5O+UQtTQGA8A/0T46R/yIJH6TzJYhmYavGdRsi2W5VX32zT/ymh7You3IZ+fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736146625; c=relaxed/simple;
	bh=sox/Vho4kqO2T9syxTthA2DS1C0JtMnYHzVSeLffzNI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EIfl1L1VZo/GpQS8wRv3UwNYZouYE8oZa2WF5dd05E809CtUc1m18MWp6teEvk/HxEfXBub8zLyak9A1V9DsUZ3hZBHS5M9kFtZw0pX0YmI/Ar/+ezXKFXQ+XOkzrNYsh4AhvAGa0PvxM+ZiAAj44Cfcej/oSMEv910wTApG+m4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EfjpnBz/; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-216426b0865so195353805ad.0;
        Sun, 05 Jan 2025 22:57:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736146622; x=1736751422; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=spawWA94/tAfE9Yli/yskQTG9oZ6NS1/5TPyygSuwlw=;
        b=EfjpnBz/Gby/y2lWJN0Ydj/UrmZmvL6HNbcFvy3Js0StanPdvYb3FDniZWCyqVQYCj
         4UE7Yyeu2op6wdVHej33B9akVJEDe4Fnt8h0KSsoiMOxfUxpev5iglQ0zw5Qpucr/lSJ
         ZxLiZmZEfbMg1/xFNIw9ZDYDVc4KbP4llbbe2iuNTwUZ+MV5X4XqtxrTo2HUaRNUnxF6
         QO1lO1nTkOJ05SWV/k3WjrlV+74Bn6AAnfwyaTs/2SPOjiQCvL7mzwxrVblWUvB1HhsG
         RMkWxaCMFYaSE9ePhzpAD6iwxznhWF/YpOQfv4tpqRo9qIhmHNbTyvkW+HtYa4dwhK6T
         hx6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736146622; x=1736751422;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=spawWA94/tAfE9Yli/yskQTG9oZ6NS1/5TPyygSuwlw=;
        b=eQpnlOEJIs1P5f1HCZhxlPxthnwjYxx2vOAz+LmNlfYeqn3fbST7QPmctdXtmd0LZX
         VbTeRvfKaPllvB5deFKcAsnbgIvoPK6urFNOksoxQGGnNVynvTT3ygYOFnOOY+XH4dZQ
         JvCQu8q1vprTNoQrdFLKzon0ZWnZ2ZeyHHtU1Ji6/wU75d5pumDvD2rC5D1guXcFTyVj
         Fy0G4tEBg1oqW6y4SRpVeECFrQKzS/Qz/U2hT+q2A4cYO/lqYvj+9e/Mq/DHVlCA/ny0
         rvd+nZufdNAnXf4+iwO2duE8/vcZkbnlsb5VPPKoOmjFkH8UZistGdL1Mdn7K2NZET0L
         sCYQ==
X-Forwarded-Encrypted: i=1; AJvYcCU/DNEyhARccupAoanB0Z/Kl8/O1aBxXK3bYf1E4ENa+7lozlcxEWc+AVyW6XyOPYM/YaJ4uV2niZpQcQ==@vger.kernel.org, AJvYcCWPxkgaZsDyp6pGM9s2qJZT1jpaf7jLGLtHmDODxr+GssBNG+92ZvtNhbJkAQIbcGw15KwbxGubddISpBBB@vger.kernel.org, AJvYcCXAeOUShY+nAY0MRAQspcwqxTt2IFX8lqEWfNIOLTPkoDGFFtCDWvmczSifqjjeKQY4taVZZwho@vger.kernel.org
X-Gm-Message-State: AOJu0YyeXT2nUIN+l+MdrJ3tJZ7NUWQlvyc8ixxzdnCHPwYPVdoZonHj
	ZRW6/qOCU/DoFZQ5hF3D9cQqPiQ9r0s0483hnlqugbb3oWkAEh96
X-Gm-Gg: ASbGncv9VjRoYRqI6li6CvdF6AhBriov1QMFpCZHy4oP4ruCJ2c7QxBOJBNK67aRVsZ
	fs03sPeIB8X5MQp3uoJ+rsV0tTUxE8LmrUj3kngL0fcYtckvsV8/VVUtNkH5m7Dj6J4lqBVTOOC
	DmSw8G9I208Hm6lOC1fshTNuPEhwS+zOHibDTIceICZzbHyMApE8TOetNg6VkfGJEygrKC7N0CT
	HZY1NL3VBVBNCN1i76bYZ0tzDcfyqfBLz86hSiRV07vJf4Vms8+pXW+zA==
X-Google-Smtp-Source: AGHT+IG0ibFg2cymQLsLBrPT0DUZl69wu+gu+2ZwUu4ugAgLGotwLBZp0DMcXCXam2H97qk3KElZmg==
X-Received: by 2002:a17:902:cf09:b0:216:3889:6f6f with SMTP id d9443c01a7336-219e6e9fa8amr787537235ad.17.1736146622320;
        Sun, 05 Jan 2025 22:57:02 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:6998:e192:65f1:e7c0])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc96eb40sm285842475ad.86.2025.01.05.22.57.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jan 2025 22:57:01 -0800 (PST)
Date: Sun, 5 Jan 2025 22:56:59 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Ma Ke <make24@iscas.ac.cn>
Cc: jeff@labundy.com, bentiss@kernel.org, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] Input: Fix error handling in input_register_device()
Message-ID: <Z3t-uz2UaskMd_Wy@google.com>
References: <20250105092448.274424-1-make24@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250105092448.274424-1-make24@iscas.ac.cn>

Hi,

On Sun, Jan 05, 2025 at 05:24:48PM +0800, Ma Ke wrote:
> When device_add(&dev->dev) failed, calling put_device() to explicitly
> release dev->dev. Otherwise, it could cause double free problem.

How exactly allegedly missing put would cause double free?

> 
> As comment of device_add() says, if device_add() succeeds, you should
> call device_del() when you want to get rid of it. If device_add() has
> not succeeded, use only put_device() to drop the reference count.

As explained in the kerneldoc for input_register_device(), in case of
the failure caller must call input_free_device() which will do the
required "put" as well as will handle devm-allocated input devices
properly.

Adding call to put_device() as proposed by this patch will indeed
introduce double-free.

> 
> Found by code review.
> 
> Cc: stable@vger.kernel.org
> Fixes: 0cd587735205 ("Input: preallocate memory to hold event values")
> Signed-off-by: Ma Ke <make24@iscas.ac.cn>
> ---
>  drivers/input/input.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/input/input.c b/drivers/input/input.c
> index 7f0477e04ad2..a0a36aa90ecc 100644
> --- a/drivers/input/input.c
> +++ b/drivers/input/input.c
> @@ -2456,8 +2456,10 @@ int input_register_device(struct input_dev *dev)
>  		input_dev_poller_finalize(dev->poller);
>  
>  	error = device_add(&dev->dev);
> -	if (error)
> +	if (error) {
> +		put_device(&dev->dev);
>  		goto err_devres_free;
> +	}
>  
>  	path = kobject_get_path(&dev->dev.kobj, GFP_KERNEL);
>  	pr_info("%s as %s\n",
> -- 
> 2.25.1
> 

Thanks.

-- 
Dmitry

