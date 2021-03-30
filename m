Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F91034E65F
	for <lists+linux-input@lfdr.de>; Tue, 30 Mar 2021 13:34:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231863AbhC3Ldt (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 30 Mar 2021 07:33:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231864AbhC3Ldn (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 30 Mar 2021 07:33:43 -0400
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE68BC061574
        for <linux-input@vger.kernel.org>; Tue, 30 Mar 2021 04:33:42 -0700 (PDT)
Received: by mail-pf1-x42e.google.com with SMTP id x126so11916026pfc.13
        for <linux-input@vger.kernel.org>; Tue, 30 Mar 2021 04:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NPH6D8Ag7TfN8Wda26qTly1WDpk+O8jg+fyK7l+4kUU=;
        b=ja336z/0Z/gcd43sIItyUnSdYGSAo5p6Toyj8SyY6fawW1MVZaipghdlqIjqZOdc/t
         51Kl52PpKJH3Ifw5pWhgAjF3oW70f9JmH6JxS1E/T62OxjfrLMWfaSoG6TEMVlIgwdFR
         +Um8YygFgxzrj9QuSZko/KezgQqm1+bweZQwDPXqXRfH4pewFjYBQSfc6yKiNzn2Dp4S
         4Bg+F6Gxjk9N7EaOSD7MMQkHTTCVGSC/YYaFFORlxjV6K5HD8eXsph8JrqYDheab1LdH
         zJxESQMNFWVb4CII89gfnB2nlCrkCxGj9O1775XYP+hLYCq+2LftBa4xAUWrrVxNxAxE
         Sqxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NPH6D8Ag7TfN8Wda26qTly1WDpk+O8jg+fyK7l+4kUU=;
        b=kyRQBTczKOVRjQq1wJvJ2iqDh5Hs0GqPPFBWquEdn1620SPDQx4KUQ73/dhbn+YemI
         Q7Ba3ifx/gKOFcT6SOCnWyQhvLsPAADaBUpWNjXaJB3LTn2pkZuTWL2hzx39k8sfyw7k
         KiHN5p4L6bYlsP30FgyR3R7wQcVlE9EcdCO3UAJRL9cvRx0o2AWyfHgjga6h22guxw47
         LBYqOZv0aPXH26zciHtBRrqCQ8M60xmTdk5QxcHSzemr493AfuDc1kmcjzr5xlzI8f2J
         Lm4HoaMSz1Cex1D6SU+gRflHgXO8OWj6L0pefHr5sg6mqzAndXstDqsvLa81VKTrNT2F
         w8kA==
X-Gm-Message-State: AOAM533ZHeQeWRDMDQ4qdj+rYfiRTrGK4f7eeLR03X65O/Bq8ohtNldR
        yiSLwgSI9FOQDZq3wXKUremzaC+7h0/KMxAL
X-Google-Smtp-Source: ABdhPJzxbdA8LspheCpp1xDYslJI4TfJ8akrTJY9cOu83+pOAExEi1OcmLkElkKL8FqPQhwKv7tkjw==
X-Received: by 2002:a63:3686:: with SMTP id d128mr27950176pga.331.1617104022245;
        Tue, 30 Mar 2021 04:33:42 -0700 (PDT)
Received: from johnchen902-arch-ryzen.. (2001-b011-3815-5a81-9afa-9bff-fe6e-3ce2.dynamic-ip6.hinet.net. [2001:b011:3815:5a81:9afa:9bff:fe6e:3ce2])
        by smtp.gmail.com with ESMTPSA id y4sm19650868pfn.67.2021.03.30.04.33.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Mar 2021 04:33:41 -0700 (PDT)
From:   John Chen <johnchen902@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     Rohit Pidaparthi <rohitpid@gmail.com>,
        RicardoEPRodrigues <ricardo.e.p.rodrigues@gmail.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        John Chen <johnchen902@gmail.com>
Subject: [PATCH v2 4/4] HID: input: map battery capacity (00850065)
Date:   Tue, 30 Mar 2021 19:33:19 +0800
Message-Id: <20210330113319.14010-5-johnchen902@gmail.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210330113319.14010-1-johnchen902@gmail.com>
References: <20210330113319.14010-1-johnchen902@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This is the capacity in percentage, relative to design capacity.
Specifically, it is present in Apple Magic Mouse 2.

In contrast, usage 00850064 is also the capacity in percentage, but is
relative to full capacity. It is not mapped here because I don't have
such device.

Signed-off-by: John Chen <johnchen902@gmail.com>
---
 drivers/hid/hid-debug.c |  1 +
 drivers/hid/hid-input.c | 22 ++++++++++++++++------
 include/linux/hid.h     |  3 +++
 3 files changed, 20 insertions(+), 6 deletions(-)

diff --git a/drivers/hid/hid-debug.c b/drivers/hid/hid-debug.c
index d7eaf9100370..59f8d716d78f 100644
--- a/drivers/hid/hid-debug.c
+++ b/drivers/hid/hid-debug.c
@@ -417,6 +417,7 @@ static const struct hid_usage_entry hid_usage_table[] = {
     { 0x85, 0x44, "Charging" },
     { 0x85, 0x45, "Discharging" },
     { 0x85, 0x4b, "NeedReplacement" },
+    { 0x85, 0x65, "AbsoluteStateOfCharge" },
     { 0x85, 0x66, "RemainingCapacity" },
     { 0x85, 0x68, "RunTimeToEmpty" },
     { 0x85, 0x6a, "AverageTimeToFull" },
diff --git a/drivers/hid/hid-input.c b/drivers/hid/hid-input.c
index 236bccd37760..18f5e28d475c 100644
--- a/drivers/hid/hid-input.c
+++ b/drivers/hid/hid-input.c
@@ -435,7 +435,8 @@ static int hidinput_get_battery_property(struct power_supply *psy,
 	return ret;
 }
 
-static int hidinput_setup_battery(struct hid_device *dev, unsigned report_type, struct hid_field *field)
+static int hidinput_setup_battery(struct hid_device *dev, unsigned report_type,
+				  struct hid_field *field, bool is_percentage)
 {
 	struct power_supply_desc *psy_desc;
 	struct power_supply_config psy_cfg = { .drv_data = dev, };
@@ -475,7 +476,7 @@ static int hidinput_setup_battery(struct hid_device *dev, unsigned report_type,
 	min = field->logical_minimum;
 	max = field->logical_maximum;
 
-	if (quirks & HID_BATTERY_QUIRK_PERCENT) {
+	if (is_percentage || (quirks & HID_BATTERY_QUIRK_PERCENT)) {
 		min = 0;
 		max = 100;
 	}
@@ -552,7 +553,7 @@ static void hidinput_update_battery(struct hid_device *dev, int value)
 }
 #else  /* !CONFIG_HID_BATTERY_STRENGTH */
 static int hidinput_setup_battery(struct hid_device *dev, unsigned report_type,
-				  struct hid_field *field)
+				  struct hid_field *field, bool is_percentage)
 {
 	return 0;
 }
@@ -806,7 +807,7 @@ static void hidinput_configure_usage(struct hid_input *hidinput, struct hid_fiel
 			break;
 
 		case 0x3b: /* Battery Strength */
-			hidinput_setup_battery(device, HID_INPUT_REPORT, field);
+			hidinput_setup_battery(device, HID_INPUT_REPORT, field, false);
 			usage->type = EV_PWR;
 			return;
 
@@ -1068,7 +1069,16 @@ static void hidinput_configure_usage(struct hid_input *hidinput, struct hid_fiel
 	case HID_UP_GENDEVCTRLS:
 		switch (usage->hid) {
 		case HID_DC_BATTERYSTRENGTH:
-			hidinput_setup_battery(device, HID_INPUT_REPORT, field);
+			hidinput_setup_battery(device, HID_INPUT_REPORT, field, false);
+			usage->type = EV_PWR;
+			return;
+		}
+		goto unknown;
+
+	case HID_UP_BATTERY:
+		switch (usage->hid) {
+		case HID_BAT_ABSOLUTESTATEOFCHARGE:
+			hidinput_setup_battery(device, HID_INPUT_REPORT, field, true);
 			usage->type = EV_PWR;
 			return;
 		}
@@ -1672,7 +1682,7 @@ static void report_features(struct hid_device *hid)
 				/* Verify if Battery Strength feature is available */
 				if (usage->hid == HID_DC_BATTERYSTRENGTH)
 					hidinput_setup_battery(hid, HID_FEATURE_REPORT,
-							       rep->field[i]);
+							       rep->field[i], false);
 
 				if (drv->feature_mapping)
 					drv->feature_mapping(hid, rep->field[i], usage);
diff --git a/include/linux/hid.h b/include/linux/hid.h
index ef702b3f56e3..b40e1abbe11d 100644
--- a/include/linux/hid.h
+++ b/include/linux/hid.h
@@ -153,6 +153,7 @@ struct hid_item {
 #define HID_UP_CONSUMER		0x000c0000
 #define HID_UP_DIGITIZER	0x000d0000
 #define HID_UP_PID		0x000f0000
+#define HID_UP_BATTERY		0x00850000
 #define HID_UP_HPVENDOR         0xff7f0000
 #define HID_UP_HPVENDOR2        0xff010000
 #define HID_UP_MSVENDOR		0xff000000
@@ -297,6 +298,8 @@ struct hid_item {
 #define HID_DG_TOOLSERIALNUMBER	0x000d005b
 #define HID_DG_LATENCYMODE	0x000d0060
 
+#define HID_BAT_ABSOLUTESTATEOFCHARGE	0x00850065
+
 #define HID_VD_ASUS_CUSTOM_MEDIA_KEYS	0xff310076
 /*
  * HID report types --- Ouch! HID spec says 1 2 3!
-- 
2.31.0

