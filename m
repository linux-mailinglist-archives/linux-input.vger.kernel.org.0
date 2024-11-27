Return-Path: <linux-input+bounces-8263-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D6D719DA3D7
	for <lists+linux-input@lfdr.de>; Wed, 27 Nov 2024 09:24:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 46F6CB21455
	for <lists+linux-input@lfdr.de>; Wed, 27 Nov 2024 08:24:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DFE71865E9;
	Wed, 27 Nov 2024 08:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GoutpDfo"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8478817BB21;
	Wed, 27 Nov 2024 08:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732695870; cv=none; b=OpskR1W/AT67rkZ7duoLGMmXNjlm1V0zdpuiuJ/iMsXE0lNhlI6jonhVbc/YtrMwG+Ef8BWbBIf9Z9Nhquv8UwZJrmq/Y+DM0FGWxht9LUoV/SQ8SeLn+N2HbGIJARiuzozsbpxJPsMV/twoGTSwgHaJLCWTIFa70rV4+j8Ct7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732695870; c=relaxed/simple;
	bh=6PxgdC42a8ZvRFETs70k63iKhzy70aAH+Rwgk6+gxnw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bRxu5QOpxda+6XuYVBBJ2hg1ryqVSwiakI9d4v+RLeBCVbMwm37xds31WN+y8TulLduJC32q20dvDX4LL01PajurPGElWMMOINjs1g5JRyo3izTybd8gKPqId785uu13tgFowY/imvu7Og0VzLDm+TqGFtCYdWe/MnqWvOIYlbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GoutpDfo; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-e3836b1ed44so448467276.1;
        Wed, 27 Nov 2024 00:24:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732695867; x=1733300667; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lOqsn9U9UwR9ECKJB886+Y24JEgcO/1OMJG6KFsH084=;
        b=GoutpDfo19P/OXa0dT6jTbvKa4p26TQ943VCzQA2nX8ojFPpmP9xF36ikBoBczwwkT
         /EmCQDVw/3t4k5Dqq0mlx1WrtAxRXgrxIEduQu7Lg4kXS2p2uzqBao2+eJ0hl+p+e7dO
         Obp/L6/gidBWHis2xvsmjxGuZb6XPHPZAo6CuIvBIZK49f+7ue9GfGQazW89g+522DCo
         chvx8hWECdbbYE7XCC+cJX5qbUxmDI/cR48crNN10NDNQ1Bc7fEeZXbaD464VfKrq2ql
         Bro1HmG/+x/O1qvemjIgchtTJPP/j/Ul1ILLVpFiObmAxSLEq45Lm/0SeXhAdRgZqyhA
         0LGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732695867; x=1733300667;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lOqsn9U9UwR9ECKJB886+Y24JEgcO/1OMJG6KFsH084=;
        b=DrwIRoGa6IMGSApl/qPmguyZc7lCMxxt4F4oKGf2YJ47F2pwUj7sxRsAOGUmtTlXFC
         08/GVbyrmJvF0ur9B9NaOEad4WaZNiMa+hvm23GiWpjNcljNNq5DJzImY0/iW26knLbV
         gSneQiomVkjiSnhNyxcz7E8ZoDiJxKV4Zh+7IBBSqFGJRTnIaGou/7W46UPbw6qfY26F
         Z/7/C5afYEHMz9qpRTDRTFAI6I+egxyf5rMDxEQDvJXpY4Kmrg49hxraKVSfGREtZImS
         EVTv6M+xel5L4yfjoDkfNT68roKumYv2MQCgJvtfEj18MO6wOI5zYPepx61KrpssGqLe
         2G4A==
X-Forwarded-Encrypted: i=1; AJvYcCWJn10ztbmyIZj9aJh5LJGIw2Zp+x4AAdeiTqVgMwNA+GfY3u86z8GpbiRp1FfLe7Nx5mJ5GCz3vbWj@vger.kernel.org, AJvYcCWgUFp7D7uTIMjcQA0R872uaqhrQeMYKHOTn/+hK2s4S29APvb/lj+N+NitrBMGlZiPAl7K3/LvAx0+kxKC@vger.kernel.org, AJvYcCX72EUOU+O1+6cko05TBH+RRkCuE7m17du6o2AsElxgxKmI/oJAL3eYsxD/YlCE641hQW4/sNn9GwWberc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyA23tPfn8v3Gfm8a6za5PfwUHWXP6Eh8/4KitdOpl/RGxI4AKe
	NLLjwjn46kp+twrWtI/7cDsm2uDFAHdPIqUqOZtxn982zGBqCX/TQAwQj7AL+2/lFmG0bc0QCni
	HaXH47f8Z8+e/ju6p6JFONBLJ34pMtw==
