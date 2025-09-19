Return-Path: <linux-input+bounces-14930-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB0A3B8A38C
	for <lists+linux-input@lfdr.de>; Fri, 19 Sep 2025 17:15:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2DD4F17E618
	for <lists+linux-input@lfdr.de>; Fri, 19 Sep 2025 15:13:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D1D9314B89;
	Fri, 19 Sep 2025 15:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="iaQzmEpB"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ADDC2F83BA
	for <linux-input@vger.kernel.org>; Fri, 19 Sep 2025 15:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758294776; cv=none; b=lzeuS5wKIrd5J6VCnXZledRCcIAoG/UFMo+MSB0mSvm1XAM6W6d2R3+DiCFjXD2D9yOKofKG/Ml1AgT9SX2ttsqVrovfhYlLKbQqORKAA7DRPm2rqxDxy18IQIdE9dsf5mpr/HrKsXkgyGS0x7Mj/apIen3sMcd8Y6vtZjhi5bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758294776; c=relaxed/simple;
	bh=BMBx1xHgOcLMiwulqoEU2IVGNnkq/sLpD6FdVgmu+5I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ug614bTUe8nclqkyhOA2Jiryw1qGHWjIdVjFhKC/VXmVTPzcWnhbuAs+BbVEa4BbyiOKaJKhtbNILq+BXvab1ODnTA92oft/tGLuBIMsttgCEki790M49eSD65v3jg8UkSGHslDMwREs3b/da1f3iQb7AE5byIXYWLCN0qClKQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=iaQzmEpB; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-eabe0d02398so487117276.0
        for <linux-input@vger.kernel.org>; Fri, 19 Sep 2025 08:12:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1758294773; x=1758899573; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xDR2hBx94HH9iDGXNQ3ANzEfWRisNoMXPj4b5y7WrJ8=;
        b=iaQzmEpBXqesi1cHzB4VZJ94iKEFL7Uwl3ssxfcK3v/4d9eFdzwFrHsjgPe7by10Eo
         OYqAtHTrEJkBBniuYBZKCgTDbOYPnXu5jIOuFpOryuaXyzFl55IQf9yMZ7XsUcx+0F1W
         l1SFFCJQrCyokcNjkVfVksYPpUUu5SlwRi2Ks=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758294773; x=1758899573;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xDR2hBx94HH9iDGXNQ3ANzEfWRisNoMXPj4b5y7WrJ8=;
        b=b4q4zJOV6HnXgZUwyK0C90k3tBUJxgREda+q19RiKmYJrtXZHzRaYfzuuKLwO7M7Zk
         i3KOMrfcyEagZ1RdfU3X4qrBjJWakoarHbj5X/JNh+Nf+1QjHIegmCJof3eu0/Cnc2zf
         I3iwHs3L5D7YP5hvc+yyJoJcyexoafGp6EGpH2FslkQrIQVFPfEX1A8G2x2eibBcMw3y
         sJR5tVfKO77I48W3rEkddcnDjtZ+ylruwOEe+q8nIz1yD1jrSr7siBRGb+74TScZF2di
         qyLrQoS9YQtYjiKAu+6o/JFd546CdtHmKOPFWz87MKpZ95bp8TA1v00yWrg1Fs+AtoQb
         dp/w==
X-Forwarded-Encrypted: i=1; AJvYcCUEPNsmvbs2Kfc/d+VaPZf9L9AEOD5zjJ5zab10PjX24kpC02g03vArdkC96+B9lotieihQNX+q8wji4g==@vger.kernel.org
X-Gm-Message-State: AOJu0YytMfYI6wRRmhQCVOvWJRLe5o+ySYiohqX7L4lJQ/ZptfZ5GFgH
	9uVktGtqiiEDbExgvPyCzlhuhqUEvqjNyrfQgFeFZCKHScrGkiTdI2Y85mKbX2yoptoYwXy7QQQ
	9TYTCWnZAyeZSSNweEm1O+UwL+nFQdbp6rYoS2cIyJg==
X-Gm-Gg: ASbGncu45gUGtboBYQtN6PgQwPZdlLyXJD8qSyL7moEHC6kumPoBHPmN0L1ymuUr9WJ
	PT6VIkrj6edX/xalc7UJmWMzOC5c0hS/vK7NHKXFrz3ehuZPp0vZiuq9iBAsLpLazqfeHlus6aP
	rhKpCWzp5/fCfMatj0WZ7zokWaTodbNIjiOjJ4McoBB0hs7vKYCTYThdv1PZ3TRAQh/EHCHWwJo
	OPSpg==
