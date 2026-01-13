Return-Path: <linux-input+bounces-17041-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C2AF7D17AA5
	for <lists+linux-input@lfdr.de>; Tue, 13 Jan 2026 10:36:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0F857305CD32
	for <lists+linux-input@lfdr.de>; Tue, 13 Jan 2026 09:29:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D51438E5DA;
	Tue, 13 Jan 2026 09:26:30 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [217.70.178.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8805A38BDA2;
	Tue, 13 Jan 2026 09:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.178.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768296387; cv=none; b=ie/61Umw3eTTYUju/kkNAQcmC+kXdHZUdqmoF5lg0lwvPdZAS+DigfRKSkQp8G+AcpBL3Cmm1/FSA3J81KZt+UB8Y+yuSodXW6ivCoNY/+HuwcRDfkpR2CzjIaZPEtTWIAdoafIJ3Z14akFRlv8XwiE9FJ3seiL8zpbTSi3Opr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768296387; c=relaxed/simple;
	bh=v9YMp81q2yb5wiiELw6gs2ud6iQ2+ITloYJtYSAkzO4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uc+Oh0bPgk8tXmj/Rs03IT0ePtYq6YSFwhm9MCQbqUR5iB6xtoyqhZnbPrZzWbGvxnMhXX4V/Ps9w3YbSPA2+FSCxwwD45ZMpqAkdKlUQbiVcF82mNldA3WgV3/O4MN0EZGt4fC1ts/c18NYsXMXtEjs1R+k64FrGqEa3WpdwaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hadess.net; spf=pass smtp.mailfrom=hadess.net; arc=none smtp.client-ip=217.70.178.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hadess.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hadess.net
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	by mslow3.mail.gandi.net (Postfix) with ESMTP id 974CA580F24;
	Tue, 13 Jan 2026 09:26:09 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BF112433BD;
	Tue, 13 Jan 2026 09:26:01 +0000 (UTC)
From: Bastien Nocera <hadess@hadess.net>
To: linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	Bastien Nocera <hadess@hadess.net>
Subject: [PATCH v2 09/11] HID: uclogic: Use pm_ptr instead of #ifdef CONFIG_PM
Date: Tue, 13 Jan 2026 10:24:57 +0100
Message-ID: <20260113092546.265734-10-hadess@hadess.net>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduudelleehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeeurghsthhivghnucfpohgtvghrrgcuoehhrgguvghssheshhgruggvshhsrdhnvghtqeenucggtffrrghtthgvrhhnpeevtefhleevjeffteekleehheeujeelhfdvheethefggefhkefgvdefhfegkeeiteenucfkphepvdgrtddumegvfeegmegvtgejfeemtghfvddtmegsrgegfeemrgeijeeimegtvdgufeemjegrheefnecuvehluhhsthgvrhfuihiivgepkeenucfrrghrrghmpehinhgvthepvdgrtddumegvfeegmegvtgejfeemtghfvddtmegsrgegfeemrgeijeeimegtvdgufeemjegrheefpdhhvghlohepohhlihhmphhitgdpmhgrihhlfhhrohhmpehhrgguvghssheshhgruggvshhsrdhnvghtpdhqihgupeeuhfduuddvgeeffeeuffdpmhhouggvpehsmhhtphhouhhtpdhnsggprhgtphhtthhopeehpdhrtghpthhtoheplhhinhhugidqihhnphhuthesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehjihhkohhssehkvghrnhgvl
 hdrohhrghdprhgtphhtthhopegsvghnjhgrmhhinhdrthhishhsohhirhgvshesrhgvughhrghtrdgtohhmpdhrtghpthhtohephhgruggvshhssehhrgguvghsshdrnhgvth
X-GND-State: clean
X-GND-Score: -100

This increases build coverage and allows to drop an #ifdef.

Signed-off-by: Bastien Nocera <hadess@hadess.net>
---
 drivers/hid/hid-uclogic-core.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/hid/hid-uclogic-core.c b/drivers/hid/hid-uclogic-core.c
index 90ebb81041ea..bd7f93e96e4e 100644
--- a/drivers/hid/hid-uclogic-core.c
+++ b/drivers/hid/hid-uclogic-core.c
@@ -268,7 +268,6 @@ static int uclogic_probe(struct hid_device *hdev,
 	return rc;
 }
 
-#ifdef CONFIG_PM
 static int uclogic_resume(struct hid_device *hdev)
 {
 	int rc;
@@ -283,7 +282,6 @@ static int uclogic_resume(struct hid_device *hdev)
 
 	return rc;
 }
-#endif
 
 /**
  * uclogic_exec_event_hook - if the received event is hooked schedules the
@@ -636,10 +634,8 @@ static struct hid_driver uclogic_driver = {
 	.raw_event = uclogic_raw_event,
 	.input_mapping = uclogic_input_mapping,
 	.input_configured = uclogic_input_configured,
-#ifdef CONFIG_PM
-	.resume	          = uclogic_resume,
-	.reset_resume     = uclogic_resume,
-#endif
+	.resume	          = pm_ptr(uclogic_resume),
+	.reset_resume     = pm_ptr(uclogic_resume),
 };
 module_hid_driver(uclogic_driver);
 
-- 
2.52.0


