Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C35ED5C65E
	for <lists+linux-input@lfdr.de>; Tue,  2 Jul 2019 02:38:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726977AbfGBAi3 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 1 Jul 2019 20:38:29 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:40599 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727104AbfGBAi3 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 1 Jul 2019 20:38:29 -0400
Received: by mail-wr1-f66.google.com with SMTP id p11so15707517wre.7;
        Mon, 01 Jul 2019 17:38:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=A7LKzlFzG/kCLPXP/RzAqLpBHe+BaUsMQGKkOxGO064=;
        b=a2ds5/Yhj2PFOKmjMRon22IhII3sfV5TFDB+hBY9kYMMRYrnuL0viYi5/ko3wA1Obs
         5O6BL8+vxreAil1BMPM1tRKiq4oIspkTfm3qUx2cJyK9euzEGmoFvTy434nN5orhZtyB
         tZezn+fluk+lc8kLGmHbIf3gUrKS7yz5jmfY2fMq4dA9UwVcvLJA3J3hD3Fh/AF/rdb4
         +nwSsxdJ35A+rfhm14EnBEzWRnu664GrvBMxqpHLPPTaqJELZL2getJ5nTKuBrrzt6t1
         VjnvFlco+lXGfpadpN0URYx7nxT3SOjLQhOsrtqFg2JI7FExB1Ebx037W0Rvg95f5rZQ
         wATQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=A7LKzlFzG/kCLPXP/RzAqLpBHe+BaUsMQGKkOxGO064=;
        b=ZymmMzlbxG14JPJMtkcnHKK85NRYyygmCwfFa0ex0q36mEe+C7TXQyQrc6FyQLzvd6
         kQNXpx4XV0FxBKKmEG4Vr3cMj1XBkwORqoiorAlh4b59oLM7gZEj032OQ0+FjpKYkdxl
         BI/cSUrm8VhpLZMwpgw8nORuVPNbsFAlDEmnbDP2Rz7ISyYnwOD/pGuhP7PZZR/X9v9v
         t/NeHA0SM2KtGJ9skyPD55vTvJSDMyCArnMCiGsuLUD1LpfdFbfODTojGM+7cpAAMlcq
         1tzEOG1a7QFQPbIUZGNkQ29Hr2oicE5BZj1E0HfDy4VaWunz4ZFCZ6GDN3nsH9q+bLvv
         Ynag==
X-Gm-Message-State: APjAAAUAImH+vDCGO1CcIZSlHzcHv+l1CWBWl4+EmiFFM55RLSzmgog3
        964rzB4/gzBoSkeOk04WItLEQuOs
X-Google-Smtp-Source: APXvYqwrrpQDSqqs0Q4x8K7t+E3hai8du2vbImdgny+wn5amVFJUYo73He7V0xihYh0xvFd7HYCzYw==
X-Received: by 2002:a5d:63cb:: with SMTP id c11mr20681647wrw.65.1562027905920;
        Mon, 01 Jul 2019 17:38:25 -0700 (PDT)
Received: from xws.fritz.box (p5487BBD4.dip0.t-ipconnect.de. [84.135.187.212])
        by smtp.gmail.com with ESMTPSA id 60sm3066087wrc.68.2019.07.01.17.38.24
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 01 Jul 2019 17:38:25 -0700 (PDT)
From:   Maximilian Luz <luzmaximilian@gmail.com>
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        platform-driver-x86@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Chen Yu <yu.c.chen@intel.com>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Maximilian Luz <luzmaximilian@gmail.com>
Subject: [PATCH v2 2/2] input: soc_button_array for newer surface devices
Date:   Tue,  2 Jul 2019 02:37:40 +0200
Message-Id: <20190702003740.75970-3-luzmaximilian@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190702003740.75970-1-luzmaximilian@gmail.com>
References: <20190702003740.75970-1-luzmaximilian@gmail.com>
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
 drivers/input/misc/soc_button_array.c | 145 +++++++++++++++++++++++---
 1 file changed, 133 insertions(+), 12 deletions(-)

diff --git a/drivers/input/misc/soc_button_array.c b/drivers/input/misc/soc_button_array.c
index 5e59f8e57f8e..8bd6909f8d1f 100644
--- a/drivers/input/misc/soc_button_array.c
+++ b/drivers/input/misc/soc_button_array.c
@@ -25,6 +25,17 @@ struct soc_button_info {
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
@@ -310,6 +321,7 @@ static int soc_button_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	const struct acpi_device_id *id;
+	struct soc_device_data *device_data;
 	struct soc_button_info *button_info;
 	struct soc_button_data *priv;
 	struct platform_device *pd;
@@ -320,18 +332,20 @@ static int soc_button_probe(struct platform_device *pdev)
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
@@ -357,12 +371,32 @@ static int soc_button_probe(struct platform_device *pdev)
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
@@ -377,9 +411,96 @@ static struct soc_button_info soc_button_PNP0C40[] = {
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
+#ifdef CONFIG_ACPI
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
+#else   /* CONFIG_ACPI */
+
+static int soc_device_check_MSHW0040(struct device *dev)
+{
+    return -ENODEV;
+}
+
+#endif  /* CONFIG_ACPI */
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
2.22.0

