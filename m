Return-Path: <linux-input+bounces-7743-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C5F289B338F
	for <lists+linux-input@lfdr.de>; Mon, 28 Oct 2024 15:31:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 88EBC283488
	for <lists+linux-input@lfdr.de>; Mon, 28 Oct 2024 14:31:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F77D1DB956;
	Mon, 28 Oct 2024 14:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AAMg8Dnp"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 811DC1DD53E
	for <linux-input@vger.kernel.org>; Mon, 28 Oct 2024 14:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730125909; cv=none; b=OrpLu/HqMuEp0ODAzezKjr8+q/xMEQVjK7mvIC2p2OJ2s1N7YoWzndYe8ziYpGmN0WspvkbY0VPOMH0aqwzsPVFSGsWoSHlxPG8I1VkC8e4G8h0zi1ZyCmMJfiveZNK1lxwjeINmqROcK+Qki/prSI+dI+y3P6q8KDJ7rq7n5UM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730125909; c=relaxed/simple;
	bh=LK4EDtnpnDwZB2WqvhVmmMEuMgMTbNxkPsRQXkvj5nk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Gj/4IpV40oTj3mPHvt3qMJmTVsZylrFO8xZB/9uyu3rELqZJwFZMo947anZ4WIFg/MJILJMSI1r3jx5h8cEuk8ImA/Fso3IkHFzoezEd8eaojhIJ9EZgQ8NT+r4brj+rFIGT7aA4yE6oek9/0hBn6cxv6fghxw88sKontemCRno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AAMg8Dnp; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-539f84907caso4580619e87.3
        for <linux-input@vger.kernel.org>; Mon, 28 Oct 2024 07:31:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730125906; x=1730730706; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LK4EDtnpnDwZB2WqvhVmmMEuMgMTbNxkPsRQXkvj5nk=;
        b=AAMg8Dnpbc2OO7wlXCGTLMuRwVooe7gRuklr3btvT59TyadwPMnxoBoH7HRB9oqgKo
         em6iqq/QeBQBWBqjKihDMngwjewcxV7Fw4AMNyiAKIXxypTS5wTpzT1nFWE94bI+uuxt
         N4RKWg70+DFHvGIgWP+UKJS7zmcjfBOF4T01juf7FlNNivjEOaBsC+nfe1on0GiA2jFM
         PQCD6LXsKdcds8QmxuJ/bNeU+FRFqdlyK3xK8mTLzahM7CEq4v6d0S0Kb7ZTRuOOGxp5
         qPt9tGsHxKkyoxc7unA3YRBjERoGWzeDUqTFLWOKKT1TE93sff30/bWUL3ntEyrSgRSS
         lbpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730125906; x=1730730706;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LK4EDtnpnDwZB2WqvhVmmMEuMgMTbNxkPsRQXkvj5nk=;
        b=YiT186qyXKzp1m8my060ja32vw6uDgTTmWWu544LkIqLm1WVZZcP0ySFYAF20dAzMR
         SxY8ZYvH0SZxCoPgQk+PuEhv+PdznYmNb6nOtx7w+wnN+ZRdYFmDt35NdcWkfCFysO7i
         wnVlp1tBX8cI2unhLL48fjq8GsKQwhUnqb12bZo6hrA3T3C56JZWEjd0Snk8LyybyEBt
         s38Zq9XRovkgvfplYbaALDJiHNDim4w8f0EAGPVrureiZcI8ai+jPtPKGSNhamb+qy3/
         sPSXNCXesU00tJVlf1N6lgTuXh5NQEJg0q2EJ1vqisRQoWVHgZz8koSkDkBNgyDQd8fV
         BRbQ==
X-Gm-Message-State: AOJu0YxDElmPZcQz/66vNbKNunyhThXElsF8kOREWSngrngPBH3wTKH2
	vWZdk85nmbvqOSrJXpX9rQFJ66YbjDg1b5R4SB+bsllpj4WGXxXN29wiPPN0xBgBvK8OQ0pQR0e
	/Ml79UON9egv0dztRxYHVnBAgxyFznGxvKItU8w==
X-Google-Smtp-Source: AGHT+IFyUKwlV/wfF3YLecBexq3ekHk95aUb6Zg12n9/6ksn7osAJtYYNlIOOAAduSgwHV67fKeJqngOSyOovEzf/Os=
X-Received: by 2002:a05:6512:1590:b0:534:543e:1895 with SMTP id
 2adb3069b0e04-53b34c5f77bmr3321159e87.39.1730125905664; Mon, 28 Oct 2024
 07:31:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <Zxr4nF-igbrmgq85@google.com>
In-Reply-To: <Zxr4nF-igbrmgq85@google.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 28 Oct 2024 15:31:33 +0100
Message-ID: <CACRpkdbn=em2tTrAhYPhRyggjEK+O4QYMg4PrnHRibBhsAp=OQ@mail.gmail.com>
Subject: Re: [PATCH] Input: omap-keypad - use guard notation when acquiring mutex
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org, Tony Lindgren <tony@atomide.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 25, 2024 at 3:47=E2=80=AFAM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:

> Using guard notation makes the code more compact and error handling
> more robust by ensuring that mutexes are released in all code paths
> when control leaves critical section.
>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

