Return-Path: <linux-input+bounces-1104-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D8A282455E
	for <lists+linux-input@lfdr.de>; Thu,  4 Jan 2024 16:50:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5E0FE1C21DDF
	for <lists+linux-input@lfdr.de>; Thu,  4 Jan 2024 15:50:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEAF8249EC;
	Thu,  4 Jan 2024 15:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bernhard-seibold.de header.i=@bernhard-seibold.de header.b="tJTmcpGb"
X-Original-To: linux-input@vger.kernel.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A33A4249E0
	for <linux-input@vger.kernel.org>; Thu,  4 Jan 2024 15:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bernhard-seibold.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bernhard-seibold.de
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4T5WHc3qxVz9scN;
	Thu,  4 Jan 2024 16:49:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bernhard-seibold.de;
	s=MBO0001; t=1704383388;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pejGJXiuFY1IZfLGoULiEKdL6L6leJG1TWmRmEqvmHc=;
	b=tJTmcpGbHbcxqQjq+K8nO3FBCYyDlbO4pt2VEm/qSE6jmpFQD4qw5pERA1E7AAaWy9oih4
	QsXyXg9gxQP347LMUYcEpe93cMA4c9KPkE5p6SnPMqxz88HisA+6Prkcj1/dGhJIB3MwFp
	iDbcZpy/AKOJToMMOv3LygL0IiYHhwCjhUaSzzoRwJhuMG+1IoB2VhUfVGLBDjTMkpM8Sr
	2CgGz36QGYzPvaEM6JxcJm/D3LZ+o2w3odgObyvTUPFoYaflfKbC2z5i93TCjsLfFBdLR0
	X7O5sxXlSAhNo0/nWR38GXSMVLoLQ03PSZ4zlmuI4Z8Ph9aoJdcIYgMZ2Hvb8A==
From: Bernhard Seibold <mail@bernhard-seibold.de>
To: linux-input@vger.kernel.org
Cc: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Jamie Lentin <jm@lentin.co.uk>,
	Bernhard Seibold <mail@bernhard-seibold.de>
Subject: [PATCH 3/3] HID: lenovo: Remove LEDs from tpkbd
Date: Thu,  4 Jan 2024 16:49:41 +0100
Message-ID: <20240104154941.6919-3-mail@bernhard-seibold.de>
In-Reply-To: <20240104154941.6919-1-mail@bernhard-seibold.de>
References: <20240104154941.6919-1-mail@bernhard-seibold.de>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4T5WHc3qxVz9scN

Since both LEDs are now supported by the input-leds module, the custom
LEDs set via a proprietary method are no longer required. In fact they
are duplicates that might interfere with each other.

Signed-off-by: Bernhard Seibold <mail@bernhard-seibold.de>
---
 drivers/hid/hid-lenovo.c | 21 ---------------------
 1 file changed, 21 deletions(-)

diff --git a/drivers/hid/hid-lenovo.c b/drivers/hid/hid-lenovo.c
index 149a3c74346b..e3eae18fd4ab 100644
--- a/drivers/hid/hid-lenovo.c
+++ b/drivers/hid/hid-lenovo.c
@@ -1004,17 +1004,6 @@ static const struct attribute_group lenovo_attr_group_tpkbd = {
 	.attrs = lenovo_attributes_tpkbd,
 };
 
-static void lenovo_led_set_tpkbd(struct hid_device *hdev)
-{
-	struct lenovo_drvdata *data_pointer = hid_get_drvdata(hdev);
-	struct hid_report *report;
-
-	report = hdev->report_enum[HID_OUTPUT_REPORT].report_id_hash[3];
-	report->field[0]->value[0] = (data_pointer->led_state >> 0) & 1;
-	report->field[0]->value[1] = (data_pointer->led_state >> 1) & 1;
-	hid_hw_request(hdev, report, HID_REQ_SET_REPORT);
-}
-
 static int lenovo_led_brightness_set(struct led_classdev *led_cdev,
 			enum led_brightness value)
 {
@@ -1034,9 +1023,6 @@ static int lenovo_led_brightness_set(struct led_classdev *led_cdev,
 		data_pointer->led_state |= 1 << led_nr;
 
 	switch (hdev->product) {
-	case USB_DEVICE_ID_LENOVO_TPKBD:
-		lenovo_led_set_tpkbd(hdev);
-		break;
 	case USB_DEVICE_ID_LENOVO_TP10UBKBD:
 	case USB_DEVICE_ID_LENOVO_X1_TAB:
 		ret = lenovo_led_set_tp10ubkbd(hdev, tp10ubkbd_led[led_nr], value);
@@ -1128,10 +1114,6 @@ static int lenovo_probe_tpkbd(struct hid_device *hdev)
 
 	hid_set_drvdata(hdev, data_pointer);
 
-	ret = lenovo_register_leds(hdev);
-	if (ret)
-		goto err;
-
 	lenovo_features_set_tpkbd(hdev);
 
 	return 0;
@@ -1315,9 +1297,6 @@ static void lenovo_remove_tpkbd(struct hid_device *hdev)
 
 	sysfs_remove_group(&hdev->dev.kobj,
 			&lenovo_attr_group_tpkbd);
-
-	led_classdev_unregister(&data_pointer->led_micmute);
-	led_classdev_unregister(&data_pointer->led_mute);
 }
 
 static void lenovo_remove_cptkbd(struct hid_device *hdev)
-- 
2.43.0


