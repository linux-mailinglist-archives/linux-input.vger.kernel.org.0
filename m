Return-Path: <linux-input+bounces-12348-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC5BAAB5FC0
	for <lists+linux-input@lfdr.de>; Wed, 14 May 2025 01:03:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4EF27464F6B
	for <lists+linux-input@lfdr.de>; Tue, 13 May 2025 23:03:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C9D41F0E50;
	Tue, 13 May 2025 23:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=endrift.com header.i=@endrift.com header.b="PTjuqWsA"
X-Original-To: linux-input@vger.kernel.org
Received: from endrift.com (endrift.com [173.255.198.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C73913A3F2
	for <linux-input@vger.kernel.org>; Tue, 13 May 2025 23:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=173.255.198.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747177401; cv=none; b=NBjUHsiV7GoPk72N6Wb16+maRC3zFOcNtAVxBVK8kVYbE7Wzj7fG2tt7SFjtWHnrC/tw/zCvKNVm31MZmhWk6leFeYYzBtg8eQIApMoS5flyrGyROVouE3H4OeMD6dG9yX+2Pz2YrrXlNT0/mYM02wi8eR5mnKT/NdoDgcuRi80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747177401; c=relaxed/simple;
	bh=/xxmsaJiJzPk4fQoPgYEPDW8Bynofp2O1GINoesM4YA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DYnZeSrjdYsHVGgRvPOHeFiCAob2bDxJiZoSs9zni6fG5D+s19YUs9Ijy4Hrs9gDtHPrR6e/abX/rUU9baLjHVR1RL6sbQjfZV7g7v+EGeVlybfyjQx4WyCPl3zGf6QRTCdfMVa/HIDbo4iGK4U0u7GXZX02SRqcNlqlLQYGLLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=endrift.com; spf=pass smtp.mailfrom=endrift.com; dkim=pass (2048-bit key) header.d=endrift.com header.i=@endrift.com header.b=PTjuqWsA; arc=none smtp.client-ip=173.255.198.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=endrift.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=endrift.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=endrift.com; s=2020;
	t=1747176916; bh=/xxmsaJiJzPk4fQoPgYEPDW8Bynofp2O1GINoesM4YA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PTjuqWsAH076biY6szUM0bF6DzO/YqzpBdM/8k8ygURZy1vWS41kLAk0cAW4eArDk
	 CiVhu894k7NfJ5UQFcBe+Ea/9I8DdtGjZOsPd9cpcB412AspQw/2CqcWB7H6/rBuMa
	 EXqm8Q8j5ZVlj2UO6VumoLFHzYTtiiVYnWXo9DB9C9NAW6pGeLnaMgcxxA++3u95rA
	 83ytGcmbd6noqu71iqq3BdCdf10JGGCUBn3CXBMGSkqIHjRI2wCD1uq2xU8juV2zH8
	 GONIb2Bm1NJHeIUdmLJ+ZznR4Gu3oroHnNszw6PwGWvZL0vF+V1mXjC09vwGLWvlA6
	 ICzH3w+SYvBFQ==
Received: from nebulosa.vulpes.eutheria.net (71-212-74-234.tukw.qwest.net [71.212.74.234])
	by endrift.com (Postfix) with ESMTPSA id 3F696A168;
	Tue, 13 May 2025 15:55:16 -0700 (PDT)
From: Vicki Pfau <vi@endrift.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org
Cc: Vicki Pfau <vi@endrift.com>
Subject: [PATCH 3/4] Input: xpad - Send LED and auth done packets to all Xbox One controllers
Date: Tue, 13 May 2025 15:54:01 -0700
Message-ID: <20250513225411.2718072-4-vi@endrift.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250513225411.2718072-1-vi@endrift.com>
References: <20250513225411.2718072-1-vi@endrift.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This mirrors what SDL does, and is closer to Windows's behavior as-is.

Signed-off-by: Vicki Pfau <vi@endrift.com>
---
 drivers/input/joystick/xpad.c | 21 ++++++++-------------
 1 file changed, 8 insertions(+), 13 deletions(-)

diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
index e57157726089..7746530da030 100644
--- a/drivers/input/joystick/xpad.c
+++ b/drivers/input/joystick/xpad.c
@@ -676,20 +676,19 @@ static const u8 xboxone_hori_ack_id[] = {
 };
 
 /*
- * This packet is required for most (all?) of the PDP pads to start
- * sending input reports. These pads include: (0x0e6f:0x02ab),
- * (0x0e6f:0x02a4), (0x0e6f:0x02a6).
+ * This packet is sent by default on Windows, and is required for some pads to
+ * start sending input reports, including most (all?) of the PDP. These pads
+ * include: (0x0e6f:0x02ab), (0x0e6f:0x02a4), (0x0e6f:0x02a6).
  */
-static const u8 xboxone_pdp_led_on[] = {
-	GIP_CMD_LED, GIP_OPT_INTERNAL, GIP_SEQ0, GIP_PL_LEN(3), 0x00, GIP_LED_ON, 0x14
-};
+static const u8 xboxone_led_on[] = { GIP_CMD_LED, GIP_OPT_INTERNAL, GIP_SEQ0,
+GIP_PL_LEN(3), 0x00, GIP_LED_ON, 0x14 };
 
 /*
  * This packet is required for most (all?) of the PDP pads to start
  * sending input reports. These pads include: (0x0e6f:0x02ab),
  * (0x0e6f:0x02a4), (0x0e6f:0x02a6).
  */
-static const u8 xboxone_pdp_auth[] = {
+static const u8 xboxone_auth_done[] = {
 	GIP_CMD_AUTHENTICATE, GIP_OPT_INTERNAL, GIP_SEQ0, GIP_PL_LEN(2), 0x01, 0x00
 };
 
@@ -726,12 +725,8 @@ static const struct xboxone_init_packet xboxone_init_packets[] = {
 	XBOXONE_INIT_PKT(0x045e, 0x02ea, xboxone_s_init),
 	XBOXONE_INIT_PKT(0x045e, 0x0b00, xboxone_s_init),
 	XBOXONE_INIT_PKT(0x045e, 0x0b00, extra_input_packet_init),
-	XBOXONE_INIT_PKT(0x0e6f, 0x0000, xboxone_pdp_led_on),
-	XBOXONE_INIT_PKT(0x0f0d, 0x01b2, xboxone_pdp_led_on),
-	XBOXONE_INIT_PKT(0x20d6, 0xa01a, xboxone_pdp_led_on),
-	XBOXONE_INIT_PKT(0x0e6f, 0x0000, xboxone_pdp_auth),
-	XBOXONE_INIT_PKT(0x0f0d, 0x01b2, xboxone_pdp_auth),
-	XBOXONE_INIT_PKT(0x20d6, 0xa01a, xboxone_pdp_auth),
+	XBOXONE_INIT_PKT(0x0000, 0x0000, xboxone_led_on),
+	XBOXONE_INIT_PKT(0x0000, 0x0000, xboxone_auth_done),
 	XBOXONE_INIT_PKT(0x24c6, 0x541a, xboxone_rumblebegin_init),
 	XBOXONE_INIT_PKT(0x24c6, 0x542a, xboxone_rumblebegin_init),
 	XBOXONE_INIT_PKT(0x24c6, 0x543a, xboxone_rumblebegin_init),
-- 
2.49.0


