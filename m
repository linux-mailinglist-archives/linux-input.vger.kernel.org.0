Return-Path: <linux-input+bounces-2468-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 045B1885FC9
	for <lists+linux-input@lfdr.de>; Thu, 21 Mar 2024 18:31:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AFBC51F2229A
	for <lists+linux-input@lfdr.de>; Thu, 21 Mar 2024 17:31:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EF2B84A28;
	Thu, 21 Mar 2024 17:31:50 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from smtp1.ms.mff.cuni.cz (smtp-in1.ms.mff.cuni.cz [195.113.20.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 949D117590;
	Thu, 21 Mar 2024 17:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.113.20.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711042310; cv=none; b=XYK8f4SU2IyL3kVNjWSBSKn/nEunFw+uFu8gGOpzRrM01Dil9RGnHnohXW0np6JffG0nOJHXA8lZENKo2BPRLg3nQu4utGj3LHido0Ho36fDrNzDhB3Ar0VwFVtfYgS5HRpXfEm1M+cg0g7tzFjtG5ft3OXb5kzl6PtLQP/OvCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711042310; c=relaxed/simple;
	bh=lRZvAs6e51QxA2WQumhhbAA6NHprYtIDHJic0YkCZfA=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Cc:Subject:
	 References:In-Reply-To; b=IjL58E79/RQRbMuAnGEN3pSohS6solQmWUQEc0DDFa6+F/OeFv1vFyE6Grqqq/NnTyWnEfbMPOhMjgjqa6TXobQEJpCEsgmsAlSp2/WZE894mWNl8/wYtfxEwQ1db7NLaWS3nkDdkvsejehCzrSBlupecYfGatYfN6Fl0tE+p0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=matfyz.cz; spf=pass smtp.mailfrom=matfyz.cz; arc=none smtp.client-ip=195.113.20.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=matfyz.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=matfyz.cz
X-SubmittedBy: id balejk@matfyz.cz subject /postalCode=110+2000/O=Univerzita+20Karlova/street=Ovocn+5CxC3+5CxBD+20trh+20560/5/ST=Praha,+20Hlavn+5CxC3+5CxAD+20m+5CxC4+5Cx9Bsto/C=CZ/CN=Karel+20Balej/emailAddress=balejk@matfyz.cz
	serial F5FD910E8FE2121B897F7E55B84E351D
	issued by /C=NL/O=GEANT+20Vereniging/CN=GEANT+20Personal+20CA+204
	auth type TLS.CUNI
Received: from localhost (koleje-wifi-0015.koleje.cuni.cz [78.128.191.15])
	(authenticated)
	by smtp1.ms.mff.cuni.cz (8.16.1/8.16.1) with ESMTPS id 42LHVUUq096433
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Thu, 21 Mar 2024 18:31:32 +0100 (CET)
	(envelope-from balejk@matfyz.cz)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 21 Mar 2024 18:32:03 +0100
Message-Id: <CZZLVS3T3QIS.223XHI5OZ7UBG@matfyz.cz>
To: "Mark Brown" <broonie@kernel.org>
From: "Karel Balej" <balejk@matfyz.cz>
Cc: "Lee Jones" <lee@kernel.org>, "Rob Herring" <robh+dt@kernel.org>,
        "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
        "Conor Dooley"
 <conor+dt@kernel.org>,
        "Dmitry Torokhov" <dmitry.torokhov@gmail.com>,
        "Liam
 Girdwood" <lgirdwood@gmail.com>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-input@vger.kernel.org>,
        =?utf-8?q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>,
        <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>
Subject: Re: [RFC PATCH v4 2/5] mfd: add driver for Marvell 88PM886 PMIC
References: <20240311160110.32185-1-karelb@gimli.ms.mff.cuni.cz>
 <20240311160110.32185-3-karelb@gimli.ms.mff.cuni.cz>
 <20240321154211.GA13211@google.com> <CZZK759UU6G7.MFPYOI0HBB6I@matfyz.cz>
 <20240321162045.GC13211@google.com> <CZZL3MNOT0QG.2WDSNX9XD2RET@matfyz.cz>
 <879296b4-5186-4170-af3f-971787d28514@sirena.org.uk>
 <CZZLDK79D5VK.2VK3X59OHIY2Z@matfyz.cz>
 <45079e37-dde9-4310-a112-7af49f35ac77@sirena.org.uk>
In-Reply-To: <45079e37-dde9-4310-a112-7af49f35ac77@sirena.org.uk>

Mark Brown, 2024-03-21T17:17:40+00:00:
> On Thu, Mar 21, 2024 at 06:08:16PM +0100, Karel Balej wrote:
> > Mark Brown, 2024-03-21T16:58:44+00:00:
>
> > > > > > > > +static const struct regmap_config pm886_i2c_regmap =3D {
> > > > > > > > +	.reg_bits =3D 8,
> > > > > > > > +	.val_bits =3D 8,
> > > > > > > > +	.max_register =3D PM886_REGMAP_CONF_MAX_REG,
> > > > > > > > +};
>
> ...
>
> > > You shouldn't be creating two regmaps for the same set of registers,
> > > that just opens the potential for confusion.
>
> > Just the regmap config is the same. Otherwise, each regmap lives at a
> > different I2C address.
>
> Do they both genuinely have the same maximum register?

They do according to the downstream driver which is my only reference.
In fact, there the driver defines the configs separately for each regmap
but with the same values.

