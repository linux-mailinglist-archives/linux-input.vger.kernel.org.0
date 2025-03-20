Return-Path: <linux-input+bounces-11020-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AAB3EA6A89C
	for <lists+linux-input@lfdr.de>; Thu, 20 Mar 2025 15:33:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6B09D1887A6C
	for <lists+linux-input@lfdr.de>; Thu, 20 Mar 2025 14:25:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8E98221549;
	Thu, 20 Mar 2025 14:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="maky9Uhj"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 363241DE8BE
	for <linux-input@vger.kernel.org>; Thu, 20 Mar 2025 14:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742480711; cv=none; b=X5dtClP1SkLvIrRh93OGAn78C/HKd5Jq7MRPWiHD8ccYqnvYs7EQJSDntdhALD+VJ57HsYqNqBrm+S90nselD3R8FS+i6t9LDkdLMr1nyfH5FxHjH3NkQPrD9yydypNfR5Ofpmym52wE3H4lKc6d4HDzee1a9L+2N8OPLYUpc+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742480711; c=relaxed/simple;
	bh=F4KnFhSzOX6eIyHkk5hZbAmDvmdul5GOQycv8LDllbU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JL8wrGhc42LgpKJd78210jrG7PjecbWp60XQhBJybUh36UwQVjaGgjjnS7OeYKkuSWU0ALr3oUFMiLO5X96OLl54LT8EasEfvuAvVXbyIUK0rd67vk1N4leZPd1NOVQFOjsypekMLKDz3g8b14yCRAADQOf9WtOKKGHxP5gRcL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=maky9Uhj; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-6e91d323346so8798766d6.1
        for <linux-input@vger.kernel.org>; Thu, 20 Mar 2025 07:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1742480708; x=1743085508; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NcufIoTquObc4xvWCnB60+ugCUZsUArli95nP/Pg8FY=;
        b=maky9Uhje3w22PFPZzsqOOZpe0FBdsqRk8zLWN4jEAWlz/oCpfVEjQ4K9Ym/hP+0qU
         coKT4dlLGqv0+Es24b02TTuW5Xm8jwLp6Zp+KRPfV/O6Ze7dlN/yqzUJDKENx9OyUEre
         J8n2UCGBJuI3734QQBfMqWL+00VRxsrU9nGprgw4RbWGTM/YNIT0SMmTaiunQKeIOgDe
         zAxqclnfdpKqkT15En3Z19FTfhGGq0h6TL3sdfieQnWtiWUJqXPcH6YmKvZ4IjF/hTn0
         L3Ay0+huKJXj4g8KgS7N5igke6LMK6jIus297DwDYkEGOxEVizJykWoNr0lLvAzETIm0
         dnsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742480708; x=1743085508;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NcufIoTquObc4xvWCnB60+ugCUZsUArli95nP/Pg8FY=;
        b=GRvI6TOQNSoXI0cjl/PSukASeWNNQzXSg0WxfMS4wjSzZcIu4+aXQPPSHtcmSnjDno
         ZHa8FtRmuApBQKe7TXq8Bm9i9WNSLNpLHnu1cgdC8lH12j6wKk3LcoHmvv3+k8WeiwQo
         IJyiIDu+gL3m4ewRZ8IiU2rmWsebbAebHssTeUhTot47Nw+5kN+kSY7UzHzh2g5RyrNA
         usxy8cu45AuXrkbXz9p8IiCaeLTGuqFYF+Se1iIE1g4xDnxwCcBwu0S1mug1Ntv203Ti
         0ygqeDRvFZ1ilgGeU6QKvh/ExTaXINJi7naLm1BFuaYMFZ8lu3S6lfceZjoEAw4Aqv2P
         GzPA==
X-Forwarded-Encrypted: i=1; AJvYcCUM9H0KxhYp8Gyp9h+IwiunVHJPH4OflUDTcWo1BYU4K3lJj2KtXzRb13g4Ag754BMHJ4nItVGz+bUL7A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2/7NXpING40o/DB0HztkecLjqYOL7SUEv9bC9v+qe4zlH6YiN
	NwFw6sR8yC0pGbvjCz2SGBAfKCI5asFU+6QbzkG0+hwu/BDlQufuGD20W/e6EA==
