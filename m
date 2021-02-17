Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 797D631DE64
	for <lists+linux-input@lfdr.de>; Wed, 17 Feb 2021 18:37:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234534AbhBQRgB (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 17 Feb 2021 12:36:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:37160 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231570AbhBQRd4 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 17 Feb 2021 12:33:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1613583149;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ybFvUxcR//kDarBM6awWL2j71GwnzCbGvA+DvUqEZKw=;
        b=Ec3W5/FvNyf0ciFNEh7uPY+KkjKE8qtOQxyr4WUojxZrIl6wFUeGDjsicnNI9BB287Whxo
        8ieNgvVSuXbSlhiQ1j6acL+dfSog2m7a+Nq6QuoiGE5IycSw6MUbbHUdh+oDxG1cTbhfGI
        nrA7GmEx8vBQM75w7EFp1uvcPKflBPU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-208-6WG-x0ICOT-Vl-3ZcOOZfw-1; Wed, 17 Feb 2021 12:32:25 -0500
X-MC-Unique: 6WG-x0ICOT-Vl-3ZcOOZfw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C0F8B801976;
        Wed, 17 Feb 2021 17:32:23 +0000 (UTC)
Received: from plouf.redhat.com (ovpn-116-25.ams2.redhat.com [10.36.116.25])
        by smtp.corp.redhat.com (Postfix) with ESMTP id E962E60C61;
        Wed, 17 Feb 2021 17:32:18 +0000 (UTC)
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>,
        =?UTF-8?q?Barnab=C3=A1s=20P=C5=91cze?= <pobrn@protonmail.com>
Cc:     linux-input@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Subject: [PATCH 07/11] HID: playstation: report DualSense hardware and firmware version.
Date:   Wed, 17 Feb 2021 18:31:54 +0100
Message-Id: <20210217173158.3122868-8-benjamin.tissoires@redhat.com>
In-Reply-To: <20210217173158.3122868-1-benjamin.tissoires@redhat.com>
References: <20210217173158.3122868-1-benjamin.tissoires@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Roderick Colenbrander <roderick.colenbrander@sony.com>

Retrieve DualSense hardware and firmware information using a vendor
specific feature report. Report the data through sysfs and also
report using hid_info as there can be signficant differences between
versions.

Signed-off-by: Roderick Colenbrander <roderick.colenbrander@sony.com>
Reviewed-by: Barnabás Pőcze <pobrn@protonmail.com>
Signed-off-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>
---
 drivers/hid/hid-playstation.c | 81 +++++++++++++++++++++++++++++++++++
 1 file changed, 81 insertions(+)

diff --git a/drivers/hid/hid-playstation.c b/drivers/hid/hid-playstation.c
index 64193fdeaa0d..84f484fce1ee 100644
--- a/drivers/hid/hid-playstation.c
+++ b/drivers/hid/hid-playstation.c
@@ -34,6 +34,8 @@ struct ps_device {
 	int battery_status;
 
 	uint8_t mac_address[6]; /* Note: stored in little endian order. */
+	uint32_t hw_version;
+	uint32_t fw_version;
 
 	int (*parse_report)(struct ps_device *dev, struct hid_report *report, u8 *data, int size);
 };
@@ -64,6 +66,8 @@ struct ps_calibration_data {
 #define DS_FEATURE_REPORT_CALIBRATION_SIZE	41
 #define DS_FEATURE_REPORT_PAIRING_INFO		0x09
 #define DS_FEATURE_REPORT_PAIRING_INFO_SIZE	20
+#define DS_FEATURE_REPORT_FIRMWARE_INFO		0x20
+#define DS_FEATURE_REPORT_FIRMWARE_INFO_SIZE	64
 
 /* Button masks for DualSense input report. */
 #define DS_BUTTONS0_HAT_SWITCH	GENMASK(3, 0)
@@ -538,6 +542,40 @@ static struct input_dev *ps_touchpad_create(struct hid_device *hdev, int width,
 	return touchpad;
 }
 
+static ssize_t firmware_version_show(struct device *dev,
+				struct device_attribute
+				*attr, char *buf)
+{
+	struct hid_device *hdev = to_hid_device(dev);
+	struct ps_device *ps_dev = hid_get_drvdata(hdev);
+
+	return sysfs_emit(buf, "0x%08x\n", ps_dev->fw_version);
+}
+
+static DEVICE_ATTR_RO(firmware_version);
+
+static ssize_t hardware_version_show(struct device *dev,
+				struct device_attribute
+				*attr, char *buf)
+{
+	struct hid_device *hdev = to_hid_device(dev);
+	struct ps_device *ps_dev = hid_get_drvdata(hdev);
+
+	return sysfs_emit(buf, "0x%08x\n", ps_dev->hw_version);
+}
+
+static DEVICE_ATTR_RO(hardware_version);
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
@@ -628,6 +666,30 @@ static int dualsense_get_calibration_data(struct dualsense *ds)
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
@@ -956,6 +1018,12 @@ static struct ps_device *dualsense_create(struct hid_device *hdev)
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
@@ -989,6 +1057,13 @@ static struct ps_device *dualsense_create(struct hid_device *hdev)
 	if (ret)
 		goto err;
 
+	/*
+	 * Reporting hardware and firmware is important as there are frequent updates, which
+	 * can change behavior.
+	 */
+	hid_info(hdev, "Registered DualSense controller hw_version=0x%08x fw_version=0x%08x\n",
+			ds->base.hw_version, ds->base.fw_version);
+
 	return &ds->base;
 
 err:
@@ -1039,6 +1114,12 @@ static int ps_probe(struct hid_device *hdev, const struct hid_device_id *id)
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
2.29.2

