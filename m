Return-Path: <linux-input+bounces-17039-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DB207D17B62
	for <lists+linux-input@lfdr.de>; Tue, 13 Jan 2026 10:40:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id F211030470EB
	for <lists+linux-input@lfdr.de>; Tue, 13 Jan 2026 09:29:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 705BD387368;
	Tue, 13 Jan 2026 09:26:23 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [217.70.178.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 156DC34575A;
	Tue, 13 Jan 2026 09:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.178.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768296381; cv=none; b=TileVnMkLujf3dnGcIeFG0x0H7VI4p1U5V2hRiWs02E4XvzwP6dOiAkQCgULni4PGuCvG8BkxEomZlqoDQYyENxrVVlTLn4Q8/Juvo9fDBoz4kPaJfcm/0fP67BqJ4p9MWrW5KCHEfUVjuDVHCOVMSn7UhAeMdP75vDrQzV49ro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768296381; c=relaxed/simple;
	bh=oTnqWe+/dcJEpnq2L5dMa15m0zfxhkVVoTpvJxcHD0w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Imfta0a5JLIkmX71xjx/b5QepnbIfBIdMQW4H4IH7HQzJ5mWI1EDwtzuQse6nMVpX13KBeIHi5v4fLDnTtdLk440kHwtAi0fJq6AKxf8JD2gTcsPtlWoDIFInCqayIhizxUJdVN4Ufy9Q+pLJwGCfIAsWJ3s0bytIyTQpTxcrMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hadess.net; spf=pass smtp.mailfrom=hadess.net; arc=none smtp.client-ip=217.70.178.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hadess.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hadess.net
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::228])
	by mslow3.mail.gandi.net (Postfix) with ESMTP id 7D47F580EE0;
	Tue, 13 Jan 2026 09:26:07 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B8FC043379;
	Tue, 13 Jan 2026 09:25:59 +0000 (UTC)
From: Bastien Nocera <hadess@hadess.net>
To: linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	Bastien Nocera <hadess@hadess.net>
Subject: [PATCH v2 06/11] HID: nintendo: Use pm_ptr instead of #ifdef CONFIG_PM
Date: Tue, 13 Jan 2026 10:24:54 +0100
Message-ID: <20260113092546.265734-7-hadess@hadess.net>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduudelleehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeeurghsthhivghnucfpohgtvghrrgcuoehhrgguvghssheshhgruggvshhsrdhnvghtqeenucggtffrrghtthgvrhhnpeevtefhleevjeffteekleehheeujeelhfdvheethefggefhkefgvdefhfegkeeiteenucfkphepvdgrtddumegvfeegmegvtgejfeemtghfvddtmegsrgegfeemrgeijeeimegtvdgufeemjegrheefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegvfeegmegvtgejfeemtghfvddtmegsrgegfeemrgeijeeimegtvdgufeemjegrheefpdhhvghlohepohhlihhmphhitgdpmhgrihhlfhhrohhmpehhrgguvghssheshhgruggvshhsrdhnvghtpdhqihgupeeukefhvedtgeeffeejledpmhhouggvpehsmhhtphhouhhtpdhnsggprhgtphhtthhopeehpdhrtghpthhtoheplhhinhhugidqihhnphhuthesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehjihhkohhssehkvghrnhgvl
 hdrohhrghdprhgtphhtthhopegsvghnjhgrmhhinhdrthhishhsohhirhgvshesrhgvughhrghtrdgtohhmpdhrtghpthhtohephhgruggvshhssehhrgguvghsshdrnhgvth
X-GND-State: clean
X-GND-Score: -100

This increases build coverage and allows to drop an #ifdef.

Signed-off-by: Bastien Nocera <hadess@hadess.net>
---
 drivers/hid/hid-nintendo.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/hid/hid-nintendo.c b/drivers/hid/hid-nintendo.c
index 7ac9217d9096..29008c2cc530 100644
--- a/drivers/hid/hid-nintendo.c
+++ b/drivers/hid/hid-nintendo.c
@@ -2748,8 +2748,6 @@ static void nintendo_hid_remove(struct hid_device *hdev)
 	hid_hw_stop(hdev);
 }
 
-#ifdef CONFIG_PM
-
 static int nintendo_hid_resume(struct hid_device *hdev)
 {
 	struct joycon_ctlr *ctlr = hid_get_drvdata(hdev);
@@ -2792,8 +2790,6 @@ static int nintendo_hid_suspend(struct hid_device *hdev, pm_message_t message)
 	return 0;
 }
 
-#endif
-
 static const struct hid_device_id nintendo_hid_devices[] = {
 	{ HID_USB_DEVICE(USB_VENDOR_ID_NINTENDO,
 			 USB_DEVICE_ID_NINTENDO_PROCON) },
@@ -2827,11 +2823,8 @@ static struct hid_driver nintendo_hid_driver = {
 	.probe		= nintendo_hid_probe,
 	.remove		= nintendo_hid_remove,
 	.raw_event	= nintendo_hid_event,
-
-#ifdef CONFIG_PM
-	.resume		= nintendo_hid_resume,
-	.suspend	= nintendo_hid_suspend,
-#endif
+	.resume		= pm_ptr(nintendo_hid_resume),
+	.suspend	= pm_ptr(nintendo_hid_suspend),
 };
 static int __init nintendo_init(void)
 {
-- 
2.52.0


