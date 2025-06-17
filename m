Return-Path: <linux-input+bounces-12932-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B232ADD41A
	for <lists+linux-input@lfdr.de>; Tue, 17 Jun 2025 18:06:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 187843B72A2
	for <lists+linux-input@lfdr.de>; Tue, 17 Jun 2025 15:58:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34D7E2F2C7C;
	Tue, 17 Jun 2025 15:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=criticallink.com header.i=@criticallink.com header.b="jxQ9Tce+"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D9342ECEB2
	for <linux-input@vger.kernel.org>; Tue, 17 Jun 2025 15:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750175700; cv=none; b=WmIC8ub3hQ1ruMfvoD47+1Zt5h/f/WLbBCX6l8/zbXutfq6oJhX2n5dlIJplN9imDMQSIicKq4MZ7A1lX1Nqr7YwPNUUW+ON+XvhiiC0oz0E9N8mqktuaHgF6nRhMg/sww/gXeUzljgJSiQ8bBySi8/M1EIJ8/qTjYLlG4DJsE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750175700; c=relaxed/simple;
	bh=DgmeVtT0WIbCRRv339k+cmX+mpoOuUhSgcVes2asjCQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E4iFuxl5w61C6z1xCcc0Kx893Q8WzDKOGkwzCvvb2epyND5geB6f85LWP+9EzLvjSh5VAwYSJY92ldLOzXdXq3ZYs94amVDHSgguFoEtKLqR3ti8kmKS341ztT5CzFWU6XuW1iE1wFV697W3Qe++U2WMrVFbA4NWVCS5QIKbKc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=criticallink.com; spf=pass smtp.mailfrom=criticallink.com; dkim=pass (2048-bit key) header.d=criticallink.com header.i=@criticallink.com header.b=jxQ9Tce+; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=criticallink.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=criticallink.com
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-553ba7f11cbso3422577e87.1
        for <linux-input@vger.kernel.org>; Tue, 17 Jun 2025 08:54:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=criticallink.com; s=google; t=1750175696; x=1750780496; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7491lPqRbW4F9hQ07LYAxQPIWHZ/u23nfZ8i+9TOWv8=;
        b=jxQ9Tce+Jm5wydAE+OuBCHVuQVG+bAH3Sm5XzdurWqbrFXWfIsilRrCao2Lwc7dyYS
         Ye5p2yq90E0uOqclB+pPx7qpWV+ipmC44j9d4uqjVENB7L3bAu3YOGJfQLQ3BDFW/1vb
         gprBw6qNJM67wst981izx5UwScG4SyOmS6R2cavF/D8fe7LstSeJycmOuL7/4krSecPv
         SStSJzkdDHfBWVijZ9y1qoQEEckvbrgc6R+HXLRUtgREqMq0+4GsV5wSb8AbXZLuvaP9
         2uHDmROXWP43FzNivkbRLp6uwvQ3LG63XqIvr+PaaPLM34FAJkq7s2POHcUEbxXSPaL+
         P+ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750175696; x=1750780496;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7491lPqRbW4F9hQ07LYAxQPIWHZ/u23nfZ8i+9TOWv8=;
        b=OlrJ+jYTuzO36RaNrwN1cXxgT+q3tqPzSFagt2L7jDBo1EYgMXJDTVWROosBQHOV9y
         wbsTdumpDdTK+RfGpSk+CersNJnWBsmAKg894BBuDX5nzovUn05kgvYXFbA4Kcc4dD7Q
         LoclWNDPuYgLEqMR/3RGudopIbOIbjYI2RjmvDnnQXr/h0gwQdxR+0xt96fW3cKb5YO6
         uqhbekzL/dXDutukhRN/B/TEn8qR8y47qVou996uBHRowKXAYYd/E9K/FvHyjPmrKpBt
         O25xk9OejkeTJo/8VrKbpq4VaPfQHNcANdGBZ55RY8o4BH+Iw5Sxrq7UQd9HV9/ADj/q
         w21Q==
