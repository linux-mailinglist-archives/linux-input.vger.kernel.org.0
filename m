Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1419F2F5130
	for <lists+linux-input@lfdr.de>; Wed, 13 Jan 2021 18:35:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727484AbhAMRez (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 13 Jan 2021 12:34:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727403AbhAMRey (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 13 Jan 2021 12:34:54 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 087D8C061794;
        Wed, 13 Jan 2021 09:34:14 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id o13so3975236lfr.3;
        Wed, 13 Jan 2021 09:34:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ks2fhv+8OJfx3hTfppNwZ0f4AtqOkYzksAdi1JOdYMA=;
        b=e0yos9QKDuIovZa2NAVmA19fq8jOqTmRChJe3kssByHkNKvb5RlGV0/1xDQS9HHx4Q
         3fLdEOiK4nxeYGrJ16JESSzF6RhaYxrQ1ii8V1EcIGc0IiRx0LjNjJgZay68LYOKXrF+
         hc1I9FQiYauXvsbAOcYkm4wzB1W2CyUemh3jDYQug+LnSsObg9mOi5kpNbnGX2mvr+Oi
         Wfopbd3JEjUSogpPKs9XdkFN8rZZ8kHN4rN/Lgk5XUphKLxyynDysYGEiA82Gj+wIlR3
         GjAVrIiTeqb/UCGghbAjy3GQZZGccE9jaokqIZ5P8Q3rRRj3n6SY0HzZ+aMLxXJzQjd0
         Cxww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ks2fhv+8OJfx3hTfppNwZ0f4AtqOkYzksAdi1JOdYMA=;
        b=Uzkd16urT+A9VM02Mm7g3KiOsVS1KXRv117Nd5V99JA1mSaLkaq1Mbk86m81BMr1mv
         CfWB3ykm1zMYi2RJR5sjWRcEe03SSjXJfXTDHOtxGEi4scOxV7IKK0so7bQYE04AuV/l
         FHouZuAoq2+4Cx/DmTNHPJ9E2ZP2hn76X5AO1U5mZ/VgkeKfgqo/UabS05yxmobb+Uwo
         Bv4ILaS3e6cNkdgxt1gngXMUuxDXbCPp0o8xmE5DVybBn/miQaI7pv4DwErQtDpzIxOc
         qmXGW2lqIdaeanUA9QgjghSN/Tok39VBGC4VeIQXKVlOgJdeNOaVrXeDPbkQXrCAESlH
         yakQ==
X-Gm-Message-State: AOAM53279/81ERVYoov1h/uPw8w+hmzpsplRgQ16F4xPA5wzsW2hWGpY
        8y4RQnzw0RVGVQSQ3zX7UfjwCKxxacs/Ew==
X-Google-Smtp-Source: ABdhPJyJ4OXWLOJBN6gb158WFOMSRuwfRuY7VQFTiGX+3W68b9urQ6UCP8meli8ja1zuogEVOnXCsQ==
X-Received: by 2002:a05:6512:3194:: with SMTP id i20mr1306959lfe.283.1610559252427;
        Wed, 13 Jan 2021 09:34:12 -0800 (PST)
Received: from localhost (pool-109-191-164-140.is74.ru. [109.191.164.140])
        by smtp.gmail.com with ESMTPSA id f29sm271977lfj.47.2021.01.13.09.34.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Jan 2021 09:34:11 -0800 (PST)
From:   Ivan Mironov <mironov.ivan@gmail.com>
To:     Jiri Kosina <jikos@kernel.org>
Cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ivan Mironov <mironov.ivan@gmail.com>
Subject: [PATCH] HID: sony: Support for DS4 clones that do not implement feature report 0x81
Date:   Wed, 13 Jan 2021 22:34:02 +0500
Message-Id: <20210113173402.17030-1-mironov.ivan@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

There are clones of DualShock 4 that are very similar to the originals,
except of 1) they do not support HID feature report 0x81 and 2) they do
not have any USB Audio interfaces despite they physically have audio
jack.

Such controllers are working fine with Linux when connected via
Bluetooth, but not when connected via USB. Here is how failed USB
connection attempt looks in log:

	usb 1-5: New USB device found, idVendor=054c, idProduct=05c4, bcdDevice= 1.00
	usb 1-5: New USB device strings: Mfr=1, Product=2, SerialNumber=0
	usb 1-5: Product: Wireless Controller
	usb 1-5: Manufacturer: Sony Computer Entertainment
	sony 0003:054C:05C4.0007: failed to retrieve feature report 0x81 with the DualShock 4 MAC address
	sony 0003:054C:05C4.0007: hidraw6: USB HID v81.11 Gamepad [Sony Computer Entertainment Wireless Controller] on usb-0000:00:14.0-5/input0
	sony 0003:054C:05C4.0007: failed to claim input

This patch adds support of using feature report 0x12 as a fallback for
Bluetooth MAC address retrieval. Feature report 0x12 also seems to be
used by DS4Windows[1] for all DS4 controllers.

[1] https://github.com/Ryochan7/DS4Windows/blob/1b74a4440089f38a24ee2c2483c1d733a0692b8f/DS4Windows/HidLibrary/HidDevice.cs#L479

