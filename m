Return-Path: <linux-input+bounces-6354-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 613199719D9
	for <lists+linux-input@lfdr.de>; Mon,  9 Sep 2024 14:49:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1A0502837A5
	for <lists+linux-input@lfdr.de>; Mon,  9 Sep 2024 12:49:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 918F31B81B6;
	Mon,  9 Sep 2024 12:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HilEBeAA"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B90F1B7904;
	Mon,  9 Sep 2024 12:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725886175; cv=none; b=dKd2mObKxY+d5V9KmdOpdOyBDDNQb2aFcbWLmvKTt16tGEUt1wY87CUPiqU67rAQa2eAoEFX+JKy4ynEnMVuWydCFrcD9lmKAZYj/S/BG2a0+EEIMChYO5sQiCl5GIoQbuVG9Yw+x4ysTlu3e0h3FDthwRS6BElRcVYUsS3FAqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725886175; c=relaxed/simple;
	bh=+1q7BSLf+5YockNCjtxJ+SsHvoekTBH1RfZbQAe4ni4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jjMVhuhMxY8KAdTSipfxYzf76On/F2kQRpLePp1pozIctqNGHdeQ3QBQPh0v+qvehb9XFoq1T5+o0VXdCaKnrY60YmlyqpXvb7RJMSrAbwrHiiAmDzC8M5Zg5NA1u5mUkuZeBwLXNHLWUWeseYuRmnxRIdteyAPShDrmvZm2jS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HilEBeAA; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-71798a15ce5so2627595b3a.0;
        Mon, 09 Sep 2024 05:49:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725886173; x=1726490973; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zzazx0oVFb9XhnYpXlFBpUiO801jfi6j2QDoz9a5rLc=;
        b=HilEBeAAxhm2biOjyCj9GiAU4lI63k5SZ2GA1gkrPEzNUp+j0acK5p0/nEsT7S7gr4
         jT+pTwk7K3Fa8M/14pvtfOhczpivZofBNmY3JQtfB0XuK9HW8OfsKjbz6Nq1GordoJJJ
         uqxl6W9TBVGs25zTNa2rDsDmEaEZyeQtgytJOue05WT/9gMDhr7+A3jVdIXwqU/3ZvJx
         MWO5Imb9VbceTsMbkItfpXLg9QCWRLDV7a+h+nopOr64Q9Qqf/HPGf4Sx/hl5jfT3Sr+
         nOpDmcz5IYNliKaFOX0qtCbdEBI8KA1JHwa9LRRO87888RYBIM2OPM179lyU5RdyhvP9
         Hl1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725886173; x=1726490973;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zzazx0oVFb9XhnYpXlFBpUiO801jfi6j2QDoz9a5rLc=;
        b=w4Bgaxyhhkp0y+vSbx+rqkS0m0oNYSfhWXwU8MGY7I4X0F2rozrf3u3ccKtv53AtWF
         5xxdLmnmfo2uF37RwStyAcIo6FareYSGwqJMNpfpKWJt9tXQBO2Z7QSZ/ktVe3tPEiL9
         YhEBYNeaZzR1afojWn/JVxhZvEQ6kiuN5vtf87Q0EL8Sv0ny/hQ9GtW8sUU2x3zhgIeW
         GZzZ9n9XOXq0EACUtlGl8eHvZYCWaCsH1DPCRliqogHbE6JULTMWInYmCbmDvK6gcRfh
         W03Jh0HlLrTDdsR2+muk4Xk8PNLtiFFThd0P88QcEi+5dW7wg7ImGIcVKDK8exCgPPNU
         ducA==
X-Forwarded-Encrypted: i=1; AJvYcCUkfurLEKxy/FAigm4OVeVRGjd8anQuVX/CVBcxUM/zFyImIqxChJR33hd/C+96O4PCgtkdGa5KmWaS/QCE@vger.kernel.org, AJvYcCWWjuWGGxNm7ZbcC6Z6zwh+eslfrFY/k/jPv/wDMHmzBC1ePVCW1SQPhPxMPO5eDEFfXXrgEp0UuI6ulQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwlKGZ1idQVxpCFl+W39HS6kIoCyENWPSsKBH91AxtxKbimFbqJ
	vTYyo6WHk4a/sqrkHCD4a0aBxQmJz5UyHLQSBpbppc3+Ri3qiV/Vzchq09SUwN5f0YbyOaNDKMa
	dl7tW5ndjHf5woV103Dfkn1xPtKk=
X-Google-Smtp-Source: AGHT+IGk9Y4frGVBcfvwtuY347rx7XGb0Tc+KXvmw+HnQZlOyByoKrt0KvlEbgIveK9ggJW1c4upg/WI7g0DDAcw9zo=
X-Received: by 2002:a05:6a20:2d0e:b0:1cf:1228:c175 with SMTP id
 adf61e73a8af0-1cf1bfa1533mr16951607637.8.1725886172983; Mon, 09 Sep 2024
 05:49:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240908151742.2453402-1-sayyad.abid16@gmail.com>
 <sllpurhdxfgducp5hb3rs7u5db76vy2wtmyha7uspskvvek463@tq2aq65qqw4x>
 <CACVUEBmCBW7a3gyZ78ZyEtxHiFkie=3wuMz-+Oq_FfTjQX6AVw@mail.gmail.com>
 <edf29295-d360-4038-a490-3a5cbb8c28cd@kernel.org> <CACVUEB=eQUFbDV80D7sPkK84FmnR7j66gRGvB8eusV_cz-QmAQ@mail.gmail.com>
