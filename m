Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 869AE6EFBE
	for <lists+linux-input@lfdr.de>; Sat, 20 Jul 2019 17:06:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728703AbfGTPF6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 20 Jul 2019 11:05:58 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:39265 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725858AbfGTPF6 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 20 Jul 2019 11:05:58 -0400
Received: by mail-wm1-f68.google.com with SMTP id u25so21133282wmc.4;
        Sat, 20 Jul 2019 08:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=e2/FC1aBpR9e3Ryt4WCIvoHF0DRkbD2VdF6iOoH5nEw=;
        b=mh/Ugh5T5kLxaED2zERQdPrlECyXs1c0QzjAb5vSlITnafoZbY4T0qFkeqXupj3vVN
         meCED6I5TQJLMITYn7dMEDsqsquEuoHaLcd4IIR1B5XlYThYpsurbNaYxVmvBmhR1Xd+
         yda2XL2sWicegcWOi/pdsHCf0IPdIoO0izNS07hRcnrlf4k1sxfKoJ93XOnRtzCU5xkT
         rxIu8wG2XSHvO5BasGli3y3X4AP3KDgpo8XnJN227VV0SesRA8np9dFFFzYLau3tdYOp
         V8H8U3NVngHiq7MTZuX3PS/DXEpAjJe5KzVkndGh6xAcnAouJ/szIk5pUy30+Q6UfSOH
         ZANw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=e2/FC1aBpR9e3Ryt4WCIvoHF0DRkbD2VdF6iOoH5nEw=;
        b=kAwv78GrmLRrAhGiCr5WvW+uNSvskyegFGIRFTLV9rUkkqxRnATdGkkb9gPC+gW+7V
         QZgkfY5QJs+5UphrMoWBINm5RST/h73a0fyJ6xgBeTAsK/X/xpccdV328pHbkFSBqmEG
         F3eWoHNDb7IA96c+NoFs4G9KdQBpNg8doIIRV6xi4Tpd35824q0/tDMAX4ROKnXSPD6I
         9xDR/xfU1G/HU7Orqqj/iXH/3E1pKFguT4h1cKEgNfQqzELFHZ7md9Rs33t9jEUpVlbA
         YYq6Zk6amu6XZPb2JIPT0N0GwU7kI6ZjhEJbxHFK74adTQMtYRrGBgRCGE929mKtVPl6
         cooQ==
X-Gm-Message-State: APjAAAXWLF0Xm4DQmjxLdn/tAjuLtGikzAmd7UtfggmyJ2+IWbFeoMTt
        eHVks564ETDBIU3FpkBoPkqVlw4G
X-Google-Smtp-Source: APXvYqyaJipV+CBALWy/vODWU4XLjaUcLb4VQr/m16R63XKsni7TgltqM9PngYw5nM0xMNh/9j+Vfg==
X-Received: by 2002:a7b:c247:: with SMTP id b7mr56046610wmj.13.1563635154308;
        Sat, 20 Jul 2019 08:05:54 -0700 (PDT)
Received: from xws.fritz.box (pD9EA3BA8.dip0.t-ipconnect.de. [217.234.59.168])
        by smtp.gmail.com with ESMTPSA id g8sm38326864wme.20.2019.07.20.08.05.53
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sat, 20 Jul 2019 08:05:53 -0700 (PDT)
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
Subject: [PATCH v3 2/2] Input: soc_button_array - Add support for newer surface devices
Date:   Sat, 20 Jul 2019 17:05:11 +0200
Message-Id: <20190720150511.95076-3-luzmaximilian@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190720150511.95076-1-luzmaximilian@gmail.com>
References: <20190720150511.95076-1-luzmaximilian@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Power and volume button support for 5th and 6th generation Microsoft
Surface devices via soc_button_array.

Note that these devices use the same MSHW0040 device as on the Surface
Pro 4, however the implementation is different (GPIOs vs. ACPI
notifications). Thus some checking is required to ensure we only load
this driver on the correct devices.

Signed-off-by: Maximilian Luz <luzmaximilian@gmail.com>
---
 drivers/input/misc/Kconfig            |   6 +-
 drivers/input/misc/soc_button_array.c | 141 +++++++++++++++++++++++---
 2 files changed, 131 insertions(+), 16 deletions(-)

diff --git a/drivers/input/misc/Kconfig b/drivers/input/misc/Kconfig
index d07c1eb15aa6..7d9ae394e597 100644
--- a/drivers/input/misc/Kconfig
+++ b/drivers/input/misc/Kconfig
@@ -813,10 +813,10 @@ config INPUT_IDEAPAD_SLIDEBAR
 
 config INPUT_SOC_BUTTON_ARRAY
 	tristate "Windows-compatible SoC Button Array"
-	depends on KEYBOARD_GPIO
+	depends on KEYBOARD_GPIO && ACPI
 	help
-	  Say Y here if you have a SoC-based tablet that originally
-	  runs Windows 8.
+	  Say Y here if you have a SoC-based tablet that originally runs
+	  Windows 8 or a Microsoft Surface Book 2, Pro 5, Laptop 1 or later.
 
 	  To compile this driver as a module, choose M here: the
 	  module will be called soc_button_array.
diff --git a/drivers/input/misc/soc_button_array.c b/drivers/input/misc/soc_button_array.c
index 5e59f8e57f8e..4d5150bebeef 100644
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
@@ -87,8 +98,13 @@ soc_button_device_create(struct platform_device *pdev,
 			continue;
 
 		gpio = soc_button_lookup_gpio(&pdev->dev, info->acpi_index);
-		if (!gpio_is_valid(gpio))
+		if (gpio < 0 && gpio != -ENOENT) {
+			error = gpio;
+			goto err_free_mem;
+		} else if (!gpio_is_valid(gpio)) {
+			/* Skip GPIO if not present */
 			continue;
+		}
 
 		gpio_keys[n_buttons].type = info->event_type;
 		gpio_keys[n_buttons].code = info->event_code;
@@ -310,6 +326,7 @@ static int soc_button_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	const struct acpi_device_id *id;
+	struct soc_device_data *device_data;
 	struct soc_button_info *button_info;
 	struct soc_button_data *priv;
 	struct platform_device *pd;
@@ -320,18 +337,20 @@ static int soc_button_probe(struct platform_device *pdev)
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
@@ -357,12 +376,32 @@ static int soc_button_probe(struct platform_device *pdev)
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
@@ -377,9 +416,85 @@ static struct soc_button_info soc_button_PNP0C40[] = {
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
+	u64 oem_platform_rev = 0;	// valid revisions are nonzero
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
+	/*
+	 * If the revision is zero here, the _DSM evaluation has failed. This
+	 * indicates that we have a Pro 4 or Book 1 and this driver should not
+	 * be used.
+	 */
+	if (oem_platform_rev == 0)
+		return -ENODEV;
+
+	dev_dbg(dev, "OEM Platform Revision %llu\n", oem_platform_rev);
+
+	gpios = gpiod_count(dev, NULL);
+	if (gpios < 0)
+		return -ENODEV;
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
2.22.0

