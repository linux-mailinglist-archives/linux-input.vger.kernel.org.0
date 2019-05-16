Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 16B882098A
	for <lists+linux-input@lfdr.de>; Thu, 16 May 2019 16:27:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727331AbfEPO04 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 16 May 2019 10:26:56 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:37790 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726687AbfEPO04 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 16 May 2019 10:26:56 -0400
Received: by mail-wm1-f65.google.com with SMTP id 7so3707604wmo.2;
        Thu, 16 May 2019 07:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CGGFLE66NJIixGbJjpnk8Qt07MLG+TM53V4ysfcf/WE=;
        b=H3q5HrP0JD2ZStccqlX87Zvpf6Lv6UhdXA0cuIiBi24Tu/Gt2Wg4s4AzS50KnfSMtH
         EzWquI/xV2Z5cnr4LJiHP8XJN51qDELflhqEYvNbxnwvMjsEBdiy5NQ7b3YNckWEErpH
         FdlG1mkyp5c4NeiLLYGoT7dNiHDJr3PCfcZeHDOiaHdvIvWakz1L1kJMH6SD7bjUbbcY
         HfjiGGHy4QhkBtqUoBcv+dDCSrjHk/h0hOBf8TMr12tnC5kRYpH7uORvWeEhxljhZDyz
         Aar9wMbZ5dqxuqSgEC5Ykw5EOiDUaUMKSVFP6Z5zHNc/KC367YVvbXW7MpngJ9XYENfN
         vJvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CGGFLE66NJIixGbJjpnk8Qt07MLG+TM53V4ysfcf/WE=;
        b=Xb/cquqWjVnrzG56jz1DXgkb5qBhh/VPrf57fVZa5/BL2VimunystRZxCnusLmZzgn
         Rqj4J/ifq3yzS3w0We9EYtiYVtzVBLghiNVFrB4WSzz/L5YIV4dAWccN5EfwKHQ7BggB
         SxQBSxLcFLz+L1aUGCF0URqY7xZ8JO0h6gFJDVNPcKwPV2SJ2so4pHUAUwG46V1yRRI6
         sQnPCnT2xo9MQncqvM4vho8QVQIptJcldqfxZfmpUex/RF20JLZmAHCQXyHx7yRQhCHm
         yEonruJdKsqy8HmAo/HtOUiCBf3Ye+5pvWFn21aPdwX/OlTW79avNJB36dIZaVnK5kN3
         CNMw==
X-Gm-Message-State: APjAAAVgIhvhr+q5Jn3po/HtmDUcVDmzznZIjjLyUTXac/DsB4QZ1Llg
        lrKTtmEVPL60gZVAMRTzmh4ksyCYHYY=
X-Google-Smtp-Source: APXvYqybcjsi4VHywLwqoNRjRjLc2nJSHdakupubuXHoceUxu+OIKpWsl8tQlZziHymhV1KNPVUrvw==
X-Received: by 2002:a1c:e144:: with SMTP id y65mr27138625wmg.147.1558016812553;
        Thu, 16 May 2019 07:26:52 -0700 (PDT)
Received: from xws.fritz.box (pD9EA30D0.dip0.t-ipconnect.de. [217.234.48.208])
        by smtp.gmail.com with ESMTPSA id q4sm4852427wrx.25.2019.05.16.07.26.51
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 16 May 2019 07:26:52 -0700 (PDT)
From:   Maximilian Luz <luzmaximilian@gmail.com>
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        platform-driver-x86@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Chen Yu <yu.c.chen@intel.com>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        Maximilian Luz <luzmaximilian@gmail.com>
Subject: [RFC 2/2] input: soc_button_array for newer surface devices
Date:   Thu, 16 May 2019 16:25:23 +0200
Message-Id: <20190516142523.117978-3-luzmaximilian@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190516142523.117978-1-luzmaximilian@gmail.com>
References: <20190516142523.117978-1-luzmaximilian@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Power and volume button support for 5th and 6th genration Microsoft
Surface devices via soc_button_array.

Note that these devices use the same MSHW0040 device as on the Surface
Pro 4, however the implementation is different (GPIOs vs. ACPI
notifications). Thus some checking is required to ensure we only load
this driver on the correct devices.

Signed-off-by: Maximilian Luz <luzmaximilian@gmail.com>
---
 drivers/input/misc/soc_button_array.c | 134 +++++++++++++++++++++++---
 1 file changed, 122 insertions(+), 12 deletions(-)

diff --git a/drivers/input/misc/soc_button_array.c b/drivers/input/misc/soc_button_array.c
index bb458beecb43..dd67753bbf6e 100644
--- a/drivers/input/misc/soc_button_array.c
+++ b/drivers/input/misc/soc_button_array.c
@@ -29,6 +29,17 @@ struct soc_button_info {
 	bool wakeup;
 };
 
