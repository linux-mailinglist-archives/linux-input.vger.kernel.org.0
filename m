Return-Path: <linux-input+bounces-3504-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F5188BD4C5
	for <lists+linux-input@lfdr.de>; Mon,  6 May 2024 20:44:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E871D1F22B8F
	for <lists+linux-input@lfdr.de>; Mon,  6 May 2024 18:44:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BE72158D96;
	Mon,  6 May 2024 18:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VVxgVWuz"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 012F44AECA;
	Mon,  6 May 2024 18:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715021035; cv=none; b=KpeVduOhVEV/ERlZBsV5zQ6PO9T6Ag03h4KwWb9NqmfFVBx8F1AQqnxHG2i3FiBiolJ+WmaBL6d1n0ylf+aadWlZwMzrFzzx3DMPMSq9IQChghGE8AtY6RWf101P5HxZTOlqOzUvq/ZBAPGa4H0Gp9Iaux/JY5piEqMYqxmvuxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715021035; c=relaxed/simple;
	bh=SjAYMMCURaX0+dhX9RQn0cnTZU/j27gh7PWnFEk+ab8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EsEl+eJqKrKuXqwxdiJfSloDL65MwMojEFS4fvxTD0+f4BXisobvow4OJbxLYblogkAbkb6ssQeP3YNcwVaMchxallH4igPkNBLbSyNbVPC+bqzXcfdBuixEau7OdhA1ihRC30Ng0qr1mM6DeXbHRoqzjxgOrQN2tn6EHk8ZcYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VVxgVWuz; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2dd6a7ae2dcso38851941fa.1;
        Mon, 06 May 2024 11:43:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715021032; x=1715625832; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qr+qysEHfAqmXZOmn1POXugpU0YxreOhrSJFEU0THm0=;
        b=VVxgVWuzr0xuZ1mnTJT+MW4K+ffituK/7USNlKGmz24lZs619yPM1Htz7PWQbg1C72
         BWaRRTXPQAnLVcqi7XqTUx6frOmelrvgQpKHN2jT5nLy2/fQ8gnaIpHYr0uD7tMPVgs3
         WhjZDuT5DK5YMNm3Kx462AU6iGE+Q4Kn44JgghxT8B5JUcCS1bvMKxGuZVw3IAZ4BJj1
         Nfzz7Zc/u9IPji8sJ8NdEmzgcGfjQJCDp83SgTdVzNS7LpWMMYlDoe6tRuC9jCsRQr+s
         4wS0n3YrutBzc4ipzBZdXggjkjXjzaOHYykG+oRran1nRIFAnRAf/NCx9S+zT7u/qyn7
         tS2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715021032; x=1715625832;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qr+qysEHfAqmXZOmn1POXugpU0YxreOhrSJFEU0THm0=;
        b=e4FT7QrTjcWOuJnfoQAb7s0ywIGVyehUrLgD5HjxYDy1I1hwT6zcKNqzjj1iDsan/q
         UDP//AqhzAWhBmi7i6zPXq/icOkf0e6fisrZUJ45KXGjFeZ1hUKRty9xO0gmIDipOA7w
         CumJGPHXA1NCS258Wm2qh+u56ODuk8CbBiJS7Ui/gZi2YLJ7mkUcNmL5cTIqB90yQQ/J
         ekGvJrrcMBl9Y+Azb3caIjU1XP4RhhUNI+1uUj4hparlZ1FPWfTOyQDsYCNeMsSjKbUj
         mf69DIXASNJV0OJKtWilUW2S2y5zb2tBPWWR0zRDIuu2PBVDxFlzJJfrKB3Kh0p/NaMT
         B7Qw==
X-Forwarded-Encrypted: i=1; AJvYcCW/2XXecI3j7ctUoUcdnOfnCtLppr5v1YLJgTF/Iff7hDjnVdtLIlLZ2wykZ862027HF7HXwfgV5cCqOQNddq/gjN6taff/5GwCgJxRz8lJH8I8mCwmt3lQktLGcNk++psaEDqYFTRD2vSslDmV929RSUObJ3l5fzwQoGsUchLgUJj19fNo
X-Gm-Message-State: AOJu0YweCyBKvLgwmUm7I+bG88wOLzDsrJIo0mJBVbmzbJX6jjSGfZww
	PX4Yy/ncXiRvAu4X3vJcdMT66bxwqQQmmnIJl2NZ5tYr64wrYfQtuyJSnFN0/rOXLU7Bqieun8t
	g7tPh/tRVGOujjCYRWcXe3CBBMOA=
X-Google-Smtp-Source: AGHT+IERi95t/Ei+7vR8pRyVjdKl796Yjlt/ZbtXfmRINRyR5DRRP1jEVzskgsDTX/AZhs2s0g0dDOGemWlVlWsZX2A=
X-Received: by 2002:a2e:7d18:0:b0:2e2:5078:3277 with SMTP id
 y24-20020a2e7d18000000b002e250783277mr8213909ljc.48.1715021031853; Mon, 06
 May 2024 11:43:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240505214754.891700-1-andreas@kemnade.info> <20240505214754.891700-4-andreas@kemnade.info>
 <CAHp75Vdnwrxw96prr9hyLdZ2u6t1uNcj6pyxCp52UoVOpatTpg@mail.gmail.com> <20240506182111.3c6673a0@aktux>
In-Reply-To: <20240506182111.3c6673a0@aktux>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 6 May 2024 21:43:14 +0300
Message-ID: <CAHp75VchLWQgmdxKPSbwH-m43zFHT9ADk4aH7-jvD5-MaVOtEw@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] Input: ektf2127 - add ektf2232 support
To: Andreas Kemnade <andreas@kemnade.info>
Cc: dmitry.torokhov@gmail.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, u.kleine-koenig@pengutronix.de, hdegoede@redhat.com, 
	siebren.vroegindeweij@hotmail.com, linux-input@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 6, 2024 at 7:21=E2=80=AFPM Andreas Kemnade <andreas@kemnade.inf=
o> wrote:
> On Mon, 6 May 2024 15:05:52 +0300
> Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> > From: Andy Shevchenko <andy.shevchenko@gmail.com>
> > To: Andreas Kemnade <andreas@kemnade.info>
> > Date: Mon, 6 May 2024 15:05:52 +0300
> > On Mon, May 6, 2024 at 12:48=E2=80=AFAM Andreas Kemnade <andreas@kemnad=
e.info> wrote:

...

> > I'm wondering if you are using --histogram diff algo when preparing the=
 patches.
>
> No, I am not using that, it seems to not make that chunk nicer.
> Yes, we want
>
> +       int status_shift;
>  };
> +
> +struct ektf2127_i2c_chip_data {
> +       int status_shift;
> +};
>
> But that is not shorter or simpler, just more readable.

And that's exactly what histogram is about. I suggest making it
default for the Linux kernel project (or globally in your
~/.gitconfig).


--=20
With Best Regards,
Andy Shevchenko

