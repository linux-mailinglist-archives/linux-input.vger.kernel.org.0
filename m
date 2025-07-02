Return-Path: <linux-input+bounces-13323-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B06BAAF0967
	for <lists+linux-input@lfdr.de>; Wed,  2 Jul 2025 05:48:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 18A1E4A4235
	for <lists+linux-input@lfdr.de>; Wed,  2 Jul 2025 03:48:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB49F53A7;
	Wed,  2 Jul 2025 03:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=endrift.com header.i=@endrift.com header.b="UrpXYnc8"
X-Original-To: linux-input@vger.kernel.org
Received: from endrift.com (endrift.com [173.255.198.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4BEA211C
	for <linux-input@vger.kernel.org>; Wed,  2 Jul 2025 03:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=173.255.198.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751428124; cv=none; b=sCgDt7Jm4RqFP0kBBZSZ8NqzO6ZaoVNC9D6OO9trO9//QoYK4YGJkqvWWYSQyZ18/CdZnhnoG17ntAfhj/s0zqz7CM4OjLY2rrXVzjqFFjZwhDDx9q9BnufRSzKCrlkMIRlOaTC3MlJpmEH677EY1xXbyrsY05wtZE3tnOUlIRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751428124; c=relaxed/simple;
	bh=OoG+1Rl+1BgtsaGUe+B/+WxEULMm/jV9zk78X8wsaQY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ULnK73aPi2+p6/1G46Uhp89O+8q9b/Oi8z/Jj4dcqBarLpLC3YKashpCqO9fqDopMs4KADVIvVYtRdRSS08ncO6G1XAObFdAFGXhtu6RBvyXhoA2hd9TTiPqgfYgpUyi/aJwVDO4gFv6GuYezv/ArewCFnlg13HVttU5h7KNQRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=endrift.com; spf=pass smtp.mailfrom=endrift.com; dkim=pass (2048-bit key) header.d=endrift.com header.i=@endrift.com header.b=UrpXYnc8; arc=none smtp.client-ip=173.255.198.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=endrift.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=endrift.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=endrift.com; s=2020;
	t=1751428122; bh=OoG+1Rl+1BgtsaGUe+B/+WxEULMm/jV9zk78X8wsaQY=;
	h=From:To:Cc:Subject:Date:From;
	b=UrpXYnc8UGyEp07sIi+4586VE0cSjwfsXgb3KX32nhM/+bH9I2Vl6/zGjhfsFGoNO
	 Ho0TfRo+YH2RxzhGkSON1WM/RR+oM++x9oZApzufnrsKIGk9QSdR/GMJYFfxYt2/RM
	 VC2XcaMnLADCspDTpi3CoalYRJVjOZjudEJcHyzr1BNNDXr3oCy2EOqaK/GGNv2aZz
	 GilH3GduFTjSEopNXiqu4npgaFf5+sEHBOxkpwSXrZM8qlw/C42H7usihigLQBmILR
	 gcLixUB/sSp2UsTj8guqdzY7ESrABLG8M7M723mhMYsVmY+zpOuNKbxZgN2p/jl1PZ
	 IMlFW4ywvMsjg==
Received: from microtis.vulpes.eutheria.net (71-212-74-234.tukw.qwest.net [71.212.74.234])
	by endrift.com (Postfix) with ESMTPSA id D6786A01E;
	Tue,  1 Jul 2025 20:48:41 -0700 (PDT)
From: Vicki Pfau <vi@endrift.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org
Cc: Vicki Pfau <vi@endrift.com>
Subject: [PATCH] Input: xpad - Change buttons the D-Pad gets mapped as to BTN_DPAD_*
Date: Tue,  1 Jul 2025 20:47:40 -0700
Message-ID: <20250702034740.124817-1-vi@endrift.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since dance pads can have both up/down or left/right pressed at the same time,
by design, they are not suitable for mapping the buttons to axes. Historically,
this driver mapped the D-pad to BTN_TRIGGER_HAPPY1-4 in these cases, and before
that as mouse buttons. However, BTN_DPAD_* exists for this and makes far more
sense than the arbitrary mapping it was before.

Signed-off-by: Vicki Pfau <vi@endrift.com>
---
 drivers/input/joystick/xpad.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
index c066a4da7c14..d02ddfbc5216 100644
--- a/drivers/input/joystick/xpad.c
+++ b/drivers/input/joystick/xpad.c
@@ -441,8 +441,8 @@ static const signed short xpad_btn[] = {
 
 /* used when dpad is mapped to buttons */
 static const signed short xpad_btn_pad[] = {
-	BTN_TRIGGER_HAPPY1, BTN_TRIGGER_HAPPY2,		/* d-pad left, right */
-	BTN_TRIGGER_HAPPY3, BTN_TRIGGER_HAPPY4,		/* d-pad up, down */
+	BTN_DPAD_LEFT, BTN_DPAD_RIGHT,	/* d-pad left, right */
+	BTN_DPAD_UP, BTN_DPAD_DOWN,	/* d-pad up, down */
 	-1				/* terminating entry */
 };
 
@@ -838,10 +838,10 @@ static void xpad_process_packet(struct usb_xpad *xpad, u16 cmd, unsigned char *d
 	/* digital pad */
 	if (xpad->mapping & MAP_DPAD_TO_BUTTONS) {
 		/* dpad as buttons (left, right, up, down) */
-		input_report_key(dev, BTN_TRIGGER_HAPPY1, data[2] & BIT(2));
-		input_report_key(dev, BTN_TRIGGER_HAPPY2, data[2] & BIT(3));
-		input_report_key(dev, BTN_TRIGGER_HAPPY3, data[2] & BIT(0));
-		input_report_key(dev, BTN_TRIGGER_HAPPY4, data[2] & BIT(1));
+		input_report_key(dev, BTN_DPAD_LEFT, data[2] & BIT(2));
+		input_report_key(dev, BTN_DPAD_RIGHT, data[2] & BIT(3));
+		input_report_key(dev, BTN_DPAD_UP, data[2] & BIT(0));
+		input_report_key(dev, BTN_DPAD_DOWN, data[2] & BIT(1));
 	} else {
 		input_report_abs(dev, ABS_HAT0X,
 				 !!(data[2] & 0x08) - !!(data[2] & 0x04));
@@ -889,10 +889,10 @@ static void xpad360_process_packet(struct usb_xpad *xpad, struct input_dev *dev,
 	/* digital pad */
 	if (xpad->mapping & MAP_DPAD_TO_BUTTONS) {
 		/* dpad as buttons (left, right, up, down) */
-		input_report_key(dev, BTN_TRIGGER_HAPPY1, data[2] & BIT(2));
-		input_report_key(dev, BTN_TRIGGER_HAPPY2, data[2] & BIT(3));
-		input_report_key(dev, BTN_TRIGGER_HAPPY3, data[2] & BIT(0));
-		input_report_key(dev, BTN_TRIGGER_HAPPY4, data[2] & BIT(1));
+		input_report_key(dev, BTN_DPAD_LEFT, data[2] & BIT(2));
+		input_report_key(dev, BTN_DPAD_RIGHT, data[2] & BIT(3));
+		input_report_key(dev, BTN_DPAD_UP, data[2] & BIT(0));
+		input_report_key(dev, BTN_DPAD_DOWN, data[2] & BIT(1));
 	}
 
 	/*
@@ -1111,10 +1111,10 @@ static void xpadone_process_packet(struct usb_xpad *xpad, u16 cmd, unsigned char
 		/* digital pad */
 		if (xpad->mapping & MAP_DPAD_TO_BUTTONS) {
 			/* dpad as buttons (left, right, up, down) */
-			input_report_key(dev, BTN_TRIGGER_HAPPY1, data[5] & BIT(2));
-			input_report_key(dev, BTN_TRIGGER_HAPPY2, data[5] & BIT(3));
-			input_report_key(dev, BTN_TRIGGER_HAPPY3, data[5] & BIT(0));
-			input_report_key(dev, BTN_TRIGGER_HAPPY4, data[5] & BIT(1));
+			input_report_key(dev, BTN_DPAD_LEFT, data[5] & BIT(2));
+			input_report_key(dev, BTN_DPAD_RIGHT, data[5] & BIT(3));
+			input_report_key(dev, BTN_DPAD_UP, data[5] & BIT(0));
+			input_report_key(dev, BTN_DPAD_DOWN, data[5] & BIT(1));
 		} else {
 			input_report_abs(dev, ABS_HAT0X,
 					!!(data[5] & 0x08) - !!(data[5] & 0x04));
-- 
2.49.0


