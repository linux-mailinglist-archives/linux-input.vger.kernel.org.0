Return-Path: <linux-input+bounces-9601-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A76D0A21CE8
	for <lists+linux-input@lfdr.de>; Wed, 29 Jan 2025 13:02:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1320A188037C
	for <lists+linux-input@lfdr.de>; Wed, 29 Jan 2025 12:02:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A6D516EB4C;
	Wed, 29 Jan 2025 12:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=johanneskirchmair.de header.i=@johanneskirchmair.de header.b="YwTdTot8"
X-Original-To: linux-input@vger.kernel.org
Received: from mx8.mail-out.lima-city.de (mx8.mail-out.lima-city.de [91.216.248.210])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAB9025A641
	for <linux-input@vger.kernel.org>; Wed, 29 Jan 2025 12:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.216.248.210
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738152161; cv=none; b=WS2ci55OlDfXfZF658AlFxeBeFnTDp+HQw8utdXKeKCMfziLp2CTiJK2whnrMJA7dEyvJFKIAoF2J92khIyBhHJbylOhuxFijKVqgUO6VLMTdd5PT2wSWUGhT3B1cgJSBv4ADgGFjYwG4yqrAaRkzdk6eg+RoCbB+hmUNEQVtf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738152161; c=relaxed/simple;
	bh=oH+C1FuM6fZkgbqrFqqHcKWZkFe2GEGN04SqMEsVWSY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=u29mnLljrFdw2PyIwb2ndkoDUNK7fWpP3qpD+/B2Y6pvcYtrSi8/+7NUpC/mkZIxbnLg/aBzRZBVt6Dx7FCxlMh1SJVF9HpBv0wVOtttv9y3s++AKCMCYkrLanH6n1OmwF/4hwBlGZLGOuIWeSWQZXaigAskww0UEOJRBZHGZ4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=johanneskirchmair.de; spf=none smtp.mailfrom=johanneskirchmair.de; dkim=pass (1024-bit key) header.d=johanneskirchmair.de header.i=@johanneskirchmair.de header.b=YwTdTot8; arc=none smtp.client-ip=91.216.248.210
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=johanneskirchmair.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=johanneskirchmair.de
From: mailinglist1@johanneskirchmair.de
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=johanneskirchmair.de;
	s=securedbylima-20161106; t=1738151768;
	bh=oH+C1FuM6fZkgbqrFqqHcKWZkFe2GEGN04SqMEsVWSY=;
	h=From:Date:Subject:To:Cc:From;
	b=YwTdTot8TjCx3fswabtbrq9uiRFTFoQbEHdsSkTcgZ0pCfsy+yfH5p4xrFGk+S153
	 PmjrZLzYf+LoUAJgHEoMTGeKP1BWflmvpXmJ9FsUymWVocVHg/to9UoiZQfCNLXyO+
	 7SebGtxxV6f2jsxiHhUxQuQuoKASjs8ciNlWEcls=
Date: Wed, 29 Jan 2025 12:56:06 +0100
Subject: [PATCH] tsc2007: prevent overflow in pressure calculation
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250129-fix_tsc_calculation_overflow-v1-1-3a6e388637c4@skidata.com>
X-B4-Tracking: v=1; b=H4sIAFYXmmcC/x3MWwqAIBBA0a3EfCeYPci2EiFiUw1IhvaCaO8Nf
 V443AcSRsIEXfZAxJMShZWjyDNwi11nFDRyg5KqloXSYqLb7MkZZ707vN3Zm3BinHy4hJZtI8c
 Ky0or4MUWkf2/74f3/QCBc12PbgAAAA==
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
 drivers/input/touchscreen/tsc2007_core.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/input/touchscreen/tsc2007_core.c b/drivers/input/touchscreen/tsc2007_core.c
index 8d832a372b89..80abbccd1feb 100644
--- a/drivers/input/touchscreen/tsc2007_core.c
+++ b/drivers/input/touchscreen/tsc2007_core.c
@@ -68,11 +68,12 @@ static void tsc2007_read_values(struct tsc2007 *tsc, struct ts_event *tc)
 
 u32 tsc2007_calculate_resistance(struct tsc2007 *tsc, struct ts_event *tc)
 {
-	u32 rt = 0;
+	u64 rt = 0;
 
 	/* range filtering */
-	if (tc->x == MAX_12BIT)
+	if (tc->x == MAX_12BIT) {
 		tc->x = 0;
+	}
 
 	if (likely(tc->x && tc->z1)) {
 		/* compute touch resistance using equation #1 */
@@ -83,7 +84,9 @@ u32 tsc2007_calculate_resistance(struct tsc2007 *tsc, struct ts_event *tc)
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