X-Google-Smtp-Source: AGHT+IFCsX/Yr77baAfQUzezWX3UUJwL6EO1cZJPaD7zTXu7veCWD1vzn6Rs4eZ4FAte4CZNbi3qEmlpHq2WjLd8WuQ=
X-Received: by 2002:a05:6902:488f:b0:ea7:c75f:2691 with SMTP id
 3f1490d57ef6-ea867ca9423mr4048090276.19.1758294772969; Fri, 19 Sep 2025
 08:12:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250918155240.2536852-1-dario.binacchi@amarulasolutions.com>
 <20250918155240.2536852-4-dario.binacchi@amarulasolutions.com>
 <20250918200445.GA2529753-robh@kernel.org> <CABGWkvqX9aCxam6UMYsUBkwnMJrMNKjVKrqi5Ca7O5Jk8xRTAA@mail.gmail.com>
 <20250919143831.GA862818-robh@kernel.org>
In-Reply-To: <20250919143831.GA862818-robh@kernel.org>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Fri, 19 Sep 2025 17:12:42 +0200
X-Gm-Features: AS18NWBbtmYlxVQg7JWp-61dA1-iw7AN6sdR1Y0K8dgfLvdbAOOkJOlZL9jpOaA
Message-ID: <CABGWkvrxOTzAcqWHLvuqk_7WFxybheSZFnMkqnksfkPi6wXcpQ@mail.gmail.com>
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

On Fri, Sep 19, 2025 at 4:38=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:
>
> On Thu, Sep 18, 2025 at 10:37:37PM +0200, Dario Binacchi wrote:
> > On Thu, Sep 18, 2025 at 10:04=E2=80=AFPM Rob Herring <robh@kernel.org> =
wrote:
> > >
> > > On Thu, Sep 18, 2025 at 05:52:31PM +0200, Dario Binacchi wrote:
> > > > Add support for glitch threshold configuration. A detected signal i=
s valid
> > > > only if it lasts longer than the set threshold; otherwise, it is re=
garded
> > > > as a glitch.
> > > >
> > > > Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> > > > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> > > >
> > > > ---
> > > >
> > > > Changes in v5:
> > > > - Add Acked-by tag of Conor Dooley
> > > >
> > > > Changes in v2:
> > > > - Added in v2.
> > > >
> > > >  .../devicetree/bindings/input/touchscreen/touchscreen.yaml    | 4 =
++++
> > > >  1 file changed, 4 insertions(+)
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/input/touchscreen/to=
uchscreen.yaml b/Documentation/devicetree/bindings/input/touchscreen/touchs=
creen.yaml
> > > > index 3e3572aa483a..a60b4d08620d 100644
> > > > --- a/Documentation/devicetree/bindings/input/touchscreen/touchscre=
en.yaml
> > > > +++ b/Documentation/devicetree/bindings/input/touchscreen/touchscre=
en.yaml
> > > > @@ -206,6 +206,10 @@ properties:
> > > >
> > > >          unevaluatedProperties: false
> > > >
> > > > +  touchscreen-glitch-threshold-ns:
> > > > +    description: Minimum duration in nanoseconds a signal must rem=
ain stable
> > > > +      to be considered valid.
> > >
> > > What's wrong with debounce-delay-ms?
> >
> > Do you mean that I should rename touchscreen-glitch-threshold-ns to
> > debounce-delay-ms?
>
> I mean that's the common property we already have, so use it or explain
> why you aren't using it. I suppose the definition is technically a bit
> different if it's purely a s/w delay vs. h/w monitoring of the signal
> state. I don't think it matters if the interpretation by each driver is
> a bit different.
>
> Maybe msec is not enough resolution for you could be another reason?

Yes, this is the main reason. As specified in the following patch:
  v5 4/6 dt-bindings: touchscreen: fsl,imx6ul-tsc: support glitch threshold

Drivers must convert this value to IPG clock cycles and map
it to one of the four discrete thresholds exposed by the
TSC_DEBUG_MODE2 register:

  0: 8191 IPG cycles
  1: 4095 IPG cycles
  2: 2047 IPG cycles
  3: 1023 IPG cycles

In my case, the IPG clock runs at 66 MHz, which corresponds to:

124 =C2=B5s for 0
62 =C2=B5s for 1
31 us for 2
15 us for 3

So using milliseconds would not fit my use case. A possible trade-off
could be to use debounce-delay-us. Would that be acceptable?

Thanks and regards
Dario

> Looks like your h/w supports that assuming the clock frequency is 10s
> of MHz. But are touchscreen glitches really in sub msec times? Not in my
> experience, but that's 20 years ago on resistive touchscreens...
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

