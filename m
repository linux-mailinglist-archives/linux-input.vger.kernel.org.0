Return-Path: <linux-input+bounces-8173-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 818DD9D4215
	for <lists+linux-input@lfdr.de>; Wed, 20 Nov 2024 19:36:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D64E7B26E4D
	for <lists+linux-input@lfdr.de>; Wed, 20 Nov 2024 18:34:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3904A157485;
	Wed, 20 Nov 2024 18:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="fYUyzox/"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F64A1A0BDC
	for <linux-input@vger.kernel.org>; Wed, 20 Nov 2024 18:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732127623; cv=none; b=m16+y0L8nW2rwF8I0zKTKpp4SJ8svPj0mW25uB0zRuo1K4tyBS6SM0GmLDF632OGPZaT0Tx6kSPr8xFB9KS267DJIvobaETwV1LK8LAOb3gGmApe9bSgDbrzR/BrEHaS1jIWrYHwwkOpRpcsvz6Slk3mjRr21hQaeWUpEW6fTXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732127623; c=relaxed/simple;
	bh=iifBY3pBkQ+vW98uQfy907Av0seAhnpo27VE0vQDWU4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oeE0ZWf+JH/0kG3Fixdxukqksls6wf9QotNIq7F5MdFfShrUHEUXEHAivxPmrk7Vu69hIbIuzhsaexBkaJEXV+aLyvVJ4K8RQMMnA40IRvYN4mhZ3ZXW3QJ/d/D96pI4qBey0BJM9baBTZHeScGGIqomk95jpGypV5zEQOFj3ug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=fYUyzox/; arc=none smtp.client-ip=209.85.160.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-2958ddf99a7so100542fac.2
        for <linux-input@vger.kernel.org>; Wed, 20 Nov 2024 10:33:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1732127619; x=1732732419; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RJ5gUSV5Ug24/Ag1+xqlRjIyyK7KSpjstJhpPEWCQ0o=;
        b=fYUyzox/0iEyiCzk2P/3h6CfYeblr0m+3lgCMbLX8WvEpQevj4f6t9nDg1X+fYD667
         QflqcfOKUjFFWPnOU8GpPzkCSghxcx42pOi0KCewgT+6CNnIe8WMchELTMalV8sjXhe9
         P9Zd1hvmJWUPouE7f050fSjxxiQPR+6Fa9+9fM2M9U8ZPLvKNqnRa+bxox/IiMcCo+Jf
         NHnBJMVr3ojabrcesePCfjTcoy0EiUZ3B9E+i+qGI5YWUeZewnQ7cwjyR5qj5b2LHAYm
         1tJ0QsnOG+9J6EZnwBCETHzxWGBPSJhc1COG12uMI9In4J4e7Ig/qpyqQrMiK9zcdu1d
         YLVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732127619; x=1732732419;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RJ5gUSV5Ug24/Ag1+xqlRjIyyK7KSpjstJhpPEWCQ0o=;
        b=tjM1lsX6BXIuS25MaboUicPJPu9Ko3ArW5i2PeGRtc6rFMMTjsSYSianmq/EmO7YSC
         QapSFFZvJSBsVRe2z7VBVJFbcFxMlsWeaZcPfAtw4UxJ+3YPPHDMtPdVm9JOmiM2OyQc
         BYJDqrxyXFkVuYro0heRg8KS8+ZY6tN/tyRACW7UBgSHAvjXKiwVIXDdKdUw6nxZ5Tq3
         Zr1SLb3LXkRqJS+5YkNBk+gNEV7/Sw8mWeSOKkftf6R/TV7HjBJa5cZ5F5zSDuojxdTa
         YLO2jOwuFRcUXFiz6cLT9C6WdH6Fx2acPKYhnWQjvZT6UTUUtnfDxKJ39lSck06DFCXx
         NOnQ==
X-Forwarded-Encrypted: i=1; AJvYcCW9yl141E8qAi8fNPTuH4hXm8SHguDXxerlR3odKoOkwLgRRj+JV8I8G7aBsXeQxDS+Tysq2Na81wroyA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwhIWNlbBjrDPBykvGFFGdmB+p8UuzZJgkUNc/h9JIklqJ/4lHb
	pjJol1Tfklifeu2ib2qMt5On+SKgPjOp+qpCoVpTtg284zqq6xqyRMF0fakxKc8=