X-Forwarded-Encrypted: i=1; AJvYcCWhmEmS5EzASS2DXYEk79Ux+vT4MG6uApsDmhuiXizRMGGasbWHZ2f/l0qSbASkKKGqGQbvEvvPJiLBlA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzoqJSC/Ys2ciaVQkiO94yMQ7IkA8ujkchO80wh36Jyhv7H+VsS
	UnKl/Sfjnq54KBbzVqG4DuFQ8ekJzqh8WmQvADKBU/G53JJfYmBlOIlU6nj5lQXN5bPtEph4Sd/
	J619/IpmFcO8bAWZ2XF4RrJnLf3ThAs0V0Kaqr7rw
X-Gm-Gg: ASbGnctw2ds9tOlasEyjTf3MV6M4ZquRF0MrcfA2X91YoVp36L/15uEz3gqh9shcCYF
	ie6iezY7WpwbzTTvrconU4CVa+Bn40O8uHNnIVi4eSPcv8QnedyM7fU5AKmt0bfAW2dd2IUwwmQ
	7ti5CjJZy+m20y7/HBJZRD+WZ9GTCbBtJwA9kQc6AoiHt5pXYXVYcO
X-Google-Smtp-Source: AGHT+IHb1aCFJPoJFf9UDRiwIVaRVYSfkm4626qafulBbisD0pCHZaBHpY5By1h92m6KS0F+VPFALhCVjE9/87XOTQY=
X-Received: by 2002:a05:6512:398b:b0:553:3532:5b30 with SMTP id
 2adb3069b0e04-553b6f1377cmr3734810e87.27.1750175696058; Tue, 17 Jun 2025
 08:54:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250520-linux-stable-tps6594-pwrbutton-v1-0-0cc5c6e0415c@criticallink.com>
 <20250520-linux-stable-tps6594-pwrbutton-v1-2-0cc5c6e0415c@criticallink.com> <20250613140913.GF897353@google.com>
In-Reply-To: <20250613140913.GF897353@google.com>
From: Job Sava <jsava@criticallink.com>
Date: Tue, 17 Jun 2025 11:54:42 -0400
X-Gm-Features: Ac12FXyfNbK2pB7IPkCZD5SA804DLNcmvGU99uvVPgKiMdJy7x-SejG9WptqFuo
Message-ID: <CAKMwjwSuPRZO2Oyy56C-_QCf-gh-jcCmW_Xc8NCQ+yioRTumNA@mail.gmail.com>
Subject: Re: [PATCH 2/3] mfd: tps6594-pwrbutton: Add powerbutton functionality
To: Lee Jones <lee@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Julien Panis <jpanis@baylibre.com>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, 
	jcormier@criticallink.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 13, 2025 at 10:09=E2=80=AFAM Lee Jones <lee@kernel.org> wrote:
>
> On Tue, 20 May 2025, Job Sava wrote:
>
> > TPS6594 defines two interrupts for the powerbutton one for push and
> > one for release.
> >
> > This driver is very simple in that it maps the push interrupt to a key
> > input and the release interrupt to a key release.
> >
> > Signed-off-by: Job Sava <jsava@criticallink.com>
> > ---
> >  drivers/input/misc/Kconfig             |  10 +++
> >  drivers/input/misc/Makefile            |   1 +
> >  drivers/input/misc/tps6594-pwrbutton.c | 126 +++++++++++++++++++++++++=
++++++++
> >  drivers/mfd/tps6594-core.c             |  25 ++++++-
>
> This should be a separate patch.

Hello Lee,

Thank you for the response!

Sure thing I will convert this into a separate patch.

Best Regards,
- Job

>
> >  4 files changed, 160 insertions(+), 2 deletions(-)
>
> [...]
>
> --
> Lee Jones [=E6=9D=8E=E7=90=BC=E6=96=AF]

