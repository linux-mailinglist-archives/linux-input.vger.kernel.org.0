Return-Path: <linux-input+bounces-10425-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E348A48CAC
	for <lists+linux-input@lfdr.de>; Fri, 28 Feb 2025 00:20:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2121C3B6A75
	for <lists+linux-input@lfdr.de>; Thu, 27 Feb 2025 23:20:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAAC0276D09;
	Thu, 27 Feb 2025 23:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ydAyX0rq"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9504276D03
	for <linux-input@vger.kernel.org>; Thu, 27 Feb 2025 23:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740698433; cv=none; b=h7dYm+jZwaHRxrR0ZTSqPg7TH6Qgdr5MWvu7AHGPPz3BvuPwV1wYscyGU49B+OEqbFy4PmfVloomr/lx+bg+KuCIB6dc49EXqxMoHWuaihz1KhVSpVkEyrhsfcirgCxAbtfuV8eQwKqzeMtLPKHkv/hbsd+Kp8NX/EZsdMJt0+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740698433; c=relaxed/simple;
	bh=F5gFWd7NyXBKKAhyQwBh6+sD2PO8dFaOkquGSGOTL0I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mg0CEGMKDJ/Y0Rv9bJgxqdkWl2MCbUnL9KXBSVQjzF++OKDWi1h+zA09uwFwslD3x9vn381o9/EBZK74UW6RuHEK28klDrv9yoOyFX+14NqFxumpVEJ5ZczNL4XRhQQo4EyDjE42blqef2ww9CI4dZ8QADETtpmYx7uoChKvP84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ydAyX0rq; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-30b83290b7bso17418641fa.1
        for <linux-input@vger.kernel.org>; Thu, 27 Feb 2025 15:20:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740698430; x=1741303230; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F5gFWd7NyXBKKAhyQwBh6+sD2PO8dFaOkquGSGOTL0I=;
        b=ydAyX0rqxF+fCL5DFU75Kco/rsfV9k6WY4TO1ASJLJnRRBua+4iriYMX825d21315K
         mS5QuZy413aAmsTzKAgqOgSUpdcoD5BgmvuCvTFAsiqvA2T4L7uy6Mc4RCGcgI+/BQEf
         /Aagsr4k5DpCdyamDh4wpcuTHM/v5NUmh0SJFvLnH/M0IKlwKtxzUIvtiYZqew5iulGK
         9hqQre+HivpL2tSLFZnc82g1mR269tjLhfNElixiYFQIKK0f3BhxmJbZVNymmbF0+yuN
         iZ0JS0LypFDrHXR0No1luBdDco87r6vz83z4+EWTnFOByNX3zeHwP6PvpYiBX0teaO54
         gEqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740698430; x=1741303230;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F5gFWd7NyXBKKAhyQwBh6+sD2PO8dFaOkquGSGOTL0I=;
        b=MsG2Ao9pMK1l4WykmuF4QX4tFHmHDX3RAKZfcSFNBfwbG+nmbZND/gZAjKIICPSPXv
         r1m+Yl4G1x6SNUxsD4hkw1uePm5XmfibWxHGiZ82UQ8/KoMgPiKRBdwvofEAKelV98g+
         U+8CWyUgbZuJiWLNEg2Jjeyaw2J/Qa8r9K5f1vuPaN4QrfMPB9vhFPqxj0xXUGafXrWM
         DXnnBCm1K9bw3TQhrRXmikOxDG786PfrsYrkvT0mpvy70gdie0MDEKcuyxpVjxWTC6Xr
         GHnJQ9oZQc0UQw5mBMV7NeykXQebXQidWCVLoj6cAuEpqOsrfeaVgRhWVRzxRXYZ2NyC
         FewQ==
X-Forwarded-Encrypted: i=1; AJvYcCUpTNHyyCpLAjKlHsGI96MQBvpqAW0HrkrP+thTbJMsfhyfGySEN6H8mhh+6ZZvFeZPzqKPxIgAEvjzAw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwMnyJg72bgNEWPrf3SJx9L7K8DK5eFWvX6HkfcfoMQkifsCfD+
	zUzloJK+yEzcskdjgVLiXrnfjkEeN7XDq9o2RDTWPpMPriwX/TDtLDSIpF4Qtzr+rgy08is8u9T
	cPvq0ayr6n7C3UdY7hmD3k2fl9KTcLuX/PnC1Ow==
X-Gm-Gg: ASbGncsOMGu/hlEJv8PUfND8yD+GgRZAzuPcfpi7wjRYi00Vls7WPgBNcmvqIgVfT5B
	d0CFMtVp5J7HA+FsztR6XXfPvjD0CtniK5nokZrPaSKoA7uELipKIFSt3vHGz9xtEsHPvnmrQgh
	NtCzIepdo=
X-Google-Smtp-Source: AGHT+IEk5RLYsoUHPzpYi1wiTH6QnjSPGHmuyXIkvEEGGR6cXNNFsRxuzVVGZXZ1pmZBSLNOo5vjsFK1Z56RwpC4YKU=
X-Received: by 2002:a05:651c:509:b0:300:3778:4dbb with SMTP id
 38308e7fff4ca-30b93212bcemr2482041fa.1.1740698429854; Thu, 27 Feb 2025
 15:20:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <Z7xGpz3Q4Zj6YHx7@black.fi.intel.com>
In-Reply-To: <Z7xGpz3Q4Zj6YHx7@black.fi.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 28 Feb 2025 00:20:18 +0100
X-Gm-Features: AQ5f1Jq6Kdz3lQwhwmGuCGSn9vJfu8ox17mGres4abdL1zClg4VTMDJv0wNWJsI
Message-ID: <CACRpkda19xw3YSO3wL4FaDVHz4KV5Vrp4vR7PSHn3yLqK20PGw@mail.gmail.com>
Subject: Re: [GIT PULL] ib-devres-iio-input-pinctrl-v6.15
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linux pin control <linux-gpio@vger.kernel.org>, linux-iio@vger.kernel.org, 
	linux-input@vger.kernel.org, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, Jonathan Cameron <jic23@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 24, 2025 at 11:15=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Here is an immutable tag of the "Split devres APIs to device/devres.h and
> introduce devm_kmemdup_array()" series [1], please pull if needed.

Will the pinctrl changes come in from some other tree if I don't do
anything?

Then I prefer to just chill :D

Yours,
Linus Walleij

