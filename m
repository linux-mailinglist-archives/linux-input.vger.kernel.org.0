Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE8F42E8909
	for <lists+linux-input@lfdr.de>; Sat,  2 Jan 2021 23:33:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726877AbhABWc7 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 2 Jan 2021 17:32:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726864AbhABWc6 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sat, 2 Jan 2021 17:32:58 -0500
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B334DC0617A4
        for <linux-input@vger.kernel.org>; Sat,  2 Jan 2021 14:31:46 -0800 (PST)
Received: by mail-pg1-x52c.google.com with SMTP id p18so16321881pgm.11
        for <linux-input@vger.kernel.org>; Sat, 02 Jan 2021 14:31:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gaikai-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oKjqCLTfmOvhIqyV2uqxkRwWE4dM09kjKsdXcVc91Ao=;
        b=uDOSY4vx2nk8fSM2DQcf7vd4xjgb3kaOAe/oK2r0QRsTEXK+ScQiTnm/Q6zzWUAbjW
         ClHlXymJAXlveJpb/Vtctq/lx9s11Sq8PdqKizHUxxXtgrR46K1HUF97kLYUWzdgYCPf
         kQcbvOGC6UW06N3VZ6Mb8R8Fi1Ui1iTK7gxc+OGc8A/XWpcgxAROL4hkFqlZTJke8wJI
         fPjQlUJqEB5ZJZdLSHsjURL98Abh5Habnd36F8gDPonVpRYW3am7iDcKYfL376tJT4bz
         INOLL/rDWTdc8FYSmUGcMSmDQPP7aXzfe4x190i9UgnYm7bYa6muK/1k4zZIvwJwhOkU
         E5nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oKjqCLTfmOvhIqyV2uqxkRwWE4dM09kjKsdXcVc91Ao=;
        b=peJBPezpDZ1Clfnfbqp1rfS7iUy6MwUR52BftTfYZSjxMxOs6Clq+4R9S7+pEZMWb6
         wAoaz+NeoHAIFU5qnQkFh8XP3xrejxMvX6VCodh+vI9OtgWZN+EAgjqUb67HZjcyAaf3
         x3p816cT3Ux/9LjyXiT6pSnzmkfFfygkhBH/gpkzSh2eHEvGJVcoEfhy4PevDr/amX6V
         Y6Qjx+kNW5FjAyS0NPg93/+Ih4XNU1Lxa3hNY2mqRipB2eBXOj3wu7twi4QWKfyX6Bcc
         l8T0lBP4//bViL5/pKZMS6qkdAO44XudnjPTd17rzP0rH+sZznP6OQh3yf0UORhJup19
         VSog==
X-Gm-Message-State: AOAM532qJR/2dKjkRiO4Jhd6JuuBfyhhPXJYjsIiyEMbbQDaRYX3XPO3
        J+EMt/eW/IMFUXam6ql3z1KC7g==
X-Google-Smtp-Source: ABdhPJyu/soWfe+zhAgCZcgoi3FlnDcemmbhxuHjFfP/uifYH+63sP9Ei1N7g6smZPltdJq3WXKl5A==
X-Received: by 2002:a62:3002:0:b029:1aa:d858:cdd7 with SMTP id w2-20020a6230020000b02901aad858cdd7mr61235301pfw.1.1609626706284;
        Sat, 02 Jan 2021 14:31:46 -0800 (PST)
Received: from localhost.localdomain (cpe-76-87-77-78.socal.res.rr.com. [76.87.77.78])
        by smtp.gmail.com with ESMTPSA id r20sm49537931pgb.3.2021.01.02.14.31.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Jan 2021 14:31:45 -0800 (PST)
