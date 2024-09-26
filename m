Return-Path: <linux-input+bounces-6783-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4361C987AD2
	for <lists+linux-input@lfdr.de>; Thu, 26 Sep 2024 23:51:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F296B284D67
	for <lists+linux-input@lfdr.de>; Thu, 26 Sep 2024 21:51:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B464B188733;
	Thu, 26 Sep 2024 21:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b="k7FcpV9L";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="EB0Z/WN8"
X-Original-To: linux-input@vger.kernel.org
Received: from fhigh-a5-smtp.messagingengine.com (fhigh-a5-smtp.messagingengine.com [103.168.172.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E9A74D8C8;
	Thu, 26 Sep 2024 21:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727387469; cv=none; b=m4o7WTJKiiR+kq3TepngqQ3E66b4uqLh36nUUeVz9wKnxn+I5A1Ak/aG7hOTPrq94wkTzmi2hMfWA2h9yaZzJ5PQ9azuWbUCy3BsRhtsQo4YE8LTAKwBmj5uM7V+WhDrVXLAiu1cbnXcPFS0lS/z1fGeNJiwhbNzr38aSXXb3Tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727387469; c=relaxed/simple;
	bh=+LrZtZuxB1yky8XJNegEZBgeTMWsNHrgz2WWJN5NT4Q=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=i9CIL9zGnkAnXOipfuzsgmajxbwKiJev6EBqp3kVOr2kC8oGut+h0lhimnGp/Sivj4rirwFBJzNgpoeGyJPbLn5DaXiSEZEImBvsp2Amckr6T6CFW7Z7l94wgmud8QNNnawJoZR6MWtz/F2kN2MQY9Ub2g6vK6C/XHpGCK3CfLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev; spf=none smtp.mailfrom=ljones.dev; dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b=k7FcpV9L; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=EB0Z/WN8; arc=none smtp.client-ip=103.168.172.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ljones.dev
Received: from phl-compute-08.internal (phl-compute-08.phl.internal [10.202.2.48])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 13A7511401E8;
	Thu, 26 Sep 2024 17:51:07 -0400 (EDT)
Received: from phl-imap-01 ([10.202.2.91])
  by phl-compute-08.internal (MEProxy); Thu, 26 Sep 2024 17:51:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1727387467;
	 x=1727473867; bh=+LrZtZuxB1yky8XJNegEZBgeTMWsNHrgz2WWJN5NT4Q=; b=
	k7FcpV9LFgRtT8yrHhKwe5Mxw4VKz7q6YIByA+P7fXF3jFFNqtxUTs8OB4ucXhpi
	6miT3EI1BkGlMoxrLzA8Kpa3qVwbHK3HoKKhlNYxvbgbhXFC7LZgnQfLVRhvgwda
	rCFHcTkUgWW1ov0lO2+SnA3KPQbpk3R7SM1lSs9PrzaxZ5DhMOf8bV0rvEuaJLNW
	mtDaza722gkSi1eKdxvWnMIVOa8ST2bRLdnLpuFGS0eTFlHJ+MGkp409jCPvSuqo
	/0ZjTBrTJP5A6DRmG2rsK/LHmnZj2UfjGlCIJkwQWhhRDeS47OfHFtGGCf0I0RpL
	StTj4Z1MYi2NTZ9x5Z3bdg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1727387467; x=
	1727473867; bh=+LrZtZuxB1yky8XJNegEZBgeTMWsNHrgz2WWJN5NT4Q=; b=E
	B0Z/WN8ImuoL2mc4eNEeIc0uDXxxTTrjmXFd1VoQLRSrbXTf0OyVZybWAyjGKB/o
	GsCMgIzDxFxLh0kk79SVyQm4bf/vW5B41MhM7WEDvk9+l2G3NNfdSCDsUWu6ypPN
	12p8thr3WjIkq7vOutqDATatEVv5XgrMrWXMzW8HHxX6QHeaMFr+hqu8i36RhiK6
	bN9GH9lL3AHdXkhlMoYlHSnT9v6oJVy0woxp/OBSKg5qdW66Xg7be/d0ayIYx3ip
	BYLr7YTR2NoEMcIINJLlXpOOUqXVoEXxnuXCgXOhLbtuc/H6zmFvYcZvLFtU7Rh4
	crvXAhARQsZmRlGbg+x4A==
X-ME-Sender: <xms:Stf1ZjnDvG051HRsRcgxEgKxjOC3ZFSbosHvQ-7rBDHeHIIq9u9PBw>
    <xme:Stf1Zm1xRv_0u9fYyQd0W-PBdcK498cD4AvtRdeuGoGimz6MzkE7MKwLCoT5YXfo4
    INcH_nRO5IU0ZvkYu4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvddtkedgtdduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtqhertdertdej
    necuhfhrohhmpedfnfhukhgvucflohhnvghsfdcuoehluhhkvgeslhhjohhnvghsrdguvg
    hvqeenucggtffrrghtthgvrhhnpeekleejjedtjeduvdehleejfffhgefgveejgedtvddt
    teejtdeijedvffehgfdvjeenucffohhmrghinheptghmuhdrvgguuhenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehluhhkvgeslhhjohhnvghs
    rdguvghvpdhnsggprhgtphhtthhopedutddpmhhouggvpehsmhhtphhouhhtpdhrtghpth
    htoheptghorhgvnhhtihhnrdgthhgrrhihsehgmhgrihhlrdgtohhmpdhrtghpthhtohep
    sggvnhhtihhssheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepjhhikhhosheskhgvrh
    hnvghlrdhorhhgpdhrtghpthhtohepshhuphgvrhhmudeskhgvrhhnvghlrdhorhhgpdhr
    tghpthhtohepihhlphhordhjrghrvhhinhgvnheslhhinhhugidrihhnthgvlhdrtghomh
    dprhgtphhtthhopehhuggvghhovgguvgesrhgvughhrghtrdgtohhmpdhrtghpthhtohep
    lhhinhhugidqihhnphhuthesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhope
    hlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthho
    pehplhgrthhfohhrmhdqughrihhvvghrqdigkeeisehvghgvrhdrkhgvrhhnvghlrdhorh
    hg
X-ME-Proxy: <xmx:Stf1ZpqRwggJO7S9FWsQmM9gLKC_Ygn4Vxrx_2fhKyyqQG_3VrH-XA>
    <xmx:Stf1ZrnGg5SBrnq_lB34fryJed69_KkOo4yMo4ulqPzIW8ZspQ7L5Q>
    <xmx:Stf1Zh2XdX0kfqjRMTeh8Gn2i8ZI73IaaAi1dQlOEADSB_qLtiv_xA>
    <xmx:Stf1ZqsBeAal5-w13I6AHQUOichBUvx-J22NupeIwAG1PHBC3EIwqg>
    <xmx:S9f1ZqIUAbDpvxfh3vfbpZU_oaz3MU21miot9kJ00BsKfsS58pnthIpF>
Feedback-ID: i5ec1447f:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id C4A303360077; Thu, 26 Sep 2024 17:51:06 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Fri, 27 Sep 2024 09:50:46 +1200
From: "Luke Jones" <luke@ljones.dev>
To: "Markus Elfring" <Markus.Elfring@web.de>,
 platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org,
 "Benjamin Tissoires" <bentiss@kernel.org>,
 "Corentin Chary" <corentin.chary@gmail.com>,
 "Hans de Goede" <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "Jiri Kosina" <jikos@kernel.org>, "Mario Limonciello" <superm1@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>
Message-Id: <f3b059cd-0045-435e-9bb9-467bb9cb0cc1@app.fastmail.com>
In-Reply-To: <08320b8e-a71b-4055-9fdf-1df76530ec1a@web.de>
References: <20240926092952.1284435-4-luke@ljones.dev>
 <08320b8e-a71b-4055-9fdf-1df76530ec1a@web.de>
Subject: Re: [PATCH v4 3/9] platform/x86: asus-armoury: move existing tunings to
 asus-armoury module
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



On Fri, 27 Sep 2024, at 7:10 AM, Markus Elfring wrote:
> =E2=80=A6
> > +++ b/drivers/platform/x86/asus-armoury.h
> > @@ -0,0 +1,146 @@
> =E2=80=A6
> > +#ifndef _ASUS_BIOSCFG_H_
> > +#define _ASUS_BIOSCFG_H_
> =E2=80=A6
>=20
> I suggest to omit leading underscores from such identifiers.
> https://wiki.sei.cmu.edu/confluence/display/c/DCL37-C.+Do+not+declare+=
or+define+a+reserved+identifier

Hi Markus,

the link is C standard, not kernel C right?
Pretty much everything I look at in the kernel seems to use the leading =
underscores.

Regards,
Luke.

