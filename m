Return-Path: <linux-input+bounces-7551-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9305C9A4A72
	for <lists+linux-input@lfdr.de>; Sat, 19 Oct 2024 02:20:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 35BBD1F227F4
	for <lists+linux-input@lfdr.de>; Sat, 19 Oct 2024 00:20:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19588224EF;
	Sat, 19 Oct 2024 00:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X6XZkx3q"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A54317BA1;
	Sat, 19 Oct 2024 00:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729297217; cv=none; b=NWI4CQ9ACuwpQWgcrZTVNfGGTddrYfk0Cda+3Be5j6TNyydoagXOCs/PVyCPv/jVtE0VrRmtwKFP6EFKtWiKzzwB9lq6twx6UzyzKaSyBGuYOBv811uPmxE9Nyr270XZ2dbqwKAzVCucwYAzLSXfUOtkvsXltehgwsq0cRQpe2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729297217; c=relaxed/simple;
	bh=DHsdfVtVpF1TREqk2FeZmDdjMBljxPYTU1+YnlLyKTc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tzQl62iLxYBT4Zvv48Ha9nnn9uDGVanlEwGTifNxa6sgUPYpWftxDPxNbhX4GZLNn48R3pnsJ6tXADSeuRYBIkHuw0gJg2+vnntcuEyKeqQl6OfNMEeULpw9hIySJP9tRSLiuxFUm6eNfWbKCwwCgcGRdWbXv2/oc9yfnyRDFUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X6XZkx3q; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-71e5a62031aso1912438b3a.1;
        Fri, 18 Oct 2024 17:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729297213; x=1729902013; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MclcGAu/+C2Il1YEk/4nSZIOYQNfnHadvSeDjFDtqQk=;
        b=X6XZkx3qlWq6Ns251HIXX46bd739lwNpticVUPt58B2q2gc5n3T4MwFKjS67bbE6Vj
         yNbyj7gL5jN49i+bLbiHzCvmzybxupGvtcnUo00ctjXX29LjB5Yh6GbH+j9JSkowU08e
         OmlYxgz3RtL6CIuy8adaPFZnXsOyrYd05bFYMnjQ8WO+pQR7SfGKnRf5fNSqDuw2hddd
         S14Oge7KfWNwqgXFPwqjaeVUI5S0/FqAYuna1h/KtjgWQ1fjTNAwI/6lzwN/o/zas8IR
         sSc9+c9kImzZ5x3RrmU0ttJMRi53o98X5hTXzgHBDXkeXvZEwDfij/5Jhlp2Kgt8pBbu
         E4lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729297213; x=1729902013;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MclcGAu/+C2Il1YEk/4nSZIOYQNfnHadvSeDjFDtqQk=;
        b=MzbYcSaWKHlRhsqKiqUm0nIIpP0BzgqFVKuRE2RAtYaW1i4ZxWfiu3EpRzTvVEr705
         z8Pa++QjPONsGmF/rK2tB/0Pl79L1nyZFx30kEsLgfT2VCKxHSFJbvJZmhXTYJnoSFjf
         v0rtnT9qkb16svW2M+AK9YyAFzDDGmHyPWGvtFss5bn3IIxFn0B+wfIMmUsP+e2G6RF0
         V14RDIyMX980HjM8rp+yEjKMxMDMYFSZQITSSbFS4mBsgskO5FS0Nm6pc/psg6tXMi7C
         ERKO97Jn6KZH1H9XYOTLVg+vo8dJsUb6YYFmJGjy4cJ8YRsZMzQ/BIbXoC/RiGZnB3wY
         50uQ==
X-Forwarded-Encrypted: i=1; AJvYcCVn24oGQ7pDGW/I/tEkrEnnnI7r6ySvU3RpdlG1smspJgjbD4RnM5k6CqGiankFOLLnJg4cdkuY7O9DdgjI@vger.kernel.org, AJvYcCWuN2+89oMCZsJXBEVv4YGWbwi8HnggFugXctpvOAxxaNAOTMMoTZSwbfYu/qbnpUB3vQL145LupDtwkQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzc5luAEjpePCJhNbnKnWcPoijus52oCzqdSnet63rhxjRloD3g
	QTpD6dOLMSi9aqy7ZiyWAbR69rfknPZEwAQqOlLpp9cNIUwh/eif
