Return-Path: <linux-input+bounces-1381-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 79078835C73
	for <lists+linux-input@lfdr.de>; Mon, 22 Jan 2024 09:20:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 324A2282E26
	for <lists+linux-input@lfdr.de>; Mon, 22 Jan 2024 08:20:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 385EA20DF7;
	Mon, 22 Jan 2024 08:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yNg12Jq0"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCDC820DF0
	for <linux-input@vger.kernel.org>; Mon, 22 Jan 2024 08:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705911609; cv=none; b=t9ZRKuhoUT2/HwZQo1B5i0QkcCzZfcxLEwixQZAsrmRYIBrHlgeZXvpGwSU5ybp9MbsGz+873PeAvNWOMAMhajMCGnRJPdQZyF+WG116njtEN9SBhosAEd2idy0L3btZ3erjoo9emHLZ/w9h72PwawMS4EnAXP8F1xv0KnMQdAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705911609; c=relaxed/simple;
	bh=isDe77D2iQvn55U1/z57KKJud4YSPJiujYGyL9CMF28=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F/2AP3cuvvl79ve+9w+WwTDXEzmLCQ2wqnLYLs/mKv5PtqS3LHDMoTV22NV2UHOuXifWUGGZ5uo/Tz/MZOxjxOaqSKh56JFuzd0Phxpgb/BFhFT+kQQJZBK2219PIXjdIrQ3/4j7j+edaHeKng2lx3IpzU/JTzDb2W4k3p5wVIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yNg12Jq0; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-5ff84214fc7so25356187b3.0
        for <linux-input@vger.kernel.org>; Mon, 22 Jan 2024 00:20:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705911607; x=1706516407; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=isDe77D2iQvn55U1/z57KKJud4YSPJiujYGyL9CMF28=;
        b=yNg12Jq0OjH/xqi3+tUJ9zj2qTgX8hBhK2jYjb2mScduou4IX0K3l7pEMG4g7/letz
         u9QfFxEmhFWwcP3h82bO8F1BbhS+/LVPSAFI6ueGEJOSjlPWndsD1UgvkBC7GvO/QnKr
         QUTekXeHUFsMl3f2Wi/nT5UVxpW5/BfWypW68hQPEUOWLFvcqNPlclTac+LncILNJd9d
         Kxcws3Ze/yaze6bacIWkLw+08EGLaCiSv+8WCu+z+JQGJpZMdKRkjsL3HAVFZJRBXcjv
         q4HTwJXPnRO1wsi6MZsvcvLIFej7Tzewi7eQncYa3RR4GRK4iCr4BpGZbiRHQ54Q6C14
         atGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705911607; x=1706516407;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=isDe77D2iQvn55U1/z57KKJud4YSPJiujYGyL9CMF28=;
        b=ihrbe9DEr7AfXNK7TX/0+jbejf8XDr99MUdLLANSGXql95ibtBt1s9RAxKHREeHTtq
         2Vrim0S3oqffM1p5nW0WwplobIiHQXqhveb+0pNA6a6xr3v9Y+UX28bqpw3aoxn0Wb53
         MlISRKRbITb8kNMpXh5AXO2BbaUQ7h/8zUW/3KQPa5ROZin2Efkd6yBm/mJvGeuV/KO2
         mVluISJBAEEYLEilYiufjiRkQ1Ua56hn6QugIECGHj78ijnbM7KBoLVWiQXLQAOsdml/
         4ROlIP+nxLXjtzpBHopXToJilgAvSayaG6JlmySFKsAzGoR+teC3C9aIZVwwLozT7+7N
         mg4A==
X-Gm-Message-State: AOJu0YwuBPeXRkhQQ7FXImBOnzsbF/S5h7N6B2D+HaJT7fKcL46XyMBO
	yFjokKfjHj/7ikVz10pv6TuXja6Tp+liEIbQqDkuBUEXV9UByE9nwaQEnwBP44AJtXioVCEa/4w
	TmL0wenQl4C+knlWXv5443ICEuaJESHQ/ELSNwg==
X-Google-Smtp-Source: AGHT+IEDIu6tz4zc7zLNjO22lhxaAaUhf1UZ0shhNc0RxwcPSI9HNppAZHgchwGKFX+SqDSpztPQxnGIdvmwIPPAy7A=
X-Received: by 2002:a81:9185:0:b0:5ff:53de:dbef with SMTP id
 i127-20020a819185000000b005ff53dedbefmr2552068ywg.11.1705911606868; Mon, 22
 Jan 2024 00:20:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240121053232.276968-1-dmitry.torokhov@gmail.com>
In-Reply-To: <20240121053232.276968-1-dmitry.torokhov@gmail.com>
From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Date: Mon, 22 Jan 2024 09:19:56 +0100
Message-ID: <CACMJSetrYPaXOr5abHtP1mjsyH3nB3=6CwxWfviN1BP0rhgEhg@mail.gmail.com>
Subject: Re: [PATCH 1/3] Input: matrix_keypad - avoid repeatedly converting
 GPIO to IRQ
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org, Dan Carpenter <dan.carpenter@linaro.org>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 21 Jan 2024 at 06:32, Dmitry Torokhov <dmitry.torokhov@gmail.com> wrote:
>
> gpio_to_irq() is getting more expensive and may require sleeping.

This is no longer true, the relevant commit was reverted and I have
now a working series where I'm using SRCU for lockless list traversal
so if anything it will actually become cheaper.

> Convert row GPIOs to interrupt numbers once in probe() and use
> this information when the driver needs to enable or disable given
> interrupt line.

That being said, I'm not against this change, though this may not be
very useful after all.

Bartosz

[snip!]

