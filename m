Return-Path: <linux-input+bounces-10386-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E1E0A453B6
	for <lists+linux-input@lfdr.de>; Wed, 26 Feb 2025 04:08:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 97EA4188931F
	for <lists+linux-input@lfdr.de>; Wed, 26 Feb 2025 03:08:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0D32225388;
	Wed, 26 Feb 2025 03:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b="XpNjFti0";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="vnVNPGAc"
X-Original-To: linux-input@vger.kernel.org
Received: from fout-a3-smtp.messagingengine.com (fout-a3-smtp.messagingengine.com [103.168.172.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 509A6224B0E;
	Wed, 26 Feb 2025 03:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740539307; cv=none; b=Bdj0YFK0nTVbiJY5V44/U8mQRmXmYtZE8FqKQdArSvaLM6a+NqtAXT4mlAp0Zfoh6YV0wnKe2P7UIWAV+BH8Fsejc0fzaTRK3u3YI/2pbUhIcR3TjLU9GXS2THb5jmYZ8vByXIGPXOKXX8LmHlkExrFtEGocqQl4IVYY6ci4UYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740539307; c=relaxed/simple;
	bh=+WpUxyhixO+xvs7xpfPGl9WG65KdWQhk1GqatJbAmIA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tPzIMKd8QYBCampZqgYc576tfbOODYgL5A6wktvellaLwrJV4LTaR1aGs1J862vLx46uoU459acVtYbRyALqTMz/8FGiJGC0s7+s+A4uvfE4ic5RedRKPaty2IIO4lqbLPVc3Mg+0dRGEfcLt8uWWuD2FTVqSSDyMXEvYAZ8Zd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev; spf=none smtp.mailfrom=ljones.dev; dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b=XpNjFti0; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=vnVNPGAc; arc=none smtp.client-ip=103.168.172.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ljones.dev
Received: from phl-compute-11.internal (phl-compute-11.phl.internal [10.202.2.51])
	by mailfout.phl.internal (Postfix) with ESMTP id 363381380A38;
	Tue, 25 Feb 2025 22:08:24 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-11.internal (MEProxy); Tue, 25 Feb 2025 22:08:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1740539304;
	 x=1740625704; bh=+WpUxyhixO+xvs7xpfPGl9WG65KdWQhk1GqatJbAmIA=; b=
	XpNjFti0qRuBGJ7Y9PHjuVG4AT2iF8uGzdGtR5Nok2cgCd/NKZwPHK9K2E+GGJEt
	cUirfpENXMLiMCjdWu64QJbopozD8ry9rrH6yvvjZY3xe5Tf2MKSAFprTg6rawd7
	jp6i153322NzQNxvcWUzXnKXjoGHKm4hfkGWYaCkC0HRRAreNQtfptrRU+mKyitu
	0hiEGVVDEdfc4EadMI4rlEa73C+29dFFF+RLHMpEtGz0PwOVKXGTIiZt+6eiIj5+
	js3NzoYQiWaaUcZB5CTynnR6S4uGI1kplLSi24yHPYX05ayGhZ9EqUYexErefRpU
	gbrbOIRPidu4d/dk1orsGw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1740539304; x=
	1740625704; bh=+WpUxyhixO+xvs7xpfPGl9WG65KdWQhk1GqatJbAmIA=; b=v
	nVNPGAcajaKNdC7/3mswz1ulFKg6vmBW4MVV0o+0HoMWeB+dTttQ64VOAHiEF4zY
	g03CKAb95lNgrEJq3WBR+2N63IwhcR8QnxEvHsHMlpo3UdQBc1eix7wig1i3BZMV
	RW9jK7y2tFoe9HqhnTceXegfNp3sbDJ39SJIy6CAQXToQVTI0UzrMUFKkbnrPe+K
	V47owvczDJ+UQFJzWRgNqdzn5ix/kp5txG9jk74lHT1p/eNTxdZjJrx1u5MT1Vai
	fGHbhySNF5xg12NILi2oDelOIOpM+NQ1XIy3t81mgZ+Z9Q0FRsLpPs8iCV6H+CKO
	KJPf7aCmBLuc5DOk1udrg==
X-ME-Sender: <xms:poW-Z6r2beDFH8rRGoNn9Fq-uiKbcCy2bEl5tSzac9Psz8vE4qi0GA>
    <xme:poW-Z4reHHOyTTgFuNcfJDVnSB3CVldJyruj5ieJLDtA_cy39SrMI3wGgVcOjPH4s
    lB8E9k5kJhJthEP5Lc>
X-ME-Received: <xmr:poW-Z_MU072OqUA7AMRqBjQOVBPBkLX3-1TN9ZwDstDH3ZWn0Pd3rpNobMnSFX0W-6Djbp7Cce_2xt6clQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdekfeeghecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecunecujfgurhepkffuhf
    fvveffjghftgfgfgggsehtqhertddtreejnecuhfhrohhmpefnuhhkvgculfhonhgvshcu
    oehluhhkvgeslhhjohhnvghsrdguvghvqeenucggtffrrghtthgvrhhnpeekfeffueejve
    eujeeugeelleehtdegvdeludektddtfffhieefledvudehfeejieenucevlhhushhtvghr
    ufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehluhhkvgeslhhjohhnvghsrd
    guvghvpdhnsggprhgtphhtthhopeekpdhmohguvgepshhmthhpohhuthdprhgtphhtthho
    pehlkhhmlhesrghnthhhvggrshdruggvvhdprhgtphhtthhopegsvghnthhishhssehkvg
    hrnhgvlhdrohhrghdprhgtphhtthhopehhuggvghhovgguvgesrhgvughhrghtrdgtohhm
    pdhrtghpthhtohepihhlphhordhjrghrvhhinhgvnheslhhinhhugidrihhnthgvlhdrtg
    homhdprhgtphhtthhopehjihhkohhssehkvghrnhgvlhdrohhrghdprhgtphhtthhopehl
    ihhnuhigqdhinhhpuhhtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplh
    hinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohep
    phhlrghtfhhorhhmqdgurhhivhgvrhdqgiekieesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:poW-Z56pmcbhkl_KT2ceEZY_uuK_KAg-_3lpL42XRuuEyZzlPbT6NQ>
    <xmx:poW-Z57wvDvW4JbTh1TLLWSZZVM58qXCxh5y8zmen_F5g1zoJvJc4Q>
    <xmx:poW-Z5gDL4ZB-yKqfN1qLmfsYiUbQ5jN16LuYM4IzrFzLZ7J68Md6g>
    <xmx:poW-Zz6p_PG8aZfyKBKKcAPxSy7zZ6GBc17kUIfnly0sBvFdZwWjVQ>
    <xmx:qIW-Z0YfA_3rIN5rM7NbJisHV8xukvenfwH4LGWJQoPY1EdkGcE_9kkX>
Feedback-ID: i5ec1447f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 25 Feb 2025 22:08:20 -0500 (EST)
Message-ID: <027706ba7b19a4eefb51aeddb5d10cc235751780.camel@ljones.dev>
Subject: Re: [PATCH 2/2] platform/x86: asus-wmi: Refactor Ally suspend/resume
From: Luke Jones <luke@ljones.dev>
To: Antheas Kapenekakis <lkml@antheas.dev>
Cc: bentiss@kernel.org, hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com, 
	jikos@kernel.org, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	platform-driver-x86@vger.kernel.org
Date: Wed, 26 Feb 2025 16:08:15 +1300
In-Reply-To: <20250225141549.11165-1-lkml@antheas.dev>
References: <20250225081744.92841-3-luke@ljones.dev>
	 <20250225141549.11165-1-lkml@antheas.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, 2025-02-25 at 15:15 +0100, Antheas Kapenekakis wrote:
> Hi Luke,
> setting MCU powersave too close to the boot-up sequence can cause the
> controller of the original Ally to malfunction.

Read the code. It doesn't, as it is set by hid driver. Zero issues in
all our testing.

> Which is why you created
> this little init sequence in which you call CSEE manually. In
> addition,

No it wasn't.

> MCU powersave (which is called Extreme Standby in Windows and you
> named
> incorrectly in asus-wmi), causes a very large 8 second delay in the

That is a UI label. ASUS call it Mcu Powersave in internal emails to
me. It is also called *MCUPowerSaving in their source code.

> resume
> process. It should under no circumstance be set enabled by default.
>=20
> Users that want it can enable it manually. Following, distributions
> that
> want it and lack the appropriate configuration interface can use a
> udev
> rule with an 8 second delay to enable it, and then, the udev rule
> should
> first check if mcu_powersave is disabled before enabling it. This is
> because writing to it even with the same value causes an issue
> regardless.
>=20

No it does not.

> Therefore, please remove both parts of it from the second patch in
> your
> series and produce a v2, which contains no hints of CSEE. When you
> do:
>=20
> Suggested-by: Antheas Kapenekakis <lkml@antheas.dev>
>=20

No. You've suggested changes with zero testing, simply in an attempt to
get a tag.

> Following, when you do finish the new Asus Armoury patch series,
> please
> rename MCU powersave to extreme standby, and add a suggested-by in
> the
> appropriate patch. Since to avoid user confusion, the names should
> match
> their windows branding.
>=20

No. See first response.

> During our testing of the controller, we found that the lack of a
> delay
> causes the RGB of both the Ally and the Ally X to malfunction, so

This is to do with your own code in userspace.=20

> this is
> a small nack for me (the old quirk is preferable in that regard). But
> then
> again, this patch series is not getting anywhere close to our users
> even
> if it is accepted, so you can do as you wish (given appropriate
> attribution).
>=20

Your message attempts to frame this as a personal matter ("small nack
for me," "you can do as you wish") rather than providing substantive
technical feedback appropriate for LKML.

To be clear: This patch is submitted for mainline Linux kernel
consideration, not your downstream project. Your NACK lacks technical
merit relevant to mainline development, as you yourself acknowledge
these changes would not affect your users.

As I am the maintainer on this driver I will proceed with the
submission process as there are no valid technical objections to
address. Further non-technical commentary on this thread is
unnecessary.

Cheers,
Luke.

