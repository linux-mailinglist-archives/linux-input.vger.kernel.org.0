Return-Path: <linux-input+bounces-8986-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DF43A036A3
	for <lists+linux-input@lfdr.de>; Tue,  7 Jan 2025 04:53:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ECBF93A0831
	for <lists+linux-input@lfdr.de>; Tue,  7 Jan 2025 03:52:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 677AA199EB2;
	Tue,  7 Jan 2025 03:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="zBuP6VhE";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="AcDVliKa"
X-Original-To: linux-input@vger.kernel.org
Received: from fout-a8-smtp.messagingengine.com (fout-a8-smtp.messagingengine.com [103.168.172.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA6A81991B2;
	Tue,  7 Jan 2025 03:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736221569; cv=none; b=saqFgVBHMgVQbdmT6oAH91Fp5eTBmbzkKoB+muvAocActWjHmpyE36av/WRJ/c2R3B+bY+keF7DC2tD1ehQXaM91El1RDRqJoij9/GsvjnkVrQ2sNrsp+dFkpOzJXHzFkPEDuRUuQxLktWnW5nBpKE+16hKO9ZGM95KO68D+eBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736221569; c=relaxed/simple;
	bh=jY09muu9IzqQxyC53OPjOKFK3GzdQU9iv/RSS95rD34=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bCDwBsd7dH3EO/U5jse8KXSQAX97kB7OidSl2Uqz5MLVIUE09hURPWE3iln0PxGvdbKS+S1uenlTBkYKlH9/T0vchwgFX+7gL1W/+xt4u69TPEktxuKEg15R38Y4Vs+n1qufn37u71kvxILYd+CqCk9Jx7CCXeC0HMwP4NX3EMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=zBuP6VhE; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=AcDVliKa; arc=none smtp.client-ip=103.168.172.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfout.phl.internal (Postfix) with ESMTP id A1024138028E;
	Mon,  6 Jan 2025 22:46:02 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-12.internal (MEProxy); Mon, 06 Jan 2025 22:46:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1736221562; x=
	1736307962; bh=AW0WXU3lYkPf8/DUmaCHhxgu6TUsNJnYRXwoT2LsNPU=; b=z
	BuP6VhEAoLi+LhKPig4EoxSbfjHT3qG4NBmSCQtr8zbJ6C3fJIU/ejwzK8iKbBLE
	ryMDWaNWZf3QvmQB3hweehOVA6Ubdnz6UlG+pjPkZ7Cf6joRJVeiLu+BeURE/IkH
	MC2OFEQnXH9PpaBeUp554F4NIIScsF9huSy0eM/P73FREbYCxzVxdHuYlZcHVTzp
	uv6M2ZOl1Kh45xRIPTr3BmK5xGmBIsCN2BPtU+6qDndLqpyxSWd0EGCRBZ0ysBKt
	xHs80eLusudKVcJfHL5N/+i7NAKNLigBngCFTAomWdi3l260QKPrlajifXOM1xB9
	kxoKy8c8FTcw405a+O8xg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1736221562; x=1736307962; bh=A
	W0WXU3lYkPf8/DUmaCHhxgu6TUsNJnYRXwoT2LsNPU=; b=AcDVliKal9X91vIeY
	WuMCjja0+rBS2BrW9FjolTGLM/zSugdk/jKzNaQwg4+CRL67+xq5q94cG/TTEzJ7
	joLBZlcQhQuy3hGJhMRFKVealc6S6MZsbhWQPzw0dLqNUUkD8YPUKnVTuWsYVtYP
	eo59cILJSyIIJdFQuLBZio5bYKV25iiEWhfiCQTtJZrh0DSa+LbQhgYY1Gn206zN
	+/L1rUI2tJ6ykHAsiQpcNQwWFdO4G8hnzV3o4jYf7svtNu5Z+FTvVoStvcV0RZ5D
	5dBzeEMtv70FfZragj6E7c11tMzia5sOrtt1fsfTsJRQJMIBZv/zuawBvXpEq/UH
	ruWNQ==
X-ME-Sender: <xms:eqN8ZxnKcg02HEpvhzXsQwpSalvu6SgMe1-arYhPzOkl2efvbYrVXg>
    <xme:eqN8Z82edCD3ELziqVjvw7swanrRbi_geOQrFDwj22J8Jq2PrKi4d3X0n2Z1TZMwX
    YNTeBBjhyMarR0Xi18>
X-ME-Received: <xmr:eqN8Z3ojsLqVN1gy_hUC5OlgWW0-tz80wi1v9RDU4067qfbiSdf7ZR8E9-pCcW5QrjQYLqqGX_Eoo7usD3Av>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudeguddgieegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucgoteeftdduqddtudculd
    duhedmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhep
    ofgrrhhkucfrvggrrhhsohhnuceomhhpvggrrhhsohhnqdhlvghnohhvohesshhquhgvsg
    gsrdgtrgeqnecuggftrfgrthhtvghrnhepfeefudefudffffejteehtedvkeevtdehueet
    teehleejteehfeegffejveeufefgnecuffhomhgrihhnpehmihgtrhhoshhofhhtrdgtoh
    hmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhhp
    vggrrhhsohhnqdhlvghnohhvohesshhquhgvsggsrdgtrgdpnhgspghrtghpthhtohepie
    dpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepmhhpvggrrhhsohhnqdhlvghnohhv
    ohesshhquhgvsggsrdgtrgdprhgtphhtthhopegumhhithhrhidrthhorhhokhhhohhvse
    hgmhgrihhlrdgtohhmpdhrtghpthhtohephhguvghgohgvuggvsehrvgguhhgrthdrtgho
    mhdprhgtphhtthhopehpvghtvghrrdhhuhhtthgvrhgvrhesrhgvughhrghtrdgtohhmpd
    hrtghpthhtoheplhhinhhugidqihhnphhuthesvhhgvghrrdhkvghrnhgvlhdrohhrghdp
    rhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:eqN8ZxkjOoJ5HRLRopUugnNTuX45RtAfT0u-aPCv9omGTzzc8H29Jw>
    <xmx:eqN8Z_0rmfMp2v9DcgOfPM1T0qpe1NJ1sfOu3wnHkuv6t1LK3bbFrg>
    <xmx:eqN8Zwul38kRhukHPaXeRc5wTKTQKV_Awklo6PzZNVRcc-ZKHKpHJg>
    <xmx:eqN8ZzW5QgU31P26LsoGJKW4vLF62XeqmCufLQVJaguLyPbU03Jiiw>
    <xmx:eqN8Z5rneu6JeK6OCCyhw1RyozU2HBk5MiyuWr8SLixwy8XJTuYTUVMc>
Feedback-ID: ibe194615:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 6 Jan 2025 22:46:02 -0500 (EST)
From: Mark Pearson <mpearson-lenovo@squebb.ca>
To: mpearson-lenovo@squebb.ca
Cc: dmitry.torokhov@gmail.com,
	hdegoede@redhat.com,
	peter.hutterer@redhat.com,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] Input: atkbd: Fix so copilot key generates F23 keycode
Date: Mon,  6 Jan 2025 21:45:40 -0600
Message-ID: <20250107034554.25843-1-mpearson-lenovo@squebb.ca>
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

The copilot key on doesn't work as scancode 0x6e, which it generates is
not mapped.
This change lets scancode 0x6e generate keycode 193 (F23 key) which is
the expected value for copilot.

MS documentation for the scan code:
https://learn.microsoft.com/en-us/windows/win32/inputdev/about-keyboard-input#scan-codes
Confirmed on Lenovo, HP and Dell machines by Canonical
Tested on Lenovo T14s G6 AMD.

Signed-off-by: Mark Pearson <mpearson-lenovo@squebb.ca>
---
Changes in v2: Updated commit description with MS link and testing
details

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