X-Gm-Gg: ASbGncu1SAU8rm4Lt/UK/ufE0KwFogblaoO1cJsfXO7u8Uw7uHjE5ESzny2S3uwSIIb
	UVWD+H7UzkUQJAAX3UYtRZFRKd9oBK0hW
X-Google-Smtp-Source: AGHT+IE7WQ4zcWjkTsHj3YU6P5a3zfrxQl6S9zfO+CZjireFyD7ogJ24uCCbFBJtrFm5m1j/xcyE0rDoDRhRHJhalAM=
X-Received: by 2002:a05:6902:91e:b0:e35:ddad:5ab0 with SMTP id
 3f1490d57ef6-e395af12b3dmr1823834276.18.1732695867370; Wed, 27 Nov 2024
 00:24:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241126-z2-v1-0-c43c4cc6200d@gmail.com> <20241126-z2-v1-2-c43c4cc6200d@gmail.com>
 <Z0aCSBNEAJlgNIAI@google.com>
In-Reply-To: <Z0aCSBNEAJlgNIAI@google.com>
From: Sasha Finkelstein <fnkl.kernel@gmail.com>
Date: Wed, 27 Nov 2024 09:24:16 +0100
Message-ID: <CAMT+MTT0oiODONgEipLuAaZyzD-YyM8mbAcRsZKn8N4E326kMw@mail.gmail.com>
Subject: Re: [PATCH 2/4] input: apple_z2: Add a driver for Apple Z2 touchscreens
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Henrik Rydberg <rydberg@bitmath.org>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Janne Grunau <j@jannau.net>
Content-Type: text/plain; charset="UTF-8"

On Wed, 27 Nov 2024 at 03:22, Dmitry Torokhov <dmitry.torokhov@gmail.com> wrote:
> > +     u16 checksum;
>
> Does this need endianness annotation? It is being sent to the device...

Both host and device are always little endian, and this whole thing is
using a bespoke Apple protocol, so is unlikely to ever be seen on a BE
machine. But i am not opposed to adding endianness handling.

> > +             slot_valid = fingers[i].state == APPLE_Z2_TOUCH_STARTED ||
> > +                          fingers[i].state == APPLE_Z2_TOUCH_MOVED;
> > +             input_mt_slot(z2->input_dev, slot);
> > +             input_mt_report_slot_state(z2->input_dev, MT_TOOL_FINGER, slot_valid);
> > +             if (!slot_valid)
> > +                     continue;
>
> Shorter form:
>
>                 if (!input_mt_report_slot_state(...))
>                         continue;

Sorry, but i fail to see how that is shorter, i am setting the slot state to
slot_valid, which is being computed above, so, why not just reuse
that instead of fetching it from input's slot state?

> > +     ack_xfer.tx_buf = int_ack;
> > +     ack_xfer.rx_buf = ack_rsp;
>
> I think these buffers need to be DMA-safe.

Do they? Our spi controller is not capable of doing DMA (yet?)
and instead copies everything into a fifo. But even if it was capable,
wouldn't that be the controller driver's responsibility to dma-map them?

> > +             if (fw->size - fw_idx < 8) {
> > +                     dev_err(&z2->spidev->dev, "firmware malformed");
>
> Maybe check this before uploading half of it?

That would be an extra pass though the firmware file, and the device
is okay with getting reset after a partial firmware upload, there is no
onboard storage that can be corrupted, and we fully reset it on each
boot (or even more often) anyway.

> > +     error = apple_z2_boot(z2);
>
> Why can't we wait for the boot in probe()? We can mark the driver as
> preferring asynchronous probe to not delay the overall boot process.

A comment on previous version of this submission asked not to load
firmware in probe callback, since the fs may be unavailable at that point.

Ack on all other comments, will be fixed for v2.

