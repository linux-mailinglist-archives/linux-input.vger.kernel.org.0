Return-Path: <linux-input+bounces-9603-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DCE7A21E2D
	for <lists+linux-input@lfdr.de>; Wed, 29 Jan 2025 14:51:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E277F16638F
	for <lists+linux-input@lfdr.de>; Wed, 29 Jan 2025 13:51:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0672D22EE5;
	Wed, 29 Jan 2025 13:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=johanneskirchmair.de header.i=@johanneskirchmair.de header.b="a+0pWbY3"
X-Original-To: linux-input@vger.kernel.org
Received: from mx8.mail-out.lima-city.de (mx8.mail-out.lima-city.de [91.216.248.210])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A3ADCA6B
	for <linux-input@vger.kernel.org>; Wed, 29 Jan 2025 13:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.216.248.210
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738158694; cv=none; b=JgU3xUVJccOqSuSBGIITgbFXVxkpS6U9olgF1BDifxkcV9qejD25sSAGFWtLx7aEkqk+j4vGNdyXAiqsZPEr36mLY9332YbZxlwYj9qc+JdvQ68xaE06+ybawEgjqnoJDdlWwVS+OAKmJqSbjTUReB/hCxZcgG/vRGw+ijgA3Vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738158694; c=relaxed/simple;
	bh=xqVuKEHxGbNjhtMwH++jKdwrZo/+cTGdRBjX3Jb37xs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=J/QvU9WVDyq2pej7WeCTFMKgMaPgDN22KCS1lScC1hUvRFX35VgAvjBZF0QF0tYDl7OVIusQNavWN/Bn8dS+kkBxB7KEErCpXm+qeXZOJNA3fvXUP/q8hF9s5KwbV9cxLaPSIC6E+qlYpvQvHuJfGQy9BlfcvO87wb7PUEHnDy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=johanneskirchmair.de; spf=none smtp.mailfrom=johanneskirchmair.de; dkim=pass (1024-bit key) header.d=johanneskirchmair.de header.i=@johanneskirchmair.de header.b=a+0pWbY3; arc=none smtp.client-ip=91.216.248.210
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=johanneskirchmair.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=johanneskirchmair.de
From: mailinglist1@johanneskirchmair.de
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=johanneskirchmair.de;
	s=securedbylima-20161106; t=1738158689;
	bh=xqVuKEHxGbNjhtMwH++jKdwrZo/+cTGdRBjX3Jb37xs=;
	h=From:Date:Subject:To:Cc:From;
	b=a+0pWbY3rR25nSSKzws1LPSBzJrBKZCcQNX9sYwL3Mg6JN7ysTUGElFdJNvbzNsKl
	 /0zMdLmFgeZOUs2lfP94OMO2+g2wnDMN/gXs+kWmmN3VERYBe3E6/aW40LaFNb7gqo
	 fwwmRkjsd5ref17jD/1uy/LfjJHHiwzNv8L8BHSY=
Date: Wed, 29 Jan 2025 14:51:20 +0100
Subject: [PATCH v2] tsc2007: prevent overflow in pressure calculation
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250129-fix_tsc_calculation_overflow-v2-1-9e51333496ad@skidata.com>
X-B4-Tracking: v=1; b=H4sIAFcymmcC/42NWw6CMBBFt0Lm25o+EMEv92FI07SDTERq2lo1h
 L1bWYGf5+bk3AUiBsIIp2qBgJki+bmA3FVgRzNfkZErDJLLAxeyYwO9dYpWWzPZ52RS8bXPGIb
 Jv1jH24a7GlXdSSiJR8Dib/lLX3ikmHz4bG9Z/NY/w1kwwZRpULVto462PscbOZPM3vo79Ou6f
 gFoK/AOygAAAA==
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org, 
 Johannes Kirchmair <johannes.kirchmair@skidata.com>
X-Mailer: b4 0.14.1

From: Johannes Kirchmair <johannes.kirchmair@skidata.com>

The touch resistance calculation in the tsc2007 driver is prone to overflow
if (z2 - z1) is large and also x is reasonably big. As an result the
driver sometimes emit input events even with very little touch pressure
applied. For those events the x and y coordinates can be substantially
off. We fix the overflow problematic by calculating in a bigger int
type.

Signed-off-by: Johannes Kirchmair <johannes.kirchmair@skidata.com>
---
Changes in v2:
- removed brackets that slipped in
- use div_u64
---
 drivers/input/touchscreen/tsc2007_core.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/input/touchscreen/tsc2007_core.c b/drivers/input/touchscreen/tsc2007_core.c
index 8d832a372b89..0b5934d843b9 100644
--- a/drivers/input/touchscreen/tsc2007_core.c
+++ b/drivers/input/touchscreen/tsc2007_core.c
@@ -23,6 +23,7 @@
 #include <linux/input.h>
 #include <linux/interrupt.h>
 #include <linux/i2c.h>
+#include <linux/math64.h>
 #include <linux/mod_devicetable.h>
 #include <linux/property.h>
 #include <linux/platform_data/tsc2007.h>
@@ -68,7 +69,7 @@ static void tsc2007_read_values(struct tsc2007 *tsc, struct ts_event *tc)
 
 u32 tsc2007_calculate_resistance(struct tsc2007 *tsc, struct ts_event *tc)
 {
-	u32 rt = 0;
+	u64 rt = 0;
 
 	/* range filtering */
 	if (tc->x == MAX_12BIT)
@@ -79,11 +80,13 @@ u32 tsc2007_calculate_resistance(struct tsc2007 *tsc, struct ts_event *tc)
 		rt = tc->z2 - tc->z1;
 		rt *= tc->x;
 		rt *= tsc->x_plate_ohms;
-		rt /= tc->z1;
+		rt = div_u64(rt, tc->z1);
 		rt = (rt + 2047) >> 12;
 	}
 
-	return rt;
+	if (rt > U32_MAX)
+		return U32_MAX;
+	return (u32) rt;
 }
 
 bool tsc2007_is_pen_down(struct tsc2007 *ts)

---
base-commit: 05dbaf8dd8bf537d4b4eb3115ab42a5fb40ff1f5
change-id: 20250129-fix_tsc_calculation_overflow-90860d4e3492

Best regards,
-- 
Johannes Kirchmair <johannes.kirchmair@skidata.com>


