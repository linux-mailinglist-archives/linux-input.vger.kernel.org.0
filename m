Return-Path: <linux-input+bounces-889-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D64819735
	for <lists+linux-input@lfdr.de>; Wed, 20 Dec 2023 04:38:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 981C81F25C4B
	for <lists+linux-input@lfdr.de>; Wed, 20 Dec 2023 03:38:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FFA18C0B;
	Wed, 20 Dec 2023 03:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=endrift.com header.i=@endrift.com header.b="XnRLODCK"
X-Original-To: linux-input@vger.kernel.org
Received: from endrift.com (endrift.com [173.255.198.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B87D8BF6
	for <linux-input@vger.kernel.org>; Wed, 20 Dec 2023 03:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=endrift.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=endrift.com
Received: from nebulosa.vulpes.eutheria.net (71-212-26-68.tukw.qwest.net [71.212.26.68])
	by endrift.com (Postfix) with ESMTPSA id 8F0ABA080;
	Tue, 19 Dec 2023 19:38:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=endrift.com; s=2020;
	t=1703043529; bh=jOy6Oq/EDgiJ3iuPU4rQfen1ZSuyujYUA9R32NeUF4E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XnRLODCKQILv/ixiVHh4oYa3iJO7THrIDtRItewP5ClyVmG0kA7UvLRSYWt7uaeUg
	 W+6rXBanXgiGOOfkGzD+OyWaipuqSubhEXuDz+hMaxAbDcmJPM6fmXGZXka50ush/A
	 ISzL9YvYApYEb+X0LsW3v60cSUo/b5tA8xVHB+Ifi7B0Z+7vNAFo2BQzD/RJ2V6lVG
	 gq0d9e5L59rnKUsL1lVUmloPG0KebVyg6kmVkn/pBPNKPlVMi0x5gtU0JQVqp5H5qi
	 AZDdZqePs3H/6wZ6EVHKTCc1srsqMw8SyH6PKQcmieZyMfZqFOlsRhsjLSa6u6jhYj
	 /78Pv6EgK9oqA==
From: Vicki Pfau <vi@endrift.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	linux-input@vger.kernel.org
Cc: Vicki Pfau <vi@endrift.com>
Subject: [PATCH 1/7] HID: hid-steam: Avoid overwriting smoothing parameter
Date: Tue, 19 Dec 2023 19:38:31 -0800
Message-ID: <20231220033837.2135194-1-vi@endrift.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231220033609.2132033-1-vi@endrift.com>
References: <20231220033609.2132033-1-vi@endrift.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The original implementation of this driver incorrectly guessed the function of
this register. It's not only unnecessary to write to this register for lizard
mode but actually counter-productive since it overwrites whatever previous
value was intentionally set, for example by Steam.

Signed-off-by: Vicki Pfau <vi@endrift.com>
---
 drivers/hid/hid-steam.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/hid/hid-steam.c b/drivers/hid/hid-steam.c
index b110818fc945..7aefd52e945a 100644
--- a/drivers/hid/hid-steam.c
+++ b/drivers/hid/hid-steam.c
@@ -340,9 +340,6 @@ static void steam_set_lizard_mode(struct steam_device *steam, bool enable)
 		steam_send_report_byte(steam, STEAM_CMD_DEFAULT_MAPPINGS);
 		/* enable mouse */
 		steam_send_report_byte(steam, STEAM_CMD_DEFAULT_MOUSE);
-		steam_write_registers(steam,
-			STEAM_REG_RPAD_MARGIN, 0x01, /* enable margin */
-			0);
 
 		cancel_delayed_work_sync(&steam->heartbeat);
 	} else {
@@ -351,7 +348,6 @@ static void steam_set_lizard_mode(struct steam_device *steam, bool enable)
 
 		if (steam->quirks & STEAM_QUIRK_DECK) {
 			steam_write_registers(steam,
-				STEAM_REG_RPAD_MARGIN, 0x00, /* disable margin */
 				STEAM_REG_LPAD_MODE, 0x07, /* disable mouse */
 				STEAM_REG_RPAD_MODE, 0x07, /* disable mouse */
 				STEAM_REG_LPAD_CLICK_PRESSURE, 0xFFFF, /* disable clicky pad */
@@ -365,7 +361,6 @@ static void steam_set_lizard_mode(struct steam_device *steam, bool enable)
 				schedule_delayed_work(&steam->heartbeat, 5 * HZ);
 		} else {
 			steam_write_registers(steam,
-				STEAM_REG_RPAD_MARGIN, 0x00, /* disable margin */
 				STEAM_REG_LPAD_MODE, 0x07, /* disable mouse */
 				STEAM_REG_RPAD_MODE, 0x07, /* disable mouse */
 				0);
-- 
2.42.0


