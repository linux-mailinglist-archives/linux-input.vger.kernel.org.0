Return-Path: <linux-input+bounces-7011-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8179A98D1CE
	for <lists+linux-input@lfdr.de>; Wed,  2 Oct 2024 12:59:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A54D01C219D2
	for <lists+linux-input@lfdr.de>; Wed,  2 Oct 2024 10:59:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 566D31E7676;
	Wed,  2 Oct 2024 10:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PZBOn4Re"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B3D320012B;
	Wed,  2 Oct 2024 10:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727866676; cv=none; b=pgYSSR7IRgpHoTZBUNWb944xhec/l8KA47JUEvzs2s+HgduTHNP/3DK5j4WIqtIkhj5oIbKjHj4xQtM7KrvD8B57avqoYVq9cx03y++UKTQJMI1wU94HnrpiG3froWpZNOnnAoniIucmVig7f2+4yDah/bPHoJwE5AnSn9yqWi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727866676; c=relaxed/simple;
	bh=YQOnzV0XzNWxQan5zPLtTbwkOceAW5d8/D+fOoQ522c=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LPn7ksSGbKpo4etsCDOe3zmW5HPXJnchjYO+KiRTvFfCC+sqNgctykmNCi5EjSxaVrfHJwvXYBfKOAYg80F9UpR1MvZ5sTsvk3O5SOKNRi5gxTefRq0wzqo5uDzNgAavpO/XqDdk80tp8W1Ouu3ZIrbp7JQV++qnYDACBSQ5Xd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PZBOn4Re; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-42cbc22e1c4so49162745e9.2;
        Wed, 02 Oct 2024 03:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727866673; x=1728471473; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=LqJIjH8EAYz9SJiVoSSFFxtTnEPgi1WsrXj6pJVb9LQ=;
        b=PZBOn4RebKeCna9QJAZIU9RRkSVtVVvpN/5EX582aDPYYx23H4ALyOy67jxWNx6nSE
         YOXIZY5yZpvvd8FCSjVFbtTpNIZ93qHolqYoTTEMH9xi0/w9zxFfxZfEc2+EoTitVds2
         vpdRexQQQkN0vhSB8XmluPSBQ59kYlMN+FkJcsp8icHYcPz1Z5WqwpoHsd1rtRKXjKBB
         OZTz5Zss7kjlK9isrBVX9ag5Xn4QMZnnb9pZ8ntVFqIqEZqLw3Ga5+nQNvMJj/GnfTW8
         ZXkwwxCZZa5ocTtMCbA1cC4FjErcR6Ch18WBY4Swdw0rcAMuBH3OWtZFx3TX2drAkxeE
         pgag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727866673; x=1728471473;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LqJIjH8EAYz9SJiVoSSFFxtTnEPgi1WsrXj6pJVb9LQ=;
        b=DgcYnFJO7OCeZXuUxtZrmpehHRlps9CC2be0KRfoqdssyu48a7nZ3uhFMDPXXp9haV
         lCGzeOz5DTVlzQt1zKaUfm006MovKTd1HLHztOydXj7msMXgCv8H8ywMDih4R5n1167h
         rHwVEhbykIXi8eZX0B5dQuqJxRfKl/VIgjaVvNpfbGB1ZZ/s8ACKorCNbDMfAoM+7HtJ
         jVX4elxLh3VNhDb163AkYaOq8zm/to3tlTXq1q1/0W1jARrO7obin9Wmah84ax4NFdCo
         B4yONUxePqcxNO/DkgvJEFqEK7rC47wJmd4pVaoWcNjWrczJZTZAHcGkpYKoL2iCsYWy
         HyzQ==
X-Forwarded-Encrypted: i=1; AJvYcCU1vjI6Lzl2GMz1yISC2ESeyyxFW6wHiFhHnVKYrqQzVoAei8Qlba7zc2a+Lvki9uPz9YySIajwgKJg@vger.kernel.org, AJvYcCUq+bFEfw+Mhy6nZEBqEKG0ExAIKQ7F/erPffVtvShMqybZGwrt90ttMp0hGRqLGuuRTzr07uhjr1Pu71c=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJASK3slE5GS5HxGC5cYYGSssjxjL6pPypJU8wAtyzU4QwCa7k
	N1H0jkf18af6I42tl7AdtDtzf5FVJTFf2pr9mZtXv48JC4RQ4W2J
