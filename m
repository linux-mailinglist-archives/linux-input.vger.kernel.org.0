Return-Path: <linux-input+bounces-17036-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F0B4DD17A87
	for <lists+linux-input@lfdr.de>; Tue, 13 Jan 2026 10:35:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4986C30C0221
	for <lists+linux-input@lfdr.de>; Tue, 13 Jan 2026 09:28:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A01338B9BD;
	Tue, 13 Jan 2026 09:26:20 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [217.70.178.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99BF9389DEE;
	Tue, 13 Jan 2026 09:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.178.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768296376; cv=none; b=sMit0TnA/H2oyczK6AkecyWjWZUXtl4T5w4ckH3l1cLA/dg2pTPo3qZYF8Rq5ZuFT8mVWCnZh+W+hGpObxOnsguiz7aJQ8er0RQkQmuwdeDUnl3GiOgreGcjVsjo2Jha6edNuxQ1mG+xos9PmjmtageNt/afRpad3iLhgqRqym0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768296376; c=relaxed/simple;
	bh=6lXNvJ81Dwr/f+D756gI5rYghZhatj+5Pb+6HldUvoA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HJ0jvzqmge0YdHxJMqIO0UgEcTkJL/utS51P77yXFAnc/vz83WEDl3/uD+wqJIhzE09T9ySuaKboIJzTLec9a0i4osNtKQRe6LCNQ1Whlgf4gw0g+LbE+kq1sXPI5XRA1LPMRtpqT1PrsYG7YJFkJfBQjMbhscLDHIhHYzQac8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hadess.net; spf=pass smtp.mailfrom=hadess.net; arc=none smtp.client-ip=217.70.178.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hadess.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hadess.net
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	by mslow3.mail.gandi.net (Postfix) with ESMTP id 86014580EEC;
	Tue, 13 Jan 2026 09:26:04 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D051043388;
	Tue, 13 Jan 2026 09:25:56 +0000 (UTC)
From: Bastien Nocera <hadess@hadess.net>
To: linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	Bastien Nocera <hadess@hadess.net>
Subject: [PATCH v2 02/11] HID: appletb-kbd: Use pm_ptr instead of #ifdef CONFIG_PM
Date: Tue, 13 Jan 2026 10:24:50 +0100
Message-ID: <20260113092546.265734-3-hadess@hadess.net>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260113092546.265734-1-hadess@hadess.net>
References: <20260113092546.265734-1-hadess@hadess.net>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: hadess@hadess.net
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduudelleehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeeurghsthhivghnucfpohgtvghrrgcuoehhrgguvghssheshhgruggvshhsrdhnvghtqeenucggtffrrghtthgvrhhnpeevtefhleevjeffteekleehheeujeelhfdvheethefggefhkefgvdefhfegkeeiteenucfkphepvdgrtddumegvfeegmegvtgejfeemtghfvddtmegsrgegfeemrgeijeeimegtvdgufeemjegrheefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegvfeegmegvtgejfeemtghfvddtmegsrgegfeemrgeijeeimegtvdgufeemjegrheefpdhhvghlohepohhlihhmphhitgdpmhgrihhlfhhrohhmpehhrgguvghssheshhgruggvshhsrdhnvghtpdhqihgupefftdehuddtgeeffeekkedpmhhouggvpehsmhhtphhouhhtpdhnsggprhgtphhtthhopeehpdhrtghpthhtoheplhhinhhugidqihhnphhuthesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehjihhkohhssehkvghrnhgvl
 hdrohhrghdprhgtphhtthhopegsvghnjhgrmhhinhdrthhishhsohhirhgvshesrhgvughhrghtrdgtohhmpdhrtghpthhtohephhgruggvshhssehhrgguvghsshdrnhgvth
X-GND-State: clean
X-GND-Score: -100

This increases build coverage and allows to drop an #ifdef.

Signed-off-by: Bastien Nocera <hadess@hadess.net>
---
 drivers/hid/hid-appletb-kbd.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/hid/hid-appletb-kbd.c b/drivers/hid/hid-appletb-kbd.c
index b00687e67ce8..a1db3b3d0667 100644
--- a/drivers/hid/hid-appletb-kbd.c
+++ b/drivers/hid/hid-appletb-kbd.c
@@ -466,7 +466,6 @@ static void appletb_kbd_remove(struct hid_device *hdev)
 	hid_hw_stop(hdev);
 }
 
-#ifdef CONFIG_PM
 static int appletb_kbd_suspend(struct hid_device *hdev, pm_message_t msg)
 {
 	struct appletb_kbd *kbd = hid_get_drvdata(hdev);
@@ -485,7 +484,6 @@ static int appletb_kbd_reset_resume(struct hid_device *hdev)
 
 	return 0;
 }
-#endif
 
 static const struct hid_device_id appletb_kbd_hid_ids[] = {
 	/* MacBook Pro's 2018, 2019, with T2 chip: iBridge Display */
@@ -501,10 +499,8 @@ static struct hid_driver appletb_kbd_hid_driver = {
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


