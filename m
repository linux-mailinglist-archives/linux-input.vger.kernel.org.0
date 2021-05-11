Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E49237AE4C
	for <lists+linux-input@lfdr.de>; Tue, 11 May 2021 20:20:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232052AbhEKSVy (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 11 May 2021 14:21:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232031AbhEKSVx (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 11 May 2021 14:21:53 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 508FBC061574;
        Tue, 11 May 2021 11:20:45 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id o6-20020a05600c4fc6b029015ec06d5269so1758007wmq.0;
        Tue, 11 May 2021 11:20:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rxhjwjEE7ZOo0E56gyS1tUalNN5E638sE9uVTQlGAvw=;
        b=RIU+PKozwvWFleDMQpKHa1Q78FIGrLTB7y1MNXyWoFlHR7iKXW75pwBHqu5eN34HzE
         hcwkiMQtv+FZ1qtWPmMkwEBkYjQSQXjnB99/FY8/Wu4kQ88Fu4ErD2TgcnKiAp+8791z
         kscAFZagle3TkMaXTRLVOk6QnEB3Wn2GdSM2kr/jALxqzDP1AvyRhyH6wGzublU5r93B
         yYN68J2mV9UidxYlG5GilecKm3x+N/Vosp5t60t3DTyje9oW8aL5OmC20uFkqNsR3kfJ
         TffJUI/Fqf7u1qnNiCCHPXdo4aJlNpOxWv4ZjzcumC5z6bytxFkwWZQrQIZAac5fQ5s6
         drkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rxhjwjEE7ZOo0E56gyS1tUalNN5E638sE9uVTQlGAvw=;
        b=eqANTbcbKHX8BZg29V1FKX//5F4TzOewbMkwIZ1wqTTK/Z+PlyujH2/mgWNR5cJDSu
         pEONCBJGTeUKCAUYDPgHBy3Bn+RnFRELT7mtb/zVgH3XNE/kZIDP8n5T1WbaGZHG+pUd
         kZTjMt4YpHjXcX5v1c2UcQ8XMy8l4dsx9P3uFxyD/vsGZN8WlX+ESxKC1EmGGAwscsnL
         3vNmFKjcsbgmi7WFCd9BZa4+8TA4DS0M2FSXYBN34FQcuwG1dzRsjRrI0jGaEgTIy2I5
         r5e9bV1SrGWkmuMjDHglY/YFWwRPJ0KnORqRUhAoZcpID7kYqtBR/Tqi4gAzAU6WH3Tg
         7Z4Q==
X-Gm-Message-State: AOAM533nTOUahVUvIFbvMpHCio2u3tHKlBlpplRNq8YuTx+jgm6MR0VP
        re+0GF1wLMe4U8noh4AxuH++qJHrKrLsVJST
X-Google-Smtp-Source: ABdhPJxlHz3W4OP1o1atRrXr/qej7ER1C97nuVypUrzSzijhHT5P/Wl7ROivEScHNYsbp5pDlNaaoQ==
X-Received: by 2002:a1c:193:: with SMTP id 141mr34268922wmb.99.1620757244081;
        Tue, 11 May 2021 11:20:44 -0700 (PDT)
Received: from localhost.localdomain ([94.73.38.147])
        by smtp.gmail.com with ESMTPSA id d15sm28012133wrw.71.2021.05.11.11.20.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 May 2021 11:20:43 -0700 (PDT)
From:   =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To:     jikos@kernel.org
Cc:     benjamin.tissoires@redhat.com, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH 2/5] HID: magicmouse: report battery capacity over bluetooth
Date:   Tue, 11 May 2021 20:20:20 +0200
Message-Id: <20210511182023.730524-2-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210511182023.730524-1-jose.exposito89@gmail.com>
References: <20210511182023.730524-1-jose.exposito89@gmail.com>
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

