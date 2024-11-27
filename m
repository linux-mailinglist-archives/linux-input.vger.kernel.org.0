Return-Path: <linux-input+bounces-8269-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ECAED9DA599
	for <lists+linux-input@lfdr.de>; Wed, 27 Nov 2024 11:19:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B2D602854B6
	for <lists+linux-input@lfdr.de>; Wed, 27 Nov 2024 10:19:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3375B1957F8;
	Wed, 27 Nov 2024 10:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C+ePnnc+"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC248188014;
	Wed, 27 Nov 2024 10:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732702792; cv=none; b=RL+GevSkWMNcsZmgm8OYFiCLtZBMv40M3gFF7Aw6nHq8GgWUbzJWIG4GgF5SW0+fEwbQjD7ebaskpE1eCEfxvj7Kg2RKWJnnla2u6V4oa1+fC0gyHGjKDjgpTJuwAenujkoo+HAgZKBcghEevGbDPmrw41/fmiW9sJ4fMSco+Ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732702792; c=relaxed/simple;
	bh=7UQTftw7QAt6/lAVbxDq9qH6ith2CFWANV32+FQ9m34=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rGxGdUzVr69/SWe7U3o+CsaER57ydL6EgQlD6ATAHZMsIeKzaE9Xooa+FoW92cgD6t6f9d17eS6n2Fal3OWvjNzyPGml9JmThX6mp+67ef3CByR9xTYYtuHc5kSjWEaV6YJg1biDLzBPm+2xvPgf4hrHQiOn9BbH3CHTttOg1XU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C+ePnnc+; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-e2bd7d8aaf8so6263566276.3;
        Wed, 27 Nov 2024 02:19:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732702789; x=1733307589; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=F4ZFZN9NxmPUE6vqicmzpkTPnRTjKFXzlxg+bLBGC5k=;
        b=C+ePnnc+Ck5qJb0IBFD80z8wTfEeDAoEqraybpNU0WFUeull6XKb25hFbqdiC6V6Wg
         puPDrK/B9dRcOdpNSmXfg9lIw7ycPan5JzXfoeWsMfGE3aAXaIr/DcCeTd4nHlVdceYF
         p9kcyBpKplP9QOTJi9oeOWwAhEC2JyIWy66Rpbs29rROxiDMTOJpuVnM+RFa1TcdpySx
         OnQubbN48JGfMhantzFFC7u4S48AnppSQSjj/N8CPf61J7c40lZo4npuiJfCRbyZjKJq
         LIDHVZ3nqnQpJ37i3zNuPRC6pdQOQhxGZwpwwTf4zVG6+d0FnlTX7HczRk0Dc9CcRsst
         8MUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732702789; x=1733307589;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F4ZFZN9NxmPUE6vqicmzpkTPnRTjKFXzlxg+bLBGC5k=;
        b=MkhDFIAQBePHi9pLAJGlMBOaK1dFV6Wm3FqINfwPg3buHC2PeiRG5D+aEu9H2S8Ztd
         MbIkuBnRWuwr7+wyT7ZCWy3yya1XQZcGZQP//9FbWaKaOLeIiA/xmonLVm9zfWbEnz+P
         8/2yDFYSCoekFUpqw2U5mN+tpcoQPwblZI1nkWGv21Ruy6EFmBs1Jjtvbw/warWFJcoZ
         MKRjz2xwcBkIvD6QOUMm9svcpylWcwBtVHFKvBGOwav+CjOFtVumOvRQJ4W5xZ2DKaIX
         UXxyazathl43jZOp6uB79gjXnMQJfvSrOSeRDRhE4wB808Vo3HojUJ/LvJuDR5B1cvnM
         baEw==
X-Forwarded-Encrypted: i=1; AJvYcCUheQ56oCU0BxwYw19gGagN5QpBT82WtvDrhV44rY/BKkrO8G8f/N/G9uGZRCqHiCUgpa/FdStfu26OTIY=@vger.kernel.org, AJvYcCVwnbmLp8Irjf872Hrxk5MJ2vwMriGYktiyDIdn1wn6MlsJ3z7JnRgfn6p7hxLuhbXQq+F8kn1QbxWC@vger.kernel.org, AJvYcCWCIBXPcu9eK9jtGRMpjuLgewh0zolbCqxU6pcgGt6pA16EooN0uuSw5ZpMo9V8MZQ7URLwgwQ7HPhshcDX@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7389j/q5sWmFFOFa6iFbKTpPTebkpA5bUOAOtpBnlu7265NPw
	CKi9uM+q9J+FNSaseUYhk06wTOhO6NTEeAk6L80YJoTsTk56pwpvNd4fn00q6P8Qrtkfeb7I2c9
	PSFUjtahqYqiXi1q1TO0ogLH2kFM=
X-Gm-Gg: ASbGncsUKKfL6P+ymkwV0B9eAa4wdU9mXFeLJDLPyCXuMxo9jpufMvDUKlTjmmrFQ9p
	VtTwYbzMB5Fle9xtaAa2O7mQsWP8mYM5G
X-Google-Smtp-Source: AGHT+IEYW50AkDoUBavXeClBq8yM9JWwAWazhdC2aIw8o67QfCzF5n/O5RVYRddcvSnH0Wwfl/8Zz40gZy3rpxRED/M=
X-Received: by 2002:a05:6902:118a:b0:e30:8440:8162 with SMTP id
 3f1490d57ef6-e395b8c279fmr2534137276.28.1732702789657; Wed, 27 Nov 2024
 02:19:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241126-z2-v1-0-c43c4cc6200d@gmail.com> <20241126-z2-v1-2-c43c4cc6200d@gmail.com>
 <27amnmlm52igidlv23h3d3bvaezbdumedfkqicbtreka3llhqs@fafepduxgv43>
In-Reply-To: <27amnmlm52igidlv23h3d3bvaezbdumedfkqicbtreka3llhqs@fafepduxgv43>
From: Sasha Finkelstein <fnkl.kernel@gmail.com>
Date: Wed, 27 Nov 2024 11:19:38 +0100
Message-ID: <CAMT+MTRTzPwo7QveP5Zt_4Zycu1qohe5g8srC8O8Jo+O+-wLJw@mail.gmail.com>
Subject: Re: [PATCH 2/4] input: apple_z2: Add a driver for Apple Z2 touchscreens
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Henrik Rydberg <rydberg@bitmath.org>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Janne Grunau <j@jannau.net>
Content-Type: text/plain; charset="UTF-8"

On Wed, 27 Nov 2024 at 10:00, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > +             dev_err(dev, "unable to get reset");
>
> Syntax is: return dev_err_probe, almost everywhere here.

Per discussion on previous version of this series, input asks
dev_err_probe to not be used.

