Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 967873E9B80
	for <lists+linux-input@lfdr.de>; Thu, 12 Aug 2021 02:13:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230185AbhHLANh (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 11 Aug 2021 20:13:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232704AbhHLANg (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 11 Aug 2021 20:13:36 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93255C061765
        for <linux-input@vger.kernel.org>; Wed, 11 Aug 2021 17:13:12 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id 28-20020a17090a031cb0290178dcd8a4d1so6402781pje.0
        for <linux-input@vger.kernel.org>; Wed, 11 Aug 2021 17:13:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zM6SP4V627XXOBGjCWEjH94W8u0a4r7eIIVaBGS4yeg=;
        b=MWgpstpapz95bNjzFVebUft6cJTFvb344OZNxpQrW2eAVnBTStqa6IMaLs+HZmw6aI
         g6gjlHOpacZ5IlvdBlGsDNY/jPp3N61snr8yj+jlgQHWXOK+q0UEZGpXZkDuvBGD2BDI
         kXoNxbb4YRyHsChDv1++ShaAZHAnxxBgsMeQbDacWY+PzNRhSh3p9TwekYA9X7KEyytT
         VvV2My1rbypce/Hh853R3rJD27S6vQWDQpHSi/VL6xU0YYBA5AEdq6fJSFDcpTclVAOk
         CNNa3a2BPh1TsuubNCifx084+gmvzdleFLshR31krxSswxTyjl4tXnH6uL3sRNIrdY1w
         4w0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zM6SP4V627XXOBGjCWEjH94W8u0a4r7eIIVaBGS4yeg=;
        b=bdp+t+qGGvw/3WIZF/0+270K2SJd+gUhovECMz489tMooAfpNNPLcONWCUxGU02wtA
         P07WZIHuSMHyK46QLNBBOgardWPsZLO5x7+XL67nXA1m5ABswXL3pYXehIC5FeGTajNv
         HHz4qqMgZhvPsNK2FAsEUjv2VhouJKd2f+qm3AwsAJcWGSYB0anBm6Hp8TV0h1b3oW7E
         GSqezTy5PHgNZuzca3SMUF2wJJAkGMj+4jVSMQYFFhEATPXFLls/fc1e1kCSDHm6cr9I
         J45T/Oqe6vGPNCfhzrriScafbPRZ6W0Vr/xpW/MuEUDGLohAf+1+NBsayOePqvRp2Xr6
         RFaA==
X-Gm-Message-State: AOAM533oD2zCQfWZRMUWfj4DyG4MXg4M1p8TMwsQq3MO/SkkCbAs6+v1
        7JBq8NGDoivVmsloLAnwBRk=
X-Google-Smtp-Source: ABdhPJwnOg/94tevewXmWmpPeIRygQHuBS0cALICtRXom5vjoFLk1KD9/mZz2LzVM7LuKq8YWWbgOg==
X-Received: by 2002:a63:ba5c:: with SMTP id l28mr1198298pgu.311.1628727192143;
        Wed, 11 Aug 2021 17:13:12 -0700 (PDT)
Received: from thelio.localdomain ([2601:600:9b7f:8588:9108:eb77:f4ec:5b72])
        by smtp.gmail.com with ESMTPSA id l14sm3391348pjq.13.2021.08.11.17.13.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Aug 2021 17:13:11 -0700 (PDT)
From:   Dmitry Antipov <daantipov@gmail.com>
X-Google-Original-From: Dmitry Antipov <dmanti@microsoft.com>
To:     jikos@kernel.org, benjamin.tissoires@redhat.com,
        linux-input@vger.kernel.org, felipe.balbi@microsoft.com,
        jeff.glaum@microsoft.com
Cc:     Dmitry Antipov <dmanti@microsoft.com>
Subject: [PATCH] HID: Support Microsoft Surface Duo SPI-based touch controller driver as a module.
Date:   Wed, 11 Aug 2021 17:12:50 -0700
Message-Id: <20210812001250.1709418-1-dmanti@microsoft.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Surface Duo uses a touch digitizer that communicates to the main SoC via SPI
and presents itself as a HID device. This patch contains the changes needed
for the driver to work as a module: HID Core affordances for SPI devices,
addition of the new Device IDs, and a new quirk in hid-microsoft. The driver
itself is being prepared for a submission in the near future.

Signed-off-by: Dmitry Antipov dmanti@microsoft.com
---
 drivers/hid/hid-core.c      |  3 +++
 drivers/hid/hid-ids.h       |  2 ++
 drivers/hid/hid-microsoft.c | 15 +++++++++++++--
 drivers/hid/hid-quirks.c    |  2 ++
 include/linux/hid.h         |  2 ++
 5 files changed, 22 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
index 7db332139f7d..123a0e3a6b1a 100644
--- a/drivers/hid/hid-core.c
+++ b/drivers/hid/hid-core.c
@@ -2005,6 +2005,9 @@ int hid_connect(struct hid_device *hdev, unsigned int connect_mask)
 	case BUS_I2C:
 		bus = "I2C";
 		break;
+	case BUS_SPI:
+		bus = "SPI";
+		break;
 	case BUS_VIRTUAL:
 		bus = "VIRTUAL";
 		break;
diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 8f1893e68112..5c181d23a7ae 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -885,6 +885,8 @@
 #define USB_DEVICE_ID_MS_XBOX_ONE_S_CONTROLLER	0x02fd
 #define USB_DEVICE_ID_MS_PIXART_MOUSE    0x00cb
 #define USB_DEVICE_ID_8BITDO_SN30_PRO_PLUS      0x02e0
+#define SPI_DEVICE_ID_MS_SURFACE_G6_0	0x0c1d
+#define SPI_DEVICE_ID_MS_SURFACE_G6_1	0x0c42
 
 #define USB_VENDOR_ID_MOJO		0x8282
 #define USB_DEVICE_ID_RETRO_ADAPTER	0x3201
diff --git a/drivers/hid/hid-microsoft.c b/drivers/hid/hid-microsoft.c
index 071fd093a5f4..50ea1f68c285 100644
--- a/drivers/hid/hid-microsoft.c
+++ b/drivers/hid/hid-microsoft.c
@@ -27,6 +27,7 @@
 #define MS_DUPLICATE_USAGES	BIT(5)
 #define MS_SURFACE_DIAL		BIT(6)
 #define MS_QUIRK_FF		BIT(7)
+#define MS_NOHIDINPUT		BIT(8)
 
 struct ms_data {
 	unsigned long quirks;
@@ -367,6 +368,7 @@ static int ms_probe(struct hid_device *hdev, const struct hid_device_id *id)
 	unsigned long quirks = id->driver_data;
 	struct ms_data *ms;
 	int ret;
+	unsigned int connect_mask;
 
 	ms = devm_kzalloc(&hdev->dev, sizeof(*ms), GFP_KERNEL);
 	if (ms == NULL)
@@ -376,20 +378,25 @@ static int ms_probe(struct hid_device *hdev, const struct hid_device_id *id)
 
 	hid_set_drvdata(hdev, ms);
 
+	connect_mask = HID_CONNECT_DEFAULT | ((quirks & MS_HIDINPUT) ?
+			HID_CONNECT_HIDINPUT_FORCE : 0);
+
 	if (quirks & MS_NOGET)
 		hdev->quirks |= HID_QUIRK_NOGET;
 
 	if (quirks & MS_SURFACE_DIAL)
 		hdev->quirks |= HID_QUIRK_INPUT_PER_APP;
 
+	if (quirks & MS_NOHIDINPUT)
+		connect_mask &= ~HID_CONNECT_HIDINPUT;
+
 	ret = hid_parse(hdev);
 	if (ret) {
 		hid_err(hdev, "parse failed\n");
 		goto err_free;
 	}
 
-	ret = hid_hw_start(hdev, HID_CONNECT_DEFAULT | ((quirks & MS_HIDINPUT) ?
-				HID_CONNECT_HIDINPUT_FORCE : 0));
+	ret = hid_hw_start(hdev, connect_mask);
 	if (ret) {
 		hid_err(hdev, "hw start failed\n");
 		goto err_free;
@@ -450,6 +457,10 @@ static const struct hid_device_id ms_devices[] = {
 		.driver_data = MS_QUIRK_FF },
 	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_MICROSOFT, USB_DEVICE_ID_8BITDO_SN30_PRO_PLUS),
 		.driver_data = MS_QUIRK_FF },
+	{ HID_SPI_DEVICE(USB_VENDOR_ID_MICROSOFT, SPI_DEVICE_ID_MS_SURFACE_G6_0),
+		.driver_data = MS_NOHIDINPUT },
+	{ HID_SPI_DEVICE(USB_VENDOR_ID_MICROSOFT, SPI_DEVICE_ID_MS_SURFACE_G6_1),
+		.driver_data = MS_NOHIDINPUT },
 	{ }
 };
 MODULE_DEVICE_TABLE(hid, ms_devices);
diff --git a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
index 51b39bda9a9d..01609e5425b9 100644
--- a/drivers/hid/hid-quirks.c
+++ b/drivers/hid/hid-quirks.c
@@ -506,6 +506,8 @@ static const struct hid_device_id hid_have_special_driver[] = {
 	{ HID_USB_DEVICE(USB_VENDOR_ID_MICROSOFT, USB_DEVICE_ID_MS_DIGITAL_MEDIA_3KV1) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_MICROSOFT, USB_DEVICE_ID_MS_POWER_COVER) },
 	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_MICROSOFT, USB_DEVICE_ID_MS_PRESENTER_8K_BT) },
