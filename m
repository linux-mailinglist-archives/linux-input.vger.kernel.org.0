Return-Path: <linux-input+bounces-6336-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D490971139
	for <lists+linux-input@lfdr.de>; Mon,  9 Sep 2024 10:09:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5FC67B23684
	for <lists+linux-input@lfdr.de>; Mon,  9 Sep 2024 08:09:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17A921B3743;
	Mon,  9 Sep 2024 08:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K6XxuNPB"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AB811B2EC9;
	Mon,  9 Sep 2024 08:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725869226; cv=none; b=efjiWxAS52gXBF93pL+nicxxiSXbhUO2baz6EIet2TI8UBIA1U59tkpHNVxgg/jLtfZ3ALMTZKWvaJBZKbIf+ljS5kJ/CF9HE3Y+SzlqzE1zUbJflxS296xFXzxYc04QwH25DdKgYIO+DfORjyKcrjDFF4im9A68cTnQNiQw/Y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725869226; c=relaxed/simple;
	bh=wQOWDq+q3g/E+MT+1ZFhrRuB4cfJ35DEN24egc4ZF0g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QYgbslYMZf/GBn1tTgyb3AygkSo958i0aQVVc+FgGvf2s5VFJSgXTB06dFSi4vcpJm19pu2pLfOnAJNAnBvlP7t4I9VjO7BiIxE8a2ZdWoOw2gyjvS9JJ10hb+WocZ0Ndp6E34rDj6EnvzudkCmbjPJ6HYwBs2stViC7ZRmtGXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K6XxuNPB; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-71798a15ce5so2419562b3a.0;
        Mon, 09 Sep 2024 01:07:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725869225; x=1726474025; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pZupFonouWROtHS3HaWQjpxjzwx+Zlawq9bnaKu7Dck=;
        b=K6XxuNPBZ9jbJVY9BTIUddiVvdEC3pfQydl4qw71jfV8e8hszVCF/3HcP/9Z4N4wto
         K8Ev94AiYe3Ue6YevQIe5j/Hl9YUWDX9D1tN8YvMPQ9vbmlWoAUST/Pzw4pA+ebBsycT
         iowJGy1G3oeB7bqFA6B4NwdacjbxxEfxUuYoxUQnQKG+g1RmA3ro5icLMJGmj0z1DiDa
         VEZ77txQKNjFszrTqv6sJ8NJo/KKdnE4ara2IyblKA0f/C4d28o2u80oz8ievOm2LT/Z
         JRkAWE83RtNgAAb2kilLvrmEGVo/8+legYCmLFI1284Vwffi3DBARwa9BPuClfmDCW0C
         Ma0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725869225; x=1726474025;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pZupFonouWROtHS3HaWQjpxjzwx+Zlawq9bnaKu7Dck=;
        b=Iq/PtcHwC833CXxYrIQLKlCxlfChFlymKadYsiD5eKZFF9KnvSHjv8F9dUcg3iEZl0
         AdesGbivKFSFyI26CAPB2+bgDTH7HhPBkw6AP9DGAeHIkusFYVEAZQgdbJTSUDq42wnM
         fT/N4W3hws5/+M5OHMi/NQahalzW5s0EZK55SWZis2X/E8w7UOucfXS6LtRwP7KmrZf/
         dyILsf2ciClJJ3fluNPmNx6RZPXKbammi6QHx39I9NI51moJuyQMmBSesy1pWd8PbCff
         2yfFFZQeOGRE8KR7Qye/7LfOia8PX+0zSzQddKLS2XOXpawzfdZSZyHWrcemt2fhIAaf
         /YRg==
X-Forwarded-Encrypted: i=1; AJvYcCVl7jneGuEJG9omCfGRoR2GaS4hejTXAWnWmp9ytOQDXPrEa1XuMDi/aw5X4GlipW03QpFM/kgaZV2ikw==@vger.kernel.org, AJvYcCWn716W03wthWCeOnIT8OI2bGU/elQkHe+S69fgQPT4dmzkw44R08x691iceGo6oDI4586ePJhuEzlRKIf1@vger.kernel.org
X-Gm-Message-State: AOJu0YwsYGd2GyqWpK9zZy7VL9Dt9Wv3Il1CQmBnx0XqPgjDS2Yxggv8
	xbkF8plqozqrs6SzlIYt8TUP7wzYPx+2lNaUoI3AZx9gFx2tFLXkH+1O740v9W6pI//OmeE+ViZ
	GBHaF0DovSiOWHso9K6bHDxCpFgU=
