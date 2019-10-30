Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 50FD0E994D
	for <lists+linux-input@lfdr.de>; Wed, 30 Oct 2019 10:39:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726071AbfJ3JjS (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 30 Oct 2019 05:39:18 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:37613 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726063AbfJ3JjS (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 30 Oct 2019 05:39:18 -0400
Received: by mail-pl1-f196.google.com with SMTP id p13so742500pll.4;
        Wed, 30 Oct 2019 02:39:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1YGXo/SF75Yt2VzSc2ZhTmUHp1jTQNYYmgSwhHo/iHE=;
        b=T01tsbGOKACg8rjHZVgIdjsyfJausHFmH+b2g77sqkgKM7KmQxZx70eFw3IbyIobfb
         MH5Z+VSbM1Asv23w19JsyWwD2RzIr2tBjJiaPmNRI2j2gnU6iEXAHdzDClI0KIpJBnwi
         9Y6QKPx9aH9HCago4K9+pCkbx+5gtTGuFtcROqyPHrHbG9LSKRBmD92dXiPzrHpKOHZE
         gr2DkSaYyFWTw18zLL1jdwglNRx0ZcgAm1vV+dptbCmCz9eQt42+jd9Ec4nFIW4uOUbr
         yZ8t8g8lwRon4e3zydIetmoQQ62dwAjzQuZ/2chUofLPFp+ZC/p2HXrsHk0WRkjoRG4t
         SM5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1YGXo/SF75Yt2VzSc2ZhTmUHp1jTQNYYmgSwhHo/iHE=;
        b=KAcsjuwDCTSoXRBiJDM1L4mQ0j03mM9j9hKQ/Ak9ZpShu1KZee9Cz7VilBJCM0zM65
         eW33qBVsXZXc8LRIHvQcevQC58lABiWgz6cny+icWW7lKJPKIK3lu2r9BP1WwvK7gGmL
         QSQVhPhc2eT28CsaaOYXxEiof17EK89y6DabbWaVrdW3/uIshacqIauztuXXkq5+F+fT
         Ht0e5yPvkU3TtaWwpmhzCWYByra8dDe4P7qUkMGUPUwA9qJRyUw7WMLhmDdsnlzpYBR7
         VkAT3SPqcxHAlgdwB/8VTmYXXuAb6Ebb26k4LQ0N4mFOBDkvSUA9+ReWcX5hVhuy+VEU
         oOAA==
X-Gm-Message-State: APjAAAV/6S99R+Z9T4SHHpHoy6IA75n874/wFT/8EkrHaDBIcvEJIca5
        RUUZ0gaWP08hg0BlypMqjyw=
X-Google-Smtp-Source: APXvYqx2bsz0q1YEMomF7tg/QE6FaJHQoLR84yjHPoMEDBHwD4lQZ294O5HfQO+LsqTI8UdPhs9pyA==
X-Received: by 2002:a17:902:a609:: with SMTP id u9mr3503407plq.180.1572428356669;
        Wed, 30 Oct 2019 02:39:16 -0700 (PDT)
Received: from archlinux.GovzHome.Local ([2407:7000:aa08:9602:1f09:3b2d:1861:4613])
        by smtp.gmail.com with ESMTPSA id i17sm1876190pfo.106.2019.10.30.02.39.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2019 02:39:16 -0700 (PDT)
From:   sanjay.govind9@gmail.com
Cc:     sanjay.govind9@gmail.com, Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] HID: sony: Add support for Guitar Hero Guitars
Date:   Wed, 30 Oct 2019 22:29:56 +1300
Message-Id: <20191030092956.17934-1-sanjay.govind9@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Sanjay Govind <sanjay.govind9@gmail.com>

Guitar Hero Guitars use the accelerometer x axis for tilt. Currently,
they are treated as a regular HID device, and this does not allow the
usage of the accelerometer. Add in support for both the PS3 and the 
PC guitars (they are the same guitars, with different vids and pids).

Signed-off-by: Sanjay Govind <sanjay.govind9@gmail.com>
---
 drivers/hid/hid-ids.h  |  5 +++++
 drivers/hid/hid-sony.c | 26 ++++++++++++++++++++++++++
 2 files changed, 31 insertions(+)

diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 447e8db21174..1d640f94c5bc 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -40,6 +40,9 @@
 #define USB_VENDOR_ID_ACTIONSTAR	0x2101
 #define USB_DEVICE_ID_ACTIONSTAR_1011	0x1011
 
+#define USB_VENDOR_ID_ACTIVISION 0x1430
+#define USB_DEVICE_ID_ACTIVISION_GUITAR 0x474c
+
 #define USB_VENDOR_ID_ADS_TECH		0x06e1
 #define USB_DEVICE_ID_ADS_TECH_RADIO_SI470X	0xa155
 
@@ -1031,6 +1034,7 @@
 
 
 #define USB_VENDOR_ID_SONY			0x054c
+#define USB_VENDOR_ID_SONY2			0x12BA
 #define USB_DEVICE_ID_SONY_VAIO_VGX_MOUSE	0x024b
 #define USB_DEVICE_ID_SONY_VAIO_VGP_MOUSE	0x0374
 #define USB_DEVICE_ID_SONY_PS3_BDREMOTE		0x0306
@@ -1042,6 +1046,7 @@
 #define USB_DEVICE_ID_SONY_NAVIGATION_CONTROLLER	0x042f
 #define USB_DEVICE_ID_SONY_BUZZ_CONTROLLER		0x0002
 #define USB_DEVICE_ID_SONY_WIRELESS_BUZZ_CONTROLLER	0x1000
+#define USB_DEVICE_ID_SONY_GUITAR_CONTROLLER 0x0100
 
 #define USB_VENDOR_ID_SINO_LITE			0x1345
 #define USB_DEVICE_ID_SINO_LITE_CONTROLLER	0x3008
diff --git a/drivers/hid/hid-sony.c b/drivers/hid/hid-sony.c
index 4c6ed6ef31f1..410c855fb830 100644
--- a/drivers/hid/hid-sony.c
+++ b/drivers/hid/hid-sony.c
@@ -56,6 +56,7 @@
 #define NSG_MR5U_REMOTE_BT        BIT(14)
 #define NSG_MR7U_REMOTE_BT        BIT(15)
 #define SHANWAN_GAMEPAD           BIT(16)
+#define GH_GUITAR_CONTROLLER      BIT(17)
 
 #define SIXAXIS_CONTROLLER (SIXAXIS_CONTROLLER_USB | SIXAXIS_CONTROLLER_BT)
 #define MOTION_CONTROLLER (MOTION_CONTROLLER_USB | MOTION_CONTROLLER_BT)
@@ -507,6 +508,8 @@ struct motion_output_report_02 {
 #define SIXAXIS_INPUT_REPORT_ACC_X_OFFSET 41
 #define SIXAXIS_ACC_RES_PER_G 113
 
+#define GUITAR_TILT_USAGE 44
+
 static DEFINE_SPINLOCK(sony_dev_list_lock);
 static LIST_HEAD(sony_device_list);
 static DEFINE_IDA(sony_device_id_allocator);
@@ -757,6 +760,20 @@ static int navigation_mapping(struct hid_device *hdev, struct hid_input *hi,
 	return -1;
 }
 
+static int guitar_mapping(struct hid_device *hdev, struct hid_input *hi,
+			  struct hid_field *field, struct hid_usage *usage,
+			  unsigned long **bit, int *max)
+{
+	if ((usage->hid & HID_USAGE_PAGE) == HID_UP_MSVENDOR) {
+		unsigned int abs = usage->hid & HID_USAGE;
+
+		if (abs == GUITAR_TILT_USAGE) {
+			hid_map_usage_clear(hi, usage, bit, max, EV_ABS, ABS_RY);
+			return 1;
+		}
+	}
+	return 0;
+}
 
 static int sixaxis_mapping(struct hid_device *hdev, struct hid_input *hi,
 			  struct hid_field *field, struct hid_usage *usage,
@@ -1340,6 +1357,9 @@ static int sony_mapping(struct hid_device *hdev, struct hid_input *hi,
 	if (sc->quirks & SIXAXIS_CONTROLLER)
 		return sixaxis_mapping(hdev, hi, field, usage, bit, max);
 
+	if (sc->quirks & GH_GUITAR_CONTROLLER)
+		return guitar_mapping(hdev, hi, field, usage, bit, max);
+
 	if (sc->quirks & DUALSHOCK4_CONTROLLER)
 		return ds4_mapping(hdev, hi, field, usage, bit, max);
 
@@ -2950,6 +2970,12 @@ static int sony_resume(struct hid_device *hdev)
 #endif
 
 static const struct hid_device_id sony_devices[] = {
+	{ HID_USB_DEVICE(USB_VENDOR_ID_ACTIVISION, USB_DEVICE_ID_ACTIVISION_GUITAR),
+		.driver_data = GH_GUITAR_CONTROLLER },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_SONY2, USB_DEVICE_ID_SONY_GUITAR_CONTROLLER),
+		.driver_data = GH_GUITAR_CONTROLLER },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_SONY, USB_DEVICE_ID_SONY_PS3_CONTROLLER),
+		.driver_data = SIXAXIS_CONTROLLER_USB },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_SONY, USB_DEVICE_ID_SONY_PS3_CONTROLLER),
 		.driver_data = SIXAXIS_CONTROLLER_USB },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_SONY, USB_DEVICE_ID_SONY_NAVIGATION_CONTROLLER),
-- 
2.23.0

