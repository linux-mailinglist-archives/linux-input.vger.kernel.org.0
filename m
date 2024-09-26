Return-Path: <linux-input+bounces-6740-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 21D8998702C
	for <lists+linux-input@lfdr.de>; Thu, 26 Sep 2024 11:31:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 52DBA1C227FF
	for <lists+linux-input@lfdr.de>; Thu, 26 Sep 2024 09:31:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EA8E1ACDEE;
	Thu, 26 Sep 2024 09:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b="LnnvjR5u";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="KpjlF3Bd"
X-Original-To: linux-input@vger.kernel.org
Received: from fhigh-a5-smtp.messagingengine.com (fhigh-a5-smtp.messagingengine.com [103.168.172.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D6611AD3E0;
	Thu, 26 Sep 2024 09:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727343014; cv=none; b=K2ck18JXwb1Fr/6OKSoDGhwmTqvhnmTWiNO+EItOYtetF84cvXuuZ9/wJXGrNguSWQ2jSw0rGqEytUQii4aOtYWf+/Azmjaapa6Ma7rhQy1wyPbJjxb4DbnSb7KqSKYFozg+iQac7P9LARl65JIDrn3eFpK3bN/Q20qBuxatCWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727343014; c=relaxed/simple;
	bh=twB1SHB/V/Wj6DMcsCR+sTXlwb+B8SS+xEAN3koco/8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KqmVA7qI7oZFZfcqnHO5cYu8vmDBp9UJ9+GfFcXEJZ7hgsiXQxvqOquyOAhzE8gprA3vMOUYlbYxvZkqtzgg+VXsJCc0Bf6xo7lc9/a8lahXryBrFG2lniBndOh2N/61tvJA/KE+iQlpByOdkpj0r2i4a2JjVEuEXGMRub5ueDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev; spf=none smtp.mailfrom=ljones.dev; dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b=LnnvjR5u; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=KpjlF3Bd; arc=none smtp.client-ip=103.168.172.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ljones.dev
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 63C881140273;
	Thu, 26 Sep 2024 05:30:11 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-10.internal (MEProxy); Thu, 26 Sep 2024 05:30:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1727343011; x=
	1727429411; bh=rnrFaxU3XTW7XRsAHXa6Nez/T4z4Fv+ZOQNjymOlzn4=; b=L
	nnvjR5upWrLN4/o9os4avFuiIYzqh6GMpmRXPzEP4QYlngoPT59aA0IurYNhjp8l
	XDk6kOk+xIXBIPfy5vrHowlIVrtb8CmzJ1UYDYWKSkwylA77LX5e+seAxaD/6b3Q
	ywW463rLOoX6fkHAm51QLstDfq6/X52naxTO6Oy2h4pkj0C6RfZWGBTD945Acd/t
	Y8WWwlxzEXRy9D6t35ulvPa1tbMJ1IyLaLpjJ2NI1TY3MputKFf/9yFpxah06JgV
	u+tasy7y6FZf7Gbibhl5w1xIklCA86JWGed7Hikm0X8mgGyuinBMR21ZkrvsDPKx
	OTCg58sdbpzNERl1ytrYg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1727343011; x=
	1727429411; bh=rnrFaxU3XTW7XRsAHXa6Nez/T4z4Fv+ZOQNjymOlzn4=; b=K
	pjlF3BdvSCoPbqcOU5//FzOUKFnAq9K5bSjbZWhPPU6JfRHyA3BUytB/RsyK96Yi
	gdSv02BckVz3NuxXAUPoei7Hm+nxu0J3n09ekgbNZ1IU1Cx0MuO697cwPZL0U21Z
	e0Q4q5eDujJvuFsrNSrDAGLlBm1azAsUnMSYn1PBEm6KYsQux97gUTHzx2S+7khY
	5+kADY4Vy/kOf2k3FCvyalvGNFQgLat2GtiVtjdm1c8QaOAQd+YaehTpsn6WIRte
	UoIbJFHlaXEfIWj6nTCNikm0iQVgqQyqaD1teRu/rOUeICWFPfSD2VxMbvZOfIGX
	EyBOdbMPmS8AtIFrJ+upw==
X-ME-Sender: <xms:oyn1ZkWMWs7gaWnEu0Pwh0BVXewF6btauA0jMeV6ez7SKKj3OCwDDw>
    <xme:oyn1ZonTJaRjEm_uLFNJ2WA5silYZfBYAAy5hOyq3dnn1ZblCLtSwuWx5kscInn0P
    ZLnamXHk5H1mp7IREo>
X-ME-Received: <xmr:oyn1ZoZ_1Kd3ZX6KzC993wRfL8KFkjdgZeKBYVc9GysDGuIpqWX_dL4-zbhUQQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvddtjedgudejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevuf
    ffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpedfnfhukhgvucffrdculfhonhgv
    shdfuceolhhukhgvsehljhhonhgvshdruggvvheqnecuggftrfgrthhtvghrnhepgfetfe
    dugfetudeuheetjefhuefggfelleetvdevtefhueeujeefvdegleevhefgnecuvehluhhs
    thgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomheplhhukhgvsehljhhonh
    gvshdruggvvhdpnhgspghrtghpthhtohepuddtpdhmohguvgepshhmthhpohhuthdprhgt
    phhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprh
    gtphhtthhopehlihhnuhigqdhinhhpuhhtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhr
    tghpthhtohepsggvnhhtihhssheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepjhhikh
    hosheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepphhlrghtfhhorhhmqdgurhhivhgv
    rhdqgiekieesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehilhhpohdrjh
    grrhhvihhnvghnsehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohephhguvghg
    ohgvuggvsehrvgguhhgrthdrtghomhdprhgtphhtthhopegtohhrvghnthhinhdrtghhrg
    hrhiesghhmrghilhdrtghomhdprhgtphhtthhopehsuhhpvghrmhdusehkvghrnhgvlhdr
    ohhrgh
X-ME-Proxy: <xmx:oyn1ZjUceGhJ8CFe7dV7VWWP02uKHvYWdofGwpiOeF0jqcvZpBLfoA>
    <xmx:oyn1Zulkm5fA69TcGVHDvPuHqn4ncojcgP371COEv3fM5ngbAaLp3A>
    <xmx:oyn1Zofphb9AHIq2sSuOQhLEQNBq6t4wOYKgmNhoQrzz7vO1lDKIGA>
    <xmx:oyn1ZgFK5aiTbh0JhvgpbRNzS2hoH0R-yKyfUoI2dIhwp81g7Uc9iQ>
    <xmx:oyn1Zji00Du_HbdPGzGBRpPWTvPpZQ16yNUVPzlCgo0erth-9_0Hlimw>
Feedback-ID: i5ec1447f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 26 Sep 2024 05:30:07 -0400 (EDT)
From: "Luke D. Jones" <luke@ljones.dev>
To: linux-kernel@vger.kernel.org
Cc: linux-input@vger.kernel.org,
	bentiss@kernel.org,
	jikos@kernel.org,
	platform-driver-x86@vger.kernel.org,
	ilpo.jarvinen@linux.intel.com,
	hdegoede@redhat.com,
	corentin.chary@gmail.com,
	superm1@kernel.org,
	"Luke D. Jones" <luke@ljones.dev>
Subject: [PATCH v4 2/9] hid-asus: Add MODULE_IMPORT_NS(ASUS_WMI)
Date: Thu, 26 Sep 2024 21:29:45 +1200
Message-ID: <20240926092952.1284435-3-luke@ljones.dev>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20240926092952.1284435-1-luke@ljones.dev>
References: <20240926092952.1284435-1-luke@ljones.dev>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A small change to asus_wmi_evaluate_method() was introduced during
asus-armoury driver development to put the exports behind a namespace.

Import that namespace here.

Signed-off-by: Luke D. Jones <luke@ljones.dev>
---
 drivers/hid/hid-asus.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
index a4b47319ad8e..9540e3e19cce 100644
--- a/drivers/hid/hid-asus.c
+++ b/drivers/hid/hid-asus.c
@@ -1301,4 +1301,5 @@ static struct hid_driver asus_driver = {
 };
 module_hid_driver(asus_driver);
 
+MODULE_IMPORT_NS(ASUS_WMI);
 MODULE_LICENSE("GPL");
-- 
2.46.1


