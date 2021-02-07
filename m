Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D92EE3127AD
	for <lists+linux-input@lfdr.de>; Sun,  7 Feb 2021 22:50:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229581AbhBGVuj (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 7 Feb 2021 16:50:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229611AbhBGVuj (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 7 Feb 2021 16:50:39 -0500
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43783C0617AB
        for <linux-input@vger.kernel.org>; Sun,  7 Feb 2021 13:49:29 -0800 (PST)
Received: by mail-pf1-x430.google.com with SMTP id d26so7231798pfn.5
        for <linux-input@vger.kernel.org>; Sun, 07 Feb 2021 13:49:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gaikai-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XM9/6CrTO6iwA6M5zILvA1imWx5shm8A2fhMIjv8YLA=;
        b=D2tCIRKoGUkNICi8by4zxAvqOqaJbcBnxG0ULj3CTC+bi4igsgKJUHgz96WGMExsSt
         Yw7QC5UkSxBiEmdIDfDJ4TWKsNJuJAx+p8pch7FVyRtCpwqa1pgAURZJYUB9gbTxlhG8
         JvpGBCKDzKiRQnaSyP14qURa4125cQzO8Rd5FAgvmz5VyRovDri17xxBE0OjPt+5pB2L
         L5Y41acBcyyCZF9KVLaXW19UaaayEJqKrgmi/G0Jlb3K3C2k2JZCT0WSsZxlQuf7Yjy5
         p8yHFFgjHP72t/2eYSBYhTsNBfZxJy5zWvZ0Y/tCHttarFrMYPVuEeyhtHV8nIFYKfSG
         dCrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XM9/6CrTO6iwA6M5zILvA1imWx5shm8A2fhMIjv8YLA=;
        b=DQwT7Zm9WPPxsPK4M1iCbkgUpUR0vMHm6GuNh0pY/fqQsJp/rHQgqJoxNQYdp1zxAO
         pziKQw8WREfUx7zVX5T1WF+trWgEG7RREQdGAnHbCAbgg3Zw36/rsykE9qS+bilK7aup
         JnQtYeFG2fRJ6K6UPGFOsduKNWuItcTLTucsV4aZKTO+v3WeeBFA+O8Vc4zBZOcjjp1E
         R7foqV27m0dSE/z/9H/NpT1guk3+NblaCJQliT9MDfB+c4bx2Zj+FkrphKInU5BkNx01
         QsZkWgcsNeu2rP4AemCoGUBRKI9OlVSXttjBqwFuQnqQclf4XPJWd0H1BEzT0MSDAxGK
         2JKQ==
X-Gm-Message-State: AOAM5316dm/Ud5zbYYQJqUWQe5bttW+pUpNf/RujFCKCcvKX1xMDhO9k
        zvJR5t0oWbnoc22EYdM3HaEtxg==
X-Google-Smtp-Source: ABdhPJz14iG/PHf+fxKB0P8hPxA9nvwMC5U7ZJdJWJNrH7snt9iCJ0KZVuYUcUgZIROt+xpAY7Dg+g==
X-Received: by 2002:aa7:9e4d:0:b029:1dd:c2db:55ef with SMTP id z13-20020aa79e4d0000b02901ddc2db55efmr1386644pfq.45.1612734568825;
        Sun, 07 Feb 2021 13:49:28 -0800 (PST)
Received: from us8c16456344dc.lan (cpe-76-87-77-78.socal.res.rr.com. [76.87.77.78])
        by smtp.gmail.com with ESMTPSA id a141sm16578991pfa.189.2021.02.07.13.49.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Feb 2021 13:49:28 -0800 (PST)
From:   Roderick Colenbrander <roderick@gaikai.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-input@vger.kernel.org, Chris Ye <lzye@google.com>,
        =?UTF-8?q?Barnab=C3=A1s=20P=C5=91cze?= <pobrn@protonmail.com>,
        =?UTF-8?q?Samuel=20=C4=8Cavoj?= <sammko@sammserver.com>,
        =?UTF-8?q?Florian=20M=C3=A4rkl?= <linux@florianmaerkl.de>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Subject: [PATCH v6 13/13] HID: playstation: report DualSense hardware and firmware version.
Date:   Sun,  7 Feb 2021 13:49:08 -0800
Message-Id: <20210207214908.79573-14-roderick@gaikai.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210207214908.79573-1-roderick@gaikai.com>
References: <20210207214908.79573-1-roderick@gaikai.com>
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
index 973c1fe61e8a..cc93c16cc822 100644
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
@@ -661,6 +665,40 @@ static struct input_dev *ps_touchpad_create(struct hid_device *hdev, int width,
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
@@ -751,6 +789,30 @@ static int dualsense_get_calibration_data(struct dualsense *ds)
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
@@ -1252,6 +1314,12 @@ static struct ps_device *dualsense_create(struct hid_device *hdev)
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
@@ -1319,6 +1387,13 @@ static struct ps_device *dualsense_create(struct hid_device *hdev)
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
@@ -1369,6 +1444,12 @@ static int ps_probe(struct hid_device *hdev, const struct hid_device_id *id)
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