X-Google-Smtp-Source: AGHT+IHde/PTJ8kcNC5dNzzwyXIOZ8aI5c8r+w+iDb2GRZrsYJ/DA2HWSUZXWcjBfuIeTXjF35EzJF2B1B8inx/Cv1A=
X-Received: by 2002:a05:6a20:9f0a:b0:1c8:de01:e7e5 with SMTP id
 adf61e73a8af0-1cf1c0cce08mr16930698637.15.1725869224443; Mon, 09 Sep 2024
 01:07:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240908151742.2453402-1-sayyad.abid16@gmail.com>
 <sllpurhdxfgducp5hb3rs7u5db76vy2wtmyha7uspskvvek463@tq2aq65qqw4x>
 <CACVUEBmCBW7a3gyZ78ZyEtxHiFkie=3wuMz-+Oq_FfTjQX6AVw@mail.gmail.com> <edf29295-d360-4038-a490-3a5cbb8c28cd@kernel.org>
In-Reply-To: <edf29295-d360-4038-a490-3a5cbb8c28cd@kernel.org>
From: Sayyad Abid <sayyad.abid16@gmail.com>
Date: Mon, 9 Sep 2024 13:36:29 +0530
Message-ID: <CACVUEB=eQUFbDV80D7sPkK84FmnR7j66gRGvB8eusV_cz-QmAQ@mail.gmail.com>
Subject: Re: [PATCH] dt-binding: touchscreen: fix x-plat-ohm missing type definition
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: devicetree@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Marek Vasut <marex@denx.de>, Michael Welling <mwelling@ieee.org>, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Sayyad Abid <sayyad.abid16@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 9, 2024 at 1:21=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On 09/09/2024 09:48, Sayyad Abid wrote:
> > On Mon, Sep 9, 2024 at 12:02=E2=80=AFPM Krzysztof Kozlowski <krzk@kerne=
l.org> wrote:
> >>
> >> On Sun, Sep 08, 2024 at 08:47:43PM +0530, Sayyad Abid wrote:
> >>> This patch fixes the issue with x-plat-ohm missing a type definition.
> >>> The patch adds the fix for this issue by adding value of this propert=
y
> >>
> >> You repeated twice the same while it is unclear why this is missing.
> > I must have overlooked it, my bad.
>
> Keep discussion public.
I am away form my desktop and trying to reply with Gmail's client,
I use mutt otherwise hence the trouble. I hit 'reply' instead of 'reply all=
'.
>
> >>
> >> Also:
> >> Please do not use "This commit/patch/change", but imperative mood. See
> >> longer explanation here:
> >> https://elixir.bootlin.com/linux/v5.17.1/source/Documentation/process/=
submitting-patches.rst#L95
> > Okay, I'll refer to this article for any further patches. Thank you!
> >>
> >>
> >>> should be a 32-bit unsigned integer.
> >>>
> >>> Signed-off-by: Sayyad Abid <sayyad.abid16@gmail.com>
> >>>
> >>> ---
> >>>  .../devicetree/bindings/input/touchscreen/ti,tsc2005.yaml       | 2 =
++
> >>>  1 file changed, 2 insertions(+)
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/input/touchscreen/ti,t=
sc2005.yaml b/Documentation/devicetree/bindings/input/touchscreen/ti,tsc200=
5.yaml
> >>> index 7187c390b2f5..98ff65cf9f9f 100644
> >>> --- a/Documentation/devicetree/bindings/input/touchscreen/ti,tsc2005.=
yaml
> >>> +++ b/Documentation/devicetree/bindings/input/touchscreen/ti,tsc2005.=
yaml
> >>> @@ -38,6 +38,8 @@ properties:
> >>>
> >>>    ti,x-plate-ohms:
> >>>      description: resistance of the touchscreen's X plates in ohm (de=
faults to 280)
> >>
> >>> +    $ref: /schemas/types.yaml#/definitions/uint32
> >>
> >> $ref should not be needed, so what is exactly missing? Provide some
> >> sort of proof that you are fixing real issue.
> > I ran dt_bindings_check on the file which resulted in a warning
> > "x-plate-ohm : missing type definition", to resolve this warning I
> > looked at the other yaml files in the ti,txc2005.yaml directory
> > (/Documentation/devicetree/bindings/input/touchscreen/), Where I found
> > out that one of the TI's touchscreen (ti,am3359) binding used $ref
> > property for the similar "x-plate-resistance" property.
> >
> > Adding the $ref resolved the warnings.
>
> You run some older dtschema.
I'll update this and check again.
>
> Anyway, each commit must explain why you are doing this. Whatever
> warning you fix, you should mention it in the commit msg, because that's
> the answer to "why?" part.
>
Yes, will keep this in mind for any further patches.
> Best regards,
> Krzysztof
>
Thank you for your time and input.

--=20
Abid