X-Google-Smtp-Source: AGHT+IGwQJCXiF6PbbQnZla6hNUHbi07GfpzgRPqPTqZIHuqAQG8+9AM8rNYZ9PjbjZkDxcaquCgxQ==
X-Received: by 2002:a62:f250:0:b0:71e:374c:b9aa with SMTP id d2e1a72fcca58-71ea323c111mr4277238b3a.27.1729297213352;
        Fri, 18 Oct 2024 17:20:13 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:351c:e27f:10e5:484c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71ea3311f16sm2074799b3a.40.2024.10.18.17.20.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 17:20:12 -0700 (PDT)
Date: Fri, 18 Oct 2024 17:20:09 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Oliver Graute <oliver.graute@gmail.com>
Cc: Li Zetao <lizetao1@huawei.com>, u.kleine-koenig@pengutronix.de,
	felix@kaechele.ca, ye.xingchen@zte.com.cn,
	joelselvaraj.oss@gmail.com, andreas@kemnade.info,
	viro@zeniv.linux.org.uk, dario.binacchi@amarulasolutions.com,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: edt-ft5x06 - fix memleak when rmmod edt_ft5x06
Message-ID: <ZxL7OS_mIoZRPhYw@google.com>
References: <20241010154010.3228450-1-lizetao1@huawei.com>
 <ZwkjNoa63gH5U6Mu@graute-think>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZwkjNoa63gH5U6Mu@graute-think>

On Fri, Oct 11, 2024 at 03:08:06PM +0200, Oliver Graute wrote:
> On 10/10/24, Li Zetao wrote:
> > When insmod and rmmod the edt_ft5x06 driver, kmemleak reported a
> > memory leak issue:
> >   $ modprobe edt-ft5x06
> >     edt_ft5x06 0-0004: touchscreen probe failed
> >   $ modprobe -r edt-ft5x06
> > 
> >   unreferenced object 0xffff88810b38c8a0 (size 8):
> >     comm "modprobe", pid 23672, jiffies 4295355205
> >     hex dump (first 8 bytes):
> >       93 00 00 00 00 00 00 00                          ........
> >     backtrace (crc a10fb312):
> >       [<ffffffff81e12f70>] __kmalloc_noprof+0x2f0/0x3d0
> >       [<ffffffff8368c3b6>] __regmap_init+0x2d26/0x4810
> >       [<ffffffffc06b4875>] __regmap_init_i2c+0x65/0x80 [regmap_i2c]
> >       [<ffffffffc07108a6>] edt_ft5x06_ts_probe+0xd6/0x3410 [edt_ft5x06]
> >       [<ffffffff83bd85d1>] i2c_device_probe+0x3c1/0x8b0
> > 	...
> > 
> > This is caused by not releasing the tsdata->regmap resource in time on
> > the probe failure path. By adding the err_regmap_exit label, execute
> > regmap_exit on the error path to release map resources. However, it
> > should be noted that during the ts identify stage, regmap_exit may be
> > performed first and then regmap may be reinitialized, so when
> > edt_ft5x06_ts_identify() returns an error, it need to check whether the
> > regmap initialization failed.
> > 
> > Fixes: 9dfd9708ffba ("Input: edt-ft5x06 - convert to use regmap API")
> > Signed-off-by: Li Zetao <lizetao1@huawei.com>
> 
> Reviewed-by: Oliver Graute <oliver.graute@kococonnector.com>

No, this is not the right way to fix the issue. The rest of the driver
uses managed resources, which means that regmap in error path will be
freed too early, which may cause issues.

We have same issue in driver's remove() path as well.

I CCed you on a patch that uses devm to release regmap which will make
sure all resources are released in the right order.

Thanks.

-- 
Dmitry

