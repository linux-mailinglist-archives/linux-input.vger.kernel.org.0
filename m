Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 52B2B6124F6
	for <lists+linux-input@lfdr.de>; Sat, 29 Oct 2022 20:49:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229629AbiJ2StW (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 29 Oct 2022 14:49:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229647AbiJ2StV (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 29 Oct 2022 14:49:21 -0400
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B6AA459B1
        for <linux-input@vger.kernel.org>; Sat, 29 Oct 2022 11:49:20 -0700 (PDT)
Received: by mail-pf1-x435.google.com with SMTP id e4so7440943pfl.2
        for <linux-input@vger.kernel.org>; Sat, 29 Oct 2022 11:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gaikai-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nAzAvEF71AWk5L+NHqXWv/Wjc0YxY9nJi4/qO8eWe4k=;
        b=JX+6muPZCY1e8z+Lt1CgekPFYdmFsogUCls+uggySwDSTcdFmRsSWaCUqt0Jo5PYGO
         umNdWjvgRo42r/ZrZ1eCQQc+W1y/hgxZEj+2cYR9XRHPFhrWipSrnQRfoT2GmrMZr/re
         VLeGukyYO5m2pBLM8fshMedR5BG96E19cPMByHsY2UJ3Ctgt/bnK5amRDYpLeSnXWmId
         1xvmi2y/NlPItXyTsPOVNLYkSSJzvciboyyR6CIcEnLeCQdl//aqsD29Jb8GpScMhj6Q
         4dI+vnGk7Kz/BuV5xjtPMdhGF2R5t772WswBCLWYeail6ixu5E8iQyhnP46cO6oxLS69
         3Hxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nAzAvEF71AWk5L+NHqXWv/Wjc0YxY9nJi4/qO8eWe4k=;
        b=LYLUshWBzWCkscTxG4XIdxasYgjic5qDH5V5EBDNUB8XPxWXChZW3UgKDhOyyXSIvl
         qVPSFVf3IcXbwl18SSt5TJsvjwhY38yBPgSX+onEaCbn1JPteLXw7Iz+uhcDmu2N+Gt9
         dVA6Rf7NRf3Q/iUs7PAvXcwd7Hnmr++gBNdYHusUXUzvBGkUnF4MUUXfc+cKaXYfamoz
         IcR88+aXpu7CkZL0HUPjz43RDRdiZLGFObErr4iwajyP0BBVbxF7BeB8i24+Wb03rAnM
         zpOJjcWBb735GRyQLohdHxGX7S3Cfm36rxR+SBGVtGJ486RQvKa4bt6/XbrixxV4Y3DY
         YyUQ==
X-Gm-Message-State: ACrzQf0ISEUbtUFWlAFI5zdOT6Ow8TtFJKNMZbRb2sVwBNg3aABUVTKN
        fgka6SVE44Blfu6I0eA2K8SGEuBDn8FZrulk
X-Google-Smtp-Source: AMsMyM5HoyX6SdHCoOHu/nobAtnPRTmABnvnJLGBK5aSXvhVzvJBNVhqc4LcG1BoqlbIUnpkts4j0w==
X-Received: by 2002:a05:6a00:1ac9:b0:56c:e35b:3ce with SMTP id f9-20020a056a001ac900b0056ce35b03cemr5634267pfv.76.1667069360099;
        Sat, 29 Oct 2022 11:49:20 -0700 (PDT)
Received: from localhost.localdomain ([76.242.116.65])
        by smtp.gmail.com with ESMTPSA id gb7-20020a17090b060700b0020d9306e735sm1377566pjb.20.2022.10.29.11.49.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Oct 2022 11:49:19 -0700 (PDT)
From:   Roderick Colenbrander <roderick@gaikai.com>
X-Google-Original-From: Roderick Colenbrander <roderick.colenbrander@sony.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-input@vger.kernel.org,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Subject: [PATCH 04/13] HID: playstation: add DualShock4 touchpad support.
Date:   Sat, 29 Oct 2022 11:48:42 -0700
Message-Id: <20221029184851.282366-5-roderick.colenbrander@sony.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221029184851.282366-1-roderick.colenbrander@sony.com>
References: <20221029184851.282366-1-roderick.colenbrander@sony.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Support the DualShock4 touchpad as a separate input device. The code
describes the touchpad input reports through structures similar a bit
to the DualSense code.

Signed-off-by: Roderick Colenbrander <roderick.colenbrander@sony.com>
---
 drivers/hid/hid-playstation.c | 66 +++++++++++++++++++++++++++++++++--
 1 file changed, 63 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/hid-playstation.c b/drivers/hid/hid-playstation.c
index 20111aa20e86..63fc3a67ea74 100644
--- a/drivers/hid/hid-playstation.c
+++ b/drivers/hid/hid-playstation.c
@@ -291,17 +291,43 @@ struct dualsense_output_report {
 #define DS4_FEATURE_REPORT_PAIRING_INFO		0x12
 #define DS4_FEATURE_REPORT_PAIRING_INFO_SIZE	16
 
+/*
+ * Status of a DualShock4 touch point contact.
+ * Contact IDs, with highest bit set are 'inactive'
+ * and any associated data is then invalid.
+ */
+#define DS4_TOUCH_POINT_INACTIVE BIT(7)
+
 /* Status field of DualShock4 input report. */
 #define DS4_STATUS0_BATTERY_CAPACITY	GENMASK(3, 0)
 #define DS4_STATUS0_CABLE_STATE		BIT(4)
 /* Battery status within batery_status field. */
 #define DS4_BATTERY_STATUS_FULL		11
 
+/* DualShock4 hardware limits */
+#define DS4_TOUCHPAD_WIDTH	1920
+#define DS4_TOUCHPAD_HEIGHT	942
+
 struct dualshock4 {
 	struct ps_device base;
 	struct input_dev *gamepad;
+	struct input_dev *touchpad;
 };
 
+struct dualshock4_touch_point {
+	uint8_t contact;
+	uint8_t x_lo;
+	uint8_t x_hi:4, y_lo:4;
+	uint8_t y_hi;
+} __packed;
+static_assert(sizeof(struct dualshock4_touch_point) == 4);
+
+struct dualshock4_touch_report {
+	uint8_t timestamp;
+	struct dualshock4_touch_point points[2];
+} __packed;
+static_assert(sizeof(struct dualshock4_touch_report) == 9);
+
 /* Main DualShock4 input report excluding any BT/USB specific headers. */
 struct dualshock4_input_report_common {
 	uint8_t x, y;
@@ -317,7 +343,9 @@ static_assert(sizeof(struct dualshock4_input_report_common) == 32);
 struct dualshock4_input_report_usb {
 	uint8_t report_id; /* 0x01 */
 	struct dualshock4_input_report_common common;
-	uint8_t reserved[31];
+	uint8_t num_touch_reports;
+	struct dualshock4_touch_report touch_reports[3];
+	uint8_t reserved[3];
 } __packed;
 static_assert(sizeof(struct dualshock4_input_report_usb) == DS4_INPUT_REPORT_USB_SIZE);
 
@@ -1556,8 +1584,9 @@ static int dualshock4_parse_report(struct ps_device *ps_dev, struct hid_report *
 	struct hid_device *hdev = ps_dev->hdev;
 	struct dualshock4 *ds4 = container_of(ps_dev, struct dualshock4, base);
 	struct dualshock4_input_report_common *ds4_report;
-	uint8_t battery_capacity, value;
-	int battery_status;
+	struct dualshock4_touch_report *touch_reports;
+	uint8_t battery_capacity, num_touch_reports, value;
+	int battery_status, i, j;
 	unsigned long flags;
 
 	/*
@@ -1570,6 +1599,8 @@ static int dualshock4_parse_report(struct ps_device *ps_dev, struct hid_report *
 		struct dualshock4_input_report_usb *usb = (struct dualshock4_input_report_usb *)data;
 
 		ds4_report = &usb->common;
+		num_touch_reports = usb->num_touch_reports;
+		touch_reports = usb->touch_reports;
 	} else {
 		hid_err(hdev, "Unhandled reportID=%d\n", report->id);
 		return -1;
@@ -1603,6 +1634,29 @@ static int dualshock4_parse_report(struct ps_device *ps_dev, struct hid_report *
 	input_report_key(ds4->gamepad, BTN_MODE,   ds4_report->buttons[2] & DS_BUTTONS2_PS_HOME);
 	input_sync(ds4->gamepad);
 
+	for (i = 0; i < num_touch_reports; i++) {
+		struct dualshock4_touch_report *touch_report = &touch_reports[i];
+
+		for (j = 0; j < ARRAY_SIZE(touch_report->points); j++) {
+			struct dualshock4_touch_point *point = &touch_report->points[j];
+			bool active = (point->contact & DS4_TOUCH_POINT_INACTIVE) ? false : true;
+
+			input_mt_slot(ds4->touchpad, j);
+			input_mt_report_slot_state(ds4->touchpad, MT_TOOL_FINGER, active);
+
+			if (active) {
+				int x = (point->x_hi << 8) | point->x_lo;
+				int y = (point->y_hi << 4) | point->y_lo;
+
+				input_report_abs(ds4->touchpad, ABS_MT_POSITION_X, x);
+				input_report_abs(ds4->touchpad, ABS_MT_POSITION_Y, y);
+			}
+		}
+		input_mt_sync_frame(ds4->touchpad);
+		input_sync(ds4->touchpad);
+	}
+	input_report_key(ds4->touchpad, BTN_LEFT, ds4_report->buttons[2] & DS_BUTTONS2_TOUCHPAD);
+
 	/*
 	 * Interpretation of the battery_capacity data depends on the cable state.
 	 * When no cable is connected (bit4 is 0):
@@ -1700,6 +1754,12 @@ static struct ps_device *dualshock4_create(struct hid_device *hdev)
 		goto err;
 	}
 
+	ds4->touchpad = ps_touchpad_create(hdev, DS4_TOUCHPAD_WIDTH, DS4_TOUCHPAD_HEIGHT, 2);
+	if (IS_ERR(ds4->touchpad)) {
+		ret = PTR_ERR(ds4->touchpad);
+		goto err;
+	}
+
 	ret = ps_device_register_battery(ps_dev);
 	if (ret)
 		goto err;
-- 
2.37.3

