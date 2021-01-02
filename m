Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB3922E88FC
	for <lists+linux-input@lfdr.de>; Sat,  2 Jan 2021 23:33:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726785AbhABWcQ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 2 Jan 2021 17:32:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726733AbhABWcQ (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sat, 2 Jan 2021 17:32:16 -0500
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DDBBC0613CF
        for <linux-input@vger.kernel.org>; Sat,  2 Jan 2021 14:31:36 -0800 (PST)
Received: by mail-pj1-x1032.google.com with SMTP id lb18so7606602pjb.5
        for <linux-input@vger.kernel.org>; Sat, 02 Jan 2021 14:31:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gaikai-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HPQz+QwfnJyzFbnRyga6cbDeTR0CM+5fgXx2r5TdQE4=;
        b=G5KeXsmgKi/9Uew52Mz7zqlOxuFn08avf7ndreNBzbKBfnNjvL4tMvvDr+Vs5RQXUN
         Hrmvi/U9fEi8sC4ds8TZxQKHv0M3oIaORT3YqtSdc8LFPwKVmDRN7KHYZ3MC1Y5G3RN0
         7jNVNJEYjIpA9ci/NP26lUyvFRsemmJTn1irT/QvrVhQQZviqHgmMuW58AgLPrS2mfHs
         NsBrtY5AiKmUK64m+/supKU22TRytVQ3WsUcM0fOaVXQ3vBEMRUNH/eFWOH06Y8PhWJN
         +/rCemNR/DbnUz4KQdNXnx4hGQrfbEVOsFpJ0w8r2SqGht+ODTedPG5gXef+mKWBxFf8
         jELQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HPQz+QwfnJyzFbnRyga6cbDeTR0CM+5fgXx2r5TdQE4=;
        b=TIuNE9J1GQ2mROxkYaJvoykzCsTwQwDxPYIGgdlT1p9551XBWZraK9EsZ27uUNKKAf
         odlIkgVdkF8d39N+WdGf5sSJ64ZotwGy5OQdM/4rlBwndRDYHaCS6Psc7Q1o3/yA96jD
         A3URpqht1SPCE70og/kf/55h9lNlMACqcR4tDye7LAAB21vq7J9RFjfSafRSHGyTy+vL
         LA1KlU7YmT4b+Rc3G9C5hqoA24iX9epZtczInP6WvMP18igXSJfxJxASgG131dF+XxSZ
         btoaw8dXhaNTglIRWYC/4pu22QAq+ic+c0909d7F/gb2zKh5RuL+8cPj/Vve2jfpAXic
         Mwfw==
X-Gm-Message-State: AOAM533aawWddg27p0kJJcyxwvYmqFDjtwf4fXWUabchX1GR+VL/Njcv
        p9rF5lSAwA7mQJdzNLOs3hlpbw==
X-Google-Smtp-Source: ABdhPJwILHGWq1+jMBg6z39gd56DLI7KQi4345qNTOhJQBYAlFIyzUiCvBcIuouvJh9d6nngQXqTPQ==
X-Received: by 2002:a17:90a:fa81:: with SMTP id cu1mr23307965pjb.39.1609626695533;
        Sat, 02 Jan 2021 14:31:35 -0800 (PST)
Received: from localhost.localdomain (cpe-76-87-77-78.socal.res.rr.com. [76.87.77.78])
        by smtp.gmail.com with ESMTPSA id r20sm49537931pgb.3.2021.01.02.14.31.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Jan 2021 14:31:35 -0800 (PST)
From:   Roderick Colenbrander <roderick@gaikai.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-input@vger.kernel.org, Chris Ye <lzye@google.com>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Subject: [PATCH v2 02/13] HID: playstation: use DualSense MAC address as unique identifier.
Date:   Sat,  2 Jan 2021 14:30:58 -0800
Message-Id: <20210102223109.996781-3-roderick@gaikai.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210102223109.996781-1-roderick@gaikai.com>
References: <20210102223109.996781-1-roderick@gaikai.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Roderick Colenbrander <roderick.colenbrander@sony.com>

Use the DualSense MAC address as a unique identifier for the HID device.

Signed-off-by: Roderick Colenbrander <roderick.colenbrander@sony.com>
---
 drivers/hid/hid-playstation.c | 40 +++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/drivers/hid/hid-playstation.c b/drivers/hid/hid-playstation.c
index 3d5fe9069c26..af4a635997bb 100644
--- a/drivers/hid/hid-playstation.c
+++ b/drivers/hid/hid-playstation.c
@@ -21,12 +21,16 @@
 /* Base class for playstation devices. */
 struct ps_device {
 	struct hid_device *hdev;
+	uint8_t mac_address[6];
 
 	int (*parse_report)(struct ps_device *dev, struct hid_report *report, u8 *data, int size);
 };
 
 #define DS_INPUT_REPORT_USB			0x01
 
+#define DS_FEATURE_REPORT_PAIRING_INFO		9
+#define DS_FEATURE_REPORT_PAIRING_INFO_SIZE	19
+
 /* Button masks for DualSense input report. */
 #define DS_BUTTONS0_HAT_SWITCH	GENMASK(3, 0)
 #define DS_BUTTONS0_SQUARE	BIT(4)
@@ -132,6 +136,7 @@ static struct input_dev *ps_allocate_input_dev(struct hid_device *hdev, const ch
 	return input_dev;
 }
 
+
 static struct input_dev *ps_gamepad_create(struct hid_device *hdev)
 {
 	struct input_dev *gamepad;
@@ -162,6 +167,34 @@ static struct input_dev *ps_gamepad_create(struct hid_device *hdev)
 	return gamepad;
 }
 
+static int dualsense_get_mac_address(struct dualsense *ds)
+{
+	uint8_t *buf;
+	int ret = 0;
+
+	buf = kzalloc(DS_FEATURE_REPORT_PAIRING_INFO_SIZE, GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
+
+	ret = hid_hw_raw_request(ds->base.hdev, DS_FEATURE_REPORT_PAIRING_INFO, buf,
+			DS_FEATURE_REPORT_PAIRING_INFO_SIZE, HID_FEATURE_REPORT,
+			HID_REQ_GET_REPORT);
+	if (ret < 0)
+		goto err_free;
+	else if (ret != DS_FEATURE_REPORT_PAIRING_INFO_SIZE) {
+		hid_err(ds->base.hdev, "failed to retrieve DualSense pairing info\n");
+		ret = -EINVAL;
+		goto err_free;
+	}
+
+	/* Note MAC address is stored in little endian order. */
+	memcpy(ds->base.mac_address, &buf[1], sizeof(ds->base.mac_address));
+
+err_free:
+	kfree(buf);
+	return ret;
+}
+
 static int dualsense_parse_report(struct ps_device *ps_dev, struct hid_report *report,
 		u8 *data, int size)
 {
@@ -230,6 +263,13 @@ static struct ps_device *dualsense_create(struct hid_device *hdev)
 	ds->base.parse_report = dualsense_parse_report;
 	hid_set_drvdata(hdev, ds);
 
+	ret = dualsense_get_mac_address(ds);
+	if (ret < 0) {
+		hid_err(hdev, "Failed to get MAC address from DualSense\n");
+		return ERR_PTR(ret);
+	}
+	snprintf(hdev->uniq, sizeof(hdev->uniq), "%pMR", ds->base.mac_address);
+
 	ds->gamepad = ps_gamepad_create(hdev);
 	if (IS_ERR(ds->gamepad)) {
 		ret = PTR_ERR(ds->gamepad);
-- 
2.26.2

