Return-Path: <linux-input+bounces-7368-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D77C99A473
	for <lists+linux-input@lfdr.de>; Fri, 11 Oct 2024 15:08:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 12E142852DB
	for <lists+linux-input@lfdr.de>; Fri, 11 Oct 2024 13:08:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25790216A14;
	Fri, 11 Oct 2024 13:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZTatO98c"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6613620C470;
	Fri, 11 Oct 2024 13:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728652101; cv=none; b=myCTAKXObyDItfBYWGc0lY46CwbNv4rBRHkuVR199FQh2Xl8puszaRn8OuD93Q5GH9J3WVzTsYnrZGPWP7QykzuT1dz5/XTSn9RKwdgETtOmxW010aE+hgpM50PE4sP3oqxsOsTdMfNVNQN7cEdBOt7e1maZ2C9WOwqesEbHrGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728652101; c=relaxed/simple;
	bh=0Uff1Q8fA+chvYw2EIdHjde7Bf8R3cgYrzQpAwOApCQ=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pGp/3ZV7ppBoduE4y1rREzy4Ch4mfHWIi256TFrJn/2fjHZKgVY++suLmwXQ0MWyA+lpCCJ+HC4Vu0A7gwD2GDW82vKE/NUAI4O7UrzqcCAfaf3bTrpw4W9mxwlDCv3Qo36W9NgQIr+zBEDTmB6ObMgbT+FjTRKIky8DX6ed9kU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZTatO98c; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4305413aec9so18329795e9.2;
        Fri, 11 Oct 2024 06:08:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728652098; x=1729256898; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eKLkm/hNhq9j5uG5nXoxfgQt+1ut0Om2BZkDCts3fCs=;
        b=ZTatO98cYNwsp0gRAhw2ZCo1j6WvhzwV04HfZPCEURIR3//kZlpOlYAEkOCyctuinr
         B+lA+kR+HX0NdWwAtOpJmWvek++uazGVOAX2Bf9F1Ud6Ah73ClgU6yBTSVJGVwiZMduX
         4sbEqepOJsDTLlVSpPNgH7somyzOs4cSnepB31yr70P5IHv2lXcTpiYRBsD/IPa+Tmhi
         ZQs61Imzck+RNbq7t5wRUD61x7ZBwh7z5vlgzHbOGH3dPqpVEStz7XhWCnIoENWpk/Ze
         i6RIjQXOZjNiUGSi8b5te+N/7InQMdTE/siXkk/tYilwqb5A1vHawTx/ukzm/JtJS36s
         LsfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728652098; x=1729256898;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eKLkm/hNhq9j5uG5nXoxfgQt+1ut0Om2BZkDCts3fCs=;
        b=Z6u+Qpc8BrmPQdEsdxfsETRAL/oZDhgH5TcFf1N5pj8aDog9cHGb45E2VSG2EgansX
         +mEjC7viDRPSaFErxYuW3DJhM4za4U6WdHNj1YKmM2mh4oqDhop/q0APQoMsXEwru5ga
         nhXV280SikDineybMiFuM6nC6BJ0eixPRnZKA93keaBA+lJr0+dsjwQ4GoB8a4AZywGI
         sDX4SNc4PbJeM3bAGHnuArav/7pzVTsH05v48nai4fn+b0pib40jjE25XEIZ5BSQr4c3
         8qn0BlTLyIL+7BWZxynqiNrZOuc23HFz+oByaHUjc3+YwF0wx78rZ7dQhTXp8iilk0va
         m5VQ==
X-Forwarded-Encrypted: i=1; AJvYcCWqBw/wFSJpr0Noz4pIUl8L0u7eV9tGj9AfR0VycjRhucryTcJTUH48oK375kcwgsO79XvBbXN65livPA==@vger.kernel.org, AJvYcCWwnapj/u60irI+k8jpnXHs/u72UU4OQfOFVvVDc1F0M1ucQ+Pjr4yksGQh3vSFbEtpH5H/1lpi4SDECILI@vger.kernel.org
X-Gm-Message-State: AOJu0YyBOef64CLF0pLtncL2B6PcSg5bA/t5qWDKkQQJPMK3Z8/d+Rq4
	8g+jmNlaJXWkYDg3oAHmUw0bcqQNaQZFejyauCsktW87NLBia7PJ
X-Google-Smtp-Source: AGHT+IFb+9onT5jKNpHuJk7MyWhaT/8+VA0yTkHSKqyBST/swGlD9ICxEK5WobCYasdxCMYhrt8tdQ==
X-Received: by 2002:a05:600c:3d90:b0:431:150e:4e8d with SMTP id 5b1f17b1804b1-4311defddafmr21809545e9.21.1728652097406;
        Fri, 11 Oct 2024 06:08:17 -0700 (PDT)
Received: from localhost ([217.151.144.138])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4311b69f799sm23606165e9.1.2024.10.11.06.08.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 06:08:16 -0700 (PDT)
From: Oliver Graute <oliver.graute@gmail.com>
X-Google-Original-From: Oliver Graute <oliver.graute@kococonnector.com>
Date: Fri, 11 Oct 2024 15:08:06 +0200
To: Li Zetao <lizetao1@huawei.com>
Cc: dmitry.torokhov@gmail.com, u.kleine-koenig@pengutronix.de,
	felix@kaechele.ca, ye.xingchen@zte.com.cn,
	joelselvaraj.oss@gmail.com, andreas@kemnade.info,
	viro@zeniv.linux.org.uk, dario.binacchi@amarulasolutions.com,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: edt-ft5x06 - fix memleak when rmmod edt_ft5x06
Message-ID: <ZwkjNoa63gH5U6Mu@graute-think>
References: <20241010154010.3228450-1-lizetao1@huawei.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241010154010.3228450-1-lizetao1@huawei.com>

On 10/10/24, Li Zetao wrote:
> When insmod and rmmod the edt_ft5x06 driver, kmemleak reported a
> memory leak issue:
>   $ modprobe edt-ft5x06
>     edt_ft5x06 0-0004: touchscreen probe failed
>   $ modprobe -r edt-ft5x06
> 
>   unreferenced object 0xffff88810b38c8a0 (size 8):
>     comm "modprobe", pid 23672, jiffies 4295355205
>     hex dump (first 8 bytes):
>       93 00 00 00 00 00 00 00                          ........
>     backtrace (crc a10fb312):
>       [<ffffffff81e12f70>] __kmalloc_noprof+0x2f0/0x3d0
>       [<ffffffff8368c3b6>] __regmap_init+0x2d26/0x4810
>       [<ffffffffc06b4875>] __regmap_init_i2c+0x65/0x80 [regmap_i2c]
>       [<ffffffffc07108a6>] edt_ft5x06_ts_probe+0xd6/0x3410 [edt_ft5x06]
>       [<ffffffff83bd85d1>] i2c_device_probe+0x3c1/0x8b0
> 	...
> 
> This is caused by not releasing the tsdata->regmap resource in time on
> the probe failure path. By adding the err_regmap_exit label, execute
> regmap_exit on the error path to release map resources. However, it
> should be noted that during the ts identify stage, regmap_exit may be
> performed first and then regmap may be reinitialized, so when
> edt_ft5x06_ts_identify() returns an error, it need to check whether the
> regmap initialization failed.
> 
> Fixes: 9dfd9708ffba ("Input: edt-ft5x06 - convert to use regmap API")
> Signed-off-by: Li Zetao <lizetao1@huawei.com>

Reviewed-by: Oliver Graute <oliver.graute@kococonnector.com>