From:   Roderick Colenbrander <roderick@gaikai.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-input@vger.kernel.org, Chris Ye <lzye@google.com>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Subject: [PATCH v2 13/13] HID: playstation: report DualSense hardware and firmware version.
Date:   Sat,  2 Jan 2021 14:31:09 -0800
Message-Id: <20210102223109.996781-14-roderick@gaikai.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210102223109.996781-1-roderick@gaikai.com>
References: <20210102223109.996781-1-roderick@gaikai.com>
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
 drivers/hid/hid-playstation.c | 84 +++++++++++++++++++++++++++++++++++
 1 file changed, 84 insertions(+)

diff --git a/drivers/hid/hid-playstation.c b/drivers/hid/hid-playstation.c
index 1a95c81da8a3..8440af6d6cd7 100644
--- a/drivers/hid/hid-playstation.c
+++ b/drivers/hid/hid-playstation.c
@@ -41,6 +41,8 @@ struct ps_device {
 	int battery_status;
 
 	uint8_t mac_address[6];
+	uint32_t hw_version;
+	uint32_t fw_version;
 
 	int (*parse_report)(struct ps_device *dev, struct hid_report *report, u8 *data, int size);
 };
@@ -68,6 +70,8 @@ struct ps_led_info {
 #define DS_FEATURE_REPORT_CALIBRATION_SIZE	41
 #define DS_FEATURE_REPORT_PAIRING_INFO		9
 #define DS_FEATURE_REPORT_PAIRING_INFO_SIZE	19
+#define DS_FEATURE_REPORT_FIRMWARE_INFO		32
+#define DS_FEATURE_REPORT_FIRMWARE_INFO_SIZE	64
 
 /* Button masks for DualSense input report. */
 #define DS_BUTTONS0_HAT_SWITCH	GENMASK(3, 0)
@@ -593,6 +597,40 @@ static struct input_dev *ps_touchpad_create(struct hid_device *hdev, int width,
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
@@ -696,6 +734,34 @@ static int dualsense_get_calibration_data(struct dualsense *ds)
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
+	ret = hid_hw_raw_request(ds->base.hdev, DS_FEATURE_REPORT_FIRMWARE_INFO, buf,
+			DS_FEATURE_REPORT_FIRMWARE_INFO_SIZE, HID_FEATURE_REPORT,
+			HID_REQ_GET_REPORT);
+	if (ret < 0)
+		goto err_free;
+	else if (ret != DS_FEATURE_REPORT_FIRMWARE_INFO_SIZE) {
+		hid_err(ds->base.hdev, "failed to retrieve DualSense firmware info\n");
+		ret = -EINVAL;
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
@@ -1195,6 +1261,12 @@ static struct ps_device *dualsense_create(struct hid_device *hdev)
 	}
 	snprintf(hdev->uniq, sizeof(hdev->uniq), "%pMR", ds->base.mac_address);
 
+	ret = dualsense_get_firmware_info(ds);
+	if (ret < 0) {
+		hid_err(hdev, "Failed to get firmware info from DualSense\n");
+		return ERR_PTR(ret);
+	}
+
 	ret = ps_devices_list_add(ps_dev);
 	if (ret < 0)
 		return ERR_PTR(ret);
@@ -1261,6 +1333,12 @@ static struct ps_device *dualsense_create(struct hid_device *hdev)
 	/* Set player LEDs to our player id. */
 	dualsense_set_player_leds(ds);
 
+	/* Reporting hardware and firmware is important as there are frequent updates, which
+	 * can change behavior.
+	 */
+	hid_info(hdev, "Registered DualSense controller hw_version=%x fw_version=%x\n",
+			ds->base.hw_version, ds->base.fw_version);
+
 	return &ds->base;
 
 err:
@@ -1311,6 +1389,12 @@ static int ps_probe(struct hid_device *hdev, const struct hid_device_id *id)
 		}
 	}
 
+	ret = devm_device_add_group(&hdev->dev, &ps_device_attribute_group);
+	if (ret < 0) {
+		hid_err(hdev, "Failed to register sysfs nodes.\n");
+		goto err_close;
+	}
+
 	return ret;
 
 err_close:
-- 
2.26.2

