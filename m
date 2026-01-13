Return-Path: <linux-input+bounces-17040-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D4640D17AA8
	for <lists+linux-input@lfdr.de>; Tue, 13 Jan 2026 10:36:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5588D3060253
	for <lists+linux-input@lfdr.de>; Tue, 13 Jan 2026 09:29:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FD8038E5E5;
	Tue, 13 Jan 2026 09:26:30 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [217.70.178.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87DFC389DF8;
	Tue, 13 Jan 2026 09:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.178.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768296386; cv=none; b=Mrv7nJNXLdO3C2biseXXWIxd+lf5NooO4HQeXBZ+jU5cM7ymB5d1DFlk0MKXW7AmaE1WmeM9nlVh0XbtAWhvXs1tITIXbYSLNqYZUEBlA7Dy0KtfskowgjN22Q/VWpQUfpPMpHBeQA9NAir2CGggshqgliSH7SIBIV4oquDKkxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768296386; c=relaxed/simple;
	bh=n735PVrCqqqRR+bWUZKGaC8htV/NhVdUPggqObizcNc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aZ95KkhiVBOdUdxjqJpx9d60ibg9m2k2yjcP/YBB8qJjrWZ6VvA9RWeOxxHuxaVKOB/Sxhxxwl3oq/YgpfI9XcgDo2jkk55YOxZNyctiFgvl/60hTCMyrnVIKzDH3/jXWYpR9eY1OO1unlMXOQzGzrJFU5LKlPrnFZt02fnk1GQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hadess.net; spf=pass smtp.mailfrom=hadess.net; arc=none smtp.client-ip=217.70.178.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hadess.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hadess.net
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	by mslow3.mail.gandi.net (Postfix) with ESMTP id 9D184580EF0;
	Tue, 13 Jan 2026 09:26:08 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6B76F433C2;
	Tue, 13 Jan 2026 09:26:00 +0000 (UTC)
From: Bastien Nocera <hadess@hadess.net>
To: linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	Bastien Nocera <hadess@hadess.net>
Subject: [PATCH v2 07/11] HID: picolcd_core: Use pm_ptr instead of #ifdef CONFIG_PM
Date: Tue, 13 Jan 2026 10:24:55 +0100
Message-ID: <20260113092546.265734-8-hadess@hadess.net>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduudelleehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeeurghsthhivghnucfpohgtvghrrgcuoehhrgguvghssheshhgruggvshhsrdhnvghtqeenucggtffrrghtthgvrhhnpeevtefhleevjeffteekleehheeujeelhfdvheethefggefhkefgvdefhfegkeeiteenucfkphepvdgrtddumegvfeegmegvtgejfeemtghfvddtmegsrgegfeemrgeijeeimegtvdgufeemjegrheefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegvfeegmegvtgejfeemtghfvddtmegsrgegfeemrgeijeeimegtvdgufeemjegrheefpdhhvghlohepohhlihhmphhitgdpmhgrihhlfhhrohhmpehhrgguvghssheshhgruggvshhsrdhnvghtpdhqihgupeeiueejiefhgeeffeevvddpmhhouggvpehsmhhtphhouhhtpdhnsggprhgtphhtthhopeehpdhrtghpthhtoheplhhinhhugidqihhnphhuthesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehjihhkohhssehkvghrnhgvl
 hdrohhrghdprhgtphhtthhopegsvghnjhgrmhhinhdrthhishhsohhirhgvshesrhgvughhrghtrdgtohhmpdhrtghpthhtohephhgruggvshhssehhrgguvghsshdrnhgvth
X-GND-State: clean
X-GND-Score: -100

This increases build coverage and allows to drop an #ifdef.

Signed-off-by: Bastien Nocera <hadess@hadess.net>
---
 drivers/hid/hid-picolcd_core.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/hid/hid-picolcd_core.c b/drivers/hid/hid-picolcd_core.c
index 297103be3381..6a88e6bc70f3 100644
--- a/drivers/hid/hid-picolcd_core.c
+++ b/drivers/hid/hid-picolcd_core.c
@@ -363,7 +363,6 @@ static int picolcd_raw_event(struct hid_device *hdev,
 	return 1;
 }
 
-#ifdef CONFIG_PM
 static int picolcd_suspend(struct hid_device *hdev, pm_message_t message)
 {
 	if (PMSG_IS_AUTO(message))
@@ -401,7 +400,6 @@ static int picolcd_reset_resume(struct hid_device *hdev)
 	picolcd_leds_set(hid_get_drvdata(hdev));
 	return 0;
 }
-#endif
 
 /* initialize keypad input device */
 static int picolcd_init_keys(struct picolcd_data *data,
@@ -648,11 +646,9 @@ static struct hid_driver picolcd_driver = {
 	.probe =         picolcd_probe,
 	.remove =        picolcd_remove,
 	.raw_event =     picolcd_raw_event,
-#ifdef CONFIG_PM
-	.suspend =       picolcd_suspend,
-	.resume =        picolcd_resume,
-	.reset_resume =  picolcd_reset_resume,
-#endif
+	.suspend =       pm_ptr(picolcd_suspend),
+	.resume =        pm_ptr(picolcd_resume),
+	.reset_resume =  pm_ptr(picolcd_reset_resume),
 };
 module_hid_driver(picolcd_driver);
 
-- 
2.52.0


