Return-Path: <linux-input+bounces-13660-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 45FA4B0EA6D
	for <lists+linux-input@lfdr.de>; Wed, 23 Jul 2025 08:14:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 12E0A3AF622
	for <lists+linux-input@lfdr.de>; Wed, 23 Jul 2025 06:14:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10AB323A57F;
	Wed, 23 Jul 2025 06:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="GQY44s07"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA1D6248F55
	for <linux-input@vger.kernel.org>; Wed, 23 Jul 2025 06:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753251270; cv=none; b=QNEke4STEywfbNNdT5YTQXvNyCcCEC9QhMZr02JvznhJ8SGsrzNG2ln5L/pt9fJOD26UhC4UrAcsKrIcPp3Os86n5XEcEqvNjijjT/hcwnpGl450JsOoOlLmBPh+merfW/V2/dYETb6vGWS5bVjkTjOOs7+MINLQVTDlEyTzHnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753251270; c=relaxed/simple;
	bh=YxujTbwbI2eJLNA8ZAh79ndTt0XBy+IQ4GuCHo7fhlw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RgX4SF2ZuzhL66dtd++G7GbjQ9/bMoyLkxl60K+xD0Ur0aVXW4SXnUk95UCVs8Qdmq5qLcozGFr/yctBFa+NM29/3HoLNtyXuCiFOPIvZJtb+mLytBWneKTFr8lfznJoFhFzExuO6DJy1g7k1sGLPql2Cq9FBRW/2Ezkj1SmwzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=GQY44s07; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-e8dbdb68791so1503519276.0
        for <linux-input@vger.kernel.org>; Tue, 22 Jul 2025 23:14:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1753251267; x=1753856067; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/L2T2WbrDBkOj5NgHEVZycr71r0FjGHDnI1AHP29ZlA=;
        b=GQY44s07f/pj7DbnlRg6BJDP1eSBpkOu72HPH25qlnI2ayBulTgTuy/AftJpgR4tR/
         4f+p97WgjcpcL4TueHltdDKpyxw//0mgxLV9U6zxEHTSefZNdjqR/kPJCdmYu/zXJEyF
         LPvpaO0Nd4VfCKuakQMyJgaUysHzkIpkx3cJM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753251267; x=1753856067;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/L2T2WbrDBkOj5NgHEVZycr71r0FjGHDnI1AHP29ZlA=;
        b=rXLxa7RR6vb8KDLv450Ozbm6effrWxE7BtJBwDcp1msbGoPga/H1SfVHp15ZytbzXQ
         3dO5MRoD9piSeRfj2/eLzDPodVVmNPPpczaQej8/tG2S77U/Imbopua1vhA+GwdSxDXS
         TrNugYzVcj8MqT/Frg1BJXtZKBdZLt/Uex7Ik72aZyeILKBTBLu2gL9qc9sf2ywlXp4a
         VOh+z4CzBGcMlH9XNhCBQAvanGFplQ8ZPfSJhahtdK//+Z7D36lPamTHr32Jou6yK8jA
         KYqvnemM3aBcczAygF0LpilpOu/yHghDvabqKF2GXFUMNkZI5oHmYzSEgBY9n1Z9neO5
         LAgw==
X-Forwarded-Encrypted: i=1; AJvYcCV6vCiZYeILa8dMlbUfuboakh67vi8XTx/cdlrcmTsoXiXirsJedJCOEUJ67RRqZBG76Ws1s/GE3La99Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxbZjoLTpHrzmoHMfSoyRBJIiR71c4FkBp3uSQndb6V+Ccn7JVO
	9yvq+6jNtZ7F54v3WD5rhzeWke6UfgOVGxpX887nw8LspCCjNbVUiLmtIHjqaPUCx9m/jJo4131
	CaeSse+7kOI7HV4h9dnFOJG3D8iYV6vk5nVyNexDvJA==
X-Gm-Gg: ASbGncv30YrO46YqF85LV+OqbcVSCxL8G4gYkKjcFzvjdM2vc6tBXlfPel8pp4+Droh
	Ia6nw2ntZTcDaEeWYpiTcmNeEmrD0WuhlhdiJHq6rKWL9eHJULKhH0j5edAaNJmG6TQmKSqnORN
	skAAiSm4/aNCz6tqHxSTwL+SZTC3SMvxqkZ7/T55ioujgdOJonZ7mjb6Evt0HKKzhhg7+LOTgCF
	3TaWA==
X-Google-Smtp-Source: AGHT+IGU0x3OvvND31qkZ6iwUV66X3FjLoR9rEUgX0VQD3a1aWSZZ/aNnjUtca65XDKxhVdatJlHhz31Mn+Kuu8/LA0=
X-Received: by 2002:a05:6902:460a:b0:e8d:718f:cffa with SMTP id
 3f1490d57ef6-e8dc57ce7c6mr2095334276.6.1753251266610; Tue, 22 Jul 2025
 23:14:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250722103706.3440777-1-dario.binacchi@amarulasolutions.com>
 <20250722103706.3440777-3-dario.binacchi@amarulasolutions.com> <DU0PR04MB94966B1D445966C0E7C1BDF2905FA@DU0PR04MB9496.eurprd04.prod.outlook.com>
