Return-Path: <linux-input+bounces-12680-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E74A5ACAC5B
	for <lists+linux-input@lfdr.de>; Mon,  2 Jun 2025 12:20:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2B25C189DB7D
	for <lists+linux-input@lfdr.de>; Mon,  2 Jun 2025 10:20:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B92891E3DEF;
	Mon,  2 Jun 2025 10:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="glJd32y7"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 053321C32FF
	for <linux-input@vger.kernel.org>; Mon,  2 Jun 2025 10:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748859605; cv=none; b=Wklzktv/xzVonm62FP4qSLmEvf3pou9hfXn7g9ENbPlegDk1l14TNnD2bdjlYbj8q8u4O8itUm+rHvLRfG+9ubfj6jo8An6Wd8RfqtQQjIF+3OrFxE0Kam8gRaRlWi8HdLxyhOWnD7CwF7sT4gUg+CT+w13Gb50Ro+ntJdgpJW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748859605; c=relaxed/simple;
	bh=NIlPs+ESOqsvDgZLDklVbzL9Y+PUvN6JpIx6y7pwPq4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sAeOoOiLnYnkkoL8uHDMH66/hUfvNJyF1SPGjjKbUwY32f2lC/x4ppMxHob1OSasoQ9dFfI6dWSvF5E7Pt0XAWarrfxoeZz0Ya/mSd55gxrY1lkxI+D9NbHipz3oDxZhlruRj3J1rK9pyoc1Mcr3mx36Udd7KKPnY+kdz3MG2ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=glJd32y7; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5532a30ac45so4269737e87.0
        for <linux-input@vger.kernel.org>; Mon, 02 Jun 2025 03:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1748859602; x=1749464402; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NIlPs+ESOqsvDgZLDklVbzL9Y+PUvN6JpIx6y7pwPq4=;
        b=glJd32y7JS6LNeMiz8W2iiR+4lp8rqB4HaSkUA9fbw3QA+94EYGJpBuwrGF0CdS8HK
         C/MXBHUP8tLJVidF521G6My2nYMPEOjOhwXv7JbBAO/JCYBEM/7+0DGdCxLqDYHCAdEt
         znyJWOGrKkyNnlBk4yksb2+cgm9MeTXuOQtaw8jckEUqTchTb8G7QIPfjVGYXsACyuxu
         s2bbpXAgLNnkDiObjQu+71KYhRwTybu4qtO4aJ2Qiv3X1371JOjBrrBG+NocR+0aiTy/
         zm6YQLKx/MTcj9DgXgY4my+rHnUVCiklwHyZuO92sjW2FijdR+IC3nNutUMCrZN1Nerh
         J3dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748859602; x=1749464402;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NIlPs+ESOqsvDgZLDklVbzL9Y+PUvN6JpIx6y7pwPq4=;
        b=QhPOKa3ep7GrlrhOdOfYq+2xz+9z0DQlxBpFcWWpDg2EJWXBmlCixpz3jIP2Wjc0+S
         snm36+BYKi+hcZSHh/PbcBBmAXzimOX2iStanHEPTT3vJwIsxL8jXVFhm6pzRsbHCdjT
         hf/x+HThWMSgD7+grp/UaWd0eWE3BQ3XwuMXRm8srR3Ibc/hKVJBKn/qv8o2m1fR3MvM
         mQwdiFWJwswXOcX0jp2/QEw+s3mFjQSDEBAYi8gdaMOWELwi3YDsf82ZzUkgfA18jeiW
         ulfAHTsjYgHqBdzSJ5HehO4KY32XJiAQh/usr8/g/FusSqqz4Oc7gFWBh1itg/+DmMeC
         T+SA==
X-Forwarded-Encrypted: i=1; AJvYcCUQSAjCT9cyYO0LxK/NSj0rDWY1RdWNnbhSzK9ERAkl/p9OzmDRf4hOv1orakZ4ZcpI6sfIVzzi9qTzng==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4CDg7hjP8E0rDhfdgAD0Uc2Q0abNE7fId9DVtdgItSrIIfM56
	WIknkt29eA4TjBwniq6IP516TfGsyCZGEWSHZQBh55HeBUbAjtkhC77tDfgTXuxRmcoxtg1VP7J
	VGsLDVSx4JB7wCW62nRXl22UB78WC2BHpfzox86JGsA==
X-Gm-Gg: ASbGncvLDMhliC+aq0C14j/4l7Gy2y/WABz7wuejfgwdcvt92/PvKc0T4xdmmpkTfBA
	CA9bhkQZM8enG0/RW6HoR48NDKjio5K7jo39MG2Q0u2VdPKeIQzmlQQieqszTjq2ASkiBKcvVMu
	z5/O3sFQrnXUzM1sSlEo+1INfwbb/1pqVHZazWqeXBLHM0txntNOvcn/zkHpDvQFbz
X-Google-Smtp-Source: AGHT+IGAtxy6GkCqOPbxv+uZc6VGUawOyddEURdLOtYulQAX/H29kqSWQGJzmIVuwy/b0vz39hl6HX77etZ58j+aC2U=
X-Received: by 2002:a05:6512:15a7:b0:553:278e:e64b with SMTP id
 2adb3069b0e04-55335b0aa20mr4535065e87.6.1748859602083; Mon, 02 Jun 2025
 03:20:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250530-mdb-max7360-support-v10-0-ce3b9e60a588@bootlin.com> <20250530-mdb-max7360-support-v10-6-ce3b9e60a588@bootlin.com>
In-Reply-To: <20250530-mdb-max7360-support-v10-6-ce3b9e60a588@bootlin.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 2 Jun 2025 12:19:51 +0200
X-Gm-Features: AX0GCFugojk72c7cm4zkMsB7ZrEhUkwTFOc5dkzcwC-isnDlIuPSAwn4kkDrnwU
Message-ID: <CAMRc=MfRZQE3dn38oS5Yteb19HbEhmfwyc+oDvDeP_fMg+ZpTQ@mail.gmail.com>
Subject: Re: [PATCH v10 06/11] gpio: regmap: Allow to allocate regmap-irq device
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Kamel Bouhara <kamel.bouhara@bootlin.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Michael Walle <mwalle@kernel.org>, Mark Brown <broonie@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-pwm@vger.kernel.org, andriy.shevchenko@intel.com, 
	=?UTF-8?Q?Gr=C3=A9gory_Clement?= <gregory.clement@bootlin.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 30, 2025 at 12:00=E2=80=AFPM Mathieu Dubois-Briand
<mathieu.dubois-briand@bootlin.com> wrote:
>
> GPIO controller often have support for IRQ: allow to easily allocate
> both gpio-regmap and regmap-irq in one operation.
>
> Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
> ---

Looks good now, thanks for addressing the devres issue.

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

