Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88FA747C757
	for <lists+linux-input@lfdr.de>; Tue, 21 Dec 2021 20:17:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241729AbhLUTRw (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 21 Dec 2021 14:17:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241739AbhLUTRw (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 21 Dec 2021 14:17:52 -0500
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBD4FC06173F
        for <linux-input@vger.kernel.org>; Tue, 21 Dec 2021 11:17:51 -0800 (PST)
Received: by mail-wr1-x431.google.com with SMTP id j18so85870wrd.2
        for <linux-input@vger.kernel.org>; Tue, 21 Dec 2021 11:17:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tDE1yTTX0Xg5vz7Ch8EMZhldmZR/CGhGbu900yOBjHM=;
        b=dnjOPZw/mZxEaYHGWhjKq6ejI1iD7UPs7IV3Drau+05Uy7wC+NROv8KUpcSJzHWbTe
         kLdmBGrI3kiMi6BB1O0jFxRDs8PVIG2ZHkrNuZDKiP9WuHnXtSNzF7qGmpNAUprZzNyM
         rppbZ2nJ5Obc8s74d8F27xMkjXKgM1WSkbxlwN5D3ZF/zj32zugDIELfppnOdMQQBx7j
         KlLfWNwZT5yTwRdU3lPwB4Z3qU+HZvcMUvbbA56myUr3FIQjTD0+mBZeb1FXuM3GmJ/S
         UQ8nJEcegI8eSdPj+3ORsq4+ANYJB58TNooDKwQTA259jasV/pNnL2WHiXOOda5EJqrf
         tKqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tDE1yTTX0Xg5vz7Ch8EMZhldmZR/CGhGbu900yOBjHM=;
        b=mMeJ654Ny478WNkNaxg2AFts9rwU/IUXwhVxiAwqLgyQQhueAyym3ptyok4TkPmoq0
         esY0PshMsUTSlpDAev8n/6F1Zt+CeETO9NEidC6clab8j6nIzhq9ezFZ0PAPI5NcP9BP
         Gxc491KdRvZwv/+5FRuenScIQdbxVI52L9QNeutB0VubuH7hdMG0b3eNdUqeHXDvDfk0
         bdL8eLsU2VJfyKG7AnrkaEysCMhjt0VgqsNoolHDG0S83pBvLHQZH5ZBZ5m6GQH4agwU
         zvRGnS1q9gSPGupk0pRBclfyYTEkt89hwlQB5R5CjWXDQsK6bNYD5y5P0/QiE01YcoCT
         hcYQ==
X-Gm-Message-State: AOAM5334Wo8RRVD3Nr9oSVL12g/Rl1hMOpQGxlSrsDr5Vh2GD4vDpWsz
        SQ3RYBX2uPYhIUizY3QGkXZGSPp8qpTv04TmRzQ=
X-Google-Smtp-Source: ABdhPJwt5Wx+UShrK0N34AbzkpCCQf8RxIX1csIUhXcUpedeibrOSn8RJvr3w/1ILs66zF0gADCwzw==
X-Received: by 2002:a5d:42d2:: with SMTP id t18mr3701915wrr.271.1640114270383;
        Tue, 21 Dec 2021 11:17:50 -0800 (PST)
Received: from aczubak.c.googlers.com.com (109.36.187.35.bc.googleusercontent.com. [35.187.36.109])
        by smtp.gmail.com with ESMTPSA id t8sm3994846wmq.32.2021.12.21.11.17.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Dec 2021 11:17:50 -0800 (PST)
From:   Angela Czubak <acz@semihalf.com>
To:     linux-input@vger.kernel.org
Cc:     upstream@semihalf.com, dmitry.torokhov@gmail.com,
        Angela Czubak <acz@semihalf.com>
Subject: [PATCH 05/18] HID: introduce hid_get_feature
Date:   Tue, 21 Dec 2021 19:17:30 +0000
Message-Id: <20211221191743.1893185-6-acz@semihalf.com>
X-Mailer: git-send-email 2.34.1.307.g9b7440fafd-goog
In-Reply-To: <20211221191743.1893185-1-acz@semihalf.com>
References: <20211221191743.1893185-1-acz@semihalf.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Move mt_get_feature from hid-multitouch to hid-core as it is a generic
function that can be used by other drivers as well.

Signed-off-by: Angela Czubak <acz@semihalf.com>
---
 drivers/hid/hid-core.c       | 39 ++++++++++++++++++++++++++++++++++++
 drivers/hid/hid-multitouch.c | 38 +++--------------------------------
 include/linux/hid.h          |  1 +
 3 files changed, 43 insertions(+), 35 deletions(-)

diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
index dbed2524fd47..c11cb7324157 100644
--- a/drivers/hid/hid-core.c
+++ b/drivers/hid/hid-core.c
@@ -1796,6 +1796,45 @@ int hid_report_raw_event(struct hid_device *hid, int type, u8 *data, u32 size,
 }
 EXPORT_SYMBOL_GPL(hid_report_raw_event);
 
+/**
+ * hid_get_feature - retrieve feature report from device
+ *
+ * @hdev: hid device
+ * @report: hid report to retrieve
+ */
+void hid_get_feature(struct hid_device *hdev, struct hid_report *report)
+{
+	int ret;
+	u32 size = hid_report_len(report);
+	u8 *buf;
+
+	/*
+	 * Do not fetch the feature report if the device has been explicitly
+	 * marked as non-capable.
+	 */
+	if (hdev->quirks & HID_QUIRK_NO_INIT_REPORTS)
+		return;
+
+	buf = hid_alloc_report_buf(report, GFP_KERNEL);
+	if (!buf)
+		return;
+
+	ret = hid_hw_raw_request(hdev, report->id, buf, size,
+				 HID_FEATURE_REPORT, HID_REQ_GET_REPORT);
+	if (ret < 0) {
+		dev_warn(&hdev->dev, "failed to fetch feature %d\n",
+			 report->id);
+	} else {
+		ret = hid_report_raw_event(hdev, HID_FEATURE_REPORT, buf,
+					   size, 0);
+		if (ret)
+			dev_warn(&hdev->dev, "failed to report feature\n");
+	}
+
+	kfree(buf);
+}
+EXPORT_SYMBOL_GPL(hid_get_feature);
+
 /**
  * hid_input_report - report data from lower layer (usb, bt...)
  *
diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
index 082376a6cb3d..7beb3dfc3e67 100644
--- a/drivers/hid/hid-multitouch.c
+++ b/drivers/hid/hid-multitouch.c
@@ -434,38 +434,6 @@ static const struct attribute_group mt_attribute_group = {
 	.attrs = sysfs_attrs
 };
 
-static void mt_get_feature(struct hid_device *hdev, struct hid_report *report)
-{
-	int ret;
-	u32 size = hid_report_len(report);
-	u8 *buf;
-
-	/*
-	 * Do not fetch the feature report if the device has been explicitly
-	 * marked as non-capable.
-	 */
-	if (hdev->quirks & HID_QUIRK_NO_INIT_REPORTS)
-		return;
-
-	buf = hid_alloc_report_buf(report, GFP_KERNEL);
-	if (!buf)
-		return;
-
-	ret = hid_hw_raw_request(hdev, report->id, buf, size,
-				 HID_FEATURE_REPORT, HID_REQ_GET_REPORT);
-	if (ret < 0) {
-		dev_warn(&hdev->dev, "failed to fetch feature %d\n",
-			 report->id);
-	} else {
-		ret = hid_report_raw_event(hdev, HID_FEATURE_REPORT, buf,
-					   size, 0);
-		if (ret)
-			dev_warn(&hdev->dev, "failed to report feature\n");
-	}
-
-	kfree(buf);
-}
-
 static void mt_feature_mapping(struct hid_device *hdev,
 		struct hid_field *field, struct hid_usage *usage)
 {
@@ -473,7 +441,7 @@ static void mt_feature_mapping(struct hid_device *hdev,
 
 	switch (usage->hid) {
 	case HID_DG_CONTACTMAX:
-		mt_get_feature(hdev, field->report);
+		hid_get_feature(hdev, field->report);
 
 		td->maxcontacts = field->value[0];
 		if (!td->maxcontacts &&
@@ -490,7 +458,7 @@ static void mt_feature_mapping(struct hid_device *hdev,
 			break;
 		}
 
-		mt_get_feature(hdev, field->report);
+		hid_get_feature(hdev, field->report);
 		if (field->value[usage->usage_index] == MT_BUTTONTYPE_CLICKPAD)
 			td->is_buttonpad = true;
 
@@ -498,7 +466,7 @@ static void mt_feature_mapping(struct hid_device *hdev,
 	case 0xff0000c5:
 		/* Retrieve the Win8 blob once to enable some devices */
 		if (usage->usage_index == 0)
-			mt_get_feature(hdev, field->report);
+			hid_get_feature(hdev, field->report);
 		break;
 	}
 }
diff --git a/include/linux/hid.h b/include/linux/hid.h
index 70679bf820ce..fce7966234de 100644
--- a/include/linux/hid.h
+++ b/include/linux/hid.h
@@ -1219,6 +1219,7 @@ static inline u32 hid_report_len(struct hid_report *report)
 
 int hid_report_raw_event(struct hid_device *hid, int type, u8 *data, u32 size,
 		int interrupt);
+void hid_get_feature(struct hid_device *hdev, struct hid_report *report);
 
 /* HID quirks API */
 unsigned long hid_lookup_quirk(const struct hid_device *hdev);
-- 
2.34.1.307.g9b7440fafd-goog

