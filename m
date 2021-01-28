Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01451307C7E
	for <lists+linux-input@lfdr.de>; Thu, 28 Jan 2021 18:31:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232833AbhA1Ra3 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 28 Jan 2021 12:30:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233181AbhA1R2W (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 28 Jan 2021 12:28:22 -0500
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60236C061355
        for <linux-input@vger.kernel.org>; Thu, 28 Jan 2021 09:27:20 -0800 (PST)
Received: by mail-pg1-x532.google.com with SMTP id t25so4733267pga.2
        for <linux-input@vger.kernel.org>; Thu, 28 Jan 2021 09:27:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gaikai-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vHFPu3zG939YEPCLvVxBY9M6kmC962o/kJ1ByNn/dqU=;
        b=AjAh8nN+BXlYqsWWIucibm+2HhED9ZqTlqQXLxHlkzJhG/73oi5YohyulrDUMiF5Ce
         rocV7Ic2VvrD6QMsGNjxz5M35M+gALx7YkNg4UJxEDXj2zdnKMSIcRcVZB9KSt4wNIxd
         janEnxmf/KYea0V7zLjQUELsmfssky7DP5tRSpvI9lYxG3WeYWE8Cn1RUS3hbKT1k8uO
         3d/MR3vUr0l8XRRpAQNoX0+dOi+pZpTv/h1t8R3s/+joBpB74hEj8GfzlDLspm376EPe
         s4l33Kdk5GrjliG9Xs3PKJsIigJOKxypksRPj+hJBhzTK548NwnAnNeN6FVJD3l8yKg8
         B8rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vHFPu3zG939YEPCLvVxBY9M6kmC962o/kJ1ByNn/dqU=;
        b=MOx5FWkSmq8387EpDt7PhdqtTUKatSFKKBKGRwZZ1+jvrCh3GQP2u8wZO51Puwe7fw
         JA/ppfXM24bnYmcU3ovAU5QnAyYcC7i5WM+DlWt3CvGuITp7Sct6YD6HOJ+Rxwtu9fFZ
         XAICZ7WwWbzJaiEOUHvb3HwyAdYAVDEVlGc7LTNmGN911JNxZ6Fyn/sQszbrKjSUv+uT
         V3iht6OvttVw17e03Um6JdQkVcOA42Kiq2PJ9ESWWaBnO6QG5TtRV2aTj+vYK+kVAbcT
         BzhnCYER+HOPZa9+lNyvGzG0RCtDh4woKj4vsJqWmQ7m1kbydT4IbBgUJ8J+w1rXMik8
         mxfw==
X-Gm-Message-State: AOAM532QSYuu25n+yJVbCO+ETKNgUdQUfEE2thhc/c5I7/iRyTUcxKe1
        bOWlmJpoYTIhBn2RjKcKFXFV8w==
X-Google-Smtp-Source: ABdhPJzVKbCiBMt8L8AUZRlcUAIhBb0Cd1++i3eb0Sdea0Fcve+qeqHel7CcfMoDKlUW4XNnMW1PvQ==
X-Received: by 2002:a63:c042:: with SMTP id z2mr522042pgi.201.1611854839977;
        Thu, 28 Jan 2021 09:27:19 -0800 (PST)
Received: from us8c16456344dc.lan (cpe-76-87-77-78.socal.res.rr.com. [76.87.77.78])
        by smtp.gmail.com with ESMTPSA id a31sm6190445pgb.93.2021.01.28.09.27.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Jan 2021 09:27:19 -0800 (PST)
From:   Roderick Colenbrander <roderick@gaikai.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-input@vger.kernel.org, Chris Ye <lzye@google.com>,
        =?UTF-8?q?Barnab=C3=A1s=20P=C5=91cze?= <pobrn@protonmail.com>,
        =?UTF-8?q?Samuel=20=C4=8Cavoj?= <sammko@sammserver.com>,
        =?UTF-8?q?Florian=20M=C3=A4rkl?= <linux@florianmaerkl.de>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Subject: [PATCH v5 13/13] HID: playstation: report DualSense hardware and firmware version.
Date:   Thu, 28 Jan 2021 09:26:57 -0800
Message-Id: <20210128172657.24516-14-roderick@gaikai.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210128172657.24516-1-roderick@gaikai.com>
References: <20210128172657.24516-1-roderick@gaikai.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Roderick Colenbrander <roderick.colenbrander@sony.com>

Retrieve DualSense hardware and firmware information using a vendor
specific feature report. Report the data through sysfs and also
report using hid_info as there can be signficant differences between
versions.

Signed-off-by: Roderick Colenbrander <roderick.colenbrander@sony.com>
---
 drivers/hid/hid-playstation.c | 81 +++++++++++++++++++++++++++++++++++
 1 file changed, 81 insertions(+)

diff --git a/drivers/hid/hid-playstation.c b/drivers/hid/hid-playstation.c
index 8d827d78fa65..354c81f83d10 100644
--- a/drivers/hid/hid-playstation.c
+++ b/drivers/hid/hid-playstation.c
@@ -41,6 +41,8 @@ struct ps_device {
 	int battery_status;
 
 	uint8_t mac_address[6]; /* Note: stored in little endian order. */
+	uint32_t hw_version;
+	uint32_t fw_version;
 
 	int (*parse_report)(struct ps_device *dev, struct hid_report *report, u8 *data, int size);
 };
@@ -77,6 +79,8 @@ struct ps_led_info {
 #define DS_FEATURE_REPORT_CALIBRATION_SIZE	41
 #define DS_FEATURE_REPORT_PAIRING_INFO		0x09
 #define DS_FEATURE_REPORT_PAIRING_INFO_SIZE	20
+#define DS_FEATURE_REPORT_FIRMWARE_INFO		0x20
+#define DS_FEATURE_REPORT_FIRMWARE_INFO_SIZE	64
 
 /* Button masks for DualSense input report. */
 #define DS_BUTTONS0_HAT_SWITCH	GENMASK(3, 0)
@@ -649,6 +653,40 @@ static struct input_dev *ps_touchpad_create(struct hid_device *hdev, int width,
 	return touchpad;
 }
 
+static ssize_t ps_show_firmware_version(struct device *dev,
+				struct device_attribute
+				*attr, char *buf)
+{
+	struct hid_device *hdev = to_hid_device(dev);
+	struct ps_device *ps_dev = hid_get_drvdata(hdev);
+
+	return sysfs_emit(buf, "0x%08x\n", ps_dev->fw_version);
+}
+
+static DEVICE_ATTR(firmware_version, 0444, ps_show_firmware_version, NULL);
+
+static ssize_t ps_show_hardware_version(struct device *dev,
+				struct device_attribute
+				*attr, char *buf)
+{
+	struct hid_device *hdev = to_hid_device(dev);
+	struct ps_device *ps_dev = hid_get_drvdata(hdev);
+
+	return sysfs_emit(buf, "0x%08x\n", ps_dev->hw_version);
+}
+
+static DEVICE_ATTR(hardware_version, 0444, ps_show_hardware_version, NULL);
+
+static struct attribute *ps_device_attributes[] = {
+	&dev_attr_firmware_version.attr,
+	&dev_attr_hardware_version.attr,
+	NULL
+};
+
+static const struct attribute_group ps_device_attribute_group = {
+	.attrs = ps_device_attributes,
+};
+
 static int dualsense_get_calibration_data(struct dualsense *ds)
 {
 	short gyro_pitch_bias, gyro_pitch_plus, gyro_pitch_minus;
@@ -739,6 +777,30 @@ static int dualsense_get_calibration_data(struct dualsense *ds)
 	return ret;
 }
 
+static int dualsense_get_firmware_info(struct dualsense *ds)
+{
+	uint8_t *buf;
+	int ret;
+
+	buf = kzalloc(DS_FEATURE_REPORT_FIRMWARE_INFO_SIZE, GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
+
+	ret = ps_get_report(ds->base.hdev, DS_FEATURE_REPORT_FIRMWARE_INFO, buf,
+			DS_FEATURE_REPORT_FIRMWARE_INFO_SIZE);
+	if (ret) {
+		hid_err(ds->base.hdev, "Failed to retrieve DualSense firmware info: %d\n", ret);
+		goto err_free;
+	}
+
+	ds->base.hw_version = get_unaligned_le32(&buf[24]);
+	ds->base.fw_version = get_unaligned_le32(&buf[28]);
+
+err_free:
+	kfree(buf);
+	return ret;
+}
+
 static int dualsense_get_mac_address(struct dualsense *ds)
 {
 	uint8_t *buf;
@@ -1240,6 +1302,12 @@ static struct ps_device *dualsense_create(struct hid_device *hdev)
 	}
 	snprintf(hdev->uniq, sizeof(hdev->uniq), "%pMR", ds->base.mac_address);
 
+	ret = dualsense_get_firmware_info(ds);
+	if (ret) {
+		hid_err(hdev, "Failed to get firmware info from DualSense\n");
+		return ERR_PTR(ret);
+	}
+
 	ret = ps_devices_list_add(ps_dev);
 	if (ret)
 		return ERR_PTR(ret);
@@ -1307,6 +1375,13 @@ static struct ps_device *dualsense_create(struct hid_device *hdev)
 	/* Set player LEDs to our player id. */
 	dualsense_set_player_leds(ds);
 
+	/*
+	 * Reporting hardware and firmware is important as there are frequent updates, which
+	 * can change behavior.
+	 */
+	hid_info(hdev, "Registered DualSense controller hw_version=0x%08x fw_version=0x%08x\n",
+			ds->base.hw_version, ds->base.fw_version);
+
 	return &ds->base;
 
 err:
@@ -1357,6 +1432,12 @@ static int ps_probe(struct hid_device *hdev, const struct hid_device_id *id)
 		}
 	}
 
+	ret = devm_device_add_group(&hdev->dev, &ps_device_attribute_group);
+	if (ret) {
+		hid_err(hdev, "Failed to register sysfs nodes.\n");
+		goto err_close;
+	}
+
 	return ret;
 
 err_close:
-- 
2.26.2

