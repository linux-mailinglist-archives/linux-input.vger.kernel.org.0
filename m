Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F32D1777D2
	for <lists+linux-input@lfdr.de>; Sat, 27 Jul 2019 11:15:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728269AbfG0JOv (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 27 Jul 2019 05:14:51 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:42729 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727885AbfG0JOv (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 27 Jul 2019 05:14:51 -0400
Received: by mail-lj1-f195.google.com with SMTP id t28so53750765lje.9;
        Sat, 27 Jul 2019 02:14:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=YsdxTGInOL88hVI7lggfmpXZ5E2H33ZS5QyrN6XyTxk=;
        b=f1g6vtX5G3tPbjjgqck1uzakKXM0DYCkYNhCe7TCO9gtRurDO0TPyDCXhta4cN9cMW
         SQoXi8/yWXTJxWZwQJoVPB4+1CUas/gbidkVGB1FZefmA8ohK4PSKMm1djL5fKO+stBm
         0ZMFVwf6VKgWkZ7HET4wb4SMMKkoWjauI+hDuhSLL4V3aD7LE4ifWNCRPLfVzvebIAeU
         LrgqHyiQ6lX+6sMOwbR/MmK0Z4z8+gFHGsKyRtnI5MeMix5kZqU3dqj9QT277hP6Jnvv
         5YdiEBIUXhf9eyYYnSjWVizp/LLPhxH+Ykr5VFAsKW3oi5UjxJXqkE+63W8jLTiVlhLe
         QXMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=YsdxTGInOL88hVI7lggfmpXZ5E2H33ZS5QyrN6XyTxk=;
        b=iZ/Y80bnw0xzu7tf6HRF3Pzg31OHojn+a9FuVqllcrer13h5PYdWZIMJe5SkBHMBDH
         MSWrkyRZS19ZOwhRpXL/1bABWBR7BgUmRQkBxohCwdCzttJLzj6aQNYAVqIEoifg/0w5
         oi1WznMtfY56z5YhTtzdCxQDCn+cJds3VZHNqq/y+a/qnrAy0kGL7xF17aNdSqmCWyB2
         1JDV6eMbFdz/0au9/DJyGoMKKpowD6gpCy3tiu+aAAlW8oshZLQxXUZLcSQntTYU9YaZ
         wvJHmNEwVK9fXb2kWT9PWI/IMuMdB9xdCVq89YX0y7+ds2Kv/y2BntnQCh0GNebWL2u/
         fLew==
X-Gm-Message-State: APjAAAUymFLajbXIqc3c3428+VWWyf+x1amEz+UmCa/Z4CW43Ls8+rDp
        Iy+IdgrJ8gV+hZKw1T5NBtw=
X-Google-Smtp-Source: APXvYqyX7fv+q40GdTlbmv2YWa4mxZP02JXqJxVZR+n4Mq8nZZLsR7vRghN+jbGlolj+scOaLBbrNA==
X-Received: by 2002:a2e:b4d4:: with SMTP id r20mr26951428ljm.5.1564218887211;
        Sat, 27 Jul 2019 02:14:47 -0700 (PDT)
Received: from localhost ([188.170.223.67])
        by smtp.gmail.com with ESMTPSA id b9sm10830965ljj.92.2019.07.27.02.14.45
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 27 Jul 2019 02:14:45 -0700 (PDT)
Date:   Sat, 27 Jul 2019 12:14:43 +0300
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Maximilian Luz <luzmaximilian@gmail.com>
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        platform-driver-x86@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>,
        Chen Yu <yu.c.chen@intel.com>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Subject: Re: [PATCH v3 2/2] Input: soc_button_array - Add support for newer
 surface devices
Message-ID: <20190727091443.GC795@penguin>
References: <20190720150511.95076-1-luzmaximilian@gmail.com>
 <20190720150511.95076-3-luzmaximilian@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190720150511.95076-3-luzmaximilian@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Maximilian,

On Sat, Jul 20, 2019 at 05:05:11PM +0200, Maximilian Luz wrote:
> -
> -	error = gpiod_count(dev, NULL);
> -	if (error < 0) {
> -		dev_dbg(dev, "no GPIO attached, ignoring...\n");
> -		return -ENODEV;

I do not think we need to move this into individual "check" functions.
It is needed in all cases so we should keep it here.

How about version below?

Input: soc_button_array - add support for newer surface devices

From: Maximilian Luz <luzmaximilian@gmail.com>

Power and volume button support for 5th and 6th generation Microsoft
Surface devices via soc_button_array.

Note that these devices use the same MSHW0040 device as on the Surface
Pro 4, however the implementation is different (GPIOs vs. ACPI
notifications). Thus some checking is required to ensure we only load
this driver on the correct devices.

Signed-off-by: Maximilian Luz <luzmaximilian@gmail.com>
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/misc/Kconfig            |    6 +-
 drivers/input/misc/soc_button_array.c |  105 +++++++++++++++++++++++++++++----
 2 files changed, 96 insertions(+), 15 deletions(-)

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
index 5e59f8e57f8e..6f0133fe1546 100644
--- a/drivers/input/misc/soc_button_array.c
+++ b/drivers/input/misc/soc_button_array.c
@@ -25,6 +25,11 @@ struct soc_button_info {
 	bool wakeup;
 };
 
+struct soc_device_data {
+	const struct soc_button_info *button_info;
+	int (*check)(struct device *dev);
+};
+
 /*
  * Some of the buttons like volume up/down are auto repeat, while others
  * are not. To support both, we register two platform devices, and put
@@ -87,8 +92,13 @@ soc_button_device_create(struct platform_device *pdev,
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
@@ -309,23 +319,26 @@ static int soc_button_remove(struct platform_device *pdev)
 static int soc_button_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	const struct acpi_device_id *id;
-	struct soc_button_info *button_info;
+	const struct soc_device_data *device_data;
+	const struct soc_button_info *button_info;
 	struct soc_button_data *priv;
 	struct platform_device *pd;
 	int i;
 	int error;
 
-	id = acpi_match_device(dev->driver->acpi_match_table, dev);
-	if (!id)
-		return -ENODEV;
+	device_data = acpi_device_get_match_data(dev);
+	if (device_data && device_data->check) {
+		error = device_data->check(dev);
+		if (error)
+			return error;
+	}
 
-	if (!id->driver_data) {
+	if (device_data && device_data->button_info) {
+		button_info = device_data->button_info;
+	} else {
 		button_info = soc_button_get_button_info(dev);
 		if (IS_ERR(button_info))
 			return PTR_ERR(button_info);
-	} else {
-		button_info = (struct soc_button_info *)id->driver_data;
 	}
 
 	error = gpiod_count(dev, NULL);
@@ -357,7 +370,7 @@ static int soc_button_probe(struct platform_device *pdev)
 	if (!priv->children[0] && !priv->children[1])
 		return -ENODEV;
 
-	if (!id->driver_data)
+	if (!device_data || !device_data->button_info)
 		devm_kfree(dev, button_info);
 
 	return 0;
@@ -368,7 +381,7 @@ static int soc_button_probe(struct platform_device *pdev)
  * is defined in section 2.8.7.2 of "Windows ACPI Design Guide for SoC
  * Platforms"
  */
-static struct soc_button_info soc_button_PNP0C40[] = {
+static const struct soc_button_info soc_button_PNP0C40[] = {
 	{ "power", 0, EV_KEY, KEY_POWER, false, true },
 	{ "home", 1, EV_KEY, KEY_LEFTMETA, false, true },
 	{ "volume_up", 2, EV_KEY, KEY_VOLUMEUP, true, false },
@@ -377,9 +390,77 @@ static struct soc_button_info soc_button_PNP0C40[] = {
 	{ }
 };
 
+static const struct soc_device_data soc_device_PNP0C40 = {
+	.button_info = soc_button_PNP0C40,
+};
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
+	return 0;
+}
+
+/*
+ * Button infos for Microsoft Surface Book 2 and Surface Pro (2017).
+ * Obtained from DSDT/testing.
+ */
+static const struct soc_button_info soc_button_MSHW0040[] = {
+	{ "power", 0, EV_KEY, KEY_POWER, false, true },
+	{ "volume_up", 2, EV_KEY, KEY_VOLUMEUP, true, false },
+	{ "volume_down", 4, EV_KEY, KEY_VOLUMEDOWN, true, false },
+	{ }
+};
+
+static const struct soc_device_data soc_device_MSHW0040 = {
+	.button_info = soc_button_MSHW0040,
+	.check = soc_device_check_MSHW0040,
+};
+
 static const struct acpi_device_id soc_button_acpi_match[] = {
-	{ "PNP0C40", (unsigned long)soc_button_PNP0C40 },
+	{ "PNP0C40", (unsigned long)&soc_device_PNP0C40 },
 	{ "ACPI0011", 0 },
+
+	/* Microsoft Surface Devices (5th and 6th generation) */
+	{ "MSHW0040", (unsigned long)&soc_device_MSHW0040 },
+
 	{ }
 };
 

-- 
Dmitry
