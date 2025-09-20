Return-Path: <linux-input+bounces-14938-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B2D75B8C4C3
	for <lists+linux-input@lfdr.de>; Sat, 20 Sep 2025 11:40:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 633FB4673E6
	for <lists+linux-input@lfdr.de>; Sat, 20 Sep 2025 09:40:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84AC1288C25;
	Sat, 20 Sep 2025 09:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="F3Dg3qEJ"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7C60283128
	for <linux-input@vger.kernel.org>; Sat, 20 Sep 2025 09:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758361213; cv=none; b=oTEmiXtIEjs6n14PKqavUdBSRbvWkw9Hq4Xo+YEDEBbdQOjIAkzhTeE2RrjIRGV2k5ObrIl8xMyyG18mxOsJ+bXmYXYY1NVY3PAu38cIkYwKX2yr/ldnIa6+eMJ0wrsavKmLl9uQlCu5FhTkENqkLoKILV3lVQjQTRV4h+73ogo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758361213; c=relaxed/simple;
	bh=Agn7APdbyMftIUbKtaGM92mZicr4jzMovNNhtGLzuto=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kocag3pgG0TQ/DUZk70o051JCVIRBXKSau6KQ3G8fhpjiUiVjBRM/4qWrJ1T2OtUNUK1LmZAKhHAZSfL9V3PGqVC8IiOfLRtQ7gMd1ZK7ei7uMu/RsEA3r3ts5YWsSb7A+bDQt+IkJb/AggSvu5f/XOISVBQCSH50slaWC0nF0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=F3Dg3qEJ; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-71d603a269cso19789737b3.1
        for <linux-input@vger.kernel.org>; Sat, 20 Sep 2025 02:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1758361210; x=1758966010; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NaDnghTXUn1bVSOceTjgt47F5y7FKqMUoIUfRqhx4Dw=;
        b=F3Dg3qEJq1XA4wD773jYJDR7KUe5oqO6/VKBNU2J+F0BnHhwmrRsv26BKQr60mG+mN
         Daf3eOeggDgxxehchzOEqG6+ihvt3xCuRdBWB1ywX5BhBdQelM2qg49xcH8FjLQ/h4uP
         qg0C5jJFg0htnwdh7LAauDXZNv/nSD1EP1dBU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758361210; x=1758966010;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NaDnghTXUn1bVSOceTjgt47F5y7FKqMUoIUfRqhx4Dw=;
        b=gqOP2l85CtuTIJR04LAFkJFwzllEKcUExjflDw3d7GEw13XbDuwMhMWSJIbBH0ZgDm
         drTIyx/XEy7lcCYWSDkMJrqMaxEDjzASN/WYyRWTpPeER2WJbOhXYeD1DakgWiu7ME93
         k1G8Lc9pPOadBiUxeqFtN6V5WC/DZ8TUbg5fqD2b3anGeoj+2BM/TZ4JFTbwy7rrXaUa
         rJRs1eBhNXHRgW7PpAxUIQtOfrSOfMak7QUbYPBhju0LNRqZPbFqv1WXQxMGgJOqxexQ
         ra9MoTZwjBc0LD1FvDxR61c18IxGQWLqPSVdSHPyF6YuEhXz/H8q4A1zR2xGAlq9Jcmx
         ECjg==
X-Forwarded-Encrypted: i=1; AJvYcCWfOIGrNDI0s0sYIc16dVjSJGOkNACZ4+H5X1c04Pw81wnE/V5oC/zp6a6FlKdusBO8zyH1bbLYywGMvw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxS76E1egbxhOojf7xTyyhhqk/JnSL0g1FWkAybdge2AypBV7ax
	uDOYEbKgle0cALqgfJ3mJsiYFIXVkiu4VmUcZR5DQW8SssZOLERR6Nec760dz4BEF8ltU3pNyd1
	iP/urelypARs//EH7UdgZ63YE89ClKJ8lzdcBPKbe3A==
X-Gm-Gg: ASbGncu5TPq714u7lnCqY7EyDWqbZNSw8GLBuO2u/76lBDLHBmKk3K+q28Wq3nB+wUy
	QOZl9Y3d6VUDGefh6HkwwT75caxxmHAgr307t5decV8jMy3X2RTfeaIEqVAgzxokLLjrp4vTp3h
	Zz/7EEswBRZHWLLyzCloWxDsuoGBNoSmYUf1dKVIRzeul5R2SrGAbUF1iw5iOaZpQoFwDSw7LjR
	y2Lfg==
X-Google-Smtp-Source: AGHT+IEPzdUNUNS8RORST6IBN7ohD/O7mRgh2fZsz71PA+MZD892Wsiz/RFPoXNGMYe0EdjdagsopXhExq5cyI8G3W4=
X-Received: by 2002:a05:690c:6203:b0:749:36fd:abf0 with SMTP id
 00721157ae682-74936fdafb5mr1084097b3.54.1758361210580; Sat, 20 Sep 2025
 02:40:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250918155240.2536852-1-dario.binacchi@amarulasolutions.com>
 <20250918155240.2536852-4-dario.binacchi@amarulasolutions.com>
 <20250918200445.GA2529753-robh@kernel.org> <CABGWkvqX9aCxam6UMYsUBkwnMJrMNKjVKrqi5Ca7O5Jk8xRTAA@mail.gmail.com>
 <20250919143831.GA862818-robh@kernel.org> <CABGWkvrxOTzAcqWHLvuqk_7WFxybheSZFnMkqnksfkPi6wXcpQ@mail.gmail.com>
 <20250919204436.GA2176045-robh@kernel.org>