Signed-off-by: Ivan Mironov <mironov.ivan@gmail.com>
---
 drivers/hid/hid-sony.c | 72 ++++++++++++++++++++++++++++++------------
 1 file changed, 52 insertions(+), 20 deletions(-)

diff --git a/drivers/hid/hid-sony.c b/drivers/hid/hid-sony.c
index e3a557dc9ffd..97df12180e45 100644
--- a/drivers/hid/hid-sony.c
+++ b/drivers/hid/hid-sony.c
@@ -491,6 +491,7 @@ struct motion_output_report_02 {
 
 #define DS4_FEATURE_REPORT_0x02_SIZE 37
 #define DS4_FEATURE_REPORT_0x05_SIZE 41
+#define DS4_FEATURE_REPORT_0x12_SIZE 16
 #define DS4_FEATURE_REPORT_0x81_SIZE 7
 #define DS4_FEATURE_REPORT_0xA3_SIZE 49
 #define DS4_INPUT_REPORT_0x11_SIZE 78
@@ -2593,6 +2594,53 @@ static int sony_get_bt_devaddr(struct sony_sc *sc)
 	return 0;
 }
 
+static int sony_get_usb_ds4_devaddr(struct sony_sc *sc)
+{
+	u8 *buf = NULL;
+	int ret;
+
+	buf = kmalloc(max(DS4_FEATURE_REPORT_0x12_SIZE, DS4_FEATURE_REPORT_0x81_SIZE), GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
+
+	/*
+	 * The MAC address of a DS4 controller connected via USB can be
+	 * retrieved with feature report 0x81. The address begins at
+	 * offset 1.
+	 */
+	ret = hid_hw_raw_request(sc->hdev, 0x81, buf,
+			DS4_FEATURE_REPORT_0x81_SIZE, HID_FEATURE_REPORT,
+			HID_REQ_GET_REPORT);
+	if (ret == DS4_FEATURE_REPORT_0x81_SIZE) {
+		memcpy(sc->mac_address, &buf[1], sizeof(sc->mac_address));
+		goto out_free;
+	}
+	dbg_hid("%s: hid_hw_raw_request(..., 0x81, ...) returned %d\n", __func__, ret);
+
+	/*
+	 * Some variants do not implement feature report 0x81 at all.
+	 * Fortunately, feature report 0x12 also contains the MAC address of
+	 * a controller.
+	 */
+	ret = hid_hw_raw_request(sc->hdev, 0x12, buf,
+			DS4_FEATURE_REPORT_0x12_SIZE, HID_FEATURE_REPORT,
+			HID_REQ_GET_REPORT);
+	if (ret == DS4_FEATURE_REPORT_0x12_SIZE) {
+		memcpy(sc->mac_address, &buf[1], sizeof(sc->mac_address));
+		goto out_free;
+	}
+	dbg_hid("%s: hid_hw_raw_request(..., 0x12, ...) returned %d\n", __func__, ret);
+
+	hid_err(sc->hdev, "failed to retrieve feature reports 0x81 and 0x12 with the DualShock 4 MAC address\n");
+	ret = ret < 0 ? ret : -EINVAL;
+
+out_free:
+
+	kfree(buf);
+
+	return ret;
+}
+
 static int sony_check_add(struct sony_sc *sc)
 {
 	u8 *buf = NULL;
@@ -2613,26 +2661,9 @@ static int sony_check_add(struct sony_sc *sc)
 			return 0;
 		}
 	} else if (sc->quirks & (DUALSHOCK4_CONTROLLER_USB | DUALSHOCK4_DONGLE)) {
-		buf = kmalloc(DS4_FEATURE_REPORT_0x81_SIZE, GFP_KERNEL);
-		if (!buf)
-			return -ENOMEM;
-
-		/*
-		 * The MAC address of a DS4 controller connected via USB can be
-		 * retrieved with feature report 0x81. The address begins at
-		 * offset 1.
-		 */
-		ret = hid_hw_raw_request(sc->hdev, 0x81, buf,
-				DS4_FEATURE_REPORT_0x81_SIZE, HID_FEATURE_REPORT,
-				HID_REQ_GET_REPORT);
-
-		if (ret != DS4_FEATURE_REPORT_0x81_SIZE) {
-			hid_err(sc->hdev, "failed to retrieve feature report 0x81 with the DualShock 4 MAC address\n");
-			ret = ret < 0 ? ret : -EINVAL;
-			goto out_free;
-		}
-
-		memcpy(sc->mac_address, &buf[1], sizeof(sc->mac_address));
+		ret = sony_get_usb_ds4_devaddr(sc);
+		if (ret < 0)
+			return ret;
 
 		snprintf(sc->hdev->uniq, sizeof(sc->hdev->uniq),
 			 "%pMR", sc->mac_address);
@@ -2670,6 +2701,7 @@ static int sony_check_add(struct sony_sc *sc)
 		return 0;
 	}
 
+	dbg_hid("%s: retrieved MAC address: %s\n", __func__, sc->hdev->uniq);
 	ret = sony_check_add_dev_list(sc);
 
 out_free:
-- 
2.29.2

