Return-Path: <linux-input+bounces-7749-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C3A599B3A20
	for <lists+linux-input@lfdr.de>; Mon, 28 Oct 2024 20:10:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 80A402837F2
	for <lists+linux-input@lfdr.de>; Mon, 28 Oct 2024 19:10:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE1BE1DFD9E;
	Mon, 28 Oct 2024 19:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ytu8K62a"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88E341DFE03;
	Mon, 28 Oct 2024 19:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730142477; cv=none; b=Qu0cvJyiTu8jD9x+2P/6wsIjYIJf1UCSGg0zQG8E5r0+H+ucevdewOq/Pr0YsVDlXjeh+33I2zEgrSiCPSwiOKkcP+nKnUurOShLF7qvFOxXXlX7DntiPDVYEU2f8/Fa9j+g/kxOsoKwz2fAGOYRzmFhB261/iQz4apEKftg4f4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730142477; c=relaxed/simple;
	bh=4mrE76SH2ADhhWWJMiFkSEwGaF/rQ4QWelV/nR8cWGk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lExX0Kir8w1+32aWJ09DbylZRG4Z3dAoU/+6BgojATr84hmvoDoZjwlb50ypCDRduQFuRxO3k2xrURuVS1r3jOhsJerhJ21Yh1BB4qrBLqEgDZYlpvtMcXxHbtzc2HTVRu4AWrlbyb1Ma40tATKNMuiClFZFxJiMN04qw2U+Fho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ytu8K62a; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2e2e23f2931so3628047a91.0;
        Mon, 28 Oct 2024 12:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730142475; x=1730747275; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RfqKflibAOK4FzgsJVQND/t/yyaMuTbNCQ7z0yk1g8s=;
        b=Ytu8K62aNZJttACL86cP0df1K918Rl07VGA/V8wf1FqD46oMeOA5L3F1AnH/jv5zQS
         PEAmeq5LwqmqgisSsidHqfLQzuuE2Vces1x3Sd38JXFoK8mPlj3S+gpdAOa6kIrl4HeW
         VgzcOb8f140M+ugyOGkj0VoLbOlHvgTyy7a8EgMi2XWBlcH64fAlvtfOeRmk16vZAETh
         iV1Hi9vQK7rOSeY7PZsTX+19jqF3WulCUBdsMp7E8H2mUeengmixCf0NYcwLSZWduOcp
         uv2H8TqiRw65S66+Z+82rH6SXcNhM31C5q0aKSZpmBJiuVak+pFyuO1y7YjIAjKS2Bfm
         0TmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730142475; x=1730747275;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RfqKflibAOK4FzgsJVQND/t/yyaMuTbNCQ7z0yk1g8s=;
        b=UQO+Don/xYDbqO/awpDCMoKhHmUi8lujkL4wVzR3ZSOXFk23vI/W42icDVwBwgiI7e
         GK1zMKnCZKyqpDCJ9iEUUIyxP17AkfJqlS1hHoiWIzKBSlkI4FGitmadfyVzc7rcDE1r
         dCI9REglt/aEPriDPZyeft49ZKH67eMRKPE7YMXT8wEfT4SMgSxeA3MIkay/0XWtyH+K
         PVuBcgR2VLq63kn/RaiRX2G4lCd4+07B/+JrNQ10PR2fkIqoF1/SgTdnwS6+kJVdE67W
         VmNtfwnbl4Cs3TahslOWcvny8kutMBAv6UkLq1WyNHzhTO8Xxkdx19lP2YqBTYixMg+b
         K0nA==
X-Forwarded-Encrypted: i=1; AJvYcCWruazmmE1H5DqbKAPgXzGutYlBj8qkwlonMtaUc4fHvoGzeMrQpBk1cshrnK0fG8enrbPCwsmkH65CMEY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyptk1OwDx4GN8M1WGGoW3Uj09k4/80MG7wBqJfPE/gsnj145or
	jol0V/vMLXnzOQBZGVtZ+HbeSmwxfxIom/h5+7v+HXJdfAizrI1O
X-Google-Smtp-Source: AGHT+IEXrh+v2vKqurlhGEFbipOq2vHe/woTzzE/OY5V4kUw87A/sLqLvZMkJGIeV3vV/GYZktTEtQ==
X-Received: by 2002:a17:90a:600f:b0:2e2:e159:8f7b with SMTP id 98e67ed59e1d1-2e8f1049fecmr10347611a91.3.1730142473204;
        Mon, 28 Oct 2024 12:07:53 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:e9ba:17cc:78fe:499e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e7867fe396sm9015065a91.51.2024.10.28.12.07.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 12:07:52 -0700 (PDT)
Date: Mon, 28 Oct 2024 12:07:50 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] HID: multitouch: make mt_set_mode() less cryptic
Message-ID: <Zx_hBvg5Qa3KU3ta@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

mt_set_mode() accepts 2 boolean switches indicating whether the device
(if it follows Windows Precision Touchpad specification) should report
hardware buttons and/or surface contacts. For a casual reader it is
completely not clear, as they look at the call site, which exact mode
is being requested.

Define report_mode enum and change mt_set_mode() to accept is as
an argument instead. This allows to write:

	mt_set_modes(hdev, HID_LATENCY_NORMAL, TOUCHPAD_REPORT_ALL);

or

	mt_set_modes(hdev, HID_LATENCY_HIGH, TOUCHPAD_REPORT_BUTTONS);

