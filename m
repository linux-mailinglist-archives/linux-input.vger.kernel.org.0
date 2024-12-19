Return-Path: <linux-input+bounces-8669-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CFA79F7DD7
	for <lists+linux-input@lfdr.de>; Thu, 19 Dec 2024 16:20:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EF26D1888EDD
	for <lists+linux-input@lfdr.de>; Thu, 19 Dec 2024 15:19:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77A434C62E;
	Thu, 19 Dec 2024 15:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="Sk+7vC6/";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="FSNbfgff"
X-Original-To: linux-input@vger.kernel.org
Received: from fout-b2-smtp.messagingengine.com (fout-b2-smtp.messagingengine.com [202.12.124.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44D3B226183;
	Thu, 19 Dec 2024 15:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734621570; cv=none; b=qpzgvL0VQk6bTLkNQjBUY2EK54YmcbZVbolfAqA7vNgDIvB1FDgeIP1709uKCE1OGfniOUzci2defoDKsabPbXYP8PEkuULvOEf9/YYVspT+f+WakRCeNz6R21Qxls2TWAMSY4ydpIo7peUbSGulFdjxor62iXPrVP1JiBUf2R0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734621570; c=relaxed/simple;
	bh=v55LSlpIVSgxo1YnkThRjnpaTV9iwTblSi38pWw6rYA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bAYyQmUvmtUHvJOI3IYfC9VHwkj9XyZqm5sQXoTQ+wrTSJTmSRCDFs/0ZecY7B6m3WCAFMvCoy9XnMk71GjqJxpB2KEUCWqxKPZ60JVmYJMKPjj2cJvc/DXu9H/13bDe9RFeJPHrLP1FtR0oT7zCAK9EemYGdYlZbo1UuKA76SE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=Sk+7vC6/; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=FSNbfgff; arc=none smtp.client-ip=202.12.124.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfout.stl.internal (Postfix) with ESMTP id 1B4111140161;
	Thu, 19 Dec 2024 10:19:26 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Thu, 19 Dec 2024 10:19:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1734621565; x=
	1734707965; bh=Km7YQ5XAn6Cu+ZjW6d2NXyUcQAdSmfGwMYB2252MZEM=; b=S
	k+7vC6/tO7fnhcm7xe6DJQtx/lAgNpzn4SLDaa0rNSlFTycyjTUE/6U9KsxQkGdI
	JfOxwXlRkxurrDopWqhWN9fg4Sj167t2zwJLPi9tRnczSyNmot9gCDjOvqLqD2xh
	ux0GjevBbu/dV6Te7x7+f7rxCd68oH66t0XBuwEq5Zb8P1aM2I7Fb5IElsG7lqEJ
	gmW1ZxvlMPkvuheF1KUt3f0u1ZdH3S9XyUH7NROMub8mY1BHrVqcsKYQObCNhbQo
	NBe4hzQF+XZqc+vLrPhPR/obbNOe2dZZ2vrfRL50ubR/j696VNyqMoQfejyXOVY6
	7CA1PvSPsIvQqdTIIOE7g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1734621565; x=1734707965; bh=K
	m7YQ5XAn6Cu+ZjW6d2NXyUcQAdSmfGwMYB2252MZEM=; b=FSNbfgffue+SqxoY3
	HPxYa1OlzBdOaCuun/hBzem7HKpOnMpK6jGpeEs5asjVCVWhBfTtTnnlVOgCJRU8
	F6l15XeE7j9iKnUOFgIxq88H+Do5gfI5AEnofsbQ1CELR+yN3J/amrykBOJjddaJ
	h+/gzZ6kjAO3JpNQY3AViYP0xsfydPS1vqsho9PyS/K0NdElRTpfRnB2Kz+EeFvq
	3VsjMnbWiil8ZCe2DPUHpIjcNYVu24rFRrgG59FDfYCSAlkGo0xkHlmmC/z19B59
	kfyI41drtiOS7VmJOaFU1+EMTkDxd9zqyLFVaLq7z4QLAYLhAbRJRLVjxB1fGWmS
	bF8BA==
X-ME-Sender: <xms:fTlkZ7H-cPI9ya8MMe5n2Lrb8K4D14rWPQTZaEfAEle6TPlGLanXGA>
    <xme:fTlkZ4WTEVCIv7sV_t8AfLy7Alz8J_RkhpIORIbbJmx4conjGK7On6uTErIDDHYPN
    21ZRtwp8tk8nvuaPlw>
X-ME-Received: <xmr:fTlkZ9KlAS5yFADfriC1L5c2jx829QqNt5SqMwoYaVSqNYnaibZTr1yhZUkwg8no>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddruddttddgjeefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucgoteeftdduqddtudculd
    duhedmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhep
    ofgrrhhkucfrvggrrhhsohhnuceomhhpvggrrhhsohhnqdhlvghnohhvohesshhquhgvsg
    gsrdgtrgeqnecuggftrfgrthhtvghrnhepfedtvdejfeelffevhffgjeejheduteetieeg
    uefgkefhhfegjeduueethefgvdffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomhepmhhpvggrrhhsohhnqdhlvghnohhvohesshhquhgvsggsrdgt
    rgdpnhgspghrtghpthhtohephedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepmh
    hpvggrrhhsohhnqdhlvghnohhvohesshhquhgvsggsrdgtrgdprhgtphhtthhopegumhhi
    thhrhidrthhorhhokhhhohhvsehgmhgrihhlrdgtohhmpdhrtghpthhtohephhguvghgoh
    gvuggvsehrvgguhhgrthdrtghomhdprhgtphhtthhopehlihhnuhigqdhinhhpuhhtsehv
    ghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlse
    hvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:fTlkZ5GyKVAufoQBp0e7U1WfLK169e8KpXwyQtq11hH3xR-YR8kqbg>
    <xmx:fTlkZxUSHzDx32HpobhDjbHkYrioukKDkueTOHyxaaU_2U2xW4PCnQ>
    <xmx:fTlkZ0MtvMmZNbnmGEWQMLPNaPXSreExykT7poR2GvHFukYTbsShPg>
    <xmx:fTlkZw0JKzz3WSoglr4pspa_Wh7KAvVMOZCqC2CAU_Dbyx8UpMZs2Q>
    <xmx:fTlkZ_duYPpBSBixSCKOfBN_PA82FoPRpPjBX-U0Dm13pVF1XQYyZq5k>
Feedback-ID: ibe194615:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 19 Dec 2024 10:19:25 -0500 (EST)
From: Mark Pearson <mpearson-lenovo@squebb.ca>
To: mpearson-lenovo@squebb.ca
Cc: dmitry.torokhov@gmail.com,
	hdegoede@redhat.com,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] Input: atkbd: Fix so copilot key generates F23 keycode
Date: Thu, 19 Dec 2024 09:18:48 -0600
Message-ID: <20241219151910.14235-1-mpearson-lenovo@squebb.ca>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <mpearson-lenovo@squebb.ca>
References: <mpearson-lenovo@squebb.ca>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The copilot key on Lenovo laptops doesn't work as scancode 0x6e, which it
generates is not mapped.
This change lets scancode 0x6e generate keycode 193 (F23 key) which is
the expected value for copilot.

Tested on T14s G6 AMD.
I've had reports from other users that their ThinkBooks are using the same
scancode.

Signed-off-by: Mark Pearson <mpearson-lenovo@squebb.ca>
---
 drivers/input/keyboard/atkbd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/keyboard/atkbd.c b/drivers/input/keyboard/atkbd.c
index 5855d4fc6e6a..f7b08b359c9c 100644
--- a/drivers/input/keyboard/atkbd.c
+++ b/drivers/input/keyboard/atkbd.c
@@ -89,7 +89,7 @@ static const unsigned short atkbd_set2_keycode[ATKBD_KEYMAP_SIZE] = {
 	  0, 46, 45, 32, 18,  5,  4, 95,  0, 57, 47, 33, 20, 19,  6,183,
 	  0, 49, 48, 35, 34, 21,  7,184,  0,  0, 50, 36, 22,  8,  9,185,
 	  0, 51, 37, 23, 24, 11, 10,  0,  0, 52, 53, 38, 39, 25, 12,  0,
-	  0, 89, 40,  0, 26, 13,  0,  0, 58, 54, 28, 27,  0, 43,  0, 85,
+	  0, 89, 40,  0, 26, 13,  0,193, 58, 54, 28, 27,  0, 43,  0, 85,
 	  0, 86, 91, 90, 92,  0, 14, 94,  0, 79,124, 75, 71,121,  0,  0,
 	 82, 83, 80, 76, 77, 72,  1, 69, 87, 78, 81, 74, 55, 73, 70, 99,
 
-- 
2.47.1


