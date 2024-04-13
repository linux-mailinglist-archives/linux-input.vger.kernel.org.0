Return-Path: <linux-input+bounces-2972-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DE6F8A3B9D
	for <lists+linux-input@lfdr.de>; Sat, 13 Apr 2024 10:20:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 662C1284200
	for <lists+linux-input@lfdr.de>; Sat, 13 Apr 2024 08:20:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0583818B14;
	Sat, 13 Apr 2024 08:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=carewolf.com header.i=@carewolf.com header.b="SdVA0LQF";
	dkim=permerror (0-bit key) header.d=carewolf.com header.i=@carewolf.com header.b="d3xRsr+Q"
X-Original-To: linux-input@vger.kernel.org
Received: from mailrelay4-3.pub.mailoutpod3-cph3.one.com (mailrelay4-3.pub.mailoutpod3-cph3.one.com [46.30.212.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C2DA8C15
	for <linux-input@vger.kernel.org>; Sat, 13 Apr 2024 08:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.30.212.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712996413; cv=none; b=l2KY7g6TS3H8tawJzGK1dih88K6fWBZCTQP0RSkAdpwqr67zc255Vr5EEomTShvMUacDpAWPkBAXEl+4BpqMdteGFmO4c+etP5Ao+e377ogycJVKfWE9VeF9SsDx75v6I7uJ794YWHN97pBWrp00H8+js2t6Bn+tULusEtJ+8JM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712996413; c=relaxed/simple;
	bh=EUEoo7haU5sF9rzbZiWlu1L1wCNByTkfQW0khuO9qgw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=C1yBCzZVWDP4sDGF8aRuiiyMfgo0nuiBOXOcoMuT/y/YxQL3tpTBNeQG1afMQVdHqL52sa2XFvP8GjqeHX4m0MTzCudcLKrdHROAL0UREDZ2GvsiQAaXSuUrNDm8HgR5YnrrOO5J3MOiC00dRbDCORBNRbHUEmAflWMjdR1KXJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=carewolf.com; spf=none smtp.mailfrom=carewolf.com; dkim=pass (2048-bit key) header.d=carewolf.com header.i=@carewolf.com header.b=SdVA0LQF; dkim=permerror (0-bit key) header.d=carewolf.com header.i=@carewolf.com header.b=d3xRsr+Q; arc=none smtp.client-ip=46.30.212.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=carewolf.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=carewolf.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=carewolf.com; s=rsa2;
	h=content-type:content-transfer-encoding:mime-version:references:in-reply-to:
	 message-id:date:subject:to:from:from;
	bh=tjPunI/jznegkiLaMDMtl30K2Hk/uqwCOvfwijr6Ysg=;
	b=SdVA0LQFfYwim8KqKVR3vgcSRD+OS1tg9hg8F0UCrlKCg4XyZq9dj/psItnVeOSp2eUhwdNmJ+2Ky
	 YL5+9iCqrsWf+2j+0GcKgu0CBP0d+A1zoUYvrVMatWybfxr7t3SM8r+7yCdeMhMjZEfbZqTiW2/JGH
	 +xpkiWOVCPxiDvZ7LisAb3k4KhQpVIehf5+Bq0qfdHXf1jFjJn1sieblBfX/g4olUqm38fw3LvXSIZ
	 fTfmlwodxphvlVjlJpCGK9xnB2XfIkyUz3IaEsEN+bo/KoNP30PGsVkMk/NuohXVMtoOXnwIk2Jr6/
	 2XDBKkAaqMBoPuICqNi25YayrZcqBlA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
	d=carewolf.com; s=ed2;
	h=content-type:content-transfer-encoding:mime-version:references:in-reply-to:
	 message-id:date:subject:to:from:from;
	bh=tjPunI/jznegkiLaMDMtl30K2Hk/uqwCOvfwijr6Ysg=;
	b=d3xRsr+QMjCeGonWJs4JlLXW3SqAHkJFXLuzUaxMoGqQiKbmV1vKEhbq/k/VsNkgY5lAzABKE8XIH
	 FVDeHCLBg==
X-HalOne-ID: a0b65a72-f96e-11ee-bb1e-9f04b458b84a
Received: from twilight.localnet (dynamic-2a02-3103-004c-5300-4122-02a7-cbcb-6b9e.310.pool.telefonica.de [2a02:3103:4c:5300:4122:2a7:cbcb:6b9e])
	by mailrelay4.pub.mailoutpod3-cph3.one.com (Halon) with ESMTPSA
	id a0b65a72-f96e-11ee-bb1e-9f04b458b84a;
	Sat, 13 Apr 2024 08:20:04 +0000 (UTC)
From: Allan Sandfeld Jensen <kde@carewolf.com>
To: linux-input@vger.kernel.org,
 Filipe =?ISO-8859-1?Q?La=EDns?= <lains@riseup.net>
Subject: Re: hid-logitech-dj support for Anywhere 3SB
Date: Sat, 13 Apr 2024 10:20:03 +0200
Message-ID: <6038382.lOV4Wx5bFT@twilight>
In-Reply-To: <fade9f2881f9b69c0bb3f3b63463c8e9b7656871.camel@riseup.net>
References:
 <4887001.GXAFRqVoOG@twilight>
 <fade9f2881f9b69c0bb3f3b63463c8e9b7656871.camel@riseup.net>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

On Friday 12 April 2024 21:53:31 CEST Filipe La=C3=ADns wrote:
> On Fri, 2024-04-12 at 11:10 +0200, Allan Sandfeld Jensen wrote:
> > Hello,
> >=20
> > I am writing because you are listed as author of the hid-logitech-dj
> > driver. I recently bought a Logitech Anywhere 3SB mouse, and found Linux
> > didn't recognize it. Thinking it was a simple case of new IDs not
> > recognized, I quickly added them to the logitch HID++ drivers (patch
> > attached), both for USB with the new receiver and for the Bluetooth
> > direct connection.
> >=20
> > I have noticed however that the patch while causing them to be recogniz=
ed
> > and interacted with as HID++ devices, it has a flaw. The scroll wheel
> > events are reported by the linux kernel as being in hires mode, while
> > haven't actually enabled it on the mouse. You can fix that using Solaar,
> > but some piece is missing to enable it correctly in the driver.  Since
> > this is no longer a trivial fix. I wanted to reach out. Do you have any
> > suggestions?
> >=20
> > Best regards
> > Allan
>=20
> Hi Allan,
>=20
> Thank you for reaching out.
>=20
> What likely is happening here is Solaar overwriting the configuration that
> the kernel driver sets, as that would happen after the driver talks to the
> device.
>=20
> The settings in question need support in both the kernel and the userspace
> input stack (libinput) for them to work appropriately, it's not like
> configuring RGB or other sort setting on the device that works standalone.
We already have the support in the kernel and libinput. That is why I am=20
expanding it to recognize this new device id.(?)

> I have, multiple times now, asked for Solaar to not expose these low level
> settings that need support from other parts of the input stack, leaving t=
hem
> to the kernel to configure.
> I have been inactive in the Solaar project for quite some time now, so I
> don't feel like yet again make a big deal out of this there, so that this
> decision is reconsidered. I have already spent a significant amount of
> effort there, and nowadays I barely have energy to go through my day and
> deal with my all my responsibilities and other OSS project involvements, =
so
> I sadly have no more energy to spare there.
>=20
> My recommendation is: disable Solaar from running at startup, restart the
> system, and see if that solves your problem. If it does, report this issue
> again to the Solaar upstream, then depending on that outcome, make a
> decision on how to proceed. It may be that setting the high-resolution
> settings in Solaar, which are expected by the driver, works, but it might
> not be super reliable, because since Solaar is overwriting the settings
> configured by the kernel driver, if anything in the kernel driver changes,
> then the setting you have configured in Solaar might no longer be correct.
> There are alternatives to Solaar that do not have this issue, like
> libratbag, but these generally are feature lacking on the productivity li=
ne
> of Logitech projects.
>=20
> Sorry I wasn't able to help much, but I hope that this clarifies things a
> bit, and helps you solve your problem.
>=20
Thanks. You are right, it works with solaar uninstalled, I only installed i=
t=20
to check the details of a device not recognized by the kernel.

So the patch as send to you before is then upstreamable. Is there anything=
=20
more I need to do, to facilitate the upstreaming?

Best regards
Allan=20