In-Reply-To: <20250919204436.GA2176045-robh@kernel.org>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Sat, 20 Sep 2025 11:39:59 +0200
X-Gm-Features: AS18NWCRsqQle93KcCsQB12JjSzQRdG4BDO3bzqtWjUIXPoU75kmVb0GdVk6IVA
Message-ID: <CABGWkvr8X5a0ezeu6HDCMfjh+xbg-bQq4cLwzRD2BvoJsvH_BA@mail.gmail.com>
Subject: Re: [PATCH v5 3/6] dt-bindings: touchscreen: add touchscreen-glitch-threshold-ns
 property
To: Rob Herring <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, Frank Li <Frank.Li@nxp.com>, 
	linux-amarula@amarulasolutions.com, Conor Dooley <conor.dooley@microchip.com>, 
	Conor Dooley <conor+dt@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Javier Carrasco <javier.carrasco@wolfvision.net>, Jeff LaBundy <jeff@labundy.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 19, 2025 at 10:44=E2=80=AFPM Rob Herring <robh@kernel.org> wrot=
e:
>
> On Fri, Sep 19, 2025 at 05:12:42PM +0200, Dario Binacchi wrote:
> > On Fri, Sep 19, 2025 at 4:38=E2=80=AFPM Rob Herring <robh@kernel.org> w=
rote:
> > >
> > > On Thu, Sep 18, 2025 at 10:37:37PM +0200, Dario Binacchi wrote:
> > > > On Thu, Sep 18, 2025 at 10:04=E2=80=AFPM Rob Herring <robh@kernel.o=
rg> wrote:
> > > > >
> > > > > On Thu, Sep 18, 2025 at 05:52:31PM +0200, Dario Binacchi wrote:
> > > > > > Add support for glitch threshold configuration. A detected sign=
al is valid
> > > > > > only if it lasts longer than the set threshold; otherwise, it i=
s regarded
> > > > > > as a glitch.
> > > > > >
> > > > > > Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.=
com>
> > > > > > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> > > > > >
> > > > > > ---
> > > > > >
> > > > > > Changes in v5:
> > > > > > - Add Acked-by tag of Conor Dooley
> > > > > >
> > > > > > Changes in v2:
> > > > > > - Added in v2.
> > > > > >
> > > > > >  .../devicetree/bindings/input/touchscreen/touchscreen.yaml    =
| 4 ++++
> > > > > >  1 file changed, 4 insertions(+)
> > > > > >
> > > > > > diff --git a/Documentation/devicetree/bindings/input/touchscree=
n/touchscreen.yaml b/Documentation/devicetree/bindings/input/touchscreen/to=
uchscreen.yaml
> > > > > > index 3e3572aa483a..a60b4d08620d 100644
> > > > > > --- a/Documentation/devicetree/bindings/input/touchscreen/touch=
screen.yaml
> > > > > > +++ b/Documentation/devicetree/bindings/input/touchscreen/touch=
screen.yaml
> > > > > > @@ -206,6 +206,10 @@ properties:
> > > > > >
> > > > > >          unevaluatedProperties: false
> > > > > >
> > > > > > +  touchscreen-glitch-threshold-ns:
> > > > > > +    description: Minimum duration in nanoseconds a signal must=
 remain stable
> > > > > > +      to be considered valid.
> > > > >
> > > > > What's wrong with debounce-delay-ms?
> > > >
> > > > Do you mean that I should rename touchscreen-glitch-threshold-ns to
> > > > debounce-delay-ms?
> > >
> > > I mean that's the common property we already have, so use it or expla=
in
> > > why you aren't using it. I suppose the definition is technically a bi=
t
> > > different if it's purely a s/w delay vs. h/w monitoring of the signal
> > > state. I don't think it matters if the interpretation by each driver =
is
> > > a bit different.
> > >
> > > Maybe msec is not enough resolution for you could be another reason?
> >
> > Yes, this is the main reason. As specified in the following patch:
> >   v5 4/6 dt-bindings: touchscreen: fsl,imx6ul-tsc: support glitch thres=
hold
> >
> > Drivers must convert this value to IPG clock cycles and map
> > it to one of the four discrete thresholds exposed by the
> > TSC_DEBUG_MODE2 register:
> >
> >   0: 8191 IPG cycles
> >   1: 4095 IPG cycles
> >   2: 2047 IPG cycles
> >   3: 1023 IPG cycles
> >
> > In my case, the IPG clock runs at 66 MHz, which corresponds to:
> >
> > 124 =C2=B5s for 0
> > 62 =C2=B5s for 1
> > 31 us for 2
> > 15 us for 3
> >
> > So using milliseconds would not fit my use case. A possible trade-off
> > could be to use debounce-delay-us. Would that be acceptable?
>
> I agree it wouldn't map to what the h/w provides, but is what the h/w
> provides actually useful? There's plenty of h/w designed that's not
> useful. 15us is quite short for a glitch. Do you have an actual cases
> where the different values above are needed?

Considering an IPG clock at 66 MHz, currently at reset the deglitch
filter is set to 124 =C2=B5s,
the driver sets it to 31 =C2=B5s with a hardcoded value, and in my use case
I need to set it to 62 =C2=B5s,
as you can see in the patch:
https://lore.kernel.org/all/20250918155240.2536852-6-dario.binacchi@amarula=
solutions.com/
and its handling in
https://lore.kernel.org/all/20250918155240.2536852-7-dario.binacchi@amarula=
solutions.com/

Another option could be to use a specific binding for the
fsl,imx6ul-tsc controller, as I did in the
earlier versions of the series.

Thanks and regards,
Dario

>
> Rob



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

