Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 575BF31DE54
	for <lists+linux-input@lfdr.de>; Wed, 17 Feb 2021 18:35:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234513AbhBQRfI (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 17 Feb 2021 12:35:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60602 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234512AbhBQRdk (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 17 Feb 2021 12:33:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1613583133;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=SalQoALVHWSDBuvFSejJz/dq2scECkvrFLmS0/hjb/M=;
        b=KqHnR/SKu8HRTKGTGx7GWwP8Nh7T19v+fuGv4SrxombgqcfubHcks7RKKDoKqMs9M7I8F8
        uuzhQHNTIdgFYcpxNkvgB1E6eqNy29EphghS+yqBusYfib30m3a6SEQ367GLmgS2kdL9Vn
        NuDM9dPcxhkZbOeKEUZcbfLhwGAUano=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-323-86Izz6vOOhCf-8zeXlbJUw-1; Wed, 17 Feb 2021 12:32:10 -0500
X-MC-Unique: 86Izz6vOOhCf-8zeXlbJUw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A0E63835E22;
        Wed, 17 Feb 2021 17:32:08 +0000 (UTC)
Received: from plouf.redhat.com (ovpn-116-25.ams2.redhat.com [10.36.116.25])
        by smtp.corp.redhat.com (Postfix) with ESMTP id F24C360C61;
        Wed, 17 Feb 2021 17:32:06 +0000 (UTC)
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>,
        =?UTF-8?q?Barnab=C3=A1s=20P=C5=91cze?= <pobrn@protonmail.com>
Cc:     linux-input@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Subject: [PATCH 02/11] Revert "HID: playstation: report DualSense hardware and firmware version."
Date:   Wed, 17 Feb 2021 18:31:49 +0100
Message-Id: <20210217173158.3122868-3-benjamin.tissoires@redhat.com>
In-Reply-To: <20210217173158.3122868-1-benjamin.tissoires@redhat.com>
References: <20210217173158.3122868-1-benjamin.tissoires@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This reverts commit 1f902f8636e4 ("HID: playstation: report DualSense
hardware and firmware version.")

There is currently an ongoing discussion on linux-leds LKML,
and so to give us more room, we need to revert those related
LEDs patches from linux-next.

To have a cleaner merge with the new version, we also revert
all patches on top of the LED ones.

This is not a big deal, they are still not pushed to Linus.

Signed-off-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>
---
 drivers/hid/hid-playstation.c | 81 -----------------------------------
 1 file changed, 81 deletions(-)

diff --git a/drivers/hid/hid-playstation.c b/drivers/hid/hid-playstation.c
index cc93c16cc822..973c1fe61e8a 100644
--- a/drivers/hid/hid-playstation.c
+++ b/drivers/hid/hid-playstation.c
@@ -41,8 +41,6 @@ struct ps_device {
 	int battery_status;
 
 	uint8_t mac_address[6]; /* Note: stored in little endian order. */
-	uint32_t hw_version;
-	uint32_t fw_version;
 
 	int (*parse_report)(struct ps_device *dev, struct hid_report *report, u8 *data, int size);
 };
@@ -79,8 +77,6 @@ struct ps_led_info {
 #define DS_FEATURE_REPORT_CALIBRATION_SIZE	41
 #define DS_FEATURE_REPORT_PAIRING_INFO		0x09
 #define DS_FEATURE_REPORT_PAIRING_INFO_SIZE	20
-#define DS_FEATURE_REPORT_FIRMWARE_INFO		0x20
-#define DS_FEATURE_REPORT_FIRMWARE_INFO_SIZE	64
 
 /* Button masks for DualSense input report. */
 #define DS_BUTTONS0_HAT_SWITCH	GENMASK(3, 0)
@@ -665,40 +661,6 @@ static struct input_dev *ps_touchpad_create(struct hid_device *hdev, int width,
 	return touchpad;
 }
 
-static ssize_t firmware_version_show(struct device *dev,
-				struct device_attribute
-				*attr, char *buf)
-{
-	struct hid_device *hdev = to_hid_device(dev);
-	struct ps_device *ps_dev = hid_get_drvdata(hdev);
-
-	return sysfs_emit(buf, "0x%08x\n", ps_dev->fw_version);
-}
-
-static DEVICE_ATTR_RO(firmware_version);
-
-static ssize_t hardware_version_show(struct device *dev,
-				struct device_attribute
-				*attr, char *buf)
-{
-	struct hid_device *hdev = to_hid_device(dev);
-	struct ps_device *ps_dev = hid_get_drvdata(hdev);
-
-	return sysfs_emit(buf, "0x%08x\n", ps_dev->hw_version);
-}
-
-static DEVICE_ATTR_RO(hardware_version);
-
-static struct attribute *ps_device_attributes[] = {
-	&dev_attr_firmware_version.attr,
-	&dev_attr_hardware_version.attr,
-	NULL
-};
-
-static const struct attribute_group ps_device_attribute_group = {
-	.attrs = ps_device_attributes,
-};
-
 static int dualsense_get_calibration_data(struct dualsense *ds)
 {
 	short gyro_pitch_bias, gyro_pitch_plus, gyro_pitch_minus;
@@ -789,30 +751,6 @@ static int dualsense_get_calibration_data(struct dualsense *ds)
 	return ret;
 }
 
-static int dualsense_get_firmware_info(struct dualsense *ds)
-{
-	uint8_t *buf;
-	int ret;
-
-	buf = kzalloc(DS_FEATURE_REPORT_FIRMWARE_INFO_SIZE, GFP_KERNEL);
-	if (!buf)
-		return -ENOMEM;
-
-	ret = ps_get_report(ds->base.hdev, DS_FEATURE_REPORT_FIRMWARE_INFO, buf,
-			DS_FEATURE_REPORT_FIRMWARE_INFO_SIZE);
-	if (ret) {
-		hid_err(ds->base.hdev, "Failed to retrieve DualSense firmware info: %d\n", ret);
-		goto err_free;
-	}
-
-	ds->base.hw_version = get_unaligned_le32(&buf[24]);
-	ds->base.fw_version = get_unaligned_le32(&buf[28]);
-
-err_free:
-	kfree(buf);
-	return ret;
-}
-
 static int dualsense_get_mac_address(struct dualsense *ds)
 {
 	uint8_t *buf;
@@ -1314,12 +1252,6 @@ static struct ps_device *dualsense_create(struct hid_device *hdev)
 	}
 	snprintf(hdev->uniq, sizeof(hdev->uniq), "%pMR", ds->base.mac_address);
 
-	ret = dualsense_get_firmware_info(ds);
-	if (ret) {
-		hid_err(hdev, "Failed to get firmware info from DualSense\n");
-		return ERR_PTR(ret);
-	}
-
 	ret = ps_devices_list_add(ps_dev);
 	if (ret)
 		return ERR_PTR(ret);
@@ -1387,13 +1319,6 @@ static struct ps_device *dualsense_create(struct hid_device *hdev)
 	/* Set player LEDs to our player id. */
 	dualsense_set_player_leds(ds);
 
-	/*
-	 * Reporting hardware and firmware is important as there are frequent updates, which
-	 * can change behavior.
-	 */
-	hid_info(hdev, "Registered DualSense controller hw_version=0x%08x fw_version=0x%08x\n",
-			ds->base.hw_version, ds->base.fw_version);
-
 	return &ds->base;
 
 err:
@@ -1444,12 +1369,6 @@ static int ps_probe(struct hid_device *hdev, const struct hid_device_id *id)
 		}
 	}
 
-	ret = devm_device_add_group(&hdev->dev, &ps_device_attribute_group);
-	if (ret) {
-		hid_err(hdev, "Failed to register sysfs nodes.\n");
-		goto err_close;
-	}
-
 	return ret;
 
 err_close:
-- 
2.29.2

