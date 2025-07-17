Return-Path: <linux-input+bounces-13575-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C2C11B0813C
	for <lists+linux-input@lfdr.de>; Thu, 17 Jul 2025 02:03:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 15D39582440
	for <lists+linux-input@lfdr.de>; Thu, 17 Jul 2025 00:03:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC704BE46;
	Thu, 17 Jul 2025 00:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=endrift.com header.i=@endrift.com header.b="ZAq2ngqW"
X-Original-To: linux-input@vger.kernel.org
Received: from endrift.com (endrift.com [173.255.198.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45E1DDDAB
	for <linux-input@vger.kernel.org>; Thu, 17 Jul 2025 00:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=173.255.198.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752710573; cv=none; b=MS5XY3BSyRfF4BD9matmvKFoGrQ4Z8IbSKhT/qRjgy3GasxnUVW9aL3WxZDBl8qB7DSL5b54XAjymx1aHoLOtrWNqlpOb/qqBENIKeoWcVolEASBhVOPpcQU6dzOjCjvNJeS1Ste5CG3Qz7cXLHFzMu14o0/ugLLCDDvp5dKk38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752710573; c=relaxed/simple;
	bh=HKPWSe6EVFvlUspTi16iileb+ZD0MGpzl4QTNOyenQg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KgvFc0dyJVUNZkQXL2mRy7PNOio0UyemIFuAV1gtdoiew1Ba7huhcTsdhiS1xCgtxHa/LvMw+W6Np0PSgJmtpzniNOKlofg0NYYpcHGpAJ+iizv27JfjEjqKPVpq+aPwSCjXWtUv5ZGXEizQaR6eWx1eJBXfB2K+k7FMeUZEBzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=endrift.com; spf=pass smtp.mailfrom=endrift.com; dkim=pass (2048-bit key) header.d=endrift.com header.i=@endrift.com header.b=ZAq2ngqW; arc=none smtp.client-ip=173.255.198.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=endrift.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=endrift.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=endrift.com; s=2020;
	t=1752710571; bh=HKPWSe6EVFvlUspTi16iileb+ZD0MGpzl4QTNOyenQg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZAq2ngqW860cHan9H/+p6oFN5lY9qPZC3za3GQV1adEfIa7Ivb3MWHweZt3BmTMCi
	 jkIzmBm1j9KfaKr7bYkocA3fQVhm7wJCc7WaqSW7NCeoKKF4ICNi3jeNvqe7dvcg6G
	 +ACfaLCbulQ6TXH5Txqr4YdwatNLg3LIQMfan97WSN63cOy25tM5xLHkJjTBq9E8RU
	 D5I8C9J2STMtgePkKUghf159xUaf0D9RQKNfISuJFfwvYrleDPhpWMNPVBLtoGpU6q
	 us9vtEqBxvIc4s2nxSFkXRctXwKYYS9Skv0+yQ95cMOtzaIy+0JEbcbzRvUPKnvhcj
	 EyB7qmX0I43CQ==
Received: from microtis.vulpes.eutheria.net (71-212-74-234.tukw.qwest.net [71.212.74.234])
	by endrift.com (Postfix) with ESMTPSA id 5C10513208A;
	Wed, 16 Jul 2025 17:02:51 -0700 (PDT)
From: Vicki Pfau <vi@endrift.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	linux-input@vger.kernel.org
Cc: Vicki Pfau <vi@endrift.com>
Subject: [PATCH v2 2/3] Input - xpad: Use new BTN_GRIP* buttons
Date: Wed, 16 Jul 2025 17:01:39 -0700
Message-ID: <20250717000143.1902875-3-vi@endrift.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250717000143.1902875-1-vi@endrift.com>
References: <20250717000143.1902875-1-vi@endrift.com>
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
index 5d9b7007a730..e37870fe4fe6 100644
--- a/drivers/input/joystick/xpad.c
+++ b/drivers/input/joystick/xpad.c
@@ -479,8 +479,8 @@ static const signed short xpad_abs_triggers[] = {
 
 /* used when the controller has extra paddle buttons */
 static const signed short xpad_btn_paddles[] = {
-	BTN_TRIGGER_HAPPY5, BTN_TRIGGER_HAPPY6, /* paddle upper right, lower right */
-	BTN_TRIGGER_HAPPY7, BTN_TRIGGER_HAPPY8, /* paddle upper left, lower left */
+	BTN_GRIPR, BTN_GRIPR2, /* paddle upper right, lower right */
+	BTN_GRIPL, BTN_GRIPL2, /* paddle upper left, lower left */
 	-1						/* terminating entry */
 };
 
@@ -1075,10 +1075,10 @@ static void xpadone_process_packet(struct usb_xpad *xpad, u16 cmd, unsigned char
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
@@ -1175,10 +1175,10 @@ static void xpadone_process_packet(struct usb_xpad *xpad, u16 cmd, unsigned char
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
@@ -1188,10 +1188,10 @@ static void xpadone_process_packet(struct usb_xpad *xpad, u16 cmd, unsigned char
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
@@ -1203,10 +1203,10 @@ static void xpadone_process_packet(struct usb_xpad *xpad, u16 cmd, unsigned char
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