In-Reply-To: <DU0PR04MB94966B1D445966C0E7C1BDF2905FA@DU0PR04MB9496.eurprd04.prod.outlook.com>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Wed, 23 Jul 2025 08:14:15 +0200
X-Gm-Features: Ac12FXz0WI4bR7Hq_kkcybVAzkogiCFRyLtm4ogxkiM3lU26r-r_CiasJXOihmg
Message-ID: <CABGWkvpDY99-0FKi2VO+Pa4hSoEfFCAt7ZAgaVfeqqCqcOYWrA@mail.gmail.com>
Subject: Re: [PATCH 2/4] dt-bindings: input: touchscreen: fsl,imx6ul-tsc: add fsl,glitch-threshold
To: Bough Chen <haibo.chen@nxp.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-amarula@amarulasolutions.com" <linux-amarula@amarulasolutions.com>, Conor Dooley <conor+dt@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Fabio Estevam <festevam@gmail.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Rob Herring <robh@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Shawn Guo <shawnguo@kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bough,

On Wed, Jul 23, 2025 at 4:45=E2=80=AFAM Bough Chen <haibo.chen@nxp.com> wro=
te:
>
> > -----Original Message-----
> > From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> > Sent: 2025=E5=B9=B47=E6=9C=8822=E6=97=A5 18:36
> > To: linux-kernel@vger.kernel.org
> > Cc: linux-amarula@amarulasolutions.com; Dario Binacchi
> > <dario.binacchi@amarulasolutions.com>; Conor Dooley
> > <conor+dt@kernel.org>; Dmitry Torokhov <dmitry.torokhov@gmail.com>;
> > Fabio Estevam <festevam@gmail.com>; Bough Chen <haibo.chen@nxp.com>;
> > Krzysztof Kozlowski <krzk+dt@kernel.org>; Pengutronix Kernel Team
> > <kernel@pengutronix.de>; Rob Herring <robh@kernel.org>; Sascha Hauer
> > <s.hauer@pengutronix.de>; Shawn Guo <shawnguo@kernel.org>;
> > devicetree@vger.kernel.org; imx@lists.linux.dev;
> > linux-arm-kernel@lists.infradead.org; linux-input@vger.kernel.org
> > Subject: [PATCH 2/4] dt-bindings: input: touchscreen: fsl,imx6ul-tsc: a=
dd
> > fsl,glitch-threshold
> >
> > Add support for glitch threshold configuration. A detected signal is va=
lid only if it
> > lasts longer than the set threshold; otherwise, it is regarded as a gli=
tch.
> >
> > Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> > ---
> >
> >  .../input/touchscreen/fsl,imx6ul-tsc.yaml      | 18 ++++++++++++++++++
> >  1 file changed, 18 insertions(+)
> >
> > diff --git
> > a/Documentation/devicetree/bindings/input/touchscreen/fsl,imx6ul-tsc.ya=
ml
> > b/Documentation/devicetree/bindings/input/touchscreen/fsl,imx6ul-tsc.ya=
ml
> > index 678756ad0f92..2fee2940213f 100644
> > --- a/Documentation/devicetree/bindings/input/touchscreen/fsl,imx6ul-ts=
c.yaml
> > +++ b/Documentation/devicetree/bindings/input/touchscreen/fsl,imx6ul-ts=
c
> > +++ .yaml
> > @@ -62,6 +62,23 @@ properties:
> >      description: Number of data samples which are averaged for each re=
ad.
> >      enum: [ 1, 4, 8, 16, 32 ]
> >
> > +  fsl,glitch-threshold:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    default: 0
>
> Here the default should be 2 according to your third patch.

I considered the default value of the register, not the driver's.
If I'm not mistaken, the dt-bindings should be a description of the
hardware, not of the associated driver implementation.

>
> I'm okay for this patch set, let's waiting for comments about this yaml c=
hange.
>
> By the way, any real case which need to use other glitch threshod?

We recently submitted
https://lore.kernel.org/all/aGUDza5XRGDqfz5n@dragon/#t, and in this
initial contribution we removed all the custom parts that are not
supported upstream. This is
one such case. For our board, we need a de_glitch value of 1.

Thanks and regards,
Dario

>
> Regards
> Haibo Chen
>
> > +    enum: [ 0, 1, 2, 3 ]
> > +    description: |
> > +      Indicates the glitch threshold. The threshold is defined by numb=
er
> > +      of clock cycles. A detect signal is only valid if it is exist lo=
nger
> > +      than threshold; otherwise, it is regarded as a glitch.
> > +      0: Normal function: 8191 clock cycles
> > +         Low power mode: 9 clock cycles
> > +      1: Normal function: 4095 clock cycles
> > +         Low power mode: 7 clock cycles
> > +      2: Normal function: 2047 clock cycles
> > +         Low power mode: 5 clock cycles
> > +      3: Normal function: 1023 clock cycles
> > +         Low power mode: 3 clock cycles
> > +
> >  required:
> >    - compatible
> >    - reg
> > @@ -94,4 +111,5 @@ examples:
> >          measure-delay-time =3D <0xfff>;
> >          pre-charge-time =3D <0xffff>;
> >          touchscreen-average-samples =3D <32>;
> > +        fsl,glitch-threshold =3D <2>;
> >      };
> > --
> > 2.43.0
>


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

