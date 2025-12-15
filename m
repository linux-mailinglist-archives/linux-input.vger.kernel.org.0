Return-Path: <linux-input+bounces-16583-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B284CBDEB2
	for <lists+linux-input@lfdr.de>; Mon, 15 Dec 2025 13:58:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C65E53002FCC
	for <lists+linux-input@lfdr.de>; Mon, 15 Dec 2025 12:53:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66F871ADC83;
	Mon, 15 Dec 2025 12:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C67lNn9X"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39F512264AD
	for <linux-input@vger.kernel.org>; Mon, 15 Dec 2025 12:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765803222; cv=none; b=cQ3S/rSYLFDli9pUcy0OYmfR2WWIQBD4vYVddG/InFrT84Fc8DM+TYKpfD1d1UGBgb2U8b7ipC7FyOaijJ4PjZC/j+3LrizN3nOrUtOGnDh6K4+EFFtXHwsdnWqWSPZ2jq50zAXCJjYqB5jSZixJIvEz9HRPdeXCQzbLR2+3/Zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765803222; c=relaxed/simple;
	bh=+VGgjLoRGZV/LdHS/MFoo0vylEDk8QgjAXtVLN+5/4c=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=YPE2aT9GfkT2k42okd4fI7PQQ3HKxoowUpCCLy7whIwEnu4E+rn9FsGUSyjclPfCPRZVtOs1NwNI6XuQfpB7lCuW/YTayYqZbCFaDN50H5BYpnreT2FyuJYdrTq8g+QGnzTm768arUBahsQHUNyvTQCYQA0u8kZa3XJ8VXGO71k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C67lNn9X; arc=none smtp.client-ip=209.85.128.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f67.google.com with SMTP id 5b1f17b1804b1-477563e28a3so26111965e9.1
        for <linux-input@vger.kernel.org>; Mon, 15 Dec 2025 04:53:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765803218; x=1766408018; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mv/KgOqimVxjjLjT4KSoLOGpg5mrm1AhX7aQL0HDTTs=;
        b=C67lNn9XmNrDQbn7cN1blLsyymHqqY+DYDoUBAoOobkfI/XC8Ia8gC+ujv9vaU2GHJ
         o/BvgObht/9rJEQFzQ11J5f9hAkMRAlbprZu82WRCPoQk5wqfMvJBWatReSI5Ljoi5df
         lAamIOC48iaQJXvk6W3BC89m1aZahLw/HgnnjQLwgg1LGbw4F3wmyBqdmQ+wpDbzjOWp
         gC+R1GlVkONF3Dz8dPlGaTIakwqCcfav82cWkW1V2uslZJm2S/afpuR8ysFWlic9Kbdj
         uNVxVJhbL0XBVATvHdtgrNPLOA3tgz9ujaN0Kr+V8xDpw1F6oguGpdu0UxQYZdZjcEU+
         vbGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765803218; x=1766408018;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mv/KgOqimVxjjLjT4KSoLOGpg5mrm1AhX7aQL0HDTTs=;
        b=aHIjhOWEdNHGfoFYz4jGvmrbIONlcMIjqg+1XB0nGOBMWOmYoYASAi7RG6jt4nY0MU
         GUQYi18toj0t2J7qUSfPwypBLi0CafCtBaT+L1r30X79PSJj+u4zAbJWXX6wjagX6Vsb
         HvEGBiHTB713d8wGbz7SQek+L/ZkW90rAnaBQmKqU3AxBk4GghVRQ8WFzV9Ltb5R8T+K
         gWSbD1zqWR6xJ15J507nruGnzNZirtqbqiYaEpY2bBnKaeqLW6SbWuoeMXPNZVUpX1Qo
         nkj+Lx5p9yVWA5VlBlI5OVNQjNSc8tOmgxQE+ep3uloXhuspBwXwPV3XAbI9r0H56+jh
         60bg==
X-Forwarded-Encrypted: i=1; AJvYcCXsqjd/kPXs6uHumdjEUPAUdHep8nPfk5IyWlMl4m5dR31ogwXWJejA28s4JY8sQQYGjPG0+A0Bn2UIRw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxZ2+Kf3SYpFyXOs9jBnRtUyKwTQCaeYHhHHey+JsZS6dwxaojC
	8+JkceXx6mf7+y9hQPzTwApQcorBONv1zB4M7tUZc03ud40A5pUGLzum
