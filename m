Return-Path: <linux-input+bounces-5654-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C086295674A
	for <lists+linux-input@lfdr.de>; Mon, 19 Aug 2024 11:41:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6B6951F24BAE
	for <lists+linux-input@lfdr.de>; Mon, 19 Aug 2024 09:41:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50FE415D5B9;
	Mon, 19 Aug 2024 09:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="EVyO7mtz";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="FiSapmV+"
X-Original-To: linux-input@vger.kernel.org
Received: from fhigh7-smtp.messagingengine.com (fhigh7-smtp.messagingengine.com [103.168.172.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90BCC15C15D;
	Mon, 19 Aug 2024 09:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724060480; cv=none; b=Kmpw4x9Z2vLBlvWf4W/52z4clavnQd5K7Un3GdoPjn1GlwFHE8PWKKcKE/BeHxHZkk2FvX/cFzCuqH9mZXjU+LonHz09Wb5op/Fq7NG617GmdsIkz8kkvq47/DleYinAOagzPpKNiZ3Is16m5mEEwZMYABH/wMiOy0GJ7Fumlyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724060480; c=relaxed/simple;
	bh=/ywwrsow94J85Jt0nnWejc0IG94tUBES4XMZGLo0RHo=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=NCQZOhzm66aiPpiccGmJqvmtnJnx/CTin9D61VBFyEN8iYdsDc/8E+BfiET4Y+1i53BdVLTcWA9VC1MLZOKvO7IjG9MzKx+eixebPQ/Jdoc78XcSwJ1t/d8apuSqDg2qeVk0XxW8HfeR1Izzyq9nNsWHtJY9n8Ov4DcVXIHZ96k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=EVyO7mtz; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=FiSapmV+; arc=none smtp.client-ip=103.168.172.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-04.internal (phl-compute-04.nyi.internal [10.202.2.44])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 8D9481146D40;
	Mon, 19 Aug 2024 05:41:17 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-04.internal (MEProxy); Mon, 19 Aug 2024 05:41:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1724060477;
	 x=1724146877; bh=JUhoxhqu4F3xLPzws7FodPxaF1OPTKmmWcQLfa8wy7Y=; b=
	EVyO7mtzb1j7QAg2y/fPlCAfeJsy2nydHOyMuhgavHgV3e6S5BrlQcO0dPNX7k4n
	wc/s6ejilTX4vfAXn0iQWWC7jpM8vbZRzabUt3dlCoArN3AdkpJ0iS2ssi524j9Z
	kKcticrRA5HkovO39hhYWd7C+TSYQpUYd3NCOAUNYBkOC8H/TwXqgHR88mnhr49v
	YEtvg0PBzfEJscOdjY8w0NAGErkf/Z3Kh38Dnhej5CSS5zAdIpR0dHIbAZ6i36R6
	hwAwzz2N7Y2LqnrdATLgfZbqK+lPv3UEWKul6YkGeyxDDG4OFefTFdNBulm55bV2
	Dt0nN0x9WnRzDoAYM5Z1WQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1724060477; x=
	1724146877; bh=JUhoxhqu4F3xLPzws7FodPxaF1OPTKmmWcQLfa8wy7Y=; b=F
	iSapmV+uRnGVad6FOjyb6ha2Sbc8nSRL8ThL3/WvORtY10IAyx6VJiP4npQTzoBU
	/5EA0kTM6n+jqqCeGr2V+pnSlZpbXtEK878yL0M2FTFVnagzCWqgINdSC/SoLDyU
	R+mVqJyAFGd6EjOBZVW13XQcNvb+adlbhxMa2BTCvqbVw+R77SJbl95Q7dJCt1li
	5WeS6YY0OdhErJ7bOtPgFTt8aaoqDdE2fBxkIUhRzUTwnDqQsFaPFa08eOQnLQjl
	1fYLx1Apd3C6bEMK7uBjO/QlUreBhVrw4VUSul//tEVvcDH8B46pBU6R9RMoV0Uw
	fP+JsYZBIvZDyHchurthA==
X-ME-Sender: <xms:PRPDZtAeXjQjzQ9oHRNi7dmIEo6iGs_7cL0I75HREdXm9kpolvbbPQ>
    <xme:PRPDZrgaeOtg68QumbOuU_V7fzh8lfXUEdXFheoY__JwgQs0R2SZY61S7nmLnsDCN
    Ql_QHQpYqj_hB7mHXk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddruddugedgudekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddt
    necuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrd
    guvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefg
    gfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepledp
    mhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepughmihhtrhihrdhtohhrohhkhhhovh
    esghhmrghilhdrtghomhdprhgtphhtthhopegsrhhoohhnihgvsehkvghrnhgvlhdrohhr
    ghdprhgtphhtthhopehkrhiikheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinh
    hugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhr
    tghpthhtohepphgrthgthhgvshesohhpvghnshhouhhrtggvrdgtihhrrhhushdrtghomh
    dprhgtphhtthhopeguvghvihgtvghtrhgvvgesvhhgvghrrdhkvghrnhgvlhdrohhrghdp
    rhgtphhtthhopehlihhnuhigqdhinhhpuhhtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpd
    hrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
    pdhrtghpthhtoheplhhinhhugidqshgrmhhsuhhnghdqshhotgesvhhgvghrrdhkvghrnh
    gvlhdrohhrgh
X-ME-Proxy: <xmx:PRPDZokIJVM8sDMiwKFaIvaC2Z54sK9kpcd0xxmC4kGxI6zVlheTcg>
    <xmx:PRPDZnwkn52t-4RoqltLbFDptT1_je7h0BSVTntOZbMwV74IDtOQlQ>
    <xmx:PRPDZiS1HX5Ihk43khQ-0rmXQWxj2VZmV8RDaXr0PRyzffIskc_aNw>
    <xmx:PRPDZqYUexn-b27r38FRACSZ3Yvh5FIS8q9c3YEVKSXiBILtKCr43A>
    <xmx:PRPDZlElO9yiE4OXanm-nyTRc1FVwnpxYXPfF4Rt_XgR0MGr-9RYF5en>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 5DB9216005E; Mon, 19 Aug 2024 05:41:17 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 19 Aug 2024 11:40:56 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Dmitry Torokhov" <dmitry.torokhov@gmail.com>,
 "Mark Brown" <broonie@kernel.org>, "Krzysztof Kozlowski" <krzk@kernel.org>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, patches@opensource.cirrus.com
Message-Id: <803e3902-cec9-49ed-baff-d26e578a8ab7@app.fastmail.com>
In-Reply-To: <20240819045813.2154642-1-dmitry.torokhov@gmail.com>
References: <20240819045813.2154642-1-dmitry.torokhov@gmail.com>
Subject: Re: [PATCH 00/14] Remove support for platform data from samsung keypad
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, Aug 19, 2024, at 06:57, Dmitry Torokhov wrote:
>
> This series attempts to rework samsumg=keypad driver to stop using
> platform data and instead rely on generic device properties only.
>
> The first 8 patches are general cleanup/facelift patches.
>
> The 9th patch introduces alternative binding that is more compact that
> the original one, which makes it more suitable for use in legacy (non
> DT) boards with static device properties. Note that the "new" binding is
> the standard binding for matrix keypads.
>
> Patch #10 implements the new binding in the driver, #11 converts the
> only user of platform data in the mainline tree to the static device
> properties, and #12 drops support for platform data from the driver.
>
> Patches #13 and #14 are "bonus" converting the rest of crag6410 to use
> software nodes/properties to describe GPIO keys, LEDs and other
> peripherals. Note that I believe they fix and issue with recent
> conversion to GPIO lookup tables - the names of gpiochip structures I
> think are "GP<N>" ("GPK", "GPL", etc) and not "GPIO<N>".

I had a (brief) look at the patches, everything looks fine to
me, thanks for working on this! Let's see what Mark and 
Krzysztof think.

      Arnd

