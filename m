Return-Path: <linux-input+bounces-14872-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9360FB86ED9
	for <lists+linux-input@lfdr.de>; Thu, 18 Sep 2025 22:37:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5C4C9566A71
	for <lists+linux-input@lfdr.de>; Thu, 18 Sep 2025 20:37:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE5B52EFDB1;
	Thu, 18 Sep 2025 20:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="dGITqn4J"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1189F29E0ED
	for <linux-input@vger.kernel.org>; Thu, 18 Sep 2025 20:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758227870; cv=none; b=T61lX99iiL7DaMehiGqX2wCmQbun0/JN3QH/H1Px8bvjWr3GPud2XQrTOeTrQd5pyDkUmWE8TnIfHSnk25Mv60/PiKtm9xm+w6/MKh5yCgJQCKR4f/15cmK62+w4iJg9RVBKMpg04vqKuCZDGNgY/yyFm9PH7EBJ2BBqu/S4ZRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758227870; c=relaxed/simple;
	bh=+0R/2T7Tg9D4YiaoqRiplwCZvbPjlzXYv47AHkbl7dM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fkJ5r/lC76tULuCCaHpR5Te84Gr8YAvb5cb62TBAiZ5i8DmYN8lbsbdAzhREswbQxet3UCebdetfWTHBp/KgbLS4N4YIe7tmqbfLdNZqgd6Wjb4I5Kgk9s6cLjZVGs390fvboWFNC5Xi2WcX4iEwVkU8nzXGI+Dpjguedklh6/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=dGITqn4J; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-e96c48e7101so1266634276.2
        for <linux-input@vger.kernel.org>; Thu, 18 Sep 2025 13:37:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1758227868; x=1758832668; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vPqblTFKrLAe0mzsDyY6YySHuY6Q2kBBLw78NU0KIeg=;
        b=dGITqn4JwTmj5KwN35OD6/w5on0Ky8BtXx72gnPAkmp+/tXztRoUxlrBVs4ZSLAQFl
         0WJTdsR4LIGjuEl1QwUmqXU1ZbKWotDZBJG6uz0fcDJu+Pde2OpvjBLV6Wcgt7ebZaGE
         3IiA0rQaf+FOGwRk4LF2MySoeTtdmVC5ogGWw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758227868; x=1758832668;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vPqblTFKrLAe0mzsDyY6YySHuY6Q2kBBLw78NU0KIeg=;
        b=P/j9RQLOiD39m+/ySr8ZqjSH8n+LIDu13jRitQ0Zq7bL2FGpeM8P1vZUvDAKtBOcB+
         8giDt8dFFVeLqGhws/gi8Rh8nJIqbnQGPW5epHv9aJlLFVWm/z4PO2S2NkpHDIxZT4lT
         skvV7jmH1Zz2Ws6cMMxjD6JaHNB2QouH1n3Ar8JaebCdPfYXggb52y5AMWlpS2IyyESv
         mH8p6SNk2lZpKUfdTU559LpAZ/i62h56H010cwausaZeAf/0fmKoEEPmd+5ppWTfvyZe
         uQxJx/Vh4Qwy9OzfPCpi3+SlVPWIgiAvMa2kE+I+4Y3gHK+QdgZGGubXGtye/KGe+FPH
         2lSA==
X-Forwarded-Encrypted: i=1; AJvYcCU14HqKnxVhgm6FEfhaeFMDOs0n52HSCHj1qYeDdg/G9SZTZrtlqmErVbWR9Nkt0P3P+/FmPICmpRIIgQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxNGOIvEFH34/zw+ZcHHGT8UbLoZ3kAOoSpsyww1K35zVBwWYQL
	QGfEjIgX48MpavqldsHd0GKjMSgHFpTHNcoG7SaONklaTogjHzAmHDyjzGi+vzMEd6XmrM40+qz
	ca4+kzmiimKxxxafctngd+qK5AolwQTkDzHf/Loc36Q==
X-Gm-Gg: ASbGncuSHX54pnBHrFHtZWOnSorKNs2WJxvxXr8GqRHQ12hz2u+XHIMIIKjuQKLOP+o
	6s/hdA/QCTQ73ismeFWLDjhp3/oxsY3W4nuWj9Sya1ulE5LKkPWKewuwzMUVg2QZfKq9uCcrxEZ
	NAqSvsdDZ18G/+bXO0+NzT+fpzSXWq2tEBLtOoKmChBl7S8XIBjOfWPeS7iSW4e3KvDYhjEq8lt
	G9pr5a3Lged/Hu3HIQa/X2d
X-Google-Smtp-Source: AGHT+IH14ML5OeTgfNCjZ+eLR5D0BkEN/X8W7UZQcrAQKu6xXP5etxnsRLfqJ5tS5GUlUf2xOTL9iOYN03VgHVRvQJU=
X-Received: by 2002:a05:6902:c04:b0:ea4:f3f:5498 with SMTP id
 3f1490d57ef6-ea8aa09f336mr791364276.36.1758227867928; Thu, 18 Sep 2025
 13:37:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250918155240.2536852-1-dario.binacchi@amarulasolutions.com>
 <20250918155240.2536852-4-dario.binacchi@amarulasolutions.com> <20250918200445.GA2529753-robh@kernel.org>
In-Reply-To: <20250918200445.GA2529753-robh@kernel.org>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Thu, 18 Sep 2025 22:37:37 +0200
X-Gm-Features: AS18NWBqzx_QCJLvM1ZupXjBE082LYlK02aLhStfsrL_kkHbqntwv2U3qqpvFFU
Message-ID: <CABGWkvqX9aCxam6UMYsUBkwnMJrMNKjVKrqi5Ca7O5Jk8xRTAA@mail.gmail.com>
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

On Thu, Sep 18, 2025 at 10:04=E2=80=AFPM Rob Herring <robh@kernel.org> wrot=
e:
>
> On Thu, Sep 18, 2025 at 05:52:31PM +0200, Dario Binacchi wrote:
> > Add support for glitch threshold configuration. A detected signal is va=
lid
> > only if it lasts longer than the set threshold; otherwise, it is regard=
ed
> > as a glitch.
> >
> > Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> >
> > ---
> >
> > Changes in v5:
> > - Add Acked-by tag of Conor Dooley
> >
> > Changes in v2:
> > - Added in v2.
> >
> >  .../devicetree/bindings/input/touchscreen/touchscreen.yaml    | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/input/touchscreen/touchs=
creen.yaml b/Documentation/devicetree/bindings/input/touchscreen/touchscree=
n.yaml
> > index 3e3572aa483a..a60b4d08620d 100644
> > --- a/Documentation/devicetree/bindings/input/touchscreen/touchscreen.y=
aml
> > +++ b/Documentation/devicetree/bindings/input/touchscreen/touchscreen.y=
aml
> > @@ -206,6 +206,10 @@ properties:
> >
> >          unevaluatedProperties: false
> >
> > +  touchscreen-glitch-threshold-ns:
> > +    description: Minimum duration in nanoseconds a signal must remain =
stable
> > +      to be considered valid.
>
> What's wrong with debounce-delay-ms?

Do you mean that I should rename touchscreen-glitch-threshold-ns to
debounce-delay-ms?

Thanks and regards,
Dario

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

