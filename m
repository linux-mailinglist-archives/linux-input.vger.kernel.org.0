Return-Path: <linux-input+bounces-642-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DAD2C80B35A
	for <lists+linux-input@lfdr.de>; Sat,  9 Dec 2023 10:05:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 063BBB20AA9
	for <lists+linux-input@lfdr.de>; Sat,  9 Dec 2023 09:05:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92739D519;
	Sat,  9 Dec 2023 09:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=gimli.ms.mff.cuni.cz header.i=@gimli.ms.mff.cuni.cz header.b="OANn2IQI"
X-Original-To: linux-input@vger.kernel.org
Received: from nikam.ms.mff.cuni.cz (nikam.ms.mff.cuni.cz [195.113.20.16])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A69AE10D9;
	Sat,  9 Dec 2023 01:05:30 -0800 (PST)
Received: from gimli.ms.mff.cuni.cz (gimli.ms.mff.cuni.cz [195.113.20.176])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by nikam.ms.mff.cuni.cz (Postfix) with ESMTPS id 11D7328044F;
	Sat,  9 Dec 2023 10:05:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gimli.ms.mff.cuni.cz;
	s=gen1; t=1702112728;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gbbyqSK5IuL9LoNBL2boJ6tt8JRfQONwCHbN5+ACzYI=;
	b=OANn2IQIc3+GqlzMzkV1EAEHwtDFF+uN0vIv2HceSdMIg2QaJ1wV3aHLzOLot7TaNkrxam
	sisI3ccxswiMrv1FhgKlKm1B6L/l2RYoR9LSMN3cOWEzN+DMR/a3P2DNx8jjsX8Dg3scXU
	NsEcTnH/OrasVDRlvmPjaoNRXywOjHI=
Received: from localhost (internet5.mraknet.com [185.200.108.250])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: karelb)
	by gimli.ms.mff.cuni.cz (Postfix) with ESMTPSA id 997E544B369;
	Sat,  9 Dec 2023 10:05:27 +0100 (CET)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 09 Dec 2023 10:05:27 +0100
Message-Id: <CXJOLS2I8WH7.1IMVJGPUNG4VB@gimli.ms.mff.cuni.cz>
From: "Karel Balej" <karelb@gimli.ms.mff.cuni.cz>
Cc: "Conor Dooley" <conor@kernel.org>, "Dmitry Torokhov"
 <dmitry.torokhov@gmail.com>, "Rob Herring" <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Henrik Rydberg" <rydberg@bitmath.org>,
 <linux-input@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, =?utf-8?q?Duje_Mihanovi=C4=87?=
 <duje.mihanovic@skole.hr>, <~postmarketos/upstreaming@lists.sr.ht>,
 <phone-devel@vger.kernel.org>, "Karel Balej" <balejk@matfyz.cz>
Subject: Re: [PATCH v3 2/5] dt-bindings: input/touchscreen: Add compatible
 for IST3038B
To: "Conor Dooley" <conor.dooley@microchip.com>, "Markuss Broks"
 <markuss.broks@gmail.com>
References: <20231202125948.10345-1-karelb@gimli.ms.mff.cuni.cz>
 <20231202125948.10345-3-karelb@gimli.ms.mff.cuni.cz>
 <20231203-outskirts-reformat-e0a833903841@spud>
 <0a035c62-9d35-4f85-b1f3-bcb7dea17d52@gmail.com>
 <20231204-stooge-impotent-fe8d2d9177e4@wendy>
In-Reply-To: <20231204-stooge-impotent-fe8d2d9177e4@wendy>

On Mon Dec 4, 2023 at 1:52 PM CET, Conor Dooley wrote:
> On Mon, Dec 04, 2023 at 02:40:44PM +0200, Markuss Broks wrote:
> > On 12/3/23 13:20, Conor Dooley wrote:
> > > On Sat, Dec 02, 2023 at 01:48:33PM +0100, Karel Balej wrote:
> > > > From: Markuss Broks <markuss.broks@gmail.com>
> > > >=20
> > > > Imagis IST3038B is a variant (firmware?) of Imagis IST3038 IC,
> > > > add the compatible for it to the IST3038C bindings.
> > > This one is better, but would be well served by mentioning what
> > > specifically is different (register addresses or firmware commands?)
> >=20
> > I don't think anyone knows this other than Imagis itself. I would guess=
 it's
> > different hardware, since register addresses are indeed different, but =
on
> > the other hand, there is a possibility that firmware on the MCU could b=
e
> > responding to those commands. I suppose "... IST3038B is a hardware var=
iant
> > of ... IST3038" would be more correct.
>
> Only Imagis might know the specifics, but you (plural) have made driver
> changes so you know what is different in terms of the programming model.
> I'm just asking for you to mention how the programming model varies in
> the commit message. Otherwise I can't know whether you should have added
> a fallback compatible, without going and reading your driver change. The
> commit message for the bindings should stand on its own merit in that
> regard.
> "Variant" alone does not suffice, as many variants of devices have a
> compatible programming model, be that for a subset of features or
> complete compatibility.
>
> > The reason why I think it could be firmware-defined is because we have =
a lot
> > of variants (30xxA, 30xxB, 30xxC, plain 30xx), and the numbers usually =
mean
> > feature level/completeness, e.g. some don't support the touch pressure =
or
> > touchkeys, and we don't know what A/B/C/none means.
>
> Ultimately whether it is due to firmware or the hardware isn't
> particular important, just mention what is incompatibly different.

I propose to update the commit description as such:

	Imagis IST3038B is a variant (firmware?) of Imagis IST3038 IC
	differing from IST3038C in its register interface. Add the
	compatible for it to the IST3038C bindings.

>
> Cheers,
> Conor.
>
>
> > > > Signed-off-by: Markuss Broks <markuss.broks@gmail.com>
> > > > Signed-off-by: Karel Balej <balejk@matfyz.cz>
> > > > ---
> > > >   .../devicetree/bindings/input/touchscreen/imagis,ist3038c.yaml   =
| 1 +
> > > >   1 file changed, 1 insertion(+)
> > > >=20
> > > > diff --git a/Documentation/devicetree/bindings/input/touchscreen/im=
agis,ist3038c.yaml b/Documentation/devicetree/bindings/input/touchscreen/im=
agis,ist3038c.yaml
> > > > index 0d6b033fd5fb..b5372c4eae56 100644
> > > > --- a/Documentation/devicetree/bindings/input/touchscreen/imagis,is=
t3038c.yaml
> > > > +++ b/Documentation/devicetree/bindings/input/touchscreen/imagis,is=
t3038c.yaml
> > > > @@ -18,6 +18,7 @@ properties:
> > > >     compatible:
> > > >       enum:
> > > > +      - imagis,ist3038b
> > > >         - imagis,ist3038c
> > > >     reg:
> > > > --=20
> > > > 2.43.0
> > > >=20
> > - Markuss

Kind regards,
K. B.