In-Reply-To: <CACVUEB=eQUFbDV80D7sPkK84FmnR7j66gRGvB8eusV_cz-QmAQ@mail.gmail.com>
From: Sayyad Abid <sayyad.abid16@gmail.com>
Date: Mon, 9 Sep 2024 18:18:57 +0530
Message-ID: <CACVUEB=UBQ=qnEGHodXjYNcMicOW6dGb1Z-V1CPkBV15+OdmwA@mail.gmail.com>
Subject: Re: [PATCH] dt-binding: touchscreen: fix x-plat-ohm missing type definition
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: devicetree@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Marek Vasut <marex@denx.de>, Michael Welling <mwelling@ieee.org>, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 9, 2024 at 1:36=E2=80=AFPM Sayyad Abid <sayyad.abid16@gmail.com=
> wrote:
>
> On Mon, Sep 9, 2024 at 1:21=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
> >
> > On 09/09/2024 09:48, Sayyad Abid wrote:
> > > On Mon, Sep 9, 2024 at 12:02=E2=80=AFPM Krzysztof Kozlowski <krzk@ker=
nel.org> wrote:
> > >>
> > >> On Sun, Sep 08, 2024 at 08:47:43PM +0530, Sayyad Abid wrote:
> > >>> This patch fixes the issue with x-plat-ohm missing a type definitio=
n.
> > >>> The patch adds the fix for this issue by adding value of this prope=
rty
> > >>
> > >> You repeated twice the same while it is unclear why this is missing.
> > > I must have overlooked it, my bad.
> >
> > Keep discussion public.
> I am away form my desktop and trying to reply with Gmail's client,
> I use mutt otherwise hence the trouble. I hit 'reply' instead of 'reply a=
ll'.
> >
> > >>
> > >> Also:
> > >> Please do not use "This commit/patch/change", but imperative mood. S=
ee
> > >> longer explanation here:
> > >> https://elixir.bootlin.com/linux/v5.17.1/source/Documentation/proces=
s/submitting-patches.rst#L95
> > > Okay, I'll refer to this article for any further patches. Thank you!
> > >>
> > >>
> > >>> should be a 32-bit unsigned integer.
> > >>>
> > >>> Signed-off-by: Sayyad Abid <sayyad.abid16@gmail.com>
> > >>>
> > >>> ---
> > >>>  .../devicetree/bindings/input/touchscreen/ti,tsc2005.yaml       | =
2 ++
> > >>>  1 file changed, 2 insertions(+)
> > >>>
> > >>> diff --git a/Documentation/devicetree/bindings/input/touchscreen/ti=
,tsc2005.yaml b/Documentation/devicetree/bindings/input/touchscreen/ti,tsc2=
005.yaml
> > >>> index 7187c390b2f5..98ff65cf9f9f 100644
> > >>> --- a/Documentation/devicetree/bindings/input/touchscreen/ti,tsc200=
5.yaml
> > >>> +++ b/Documentation/devicetree/bindings/input/touchscreen/ti,tsc200=
5.yaml
> > >>> @@ -38,6 +38,8 @@ properties:
> > >>>
> > >>>    ti,x-plate-ohms:
> > >>>      description: resistance of the touchscreen's X plates in ohm (=
defaults to 280)
> > >>
> > >>> +    $ref: /schemas/types.yaml#/definitions/uint32
> > >>
> > >> $ref should not be needed, so what is exactly missing? Provide some
> > >> sort of proof that you are fixing real issue.
> > > I ran dt_bindings_check on the file which resulted in a warning
> > > "x-plate-ohm : missing type definition", to resolve this warning I
> > > looked at the other yaml files in the ti,txc2005.yaml directory
> > > (/Documentation/devicetree/bindings/input/touchscreen/), Where I foun=
d
> > > out that one of the TI's touchscreen (ti,am3359) binding used $ref
> > > property for the similar "x-plate-resistance" property.
> > >
> > > Adding the $ref resolved the warnings.
> >
> > You run some older dtschema.
> I'll update this and check again.
So I did a full clean clone of the kernel repo and followed the
dtschema installation
as mentioned in the Linux Kernel Documentation.
Running the dt_binding_check resulted in the same warning.
> >
> > Anyway, each commit must explain why you are doing this. Whatever
> > warning you fix, you should mention it in the commit msg, because that'=
s
> > the answer to "why?" part.
> >
> Yes, will keep this in mind for any further patches.
> > Best regards,
> > Krzysztof
> >
> Thank you for your time and input.
>
> --
> Abid
What else should I try?

Thank You!

--=20
Abid

