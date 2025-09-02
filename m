Return-Path: <linux-input+bounces-14412-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FC81B3F56D
	for <lists+linux-input@lfdr.de>; Tue,  2 Sep 2025 08:25:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 246FC3A2E0C
	for <lists+linux-input@lfdr.de>; Tue,  2 Sep 2025 06:25:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59CAC2E3AE5;
	Tue,  2 Sep 2025 06:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="qK7f/sLn"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B9E52E2F05
	for <linux-input@vger.kernel.org>; Tue,  2 Sep 2025 06:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756794299; cv=none; b=TTu81z3YZsClkwFH67t0IJ6kR3n4ESSTSSvGlU5wazgDmAFhJU20zFESkW9tb97CYjiWmVwbvi1MFgYTGeDTOoMOXE+ZHfb67tJfVGN1s6sc/FbuQ5NvUqck0EsHX3776u48QCIJvi94FjMeMe0kBHyQDNCg2rsfMXfhthYf0O8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756794299; c=relaxed/simple;
	bh=/X5tvcuJAxWn3JDYkNwSrjpsesfg6FURaUkJpV2ccGw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pyX5aSlwIyYWGMxukUs7ssrAoqnRbLfDR+VYk6sImowf2Di6LH+pkBoLaj3FPU90BCRikpgMmE6Ewkw4mb3A8v4sa+AMLnPmdzNJQj5wFcJVUZTego3mAZgfx0S6YfqJ3FlcN9Amm0BToPeUU3TIYYHtiaDawR9xsSHrcmmqIFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=qK7f/sLn; arc=none smtp.client-ip=209.85.219.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-e931c71a1baso6862495276.0
        for <linux-input@vger.kernel.org>; Mon, 01 Sep 2025 23:24:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1756794295; x=1757399095; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T7vWWxNzseg54QZAjivUxxK0pnJ4DlOhxfw0ykDICyI=;
        b=qK7f/sLnPoJeVQTd9FElwAA0Tl0UFyDF1bQ3sZBHacOoeGdsYb4Luai+0J+OTwpbSo
         JzAFychWDM2JZkQ0Fz6jMcEqvhesOXKBgivD7UCxyF0JcaeQxWNqpccxc8fPBCnDGZNH
         9Q68kGAWOAX/oc4yvr7gAi4FcQ/RgA1vot/hg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756794295; x=1757399095;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T7vWWxNzseg54QZAjivUxxK0pnJ4DlOhxfw0ykDICyI=;
        b=vJfVhHcP2Di6fb2aglDx/EEXk/EWMa8Rcj0S3zTRXBD33DREzwuhL4eIR0a4tUV+lJ
         mMjpfP7d5QTkL8waRX27blX7mDnloa6GvsC/EgzJkyzNCoFPyRcA+odGBnRxB0K4NImw
         TazRluUUM5P20BsGjRdR2NT4Ec93cGQpBATNwCsnzWJ3+7skao5QhahGc2dhFmsZqZNu
         YqNHzJxp9/ZB69cZegMMEMuFLFrE/HjAofK3C6ES7Aefye0aCpBIY2yMAD5YqpfjDiIx
         RbarD9p3Z0cg7P1LN47/a5ou62znvhLPs/J13w+svFkboMNVBDtfyiqKvxUkjQKMD4/O
         M09g==
X-Forwarded-Encrypted: i=1; AJvYcCXA67cMi4zbdfymOzg8gLy7rzVEhyMCfBgbdSXM5JLycyKNvcu/NmiJgEAxMnygyxVdh5GjZ8b1+9oBiQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyvYTWZ7nKYtrPmnrTBr3lHVFe4eHg7MG2wjk3s+2J0si9NJ19f
	sfLePQD2+AO5oqYIaUcv1UyxFs6n2Gk9kNB3VlOOZ1SkvCpQygjX8Ftl7SNejnIEzLN1LU3Jlyo
	XyE71vmoumb+d1dmFvjhhIJm5dKZ+eNaqFQzc1L1TRA==
X-Gm-Gg: ASbGncs19w59IsFxAxuhhWKMLwwTKONmhczbFoJhY6kKIrFMSZIY5O5Sy7iU9DHeYHM
	pDGpjkLpMfhcT5A9VbfrKfOmUjhuuItxdAMdphr1qrIOcGBKzjtCAMiBiXocfRLiA5mPgK03TWC
	G4lls8+AIzoFWLwhTQSqmyvZF4BQTWNTJugM3KByxf+pRDrkPLu3WC1IhJLyTB+Y6htQeyEFBio
	evrtltuv7OzdfCV
X-Google-Smtp-Source: AGHT+IEC+bhwfIsYKYd4OXHEYbsF24ESl19VnrU0Lm+wzyoJZpbOTOeMhCWWexm/yC9IvNQdZvyYLuGaB9Amv1jSkRs=
X-Received: by 2002:a05:6902:e03:b0:e96:ec6a:26c7 with SMTP id
 3f1490d57ef6-e98a567eea7mr11493602276.0.1756794295489; Mon, 01 Sep 2025
 23:24:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250722103706.3440777-1-dario.binacchi@amarulasolutions.com>
 <20250722103706.3440777-3-dario.binacchi@amarulasolutions.com>
 <20250723050319.GA1239529-robh@kernel.org> <CABGWkvpWPXz8bFPC3OgqY+C6cgu6hHGh6muCQkoCOEVK048fSA@mail.gmail.com>
