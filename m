Return-Path: <linux-input+bounces-9825-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2314DA2B18C
	for <lists+linux-input@lfdr.de>; Thu,  6 Feb 2025 19:46:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 389F4188531A
	for <lists+linux-input@lfdr.de>; Thu,  6 Feb 2025 18:46:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53D7219DF8B;
	Thu,  6 Feb 2025 18:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CH4Zibz3"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3E9E189BBB
	for <linux-input@vger.kernel.org>; Thu,  6 Feb 2025 18:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738867576; cv=none; b=nnTnQ/p4bEdtC2x+2jgib1b7bgT26w3OwLrsMku5EKsANxNfjha/MbiyQdhN46hj1ewATJbMRmbFBF6rXsVFFUf0rqx9b8ESMAwG9hgsHKQhobYyz6ClHIW/7wy90smTYFcbtRcAkIhO2KwPP21ztvVBbCfxMdsS/THErolS+Cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738867576; c=relaxed/simple;
	bh=P0zr8OoINeTGs7g0sjgckyXehEfeKe5nFPFZvgr4A7s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HqDDMoFuLTDQ7LImdxx+OV7xDsJetFJs8VlJYmkPWwhL9Or6bksNLk869mTJ5670tfpabx73N6ghx3N+b9AUfroxlIKx3BRln2x3NGkr1iby4Wnm3aQwk+DtRtgqZjIoAmrnwq8829HZXFbX8fiwN/auHUIkKUBuTRY5NIHKMNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CH4Zibz3; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3061513d353so13185411fa.2
        for <linux-input@vger.kernel.org>; Thu, 06 Feb 2025 10:46:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738867572; x=1739472372; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P0zr8OoINeTGs7g0sjgckyXehEfeKe5nFPFZvgr4A7s=;
        b=CH4Zibz3rE/F8+bMJiLzPz9S648Z2CCcv89XgbX1wwyiN6yPAERszqO6a5iBq7Z/D2
         cBdLYbFcA3laP1BPi8GqdgP4tKrvkBp0UlNaVBYUQKxKm+3FQ7kzyQ4I08q1+9wCffGq
         yX+CW3LVwHS/ifU6xvcAAHXEhpf9I3AFY4R7uLqnrHCHS++ZPjE5PXQWVztZjDGbJ6vV
         obSK705XFKPpSXCcq5DhCmaQ/Mchv21LOwNQDFmwO37qKgUGhjcFWyPcBSMcfARY1omi
         MzCVbXw/IUlFoMt+DvqHRiNTGPedgW9SrMeR4H7sR+8P/6+vezHA80xcbaORMqKpd9c2
         YC4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738867572; x=1739472372;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P0zr8OoINeTGs7g0sjgckyXehEfeKe5nFPFZvgr4A7s=;
        b=tDIAOhi6RDUMbYRuPanIBxS2LC+NQ+2nUzwYc2cVafZcLIRrsandBFVt5PuxWpw06p
         xDDwzOF3kigXEDIIfN9I4GP2FuQdGu+p2IArl2xTsAMU9uHFKgX+fJh4/+inSMzq+u8F
         0S3UmAwWCKfCjOGqYIZLlNPbpKKs5+HyTXQeE39bFWouVW8cAEW7geaHi68mmMq5Hs3R
         RO+202kj5G6d8ABw4CJNl9V+A8T5kH8VLYREssmtIp4gqsUkPEt4TWH8n00DgtY7q/7r
         HxCrDeZxYTjDeiOts06btnNdoeQndwbieoC/CvnKi8Hk4YzX4L+STlLcPwzKfIemSI6W
         4R/A==
X-Forwarded-Encrypted: i=1; AJvYcCXfTPGHPpYxtSGO+ANio2RSLNm3k+hs1dFdYRNxv0XYCb5wQ/ZsTASSM7keULzs7bJCAxQcMHUmJdsdvQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzuUU3RrKMp3CN214ZoZdMWUQdAMj+xdMBj1UFluRa8sJv/sllp
	CrCT9J7M82CIcKjZ0Nlcgy6mhGx55qvGYi0REsH1WLktl6wwpOQGtKbQLJ6iSgapEs/lQ7fQdul
	uFs8tozzWEn4+eWbdh/d+y8lhs293/rbUhuIGIw==
X-Gm-Gg: ASbGnctx6LJCEU4cmyobexe3T9gLKHhmsR5QA3Jrx+RRNe4XeRbVlUgPtjNMu0q//4A
	hIcb/APaJY2lMFbj86bGBhhmzoYo9+cdru4HFHmWrOP7iARHlG8TPp/7pRgsbc6viqccK6aQ=
X-Google-Smtp-Source: AGHT+IHBXbEvo18HjmPufvQO4GaXJoRqBewEyheRHSK0Q9zbSI8UBYUsHoznNfcnvv1UkIJfoaGthv9VJSF8FinRDdA=
X-Received: by 2002:a05:651c:150c:b0:300:3a15:8f2a with SMTP id
 38308e7fff4ca-307e57bfe60mr399971fa.2.1738867572121; Thu, 06 Feb 2025
 10:46:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250203080902.1864382-1-raag.jadav@intel.com> <20250203080902.1864382-7-raag.jadav@intel.com>
In-Reply-To: <20250203080902.1864382-7-raag.jadav@intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 6 Feb 2025 19:46:01 +0100
X-Gm-Features: AWEUYZk4bNNQBgH3TVFhlaeZ56ai3rTQMhsJjvQoZClT9barbrFQxRtMdamD3iI
Message-ID: <CACRpkdbDOH4gRcJFLeqhg1Aj3BR_SC0_1Odbi4vs-Oi70rTZ9w@mail.gmail.com>
Subject: Re: [PATCH v3 06/20] pinctrl: cherryview: use devm_kmemdup_array()
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

> Convert to use devm_kmemdup_array() which is more robust.
>
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

