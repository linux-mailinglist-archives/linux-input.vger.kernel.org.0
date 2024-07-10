Return-Path: <linux-input+bounces-4947-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AEFA892CF4E
	for <lists+linux-input@lfdr.de>; Wed, 10 Jul 2024 12:36:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5954D1F21C1A
	for <lists+linux-input@lfdr.de>; Wed, 10 Jul 2024 10:36:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24F63190051;
	Wed, 10 Jul 2024 10:32:30 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1E38190059
	for <linux-input@vger.kernel.org>; Wed, 10 Jul 2024 10:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720607550; cv=none; b=g8C1ei1Wvbay70DtAKfgXOwE0mjAIPYXDmTUo8GZH1IyMWOkY98bFom0etnq2Ac0YIXzRQrrwON9gvvl7dHy/bC2neTbDCSgglGHt2U0adzbGP94nn332dIGGKhacURshlsdYRm07aZTJchpQqnv9XVNdBS6YyI4W5IjSCVhZdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720607550; c=relaxed/simple;
	bh=fTQ7zkRLNDCLn/p4WuewCqh1pWrTOX5y6H7fbS4cZeU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UrwVLg6D3r1T2VOauB3wPobuplqxsQX/3reXkEUEwnaQgdYFXcsf9QVCck2iJYa4Kh7iWnh6rDi+VAIcfoQy5sV/s5WE7ud/vaNGhcKLouKHuhk7ejl9MbC3Aiq/pIcZyq0SmTT6JbUWuTmpNirykRCPkmrz7qjRcNlQi2G0D4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1sRUcX-0001wy-IB; Wed, 10 Jul 2024 12:32:21 +0200
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1sRUcX-008Ui7-4a; Wed, 10 Jul 2024 12:32:21 +0200
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1sRUcX-0006FY-0F;
	Wed, 10 Jul 2024 12:32:21 +0200
Message-ID: <863e5bcd9160090f3b9a93f70da0de50d5efbe9a.camel@pengutronix.de>
Subject: Re: [PATCH v2 1/2] dt-bindings: input: touchscreen: exc3000: add
 EXC81W32
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Conor Dooley <conor@kernel.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring
 <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,  linux-input@vger.kernel.org,
 devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org,
 kernel@pengutronix.de
Date: Wed, 10 Jul 2024 12:32:20 +0200
In-Reply-To: <20240701-evolve-unbutton-ef7d913ad69f@spud>
References: 
	<20240628-input-exc3000-exc81w32-v2-0-c2b21a369c05@pengutronix.de>
	 <20240628-input-exc3000-exc81w32-v2-1-c2b21a369c05@pengutronix.de>
	 <20240628-agonizing-syrup-fcd55c441b3f@spud>
	 <150055844b8af2017fa721ff08bbde473354b2da.camel@pengutronix.de>
	 <20240701-evolve-unbutton-ef7d913ad69f@spud>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-input@vger.kernel.org

On Mo, 2024-07-01 at 15:42 +0100, Conor Dooley wrote:
> On Mon, Jul 01, 2024 at 02:47:50PM +0200, Philipp Zabel wrote:
> > Hi Conor,
> >=20
> > On Fr, 2024-06-28 at 17:21 +0100, Conor Dooley wrote:
> > > On Fri, Jun 28, 2024 at 10:35:51AM +0200, Philipp Zabel wrote:
> > > > Add compatible for EXC81W32 touchscreen controllers.
> > >=20
> > > Could you please mention in your commit messages what makes a fallbac=
k
> > > compatible inappropriate here?
> >=20
> > thank for pointing this out. Actually, I'm not sure a fallback
> > compatible is inappropriate at all. There just is none currently, even
> > though EXC80H60 and EXC80H84 already look compatible to me.
> >=20
> > To my understanding, there's EXC80[WH]{32,46,60,84} models, that should
> > only differ in ball pitch (W or H) and targeted display size (the last
> > number).
> > I don't know if there are actual relevant differences between what I
> > assume are model generations, such as EXC80 to EXC81. At least the
> > limited currently implemented feature set in the exc3000 driver is
> > identical.
> >=20
> > Given that EXC80H60, EXC80H84, and now EXC81W32 all share the same 16K
> > resolution and the same message format (possible differences in
> > capability to measure touch area nonwithstanding), should I prepend
> > this series with a patch:
>=20
> If you're prepared to update the two users to avoid adding more
> dtbs_check warnings, sure.

I'll follow up with another patch series, thanks.

regards
Philipp