In-Reply-To: <CABGWkvpWPXz8bFPC3OgqY+C6cgu6hHGh6muCQkoCOEVK048fSA@mail.gmail.com>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Tue, 2 Sep 2025 08:24:44 +0200
X-Gm-Features: Ac12FXxEccgAI8M5f9oOb9ii1ya7raF_SCejPp9-Hl3t92BIFWLzJIdX2D6ZhXo
Message-ID: <CABGWkvqazpyra=n5Jswon576pGG7yEOQg=_qdpTM+X6WmHP43g@mail.gmail.com>
Subject: Re: [PATCH 2/4] dt-bindings: input: touchscreen: fsl,imx6ul-tsc: add fsl,glitch-threshold
To: Rob Herring <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com, 
	Conor Dooley <conor+dt@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Fabio Estevam <festevam@gmail.com>, Haibo Chen <haibo.chen@nxp.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Rob,

just a gentle ping =E2=80=94 I=E2=80=99ve replied to your comments on this =
patch, but
I haven=E2=80=99t seen any further feedback.

Thanks and regards,
Dario

On Wed, Jul 23, 2025 at 8:25=E2=80=AFAM Dario Binacchi
<dario.binacchi@amarulasolutions.com> wrote:
>
> On Wed, Jul 23, 2025 at 7:03=E2=80=AFAM Rob Herring <robh@kernel.org> wro=
te:
> >
> > On Tue, Jul 22, 2025 at 12:36:16PM +0200, Dario Binacchi wrote:
> > > Add support for glitch threshold configuration. A detected signal is =
valid
> > > only if it lasts longer than the set threshold; otherwise, it is rega=
rded
> > > as a glitch.
> > >
> > > Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> > > ---
> > >
> > >  .../input/touchscreen/fsl,imx6ul-tsc.yaml      | 18 ++++++++++++++++=
++
> > >  1 file changed, 18 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/input/touchscreen/fsl,=
imx6ul-tsc.yaml b/Documentation/devicetree/bindings/input/touchscreen/fsl,i=
mx6ul-tsc.yaml
> > > index 678756ad0f92..2fee2940213f 100644
> > > --- a/Documentation/devicetree/bindings/input/touchscreen/fsl,imx6ul-=
tsc.yaml
> > > +++ b/Documentation/devicetree/bindings/input/touchscreen/fsl,imx6ul-=
tsc.yaml
> > > @@ -62,6 +62,23 @@ properties:
> > >      description: Number of data samples which are averaged for each =
read.
> > >      enum: [ 1, 4, 8, 16, 32 ]
> > >
> > > +  fsl,glitch-threshold:
> > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > +    default: 0
> > > +    enum: [ 0, 1, 2, 3 ]
> > > +    description: |
> > > +      Indicates the glitch threshold. The threshold is defined by nu=
mber
> > > +      of clock cycles. A detect signal is only valid if it is exist =
longer
> > > +      than threshold; otherwise, it is regarded as a glitch.
> > > +      0: Normal function: 8191 clock cycles
> > > +         Low power mode: 9 clock cycles
> > > +      1: Normal function: 4095 clock cycles
> > > +         Low power mode: 7 clock cycles
> > > +      2: Normal function: 2047 clock cycles
> > > +         Low power mode: 5 clock cycles
> > > +      3: Normal function: 1023 clock cycles
> > > +         Low power mode: 3 clock cycles
> >
> > Don't we have common properties for this expressed in time? Debounce
> > time IIRC.
>
> I tried checking in
> Documentation/devicetree/bindings/input/touchscreen/touchscreen.yaml,
> but I didn't find anything about it.
>
> It exists in some specific touchscreen bindings:
> - azoteq,iqs7211.yaml
> - brcm,iproc-touchscreen.txt
> - fsl-mx25-tcq.txt,
> - ti,ads7843.yaml.
>
> Only fsl-mx25-tcq.txt expresses it in terms of time (ns).
>
> Thanks and regards,
> Dario
>
> >
> > > +
> > >  required:
> > >    - compatible
> > >    - reg
> > > @@ -94,4 +111,5 @@ examples:
> > >          measure-delay-time =3D <0xfff>;
> > >          pre-charge-time =3D <0xffff>;
> > >          touchscreen-average-samples =3D <32>;
> > > +        fsl,glitch-threshold =3D <2>;
> > >      };
> > > --
> > > 2.43.0
> > >
>
>
>
> --
>
> Dario Binacchi
>
> Senior Embedded Linux Developer
>
> dario.binacchi@amarulasolutions.com
>
> __________________________________
>
>
> Amarula Solutions SRL
>
> Via Le Canevare 30, 31100 Treviso, Veneto, IT
>
> T. +39 042 243 5310
> info@amarulasolutions.com
>
> www.amarulasolutions.com



--=20

Dario Binacchi

Senior Embedded Linux Developer

dario.binacchi@amarulasolutions.com

__________________________________


Amarula Solutions SRL

Via Le Canevare 30, 31100 Treviso, Veneto, IT

T. +39 042 243 5310
info@amarulasolutions.com

www.amarulasolutions.com

