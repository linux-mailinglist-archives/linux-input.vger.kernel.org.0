Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC4FA2F9668
	for <lists+linux-input@lfdr.de>; Mon, 18 Jan 2021 00:48:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729789AbhAQXsG (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 17 Jan 2021 18:48:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730848AbhAQXp1 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 17 Jan 2021 18:45:27 -0500
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 946C3C061575
        for <linux-input@vger.kernel.org>; Sun, 17 Jan 2021 15:44:47 -0800 (PST)
Received: by mail-pg1-x534.google.com with SMTP id n10so9815893pgl.10
        for <linux-input@vger.kernel.org>; Sun, 17 Jan 2021 15:44:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gaikai-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8tDfgF4yjcWQcgWJ7Sr76cZF+mLnOj0iP8FJiIQgK3A=;
        b=cNavsa6q9k2W6J5qridkosCUAE3AmUrtqBxXckS6X0PiM6evTFLVUKxWJrbqhuErt/
         Bu+vk5bkKR4lXVpC3/6/YKWYbcsOzFxKk7cOPNvHZW/VCz9f/A/NsfbOd+hcgEkoFsQK
         AUNcFPm3IVWsBLwrtp7+dJQZQeX/DtFbBGeIymjc21vbL0paomczvHJ8bRLOOh72je0Q
         iKmWA5PvwMPZ4ftIKISWsEBSWUMjWyE5/fJzM+/mW1Au2jjyhyP5rpPyFTRyPDakXxgR
         m2Wo9e9ZoIqGJmCxZahefd/6vZ8LprDTBfjua57dgMaLBKrc/9ysqB0qgTcOZXk44XrF
         5OWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8tDfgF4yjcWQcgWJ7Sr76cZF+mLnOj0iP8FJiIQgK3A=;
        b=GgzHj1eFv24B3BKuYqi+gBKKjAhwjYQuLxQe09v/ZhO5LH/WZBEa/XUScHuU3vKJCH
         3VYrr91pRjxeZnKF3OyceKDj+/45QLlMMQMLn6/3524nQ79ARvIx9NRHKj455luCuoij
         vb4BCzhkuCrwJQLfqYwqayqj7dWwzWtNbOCKmdR4PovePVzZvteQdU54nNsTVWht04nX
         /zq4t9c0ZErdm2nzgwQ3zOC9C4Q9OtDQqMXX+DmTEd0OCRH4GVjekQbCxaAVXa6NT3zX
         seHC+Ng4z4ohHNwrrpkf09n/zstjtiIVcB40w1AuTKhBnjkcHrhCERuiRjVnhpAh6Vrz
         DKfQ==
X-Gm-Message-State: AOAM530MGCuGwCTPqQDJYfhWmZ3gBNaXfvtHYftQJvGcynMbFOhVSXeB
        6LS8ByKxV8t+WXLCM+oXsAnicDnPUCjGKw==
X-Google-Smtp-Source: ABdhPJzbNlt51YeMJRc5MI7wNVJGjtNP2AveEta8qGHe2R51Clf4ICEms4CXPhERKwlVJH8Fd1knQA==
X-Received: by 2002:aa7:8ad0:0:b029:1a9:3a46:78d1 with SMTP id b16-20020aa78ad00000b02901a93a4678d1mr23720532pfd.77.1610927087173;
        Sun, 17 Jan 2021 15:44:47 -0800 (PST)
Received: from us8c16456344dc.lan (cpe-76-87-77-78.socal.res.rr.com. [76.87.77.78])
        by smtp.gmail.com with ESMTPSA id i2sm14721568pjd.21.2021.01.17.15.44.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jan 2021 15:44:46 -0800 (PST)
From:   Roderick Colenbrander <roderick@gaikai.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-input@vger.kernel.org, Chris Ye <lzye@google.com>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Subject: [PATCH v4 02/13] HID: playstation: use DualSense MAC address as unique identifier.
Date:   Sun, 17 Jan 2021 15:44:24 -0800
Message-Id: <20210117234435.180294-3-roderick@gaikai.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210117234435.180294-1-roderick@gaikai.com>
References: <20210117234435.180294-1-roderick@gaikai.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Roderick Colenbrander <roderick.colenbrander@sony.com>

Use the DualSense MAC address as a unique identifier for the HID device.

Signed-off-by: Roderick Colenbrander <roderick.colenbrander@sony.com>
---
 drivers/hid/hid-playstation.c | 57 +++++++++++++++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/drivers/hid/hid-playstation.c b/drivers/hid/hid-playstation.c
index 46d5f5b3b0dd..2f24039dedbe 100644
--- a/drivers/hid/hid-playstation.c
+++ b/drivers/hid/hid-playstation.c
@@ -20,6 +20,7 @@
 /* Base class for playstation devices. */
 struct ps_device {
 	struct hid_device *hdev;
+	uint8_t mac_address[6]; /* Note: stored in little endian order. */
 
 	int (*parse_report)(struct ps_device *dev, struct hid_report *report, u8 *data, int size);
 };
@@ -27,6 +28,9 @@ struct ps_device {
 #define DS_INPUT_REPORT_USB			0x01
 #define DS_INPUT_REPORT_USB_SIZE		64
 
+#define DS_FEATURE_REPORT_PAIRING_INFO		0x09
+#define DS_FEATURE_REPORT_PAIRING_INFO_SIZE	20
+
 /* Button masks for DualSense input report. */
 #define DS_BUTTONS0_HAT_SWITCH	GENMASK(3, 0)
 #define DS_BUTTONS0_SQUARE	BIT(4)
@@ -166,6 +170,52 @@ static struct input_dev *ps_gamepad_create(struct hid_device *hdev)
 	return gamepad;
 }
 
+static int ps_get_report(struct hid_device *hdev, uint8_t report_id, uint8_t *buf, size_t size)
+{
+	int ret;
+
+	ret = hid_hw_raw_request(hdev, report_id, buf, size, HID_FEATURE_REPORT, HID_REQ_GET_REPORT);
+	if (ret < 0) {
+		hid_err(hdev, "Failed to retrieve feature with reportID %d: %d\n", report_id, ret);
+		return ret;
+	}
+
+	if (ret != size) {
+		hid_err(hdev, "Invalid byte count transferred, expected %zu got %d\n", size, ret);
+		return -EINVAL;
+	}
+
+	if (buf[0] != report_id) {
+		hid_err(hdev, "Incorrect reportID received, expected %d got %d\n", report_id, buf[0]);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int dualsense_get_mac_address(struct dualsense *ds)
+{
+	uint8_t *buf;
+	int ret = 0;
+
+	buf = kzalloc(DS_FEATURE_REPORT_PAIRING_INFO_SIZE, GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
+
+	ret = ps_get_report(ds->base.hdev, DS_FEATURE_REPORT_PAIRING_INFO, buf,
+			DS_FEATURE_REPORT_PAIRING_INFO_SIZE);
+	if (ret) {
+		hid_err(ds->base.hdev, "Failed to retrieve DualSense pairing info: %d\n", ret);
+		goto err_free;
+	}
+
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
@@ -237,6 +287,13 @@ static struct ps_device *dualsense_create(struct hid_device *hdev)
 	ds->base.parse_report = dualsense_parse_report;
 	hid_set_drvdata(hdev, ds);
 
+	ret = dualsense_get_mac_address(ds);
+	if (ret) {
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

