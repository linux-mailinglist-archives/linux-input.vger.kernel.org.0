Return-Path: <linux-input+bounces-5869-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC9B795EC62
	for <lists+linux-input@lfdr.de>; Mon, 26 Aug 2024 10:52:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7790728145B
	for <lists+linux-input@lfdr.de>; Mon, 26 Aug 2024 08:52:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FB3513BC3F;
	Mon, 26 Aug 2024 08:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lkNMvOxh"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C06F55898
	for <linux-input@vger.kernel.org>; Mon, 26 Aug 2024 08:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724662337; cv=none; b=MJPn8Y3LB89zytpXUTIrB38jYoKY2PUR48rFTJKsAAauax+ZMtZChCCaOQD+JAgsqvW+C/nQEY4aeRqzt2FLhn3cvaMkWYAEdxQkQp9+PBES+rjhNd5cMrcVHm/MNSgtcuhqyYeb0z3Ulq/rmbil8nV7YHtFMitRDnAfibyIaMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724662337; c=relaxed/simple;
	bh=iLPgq4j7K2LiYLxuRxf5ckNN955ctmmarm/caOOsssA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kshR6h580j915W6RRSe9VbqhVj671ZMLlE3wR0QRqmycgtyOEU1BvbQJQjElO48OZQ8u/hFEliNCU5fbQE8cyEadqJOjtedBqdIY3cMGT3KGI6z38pU/thyuZUxiUQGdNMA+YLcYlGE6BAK/MnY7ll9AwB/yx1/u72nE5xANgQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lkNMvOxh; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-533488ffaf7so5495067e87.0
        for <linux-input@vger.kernel.org>; Mon, 26 Aug 2024 01:52:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724662333; x=1725267133; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iLPgq4j7K2LiYLxuRxf5ckNN955ctmmarm/caOOsssA=;
        b=lkNMvOxhXIswR4nnZFnAVWjtCk2qP7x27k7mbQQD0h34Aw5Ahyalv4H029ZKjhDKPQ
         EdvLHffOZqCKyvPkm4WYu+CNLKQAnte++YVmBLPXXuZI4WOm6R0LJGKh1lzbKh3d2Psc
         zBYQiQhPmiRnhDMmPQ7v9oyZYE3pnH8dpYRMQvO27Bu9HY89mmJjoP9ovSVZ52Fc08Jh
         AQ2+MNoWF9fI2SJOewN/D0yuDIX271s04926jtON9z9Z08ecwGggN8uBwdqDUcGxF1ZP
         X8SKMmEWUqLxJsuRmOPqfgJz2P+qJlc//URw8b+s6VPetBUtU8CKdUoYHm8WlFT6U9EE
         gJvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724662333; x=1725267133;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iLPgq4j7K2LiYLxuRxf5ckNN955ctmmarm/caOOsssA=;
        b=rRYuf/BNgpFogEMEz/ELAjFjqrZQfe7ZY3LrRhdt2d2DE9gRn7Jrnu3DFwUHgFb+rI
         w6S+SdXzIkw9qTQf7I4H2fgtO0drwS5/sIqXlyERejECxqvwBvS6HJEZPHcQpgH/JvU4
         QIDFnOzEVUJB4fE/DqjyXDswsviNgdlgiP6XeXoEFuUaMUu9nsTGDr01DGdbyMkRtWIx
         2eqsftyVoweOkMEJFYGlMz1uUNyQLVSdQviQzFyKzmwtotifljf+jXjdMbMP7PHoW3TT
         I7S/kFgz9uqw/uv4Hgcq+FksH5XKhHTf8qSaM39tXiFHLzYWP/ujrrd/no6VUDFj+RHz
         HjCA==
X-Forwarded-Encrypted: i=1; AJvYcCXQafGFfe/mwgppHrZs+LRnKe/KSE0seTGsYCsPAGgzxro0LdxgOon01+DQ5d8eZCnzR5UJLFQ36tmjFA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6+/7iUIuhUu4WpUxbm+kxsBbuFHVWmqhqqCv/APZXUwpNMh0s
	11+bjUzrgao7FsDkAY/4VF7A++SqmtIeSGxjhBFe2w3tKYsrgrXiRE3y/B2CgTqlTax0STWjtgO
	VymuYP+wJKnZNvausYYPODiTGgk7Y+pwlaYPpGA==
X-Google-Smtp-Source: AGHT+IHdurCu1h8I5sDDWlcStXgFvab4u4dfQ3BDVkKhxSBCdaAQCimGjSbIMIoVyf3zCgPHH//JMjG8dg09AgOyRLc=
X-Received: by 2002:a05:6512:334d:b0:534:375f:97de with SMTP id
 2adb3069b0e04-534387bdfc1mr4983010e87.58.1724662333113; Mon, 26 Aug 2024
 01:52:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240805014710.1961677-1-dmitry.torokhov@gmail.com>
 <CACRpkdYFc8vuz__7DkFSMFxUC=LSwCJmEun2KXgUvPMq+_e17A@mail.gmail.com> <ZsiygIj9SiP4O0OM@google.com>
In-Reply-To: <ZsiygIj9SiP4O0OM@google.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 26 Aug 2024 10:52:02 +0200
Message-ID: <CACRpkdZ_y=2WKCLwi5or-=MasvNw2bcxht6a+bFjV=yAfvQhdQ@mail.gmail.com>
Subject: Re: [PATCH 0/5] Remove support for platform data from matrix keypad driver
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Haojian Zhuang <haojian.zhuang@gmail.com>, Daniel Mack <daniel@zonque.org>, 
	Robert Jarzmik <robert.jarzmik@free.fr>, Arnd Bergmann <arnd@arndb.de>, soc@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 23, 2024 at 6:02=E2=80=AFPM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:

> I'm glad that we agree that we do not want the elaborate merge process
> and instead push the changes through one tree in one shot we just need
> to decide which one - soc or input. I am fine with using either.

I'm also fine with either, but let's take the input tree because the
you're in direct control of it so it will be easier.

Yours,
Linus Walleij

