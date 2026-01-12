Return-Path: <linux-input+bounces-16969-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D313D121EE
	for <lists+linux-input@lfdr.de>; Mon, 12 Jan 2026 12:02:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3F0413104AA7
	for <lists+linux-input@lfdr.de>; Mon, 12 Jan 2026 10:58:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA794355023;
	Mon, 12 Jan 2026 10:58:07 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [217.70.178.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 836A8350A1E;
	Mon, 12 Jan 2026 10:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.178.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768215487; cv=none; b=hDPpkDmvWuDcDnzpyPgHzkDKS6Ze71grVE2BTX6A4zYPvia74Cgc6VN5ClUfaT366n0CDpS744uOOp35fv6/j8r7A0muJnzETdypTKjMJA/NCnBKGO+NjBHWmjkbZnquovxZug+LV5uzT2zPGFTuSlXMF8oHtYguTwLuYYoZUMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768215487; c=relaxed/simple;
	bh=ocETv9qDXBqnCa3O7eNQHgj43dxTEtKaXWYz/JczYC8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LJAY2HVbwKE/lg8rCGtyMUIkcPfcdYn0f282AVemo4BRrOH7aT+THGrPHt6EsREjqYnjlghv8hHx1gyI6fP6t65Whpb4Xdx/ANi9PqBj/km5qYxt4vVfU1XDGPI9Maw2mvk0ZJT1QlOqk63Wx0aywRFf75u/CWiS8Nljlbja1DE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hadess.net; spf=pass smtp.mailfrom=hadess.net; arc=none smtp.client-ip=217.70.178.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hadess.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hadess.net
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::224])
	by mslow3.mail.gandi.net (Postfix) with ESMTP id 8E24F580C99;
	Mon, 12 Jan 2026 10:55:22 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B1E4443E8D;
	Mon, 12 Jan 2026 10:55:14 +0000 (UTC)
From: Bastien Nocera <hadess@hadess.net>
To: linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	Bastien Nocera <hadess@hadess.net>
Subject: [PATCH 09/12] HID: sony: Use pm_ptr instead of #ifdef CONFIG_PM
Date: Mon, 12 Jan 2026 11:52:58 +0100
Message-ID: <20260112105500.3664834-10-hadess@hadess.net>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduudejvdejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeeurghsthhivghnucfpohgtvghrrgcuoehhrgguvghssheshhgruggvshhsrdhnvghtqeenucggtffrrghtthgvrhhnpeevtefhleevjeffteekleehheeujeelhfdvheethefggefhkefgvdefhfegkeeiteenucfkphepvdgrtddumegvfeegmegvtgejfeemtghfvddtmegsrgegfeemrgeijeeimegtvdgufeemjegrheefnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehinhgvthepvdgrtddumegvfeegmegvtgejfeemtghfvddtmegsrgegfeemrgeijeeimegtvdgufeemjegrheefpdhhvghlohepohhlihhmphhitgdpmhgrihhlfhhrohhmpehhrgguvghssheshhgruggvshhsrdhnvghtpdhqihgupeeuudfggeeggeefgfekffdpmhhouggvpehsmhhtphhouhhtpdhnsggprhgtphhtthhopeehpdhrtghpthhtoheplhhinhhugidqihhnphhuthesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehjihhkohhssehkvghrnhgvl
 hdrohhrghdprhgtphhtthhopegsvghnjhgrmhhinhdrthhishhsohhirhgvshesrhgvughhrghtrdgtohhmpdhrtghpthhtohephhgruggvshhssehhrgguvghsshdrnhgvth

This increases build coverage and allows to drop an #ifdef.

Signed-off-by: Bastien Nocera <hadess@hadess.net>
---
 drivers/hid/hid-sony.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/hid/hid-sony.c b/drivers/hid/hid-sony.c
index b966e4044238..d94ece0448e9 100644
--- a/drivers/hid/hid-sony.c
+++ b/drivers/hid/hid-sony.c
@@ -2284,12 +2284,9 @@ static struct hid_driver sony_driver = {
 	.remove           = sony_remove,
 	.report_fixup     = sony_report_fixup,
 	.raw_event        = sony_raw_event,
-
-#ifdef CONFIG_PM
-	.suspend          = sony_suspend,
-	.resume	          = sony_resume,
-	.reset_resume     = sony_resume,
-#endif
+	.suspend          = pm_ptr(sony_suspend),
+	.resume	          = pm_ptr(sony_resume),
+	.reset_resume     = pm_ptr(sony_resume),
 };
 
 static int __init sony_init(void)
-- 
2.52.0


