Return-Path: <linux-input+bounces-17033-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id AF851D17B56
	for <lists+linux-input@lfdr.de>; Tue, 13 Jan 2026 10:40:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 280D430B54D7
	for <lists+linux-input@lfdr.de>; Tue, 13 Jan 2026 09:28:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DABF838945C;
	Tue, 13 Jan 2026 09:26:17 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E6FD389440;
	Tue, 13 Jan 2026 09:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768296373; cv=none; b=aSAwbSoueqsvy5qJKfr7u/1w7kI/JFBSX1vnNEkDfhsgbUdVvb1o2cWSpWDiLobjkcV0eLAcrhlcieosZKVJkwKlEqIHAaEbkTVlfsxE1bUfrkqU5fuKRsAt++ZIlc7J7DQ1PzKs+YelMVe6VXLDpae5CA1A1F5s0FoyaiclNAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768296373; c=relaxed/simple;
	bh=z9W6Mta+VoeUEqjr253o+pW4+fuZC1ysfDYJY8lL4EY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pWw/za0YzsoSQo9SP+fwV8XwDZ6rpOjMZKfo8R7gr04tMQA8O3uI7WeX6MnW6PipTTcXa10Y4b4UBi9ZY1ytd8Um5O55gDTdZInU4N7S4cyh+e5Jxz/ixQ2EuL9ZJXjpOSPL4zXY91HSISs/7lxH4l4V/Nok58MiiLDnHcdEqyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hadess.net; spf=pass smtp.mailfrom=hadess.net; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hadess.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hadess.net
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5FBFA433CC;
	Tue, 13 Jan 2026 09:26:02 +0000 (UTC)
From: Bastien Nocera <hadess@hadess.net>
To: linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	Bastien Nocera <hadess@hadess.net>
Subject: [PATCH v2 10/11] HID: wacom: Use pm_ptr instead of #ifdef CONFIG_PM
Date: Tue, 13 Jan 2026 10:24:58 +0100
Message-ID: <20260113092546.265734-11-hadess@hadess.net>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduudelleehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeeurghsthhivghnucfpohgtvghrrgcuoehhrgguvghssheshhgruggvshhsrdhnvghtqeenucggtffrrghtthgvrhhnpeevtefhleevjeffteekleehheeujeelhfdvheethefggefhkefgvdefhfegkeeiteenucfkphepvdgrtddumegvfeegmegvtgejfeemtghfvddtmegsrgegfeemrgeijeeimegtvdgufeemjegrheefnecuvehluhhsthgvrhfuihiivgepkeenucfrrghrrghmpehinhgvthepvdgrtddumegvfeegmegvtgejfeemtghfvddtmegsrgegfeemrgeijeeimegtvdgufeemjegrheefpdhhvghlohepohhlihhmphhitgdpmhgrihhlfhhrohhmpehhrgguvghssheshhgruggvshhsrdhnvghtpdhqihgupeehhfeuhfetgeeffeevvedpmhhouggvpehsmhhtphhouhhtpdhnsggprhgtphhtthhopeehpdhrtghpthhtoheplhhinhhugidqihhnphhuthesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehjihhkohhssehkvghrnhgvl
 hdrohhrghdprhgtphhtthhopegsvghnjhgrmhhinhdrthhishhsohhirhgvshesrhgvughhrghtrdgtohhmpdhrtghpthhtohephhgruggvshhssehhrgguvghsshdrnhgvth
X-GND-State: clean
X-GND-Score: -100

This increases build coverage and allows to drop an #ifdef.

Signed-off-by: Bastien Nocera <hadess@hadess.net>
---
 drivers/hid/wacom_sys.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/hid/wacom_sys.c b/drivers/hid/wacom_sys.c
index 9a57504e51a1..afc900560706 100644
--- a/drivers/hid/wacom_sys.c
+++ b/drivers/hid/wacom_sys.c
@@ -2921,7 +2921,6 @@ static void wacom_remove(struct hid_device *hdev)
 		wacom_release_resources(wacom);
 }
 
-#ifdef CONFIG_PM
 static int wacom_resume(struct hid_device *hdev)
 {
 	struct wacom *wacom = hid_get_drvdata(hdev);
@@ -2941,7 +2940,6 @@ static int wacom_reset_resume(struct hid_device *hdev)
 {
 	return wacom_resume(hdev);
 }
-#endif /* CONFIG_PM */
 
 static struct hid_driver wacom_driver = {
 	.name =		"wacom",
@@ -2949,10 +2947,8 @@ static struct hid_driver wacom_driver = {
 	.probe =	wacom_probe,
 	.remove =	wacom_remove,
 	.report =	wacom_wac_report,
-#ifdef CONFIG_PM
-	.resume =	wacom_resume,
-	.reset_resume =	wacom_reset_resume,
-#endif
+	.resume =	pm_ptr(wacom_resume),
+	.reset_resume =	pm_ptr(wacom_reset_resume),
 	.raw_event =	wacom_raw_event,
 };
 module_hid_driver(wacom_driver);
-- 
2.52.0


