Return-Path: <linux-input+bounces-16964-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A591D1218D
	for <lists+linux-input@lfdr.de>; Mon, 12 Jan 2026 11:59:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4090E3095381
	for <lists+linux-input@lfdr.de>; Mon, 12 Jan 2026 10:58:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE508352C5D;
	Mon, 12 Jan 2026 10:58:03 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [217.70.178.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ECCD352928;
	Mon, 12 Jan 2026 10:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.178.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768215482; cv=none; b=lJLuX0tChdQTCdov4VqDw2A4QbrOVvCdDu3wWKfwthGW2P88HtAEmZ4E4Vl4Zlelcf4PJ4vJIdUQFUup1+NvyarphSqUPnieW8M2rbHNOJ3tAnyH93V3YpgawOb9I6isovvkt/rzN4o4jL2FGPWSPTqhp5BClMf1ptx89K7I/XA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768215482; c=relaxed/simple;
	bh=0tWzqXO2ZynXKz44J0ICRsNUlUR+UGW9rV2CEv6wi4s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=t1GkcKTxzMk4hhRGCf79fCIGrQvZxknqGj81zwu+5joCYYdJjIsWX6gk3U50ZU4NQWpIpLwGZrO9CEA0UdZV448mWP8oQwIAXt2RoczunQ0Z+8GyG3ij6GqamObJJjzhYZ+tCDDo7Em7tN3fSoSbt7bVUH/upWBnBz33nnzvPKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hadess.net; spf=pass smtp.mailfrom=hadess.net; arc=none smtp.client-ip=217.70.178.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hadess.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hadess.net
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	by mslow3.mail.gandi.net (Postfix) with ESMTP id 81ADB580C7C;
	Mon, 12 Jan 2026 10:55:16 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B93DB43B3C;
	Mon, 12 Jan 2026 10:55:08 +0000 (UTC)
From: Bastien Nocera <hadess@hadess.net>
To: linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	Bastien Nocera <hadess@hadess.net>
Subject: [PATCH 00/12] HID: Use pm_*ptr instead of #ifdef CONFIG_PM*
Date: Mon, 12 Jan 2026 11:52:49 +0100
Message-ID: <20260112105500.3664834-1-hadess@hadess.net>
X-Mailer: git-send-email 2.52.0
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduudejvdejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpeeurghsthhivghnucfpohgtvghrrgcuoehhrgguvghssheshhgruggvshhsrdhnvghtqeenucggtffrrghtthgvrhhnpeffteektdejuddvhfdtfedtvdetgeeileethfetgfdtheekvefgueeifffhvefhfeenucfkphepvdgrtddumegvfeegmegvtgejfeemtghfvddtmegsrgegfeemrgeijeeimegtvdgufeemjegrheefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegvfeegmegvtgejfeemtghfvddtmegsrgegfeemrgeijeeimegtvdgufeemjegrheefpdhhvghlohepohhlihhmphhitgdpmhgrihhlfhhrohhmpehhrgguvghssheshhgruggvshhsrdhnvghtpdhqihgupeeuleefffeugeefueefvedpmhhouggvpehsmhhtphhouhhtpdhnsggprhgtphhtthhopeehpdhrtghpthhtoheplhhinhhugidqihhnphhuthesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehjihhkohhssehkvghrnhgvlhdro
 hhrghdprhgtphhtthhopegsvghnjhgrmhhinhdrthhishhsohhirhgvshesrhgvughhrghtrdgtohhmpdhrtghpthhtohephhgruggvshhssehhrgguvghsshdrnhgvth

All those changes should be safe, as similar ones were done in other
subsystems, but I'm uncertain about the surface changes.

Bastien Nocera (12):
  HID: hid-alps: Use pm_ptr instead of #ifdef CONFIG_PM
  HID: appletb-kbd: Use pm_ptr instead of #ifdef CONFIG_PM
  HID: asus: Use pm_ptr instead of #ifdef CONFIG_PM
  HID: lenovo: Use pm_ptr instead of #ifdef CONFIG_PM
  HID: logitech-dj: Use pm_ptr instead of #ifdef CONFIG_PM
  HID: nintendo: Use pm_ptr instead of #ifdef CONFIG_PM
  HID: picolcd_core: Use pm_ptr instead of #ifdef CONFIG_PM
  HID: hid-sensor-hub: Use pm_ptr instead of #ifdef CONFIG_PM
  HID: sony: Use pm_ptr instead of #ifdef CONFIG_PM
  HID: uclogic: Use pm_ptr instead of #ifdef CONFIG_PM
  HID: wacom: Use pm_ptr instead of #ifdef CONFIG_PM
  HID: surface: Use pm_ptr_sleep instead of #ifdef CONFIG_PM_SLEEP

 drivers/hid/hid-alps.c                     | 6 ++----
 drivers/hid/hid-appletb-kbd.c              | 6 ++----
 drivers/hid/hid-asus.c                     | 6 ++----
 drivers/hid/hid-lenovo.c                   | 4 +---
 drivers/hid/hid-logitech-dj.c              | 4 +---
 drivers/hid/hid-nintendo.c                 | 7 ++-----
 drivers/hid/hid-picolcd_core.c             | 8 +++-----
 drivers/hid/hid-sensor-hub.c               | 8 +++-----
 drivers/hid/hid-sony.c                     | 9 +++------
 drivers/hid/hid-uclogic-core.c             | 6 ++----
 drivers/hid/surface-hid/surface_hid.c      | 2 +-
 drivers/hid/surface-hid/surface_hid_core.c | 5 -----
 drivers/hid/surface-hid/surface_kbd.c      | 2 +-
 drivers/hid/wacom_sys.c                    | 6 ++----
 14 files changed, 25 insertions(+), 54 deletions(-)

-- 
2.52.0


