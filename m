Return-Path: <linux-input+bounces-2431-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 172A78804F4
	for <lists+linux-input@lfdr.de>; Tue, 19 Mar 2024 19:36:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 490E91C2237C
	for <lists+linux-input@lfdr.de>; Tue, 19 Mar 2024 18:36:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 393C639851;
	Tue, 19 Mar 2024 18:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=orange.fr header.i=@orange.fr header.b="hiaq+oF0"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-20.smtpout.orange.fr [80.12.242.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F9BC39847
	for <linux-input@vger.kernel.org>; Tue, 19 Mar 2024 18:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710873405; cv=none; b=jgOrin8SOIMisNtOAjuS2Rz51fvqiciaV74dUiYSzxdl8rtoe9bTM/g9O+wi3saSN5NzmA6iq3vfQW5CYQOq1mfnHpGwdw8aqC5nOax4DO86iAfv0Wba1ovHiEoeN1hdmQWzyn5GmtTVza/WydNkT6SqRTHvxZLdnAUPf3Y6OUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710873405; c=relaxed/simple;
	bh=7GcSqlNA9db0TU+PtWJBvIPc33uOUli4tM8yo1e7qb8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=q5MLVtIiDzL5zCUxjiq2JsCtjaBFUHKB3U6i1mw+lucdO05b/nFLaIgAkM7M9gyutUcCwMHZrfoq6DQC0lZUUPticalfzmvIzAvkhQrxx+a97/tzSKUOJatdvCsasL1+bPEV9q1Vm3AJWUzCmUdqZdL6J8U7TCvyO+hV+FZGR3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=orange.fr; spf=pass smtp.mailfrom=orange.fr; dkim=pass (2048-bit key) header.d=orange.fr header.i=@orange.fr header.b=hiaq+oF0; arc=none smtp.client-ip=80.12.242.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=orange.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=orange.fr
Received: from jules-desktop.dynamic.ziggo.nl ([84.105.71.69])
	by smtp.orange.fr with ESMTPA
	id meK0rHRJYX7HUmeKArj0ew; Tue, 19 Mar 2024 19:36:35 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=orange.fr;
	s=t20230301; t=1710873395;
	bh=qXNQkp6Qc32Utj5LOnG0LI21fIJd6XSTE2Y5kLhNc5E=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=hiaq+oF0Tq7obWAaO4gvkQsq/4OWbegQ0vbWg3tzqE/1pHRkJBG3X0ZgXcyhFJDhh
	 MiZL45e+QcVrotSA0VCnzoMunOqhQevFLwRw1VB8t6KTRNxdzYkcOE1CS7XbZKIQNi
	 6UcTj0VBuRqtfLlZjza28E7lHWsebxnIwhUPsAS/839JbeEzpjkyi0/XuBF+uFHATe
	 Al0nvKRAFA/X2I9f3AdeWbIdqkyA+K4VyXgoZ2Q0k4+GZhApyZ7xrGe5vrweRsMGUD
	 /wzPv3Rev85vn0kQxliK2B+k2aQZWFzV3KpC3z+UkngY7VX5GmxHsZOnOTzTHV2fEa
	 0Mrh0SNxeta6w==
X-ME-Helo: jules-desktop.dynamic.ziggo.nl
X-ME-Auth: anVsZXMubm9pcmFudEBvcmFuZ2UuZnI=
X-ME-Date: Tue, 19 Mar 2024 19:36:35 +0100
X-ME-IP: 84.105.71.69
From: Jules Noirant <jules.noirant@orange.fr>
To: jkosina@suse.com
Cc: bentiss@kernel.org,
	jkosina@suse.cz,
	Jules Noirant <jules.noirant@orange.fr>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	linux-usb@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] HID: hid-pidff: stop all effects before enabling actuators
Date: Tue, 19 Mar 2024 19:24:43 +0100
Message-Id: <20240319182443.18161-1-jules.noirant@orange.fr>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some PID compliant devices automatically play effects after boot (i.e.
autocenter spring) that prevent the rendering of other effects since
it is done outside of the kernel driver.

This makes sure all the effects currently played are stopped after
resetting the device.
It brings compatibility to the Brunner CLS-P joystick.

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


