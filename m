Return-Path: <linux-input+bounces-9142-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DDF0A09FC9
	for <lists+linux-input@lfdr.de>; Sat, 11 Jan 2025 02:02:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4EF1E3A7933
	for <lists+linux-input@lfdr.de>; Sat, 11 Jan 2025 01:02:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1092B9454;
	Sat, 11 Jan 2025 01:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b="IDWrlEBv";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="w3TohoAh"
X-Original-To: linux-input@vger.kernel.org
Received: from fout-a1-smtp.messagingengine.com (fout-a1-smtp.messagingengine.com [103.168.172.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A89817E4;
	Sat, 11 Jan 2025 01:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736557324; cv=none; b=kxKSdRoJ1GU3bHeQQ0Iep1QyOeOanql4hWEXawwOkM0gYVYNLV5NssE7A4ViqdWG2NvXNRZKN7881mk5aK9kD6//fpgIqL0VLn+ySaHLWqOUGEJAm9DgTaHU37r+stZVr784tIqixEQLNlhbgrYabZwX+Pc12WYUjsj60HQNFO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736557324; c=relaxed/simple;
	bh=k4JXMy/oay7xDAlw+Ke8NEBKbG5TwNI+/001NYv+fnI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gE/ccJCqmVKDx/8sePMcf8ERYYXqI1j43e40LxBwSc7NOtvsoDCU2XDjXuT3Q34hfLWpwhnVISXZEa2Ez86ZWiVF2OLaLDX3KBhiYBeVxd+aRsgiBRVGkHcaKAfmdb/40mlbTRqoKsFw9HWcqzOP3Pgs1U7/ouwtBvNyeZYc+/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev; spf=none smtp.mailfrom=ljones.dev; dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b=IDWrlEBv; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=w3TohoAh; arc=none smtp.client-ip=103.168.172.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ljones.dev
Received: from phl-compute-08.internal (phl-compute-08.phl.internal [10.202.2.48])
	by mailfout.phl.internal (Postfix) with ESMTP id 814561380168;
	Fri, 10 Jan 2025 20:02:00 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-08.internal (MEProxy); Fri, 10 Jan 2025 20:02:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm3; t=1736557320; x=1736643720; bh=hVClZUZpJZ4odAivackAu
	wASpNLeP79IwIKXltDxG6U=; b=IDWrlEBva/j0izv5Dxf3lEphEml99WmoLGxVZ
	6bHc8r1bpLxCy7Kg3TbbYZ/SP5x9DBiAR3wgwqMm6y3TPl8zbgyImtrCwCKyx7M5
	OcQOj+DcuO3YsJjIGJFhGYcP/UQH5dlD/HzKtAIsCp6iz7kvFYzsrdq/Gr59pT/m
	3d4C0TMjNz45TxYl4UyThQTnqfH5okx8JVhPjr3vwfGTr+Cs/gLZM74l2yrZCWvv
	a9r7ewfyG7O7jWKrYTeGnRiMJRF94OwISnbzfp4zawXL1IqxBpOt9YME8LgR7t/t
	HkuUcBCloi0fVuPMXhrbeEpGw3uYKri5lPKfoq7xhFskLuXvA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1736557320; x=1736643720; bh=hVClZUZpJZ4odAivackAuwASpNLeP79IwIK
	XltDxG6U=; b=w3TohoAhvD4ohWxhXT9C6c0v6OQ6N2jzcDRU5cRgnsH8PPXpYW7
	VpdWC00Ml0LW7L+3flDtx2R7+zIYO38IpbXxDn/vbsUQcZ6uRLqwTQniXJiz6VVU
	Jma3y2HuXMMWjnlKvHJ40R1Q8iRmjHtRJPhigDJAED9FFUXQLdhgQqJUG8k+t29d
	JBNeBhFefpDYORzJXaWX4Vh2oB84AeG4g0PFI/2uq8QFYoJhRhesRQvhr8dbpGoc
	aDIFYfzbdGBgIAh0AJptGC+bmD2GYGROtRWZNT1qUMlxARQmglghv8QxfG0oZTQq
	xXcYD+M3qtsI8urDtnPIXCn6JdhA4pzmedA==
X-ME-Sender: <xms:B8OBZ4k9Uh6kwvPkJZVq-EBvXuqTLYPf7YuyiujfixX8Z3bZhoKF3Q>
    <xme:B8OBZ31lj5zgkzOWyowwNRdJtCl0ROVIEXcvs9m5XTACMoRODhlhdiKmSiCqT5SM2
    w4wHx2fs-kUpHUaLUM>
X-ME-Received: <xmr:B8OBZ2rc2GqzYjIQDdcFd5N3IhIdu2fZVHdbsuaV9Z-Z4Hh-P_xWolY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudegledgvdekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhephffvvefufffkofgggfestdekredtredttdenucfh
    rhhomhepfdfnuhhkvgcuffdrucflohhnvghsfdcuoehluhhkvgeslhhjohhnvghsrdguvg
    hvqeenucggtffrrghtthgvrhhnpefgudejtdfhuddukefffeekiefftddtvdfhgeduudeu
    ffeuhfefgfegfeetvedvgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
    grihhlfhhrohhmpehluhhkvgeslhhjohhnvghsrdguvghvpdhnsggprhgtphhtthhopeej
    pdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehlihhnuhigqdhinhhpuhhtsehvgh
    gvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehv
    ghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepsggvnhhtihhssheskhgvrhhnvg
    hlrdhorhhgpdhrtghpthhtohepjhhikhhosheskhgvrhhnvghlrdhorhhgpdhrtghpthht
    oheplhhukhgvsehljhhonhgvshdruggvvhdprhgtphhtthhopegtohhnnhhorhgsvghllh
    hivddttdefsehgmhgrihhlrdgtohhmpdhrtghpthhtohepjhgrnhestggvnhhtrhhitghu
    lhgrrhdrtghomh
X-ME-Proxy: <xmx:CMOBZ0mB-LY7MJfFh_MEG56_cZPcYQo1SrWk89bP1l5DV7o5jfSQnQ>
    <xmx:CMOBZ21mhuVrIglbW8E6ETDvrH3j-C4j07tF0cHmykxACReL4YIIfQ>
    <xmx:CMOBZ7smou25MRDULWiRRsALQWDG9VYC3vLgT-8KKrIcXTEO6nE82g>
    <xmx:CMOBZyUR2C1OhaW8vTm68HWxsoWTh_0OuM-C-13IC-P9s5HW19KZEQ>
    <xmx:CMOBZwoX3kREfpE3FuI4XC_iUzdjkqACsSe6V1v5jBqf84P0UeiwReJa>
Feedback-ID: i5ec1447f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 10 Jan 2025 20:01:57 -0500 (EST)
From: "Luke D. Jones" <luke@ljones.dev>
To: linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	bentiss@kernel.org,
	jikos@kernel.org,
	"Luke D. Jones" <luke@ljones.dev>,
	Connor Belli <connorbelli2003@gmail.com>,
	Jan Schmidt <jan@centricular.com>
Subject: [PATCH] hid-asus: Disable OOBE mode on the ProArt P16
Date: Sat, 11 Jan 2025 14:01:53 +1300
Message-ID: <20250111010153.35119-1-luke@ljones.dev>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The new ASUS ProArt 16" laptop series come with their keyboards stuck in
an Out-Of-Box-Experience mode. While in this mode most functions will
not work such as LED control or Fn key combos. The correct init sequence
is now done to disable this OOBE.

This patch addresses only the ProArt series so far and it is unknown if
there may be others, in which case a new quirk may be required.

Signed-off-by: Luke D. Jones <luke@ljones.dev>
Co-developed-by: Connor Belli <connorbelli2003@gmail.com>
Signed-off-by: Connor Belli <connorbelli2003@gmail.com>
Tested-by: Jan Schmidt <jan@centricular.com>
---
 drivers/hid/hid-asus.c                     | 26 ++++++++++++++++++++++
 include/linux/platform_data/x86/asus-wmi.h |  5 +++++
 2 files changed, 31 insertions(+)

diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
index ef18f721e2ff..b89329f78257 100644
--- a/drivers/hid/hid-asus.c
+++ b/drivers/hid/hid-asus.c
@@ -437,6 +437,26 @@ static int asus_kbd_get_functions(struct hid_device *hdev,
 	return ret;
 }
 
+static int asus_kbd_disable_oobe(struct hid_device *hdev)
+{
+	const u8 init[][6] = {
+		{ FEATURE_KBD_REPORT_ID, 0x05, 0x20, 0x31, 0x00, 0x08 },
+		{ FEATURE_KBD_REPORT_ID, 0xBA, 0xC5, 0xC4 },
+		{ FEATURE_KBD_REPORT_ID, 0xD0, 0x8F, 0x01 },
+		{ FEATURE_KBD_REPORT_ID, 0xD0, 0x85, 0xFF }
+	};
+	int ret;
+
+	for (size_t i = 0; i < ARRAY_SIZE(init); i++) {
+		ret = asus_kbd_set_report(hdev, init[i], sizeof(init[i]));
+		if (ret < 0)
+			return ret;
+	}
+
+	hid_info(hdev, "Disabled OOBE for keyboard\n");
+	return 0;
+}
+
 static void asus_schedule_work(struct asus_kbd_leds *led)
 {
 	unsigned long flags;
@@ -539,6 +559,12 @@ static int asus_kbd_register_leds(struct hid_device *hdev)
 		ret = asus_kbd_init(hdev, FEATURE_KBD_LED_REPORT_ID2);
 		if (ret < 0)
 			return ret;
+
+		if (dmi_match(DMI_PRODUCT_FAMILY, "ProArt P16")) {
+			ret = asus_kbd_disable_oobe(hdev);
+			if (ret < 0)
+				return ret;
+		}
 	} else {
 		/* Initialize keyboard */
 		ret = asus_kbd_init(hdev, FEATURE_KBD_REPORT_ID);
diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
index cc21e4272460..c427b6c20d3f 100644
--- a/include/linux/platform_data/x86/asus-wmi.h
+++ b/include/linux/platform_data/x86/asus-wmi.h
@@ -206,6 +206,11 @@ static const struct dmi_system_id asus_use_hid_led_dmi_ids[] = {
 			DMI_MATCH(DMI_PRODUCT_FAMILY, "ROG Flow"),
 		},
 	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_PRODUCT_FAMILY, "ProArt P16"),
+		},
+	},
 	{
 		.matches = {
 			DMI_MATCH(DMI_BOARD_NAME, "GA403U"),
-- 
2.47.1


