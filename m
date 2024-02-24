Return-Path: <linux-input+bounces-2079-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D26D8624D3
	for <lists+linux-input@lfdr.de>; Sat, 24 Feb 2024 13:09:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 05D451C212E2
	for <lists+linux-input@lfdr.de>; Sat, 24 Feb 2024 12:08:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12AD73A8E4;
	Sat, 24 Feb 2024 12:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=orange.fr header.i=@orange.fr header.b="REp8uHu2"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-24.smtpout.orange.fr [80.12.242.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B506F364BD
	for <linux-input@vger.kernel.org>; Sat, 24 Feb 2024 12:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708776534; cv=none; b=syZ938McGH6Rc0RVa2UTs/kaNC7uU4JyZBEo3Bvo2sEnQ37id9lROyEZY1R1GBB40y9sWqi6p/n+7rIR2T7t4gRIG8KobsAMaXB7MgVUrPB+ukY8BatMLMS6JiVNAtSUMgZ5nyekI5OtoXSdr3oG22e3R9KF8sPDa5tAe/o6k5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708776534; c=relaxed/simple;
	bh=UZlUKzJDIE3Ejg/2uPUT90rGzS7fsqyUAE1JCjenB8I=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=VUBV+MXZ/EiI7zLOSWR5Wzwz4XEIcmrkw7jfNcOUzG54gWc+EvBaWTzX8yrNo2dK7YZoa4Kpgnua4EJ6jP9bVj3nFRjcMGkDKlBwf92dwjfy5llkFnV/ZwKbCDwKg73AiwJHOkmUaPZOKEfwra4pUj4Yn3TMXfM1dAodKbJsY5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=orange.fr; spf=pass smtp.mailfrom=orange.fr; dkim=pass (2048-bit key) header.d=orange.fr header.i=@orange.fr header.b=REp8uHu2; arc=none smtp.client-ip=80.12.242.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=orange.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=orange.fr
Received: from jules-desktop.dynamic.ziggo.nl ([84.105.71.69])
	by smtp.orange.fr with ESMTPA
	id dqpVrjA78SI7xdqpfr56W6; Sat, 24 Feb 2024 13:08:44 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=orange.fr;
	s=t20230301; t=1708776524;
	bh=3dYE06cGrljHtTRYwZzkQUBSeOHR9BhQZqpePGYgV5k=;
	h=From:To:Cc:Subject:Date;
	b=REp8uHu2ui4eguwwrHv9egWBjrvKQ/OPuzquVqlNFsVZDCAsFKp5KXOl7HyAzyKG9
	 lDRufFGzsnv4/8tOtEOC5v7s1Bvzk2jr0xEjMj2WXGwyM//U40Ar91dwBQg2qfdwss
	 3YbBJB3bX3DoYH0hqD7tJRSqlBbsZ+joHR1itXb2AU9ELh7pcODybDZCnlZm43hBc0
	 sOePrK1IDPbkzblqCkrPjQ+umNNm7mRDdmZ/jDLpFRHv6OymbEezKVGV+bjDji87Q2
	 ocPa5djoNAM/+c+lwOiyRbjhTDF81Y3DwZm6Vywh96Ed9sL0ui7o4T83DHZeFwMu3J
	 xWNyjttN8n+JQ==
X-ME-Helo: jules-desktop.dynamic.ziggo.nl
X-ME-Auth: anVsZXMubm9pcmFudEBvcmFuZ2UuZnI=
X-ME-Date: Sat, 24 Feb 2024 13:08:44 +0100
X-ME-IP: 84.105.71.69
From: Jules Noirant <jules.noirant@orange.fr>
To: 
Cc: jikos@kernel.org,
	Jules Noirant <jules.noirant@orange.fr>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	linux-usb@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] HID: usbhid: hid-pidff: fix initialisation for devices that pre-play effects
Date: Sat, 24 Feb 2024 13:00:56 +0100
Message-Id: <20240224120056.21251-1-jules.noirant@orange.fr>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some PID compliant devices play effects outside of the usb drivers when you
power them, for example an autocenter spring. These effects are thus
re-triggered when you reset the device through the driver init sequence,
preventing other effects to be played in some cases.

This fix makes sure all the effects currently played are stopped after
resetting the device. More specifically, it brings compatibility to the
Brunner CLS-P joystick and potentially more of their products.

Signed-off-by: Jules Noirant <jules.noirant@orange.fr>
---
 drivers/hid/usbhid/hid-pidff.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/usbhid/hid-pidff.c b/drivers/hid/usbhid/hid-pidff.c
index 3b4ee21cd..aade18f9e 100644
--- a/drivers/hid/usbhid/hid-pidff.c
+++ b/drivers/hid/usbhid/hid-pidff.c
@@ -109,8 +109,9 @@ static const u8 pidff_pool[] = { 0x80, 0x83, 0xa9 };
 /* Special field key tables used to put special field keys into arrays */
 
 #define PID_ENABLE_ACTUATORS	0
-#define PID_RESET		1
-static const u8 pidff_device_control[] = { 0x97, 0x9a };
+#define PID_STOP_ALL_EFFECTS	1
+#define PID_RESET		2
+static const u8 pidff_device_control[] = { 0x97, 0x99, 0x9a };
 
 #define PID_CONSTANT	0
 #define PID_RAMP	1
@@ -1157,6 +1158,10 @@ static void pidff_reset(struct pidff_device *pidff)
 	hid_hw_request(hid, pidff->reports[PID_DEVICE_CONTROL], HID_REQ_SET_REPORT);
 	hid_hw_wait(hid);
 
+	pidff->device_control->value[0] = pidff->control_id[PID_STOP_ALL_EFFECTS];
+	hid_hw_request(hid, pidff->reports[PID_DEVICE_CONTROL], HID_REQ_SET_REPORT);
+	hid_hw_wait(hid);
+
 	pidff->device_control->value[0] =
 		pidff->control_id[PID_ENABLE_ACTUATORS];
 	hid_hw_request(hid, pidff->reports[PID_DEVICE_CONTROL], HID_REQ_SET_REPORT);
-- 
2.40.1