X-Gm-Gg: ASbGncsq+SFhCEgcfaWW3CwO5XNkKhdelj6Ch04tPw1tqlRmHPn64ebFnXZ32Y1Dq/k
	3yxjH56VjtjtWwZRfJJ8Fn82b1bgQ561K7d2Zqep9Na2meLxjbmwJ12J5Sh4Ubm4s067kIempka
	Jog4oo8S//+7TAOeYaDa9lUayWrMC7DnYMNmWJL8kNRvGjvxyUJkakHi6K6DsOcMq00W5sICwl8
	WxjZDUnutf0LtAcpgKZRFGFoJ5REeIBKX71MB9uCAq0nS/7Qr0cnZYizI2cU+TFAnIBj284oiwd
	XdzE+K0Abis=
X-Google-Smtp-Source: AGHT+IErtBHyxlQ4JQhHNAFpJNdFkrZ1twtnq44b4sOJeIPE/rXVkwZ6w3/0MkbAhQrD1Tk016w8+Q==
X-Received: by 2002:a05:6870:4985:b0:296:bbc8:4a82 with SMTP id 586e51a60fabf-296d9ec5dc6mr4728137fac.27.1732127619261;
        Wed, 20 Nov 2024 10:33:39 -0800 (PST)
Received: from [192.168.0.142] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-29651b43415sm4358071fac.49.2024.11.20.10.33.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Nov 2024 10:33:37 -0800 (PST)
Message-ID: <47ea20d8-444b-4c72-97d3-b04a6918b121@baylibre.com>
Date: Wed, 20 Nov 2024 12:33:36 -0600
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] Input: db9 - use guard notation when acquiring mutex
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-input@vger.kernel.org
Cc: Erick Archer <erick.archer@outlook.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 linux-kernel@vger.kernel.org
References: <20240904043104.1030257-1-dmitry.torokhov@gmail.com>
 <20240904043104.1030257-2-dmitry.torokhov@gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20240904043104.1030257-2-dmitry.torokhov@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/3/24 11:30 PM, Dmitry Torokhov wrote:
> Using guard notation makes the code more compact and error handling
> more robust by ensuring that mutexes are released in all code paths
> when control leaves critical section.
> 
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
>  drivers/input/joystick/db9.c | 30 ++++++++++++++----------------
>  1 file changed, 14 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/input/joystick/db9.c b/drivers/input/joystick/db9.c
> index 682a29c27832..7ac0cfc3e786 100644
> --- a/drivers/input/joystick/db9.c
> +++ b/drivers/input/joystick/db9.c
> @@ -505,24 +505,22 @@ static int db9_open(struct input_dev *dev)
>  {
>  	struct db9 *db9 = input_get_drvdata(dev);
>  	struct parport *port = db9->pd->port;
> -	int err;
>  
> -	err = mutex_lock_interruptible(&db9->mutex);
> -	if (err)
> -		return err;
> -
> -	if (!db9->used++) {
> -		parport_claim(db9->pd);
> -		parport_write_data(port, 0xff);
> -		if (db9_modes[db9->mode].reverse) {
> -			parport_data_reverse(port);
> -			parport_write_control(port, DB9_NORMAL);
> +	scoped_guard(mutex_intr, &db9->mutex) {
> +		if (!db9->used++) {
> +			parport_claim(db9->pd);
> +			parport_write_data(port, 0xff);
> +			if (db9_modes[db9->mode].reverse) {
> +				parport_data_reverse(port);
> +				parport_write_control(port, DB9_NORMAL);
> +			}
> +			mod_timer(&db9->timer, jiffies + DB9_REFRESH_TIME);
>  		}
> -		mod_timer(&db9->timer, jiffies + DB9_REFRESH_TIME);
> +
> +		return 0;
>  	}
>  
> -	mutex_unlock(&db9->mutex);
> -	return 0;
> +	return -EINTR;

This patch and any others like it are potentially introducing a bug.

From inspecting the source code, it looks like
mutex_lock_interruptible() can return -EINTR, -EALREADY, or -EDEADLK.

Before this patch, the return value of mutex_lock_interruptible() was
passed to the caller. Now, the return value is reduced to pass/fail
and only -EINTR is returned on failure when the reason could have
been something else.