X-Gm-Gg: ASbGncv4owTlpk2QmYHQneZZpWzZhuNZwdmLlJvaXS2WwF4ICAJ7GiKA7MKHMGTp08/
	NyqFl+9Dot7iJnMGg8qLtuQJZUhGEiVhOl2htKSKiZw7YSNaMfx27ODHSXLGmJDHMtjoTu/bUJ0
	8uaUVVzwpX38Jj2apczTUV3bPRTQa+lVqABVOV7StNSAvq8qwcQkXemCDfEGzy/ByN8v8rAp6ce
	E83vwkWVL6tVKs7mMTldETs3jfgbOGBiSwtvDbQ0FQqbPuzYCjgsVymgGxpPLfAydQ5Yx9V+hQJ
	7AgQk1og+Vu4GFX0UfxfAPH71YqjKzU9hcIWlhcG2Vl5TSpK4wAA3X82sb0rK7+taYxN8Kh7Dwm
	uyFT3KpeqqXGqnbQ5suSmFnLUq4YYDUokMn8kyA==
X-Google-Smtp-Source: AGHT+IHfUR49FUmIocj39iu24611PkyzTcnBbnp3e5L3vO6SSH1McNWe6SG8aTCWtlijcQKBijjCLA==
X-Received: by 2002:a05:6214:1d2f:b0:6e4:2e5b:8d3f with SMTP id 6a1803df08f44-6eb349d1a0bmr59972906d6.14.1742480708068;
        Thu, 20 Mar 2025 07:25:08 -0700 (PDT)
Received: from rowland.harvard.edu (nat-65-112-8-24.harvard-secure.wrls.harvard.edu. [65.112.8.24])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6eade209beesm94796156d6.10.2025.03.20.07.25.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 07:25:07 -0700 (PDT)
Date: Thu, 20 Mar 2025 10:25:05 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Oliver Neukum <oneukum@suse.com>
Cc: =?utf-8?B?55m954OB5YaJ?= <baishuoran@hrbeu.edu.cn>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Kun Hu <huk23@m.fudan.edu.cn>, Jiaji Qin <jjtan24@m.fudan.edu.cn>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org, syzkaller@googlegroups.com
Subject: Re: WARNING in cm109_urb_irq_callback/usb_submit_urb
Message-ID: <a3f66f2e-a99e-47f2-a3ef-742b6903cc5d@rowland.harvard.edu>
References: <559eddf1.5c68.195b1d950ef.Coremail.baishuoran@hrbeu.edu.cn>
 <62d91b68-2137-4a3a-a78a-c765402edd35@suse.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <62d91b68-2137-4a3a-a78a-c765402edd35@suse.com>

On Thu, Mar 20, 2025 at 02:35:23PM +0100, Oliver Neukum wrote:
> 
> 
> On 20.03.25 05:39, 白烁冉 wrote:
> > Dear Maintainers,
> > 
> > When using our customized Syzkaller to fuzz the latest Linux kernel, the following crash (94th)was triggered.
> > 
> 
> Hi,
> 
> is there a way to use the syzkaller for testing a patch?
> 
> 	Regards
> 		Oliver

> From 03d78ca8c47c8c888df7c7ae2c7109825799d236 Mon Sep 17 00:00:00 2001
> From: Oliver Neukum <oneukum@suse.com>
> Date: Thu, 20 Mar 2025 14:29:17 +0100
> Subject: [PATCH] USB: cm109: fix race between restarting and close
> 
> cm109_input_close() can race with cm109_restore_state()
> Hence cm109_submit_buzz_toggle() needs to check
> the shutdown flag
> 
> Signed-off-by: Oliver Neukum <oneukum@suse.com>
> ---
>  drivers/input/misc/cm109.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/input/misc/cm109.c b/drivers/input/misc/cm109.c
> index 0cfe5d4a573c..8ae62b5e45f6 100644
> --- a/drivers/input/misc/cm109.c
> +++ b/drivers/input/misc/cm109.c
> @@ -348,6 +348,8 @@ static void cm109_submit_buzz_toggle(struct cm109_dev *dev)
>  	else
>  		dev->ctl_data->byte[HID_OR0] &= ~BUZZER_ON;
>  
> +	if (dev->shutdown)
> +		return;

This test must itself be subject to the same race, right?  There needs 
to be some kind of synchronization between the two tasks (i.e., a mutex, 
spinlock, or something similar).

Alan Stern

>  	error = usb_submit_urb(dev->urb_ctl, GFP_ATOMIC);
>  	if (error)
>  		dev_err(&dev->intf->dev,
> -- 
> 2.48.1

