Return-Path: <linux-input+bounces-9824-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BF0EA2B185
	for <lists+linux-input@lfdr.de>; Thu,  6 Feb 2025 19:45:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DDDF516905C
	for <lists+linux-input@lfdr.de>; Thu,  6 Feb 2025 18:45:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39F5F19C57C;
	Thu,  6 Feb 2025 18:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MNGfUrI2"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D8F6239589
	for <linux-input@vger.kernel.org>; Thu,  6 Feb 2025 18:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738867555; cv=none; b=ONzYMB6JB3s/UfDZW3SauvbrjPol5YhIpkj1sr7vHfQhepD1nMDjtIU9A53KBTMRnVy+y6NChDJdWsk4cy4/tuDuq3iXWTZ2SUsht3uk9ze7XzclwJ9Vj1Ee0MAMMnM959RRNz0zRSeWRne4p62XTEkMe+N3IMFMb8Xi+3cft+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738867555; c=relaxed/simple;
	bh=Tjiel0WFtQD9YS5CKTSuxdiX698M0xiSfjn6FPVYi/E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Xk7tKwEiDVcB4Bi0N3mFqpcbofBKwKbHSY4pquQ/nfv2ZdBO24bd2yPDW3C5wqZ15RnndYxWmwZiO1wq1P8luiKwSbG8gxD9HCjNDhF7CxNUNWIJm60wf0PtEOrK59x/lfwaMYxdScM7xVsQptMynqAsJvQ5iNjtewvFVYa9eDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MNGfUrI2; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-30227c56b11so12739221fa.3
        for <linux-input@vger.kernel.org>; Thu, 06 Feb 2025 10:45:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738867552; x=1739472352; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tjiel0WFtQD9YS5CKTSuxdiX698M0xiSfjn6FPVYi/E=;
        b=MNGfUrI2QJjLfNL7FN95W/o+6bCjZO3TuTVKS0f/h7L8vxqPtufMVpe5cVSGAuFeUC
         XrcTHuvPW4sbPuylvaaCr9QxZWqDxEqJJq1yE51tOHtXCAJPyy1AF9MU7CZl5vX651pe
         KIqV8wLK3LpR83E7O8pmn5TBYQNJl1d6P6HFr0s8TYPMo+rLKRXy564CSNigirwGChsJ
         pEAcAXFTaJ8DQY4yND+4wSyAjp6uaL3UycX9G0ay2pVcBoMz+hFzBRFtIE+1u0q5+0yZ
         rIaqF/Ksa5m/oxkUqW80Srol1Z3ODQUfBcCxh+FxRewuVbqhsMf3cMgciSHN4ooCwjtg
         OOeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738867552; x=1739472352;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tjiel0WFtQD9YS5CKTSuxdiX698M0xiSfjn6FPVYi/E=;
        b=D3u0MxuKEY5xgG79RLoHdtobbrNT6vUc3+lIEmq/6ZdUQnNt+/z7mr+g6tAO+EAdr3
         17KEHVeMP6fwyzCsmTbaErFMO9BY28KLUu4Fgia91aCn+MJ3VbCFLJIt7ys7mJSciUXC
         Qw/cwwxSHdg6nY1VCRcZieC3vm/Tj3mic/3FPbWvPAPBJhddt4zZoLm+1WsFl+g9ONy1
         KRh9MsM3T1viW01K6jo8pVDP4PENA60xjqat/PBRwR58IqAGYlH9YnhE2N+xRjcPmB2C
         +xx1AKHwq4OqHLh997qNee/t5cYBcj4kJvV90712mpKfsdlKYKCiRnN9Pujf2bCtuZkH
         LNSw==
X-Forwarded-Encrypted: i=1; AJvYcCUU14tm9SIdJyebCB4JTrdjyXEVHAzspBJOiZ6Bg38cDIND5P2Bi4WkN46ZPjDIT+3h2RZy37gsL9hKiw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwDbtXBWSzEZA3ygTgcYMbordXW2VyllRazRAam2b0XfqXKDGnB
	LVGZs6zl6lt/isP2yLFwmxI8Kn2bIoyFDPSgDAhfirqjhS8VeDRYEB7HxNQRcscg9IW6KTx50tS
	JMO/KaxTIWrIEY0bmovN5YamL/LfJpgc2pyO1qQ==
X-Gm-Gg: ASbGnculV5sLDB8uqQGAdnZrruSsevmRfZDUwhanHlrR5mt1eqKaty7ur5MYYP/wEcY
	BO2ON/csyBpKaEnipWJIJeNHPYDDa3WDgGDTQsgM2D1lZ/ZALmDlsgp7sftH5f4Ng2JxxjOA=
X-Google-Smtp-Source: AGHT+IGpDLY6SHQ668oUnbFgq2auSN1gE3jhzoMa4jDVlTNizXykYl/yxJFI/SmN6Q4nixNkxOa7mlXWwfcYQBp4TGg=
X-Received: by 2002:a2e:b16f:0:b0:302:3ff6:c8db with SMTP id
 38308e7fff4ca-307e5a7cf4dmr162071fa.24.1738867551683; Thu, 06 Feb 2025
 10:45:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250203080902.1864382-1-raag.jadav@intel.com> <20250203080902.1864382-6-raag.jadav@intel.com>
In-Reply-To: <20250203080902.1864382-6-raag.jadav@intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 6 Feb 2025 19:45:40 +0100
X-Gm-Features: AWEUYZk2YRZtcaKVdDcLea0eYDsFvswTZJTr6Ycy-zr9WIcLxtUKOfzaSSPbXpw
Message-ID: <CACRpkdaWm7Lo125AsgyU3+p=WB3unVZFqvudVD53SSLESsT0=A@mail.gmail.com>
Subject: Re: [PATCH v3 05/20] pinctrl: baytrail: copy communities using devm_kmemdup_array()
To: Raag Jadav <raag.jadav@intel.com>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, 
	mika.westerberg@linux.intel.com, andriy.shevchenko@linux.intel.com, 
	dmitry.torokhov@gmail.com, lgirdwood@gmail.com, broonie@kernel.org, 
	sre@kernel.org, jic23@kernel.org, przemyslaw.kitszel@intel.com, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-iio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 3, 2025 at 9:09=E2=80=AFAM Raag Jadav <raag.jadav@intel.com> wr=
ote:

> Copy communities using devm_kmemdup_array() instead of doing it manually.
>
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

