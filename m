Return-Path: <linux-input+bounces-7978-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 65B319C1820
	for <lists+linux-input@lfdr.de>; Fri,  8 Nov 2024 09:37:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EED0EB22DA3
	for <lists+linux-input@lfdr.de>; Fri,  8 Nov 2024 08:37:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2A441DEFD6;
	Fri,  8 Nov 2024 08:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="J4trMXOC"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AF991DDA31
	for <linux-input@vger.kernel.org>; Fri,  8 Nov 2024 08:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731055045; cv=none; b=BTfzbCxtIhyBSdGo78JxwTNe9y/IUEYSxIGCLl97wOMQV7EnQ8ZY+iDxnNnbZlnQcpKr5eiUXSJ1Nji691MXqBCe3gtozzGceNURDDHRukdDM4pAf+ujG4vqxbreMDV74KyYykfBqDckjJa5vKd0726gZNxhQMMVSq0snz/0oyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731055045; c=relaxed/simple;
	bh=vVqCqej3UEHzQjSpv0v/eChyYMxhKtzxsLYbfjRtEsA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i4oy5yngeXnBAGJMsHex95RJpNOQLuH5rfkGgykqk8LoYwyDlgvrg4lRYkCO3in5+W6i9TsNNg4JMgsWzGpa69JNTe8HhAdlLgtHbOnwfK5PR/7B0/VQ3GkOgpvpws+Br0OvwDcZbQRYh40o6sb7reCy+jdVYF9Umh6WVswj70w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=J4trMXOC; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2fb59652cb9so17655031fa.3
        for <linux-input@vger.kernel.org>; Fri, 08 Nov 2024 00:37:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731055042; x=1731659842; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vVqCqej3UEHzQjSpv0v/eChyYMxhKtzxsLYbfjRtEsA=;
        b=J4trMXOCdlZotamJ1c9PSB5u42g2LpaT42W9S3lTMICufykI3At19WUB8nbWt1et5d
         NaYe/AsGBdmYZkz4swrG8HoiTFErd2BI8D5AFcOB/2alLSMoNRSa9cE26mzG89AD/Max
         DzIZXmCwfy+VvW/mKKbe85jin/fQo4C33Fs8mKaciNEKRDIfU32h8za1qLurF2nTksyk
         nN0ip+hDQX3o7U0aZoqFXaZKQn6l/E+rQHqND9Mhc2E2ZYkY/9vLvxvEh904Xa/zSEBe
         IMFLTrLCAt0yr24bnMOVw46yT5p4jaHLWggGbyDJ93eJB8WEnGB7UE1EtQHWNGT7MCRs
         fLMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731055042; x=1731659842;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vVqCqej3UEHzQjSpv0v/eChyYMxhKtzxsLYbfjRtEsA=;
        b=tfESDCLmqkDrtS39N33EF7Y+6XsFpjlwKp1Hfp84Xe8BDfO+55VLo6SjbRGBKJIE7l
         prB2W1yKFgQ2OnyIfq5CRAT1F8p6rMsJg5kWGXbvQvxY+w0R+a8XRxoLSkjcXxJ0rgn3
         LgMarqGuhXETds4ZoPuwieVTAa4zlvbz2qA8cKUKmyc11MR0XOoEIAASXeseroJDDb6M
         hVODcoFel4IfbPhrCguf+qpp22OIfncvNoUm/MV1CDAGc/PRMYEtS4LfHr8vLf1z9yAW
         Lhm/6vR63NGhtsxB7MVpJE3hT7Hy/ZZkSUG4ooWc7Ep8aQuxtOqQGY6IgTX47dXWwV+J
         Wirw==
X-Forwarded-Encrypted: i=1; AJvYcCWD87n6Gh6YiROGWnFkha+fEUmP/BB+QWlSur88LZjcNvFstMA/9rN4IF6MtlUyWTiY15faJw7ro/e+6g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxZGQN57p/gr0fHFj4T3/fL4twXVO97YFaAeUMpWIsT+0Ag3O2x
	3QTeIXwdTUbYiUSbb+4Uxy4mS7AOtOdDWWNvV/+My9t+1nGVI3BN0uKZiUN8MYTVZKGiaW+2GIO
	O3JsHdmvfNy/uqadZ9KKtVGso56o23aJ9WM4D5A==
X-Google-Smtp-Source: AGHT+IFNMbx//cYEjFKlLreQGe6KHnDtkiSUF8TkDB0AJS6zWunIMN9dfiGm3wfKDkFfc9lg5KxffwMABzLboCKR1AQ=
X-Received: by 2002:a05:651c:881:b0:2fb:628c:2580 with SMTP id
 38308e7fff4ca-2ff201e6d03mr10547841fa.2.1731055042295; Fri, 08 Nov 2024
 00:37:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241104093609.156059-1-andriy.shevchenko@linux.intel.com> <20241104093609.156059-4-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20241104093609.156059-4-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 8 Nov 2024 09:37:11 +0100
Message-ID: <CACRpkdb7gaYW3FXfqZ=E-yC6071LEiv8hnyMD4Hh=bxJ3BEdrw@mail.gmail.com>
Subject: Re: [PATCH v1 3/6] leds: gpio: Avoid using GPIOF_ACTIVE_LOW
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Tony Lindgren <tony@atomide.com>, Lee Jones <lee@kernel.org>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-leds@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Pavel Machek <pavel@ucw.cz>, 
	Dominik Brodowski <linux@dominikbrodowski.net>, Daniel Mack <daniel@zonque.org>, 
	Haojian Zhuang <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 4, 2024 at 10:36=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Avoid using GPIOF_ACTIVE_LOW as it's deprecated and subject to remove.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

