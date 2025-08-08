Return-Path: <linux-input+bounces-13860-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 45E7BB1E146
	for <lists+linux-input@lfdr.de>; Fri,  8 Aug 2025 06:32:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3E30E164388
	for <lists+linux-input@lfdr.de>; Fri,  8 Aug 2025 04:32:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA14A18871F;
	Fri,  8 Aug 2025 04:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=endrift.com header.i=@endrift.com header.b="YePnTO3q"
X-Original-To: linux-input@vger.kernel.org
Received: from endrift.com (endrift.com [173.255.198.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E0F914885D
	for <linux-input@vger.kernel.org>; Fri,  8 Aug 2025 04:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=173.255.198.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754627536; cv=none; b=bNKEIPLIICX0QxYZ613oH26yWcyA2TJtRix5hH5F/HObjWpKPDqMreo4OFRD/1EC22MT+XmI426tLT0IO5m4YB3le9QWM581sN+cal/ySUU7Jmvu/4dkstn9gVtSTGfJdunXyHGsMlpvC1ZQFYw3uF7KchF+cigdSZflVfLZhEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754627536; c=relaxed/simple;
	bh=T5rFxt/gqRSBV9simTxL9UzRI122n0W4Nnuzq627TNc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ftj+uU4nsxUfFfZWOGQAPwEnzCrvENQaZDM8Ip7/JykzXQct/ZdUVyBdZKgzkIWlZkaHbqiUJeP2/YOWHxQA+M3sE0dtLW3IBu8aagKbHGLw3DP6Vgw+ysPgdVuTm5caMQ7wE+Iw1Odl1g9dTfA49yxcn15OSX3r5miHrG+rrTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=endrift.com; spf=pass smtp.mailfrom=endrift.com; dkim=pass (2048-bit key) header.d=endrift.com header.i=@endrift.com header.b=YePnTO3q; arc=none smtp.client-ip=173.255.198.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=endrift.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=endrift.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=endrift.com; s=2020;
	t=1754627528; bh=T5rFxt/gqRSBV9simTxL9UzRI122n0W4Nnuzq627TNc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YePnTO3qu4o57+h52xXUhAsHI0vWGmoDgBQdGgkIAz36takft0ZTU0gcROpIjd3b6
	 Sq/xPK40sKoaantsDn33nH3HPjotLgOiDKN7hNZfrvV+AQDuX2BjzGCa1u1qddUXMa
	 VVjaEEBypoZATYkcAgoBRDDO893gASnf8T9jhxSgNgn7XgPuLZW2p4Czvy2MqI8l+X
	 trCH82qCc1XX2zzxS2FxqTfSBHXbLxexPIkA57ls57CTDZk8cZBvFg/0pDm0ZHiXgj
	 3DcBry3clr8xKEmqjVyY95qF8Smqo+sS8NW6rYM7wlISFH9BdZ6prFGl8zXAsmfwyP
	 IVNZ/+K8cu05A==
Received: from nebulosa.vulpes.eutheria.net (71-212-74-234.tukw.qwest.net [71.212.74.234])
	by endrift.com (Postfix) with ESMTPSA id 08B49A250;
	Thu,  7 Aug 2025 21:32:07 -0700 (PDT)
From: Vicki Pfau <vi@endrift.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	linux-input@vger.kernel.org
Cc: Vicki Pfau <vi@endrift.com>
Subject: [PATCH 3/6] Input: Add ABS_CLUTCH, HANDBRAKE, and SHIFTER
Date: Thu,  7 Aug 2025 21:30:10 -0700
Message-ID: <20250808043017.1953101-4-vi@endrift.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250808043017.1953101-1-vi@endrift.com>
References: <20250808043017.1953101-1-vi@endrift.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add new absolute axes for racing game controllers

Signed-off-by: Vicki Pfau <vi@endrift.com>
---
 drivers/hid/hid-debug.c                | 16 +++++++++-------
 include/uapi/linux/input-event-codes.h |  3 +++
 2 files changed, 12 insertions(+), 7 deletions(-)

diff --git a/drivers/hid/hid-debug.c b/drivers/hid/hid-debug.c
index 264eefaed08fb..534df8e4082da 100644
--- a/drivers/hid/hid-debug.c
+++ b/drivers/hid/hid-debug.c
@@ -3505,13 +3505,15 @@ static const char *absolutes[ABS_CNT] = {
 	[ABS_RY] = "Ry",		[ABS_RZ] = "Rz",
 	[ABS_THROTTLE] = "Throttle",	[ABS_RUDDER] = "Rudder",
 	[ABS_WHEEL] = "Wheel",		[ABS_GAS] = "Gas",
-	[ABS_BRAKE] = "Brake",		[ABS_HAT0X] = "Hat0X",
-	[ABS_HAT0Y] = "Hat0Y",		[ABS_HAT1X] = "Hat1X",
-	[ABS_HAT1Y] = "Hat1Y",		[ABS_HAT2X] = "Hat2X",
-	[ABS_HAT2Y] = "Hat2Y",		[ABS_HAT3X] = "Hat3X",
-	[ABS_HAT3Y] = "Hat 3Y",		[ABS_PRESSURE] = "Pressure",
-	[ABS_DISTANCE] = "Distance",	[ABS_TILT_X] = "XTilt",
-	[ABS_TILT_Y] = "YTilt",		[ABS_TOOL_WIDTH] = "ToolWidth",
+	[ABS_BRAKE] = "Brake",		[ABS_CLUTCH] = "Clutch",
+	[ABS_HANDBRAKE] = "Handbrake",	[ABS_SHIFTER] = "Shifter",
+	[ABS_HAT0X] = "Hat0X",		[ABS_HAT0Y] = "Hat0Y",
+	[ABS_HAT1X] = "Hat1X",		[ABS_HAT1Y] = "Hat1Y",
+	[ABS_HAT2X] = "Hat2X",		[ABS_HAT2Y] = "Hat2Y",
+	[ABS_HAT3X] = "Hat3X",		[ABS_HAT3Y] = "Hat3Y",
+	[ABS_PRESSURE] = "Pressure",	[ABS_DISTANCE] = "Distance",
+	[ABS_TILT_X] = "XTilt",		[ABS_TILT_Y] = "YTilt",
+	[ABS_TOOL_WIDTH] = "ToolWidth",
 	[ABS_VOLUME] = "Volume",	[ABS_PROFILE] = "Profile",
 	[ABS_MISC] = "Misc",
 	[ABS_MT_SLOT] = "MTSlot",
diff --git a/include/uapi/linux/input-event-codes.h b/include/uapi/linux/input-event-codes.h
index 08cb157ab5936..195139e895ffb 100644
--- a/include/uapi/linux/input-event-codes.h
+++ b/include/uapi/linux/input-event-codes.h
@@ -859,6 +859,9 @@
 #define ABS_WHEEL		0x08
 #define ABS_GAS			0x09
 #define ABS_BRAKE		0x0a
+#define ABS_CLUTCH		0x0b
+#define ABS_HANDBRAKE		0x0c
+#define ABS_SHIFTER		0x0d
 #define ABS_HAT0X		0x10
 #define ABS_HAT0Y		0x11
 #define ABS_HAT1X		0x12
-- 
2.50.1