+/**
+ * struct soc_device_data - driver data for different device types
+ * @button_info: specifications of buttons, if NULL specification is assumed to
+ *               be present in _DSD
+ * @check: device-specific check (NULL means all will be accepted)
+ */
+struct soc_device_data {
+	struct soc_button_info *button_info;
+	int (*check)(struct device *dev);
+};
+
 /*
  * Some of the buttons like volume up/down are auto repeat, while others
  * are not. To support both, we register two platform devices, and put
@@ -314,6 +325,7 @@ static int soc_button_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	const struct acpi_device_id *id;
+	struct soc_device_data *device_data;
 	struct soc_button_info *button_info;
 	struct soc_button_data *priv;
 	struct platform_device *pd;
@@ -324,18 +336,20 @@ static int soc_button_probe(struct platform_device *pdev)
 	if (!id)
 		return -ENODEV;
 
-	if (!id->driver_data) {
+	device_data = (struct soc_device_data *)id->driver_data;
+	if (device_data && device_data->check) {
+		error = device_data->check(dev);
+		if (error)
+			return error;
+	}
+
+	if (device_data && device_data->button_info) {
+		button_info = (struct soc_button_info *)
+				device_data->button_info;
+	} else {
 		button_info = soc_button_get_button_info(dev);
 		if (IS_ERR(button_info))
 			return PTR_ERR(button_info);
-	} else {
-		button_info = (struct soc_button_info *)id->driver_data;
-	}
-
-	error = gpiod_count(dev, NULL);
-	if (error < 0) {
-		dev_dbg(dev, "no GPIO attached, ignoring...\n");
-		return -ENODEV;
 	}
 
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
@@ -361,12 +375,32 @@ static int soc_button_probe(struct platform_device *pdev)
 	if (!priv->children[0] && !priv->children[1])
 		return -ENODEV;
 
-	if (!id->driver_data)
+	if (!device_data || !device_data->button_info)
 		devm_kfree(dev, button_info);
 
 	return 0;
 }
 
+
+static int soc_device_check_generic(struct device *dev)
+{
+	int gpios;
+
+	gpios = gpiod_count(dev, NULL);
+	if (gpios < 0) {
+		dev_dbg(dev, "no GPIO attached, ignoring...\n");
+		return -ENODEV;
+	}
+
+	return 0;
+}
+
+static struct soc_device_data soc_device_ACPI0011 = {
+	.button_info = NULL,
+	.check = soc_device_check_generic,
+};
+
+
 /*
  * Definition of buttons on the tablet. The ACPI index of each button
  * is defined in section 2.8.7.2 of "Windows ACPI Design Guide for SoC
@@ -381,9 +415,85 @@ static struct soc_button_info soc_button_PNP0C40[] = {
 	{ }
 };
 
+static struct soc_device_data soc_device_PNP0C40 = {
+	.button_info = soc_button_PNP0C40,
+	.check = soc_device_check_generic,
+};
+
+
+/*
+ * Special device check for Surface Book 2 and Surface Pro (2017).
+ * Both, the Surface Pro 4 (surfacepro3_button.c) and the above mentioned
+ * devices use MSHW0040 for power and volume buttons, however the way they
+ * have to be addressed differs. Make sure that we only load this drivers
+ * for the correct devices by checking the OEM Platform Revision provided by
+ * the _DSM method.
+ */
+#define MSHW0040_DSM_REVISION		0x01
+#define MSHW0040_DSM_GET_OMPR		0x02	// get OEM Platform Revision
+static const guid_t MSHW0040_DSM_UUID =
+	GUID_INIT(0x6fd05c69, 0xcde3, 0x49f4, 0x95, 0xed, 0xab, 0x16, 0x65,
+		  0x49, 0x80, 0x35);
+
+static int soc_device_check_MSHW0040(struct device *dev)
+{
+	acpi_handle handle = ACPI_HANDLE(dev);
+	union acpi_object *result;
+	u64 oem_platform_rev = 0;
+	int gpios;
+
+	// get OEM platform revision
+	result = acpi_evaluate_dsm_typed(handle, &MSHW0040_DSM_UUID,
+					 MSHW0040_DSM_REVISION,
+					 MSHW0040_DSM_GET_OMPR, NULL,
+					 ACPI_TYPE_INTEGER);
+
+	if (result) {
+		oem_platform_rev = result->integer.value;
+		ACPI_FREE(result);
+	}
+
+	if (oem_platform_rev == 0)
+		return -ENODEV;
+
+	dev_dbg(dev, "OEM Platform Revision %llu\n", oem_platform_rev);
+
+	/*
+	 * We are _really_ expecting GPIOs here. If we do not get any, this
+	 * means the GPIO driver has not been loaded yet (which can happen).
+	 * Try again later.
+	 */
+	gpios = gpiod_count(dev, NULL);
+	if (gpios < 0)
+		return -EAGAIN;
+
+	return 0;
+}
+
+/*
+ * Button infos for Microsoft Surface Book 2 and Surface Pro (2017).
+ * Obtained from DSDT/testing.
+ */
+static struct soc_button_info soc_button_MSHW0040[] = {
+	{ "power", 0, EV_KEY, KEY_POWER, false, true },
+	{ "volume_up", 2, EV_KEY, KEY_VOLUMEUP, true, false },
+	{ "volume_down", 4, EV_KEY, KEY_VOLUMEDOWN, true, false },
+	{ }
+};
+
+static struct soc_device_data soc_device_MSHW0040 = {
+	.button_info = soc_button_MSHW0040,
+	.check = soc_device_check_MSHW0040,
+};
+
+
 static const struct acpi_device_id soc_button_acpi_match[] = {
-	{ "PNP0C40", (unsigned long)soc_button_PNP0C40 },
-	{ "ACPI0011", 0 },
+	{ "PNP0C40", (unsigned long)&soc_device_PNP0C40 },
+	{ "ACPI0011", (unsigned long)&soc_device_ACPI0011 },
+
+	/* Microsoft Surface Devices (5th and 6th generation) */
+	{ "MSHW0040", (unsigned long)&soc_device_MSHW0040 },
+
 	{ }
 };
 
-- 
2.21.0

