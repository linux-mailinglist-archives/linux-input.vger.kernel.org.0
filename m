Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B72AB2DED7F
	for <lists+linux-input@lfdr.de>; Sat, 19 Dec 2020 07:25:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726364AbgLSGZF (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 19 Dec 2020 01:25:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726359AbgLSGZF (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 19 Dec 2020 01:25:05 -0500
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5530C0611D0
        for <linux-input@vger.kernel.org>; Fri, 18 Dec 2020 22:23:53 -0800 (PST)
Received: by mail-pl1-x630.google.com with SMTP id y8so2572906plp.8
        for <linux-input@vger.kernel.org>; Fri, 18 Dec 2020 22:23:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gaikai-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=prj0nK0FrTjGXU4NbNrumDmVWMV2ie4EYkuv3L1sDDc=;
        b=gK7O/TiSoCz4TaK/yeMhZwmT7BbXOKdfuzSZ9hI7Z7M1LxSwY6jWzyiyQADcAQKLG9
         UpItUfdzawu2KqiZi2W2jJe+DQr8MZNu+4NzWQnGf4kaHHWIfUfj8ySzj7uYnaQKqEUr
         gdIH9JYbGlMg23yhfb0KZrWT8hHLi69zehGrCR60foYWRTZZeNiUy2YRI6beTj0ymUmG
         09spwvgd/yNYDkIzG7JiBmYNzqPfUrSjNb9Vi7+tPakQ6nEwW3vBgOEjriJW2uR5Klw6
         HE3miDpX/GXilF8A9UxUBGn2esfDgQ6+Uhy8S7yE6nWzkRSaVNKzWS80kND8mBtVh4bN
         lqIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=prj0nK0FrTjGXU4NbNrumDmVWMV2ie4EYkuv3L1sDDc=;
        b=YZW73QppKdbvpm+K6aZimTHg2IKG4rNgFjdUIqBF4RVPXpTsCRG9wsHGF7kLJzBTUX
         2Q5ZDf6mEXAHjjkxbJyZOp17zrw3zO6/AISey0378WsHblkzOZM++jKMSA0UnVfkmjr2
         w5TA+/g/7qNVHYdptb+tihkLSRr/T7MZr2IAoGPs1t0d4fBEc2BED/WfmWvsqLg+VN/Z
         fJw6CJPtflhUeJl63G/MWX2S9Jw5Z2puQvXSs70LC0UTbieMawuWw6u5CjdOfbdEGIBt
         aO1QnqFUr9U4wH0VUaoS7Kbx8fKVULYENiVZhkVRqSXudoryE0ogC0Eh32/0IZzDycTa
         +z5g==
X-Gm-Message-State: AOAM5335YzBydM2cBgJLip5emzgxw12lFKr+0Je+OyvjUjqavTcgCLPq
        0Li2+LBatfWMe9kuJOZ1v/7m4Q==
X-Google-Smtp-Source: ABdhPJzD6aLtrraKrTzn49VSWKS/4GOvHQCAFt6df7uOPTlumxqJUtUocbpuw1cbdkOUwZIDeY9Kpw==
X-Received: by 2002:a17:90a:f3c5:: with SMTP id ha5mr7734448pjb.61.1608359033385;
        Fri, 18 Dec 2020 22:23:53 -0800 (PST)
Received: from localhost.localdomain (cpe-76-87-77-78.socal.res.rr.com. [76.87.77.78])
        by smtp.gmail.com with ESMTPSA id bf3sm9655302pjb.45.2020.12.18.22.23.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Dec 2020 22:23:53 -0800 (PST)
From:   Roderick Colenbrander <roderick@gaikai.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-input@vger.kernel.org, Chris Ye <lzye@google.com>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Subject: [PATCH 13/13] HID: playstation: report DualSense hardware and firmware version.
Date:   Fri, 18 Dec 2020 22:23:36 -0800
Message-Id: <20201219062336.72568-14-roderick@gaikai.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201219062336.72568-1-roderick@gaikai.com>
References: <20201219062336.72568-1-roderick@gaikai.com>
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
index a55375ac79a9..2f989da906f3 100644
--- a/drivers/hid/hid-playstation.c
+++ b/drivers/hid/hid-playstation.c
@@ -36,6 +36,8 @@ struct ps_device {
 	int battery_status;
 
 	uint8_t mac_address[6];
+	uint32_t hw_version;
+	uint32_t fw_version;
 
 	int (*parse_report)(struct ps_device *dev, struct hid_report *report, u8 *data, int size);
 };
@@ -63,6 +65,8 @@ struct ps_led_info {
 #define DS_FEATURE_REPORT_CALIBRATION_SIZE	41
 #define DS_FEATURE_REPORT_PAIRING_INFO		9
 #define DS_FEATURE_REPORT_PAIRING_INFO_SIZE	19
+#define DS_FEATURE_REPORT_FIRMWARE_INFO		32
+#define DS_FEATURE_REPORT_FIRMWARE_INFO_SIZE	64
 
 /* Button masks for DualSense input report. */
 #define DS_BUTTONS0_HAT_SWITCH	GENMASK(3, 0)
@@ -585,6 +589,40 @@ static struct input_dev *ps_touchpad_create(struct hid_device *hdev, int width,
 	return touchpad;
 }
 
+static ssize_t ps_show_firmware_version(struct device *dev,
+				struct device_attribute
+				*attr, char *buf)
+{
+	struct hid_device *hdev = to_hid_device(dev);
+	struct ps_device *ps_dev = hid_get_drvdata(hdev);
+
+	return snprintf(buf, PAGE_SIZE, "0x%08x\n", ps_dev->fw_version);
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
+	return snprintf(buf, PAGE_SIZE, "0x%08x\n", ps_dev->hw_version);
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
@@ -683,6 +721,29 @@ static int dualsense_get_calibration_data(struct dualsense *ds)
 	return ret;
 }
 
+static int dualsense_get_firmware_info(struct dualsense *ds)
+{
+	uint8_t *buf;
+	int ret = 0;
+
+	buf = kzalloc(DS_FEATURE_REPORT_FIRMWARE_INFO_SIZE, GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
+
+	ret = hid_hw_raw_request(ds->base.hdev, DS_FEATURE_REPORT_FIRMWARE_INFO, buf,
+			DS_FEATURE_REPORT_FIRMWARE_INFO_SIZE, HID_FEATURE_REPORT,
+			HID_REQ_GET_REPORT);
+	if (ret < 0)
+		goto err_free;
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
@@ -1172,6 +1233,12 @@ static struct ps_device *dualsense_create(struct hid_device *hdev)
 	}
 	snprintf(hdev->uniq, sizeof(hdev->uniq), "%pMR", ds->base.mac_address);
 
+	ret = dualsense_get_firmware_info(ds);
+	if (ret < 0) {
+		hid_err(hdev, "Failed to get firmware info from DualSense\n");
+		return ERR_PTR(ret);
+	}
+
 	ret = ps_devices_list_add((struct ps_device *)ds);
 	if (ret < 0)
 		return ERR_PTR(ret);
@@ -1241,6 +1308,12 @@ static struct ps_device *dualsense_create(struct hid_device *hdev)
 	/* Set player LEDs to our player id. */
 	dualsense_set_player_leds(ds);
 
+	/* Reporting hardware and firmware is important as there are frequent updates, which
+	 * can change behavior.
+	 */
+	hid_info(hdev, "Registered DualSense controller hw_version=%x fw_version=%x\n",
+			ds->base.hw_version, ds->base.fw_version);
+
 	return (struct ps_device *)ds;
 
 err:
@@ -1295,6 +1368,12 @@ static int ps_probe(struct hid_device *hdev, const struct hid_device_id *id)
 		goto err_close;
 	}
 
+	ret = sysfs_create_group(&hdev->dev.kobj, &ps_device_attribute_group);
+	if (ret < 0) {
+		hid_err(hdev, "Failed to register sysfs nodes.\n");
+		goto err_close;
+	}
+
 	return ret;
 
 err_close:
@@ -1313,6 +1392,8 @@ static void ps_remove(struct hid_device *hdev)
 
 	hid_hw_close(hdev);
 	hid_hw_stop(hdev);
+
+	sysfs_remove_group(&hdev->dev.kobj, &ps_device_attribute_group);
 }
 
 static const struct hid_device_id ps_devices[] = {
-- 
2.26.2

