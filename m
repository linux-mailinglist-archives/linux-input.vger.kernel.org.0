Return-Path: <linux-input+bounces-11945-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A123CA98807
	for <lists+linux-input@lfdr.de>; Wed, 23 Apr 2025 13:01:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 56D0E3BCA5C
	for <lists+linux-input@lfdr.de>; Wed, 23 Apr 2025 11:00:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5DB51E0DE4;
	Wed, 23 Apr 2025 11:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HhV/ai/G"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 380FEC8DC
	for <linux-input@vger.kernel.org>; Wed, 23 Apr 2025 11:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745406059; cv=none; b=ArOp9CiHFC0Y44X1FDBI7Gpb3ChMIYg4hIS0uZu4OwRw4Qy7CC3NBxqNUt7bp/0NmgZ9v1cQ+ph7bSvFzyEb+6C9VbAbUYAM8aHJ1TftzOrwXPmVOMuVIgVhH0lM0c1aJGm1l39ycuayCE1tZvrDWsq6a1VKPJnBDw/RoUDBkMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745406059; c=relaxed/simple;
	bh=YnfzKMEwLBYoy9n3/p/PzVFMeRhxGAjnJtCfLo3CK04=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q+aqIdDOu7DR4b0yn63LN2aO2sz2tNKftJV18yXYjdalbyHWv+V7FLMCCg4EKdg440sLOJAMa8q3SFNbnw3pLBgoo364ue3AEY7b00hweLGksQivhYM7HSDqNiFaIjl7B5hdbw4veXurbUS5qHCfzLSHWDUVBpfJnclolYpnZiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HhV/ai/G; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-54c0fa6d455so7191736e87.1
        for <linux-input@vger.kernel.org>; Wed, 23 Apr 2025 04:00:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745406056; x=1746010856; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YnfzKMEwLBYoy9n3/p/PzVFMeRhxGAjnJtCfLo3CK04=;
        b=HhV/ai/GZNfP0KshxWTOSpygdXV6n5HU1KBbQM/2ffGVjmDgv2W9aUbLM4Jc/B+slk
         ELFFg6+XRwmkqZFdTFBakZ4g4COw1EbC0OfEcxcQikk9RtTXLn0VioLfOcqX0t3W1psN
         /XLiqfnbv+jqJ7LsGoOqvqGWeADMezDebdsjemufxzy+Nwd5x1RJeG6WgQTcUiVcX3HL
         fZXf2XlJHyPqdysgEgay18H/l8zq+xYffJcPbHP5txcYbeY7VSjMXIdtfZa4VoOUJQF6
         VK5I30/rl5QK7E7UQ3eXJ1uMb+QXiv0LOhQmC+XswAvHOkm8d8Rg7FV7B8TUUl0KrUaV
         rmsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745406056; x=1746010856;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YnfzKMEwLBYoy9n3/p/PzVFMeRhxGAjnJtCfLo3CK04=;
        b=LAJsI+2OuDZnh3G0y0kdLLz9wTN8MY3vodacMdPm/LZc48/yPxXAgGVuU37qnvLK6g
         dPrVkspSIlttJu6FK+211xuB2u0c/i37p61lwMAb6GiMmPxN0mMXpz1nh+Mf1IaF6bpr
         mjz4TaUV0Km8gYcPzKGSkoy/aoHK83g75lfpvNdwsfmPREf0kybnsep9kZ00Gj7XVip4
         1wF4tQECTYa6xHBDwJt5Oqcp52RvIIjIJ0N5N9AyvS0cjNJqeKyW2MKwNTkd7F4pqnYU
         N3sxrRdXBQr04k6jSP8tslxQJIPQRwrU3EtlGLFg/eDadcSvQmjiKb0SbV6nc/IqN/c2
         U91g==
X-Forwarded-Encrypted: i=1; AJvYcCVVWx6jhveY2H9UWczXR4Uuy8PiOtarm/vK/aS89Fa3syUIA4GKMeR31/PpaVG8Q84byLHMBZ6NoYWTOA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyGRpMEU/OsXQMMIfHSTCOnaxE22cS+7fa0UbLVDDUAx2L5RThX
	1/3AxDhs5sk1vLBox9Do0L+YHRJmn2S9heOluwXIn9gKVZu1kUsQOgxJvA/w254cUnQKgy6W5rV
	nUP3e9mKUsgRMf21GSVFnEN4SQodLY6H3ObFQmg==
X-Gm-Gg: ASbGncv7xhxy/TOLK/Hyb9+Dsbtq3HOx3rXUX9okzksv+JShnWFTgAjaiabNADdsLxd
	eG3T3D3RXV6Zij+KZdoBy9iLEt0Lmr/BhDW9j2z62v2h29EbvyFTcr/F8LkzSc5p9z7Gihc/YXD
	TtjivkemIt3adkhHsJhsDW4w==
X-Google-Smtp-Source: AGHT+IHMCySz3z6SljYbbcEsFOxE9JkbCutC0ziw5S/nYiq5XuUyK8ef365iq8jZ7YlaLZiMtkJdFLKp9/dUsZ/eF3c=
X-Received: by 2002:a05:6512:31d0:b0:54a:cc03:693d with SMTP id
 2adb3069b0e04-54d6e61dd6bmr5088730e87.9.1745406056469; Wed, 23 Apr 2025
 04:00:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250423-gpiochip-set-rv-hid-v1-0-2e6762b582f6@linaro.org>
In-Reply-To: <20250423-gpiochip-set-rv-hid-v1-0-2e6762b582f6@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 23 Apr 2025 13:00:44 +0200
X-Gm-Features: ATxdqUE_gVFsHXxkj74AZEmclfvOPWvTaJ08Tt0ls6iGN_ulCw8C7P0a0FJrIas
Message-ID: <CACRpkdYdDPL_L-q2bofv+6wv53xSCsvOugt7+xE3oxX2=PtMew@mail.gmail.com>
Subject: Re: [PATCH 0/6] hid: use new GPIO setter callbacks
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, Rishi Gupta <gupt21@gmail.com>, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 23, 2025 at 10:55=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:

> Commit 98ce1eb1fd87e ("gpiolib: introduce gpio_chip setters that return
> values") added new line setter callbacks to struct gpio_chip. They allow
> to indicate failures to callers. We're in the process of converting all
> GPIO controllers to using them before removing the old ones. This series
> converts all GPIO drivers under drivers/hid/.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The series:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