+	{ HID_SPI_DEVICE(USB_VENDOR_ID_MICROSOFT, SPI_DEVICE_ID_MS_SURFACE_G6_0) },
+	{ HID_SPI_DEVICE(USB_VENDOR_ID_MICROSOFT, SPI_DEVICE_ID_MS_SURFACE_G6_1) },
 #endif
 #if IS_ENABLED(CONFIG_HID_MONTEREY)
 	{ HID_USB_DEVICE(USB_VENDOR_ID_MONTEREY, USB_DEVICE_ID_GENIUS_KB29E) },
diff --git a/include/linux/hid.h b/include/linux/hid.h
index 9e067f937dbc..32823c6b65f6 100644
--- a/include/linux/hid.h
+++ b/include/linux/hid.h
@@ -684,6 +684,8 @@ struct hid_descriptor {
 	.bus = BUS_BLUETOOTH, .vendor = (ven), .product = (prod)
 #define HID_I2C_DEVICE(ven, prod)				\
 	.bus = BUS_I2C, .vendor = (ven), .product = (prod)
+#define HID_SPI_DEVICE(ven, prod)				\
+	.bus = BUS_SPI, .vendor = (ven), .product = (prod)
 
 #define HID_REPORT_ID(rep) \
 	.report_type = (rep)
-- 
2.25.1

