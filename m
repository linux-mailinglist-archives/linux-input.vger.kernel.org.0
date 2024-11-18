Return-Path: <linux-input+bounces-8137-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A09A9D1BB8
	for <lists+linux-input@lfdr.de>; Tue, 19 Nov 2024 00:11:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D7F5EB22616
	for <lists+linux-input@lfdr.de>; Mon, 18 Nov 2024 23:11:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3360D192D77;
	Mon, 18 Nov 2024 23:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=who-t.net header.i=@who-t.net header.b="CcLxLmdI";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="mbVdAtnd"
X-Original-To: linux-input@vger.kernel.org
Received: from fhigh-a3-smtp.messagingengine.com (fhigh-a3-smtp.messagingengine.com [103.168.172.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DABE153BE4
	for <linux-input@vger.kernel.org>; Mon, 18 Nov 2024 23:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731971460; cv=none; b=Wsby4HbtQgeo/opn9Ok/wPT07qZjXg1RwGNBlkrfmtzW/HYKHysb28P6TsjCFh8UnMJA/3SuezT1fjcwKaolcazlMMbiEMgUk/KNPnC4r+iCawnF1Srdavs70efJ6kqC1zM3uTqIR0kvxsUppyXfqbXFm97eCqDaQxQ/8bjM71c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731971460; c=relaxed/simple;
	bh=1/oUVQ54sOgEwqlOZ6zBndHnnHkjB46idU7WVt/usvE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ACmbapFh76Qv43bOEjlYQv9ItDN8sMRWAm0wymAZW7D1LvcKFkguWOi+3xNzBlSaw8N1ImiMG3Qxw2xPBbPtlBCI+wsCShc+oIFGOkaYKjy8aP44g8d1XKsuw38xzAYcxWGjx0YdacetjyCcuqIX9iZnOUlshpN3745+QkYKuvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=who-t.net; spf=pass smtp.mailfrom=who-t.net; dkim=pass (2048-bit key) header.d=who-t.net header.i=@who-t.net header.b=CcLxLmdI; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=mbVdAtnd; arc=none smtp.client-ip=103.168.172.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=who-t.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=who-t.net
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 56E591140262;
	Mon, 18 Nov 2024 18:10:56 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-12.internal (MEProxy); Mon, 18 Nov 2024 18:10:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=who-t.net; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:subject:subject:to:to; s=fm2;
	 t=1731971456; x=1732057856; bh=DtEvzlt/sqpDuUmgK2w02yz/g8Yle0ip
	G/uli9OcYzc=; b=CcLxLmdIaDXxqhqcxKV9/o1HpQQMEkHtIACXZbDZYrtMEGz9
	Der9GOuJcGmA+elc+n4L6s80whloTQzL5oGYcL0fgO+kHf1gQzhCBLvFcnIj9/ed
	0XK3ck1ZMaU9TlTnb+GYIETWUoctIwPqADg+g2xjIRTMGwM8INf19dVN8xvc1uou
	IanPW5ZGfAayrugkLoh4boOqKxHhEyr0FOySsSXJcjQuS0DGt37uEUauKrR1c/qg
	4co6Gy0Dni68cS8Ih4VL9+An16ZrosSDVCqHc6I9tIwVJXqzG0zD4ivIb4IwaahU
	4hsLorn82TFYUFP6pBX+UAIzLJQ4uqVWS4FmFw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1731971456; x=
	1732057856; bh=DtEvzlt/sqpDuUmgK2w02yz/g8Yle0ipG/uli9OcYzc=; b=m
	bVdAtndtmEp8WSsiOwZGQ0d69eXvDiAn9hbsd4W7rqdbZhfJGpNz62hbq7bvcnXS
	icY+GoOMtWYBIGy9cjthx2J2F0hK5q/LBf3zH3MNi9Do0pmm1xAYyUVqkRGmGDHu
	Y+XCDe420nj1NIy0rYc4X58QQpcVsSzvKKw5zxVE8Wlk71Y3nu2Vgrn/bGNCLgrc
	Z80YV/IlLHU7peYO/XzlHf2UznTCc3ZWioPS5cNEg1V32T8mcQQQYtszaA7LGjOp
	INFQq8ehl3w6d18SmDYNWEjWgWuJP87c+8pzJm1kbiTXX6ePNzGEihA8a6NjhNiL
	vgHM3dZqgrczGAMZB89bQ==
X-ME-Sender: <xms:gMk7Z-uo6mazaG91JsDMRplVPaY0GPWVSuqwKLZuk01vw03kQWjAsw>
    <xme:gMk7ZzcqR3D6QQJuZSINRrARExmU3aAvlslNSZyqzu9_epFlgjSiycEpYJKSL5q0h
    WkTGTwG8I8EziHrJBw>
X-ME-Received: <xmr:gMk7Z5y7TlJzjyRr1qlM8t4vtArvjrSpduccdtpDlgfxN-poE1W-ibVEK5C_Ty0T5KXgEzffyDHdn5j6_Gy3QDzcqtK16vk-L70E>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrfedugddtiecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdpuffr
    tefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnth
    hsucdlqddutddtmdenucfjughrpeffhffvvefukfggtggusehttdertddttddvnecuhfhr
    ohhmpefrvghtvghrucfjuhhtthgvrhgvrhcuoehpvghtvghrrdhhuhhtthgvrhgvrhesfi
    hhohdqthdrnhgvtheqnecuggftrfgrthhtvghrnhepveefveevueelkeevieetudduiedt
    heefiefgveetfeeuhfegieetgeeifeekgeeknecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepphgvthgvrhdrhhhuthhtvghrvghrseifhhhoqdht
    rdhnvghtpdhnsggprhgtphhtthhopeehpdhmohguvgepshhmthhpohhuthdprhgtphhtth
    hopegumhhithhrhidrthhorhhokhhhohhvsehgmhgrihhlrdgtohhmpdhrtghpthhtohep
    jhhikhhosheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepsggvnhhjrghmihhnrdhtih
    hsshhoihhrvghssehgmhgrihhlrdgtohhmpdhrtghpthhtoheplhhinhhugidqihhnphhu
    thesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehmphgvrghrshhonhessh
    hquhgvsggsrdgtrg
X-ME-Proxy: <xmx:gMk7Z5N1x0jsh7QJ39R9E1_A7RBoKHpaMO5BTKyKMQFhw6MRBGrNhw>
    <xmx:gMk7Z-_lVkq_8pin15Y6Wfq12_GAeLzXOfSriDeRqV4sarK_nXjR7g>
    <xmx:gMk7ZxU9z3RhIdBQ8Oea5YvI3GbTN4X_Ep7pLqgnRzWxQf7AAn88QA>
    <xmx:gMk7Z3dxF-U8rifhA-v6SvOTVPpbwASHeqjHGG3zvhbycahkDyTmsw>
    <xmx:gMk7Z1lidNdRxSKe5sS5TplFa12aKcEYKLxkCGXNrWg8xHJ2SouKheHg>
Feedback-ID: i7ce144cd:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 18 Nov 2024 18:10:54 -0500 (EST)
Date: Tue, 19 Nov 2024 09:10:14 +1000
From: Peter Hutterer <peter.hutterer@who-t.net>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <benjamin.tissoires@gmail.com>
Cc: linux-input@vger.kernel.org, Mark Pearson <mpearson@squebb.ca>
Subject: [RFC PATCH] input: Add "AI Assistant" key
Message-ID: <20241118231014.GA2011625@quokka>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Not to be confused with KEY_ASSISTANT which is for Siri/Cortana/...,
this one is the Copilot key.

Unfortunately Microsoft requires that the Copilot key sends
Win+Shift+F23 so this is merely a placeholder for now. Eventually we
may see hardware that actually sends a custom key code for this.

Signed-off-by: Peter Hutterer <peter.hutterer@who-t.net>
---
Note: this is really just an RFC, happy to change the name (which is not
great given we have KEY_ASSISTANT already), the value, anything. The
purpose of this patch is simply to scope if this is something worth
pursuing.

As above, because of the MS specs I don't see any (MS-compatible) HW
sending that particular key in the immediate future. But since userspace
is expected to implement the functionality via the Win+Shift+F23 we'll
need a new keysym for this in XKB anyway.

If the kernel plans to add a keysym for this we can happily re-use that,
otherwise we'll need to define our own but that means some manual
attention if we do get a kernel keycode later.

Thoughts?

 include/uapi/linux/input-event-codes.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/uapi/linux/input-event-codes.h b/include/uapi/linux/input-event-codes.h
index a4206723f503..99c5e866e627 100644
--- a/include/uapi/linux/input-event-codes.h
+++ b/include/uapi/linux/input-event-codes.h
@@ -806,6 +806,8 @@
 #define BTN_TRIGGER_HAPPY39		0x2e6
 #define BTN_TRIGGER_HAPPY40		0x2e7
 
+#define KEY_AI_ASSISTANT                0x2f0
+
 /* We avoid low common keys in module aliases so they don't get huge. */
 #define KEY_MIN_INTERESTING	KEY_MUTE
 #define KEY_MAX			0x2ff
-- 
2.47.0


