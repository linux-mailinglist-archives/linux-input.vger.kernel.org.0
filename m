Return-Path: <linux-input+bounces-16960-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 298CDD12127
	for <lists+linux-input@lfdr.de>; Mon, 12 Jan 2026 11:55:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7020D301D319
	for <lists+linux-input@lfdr.de>; Mon, 12 Jan 2026 10:55:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84033350282;
	Mon, 12 Jan 2026 10:55:26 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F34034FF5B;
	Mon, 12 Jan 2026 10:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768215324; cv=none; b=Oy44T7Jbf0Rp0xUTzOhGi8WPI5fKbRxm2eUdUVEUoXmstDlzcC33TP2yminjwMP48UAsSw34+CuC58VgJQn8cOUzeWi+ynq7EMA32RFvEjQz8NEdQGIazTCg8JW9/123gH0I1O545fDE/atrY5FX7aLXfl49KLvv5ND2AlsWvL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768215324; c=relaxed/simple;
	bh=NPS4h5UvRAYFBw42aePxoXZazbahXZQnvthTWw47lPM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aSNrruqorRIIIm8MmZ0jfF6D6CXUO/VII0V7oWUy8Fp86C6dRVdyj4xs/7d30M5rKyhK++s6fhybJAfAGHdGGB0lW4zHcq0jhcBzkotHAX+cI5fiIdRaod+6vlcy8+AAOWFJ4ZdQFACs/+KpQVAfghHl9n+6HSpxJWYyfIHjiys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hadess.net; spf=pass smtp.mailfrom=hadess.net; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hadess.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hadess.net
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9FD6243E8C;
	Mon, 12 Jan 2026 10:55:16 +0000 (UTC)
From: Bastien Nocera <hadess@hadess.net>
To: linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	Bastien Nocera <hadess@hadess.net>
Subject: [PATCH 12/12] HID: surface: Use pm_ptr_sleep instead of #ifdef CONFIG_PM_SLEEP
Date: Mon, 12 Jan 2026 11:53:01 +0100
Message-ID: <20260112105500.3664834-13-hadess@hadess.net>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduudejvdejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeeurghsthhivghnucfpohgtvghrrgcuoehhrgguvghssheshhgruggvshhsrdhnvghtqeenucggtffrrghtthgvrhhnpeevtefhleevjeffteekleehheeujeelhfdvheethefggefhkefgvdefhfegkeeiteenucfkphepvdgrtddumegvfeegmegvtgejfeemtghfvddtmegsrgegfeemrgeijeeimegtvdgufeemjegrheefnecuvehluhhsthgvrhfuihiivgepuddtnecurfgrrhgrmhepihhnvghtpedvrgdtudemvgefgeemvggtjeefmegtfhdvtdemsggrgeefmegrieejieemtgdvugefmeejrgehfedphhgvlhhopeholhhimhhpihgtpdhmrghilhhfrhhomhephhgruggvshhssehhrgguvghsshdrnhgvthdpqhhiugeplefhffeivdegfefgkeevpdhmohguvgepshhmthhpohhuthdpnhgspghrtghpthhtohephedprhgtphhtthhopehlihhnuhigqdhinhhpuhhtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepjhhikhhosheskhgvrhhnv
 ghlrdhorhhgpdhrtghpthhtohepsggvnhhjrghmihhnrdhtihhsshhoihhrvghssehrvgguhhgrthdrtghomhdprhgtphhtthhopehhrgguvghssheshhgruggvshhsrdhnvght

This increases build coverage and allows to drop an #ifdef.

Signed-off-by: Bastien Nocera <hadess@hadess.net>
---
 drivers/hid/surface-hid/surface_hid.c      | 2 +-
 drivers/hid/surface-hid/surface_hid_core.c | 5 -----
 drivers/hid/surface-hid/surface_kbd.c      | 2 +-
 3 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/hid/surface-hid/surface_hid.c b/drivers/hid/surface-hid/surface_hid.c
index eae47e0d95ed..21904612b5ad 100644
--- a/drivers/hid/surface-hid/surface_hid.c
+++ b/drivers/hid/surface-hid/surface_hid.c
@@ -241,7 +241,7 @@ static struct ssam_device_driver surface_hid_driver = {
 	.match_table = surface_hid_match,
 	.driver = {
 		.name = "surface_hid",
-		.pm = &surface_hid_pm_ops,
+		.pm = pm_ptr_sleep(&surface_hid_pm_ops),
 		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 	},
 };
diff --git a/drivers/hid/surface-hid/surface_hid_core.c b/drivers/hid/surface-hid/surface_hid_core.c
index 6690c24f28f0..33fe15fbcf6c 100644
--- a/drivers/hid/surface-hid/surface_hid_core.c
+++ b/drivers/hid/surface-hid/surface_hid_core.c
@@ -281,11 +281,6 @@ const struct dev_pm_ops surface_hid_pm_ops = {
 };
 EXPORT_SYMBOL_GPL(surface_hid_pm_ops);
 
-#else /* CONFIG_PM_SLEEP */
-
-const struct dev_pm_ops surface_hid_pm_ops = { };
-EXPORT_SYMBOL_GPL(surface_hid_pm_ops);
-
 #endif /* CONFIG_PM_SLEEP */
 
 MODULE_AUTHOR("Maximilian Luz <luzmaximilian@gmail.com>");
diff --git a/drivers/hid/surface-hid/surface_kbd.c b/drivers/hid/surface-hid/surface_kbd.c
index 0be01b5e7425..6ab6870f10e8 100644
--- a/drivers/hid/surface-hid/surface_kbd.c
+++ b/drivers/hid/surface-hid/surface_kbd.c
@@ -288,7 +288,7 @@ static struct platform_driver surface_kbd_driver = {
 	.driver = {
 		.name = "surface_keyboard",
 		.acpi_match_table = surface_kbd_match,
-		.pm = &surface_hid_pm_ops,
+		.pm = pm_ptr_sleep(&surface_hid_pm_ops),
 		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 	},
 };
-- 
2.52.0


