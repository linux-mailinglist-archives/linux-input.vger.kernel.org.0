Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3240238D6C8
	for <lists+linux-input@lfdr.de>; Sat, 22 May 2021 20:06:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231340AbhEVSHp (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 22 May 2021 14:07:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231316AbhEVSHo (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 22 May 2021 14:07:44 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC978C061574;
        Sat, 22 May 2021 11:06:17 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id c14so22365377wrx.3;
        Sat, 22 May 2021 11:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rxhjwjEE7ZOo0E56gyS1tUalNN5E638sE9uVTQlGAvw=;
        b=vQRaJRfbPbdAGEJBzqPuJXJakMKu+r1s68xgDWZGh0RkrzLgRPgRusCXLhEITcdHyv
         L0DkmYWnGfBKjUoBO+2WmhQcUZXx42d3xlAFb68tTEuxwIS10XwFBWAZuHlPDKxeCj46
         CwCmsdijo0MzofR6f3OT4I54pg5nJuQauDZ6v5k8UXjnjKp0MsdVep0Gc5gmTttfdJuw
         +Tsmg5fFuS4txhKBWR4+9DAYEKdjN2/LUEKtbbsqBkMLDRFk57uzAD4fN6x93gp5lPhl
         8JeycI0nlP/HjWnih8m2PoPloWKb00qwmf8Ip/39cIT2ijpcc0nh+P+uNDGikIJhat9m
         jyaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rxhjwjEE7ZOo0E56gyS1tUalNN5E638sE9uVTQlGAvw=;
        b=XlJpuHPfyPyfRD6BznKO0iGPA6pBALp+Yzc+RrYIIZM58nrgVbb48KvhK05cxJ3E1j
         oMs8gwTPbymMKYZkzR0903z9uRas2wV1Ukh90rOhWJU12m6t0FbhHtbbYHnHF4AnJXgF
         LcjtKB5q/VxLQv0+OFglKE0X24YiOsNTtQ81RUVe3O6FeMyIWDkHNdFttv1VbRwH59zp
         ohB3Kkyx6jUYswdbk8HFTV4XtLPy9Y60f2O9obCTtVBK97Yk0As0g9iZPaeekK5XkWOS
         /HVHzHQHzso8CxZmCFWPUTr1WBSXwadLnAu7ZGuoQ3+TzO1Ygp7sqO3m/kAawTPgnBX8
         DvLA==
X-Gm-Message-State: AOAM530sbnlykzk6B8NVSRu2tzWM0NE91LKAePdKVtJGWHPWlEQ4MKZm
        /BsP4DtKflycfPDomelHDd0gnIvWay7EEA==
X-Google-Smtp-Source: ABdhPJwyo8xPhgskFs4G7N0xAGxaYufSswon1nj8sXwnGyUL57kpvr8ITB+QmUIiQhQAusw+ib/fkg==
X-Received: by 2002:adf:f7cf:: with SMTP id a15mr14601539wrq.184.1621706776382;
        Sat, 22 May 2021 11:06:16 -0700 (PDT)
Received: from localhost.localdomain ([94.73.38.147])
        by smtp.gmail.com with ESMTPSA id v12sm5913217wrv.76.2021.05.22.11.06.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 May 2021 11:06:15 -0700 (PDT)
From:   =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To:     jikos@kernel.org
Cc:     benjamin.tissoires@redhat.com, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH v2 2/5] HID: magicmouse: report battery capacity over bluetooth
Date:   Sat, 22 May 2021 20:06:08 +0200
Message-Id: <20210522180611.314300-2-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210522180611.314300-1-jose.exposito89@gmail.com>
References: <20210522180611.314300-1-jose.exposito89@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Report the battery capacity percentage for the Apple Magic Mouse 2
and the Apple Magic Trackpad 2 when they are connected over bluetooth.

Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 drivers/hid/hid-magicmouse.c | 54 ++++++++++++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/drivers/hid/hid-magicmouse.c b/drivers/hid/hid-magicmouse.c
index 0f766bce4537..d4a58dd6d2b8 100644
--- a/drivers/hid/hid-magicmouse.c
+++ b/drivers/hid/hid-magicmouse.c
@@ -57,6 +57,8 @@ MODULE_PARM_DESC(report_undeciphered, "Report undeciphered multi-touch state fie
 #define MOUSE_REPORT_ID    0x29
 #define MOUSE2_REPORT_ID   0x12
 #define DOUBLE_REPORT_ID   0xf7
+#define BT_BATTERY_REPORT_ID 0x90
+
 /* These definitions are not precise, but they're close enough.  (Bits
  * 0x03 seem to indicate the aspect ratio of the touch, bits 0x70 seem
  * to be some kind of bit mask -- 0x20 may be a near-field reading,
@@ -139,12 +141,14 @@ struct magicmouse_sc {
 	struct {
 		struct power_supply *ps;
 		struct power_supply_desc ps_desc;
+		int capacity;
 	} battery;
 };
 
 static enum power_supply_property magicmouse_ps_props[] = {
 	POWER_SUPPLY_PROP_PRESENT,
 	POWER_SUPPLY_PROP_SCOPE,
+	POWER_SUPPLY_PROP_CAPACITY,
 };
 
 static bool magicmouse_can_report_battery(struct magicmouse_sc *msc)
@@ -153,6 +157,49 @@ static bool magicmouse_can_report_battery(struct magicmouse_sc *msc)
 	       (msc->input->id.product == USB_DEVICE_ID_APPLE_MAGICMOUSE2);
 }
 
+static bool magicmouse_can_report_battery_vendor(struct magicmouse_sc *msc,
+						 unsigned short vendor)
+{
+	return magicmouse_can_report_battery(msc) &&
+	       (msc->input->id.vendor == vendor);
+}
+
+static int magicmouse_battery_bt_get_capacity(struct magicmouse_sc *msc)
+{
+	struct hid_report_enum report_enum;
+	struct hid_report *report;
+	int ret;
+
+	if (!magicmouse_can_report_battery_vendor(msc, BT_VENDOR_ID_APPLE))
+		return -EINVAL;
+
+	report_enum = msc->hdev->report_enum[HID_INPUT_REPORT];
+	report = report_enum.report_id_hash[BT_BATTERY_REPORT_ID];
+
+	if (!report || report->maxfield < 1) {
+		hid_err(msc->hdev, "failed to retrieve report with ID %d\n",
+			BT_BATTERY_REPORT_ID);
+		return -EINVAL;
+	}
+
+	hid_hw_request(msc->hdev, report, HID_REQ_GET_REPORT);
+
+	if (!report || report->maxfield < 2) {
+		hid_err(msc->hdev, "invalid report->maxfield: %d\n",
+			report->maxfield);
+		return -EINVAL;
+	}
+
+	ret = report->field[0]->value[0];
+	if (ret < 0) {
+		hid_err(msc->hdev, "invalid report status %d\n", ret);
+		return ret;
+	}
+
+	msc->battery.capacity = report->field[1]->value[0];
+	return 0;
+}
+
 static int magicmouse_battery_get_property(struct power_supply *psy,
 					   enum power_supply_property psp,
 					   union power_supply_propval *val)
@@ -170,6 +217,12 @@ static int magicmouse_battery_get_property(struct power_supply *psy,
 	case POWER_SUPPLY_PROP_SCOPE:
 		val->intval = POWER_SUPPLY_SCOPE_DEVICE;
 		break;
+	case POWER_SUPPLY_PROP_CAPACITY:
+		if (msc->input->id.vendor == BT_VENDOR_ID_APPLE)
+			magicmouse_battery_bt_get_capacity(msc);
+
+		val->intval = msc->battery.capacity;
+		break;
 	default:
 		ret = -EINVAL;
 		break;
@@ -188,6 +241,7 @@ static int magicmouse_battery_probe(struct hid_device *hdev)
 	if (!magicmouse_can_report_battery(msc))
 		return 0;
 
+	msc->battery.capacity = 100;
 	msc->battery.ps_desc.type = POWER_SUPPLY_TYPE_BATTERY;
 	msc->battery.ps_desc.properties = magicmouse_ps_props;
 	msc->battery.ps_desc.num_properties = ARRAY_SIZE(magicmouse_ps_props);
-- 
2.25.1

