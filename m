Return-Path: <linux-input+bounces-13326-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E66E0AF098D
	for <lists+linux-input@lfdr.de>; Wed,  2 Jul 2025 06:02:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 272EE17A71D
	for <lists+linux-input@lfdr.de>; Wed,  2 Jul 2025 04:02:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 516341DF27F;
	Wed,  2 Jul 2025 04:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=endrift.com header.i=@endrift.com header.b="HczFCmOi"
X-Original-To: linux-input@vger.kernel.org
Received: from endrift.com (endrift.com [173.255.198.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF5E01DDA0C
	for <linux-input@vger.kernel.org>; Wed,  2 Jul 2025 04:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=173.255.198.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751428937; cv=none; b=QmB5wwXgH73tH0Q3Znt0US2p34vO9YyebW9krqcAYB7pN4aIWpaA8AYCYSlX+kmWvszGMvlNQuQolgK54fP8qMzOkGFCTlL1EvP8K7kcqn+JboJbcfkw0Y7UjcD5rB1C/VNBlNtyk/WhGWMfsEQeEZalEUleAZoKYULZx2xoK50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751428937; c=relaxed/simple;
	bh=U9SETKxmQuNwr6ECFZh0GCHyM6bfoesk6AcanQ1CXrA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K0CRijhj9echkfR5ZcciJF8sJBMn0iKCa6lUufKRQYe4H2J5WN1YHcPxOxF03Sf5C/J33yCKvNgI8Otv1naGEgS9Lda0FgrCAG5aTRFRHO6SYwWpGDGtUXP2mBobDGjJxysXg1RnOl617t40dQNzxlMSF+RjibubN4SwIjj8AM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=endrift.com; spf=pass smtp.mailfrom=endrift.com; dkim=pass (2048-bit key) header.d=endrift.com header.i=@endrift.com header.b=HczFCmOi; arc=none smtp.client-ip=173.255.198.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=endrift.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=endrift.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=endrift.com; s=2020;
	t=1751428935; bh=U9SETKxmQuNwr6ECFZh0GCHyM6bfoesk6AcanQ1CXrA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HczFCmOiu2BE0w7AgYK6ve0qhqWLIVbmVE1k5X/biPFUG+l2cs7ON+mEukZU2dm5D
	 IBvJ/aADmYtTsInrtiYvLwBAwHee6EgaP81ZNNI3ZqShg4YokJreZJewadATPUFTdf
	 RqyNyVtppzrOGZD8Ac6iHC+RXYhwBYlxU2R4imPUYcyos1BSNlfhO9ErV94SGHFFGJ
	 DnHlXBy1vB7GVYLOt0LsqKPZ70c9sWMk2T3y5pvB/XZWtIZej2SMBTWs1LDtJjkSqh
	 YftbbpyPoSXd86P9kVtwL1rsXXhP6kpOGyleplhzjrvDDVPamr1+kV8xz1oxZTur4n
	 DzNUJiugg1rag==
Received: from microtis.vulpes.eutheria.net (71-212-74-234.tukw.qwest.net [71.212.74.234])
	by endrift.com (Postfix) with ESMTPSA id DEB49A124;
	Tue,  1 Jul 2025 21:02:14 -0700 (PDT)
From: Vicki Pfau <vi@endrift.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	linux-input@vger.kernel.org
Cc: Vicki Pfau <vi@endrift.com>
Subject: [PATCH 2/3] Input - xpad: Use new BTN_GRIP* buttons
Date: Tue,  1 Jul 2025 21:01:01 -0700
Message-ID: <20250702040102.125432-3-vi@endrift.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250702040102.125432-1-vi@endrift.com>
References: <20250702040102.125432-1-vi@endrift.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Vicki Pfau <vi@endrift.com>
---
 drivers/input/joystick/xpad.c | 36 +++++++++++++++++------------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
index d02ddfbc5216..90855d54fcc2 100644
--- a/drivers/input/joystick/xpad.c
+++ b/drivers/input/joystick/xpad.c
@@ -478,8 +478,8 @@ static const signed short xpad_abs_triggers[] = {
 
 /* used when the controller has extra paddle buttons */
 static const signed short xpad_btn_paddles[] = {
-	BTN_TRIGGER_HAPPY5, BTN_TRIGGER_HAPPY6, /* paddle upper right, lower right */
-	BTN_TRIGGER_HAPPY7, BTN_TRIGGER_HAPPY8, /* paddle upper left, lower left */
+	BTN_GRIPR, BTN_GRIPR2, /* paddle upper right, lower right */
+	BTN_GRIPL, BTN_GRIPL2, /* paddle upper left, lower left */
 	-1						/* terminating entry */
 };
 
@@ -1073,10 +1073,10 @@ static void xpadone_process_packet(struct usb_xpad *xpad, u16 cmd, unsigned char
 				data[18] = 0;
 
 			/* Elite Series 2 split packet paddle bits */
-			input_report_key(dev, BTN_TRIGGER_HAPPY5, data[18] & BIT(0));
-			input_report_key(dev, BTN_TRIGGER_HAPPY6, data[18] & BIT(1));
-			input_report_key(dev, BTN_TRIGGER_HAPPY7, data[18] & BIT(2));
-			input_report_key(dev, BTN_TRIGGER_HAPPY8, data[18] & BIT(3));
+			input_report_key(dev, BTN_GRIPR, data[18] & BIT(0));
+			input_report_key(dev, BTN_GRIPR2, data[18] & BIT(1));
+			input_report_key(dev, BTN_GRIPL, data[18] & BIT(2));
+			input_report_key(dev, BTN_GRIPL2, data[18] & BIT(3));
 
 			do_sync = true;
 		}
@@ -1173,10 +1173,10 @@ static void xpadone_process_packet(struct usb_xpad *xpad, u16 cmd, unsigned char
 					data[32] = 0;
 
 				/* OG Elite Series Controller paddle bits */
-				input_report_key(dev, BTN_TRIGGER_HAPPY5, data[32] & BIT(1));
-				input_report_key(dev, BTN_TRIGGER_HAPPY6, data[32] & BIT(3));
-				input_report_key(dev, BTN_TRIGGER_HAPPY7, data[32] & BIT(0));
-				input_report_key(dev, BTN_TRIGGER_HAPPY8, data[32] & BIT(2));
+				input_report_key(dev, BTN_GRIPR, data[32] & BIT(1));
+				input_report_key(dev, BTN_GRIPR2, data[32] & BIT(3));
+				input_report_key(dev, BTN_GRIPL, data[32] & BIT(0));
+				input_report_key(dev, BTN_GRIPL2, data[32] & BIT(2));
 			} else if (xpad->packet_type == PKT_XBE2_FW_OLD) {
 				/* Mute paddles if controller has a custom mapping applied.
 				 * Checked by comparing the current mapping
@@ -1186,10 +1186,10 @@ static void xpadone_process_packet(struct usb_xpad *xpad, u16 cmd, unsigned char
 					data[18] = 0;
 
 				/* Elite Series 2 4.x firmware paddle bits */
-				input_report_key(dev, BTN_TRIGGER_HAPPY5, data[18] & BIT(0));
-				input_report_key(dev, BTN_TRIGGER_HAPPY6, data[18] & BIT(1));
-				input_report_key(dev, BTN_TRIGGER_HAPPY7, data[18] & BIT(2));
-				input_report_key(dev, BTN_TRIGGER_HAPPY8, data[18] & BIT(3));
+				input_report_key(dev, BTN_GRIPR, data[18] & BIT(0));
+				input_report_key(dev, BTN_GRIPR2, data[18] & BIT(1));
+				input_report_key(dev, BTN_GRIPL, data[18] & BIT(2));
+				input_report_key(dev, BTN_GRIPL2, data[18] & BIT(3));
 			} else if (xpad->packet_type == PKT_XBE2_FW_5_EARLY) {
 				/* Mute paddles if controller has a custom mapping applied.
 				 * Checked by comparing the current mapping
@@ -1201,10 +1201,10 @@ static void xpadone_process_packet(struct usb_xpad *xpad, u16 cmd, unsigned char
 				/* Elite Series 2 5.x firmware paddle bits
 				 * (before the packet was split)
 				 */
-				input_report_key(dev, BTN_TRIGGER_HAPPY5, data[22] & BIT(0));
-				input_report_key(dev, BTN_TRIGGER_HAPPY6, data[22] & BIT(1));
-				input_report_key(dev, BTN_TRIGGER_HAPPY7, data[22] & BIT(2));
-				input_report_key(dev, BTN_TRIGGER_HAPPY8, data[22] & BIT(3));
+				input_report_key(dev, BTN_GRIPR, data[22] & BIT(0));
+				input_report_key(dev, BTN_GRIPR2, data[22] & BIT(1));
+				input_report_key(dev, BTN_GRIPL, data[22] & BIT(2));
+				input_report_key(dev, BTN_GRIPL2, data[22] & BIT(3));
 			}
 		}
 
-- 
2.49.0


