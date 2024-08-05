Return-Path: <linux-input+bounces-5333-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 33675947705
	for <lists+linux-input@lfdr.de>; Mon,  5 Aug 2024 10:16:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 64EF71C20C32
	for <lists+linux-input@lfdr.de>; Mon,  5 Aug 2024 08:16:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73F3914AD10;
	Mon,  5 Aug 2024 08:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yDIgjAjy"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB8F0143738
	for <linux-input@vger.kernel.org>; Mon,  5 Aug 2024 08:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722845769; cv=none; b=QwkauuVDyB6pjaz8bVUarlpyncPRdzrerx8iF+opTgbPNFqL7Yv4PfrMd4hF6AFbs14pplD2p31h3dkBkom1ee4F6+Lk3hhP3uRN/h3Yd9IFQska17GBFmVnfOUYnXpR2bAI5B48XAik0h3fkaICw8XTe+8tn7guCscVKXxpgvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722845769; c=relaxed/simple;
	bh=s0l4BMr1B1oQ2wxQZMWmEy5Qxbcv4jHmonN6e/ZZ7AY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e5Fl0HjsGRqwpaWZSthvDQddSQhAtKe7ir39jqVJ2BtMV/NwfUbQlSu09NcBuoJ2+QCqPdTkV2l+DiQj2bmfIC1Y7q0kSfqriqx1q5ULoY/nbFjoNG5mT1Qv9Eh0y2m8jYsocLTXl6DkN0aDJDNwR/5STIpju/J0gOGiiiGlAM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yDIgjAjy; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-530d0882370so596314e87.3
        for <linux-input@vger.kernel.org>; Mon, 05 Aug 2024 01:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722845766; x=1723450566; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s0l4BMr1B1oQ2wxQZMWmEy5Qxbcv4jHmonN6e/ZZ7AY=;
        b=yDIgjAjy2jskhaKJnwLbZya2F7nWUrMUEgiw4WPSAheYOhzlDdQ74/Ray9LU0urbR0
         L77Mlj/pjBYNE3Rj5Czj4vnBZZMGPdFOO1Pw5OZV1SviknB1yQhvucpGd3tho9kfqlEz
         1t3Ql+yG+mzwCH/ni8/BX6eOZ19fMrpAjOgGEexZg77ZTu/aKlFry/MlBb0BVBXhm8C+
         sm8AZCiGdB1z6v8CMPbjwJrPvR+J2nBQvXTxZvtx/CxB9nIPOZ7d5j06ZR3buMm4QxlL
         xl4k1kf+3E/VRFnQuQ3bDdW2pMroX6MbFLn573CNqj/Pb2HStWsgcDqw7RcA4/GUv1GW
         Cdag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722845766; x=1723450566;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s0l4BMr1B1oQ2wxQZMWmEy5Qxbcv4jHmonN6e/ZZ7AY=;
        b=drkvXJvthBVhcS/kExA78DStHoQGDDc9leGMD6VRJYYXiO9rC8onrt/kVYxiClFCYC
         w444Wn5i7FLYhwx9cChzfv4wqoMbWcLthM1pCpfiy0rsc17PPVkqePtPjRE7ieErL0JE
         THmbGEzCrngJ14gKswDe0sSNIhBBhnmeX9ubHGNwkmeasN8808ubjXoxDybStcD7wjyQ
         h/gjRRex8O75RAPIiRE2isTrq1tcM6CQ4jRszz8jcy4FeEGyxtUs26EJBfKStyJVSI0P
         a6TE4fJR55X6i45QwCbe+3ba9t5nWgw+6o1Vh91a7ie5Z0tcZi4Tp5lGUmYcgfDaykT9
         pzqg==
X-Forwarded-Encrypted: i=1; AJvYcCVNknRE6UtWKAzxIME+ArZ9XLThiJBNiF8Nvgu0onwVimwLjRODJXRWV1EdJkFirW4zDx01N9W1pXJQK9tP/dEqcGALQe0VVDFFycU=
X-Gm-Message-State: AOJu0YzKHqkaRkYBs2mm0pCOePUzyyeDvdViD3RExcAI/SxyTq9Ck8ny
	hWmy0Qcx0Os/IvxDep3VtrfArWBH2Z6FRC+K89jkDoR1PiQvP1+ilrgFc0a31j0v2F1e32tgS67
	gE8Qp5458xBNVIjF9kwkgn3WvRkIbiC4NpEJUBA==
X-Google-Smtp-Source: AGHT+IGUexCj6VshdbtjSrODpd0QaUTYrmwGB1cyypCiKha5sXzPdSUyZ0My5KvmjU1qwV/Qlke5GN0U/8cR6eEqqxQ=
X-Received: by 2002:a05:6512:3e7:b0:530:c212:4a5a with SMTP id
 2adb3069b0e04-530c2124e52mr4492808e87.22.1722845765730; Mon, 05 Aug 2024
 01:16:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ZrAZ2cUow_z838tp@google.com>
In-Reply-To: <ZrAZ2cUow_z838tp@google.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 5 Aug 2024 10:15:54 +0200
Message-ID: <CACRpkdatVEunoi=Erm9jYpBxKv+yMpjFUJGck+dd-VRbTJEz=A@mail.gmail.com>
Subject: Re: [PATCH] Input: cyttsp4 - remove driver
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-kernel@vger.kernel.org, 
	Javier Martinez Canillas <javierm@redhat.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 5, 2024 at 2:16=E2=80=AFAM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:

> The cyttsp4 touchscreen driver was contributed in 2013 and since then
> has seen no updates. The driver uses platform data (no device tree
> support) and there are no users of it in the mainline kernel. There were
> occasional fixes to it for issues either found by static code analysis
> tools or via visual inspection, but otherwise the driver is completely
> untested.
>
> Remove the driver.
>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