which makes intent much more clear.

Reviewed-by: Benjamin Tissoires <bentiss@kernel.org>
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---

v2: addressed Benjamin's comments, added his reviewed-by.

 drivers/hid/hid-multitouch.c | 30 ++++++++++++++++++------------
 1 file changed, 18 insertions(+), 12 deletions(-)

diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
index 99812c0f830b..53fb92453e88 100644
--- a/drivers/hid/hid-multitouch.c
+++ b/drivers/hid/hid-multitouch.c
@@ -31,6 +31,7 @@
  * [1] https://gitlab.freedesktop.org/libevdev/hid-tools
  */
 
+#include <linux/bits.h>
 #include <linux/device.h>
 #include <linux/hid.h>
 #include <linux/module.h>
@@ -83,6 +84,13 @@ enum latency_mode {
 	HID_LATENCY_HIGH = 1,
 };
 
+enum report_mode {
+	TOUCHPAD_REPORT_NONE = 0,
+	TOUCHPAD_REPORT_BUTTONS = BIT(0),
+	TOUCHPAD_REPORT_CONTACTS = BIT(1),
+	TOUCHPAD_REPORT_ALL = TOUCHPAD_REPORT_BUTTONS | TOUCHPAD_REPORT_CONTACTS,
+};
+
 #define MT_IO_FLAGS_RUNNING		0
 #define MT_IO_FLAGS_ACTIVE_SLOTS	1
 #define MT_IO_FLAGS_PENDING_SLOTS	2
@@ -1486,8 +1494,7 @@ static bool mt_need_to_apply_feature(struct hid_device *hdev,
 				     struct hid_field *field,
 				     struct hid_usage *usage,
 				     enum latency_mode latency,
-				     bool surface_switch,
-				     bool button_switch,
+				     enum report_mode report_mode,
 				     bool *inputmode_found)
 {
 	struct mt_device *td = hid_get_drvdata(hdev);
@@ -1542,11 +1549,11 @@ static bool mt_need_to_apply_feature(struct hid_device *hdev,
 		return true;
 
 	case HID_DG_SURFACESWITCH:
-		field->value[index] = surface_switch;
+		field->value[index] = !!(report_mode & TOUCHPAD_REPORT_CONTACTS);
 		return true;
 
 	case HID_DG_BUTTONSWITCH:
-		field->value[index] = button_switch;
+		field->value[index] = !!(report_mode & TOUCHPAD_REPORT_BUTTONS);
 		return true;
 	}
 
@@ -1554,7 +1561,7 @@ static bool mt_need_to_apply_feature(struct hid_device *hdev,
 }
 
 static void mt_set_modes(struct hid_device *hdev, enum latency_mode latency,
-			 bool surface_switch, bool button_switch)
+			 enum report_mode report_mode)
 {
 	struct hid_report_enum *rep_enum;
 	struct hid_report *rep;
@@ -1579,8 +1586,7 @@ static void mt_set_modes(struct hid_device *hdev, enum latency_mode latency,
 							     rep->field[i],
 							     usage,
 							     latency,
-							     surface_switch,
-							     button_switch,
+							     report_mode,
 							     &inputmode_found))
 					update_report = true;
 			}
@@ -1820,7 +1826,7 @@ static int mt_probe(struct hid_device *hdev, const struct hid_device_id *id)
 		dev_warn(&hdev->dev, "Cannot allocate sysfs group for %s\n",
 				hdev->name);
 
-	mt_set_modes(hdev, HID_LATENCY_NORMAL, true, true);
+	mt_set_modes(hdev, HID_LATENCY_NORMAL, TOUCHPAD_REPORT_ALL);
 
 	return 0;
 }
@@ -1832,9 +1838,9 @@ static int mt_suspend(struct hid_device *hdev, pm_message_t state)
 	/* High latency is desirable for power savings during S3/S0ix */
 	if ((td->mtclass.quirks & MT_QUIRK_DISABLE_WAKEUP) ||
 	    !hid_hw_may_wakeup(hdev))
-		mt_set_modes(hdev, HID_LATENCY_HIGH, false, false);
+		mt_set_modes(hdev, HID_LATENCY_HIGH, TOUCHPAD_REPORT_NONE);
 	else
-		mt_set_modes(hdev, HID_LATENCY_HIGH, true, true);
+		mt_set_modes(hdev, HID_LATENCY_HIGH, TOUCHPAD_REPORT_ALL);
 
 	return 0;
 }
@@ -1842,7 +1848,7 @@ static int mt_suspend(struct hid_device *hdev, pm_message_t state)
 static int mt_reset_resume(struct hid_device *hdev)
 {
 	mt_release_contacts(hdev);
-	mt_set_modes(hdev, HID_LATENCY_NORMAL, true, true);
+	mt_set_modes(hdev, HID_LATENCY_NORMAL, TOUCHPAD_REPORT_ALL);
 	return 0;
 }
 
@@ -1854,7 +1860,7 @@ static int mt_resume(struct hid_device *hdev)
 
 	hid_hw_idle(hdev, 0, 0, HID_REQ_SET_IDLE);
 
-	mt_set_modes(hdev, HID_LATENCY_NORMAL, true, true);
+	mt_set_modes(hdev, HID_LATENCY_NORMAL, TOUCHPAD_REPORT_ALL);
 
 	return 0;
 }
-- 
2.47.0.163.g1226f6d8fa-goog


-- 
Dmitry

