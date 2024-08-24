Return-Path: <linux-input+bounces-5828-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DFC1695DE70
	for <lists+linux-input@lfdr.de>; Sat, 24 Aug 2024 16:35:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BDA2D1C20BED
	for <lists+linux-input@lfdr.de>; Sat, 24 Aug 2024 14:35:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6181E17A58A;
	Sat, 24 Aug 2024 14:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HINPEEL+"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A25B176AC7
	for <linux-input@vger.kernel.org>; Sat, 24 Aug 2024 14:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724510133; cv=none; b=NTGhFgXRu7BxEEBGtN4hHD2wdBOehnZsEg4jwqwQp81IfgrT8rU/6tOipTGZHipzKBjGj3TlqvKah68ZLog7vDm1QQg2EIdN+GlbjVw5i+WviXyzLxtUILBZp/HJH/oeSLgdrPk9Tu55gzoXLlVqmagT91bi9RfhlsYm9WPGAqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724510133; c=relaxed/simple;
	bh=NMDu/5QSUg1LBE+wu5+jR7p5r32ZQ7MycJQCvwud1m0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ufVc6C9GKOo2JJ0O9uHSeFusqZFkTPceTRgfJYkRPkHSrvXejxfFV4iq9O0TSm/S+ZRwP/tITdEI96pAoWXuKHacxzGhCi1ETQSLldvNIdkBWbCjvJ12ROGkmrGw0em3AWyulAGS3X6ZgZz5JJsbnCNJ2gmzIq4jQekrR9sONIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HINPEEL+; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2f3f07ac2dcso33757991fa.2
        for <linux-input@vger.kernel.org>; Sat, 24 Aug 2024 07:35:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724510129; x=1725114929; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NMDu/5QSUg1LBE+wu5+jR7p5r32ZQ7MycJQCvwud1m0=;
        b=HINPEEL+SfJ/fCL7iWjAkn/bVy7o+KzWFT3XLwjIVe8yLH9kQ5OsKYKVpilacVOqq6
         my4v2lBJoDvHzfCub9Z9eigOU8XPC2NHkThCEKO3WZTqcbRZH0KkvhQ470ESEsg1XYwk
         SkTxNzdZE3y13z4u1u2DQn9wY77TGOEr/DolOXHJnp4MQMDvUjxZDBuhc8nx2zGffAZp
         tfEP/7fN6RmvMgFmfUiR2dirJ+AbS/OSnt9lJ9vMwFjpsexe9T89IW9Db6x0czTTytxw
         15RxCFt0Nkg5xwVIycSq4/PPSIdn9lR813dt50gRI+oC3BDFeM07gUOG8p3x3iKBlilh
         k+Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724510129; x=1725114929;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NMDu/5QSUg1LBE+wu5+jR7p5r32ZQ7MycJQCvwud1m0=;
        b=tRxHShuhduNx9v0DcvkME/nsppK2Zc5rrm7NR0RZHYfKESMXNTEbzKfihXA4dDG0Bx
         YkhE6AOZoNKolp+O/j2dLdLCH1fJb4OarhhxvGdSS9G7SpVst3b/36Kk6ANh5jKxG8nh
         0OpKHaR5PypJxAbhUWdo6JXGrENHvaqHhFfs+adHWWxQj5eKDtvMLApeeIkxu8ogCr86
         0aFfNgCN/SarL/OV3bcrk4v4v8GPycSbr2pOmV/QL6OYNuZXxeWid7vPR90SeLmLiNY9
         gDLg3nCt70RWOE+d2lwpvjNfy5tgqH5ogwrFQmwj6ztlYisEgLoQcuPVBlk7u3mq4fXF
         bMsg==
X-Gm-Message-State: AOJu0YwIzok85+Zxwmre3Vr20i/66rrIwO2tLSFagHuPnJjw+L+erg3j
	LBYVVYHojrAOs9dA324C4sep5bDG0d4WFSqzl7W47r+DSryECrSH15+UJfdfrjZoWWeMfDCz2Wh
	mOpY6R5Vh0HEZXU386oZu0SdhrTJuXDeaQBvnUw==
X-Google-Smtp-Source: AGHT+IFIieYApikMakBIy2Y3QpzEwuw0mKiU5WA+zuD4+YWt0cV9QUkRkfcqBTE1mr46xvDnlQce1Ej5ZePV4LQMVhY=
X-Received: by 2002:a05:6512:695:b0:52c:de3a:839f with SMTP id
 2adb3069b0e04-53438831e5bmr2704242e87.20.1724510129067; Sat, 24 Aug 2024
 07:35:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <Zr-gX0dfN4te_8VG@google.com>
In-Reply-To: <Zr-gX0dfN4te_8VG@google.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 24 Aug 2024 16:35:18 +0200
Message-ID: <CACRpkda-0mh+Ds_KYWKqdf=Joe0yuirLrpcXhEzPNSsHXfbjZw@mail.gmail.com>
Subject: Re: [PATCH] Input: keypad-nomadik-ske - remove the driver
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Arnd Bergmann <arnd@arndb.de>, Lee Jones <lee@kernel.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 16, 2024 at 8:54=E2=80=AFPM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:

> The users of this driver were removed in 2013 in commit 28633c54bda6
> ("ARM: ux500: Rip out keypad initialisation which is no longer used").
>
> Remove the driver as well.
>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

This was intended for keypad phones based on ux500 and then
the smartphone/touchscreen revolution happened and it was
never used, it's there, but it's always dark silicon.

Yours,
Linus Walleij

