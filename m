Return-Path: <linux-input+bounces-16970-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AE6DDD121FA
	for <lists+linux-input@lfdr.de>; Mon, 12 Jan 2026 12:02:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 667B23115C4A
	for <lists+linux-input@lfdr.de>; Mon, 12 Jan 2026 10:58:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F33835504C;
	Mon, 12 Jan 2026 10:58:08 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [217.70.178.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57256350A16;
	Mon, 12 Jan 2026 10:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.178.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768215488; cv=none; b=M0ZTJNW5VY0QhPenHGLxGtPCFpo6A9Dwkb3etAtrw+gaTZHqT2OTK+msVlrkWdis400vdXvcC2qXkONaUbBdyv9SPT6aJCz2J7rkrzbgplkuLU76MTvnr/5OTBGeX6C0grcJfJDxYb8RZCgtcBdS/2HQcLUzEgR371loA0sJrE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768215488; c=relaxed/simple;
	bh=fi30VHeCcylWP4LPRvgy9rqy736MCa1UKqmK5nrZZOo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=melgIvkwznAkaqAolXWq85scIfFQXmO91oqiTJvRhqQ3yWBLruaccfAnlfZg3yn4KUbTU9rGUC3Ode630tS2ArSzjdUDuc/e3K7hbCLMCMA/Ly/xA7rFa67p0l933gHPIUpjlb5B7HOVNQUywNBQQU8wne9uctivAVJqfnIosPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hadess.net; spf=pass smtp.mailfrom=hadess.net; arc=none smtp.client-ip=217.70.178.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hadess.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hadess.net
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::224])
	by mslow3.mail.gandi.net (Postfix) with ESMTP id 9883B580C98;
	Mon, 12 Jan 2026 10:55:21 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0D26343B87;
	Mon, 12 Jan 2026 10:55:13 +0000 (UTC)
From: Bastien Nocera <hadess@hadess.net>
To: linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	Bastien Nocera <hadess@hadess.net>
Subject: [PATCH 08/12] HID: hid-sensor-hub: Use pm_ptr instead of #ifdef CONFIG_PM
Date: Mon, 12 Jan 2026 11:52:57 +0100
Message-ID: <20260112105500.3664834-9-hadess@hadess.net>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduudejvdejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeeurghsthhivghnucfpohgtvghrrgcuoehhrgguvghssheshhgruggvshhsrdhnvghtqeenucggtffrrghtthgvrhhnpeevtefhleevjeffteekleehheeujeelhfdvheethefggefhkefgvdefhfegkeeiteenucfkphepvdgrtddumegvfeegmegvtgejfeemtghfvddtmegsrgegfeemrgeijeeimegtvdgufeemjegrheefnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehinhgvthepvdgrtddumegvfeegmegvtgejfeemtghfvddtmegsrgegfeemrgeijeeimegtvdgufeemjegrheefpdhhvghlohepohhlihhmphhitgdpmhgrihhlfhhrohhmpehhrgguvghssheshhgruggvshhsrdhnvghtpdhqihgupedtffdvieefgeefueekjedpmhhouggvpehsmhhtphhouhhtpdhnsggprhgtphhtthhopeehpdhrtghpthhtoheplhhinhhugidqihhnphhuthesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehjihhkohhssehkvghrnhgvl
 hdrohhrghdprhgtphhtthhopegsvghnjhgrmhhinhdrthhishhsohhirhgvshesrhgvughhrghtrdgtohhmpdhrtghpthhtohephhgruggvshhssehhrgguvghsshdrnhgvth

This increases build coverage and allows to drop an #ifdef.

Signed-off-by: Bastien Nocera <hadess@hadess.net>
---
 drivers/hid/hid-sensor-hub.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/hid/hid-sensor-hub.c b/drivers/hid/hid-sensor-hub.c
index 4c94c03cb573..7618dec9c31e 100644
--- a/drivers/hid/hid-sensor-hub.c
+++ b/drivers/hid/hid-sensor-hub.c
@@ -772,11 +772,9 @@ static struct hid_driver sensor_hub_driver = {
 	.remove = sensor_hub_remove,
 	.raw_event = sensor_hub_raw_event,
 	.report_fixup = sensor_hub_report_fixup,
-#ifdef CONFIG_PM
-	.suspend = sensor_hub_suspend,
-	.resume = sensor_hub_resume,
-	.reset_resume = sensor_hub_reset_resume,
-#endif
+	.suspend = pm_ptr(sensor_hub_suspend),
+	.resume = pm_ptr(sensor_hub_resume),
+	.reset_resume = pm_ptr(sensor_hub_reset_resume),
 };
 module_hid_driver(sensor_hub_driver);
 
-- 
2.52.0


