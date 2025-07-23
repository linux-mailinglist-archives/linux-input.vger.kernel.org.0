Return-Path: <linux-input+bounces-13661-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E26EB0EA94
	for <lists+linux-input@lfdr.de>; Wed, 23 Jul 2025 08:26:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5F5A33B833C
	for <lists+linux-input@lfdr.de>; Wed, 23 Jul 2025 06:25:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 540AA26C3A8;
	Wed, 23 Jul 2025 06:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="Pe2ZOYTI"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D93D151991
	for <linux-input@vger.kernel.org>; Wed, 23 Jul 2025 06:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753251958; cv=none; b=UAb1h2WdaZULMyTIaebUasfjSXwNCe0vY2WNrcIY6C0R2TCqD+jViA45zBZLDl6ASluwzE2/d2Bd8VwE6V8f0xeCD1JGz+A2GVteQgPgmMr/rhdlTvTR6VaeM0kT7vaSpFIYXgjy6GqqKBC6KaOunEuzlPl5ylEhRXQ488v0dBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753251958; c=relaxed/simple;
	bh=rjVLg+Kx2yGpOGWAmrHV1jRFLlfqEIuxLIrSCY7YtLM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GQ28zsXvqFwr+ZVpnS86lMktnuGXpICMouSwWBQvGF2mLEyatfXLB+9q5mqHl/xyCP0ItDUrgieHv6S6sbzAX4btCLv6fPaKTPBfF6H1RwfPLFuljA86hqYFFts+PaoebdgjVlY0crY4u9ImWAGF7IxZjOe/iXwX3306lHK1veQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=Pe2ZOYTI; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-71841a48502so51859327b3.2
        for <linux-input@vger.kernel.org>; Tue, 22 Jul 2025 23:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1753251954; x=1753856754; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kGZYO2e54F3r+OK1iTp4D/RkgP/MYmQ/jepAEaRz8qU=;
        b=Pe2ZOYTIsNY0e2gzz9j8lfioMzePQBIKpEcFXEaUkrYANP4GoMInB0FdHQq++5CT+h
         OsrvzOzuocLBjtwTAhihBZz+XqB4SAaNNfYLZoejkZHjo2HVMBfXExXlL26IJ2tH31bK
         0Xf9BxK1PHnjDAPjlI5yYcAOyYwQBrE50Jt0E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753251954; x=1753856754;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kGZYO2e54F3r+OK1iTp4D/RkgP/MYmQ/jepAEaRz8qU=;
        b=HPALLibz+GIItP3v2lp2NOyldOaerbmZEtKRahlnXu+lkJNOKL42XlY0mpwVAblEKq
         g7Hi9+RNgZfwyu0sOrH0/xHWQMHWUi1nEJfy4agjh0Y3UWZReL5k7tTSBQpgstWLwXJ8
         jDv6StFMKIL+f0d8BpjZH1XbzTMOU+MqrGOOYTFyBa9nK/OtavGgCds5G2Sm1Bg9jAy+
         oLZv1uQ5bWFyJ6iRx3WJbZuBEVKdNLi3drwRjayvcH8b3OYffW2ibTWiGEXr5dqdJILK
         nukj+ajF4iTuPeMOa2zsFiRDs//48hE2SVxVC8w2L6xcfL2qEVSafsQeWjP6kJMUUG9M
         42dA==
X-Forwarded-Encrypted: i=1; AJvYcCX5Y5FuMVKwQ14erpC8i2XqlJ1CS+9t4YcoS+S6diKi0OFigiCIYaXh3tELkOzx5mlTRy5E8kKEXzHDrQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YySOsmc0YoZ18DD89scO6wfUreLHrqy/lGOdNVeVRKz283v60s9
	536jCh9xnbj7lQouS0XzyZqycmxFjbwBhiqf9+O3HN+mso9wy9jMrw8vFFerO8GxQ5cbrrXpJYA
	WQn3SHUYPlwEM3d8fZIZXuxfKDxLHCxxE/fMJiIpo1w==
X-Gm-Gg: ASbGncsBnIJkCBqye6QdafNGHdbhKm5zThoYaGDZzU9wPHFEo5rOkbksE8NFz24hoIE
	XuLKnS5DduhzomlSzQ9glwFq5oyby21W1h8GQD4iaS2TeTxnLtknM3YPzO392CW0bSJbV0kXi4c
	wA/BV+6/0jahKp6lPzUv1Hkp7KVfCEhMswGlV+k95sIyuEQhJrbo4+yxe3/YKdaXa10rrnIsSQ/
	sLZRQ==
X-Google-Smtp-Source: AGHT+IHv5nL6qViIs6gJAMz6sbFRUndksqf/qf03+nefju0bAxUOnsbQF6PtkZC5WvhFVsjvSryN5UHwWNkVm2efPGw=
X-Received: by 2002:a05:690c:3347:b0:70e:1874:b914 with SMTP id
 00721157ae682-719b4133d40mr24952697b3.9.1753251954012; Tue, 22 Jul 2025
 23:25:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250722103706.3440777-1-dario.binacchi@amarulasolutions.com>
 <20250722103706.3440777-3-dario.binacchi@amarulasolutions.com> <20250723050319.GA1239529-robh@kernel.org>
In-Reply-To: <20250723050319.GA1239529-robh@kernel.org>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Wed, 23 Jul 2025 08:25:43 +0200
X-Gm-Features: Ac12FXyzezWWf_pUFGOcPk-V-mRbQEUXptOJkigIidJmFt9VjBBdYB7tr8ictgw
Message-ID: <CABGWkvpWPXz8bFPC3OgqY+C6cgu6hHGh6muCQkoCOEVK048fSA@mail.gmail.com>
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

On Wed, Jul 23, 2025 at 7:03=E2=80=AFAM Rob Herring <robh@kernel.org> wrote=
:
>
> On Tue, Jul 22, 2025 at 12:36:16PM +0200, Dario Binacchi wrote:
> > Add support for glitch threshold configuration. A detected signal is va=
lid
> > only if it lasts longer than the set threshold; otherwise, it is regard=
ed
> > as a glitch.
> >
> > Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> > ---
> >
> >  .../input/touchscreen/fsl,imx6ul-tsc.yaml      | 18 ++++++++++++++++++
> >  1 file changed, 18 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/input/touchscreen/fsl,im=
x6ul-tsc.yaml b/Documentation/devicetree/bindings/input/touchscreen/fsl,imx=
6ul-tsc.yaml
> > index 678756ad0f92..2fee2940213f 100644
> > --- a/Documentation/devicetree/bindings/input/touchscreen/fsl,imx6ul-ts=
c.yaml
> > +++ b/Documentation/devicetree/bindings/input/touchscreen/fsl,imx6ul-ts=
c.yaml
> > @@ -62,6 +62,23 @@ properties:
> >      description: Number of data samples which are averaged for each re=
ad.
> >      enum: [ 1, 4, 8, 16, 32 ]
> >
> > +  fsl,glitch-threshold:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    default: 0
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
>
> Don't we have common properties for this expressed in time? Debounce
> time IIRC.

I tried checking in
Documentation/devicetree/bindings/input/touchscreen/touchscreen.yaml,
but I didn't find anything about it.

It exists in some specific touchscreen bindings:
- azoteq,iqs7211.yaml
- brcm,iproc-touchscreen.txt
- fsl-mx25-tcq.txt,
- ti,ads7843.yaml.

Only fsl-mx25-tcq.txt expresses it in terms of time (ns).

Thanks and regards,
Dario

>
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
> >



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