X-Gm-Gg: AY/fxX6PzsbsIv95oGCEyMV8dS5SFRqKAK5P+anYZlBZEZDC736TGZGiWNRgh8ePw0E
	FCLp92c5uI1yJszFQCysAGA0L0hSGo4kaZt4D2l5igkncFZl5UZ+LR0jI2p8v23Ngm3Kl2ZhGc7
	MPD4m8tUJmqauqeVU/OStxKUHGh8B1zx79qoOwAgd/5PvJVWSHSleeLEbKEhWKC38BlUlyJw/p1
	akVtyUuCVxvMrKfabCvU0LQv+KQIFk6Nk464utbxcux7Q+JODy2pEUP37NlUW5BHkKqy7OQnaH2
	Nn3VOhlfeYfTgd05kZwX4r2yNnDqumP6ldTyZbnBDQOzKb3eV/M+DxITAQded7y53tm3TeyQcJI
	CUYbkQF83yMNy+HKbFPvWE+Amt5k84HAuyK05iHugmk07J0Z6zp6+f1Bj55jCf1UBChrr5FLe8n
	AGIwJs2qpgNt6CixKhsAD4uGLweQmAVNIIQb5hoBkfUoVK1jBF
X-Google-Smtp-Source: AGHT+IHCkIeTkPS2g2/zqC65x8TWhnX079ewcuLI7rVkU4nvVhf89UfYQcaSkEu0tiiib4nOzz2kig==
X-Received: by 2002:a05:600c:c101:b0:477:7588:c8cc with SMTP id 5b1f17b1804b1-47a89da461emr125391025e9.7.1765803218162;
        Mon, 15 Dec 2025 04:53:38 -0800 (PST)
Received: from baraa-atta.local ([176.65.31.243])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47bd4116379sm313325e9.5.2025.12.15.04.53.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 04:53:37 -0800 (PST)
From: DevExalt <exalt.dev.team@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: lains@riseup.net,
	hadess@hadess.net,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sari.kreitem@exalt.corp-partner.google.com,
	hbarnor@google.com,
	"Baraa Atta (Dev Exalt)" <exalt.dev.team@gmail.com>
Subject: [PATCH] HID: logitech-hidpp: Add support for HID++ Multi-Platform feature (0x4531)
Date: Mon, 15 Dec 2025 14:53:19 +0200
Message-Id: <20251215125319.33261-1-exalt.dev.team@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Baraa Atta (Dev Exalt)" <exalt.dev.team@gmail.com>

Add support in the Logitech HID++ driver for the HID++ Multi-Platform
feature (0x4531), which enables HID++ devices to adjust their behavior
based on the host operating system (Linux, ChromeOS, Android).

This patch:
 * Adds device IDs for MX Keys S (046d:b378) and Casa Keys (046d:b371).
 * Introduces the module parameter "hidpp_platform" to allow selecting a
   target platform.
 * Detects whether a device implements feature 0x4531.
 * Validates that the requested platform is supported by the device.
 * Applies the platform index when valid, otherwise leaves the device
   unchanged.
 * Keeps default behavior when "hidpp_platform" is unset or invalid.

Supported values for hidpp_platform:
   Android, Linux, Chrome

TEST=Pair MX Keys S and Casa Keys over Bluetooth and verify:
     * Feature 0x4531 is detected.
     * Valid platform values are accepted and applied.
     * Invalid platform values result in no update.
     * Devices without 0x4531 retain default behavior.
     * Platform-specific key behavior is observed once applied.

Signed-off-by: Baraa Atta (Dev Exalt) <exalt.dev.team@gmail.com>
---
 drivers/hid/hid-ids.h            |   2 +
 drivers/hid/hid-logitech-hidpp.c | 280 +++++++++++++++++++++++++++++++
 drivers/hid/hid-quirks.c         |   2 +
 3 files changed, 284 insertions(+)

diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index d31711f1aaec..12de1194d7fa 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -866,6 +866,8 @@
 #define USB_DEVICE_ID_LOGITECH_T651	0xb00c
 #define USB_DEVICE_ID_LOGITECH_DINOVO_EDGE_KBD	0xb309
 #define USB_DEVICE_ID_LOGITECH_CASA_TOUCHPAD	0xbb00
+#define USB_DEVICE_ID_LOGITECH_CASA_KEYS_KEYBOARD	0xb371
+#define USB_DEVICE_ID_LOGITECH_MX_KEYS_S_KEYBOARD	0xb378
 #define USB_DEVICE_ID_LOGITECH_C007	0xc007
 #define USB_DEVICE_ID_LOGITECH_C077	0xc077
 #define USB_DEVICE_ID_LOGITECH_RECEIVER	0xc101
diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
index d5011a5d0890..e94daed31981 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -4373,6 +4373,280 @@ static bool hidpp_application_equals(struct hid_device *hdev,
 	return report && report->application == application;
 }
 
