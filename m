Return-Path: <linux-input+bounces-5653-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 986D1956700
	for <lists+linux-input@lfdr.de>; Mon, 19 Aug 2024 11:31:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 43EA01F22D68
	for <lists+linux-input@lfdr.de>; Mon, 19 Aug 2024 09:31:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0319815EFB6;
	Mon, 19 Aug 2024 09:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="nYbxN5ui";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="aVjlq0vV"
X-Original-To: linux-input@vger.kernel.org
Received: from fout3-smtp.messagingengine.com (fout3-smtp.messagingengine.com [103.168.172.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3870715CD61;
	Mon, 19 Aug 2024 09:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724059795; cv=none; b=ab3QX3ZOAPOhh3+/XBqxsal5AUdj/vRkF8AV0bVYFAJ87dEd9wI5rQBBbgWYnp2hdYLmtNG6hK69+EKglvb8/wIjOWxQ2eqlzkAaF30hKW8c4Dt4+hbda9441jh69Aowa6PqMmthWu2AXnCFj/KaIdi31ePylGxBPt2kE+br2io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724059795; c=relaxed/simple;
	bh=7AJQE2xKowxFNilsvWw1WWl8IqrvQTax9diJNtx8/zc=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=eeLRL/ycZe5cmVF4zd3pmpq8vDBBuc9elgTdLDw4NnLqjckgkXyfkpqZzdPTNg4rb2lj836X1PJvRH/nosObM7zn5qLRnvivUUk9V4WgIGtvGXY751u4UUqWEp7taOHv54aKAO5u+jmQqpPRgpZyhPHDKgGDLG/N/f1Zo85FjiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=nYbxN5ui; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=aVjlq0vV; arc=none smtp.client-ip=103.168.172.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-04.internal (phl-compute-04.nyi.internal [10.202.2.44])
	by mailfout.nyi.internal (Postfix) with ESMTP id 3DB7F138FFC3;
	Mon, 19 Aug 2024 05:29:53 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-04.internal (MEProxy); Mon, 19 Aug 2024 05:29:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1724059793;
	 x=1724146193; bh=4JRcUWArpiuPf5j/1DIoae+oRQS+D0B9OSyAAns7OjE=; b=
	nYbxN5ui3Pym+s1YLz+tVyRTI4wJ62ENlbOBoB9V/6al8r/n4hyiGJYRYcAcSZ27
	mxBMAdbHbWXyvaq7aHEPn6XyRW5uPUMncFY2z9rnV0x25px1M9kRuxUYI91O17wB
	18hpPfb+E3XCVO+lrkEOc6LOuYXWC/ZaIxj6IaxvC9BV+1r0Sss9RFBBm4Vxt82/
	IkRM7xXMZDnWWg+VsYSIei9jPPo1Lu1t11IOl2lrENNlj+7N1cnWnNakXhdgwP8z
	5/lPiogMx+nA0tRXW4gBFxiHlKkXug/NuLG0oPiXVVksXl9S6FoB3V52Hf61qRp7
	bCjcOruSyHRWerDJhfDUrQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1724059793; x=
	1724146193; bh=4JRcUWArpiuPf5j/1DIoae+oRQS+D0B9OSyAAns7OjE=; b=a
	Vjlq0vVSV1ZWbiXMJFn0D8tPipSrx3xnC4BvwJAEsAZn6y6ZYhyvLPBDUeChY2ug
	F77paIj6pn2Br9irB2Gq5hhBiyljl1nzxER9DorQddUcOgKbls+I/kSDKq6O/B8h
	d6hTlEXCcPEGuzQmGURB5g3HotGMLftDsndZVoYzCjMj+sGyRYUF8E/4OCRuctye
	PGeFxhdxo9Za289ybsmucldYpaiJP2snulfYxGnj5dGAlleIxAIt4N1l8FGYh4QI
	ykyF+VImW6jYhjOfspSIuD5uT7DzhT5ZBAZe/dSsOQcz/fkU7nMQyO90ECkqzGTE
	WJRTZ6Lb/WxXN3RfBvpZQ==
X-ME-Sender: <xms:kRDDZkS_Uqo_6ahcq6zRop_CPtSXZtCYsZvuPVdMzS3uVNmaLPTiRw>
    <xme:kRDDZhykuG9zB2LwbkTuNenSR00n3K-1QZhjYTV40inhN11IjlFphRAy2yyr543Z2
    KUYGQqdYQjumxn8Nc0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddruddugedgudejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddt
    necuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrd
    guvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefg
    gfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepiedp
    mhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepughmihhtrhihrdhtohhrohhkhhhovh
    esghhmrghilhdrtghomhdprhgtphhtthhopehlvggvsehkvghrnhgvlhdrohhrghdprhgt
    phhtthhopehlihhnuhhsrdifrghllhgvihhjsehlihhnrghrohdrohhrghdprhgtphhtth
    hopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdr
    ohhrghdprhgtphhtthhopehlihhnuhigqdhinhhpuhhtsehvghgvrhdrkhgvrhhnvghlrd
    horhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghl
    rdhorhhg
X-ME-Proxy: <xmx:kRDDZh1gP_63DC7v1BWWl97SEHb9LJKN00FyjSt0EEfP9KVrXiv1uA>
    <xmx:kRDDZoBm9TYTJM5sbSPs1Ey6UUdcAXENX_msL9JVhyq9XSpFlLErFw>
    <xmx:kRDDZtho15q50DN5CkmFsEm0pRjJmSdYUVg6Hch0UiYZp3ZPuP3_Gg>
    <xmx:kRDDZkpQ8O3cSxR5v4qPC7yd7xG0wg91ReWq9pxm6bzKhBh09OHICg>
    <xmx:kRDDZrYP2E3RAGJ1ZH5HP7_pnyTIwOMrgfayimKjaNy4KHnWnwvfV5FL>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 0FBCA16005E; Mon, 19 Aug 2024 05:29:53 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 19 Aug 2024 11:29:32 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Dmitry Torokhov" <dmitry.torokhov@gmail.com>,
 "Linus Walleij" <linus.walleij@linaro.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 "Lee Jones" <lee@kernel.org>, linux-arm-kernel@lists.infradead.org
Message-Id: <1bc01e00-7b70-4e90-8060-f3de3ec7afa3@app.fastmail.com>
In-Reply-To: <Zr-gX0dfN4te_8VG@google.com>
References: <Zr-gX0dfN4te_8VG@google.com>
Subject: Re: [PATCH] Input: keypad-nomadik-ske - remove the driver
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, Aug 16, 2024, at 20:54, Dmitry Torokhov wrote:
> The users of this driver were removed in 2013 in commit 28633c54bda6
> ("ARM: ux500: Rip out keypad initialisation which is no longer used").
>
> Remove the driver as well.
>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
>  drivers/input/keyboard/Kconfig                |  11 -
>  drivers/input/keyboard/Makefile               |   1 -
>  drivers/input/keyboard/nomadik-ske-keypad.c   | 378 ------------------
>  .../linux/platform_data/keypad-nomadik-ske.h  |  50 ---
>  4 files changed, 440 deletions(-)
>

Acked-by: Arnd Bergmann <arnd@arndb.de>

I have a list of drivers that I determined to be likely
unused as well and found a few more input drivers
that were unused in 2022:

CONFIG_KEYBOARD_ADP5520/CONFIG_PMIC_ADP5520
CONFIG_KEYBOARD_ADP5589
CONFIG_INPUT_AD714X
CONFIG_TOUCHSCREEN_AD7877

As far as I can tell, these all lost their last device
definition, or they never had one and are impossible to
be used with device tree data.

     Arnd

