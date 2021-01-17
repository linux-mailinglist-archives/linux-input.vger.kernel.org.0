Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E61F2F9626
	for <lists+linux-input@lfdr.de>; Mon, 18 Jan 2021 00:13:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730649AbhAQXLt (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 17 Jan 2021 18:11:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730652AbhAQXLk (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 17 Jan 2021 18:11:40 -0500
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C677EC061795
        for <linux-input@vger.kernel.org>; Sun, 17 Jan 2021 15:10:14 -0800 (PST)
Received: by mail-pl1-x62e.google.com with SMTP id x18so7629266pln.6
        for <linux-input@vger.kernel.org>; Sun, 17 Jan 2021 15:10:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gaikai-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=x0BuXTWkArDlqfqioCwm5vVz3GfNigyWL9R0UefkgXw=;
        b=DdZg8HpAIrkuyRvZP1HrGvSpXB6MS0sGuMVTAjdCAVYANnv6GNIfWlTPLkwOqp+pxX
         TLXrhOazxsCAQ0neVSB343PMzYJ3sX5IT+uNzFuebNRt+oAmRfJNLO0tGb5CzSsujyll
         dketnmkadcbmrxSc78+Gb5BSx4ss4qRtaSGxIsa4HEYIlIm+NBqhRY+UCk6ZrTSc/now
         QpPb6wVZ0518UIMuf2X+nSd9Qt9/hcgCPpiuAdG3wZg21O6zPst8NL8Z+YN5v80xg0xU
         ioxJ9bAtPFcReMdecLrwq6cK/lWs51Ku2scJPnA3qARk0Mnm9/KCjd8DeRI3tuTEiY4E
         uCFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=x0BuXTWkArDlqfqioCwm5vVz3GfNigyWL9R0UefkgXw=;
        b=k65WmhafJfk772qqpzcn/jtAgeno4kAzptw65WwJ/EUz4sFKSaMV6QFv/b551HlO8C
         kZ22m2gDZXLl7ku7fCoZABHCX0nFzpUWJUrVjaYzFN3pRMP39vFFu1iigrbf/dil2EZ/
         WaGX/ozkTafBwJpy4zQFLMujugxn/vx6f1qe51jaLWk+kSFa9sNVE1kQR35QBlGzE+mJ
         cKfMP0WepPOKuAN+yDAdhZZWuRH0prn45DFL/uLnMdPzsvwQh5Gp1HRe4JjSI30RLbJ6
         KCrgiUDYqpd3s/uCa3WgbCef0f49PJYvi+v6rCveL5m334rkhGBNjfz/XXnxpgEIw+Wp
         d7AA==
X-Gm-Message-State: AOAM530lSXtXPzuQQf0WPeSX0ozXfjVZy0IqmYHvmhzq8jmWu1zX3sOT
        ec+iEXB+Z6OGgFHrS0REgLc2LQ==
X-Google-Smtp-Source: ABdhPJy1KpDtpXUiXCYqlU4IhqT9fLnuhXxiMQFrE/QAvYaFsXikZEn2KVQlhlbNRYNi0FSqgp414Q==
X-Received: by 2002:a17:902:9b89:b029:dc:1661:ae41 with SMTP id y9-20020a1709029b89b02900dc1661ae41mr23604218plp.63.1610925014377;
        Sun, 17 Jan 2021 15:10:14 -0800 (PST)
Received: from us8c16456344dc.lan (cpe-76-87-77-78.socal.res.rr.com. [76.87.77.78])
        by smtp.gmail.com with ESMTPSA id g3sm14018746pjt.34.2021.01.17.15.10.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jan 2021 15:10:13 -0800 (PST)
From:   Roderick Colenbrander <roderick@gaikai.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-input@vger.kernel.org, Chris Ye <lzye@google.com>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Subject: [PATCH v3 12/12] HID: playstation: report DualSense hardware and firmware version.
Date:   Sun, 17 Jan 2021 15:09:56 -0800
Message-Id: <20210117230956.173031-13-roderick@gaikai.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210117230956.173031-1-roderick@gaikai.com>
References: <20210117230956.173031-1-roderick@gaikai.com>
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
index 1cfad1f40b4e..ea5d3e69687c 100644
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