+/* -------------------------------------------------------------------------- */
+/* 0x4531: Multi-Platform Support                                             */
+/* -------------------------------------------------------------------------- */
+
+/*
+ * Some Logitech devices expose the HID++ feature 0x4531 (Multi-Platform) allowing
+ * the host to specify which operating system platform to use on the device. Changing device's
+ * platform may alter the behavior of the device to match the specified platform.
+ */
+
+static char *hidpp_platform;
+module_param(hidpp_platform, charp, 0644);
+MODULE_PARM_DESC(hidpp_platform, "Select host platform type for Logitech HID++ Multi-Platform feature "
+		 "0x4531, valid values: (linux|chrome|android).  If unset, no "
+		 "change is applied.");
+
+#define HIDPP_MULTIPLATFORM_FEAT_ID			0x4531
+#define HIDPP_MULTIPLATFORM_GET_FEATURE_INFO		0x0F
+#define HIDPP_MULTIPLATFORM_GET_PLATFORM_DESCRIPTOR	0x1F
+#define HIDPP_MULTIPLATFORM_SET_CURRENT_PLATFORM	0x3F
+
+#define HIDPP_MULTIPLATFORM_PLATFORM_MASK_LINUX		BIT(10)
+#define HIDPP_MULTIPLATFORM_PLATFORM_MASK_CHROME	BIT(11)
+#define HIDPP_MULTIPLATFORM_PLATFORM_MASK_ANDROID	BIT(12)
+
+struct hidpp_platform_desc {
+	u8 plat_idx;
+	u8 desc_idx;
+	u16 plat_mask;
+};
+
+/**
+ * hidpp_multiplatform_mask_from_str() - Convert platform name to an HID++ platform mask
+ * @pname: Platform name string
+ *
+ * Converts a platform name string to its corresponding HID++ platform mask based on
+ * the Multi-Platform feature specification.
+ *
+ * Return: Platform mask corresponding to @pname on success,
+ * or 0 if @pname is NULL or unsupported.
+ */
+static u16 hidpp_multiplatform_mask_from_str(const char *pname)
+{
+	if (!pname)
+		return 0;
+
+	if (!strcasecmp(pname, "linux"))
+		return HIDPP_MULTIPLATFORM_PLATFORM_MASK_LINUX;
+	if (!strcasecmp(pname, "chrome"))
+		return HIDPP_MULTIPLATFORM_PLATFORM_MASK_CHROME;
+	if (!strcasecmp(pname, "android"))
+		return HIDPP_MULTIPLATFORM_PLATFORM_MASK_ANDROID;
+
+	return 0;
+}
+
+/**
+ * hidpp_multiplatform_get_num_pdesc() - Retrieve number of platform descriptors
+ * @hidpp: Pointer to the hidpp_device instance
+ * @feat_index: Feature index of the Multi-Platform feature
+ * @num_desc: Pointer to store the number of platform descriptors
+ *
+ * Retrieves the number of platform descriptors supported by the device through
+ * the Multi-Platform feature and stores it in @num_desc.
+ *
+ * Return: 0 on success, or non-zero on failure.
+ */
+static int hidpp_multiplatform_get_num_pdesc(struct hidpp_device *hidpp,
+					     u8 feat_index, u8 *num_desc)
+{
+	int ret;
+	struct hidpp_report response;
+	struct hid_device *hdev = hidpp->hid_dev;
+
+	ret = hidpp_send_fap_command_sync(hidpp, feat_index,
+					  HIDPP_MULTIPLATFORM_GET_FEATURE_INFO,
+					  NULL, 0, &response);
+	if (ret) {
+		hid_warn(hdev, "Multiplatform: GET_FEATURE_INFO failed (err=%d)", ret);
+		return ret;
+	}
+
+	*num_desc = response.fap.params[3];
+	hid_dbg(hdev, "Multiplatform: Device supports %d platform descriptors", *num_desc);
+
+	return 0;
+}
+
+/**
+ * hidpp_multiplatform_get_platform_desc() - Retrieve a platform descriptor entry
+ * @hidpp: Pointer to the hidpp_device instance
+ * @feat_index: Feature index of the Multi-Platform feature
+ * @platform_idx: Index of the platform descriptor to retrieve
+ * @pdesc: Pointer to store the retrieved platform descriptor
+ *
+ * Retrieves a single platform descriptor identified by @platform_idx from the
+ * device and stores the parsed descriptor fields in @pdesc.
+ *
+ * Return: 0 on success, or non-zero on failure.
+ */
+static int hidpp_multiplatform_get_platform_desc(struct hidpp_device *hidpp, u8 feat_index,
+						 u8 platform_idx, struct hidpp_platform_desc *pdesc)
+{
+	int ret;
+	struct hidpp_report response;
+	u8 params[1] = { platform_idx };
+	struct hid_device *hdev = hidpp->hid_dev;
+
+	ret = hidpp_send_fap_command_sync(hidpp, feat_index,
+					  HIDPP_MULTIPLATFORM_GET_PLATFORM_DESCRIPTOR,
+					  params, sizeof(params), &response);
+
+	if (ret) {
+		hid_warn(hdev,
+			 "Multiplatform: GET_PLATFORM_DESCRIPTOR failed for index %d (err=%d)",
+			 platform_idx, ret);
+		return ret;
+	}
+
+	pdesc->plat_idx = response.fap.params[0];
+	pdesc->desc_idx = response.fap.params[1];
+	pdesc->plat_mask = get_unaligned_be16(&response.fap.params[2]);
+
+	hid_dbg(hdev,
+		"Multiplatform: descriptor %d: plat_idx=%d, desc_idx=%d, plat_mask=0x%04x",
+		platform_idx, pdesc->plat_idx, pdesc->desc_idx, pdesc->plat_mask);
+
+	return 0;
+}
+
+/**
+ * hidpp_multiplatform_get_platform_index() - Find platform index for a mask
+ * @hidpp: Pointer to the hidpp_device instance
+ * @feat_index: Feature index of the Multi-Platform feature
+ * @plat_mask: Platform mask to search for
+ * @plat_index: Pointer to store the matched platform index
+ *
+ * Iterates through all platform descriptors exposed by the device via the
+ * Multi-Platform feature, retrieving each descriptor and comparing its
+ * platform mask to @plat_mask. A descriptor matches if its mask overlaps with
+ * the requested @plat_mask (i.e. (pdesc.plat_mask & plat_mask) is non-zero).
+ *
+ * When a matching descriptor is found, its platform index (plat_idx) is
+ * written to @plat_index and the function returns success.
+ *
+ * If no descriptor matches, -ENOENT is returned.
+ *
+ * Return: 0 on success; -ENOENT if no matching descriptor exists;
+ *         or non-zero on failure.
+ */
+static int hidpp_multiplatform_get_platform_index(struct hidpp_device *hidpp,
+						  u8 feat_index, u16 plat_mask,
+						  u8 *plat_index)
+{
+	int i;
+	int ret;
+	u8 num_desc;
+	struct hidpp_platform_desc pdesc;
+	struct hid_device *hdev = hidpp->hid_dev;
+
+	ret = hidpp_multiplatform_get_num_pdesc(hidpp, feat_index, &num_desc);
+	if (ret)
+		return ret;
+
+	for (i = 0; i < num_desc; i++) {
+		ret = hidpp_multiplatform_get_platform_desc(hidpp, feat_index, i, &pdesc);
+		if (ret)
+			return ret;
+
+		if (pdesc.plat_mask & plat_mask) {
+			*plat_index = pdesc.plat_idx;
+			hid_dbg(hdev,
+				"Multiplatform: Selected platform index %d for platform '%s'",
+				*plat_index, hidpp_platform);
+			return 0;
+		}
+	}
+
+	hid_dbg(hdev,
+		"Multiplatform: No matching platform descriptor found for platform '%s'",
+		hidpp_platform);
+	return -ENOENT;
+}
+
+/**
+ * hidpp_multiplatform_update_device_platform() - Update the device platform
+ * @hidpp: Pointer to the hidpp_device instance
+ * @feat_index: Feature index of the Multi-Platform feature
+ * @plat_index: Platform index to set on the device
+ *
+ * Sends the HID++ Multi-Platform 'SET_CURRENT_PLATFORM' command to the device to
+ * update its platform index to @plat_index.
+ *
+ * Return: 0 on success, or non-zero on failure.
+ */
+static int hidpp_multiplatform_update_device_platform(struct hidpp_device *hidpp,
+						      u8 feat_index, u8 plat_index)
+{
+	int ret;
+	struct hidpp_report response;
+	/* Byte 0 (hostIndex): 0xFF selects the current host. */
+	u8 params[2] = { 0xFF, plat_index };
+
+	ret = hidpp_send_fap_command_sync(hidpp, feat_index,
+					  HIDPP_MULTIPLATFORM_SET_CURRENT_PLATFORM,
+					  params, sizeof(params), &response);
+
+	if (ret)
+		hid_warn(hidpp->hid_dev,
+			 "Multiplatform: SET_CURRENT_PLATFORM failed for index %d (err=%d)",
+			 plat_index, ret);
+
+	return ret;
+}
+
+/**
+ * hidpp_multiplatform_init() - Apply the HID++ Multi-Platform (0x4531) feature
+ * @hidpp: Pointer to the hidpp_device instance
+ *
+ * Initializes the Multi-Platform feature by selecting the device platform
+ * corresponding to the module parameter @hidpp_platform, if provided.
+ *
+ * The function performs the following steps:
+ *   1. Convert the @hidpp_platform string into a platform mask.
+ *   2. Check whether the device supports the Multi-Platform feature (0x4531).
+ *   3. Look up the device's platform index whose mask matches the host
+ *      platform mask.
+ *   4. Apply that platform index to the device via 'SET_CURRENT_PLATFORM'.
+ *
+ * If the module parameter is unset or invalid, or the device does not support
+ * the feature, or no matching platform descriptor is found, the function exits
+ * silently without modifying the device state.
+ *
+ * On success, the device's platform configuration is updated.
+ */
+static void hidpp_multiplatform_init(struct hidpp_device *hidpp)
+{
+	int ret;
+	u8 feat_index;
+	u8 plat_index;
+	u16 host_plat_mask;
+	struct hid_device *hdev = hidpp->hid_dev;
+
+	if (!hidpp_platform)
+		return;
+
+	host_plat_mask = hidpp_multiplatform_mask_from_str(hidpp_platform);
+	if (!host_plat_mask) {
+		hid_warn(hdev,
+			 "Multiplatform: Invalid or unsupported platform name '%s'",
+			 hidpp_platform);
+		return;
+	}
+
+	ret = hidpp_root_get_feature(hidpp, HIDPP_MULTIPLATFORM_FEAT_ID, &feat_index);
+	if (ret) {
+		hid_warn(hdev,
+			 "Multiplatform: Failed to get the HID++ multiplatform feature 0x4531");
+		return;
+	}
+
+	ret = hidpp_multiplatform_get_platform_index(hidpp, feat_index, host_plat_mask,
+						     &plat_index);
+	if (ret)
+		return;
+
+	ret = hidpp_multiplatform_update_device_platform(hidpp, feat_index, plat_index);
+	if (ret)
+		return;
+
+	hid_info(hdev,
+		 "Multiplatform: Device platform successfully set to '%s'", hidpp_platform);
+}
+
 static int hidpp_probe(struct hid_device *hdev, const struct hid_device_id *id)
 {
 	struct hidpp_device *hidpp;
@@ -4467,6 +4741,8 @@ static int hidpp_probe(struct hid_device *hdev, const struct hid_device_id *id)
 	if (hidpp->quirks & HIDPP_QUIRK_DELAYED_INIT)
 		connect_mask &= ~HID_CONNECT_HIDINPUT;
 
+	hidpp_multiplatform_init(hidpp);
+
 	/* Now export the actual inputs and hidraw nodes to the world */
 	hid_device_io_stop(hdev);
 	ret = hid_connect(hdev, connect_mask);
@@ -4664,6 +4940,10 @@ static const struct hid_device_id hidpp_devices[] = {
 	  HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_LOGITECH, 0xb034) },
 	{ /* MX Anywhere 3SB mouse over Bluetooth */
 	  HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_LOGITECH, 0xb038) },
+	{ /* Casa Keys keyboard over Bluetooth */
+	  HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_LOGITECH, USB_DEVICE_ID_LOGITECH_CASA_KEYS_KEYBOARD) },
+	{ /* MX Keys S keyboard over Bluetooth */
+	  HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_LOGITECH, USB_DEVICE_ID_LOGITECH_MX_KEYS_S_KEYBOARD) },
 	{}
 };
 
diff --git a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
index c89a015686c0..99ca04b61bda 100644
--- a/drivers/hid/hid-quirks.c
+++ b/drivers/hid/hid-quirks.c
@@ -520,6 +520,8 @@ static const struct hid_device_id hid_have_special_driver[] = {
 #endif
 #if IS_ENABLED(CONFIG_HID_LOGITECH_HIDPP)
 	{ HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, USB_DEVICE_ID_LOGITECH_G920_WHEEL) },
+	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_LOGITECH, USB_DEVICE_ID_LOGITECH_CASA_KEYS_KEYBOARD) },
+	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_LOGITECH, USB_DEVICE_ID_LOGITECH_MX_KEYS_S_KEYBOARD) },
 #endif
 #if IS_ENABLED(CONFIG_HID_MAGICMOUSE)
 	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_MAGICMOUSE) },
-- 
2.34.1


