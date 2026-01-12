Return-Path: <linux-input+bounces-16965-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D85BFD12190
	for <lists+linux-input@lfdr.de>; Mon, 12 Jan 2026 11:59:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 57A6230A7513
	for <lists+linux-input@lfdr.de>; Mon, 12 Jan 2026 10:58:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64588352F82;
	Mon, 12 Jan 2026 10:58:04 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [217.70.178.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F39D352C2A;
	Mon, 12 Jan 2026 10:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.178.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768215483; cv=none; b=bjoy/nc9gQtHi5Qz7XOH5H8bLp800m+sZTzDYw/3L3+0Mpkl75SQcs3itqTFHdOTDACFiy03/4MNFw8F2BVMVElHalVfNCsE/vwkQhCkpHqZQQ4WxrLo9jRAYfT48fAOBw093eWOfQ8MTogBpng8PhmcdLpGkxFIU+xsSwt8c9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768215483; c=relaxed/simple;
	bh=ezTNtmZHvu1SN5YrmPwxzXGk6x6UpG9wIQrWZIZrbGY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jAC8Oq/X1jxzO8U1P4+yQVSpGDosIXEMcFeG6ppHxzXD2kEUCVM/GEmfVK2aNeir69rGUXm78Bt3s80r0LUFCOF/a2pz8ED+P5K/01/OxrouKeOlyXa//5VV5a3/Wm3j7knZ+APpchk/dYTCM4v2uiaP4GtSYJxfzUFG0E7GTPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hadess.net; spf=pass smtp.mailfrom=hadess.net; arc=none smtp.client-ip=217.70.178.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hadess.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hadess.net
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::224])
	by mslow3.mail.gandi.net (Postfix) with ESMTP id 9AE03580C85;
	Mon, 12 Jan 2026 10:55:17 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1C73D433B0;
	Mon, 12 Jan 2026 10:55:10 +0000 (UTC)
From: Bastien Nocera <hadess@hadess.net>
To: linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	Bastien Nocera <hadess@hadess.net>
Subject: [PATCH 02/12] HID: appletb-kbd: Use pm_ptr instead of #ifdef CONFIG_PM
Date: Mon, 12 Jan 2026 11:52:51 +0100
Message-ID: <20260112105500.3664834-3-hadess@hadess.net>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260112105500.3664834-1-hadess@hadess.net>
References: <20260112105500.3664834-1-hadess@hadess.net>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: hadess@hadess.net
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduudejvdejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeeurghsthhivghnucfpohgtvghrrgcuoehhrgguvghssheshhgruggvshhsrdhnvghtqeenucggtffrrghtthgvrhhnpeevtefhleevjeffteekleehheeujeelhfdvheethefggefhkefgvdefhfegkeeiteenucfkphepvdgrtddumegvfeegmegvtgejfeemtghfvddtmegsrgegfeemrgeijeeimegtvdgufeemjegrheefnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehinhgvthepvdgrtddumegvfeegmegvtgejfeemtghfvddtmegsrgegfeemrgeijeeimegtvdgufeemjegrheefpdhhvghlohepohhlihhmphhitgdpmhgrihhlfhhrohhmpehhrgguvghssheshhgruggvshhsrdhnvghtpdhqihgupeduveejfeffgeeffeeutddpmhhouggvpehsmhhtphhouhhtpdhnsggprhgtphhtthhopeehpdhrtghpthhtoheplhhinhhugidqihhnphhuthesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehjihhkohhssehkvghrnhgvl
 hdrohhrghdprhgtphhtthhopegsvghnjhgrmhhinhdrthhishhsohhirhgvshesrhgvughhrghtrdgtohhmpdhrtghpthhtohephhgruggvshhssehhrgguvghsshdrnhgvth

This increases build coverage and allows to drop an #ifdef.

Signed-off-by: Bastien Nocera <hadess@hadess.net>
---
 drivers/hid/hid-appletb-kbd.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/hid/hid-appletb-kbd.c b/drivers/hid/hid-appletb-kbd.c
index b00687e67ce8..064e136610ec 100644
--- a/drivers/hid/hid-appletb-kbd.c
+++ b/drivers/hid/hid-appletb-kbd.c
@@ -501,10 +501,8 @@ static struct hid_driver appletb_kbd_hid_driver = {
 	.remove = appletb_kbd_remove,
 	.event = appletb_kbd_hid_event,
 	.input_configured = appletb_kbd_input_configured,
-#ifdef CONFIG_PM
-	.suspend = appletb_kbd_suspend,
-	.reset_resume = appletb_kbd_reset_resume,
-#endif
+	.suspend = pm_ptr(appletb_kbd_suspend),
+	.reset_resume = pm_ptr(appletb_kbd_reset_resume),
 	.driver.dev_groups = appletb_kbd_groups,
 };
 module_hid_driver(appletb_kbd_hid_driver);
-- 
2.52.0


