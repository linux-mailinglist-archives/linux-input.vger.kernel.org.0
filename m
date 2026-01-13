Return-Path: <linux-input+bounces-17038-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C0CB7D17A96
	for <lists+linux-input@lfdr.de>; Tue, 13 Jan 2026 10:36:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7A5663045DE6
	for <lists+linux-input@lfdr.de>; Tue, 13 Jan 2026 09:29:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27A8E38BDBC;
	Tue, 13 Jan 2026 09:26:25 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [217.70.178.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00E523876DA;
	Tue, 13 Jan 2026 09:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.178.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768296380; cv=none; b=pn8/3LtdtuZ//WdsKtv1j0AU1TSF6KDpuZdqFqRXnt4c7mcWgnCK6nqVGompk38YSHnrg471VBYY7TO0bdS+cWevQtUo7hsYzh3wlu3nB5/tdkXZKn3YBqt9zMpzonNPLrB75MVsxQ6pPtsjuHZ2B0dV77LP0Qgcl3EXLQAIVrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768296380; c=relaxed/simple;
	bh=DIR09SFfhs8NcRNUTX8Ff4AEkRzIvFXIf8lEXW9rE3s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hv7Gtw6qqeNkXgLi3isPVhRGKkEqunLQaEE+XHzduSugyVt0jaWKb5HXEvcxourgPuFRvKWviPbeuZVGdWLK0lnB6qZ+lvY2wrMT7IbQ6m2FJAHBYr7eHPJPBogjPNCkZqijkxv3faIbrY8HizCWkBks+Xdbv7c8MQOqJVGF7HI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hadess.net; spf=pass smtp.mailfrom=hadess.net; arc=none smtp.client-ip=217.70.178.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hadess.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hadess.net
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	by mslow3.mail.gandi.net (Postfix) with ESMTP id 5E200580F08;
	Tue, 13 Jan 2026 09:26:06 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0960A43392;
	Tue, 13 Jan 2026 09:25:58 +0000 (UTC)
From: Bastien Nocera <hadess@hadess.net>
To: linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	Bastien Nocera <hadess@hadess.net>
Subject: [PATCH v2 05/11] HID: logitech-dj: Use pm_ptr instead of #ifdef CONFIG_PM
Date: Tue, 13 Jan 2026 10:24:53 +0100
Message-ID: <20260113092546.265734-6-hadess@hadess.net>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduudelleehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeeurghsthhivghnucfpohgtvghrrgcuoehhrgguvghssheshhgruggvshhsrdhnvghtqeenucggtffrrghtthgvrhhnpeevtefhleevjeffteekleehheeujeelhfdvheethefggefhkefgvdefhfegkeeiteenucfkphepvdgrtddumegvfeegmegvtgejfeemtghfvddtmegsrgegfeemrgeijeeimegtvdgufeemjegrheefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegvfeegmegvtgejfeemtghfvddtmegsrgegfeemrgeijeeimegtvdgufeemjegrheefpdhhvghlohepohhlihhmphhitgdpmhgrihhlfhhrohhmpehhrgguvghssheshhgruggvshhsrdhnvghtpdhqihgupedtleeitdetgeeffeelvddpmhhouggvpehsmhhtphhouhhtpdhnsggprhgtphhtthhopeehpdhrtghpthhtoheplhhinhhugidqihhnphhuthesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehjihhkohhssehkvghrnhgvl
 hdrohhrghdprhgtphhtthhopegsvghnjhgrmhhinhdrthhishhsohhirhgvshesrhgvughhrghtrdgtohhmpdhrtghpthhtohephhgruggvshhssehhrgguvghsshdrnhgvth
X-GND-State: clean
X-GND-Score: -100

This increases build coverage and allows to drop an #ifdef.

Signed-off-by: Bastien Nocera <hadess@hadess.net>
---
 drivers/hid/hid-logitech-dj.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/hid/hid-logitech-dj.c b/drivers/hid/hid-logitech-dj.c
index 44b716697510..3d8821d5b2d2 100644
--- a/drivers/hid/hid-logitech-dj.c
+++ b/drivers/hid/hid-logitech-dj.c
@@ -1983,7 +1983,6 @@ static int logi_dj_probe(struct hid_device *hdev,
 	return retval;
 }
 
-#ifdef CONFIG_PM
 static int logi_dj_reset_resume(struct hid_device *hdev)
 {
 	struct dj_receiver_dev *djrcv_dev = hid_get_drvdata(hdev);
@@ -1994,7 +1993,6 @@ static int logi_dj_reset_resume(struct hid_device *hdev)
 	logi_dj_recv_switch_to_dj_mode(djrcv_dev, 0);
 	return 0;
 }
-#endif
 
 static void logi_dj_remove(struct hid_device *hdev)
 {
@@ -2150,9 +2148,7 @@ static struct hid_driver logi_djreceiver_driver = {
 	.probe = logi_dj_probe,
 	.remove = logi_dj_remove,
 	.raw_event = logi_dj_raw_event,
-#ifdef CONFIG_PM
-	.reset_resume = logi_dj_reset_resume,
-#endif
+	.reset_resume = pm_ptr(logi_dj_reset_resume),
 };
 
 module_hid_driver(logi_djreceiver_driver);
-- 
2.52.0


