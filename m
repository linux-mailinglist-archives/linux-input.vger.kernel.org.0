Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 45E2D44976
	for <lists+linux-input@lfdr.de>; Thu, 13 Jun 2019 19:18:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728382AbfFMRRf (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 13 Jun 2019 13:17:35 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:42148 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728380AbfFLVT5 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 12 Jun 2019 17:19:57 -0400
Received: by mail-pg1-f193.google.com with SMTP id l19so7010868pgh.9
        for <linux-input@vger.kernel.org>; Wed, 12 Jun 2019 14:19:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=dl6yD7yqASoIUM0WG4fSaC5rnha2MTYjGeTyUb8CVIY=;
        b=ExDAxRFQAgo81hsSTxYqu66Ji8O+76iPngLb/VjA090rBZeUqvoV0kWBFOeJmL9NOL
         WmV4zueHk1wgQ8E85UPiz8wvqpmp7T2PZbtbiU0ZtbRQndDZtwwsOTbejjzQTbm3lcZe
         9ilx6v8km+LG3fe/WD9XqXsUyGq2geyiYDd3tG7AAO+wj9HRo5HbGRfVVAM+/3RXhxhX
         M8IEX+Cpz+FyZJMAhxRH0S6HzNrXtRnDyEEzMIX1i9KTAi8Bb+395Cf37lmwFwD03Kv2
         hXl12I5PkQ1ua6VduyhNVElEoFBufvIp2dj9SudzZqXsdnjFGvBlo5G5vCxB88YJ4b14
         zOTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=dl6yD7yqASoIUM0WG4fSaC5rnha2MTYjGeTyUb8CVIY=;
        b=L1xRn52u/WzLHenqCt063cd+Ci0b5F7geDJhABdmk/qCfMMRMOsk5JpdDZQ85obLbf
         GnkjaokqSMLMU9zdFD07JmaMBV1do2NDtiDPvUNBf3sVIpOfeMYDHGR6h4h7K4sRE/KK
         G7z7gfwMAW0kIn5KeX+qFFSCg76niXlFGjRCM7SV1O1ziPPLwbnbfKAqIodLJjQk8KaX
         Sbm7nqwMcDtbuheyLtGlH8idv4UOOHYHmUKIA00bwUqWr0qnmcFV7mjI7svUqSGRKC6d
         1iyc2pFLNnvbuIzjf7EHHGdDMA5z00x/9LcGuyfx8T9nRhdwIDMkOo/T8g+YNru/esUj
         EY+g==
X-Gm-Message-State: APjAAAXd9hgBMKtLnJ3Np4ndp8ax+bPzZ7ilHM2Q/ufQoiivowOrTIh7
        4JaPeCRfaioB7X9TJGEeglaMJNv8sblSOw==
X-Google-Smtp-Source: APXvYqzh63wXSiQbTziPBQRnMZX14lvI4Z459t7cVx9tzyA9K/RKUvceKkTM/gpEwUZItP31G/FL0A==
X-Received: by 2002:a63:2c01:: with SMTP id s1mr26703289pgs.261.1560374396310;
        Wed, 12 Jun 2019 14:19:56 -0700 (PDT)
Received: from west.Home ([97.115.133.135])
        by smtp.googlemail.com with ESMTPSA id m6sm423283pgr.18.2019.06.12.14.19.55
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Wed, 12 Jun 2019 14:19:55 -0700 (PDT)
From:   Aaron Armstrong Skomra <skomra@gmail.com>
X-Google-Original-From: Aaron Armstrong Skomra <aaron.skomra@wacom.com>
To:     linux-input@vger.kernel.org, jikos@kernel.org,
        benjamin.tissoires@redhat.com, pinglinux@gmail.com,
        jason.gerecke@wacom.com
Cc:     Aaron Armstrong Skomra <aaron.skomra@wacom.com>
Subject: [PATCH 3/4] HID: wacom: generic: support the 'report valid' usage for touch
Date:   Wed, 12 Jun 2019 14:19:30 -0700
Message-Id: <1560374371-2688-4-git-send-email-aaron.skomra@wacom.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1560374371-2688-1-git-send-email-aaron.skomra@wacom.com>
References: <1560374371-2688-1-git-send-email-aaron.skomra@wacom.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Finger data is separated into chunks in our Bluetooth report,
where each report contains the same number of chunks. Those chunks
are not aligned in any particular way to a set of finger touches.
That is, the first half of a group of simultaneous touches may
be in one chunk at the end of a report and the second half could
be at the beginning of the next report.

Also some chunks contain no data and potentially some chunks could
contain leftover (bad) data.

Introduce and process the WACOM_HID_WT_REPORT_VALID usage that the
device uses to let us know if we should process a chunk of data.

Signed-off-by: Aaron Armstrong Skomra <aaron.skomra@wacom.com>
---
 drivers/hid/wacom_wac.c | 12 +++++++++++-
 drivers/hid/wacom_wac.h |  1 +
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/wacom_wac.c b/drivers/hid/wacom_wac.c
index 678f504239a0..67ecd149ad21 100644
--- a/drivers/hid/wacom_wac.c
+++ b/drivers/hid/wacom_wac.c
@@ -1752,6 +1752,9 @@ int wacom_equivalent_usage(int usage)
 		int subpage = (usage & 0xFF00) << 8;
 		int subusage = (usage & 0xFF);
 
+		if (usage == WACOM_HID_WT_REPORT_VALID)
+			return usage;
+
 		if (subpage == HID_UP_UNDEFINED)
 			subpage = WACOM_HID_SP_DIGITIZER;
 
@@ -2494,6 +2497,9 @@ static void wacom_wac_finger_event(struct hid_device *hdev,
 	unsigned equivalent_usage = wacom_equivalent_usage(usage->hid);
 	struct wacom_features *features = &wacom->wacom_wac.features;
 
+	if (wacom_wac->is_invalid_bt_frame)
+		return;
+
 	switch (equivalent_usage) {
 	case HID_GD_X:
 		wacom_wac->hid_data.x = value;
@@ -2513,12 +2519,14 @@ static void wacom_wac_finger_event(struct hid_device *hdev,
 	case HID_DG_TIPSWITCH:
 		wacom_wac->hid_data.tipswitch = value;
 		break;
+	case WACOM_HID_WT_REPORT_VALID:
+		wacom_wac->is_invalid_bt_frame = !value;
+		return;
 	case HID_DG_CONTACTMAX:
 		features->touch_max = value;
 		return;
 	}
 
-
 	if (usage->usage_index + 1 == field->report_count) {
 		if (equivalent_usage == wacom_wac->hid_data.last_slot_field)
 			wacom_wac_finger_slot(wacom_wac, wacom_wac->touch_input);
@@ -2533,6 +2541,8 @@ static void wacom_wac_finger_pre_report(struct hid_device *hdev,
 	struct hid_data* hid_data = &wacom_wac->hid_data;
 	int i;
 
+	wacom_wac->is_invalid_bt_frame = false;
+
 	for (i = 0; i < report->maxfield; i++) {
 		struct hid_field *field = report->field[i];
 		int j;
diff --git a/drivers/hid/wacom_wac.h b/drivers/hid/wacom_wac.h
index 48f08f8a556d..1cb63a4a0a41 100644
--- a/drivers/hid/wacom_wac.h
+++ b/drivers/hid/wacom_wac.h
@@ -159,6 +159,7 @@
 #define WACOM_HID_WT_SERIALNUMBER       (WACOM_HID_UP_WACOMTOUCH | 0x5b)
 #define WACOM_HID_WT_X                  (WACOM_HID_UP_WACOMTOUCH | 0x130)
 #define WACOM_HID_WT_Y                  (WACOM_HID_UP_WACOMTOUCH | 0x131)
+#define WACOM_HID_WT_REPORT_VALID       (WACOM_HID_UP_WACOMTOUCH | 0x1d0)
 
 #define WACOM_BATTERY_USAGE(f)	(((f)->hid == HID_DG_BATTERYSTRENGTH) || \
 				 ((f)->hid == WACOM_HID_WD_BATTERY_CHARGING) || \
-- 
2.17.1

