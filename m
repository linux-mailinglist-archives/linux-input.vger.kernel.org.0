Return-Path: <linux-input+bounces-17042-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A1170D17A9F
	for <lists+linux-input@lfdr.de>; Tue, 13 Jan 2026 10:36:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1A0B93133C8C
	for <lists+linux-input@lfdr.de>; Tue, 13 Jan 2026 09:29:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0BD138BDDA;
	Tue, 13 Jan 2026 09:26:29 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [217.70.178.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4316838B9B6;
	Tue, 13 Jan 2026 09:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.178.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768296388; cv=none; b=QgpoelcSQeh4w3gXmJIjGVxwCbHaGetgy9d6NtHAI6YXOrvdQdcnZlgIoeYkuSTRy2FuIBQxqr53uSmSGFrb8dXjq7x01/AYsgIl2GJDUnF9cDzk8sgAuXB8o1jISe3fLQNITlltffaFKP7qe2PU1s7ac42k8YzEiKLIT4ZfC0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768296388; c=relaxed/simple;
	bh=gOcdYD0n5Tc/jmGc9RKtrnLaXwYhiHJ+PGHcnImXMp0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EgAIRQ+gLOWJvBFGf1ywCtaQQUI3zdOnG7R4S5vy41ckpTOSPxrVmAFyqVva/XlTx70NsYtYtHAe9/A6wl7bv48p+Y/Yd3DARe3al7DVHmwlKOWztk9ht8+4A7EZJp1U4KzTXYse5zbmHdHUxJJ+l1KyON1HGoOpiIFNs3G1zUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hadess.net; spf=pass smtp.mailfrom=hadess.net; arc=none smtp.client-ip=217.70.178.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hadess.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hadess.net
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::228])
	by mslow3.mail.gandi.net (Postfix) with ESMTP id 9F686580F21;
	Tue, 13 Jan 2026 09:26:08 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1BDFF41DF3;
	Tue, 13 Jan 2026 09:26:00 +0000 (UTC)
From: Bastien Nocera <hadess@hadess.net>
To: linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	Bastien Nocera <hadess@hadess.net>
Subject: [PATCH v2 08/11] HID: hid-sensor-hub: Use pm_ptr instead of #ifdef CONFIG_PM
Date: Tue, 13 Jan 2026 10:24:56 +0100
Message-ID: <20260113092546.265734-9-hadess@hadess.net>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduudelleehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeeurghsthhivghnucfpohgtvghrrgcuoehhrgguvghssheshhgruggvshhsrdhnvghtqeenucggtffrrghtthgvrhhnpeevtefhleevjeffteekleehheeujeelhfdvheethefggefhkefgvdefhfegkeeiteenucfkphepvdgrtddumegvfeegmegvtgejfeemtghfvddtmegsrgegfeemrgeijeeimegtvdgufeemjegrheefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegvfeegmegvtgejfeemtghfvddtmegsrgegfeemrgeijeeimegtvdgufeemjegrheefpdhhvghlohepohhlihhmphhitgdpmhgrihhlfhhrohhmpehhrgguvghssheshhgruggvshhsrdhnvghtpdhqihgupeduueffhffhgedufffhfedpmhhouggvpehsmhhtphhouhhtpdhnsggprhgtphhtthhopeehpdhrtghpthhtoheplhhinhhugidqihhnphhuthesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehjihhkohhssehkvghrnhgvl
 hdrohhrghdprhgtphhtthhopegsvghnjhgrmhhinhdrthhishhsohhirhgvshesrhgvughhrghtrdgtohhmpdhrtghpthhtohephhgruggvshhssehhrgguvghsshdrnhgvth
X-GND-State: clean
X-GND-Score: -100

This increases build coverage and allows to drop an #ifdef.

Signed-off-by: Bastien Nocera <hadess@hadess.net>
---
 drivers/hid/hid-sensor-hub.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/hid/hid-sensor-hub.c b/drivers/hid/hid-sensor-hub.c
index 4c94c03cb573..0edec902be41 100644
--- a/drivers/hid/hid-sensor-hub.c
+++ b/drivers/hid/hid-sensor-hub.c
@@ -422,7 +422,6 @@ int sensor_hub_input_get_attribute_info(struct hid_sensor_hub_device *hsdev,
 }
 EXPORT_SYMBOL_GPL(sensor_hub_input_get_attribute_info);
 
-#ifdef CONFIG_PM
 static int sensor_hub_suspend(struct hid_device *hdev, pm_message_t message)
 {
 	struct sensor_hub_data *pdata = hid_get_drvdata(hdev);
@@ -463,7 +462,6 @@ static int sensor_hub_reset_resume(struct hid_device *hdev)
 {
 	return 0;
 }
-#endif
 
 /*
  * Handle raw report as sent by device
@@ -772,11 +770,9 @@ static struct hid_driver sensor_hub_driver = {
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