X-Google-Smtp-Source: AGHT+IEoLF/7iglMe1HA0tHNDK0LB2NTOVqIdupICyDoDZyF5geFDh9eclSiBelxTgrNOBqi3CeNOw==
X-Received: by 2002:a05:600c:4751:b0:426:6308:e2f0 with SMTP id 5b1f17b1804b1-42f778f17c0mr18108855e9.26.1727866672491;
        Wed, 02 Oct 2024 03:57:52 -0700 (PDT)
Received: from nsa.fritz.box ([2001:a61:341e:1201:c434:b5b1:98a6:efed])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42f79fc9054sm15490575e9.28.2024.10.02.03.57.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2024 03:57:52 -0700 (PDT)
Message-ID: <8ed2076b0db95f5400d981facd58f98ddd5fdb6b.camel@gmail.com>
Subject: Re: [PATCH 03/13] Input: adp5589-keys: add chip_info structure
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Nuno Sa <nuno.sa@analog.com>, Mike Frysinger <vapier@gentoo.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, linux-input@vger.kernel.org,
 devicetree@vger.kernel.org
Date: Wed, 02 Oct 2024 12:57:51 +0200
In-Reply-To: <Zv0WvDCMH1-D1pdq@google.com>
References: 
	<20241001-b4-dev-adp5589-fw-conversion-v1-0-fca0149dfc47@analog.com>
	 <20241001-b4-dev-adp5589-fw-conversion-v1-3-fca0149dfc47@analog.com>
	 <ZvwNV4zor-MTKigP@google.com>
	 <22f246a0809e2d1fc738178400f8a3d67fc4dc56.camel@gmail.com>
	 <Zv0WvDCMH1-D1pdq@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40) 
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2024-10-02 at 02:47 -0700, Dmitry Torokhov wrote:
> On Wed, Oct 02, 2024 at 11:13:05AM +0200, Nuno S=C3=A1 wrote:
> > On Tue, 2024-10-01 at 07:55 -0700, Dmitry Torokhov wrote:
> > > On Tue, Oct 01, 2024 at 03:41:34PM +0200, Nuno Sa wrote:
> > > > Add a more natural chip_info structure and add it to the i2c id tab=
le
> > > > driver data so that we do not need an enum a switch() to get the
> > > > specific bits of each device.
> > > >=20
> > > > Signed-off-by: Nuno Sa <nuno.sa@analog.com>
> > > > ---
> > > > =C2=A0drivers/input/keyboard/adp5589-keys.c | 181 +++++++++++++++++=
+--------------
> > > > --
> > > > =C2=A01 file changed, 95 insertions(+), 86 deletions(-)
> > > >=20
> > > > diff --git a/drivers/input/keyboard/adp5589-keys.c
> > > > b/drivers/input/keyboard/adp5589-keys.c
> > > > index
> > > > 922d3ab998f3a5dfbaf277f10eb19e5cd1b35415..eaa5440d4f9e14352409dd880=
cd25435461
> > > > 2bf3
> > > > e 100644
> > > > --- a/drivers/input/keyboard/adp5589-keys.c
> > > > +++ b/drivers/input/keyboard/adp5589-keys.c
> > > > @@ -228,16 +228,20 @@ struct adp_constants {
> > > > =C2=A0	u8 (*reg) (u8 reg);
> > > > =C2=A0};
> > > > =C2=A0
> > > > +struct adp5589_info {
> > > > +	const struct adp_constants *var;
> > > > +	bool support_row5;
> > >=20
> > > Is it possible to derive "row5" data from keymap information to avoid
> > > having this fake "adp5585-02-keys" device?
> > >=20
> >=20
> > This is not a fake device. Looking at the adp5585 datasheet you can see=
 there's
> > module with 25 keys (without GPIO5) and another with 11 GPIOS. From the
> > datasheet:
> >=20
> > "- 10 configurable I/Os allowing functions such as Key pad decoding for=
 a matrix
> > of=20
> > up to 5 =C3=97 5
> > - 11 GPIOs (5 =C3=97 6) with ADP5585ACxZ-01-R7 models"
>=20
> Ah, I misunderstood. I thought it was a runtime configuration.
>=20
> >=20
> > Why its named adp5585-02 in the driver I'm not sure. I kept the same na=
me as the
> > i2c
> > id? Should I call it ADP5585-1 instead? Or even ADP5585-1-r7?
>=20
> I think this question is better answered by the DT folks.
>=20
> BTW, in case of not using row5 we need to describe this pin as a reset
> line for the chip, right?
>=20

Oh yes. I can add a reset pin to the bindings. And make it false for the mo=
del where
R5 is in place.

- Nuno S=C3=A1=20


