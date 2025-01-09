Return-Path: <linux-input+bounces-9108-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D2D8AA07194
	for <lists+linux-input@lfdr.de>; Thu,  9 Jan 2025 10:36:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D7237166246
	for <lists+linux-input@lfdr.de>; Thu,  9 Jan 2025 09:36:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EEDC2153E0;
	Thu,  9 Jan 2025 09:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="D8UIdjmR"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FCC62153CB
	for <linux-input@vger.kernel.org>; Thu,  9 Jan 2025 09:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736415397; cv=none; b=JezGXcEQsLgvXmhyEyyu4z18aK5cXp9LuS5IgMvWfX9pDzsux6FrlqPyLUpgb2Z7J+ZXKhhkX4D5bwym53SJ1Q73zHDKiO9AnZ0OJ2uXTXJyMLHNfi5EPnaykGPUs+ZOu3r4sQvujD0jAb4InCa7B6hYMw227LGkvM52/17YVBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736415397; c=relaxed/simple;
	bh=Z6/CDHN/zcoXGP+lKclKgH+DirmC4xDrK9u3xrIrtaM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CvDNf5258X0F2Pcg1OQq8z4No8R8H1srRyvHE+Uhnu6PFSklmdfJURcMQF9wE/dq1zJX/BF/8J9/RfxCZS8/XBMBIZt1cpB3uBFgZ1Rj2lKWguzoOT6oSpNIcEqHVxMFfngVbYuBdizB0cWnaUrvNODNTc/Wasu/HtQmZxUp1VI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=D8UIdjmR; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-435f8f29f8aso5447285e9.2
        for <linux-input@vger.kernel.org>; Thu, 09 Jan 2025 01:36:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736415393; x=1737020193; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XtUso14ULL9nN7Uvr1HqMgQfSyKmc9Bqb6q4CNgXNxg=;
        b=D8UIdjmR4kzVAdXyvtt8Kw84gYooWapRvxFVhmaFq15RP7WdCnY7+LFfFOy/l7F/ST
         MxQBsV7DPq122oIL3R6IwgJ4SvUgrT41UKhxZmRwmHjwvY+sWP2ZNR4cdcQ5hzG+/rpS
         G8m7Di/Bnx/jPQAX7jBLQACNqJBrNXqKSfSjglr5X6aKmdcqmd7guHVIaV7r0m0XPa09
         am8BUpLBzkR1B5i4HmfIBSG0JKEGyXNcrD9jbNd300QB81FDsksHZk8Hw5gZbAnxljWC
         VEgQ2tB8idN0+ynRsClKD0AmYqEPd2m8aONLsngWEEg/c2egziN3Snyj8RdD82xZNCIM
         9o3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736415393; x=1737020193;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XtUso14ULL9nN7Uvr1HqMgQfSyKmc9Bqb6q4CNgXNxg=;
        b=cnazmqmaoy1n+YCfOH5x2QaX49z/7aHEHDsYVmGtue6t4E+XjQa1FHdlR30dn1HMCY
         0HE2t0yHMLgjytZfS6b06kyP6+ecDggL+h4oSGzGvvcFbF8+dxM0WhD1F/qPEkktRpm5
         BQa6QW42Q/BTvwltfLMgT2n5QapACuQ1oVmPfrFNAgnOvQgja4L/CNFA8Irw6cPj9jqC
         aB+6+Gwz/1Tyw6EhchKKXyAPUGj1IjFzQDPiAKWhZDfehMCu0/0HbU2gjeZwXGbiaEXD
         eQHEYdDFrvOOzOsXm2GeBkknoIz7jqH0qjCE32YDzoTpoy1FOLadBIgkaKR/+Q40meT1
         Xktw==
X-Forwarded-Encrypted: i=1; AJvYcCVFJ/0oA6QKsThxlw9Ffhgf/6zvMQc4oN6PNx3enZ9TAc2jGnMm00i2FAdzXcZe8jWgLCdvJwYayPUCCw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4X+niDhp/QlNErQruGuM2JzDJyujpi1EqjE44DcmXBIrpmcLK
	akkVi4Wckr27D8fhj7iyjDmkp2q5XzOct3Lr9H9PjqZAV50rkcux3p6K9xqyAvQ=
X-Gm-Gg: ASbGncvF/iwVOWGv1Tgp84rF3ZpGzWOLvzhUifkkgbigapVr+1/vGGTUZ0uo+ZNqcRi
	jZz0ZjJjKtwN13F3uWJlo8FMiKXbuqwLVX76MvKctM/Q+IejCiV3B7/vjhJK/n7ppLWV9ujMqpa
	XiP+nS8Y1w+SgwOHA1QEIqAXRYnzHUVlDBo1/DR97gaOPG3YuhQyHzJpKupwrf7MMMi59/9vDu7
	4bqLPh2oEcyV/F2sbRUObH34iMp61mengIUVr8f+UAaBQc5uLQoq8mJSMmsSg==
X-Google-Smtp-Source: AGHT+IHLTTHPu4Qj1FuvwfYEIEMR09PXmepYGjsb90TVw1Wb3b2+29i0/leM6bpekCAjs9oYLJcmXA==
X-Received: by 2002:a05:600c:4f15:b0:434:f1e9:afae with SMTP id 5b1f17b1804b1-436e2676f04mr47677285e9.1.1736415393679;
        Thu, 09 Jan 2025 01:36:33 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e9d8fc81sm15011045e9.5.2025.01.09.01.36.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 01:36:33 -0800 (PST)
Date: Thu, 9 Jan 2025 12:36:29 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: qasdev <qasdev00@gmail.com>
Cc: dmitry.torokhov@gmail.com, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND] drivers/input: Fix null pointer dereferences in
 input_ff_create() and input_ff_create_memless()
Message-ID: <07395874-1434-476b-9bee-bcb786504ab0@stanley.mountain>
References: <Z36JJLAzwsFpggz2@qasdev.system>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z36JJLAzwsFpggz2@qasdev.system>

On Wed, Jan 08, 2025 at 02:18:12PM +0000, qasdev wrote:
> Resending this patch as I have not received feedback since my initial submission on December 25, 2024. 
> Please let me know if additional changes or information are required.

The bug isn't present in linux-next.

The original syzbot bug was already fixed in November last year.  It
was fixed in a rebase so it doesn't exist in git history and I really
had to dig to understand what the issue was.

regards,
dan carpenter


