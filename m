Return-Path: <linux-input+bounces-2938-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E7D3E8A1713
	for <lists+linux-input@lfdr.de>; Thu, 11 Apr 2024 16:23:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8726E1F21733
	for <lists+linux-input@lfdr.de>; Thu, 11 Apr 2024 14:23:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5756214D70A;
	Thu, 11 Apr 2024 14:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ZIaEiIWe"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C85E214D6FD
	for <linux-input@vger.kernel.org>; Thu, 11 Apr 2024 14:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712845422; cv=none; b=YnGA05ylLjfWFjhjVY7yVhs2r/4Pr056M5h1m76KPZJCl0xdZpK+DT7/3jPq5Gwyfbk+Wg6CZ78UNRx3PQqiURZmKDRfo3p1kKnHyTRWHEEhoM1f5D/EEB8QFG0Anu425MnuXuYbO2ZWZb02znEPeAsMm/x2LwWyjrNw49hgK0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712845422; c=relaxed/simple;
	bh=LUtbADJQAYJxj/Ogfyr9IscI3lkrbxOS5D0BwfwnczY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r1Rzj8y4G6bfAMWNFzylb+L2YaHnUtspvCMWbrkbSKahBITS2w8PRqlQhMvEkrVio4Vtw67lDcGnb6cWSjDx6LwxZvPIBeKOY+4iYJbXrdgCK2S2bmdyLGBpeLA0e4octC6RtsmygqPrxlZ++0xG4HPZo8yw30yX8XqbAfGZGN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ZIaEiIWe; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2d6fd3cfaa6so96800111fa.2
        for <linux-input@vger.kernel.org>; Thu, 11 Apr 2024 07:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1712845419; x=1713450219; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LUtbADJQAYJxj/Ogfyr9IscI3lkrbxOS5D0BwfwnczY=;
        b=ZIaEiIWebG2vtqDM3ZAa8oK7bMvVH5yIqVL1dgs+McEuEgzuiF0D0iFY0WKrWOcSmU
         fq0FhbTHU67nMtnFX2Ix855HUg4nQCA4KtJZc6l5HfrVvjT7q33OKbiHlP0Q6rItep9q
         t7JjgT1Nf/0gTgyUneHkrQiH8gkVnc5Jf+cVc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712845419; x=1713450219;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LUtbADJQAYJxj/Ogfyr9IscI3lkrbxOS5D0BwfwnczY=;
        b=CHm7cNuxJExdM3qwtVJSmkuQbtEXKDzG12Fk80AiIeMNqLkV0jhCZV3I6/aajC84qh
         rfBP3K2n0U2GHDSwQctuw/b3rN9S0Tgt7DE+YDE+Atp/+uu5rXiiJe6jiZGvuoRb78Q8
         NJLiDQV09qr6nsdr0VskcwF/Io4uYcdDlXW0WklQWkqLhVf7rPV5zr4uB1O3/zp6w1SE
         9MgJ94pbGEZGeCyMJ63VbvsTvsYMSAZq2GXTt9q9yx3C0RK/Zj4XP8jVBUI/Sa48yx2J
         3W5kckD5y80KNI6Z4rxqXU8B0ImrFqmZJsjX6F9E3nzQgYG+tcax8/5SgdGF2rtUynv5
         rZgQ==
X-Forwarded-Encrypted: i=1; AJvYcCUF3iDoV+7n/qhbq1ZfAznir2ECwu+IfpiTF5ZJxwoG16pkFqVCeRHpUeGwoDxt8XiXZq1kCCSO4KrX9qNL9ekFbT/bTe1VZlqb1LA=
X-Gm-Message-State: AOJu0YyHkElJPTzW+cnSX7nNr2nXf2OGeO+qGk+hg0p3jtFp+rOPiRLV
	uDIYTeoVeKmOibF2TQiXgJLOCBrBs8lmV+zW4veja0gGmq0PM80J9cU2Xn1m/4j1zDVok5GfDjI
	V3IDmmu4h1Zam/ZDiDe+3MColZFuslElXDb7A
X-Google-Smtp-Source: AGHT+IFNVcyx8krFZBQPjsFLg9xfCidm6tFM482BIiTiDZp8tHCIzPhuHhKYCeZTeFT6FNZdUnqtE+lVlPb3l1XeNNQ=
X-Received: by 2002:a2e:7d12:0:b0:2d8:7200:38ff with SMTP id
 y18-20020a2e7d12000000b002d8720038ffmr3769523ljc.24.1712845418803; Thu, 11
 Apr 2024 07:23:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240405102436.3479210-1-lma@chromium.org> <ZhOccGFkTFkUkRUI@hovoldconsulting.com>
 <CAE5UKNqufWZfKLAXLcpBYKQpJEVt6jPD4Xtr=Nesh34VkNOETg@mail.gmail.com> <ZhVix-HJrqQbiPrB@hovoldconsulting.com>
In-Reply-To: <ZhVix-HJrqQbiPrB@hovoldconsulting.com>
From: =?UTF-8?Q?=C5=81ukasz_Majczak?= <lma@chromium.org>
Date: Thu, 11 Apr 2024 16:23:27 +0200
Message-ID: <CAE5UKNp3uS9cqDbQjcP3SbfxVi3wPFG4LtP6z=WU_V+M9x6LtQ@mail.gmail.com>
Subject: Re: [PATCH v2] HID: i2c-hid: wait for i2c touchpad deep-sleep to
 power-up transition
To: Johan Hovold <johan@kernel.org>
Cc: Jiri Kosina <jikos@kernel.org>, Dmitry Torokhov <dtor@chromium.org>, 
	Benjamin Tissoires <benjamin.tissoires@redhat.com>, Douglas Anderson <dianders@chromium.org>, 
	Hans de Goede <hdegoede@redhat.com>, Maxime Ripard <mripard@kernel.org>, 
	Kai-Heng Feng <kai.heng.feng@canonical.com>, Johan Hovold <johan+linaro@kernel.org>, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Radoslaw Biernacki <rad@chromium.org>
Content-Type: text/plain; charset="UTF-8"

> Sure, but what about other transactions that are initiated by the host
> (e.g. SET_POWER)?
>
Somehow it is problematic only on reboot and works just fine on
suspend/resume and
set_power.
I will dig more and try to find out what the difference is.

> Perhaps this hack at probe is enough for your use case, but is an
> incomplete hack and at a minimum you'd need to add a comment explaining
> why it is there.
>
You mean a comment in the code ?

Lukasz

