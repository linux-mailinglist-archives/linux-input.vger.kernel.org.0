Return-Path: <linux-input+bounces-3461-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CD418BC31D
	for <lists+linux-input@lfdr.de>; Sun,  5 May 2024 20:52:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ED7F51F213DE
	for <lists+linux-input@lfdr.de>; Sun,  5 May 2024 18:51:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BF5B6BFB1;
	Sun,  5 May 2024 18:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mff.cuni.cz header.i=@mff.cuni.cz header.b="QuRRHMOs"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp1.ms.mff.cuni.cz (smtp-in1.ms.mff.cuni.cz [195.113.20.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97C8250297;
	Sun,  5 May 2024 18:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.113.20.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714935114; cv=none; b=rdqXDtf4hFQo0AtkpiY392TAeVp7cdpYza1qHeSrszDTi9bnNN5JidXqV0P3y1swpoaFfp8tfjrYYalHNP83anqe9U/tnl04t6RvvNkfDPzJ+gSeK+xV2PzcEhBgUm5bzw9Qrgn2Sj2luTCoZEIHGEKaeEltLrPhby0QzYbVjp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714935114; c=relaxed/simple;
	bh=XV/wisvfDecsJK1pH+e3lMIkinGg4Z0g8h7jG8NBLfw=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:To:From:
	 References:In-Reply-To; b=Gq/E6lAwynOWbhJoQk816M7ddHngg2ZwAhbDYLvErklIEWR3RfIoNctHkqwW0l+AMW/ksGsO6YZXw/hczvKA1h41J2PduZHbe16E8soLosUgiCxYftbm622mORUl3sGDCCDZFQpNoJvtL6QsraxkETPImHNdOc4plb66eNqM/J8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=matfyz.cz; spf=pass smtp.mailfrom=matfyz.cz; dkim=pass (2048-bit key) header.d=mff.cuni.cz header.i=@mff.cuni.cz header.b=QuRRHMOs; arc=none smtp.client-ip=195.113.20.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=matfyz.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=matfyz.cz
X-SubmittedBy: id balejk@matfyz.cz subject /postalCode=110+2000/O=Univerzita+20Karlova/street=Ovocn+5CxC3+5CxBD+20trh+20560/5/ST=Praha,+20Hlavn+5CxC3+5CxAD+20m+5CxC4+5Cx9Bsto/C=CZ/CN=Karel+20Balej/emailAddress=balejk@matfyz.cz
	serial F5FD910E8FE2121B897F7E55B84E351D
	issued by /C=NL/O=GEANT+20Vereniging/CN=GEANT+20Personal+20CA+204
	auth type TLS.CUNI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mff.cuni.cz;
	s=submission; t=1714935092; x=1716235092;
	bh=YGxFQsbI+PnN98hU4cHyHP9LF765mb9ESjBSIrA+jBA=; h=From;
	b=QuRRHMOskR69TFkqDXQ4lTIkl4bpFt1ARaYeCqJVTbIpnQeECM3zCn43TSNXlRMLY
	 kdlrgioDh5gkt0j1ivNgNnwAlEPgIEjs8XEvsvBDbnKLI68na8xS+cSJy/VD04I6y6
	 DnZ6gGV/zJSssINrELqjKRfR4JiWBXbUsgFG/RCJn6wF4fi2kFGaxIdupOsDdkWSJ4
	 2ozcoGtgFqE7aeTtxs/ekOrMltieep3yFvFZVQ1e4MPEwRFm1VikvNRNHK7nRsHIvO
	 vxzBEGmSeNL7GlHVh/mJq7acer4rusmQLnql2lswKBXyvlYK/4q9jBEvdzkr3JmRiK
	 IyTyYsJtL5oPQ==
Received: from localhost (koleje-wifi-0024.koleje.cuni.cz [78.128.191.24])
	(authenticated)
	by smtp1.ms.mff.cuni.cz (8.16.1/8.16.1) with ESMTPS id 445IpVNr027317
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Sun, 5 May 2024 20:51:32 +0200 (CEST)
	(envelope-from balejk@matfyz.cz)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 05 May 2024 20:52:06 +0200
Message-Id: <D11XRKUAK8EM.20N91SDPCH584@matfyz.cz>
Cc: "Lee Jones" <lee@kernel.org>, "Rob Herring" <robh@kernel.org>,
        "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
        "Conor Dooley"
 <conor+dt@kernel.org>,
        "Dmitry Torokhov" <dmitry.torokhov@gmail.com>,
        "Liam
 Girdwood" <lgirdwood@gmail.com>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-input@vger.kernel.org>,
        =?utf-8?q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>,
        <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>
Subject: Re: [PATCH v6 3/5] regulator: add regulators driver for Marvell
 88PM886 PMIC
To: "Mark Brown" <broonie@kernel.org>
From: "Karel Balej" <balejk@matfyz.cz>
References: <20240504194632.2456-1-balejk@matfyz.cz>
 <20240504194632.2456-4-balejk@matfyz.cz>
 <ZjeidfoIbjvejphU@finisterre.sirena.org.uk>
In-Reply-To: <ZjeidfoIbjvejphU@finisterre.sirena.org.uk>

Mark Brown, 2024-05-06T00:15:01+09:00:
> On Sat, May 04, 2024 at 09:37:06PM +0200, Karel Balej wrote:
>
> > +static const struct regulator_ops pm886_ldo_ops =3D {
> > +	.list_voltage =3D regulator_list_voltage_table,
> > +	.map_voltage =3D regulator_map_voltage_iterate,
> > +	.set_voltage_sel =3D regulator_set_voltage_sel_regmap,
> > +	.get_voltage_sel =3D regulator_get_voltage_sel_regmap,
> > +	.enable =3D regulator_enable_regmap,
> > +	.disable =3D regulator_disable_regmap,
> > +	.is_enabled =3D regulator_is_enabled_regmap,
> > +	.get_current_limit =3D pm886_regulator_get_ilim,
>
> Do these regulators actually enforce this limit or is this just a spec
> limit beyond which regulation may fail?  If it's just a spec limit I'd
> not expect this operation to be provided, it's more for a hard limit
> where the regulator will detect and act on issues.  I don't see an error
> interrupt or anything and this would be an unusual feature for a LDO.

I'm afraid I don't have the answer -- my only reference is the vendor
version of the driver and I don't see anything there based on which I
would be able to tell.

But based on what you write, my guess would be that it's just a spec limit.

Should I then drop this op and the max_uA values from all the
regulators?

Thank you,
K. B.

