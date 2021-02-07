Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E9213127A3
	for <lists+linux-input@lfdr.de>; Sun,  7 Feb 2021 22:50:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229548AbhBGVt5 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 7 Feb 2021 16:49:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229537AbhBGVt5 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 7 Feb 2021 16:49:57 -0500
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 210D7C061788
        for <linux-input@vger.kernel.org>; Sun,  7 Feb 2021 13:49:17 -0800 (PST)
Received: by mail-pf1-x436.google.com with SMTP id o20so8493653pfu.0
        for <linux-input@vger.kernel.org>; Sun, 07 Feb 2021 13:49:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gaikai-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KDnBF2IkkLECZH/rR3dXgLqthidzNoRwZoSFKlZvlWA=;
        b=EUpQsG3UczmxapmXuqjGWFYAgxiBNCJEvs/jzZRsVRllS3WLVprC1xsaVnA05AddC/
         8IvMOor+mvktPNTPEX2RGGtUStvd7Spc3F1M8+uXpd00e2aWAnm8Zby+RvKjOBC1ngFj
         vbjcEuMFOrxOv4a6yJGcoAb1WkwA+h4+eb5E3lSaSfVIS1u/aV85mMDPO5B6EKU3Zi4W
         Gnw/E+iviDG6g8iymJg/X5UgbJWcWwKyOznchSXYbvE93WuPu/2Fq87JonQfte+4rkvf
         YmoDisgZjAfRG8cEipSpDsO/oCWAftK73pDsJVwd8EfZT8jP24Gke+MSfsjG5HiPNc71
         wWTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KDnBF2IkkLECZH/rR3dXgLqthidzNoRwZoSFKlZvlWA=;
        b=CFiP22uYeU5hfl+dPBhb5O7TvIWLxA70VIRf4k950tIdjAFDpNGycWymYR3Qthtlgm
         BfBEwW/X+/AARtkvZLn3jlFgwWm8G2QwrTnfLcFrMZVT6y8w8+rEpcJkjlAsvZXIG8Q8
         K3ljwpNf7zfciLLjvfUYU0gMwkCixvQDJA557hbr0SGyzXXfBiziF4teu/CtnqtfDb7u
         Xdx8x8oEn3O2lIogAJADmzvUeWOYec3P9fxLiftv82zQt+d0DrY0JooGk7shUgbn5g7d
         it7smpvw+gDvKueJPmYh+tv2ybUndCifJCVCfSzJ7zKZGqgkvpnYH2KwsAerI7YrhgSO
         pc8g==
X-Gm-Message-State: AOAM532wxYtJq+QUbdGb/8Dcdk9sxWybIroFeMn5F/6h3J/ksnfPBA9C
        o3BV3Xkvl913vINRxW2ioue/eQ==
X-Google-Smtp-Source: ABdhPJwTaRl359h9vziH1iwLeYY0878H+yNFZXD8prsfYM7au2a2JMZ71GqialSc4UiipUVatKzL4Q==
X-Received: by 2002:aa7:8501:0:b029:1da:56dd:8440 with SMTP id v1-20020aa785010000b02901da56dd8440mr7478695pfn.15.1612734556696;
        Sun, 07 Feb 2021 13:49:16 -0800 (PST)
Received: from us8c16456344dc.lan (cpe-76-87-77-78.socal.res.rr.com. [76.87.77.78])
        by smtp.gmail.com with ESMTPSA id a141sm16578991pfa.189.2021.02.07.13.49.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Feb 2021 13:49:16 -0800 (PST)
From:   Roderick Colenbrander <roderick@gaikai.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-input@vger.kernel.org, Chris Ye <lzye@google.com>,
        =?UTF-8?q?Barnab=C3=A1s=20P=C5=91cze?= <pobrn@protonmail.com>,
        =?UTF-8?q?Samuel=20=C4=8Cavoj?= <sammko@sammserver.com>,
        =?UTF-8?q?Florian=20M=C3=A4rkl?= <linux@florianmaerkl.de>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Subject: [PATCH v6 03/13] HID: playstation: add DualSense battery support.
Date:   Sun,  7 Feb 2021 13:48:58 -0800
Message-Id: <20210207214908.79573-4-roderick@gaikai.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210207214908.79573-1-roderick@gaikai.com>
References: <20210207214908.79573-1-roderick@gaikai.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Roderick Colenbrander <roderick.colenbrander@sony.com>

Report DualSense battery status information through power_supply class.

Signed-off-by: Roderick Colenbrander <roderick.colenbrander@sony.com>
---
 drivers/hid/Kconfig           |   1 +
 drivers/hid/hid-playstation.c | 140 +++++++++++++++++++++++++++++++++-
 2 files changed, 138 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
index 0aefbb81ba43..0c141f2312f7 100644
--- a/drivers/hid/Kconfig
+++ b/drivers/hid/Kconfig
@@ -856,6 +856,7 @@ config HID_PLANTRONICS
 config HID_PLAYSTATION
 	tristate "PlayStation HID Driver"
 	depends on HID
+	select POWER_SUPPLY
 	help
 	  Provides support for Sony PS5 controllers including support for
 	  its special functionalities e.g. touchpad, lights and motion
diff --git a/drivers/hid/hid-playstation.c b/drivers/hid/hid-playstation.c
index aca49637ef2f..3bb5091be308 100644
--- a/drivers/hid/hid-playstation.c
+++ b/drivers/hid/hid-playstation.c
@@ -20,6 +20,13 @@
 /* Base class for playstation devices. */
 struct ps_device {
 	struct hid_device *hdev;
+	spinlock_t lock;
+
+	struct power_supply_desc battery_desc;
+	struct power_supply *battery;
+	uint8_t battery_capacity;
+	int battery_status;
+
 	uint8_t mac_address[6]; /* Note: stored in little endian order. */
 
 	int (*parse_report)(struct ps_device *dev, struct hid_report *report, u8 *data, int size);
@@ -48,6 +55,11 @@ struct ps_device {
 #define DS_BUTTONS2_PS_HOME	BIT(0)
 #define DS_BUTTONS2_TOUCHPAD	BIT(1)
 
+/* Status field of DualSense input report. */
+#define DS_STATUS_BATTERY_CAPACITY	GENMASK(3, 0)
+#define DS_STATUS_CHARGING		GENMASK(7, 4)
+#define DS_STATUS_CHARGING_SHIFT	4
+
 struct dualsense {
 	struct ps_device base;
 	struct input_dev *gamepad;
@@ -140,6 +152,81 @@ static struct input_dev *ps_allocate_input_dev(struct hid_device *hdev, const ch
 	return input_dev;
 }
 
+static enum power_supply_property ps_power_supply_props[] = {
+	POWER_SUPPLY_PROP_STATUS,
+	POWER_SUPPLY_PROP_PRESENT,
+	POWER_SUPPLY_PROP_CAPACITY,
+	POWER_SUPPLY_PROP_SCOPE,
+};
+
+static int ps_battery_get_property(struct power_supply *psy,
+		enum power_supply_property psp,
+		union power_supply_propval *val)
+{
+	struct ps_device *dev = power_supply_get_drvdata(psy);
+	uint8_t battery_capacity;
+	int battery_status;
+	unsigned long flags;
+	int ret;
+
+	spin_lock_irqsave(&dev->lock, flags);
+	battery_capacity = dev->battery_capacity;
+	battery_status = dev->battery_status;
+	spin_unlock_irqrestore(&dev->lock, flags);
+
+	switch (psp) {
+	case POWER_SUPPLY_PROP_STATUS:
+		val->intval = battery_status;
+		break;
+	case POWER_SUPPLY_PROP_PRESENT:
+		val->intval = 1;
+		break;
+	case POWER_SUPPLY_PROP_CAPACITY:
+		val->intval = battery_capacity;
+		break;
+	case POWER_SUPPLY_PROP_SCOPE:
+		val->intval = POWER_SUPPLY_SCOPE_DEVICE;
+		break;
+	default:
+		ret = -EINVAL;
+		break;
+	}
+
+	return 0;
+}
+
+static int ps_device_register_battery(struct ps_device *dev)
+{
+	struct power_supply *battery;
+	struct power_supply_config battery_cfg = { .drv_data = dev };
+	int ret;
+
+	dev->battery_desc.type = POWER_SUPPLY_TYPE_BATTERY;
+	dev->battery_desc.properties = ps_power_supply_props;
+	dev->battery_desc.num_properties = ARRAY_SIZE(ps_power_supply_props);
+	dev->battery_desc.get_property = ps_battery_get_property;
+	dev->battery_desc.name = devm_kasprintf(&dev->hdev->dev, GFP_KERNEL,
+			"ps-controller-battery-%pMR", dev->mac_address);
+	if (!dev->battery_desc.name)
+		return -ENOMEM;
+
+	battery = devm_power_supply_register(&dev->hdev->dev, &dev->battery_desc, &battery_cfg);
+	if (IS_ERR(battery)) {
+		ret = PTR_ERR(battery);
+		hid_err(dev->hdev, "Unable to register battery device: %d\n", ret);
+		return ret;
+	}
+	dev->battery = battery;
+
+	ret = power_supply_powers(dev->battery, &dev->hdev->dev);
+	if (ret) {
+		hid_err(dev->hdev, "Unable to activate battery device: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
 static struct input_dev *ps_gamepad_create(struct hid_device *hdev)
 {
 	struct input_dev *gamepad;
@@ -223,7 +310,9 @@ static int dualsense_parse_report(struct ps_device *ps_dev, struct hid_report *r
 	struct hid_device *hdev = ps_dev->hdev;
 	struct dualsense *ds = container_of(ps_dev, struct dualsense, base);
 	struct dualsense_input_report *ds_report;
-	uint8_t value;
+	uint8_t battery_data, battery_capacity, charging_status, value;
+	int battery_status;
+	unsigned long flags;
 
 	/*
 	 * DualSense in USB uses the full HID report for reportID 1, but
@@ -266,12 +355,49 @@ static int dualsense_parse_report(struct ps_device *ps_dev, struct hid_report *r
 	input_report_key(ds->gamepad, BTN_MODE,   ds_report->buttons[2] & DS_BUTTONS2_PS_HOME);
 	input_sync(ds->gamepad);
 
+	battery_data = ds_report->status & DS_STATUS_BATTERY_CAPACITY;
+	charging_status = (ds_report->status & DS_STATUS_CHARGING) >> DS_STATUS_CHARGING_SHIFT;
+
+	switch (charging_status) {
+	case 0x0:
+		/*
+		 * Each unit of battery data corresponds to 10%
+		 * 0 = 0-9%, 1 = 10-19%, .. and 10 = 100%
+		 */
+		battery_capacity = min(battery_data * 10 + 5, 100);
+		battery_status = POWER_SUPPLY_STATUS_DISCHARGING;
+		break;
+	case 0x1:
+		battery_capacity = min(battery_data * 10 + 5, 100);
+		battery_status = POWER_SUPPLY_STATUS_CHARGING;
+		break;
+	case 0x2:
+		battery_capacity = 100;
+		battery_status = POWER_SUPPLY_STATUS_FULL;
+		break;
+	case 0xa: /* voltage or temperature out of range */
+	case 0xb: /* temperature error */
+		battery_capacity = 0;
+		battery_status = POWER_SUPPLY_STATUS_NOT_CHARGING;
+		break;
+	case 0xf: /* charging error */
+	default:
+		battery_capacity = 0;
+		battery_status = POWER_SUPPLY_STATUS_UNKNOWN;
+	}
+
+	spin_lock_irqsave(&ps_dev->lock, flags);
+	ps_dev->battery_capacity = battery_capacity;
+	ps_dev->battery_status = battery_status;
+	spin_unlock_irqrestore(&ps_dev->lock, flags);
+
 	return 0;
 }
 
 static struct ps_device *dualsense_create(struct hid_device *hdev)
 {
 	struct dualsense *ds;
+	struct ps_device *ps_dev;
 	int ret;
 
 	ds = devm_kzalloc(&hdev->dev, sizeof(*ds), GFP_KERNEL);
@@ -284,8 +410,12 @@ static struct ps_device *dualsense_create(struct hid_device *hdev)
 	 */
 	hdev->version |= HID_PLAYSTATION_VERSION_PATCH;
 
-	ds->base.hdev = hdev;
-	ds->base.parse_report = dualsense_parse_report;
+	ps_dev = &ds->base;
+	ps_dev->hdev = hdev;
+	spin_lock_init(&ps_dev->lock);
+	ps_dev->battery_capacity = 100; /* initial value until parse_report. */
+	ps_dev->battery_status = POWER_SUPPLY_STATUS_UNKNOWN;
+	ps_dev->parse_report = dualsense_parse_report;
 	hid_set_drvdata(hdev, ds);
 
 	ret = dualsense_get_mac_address(ds);
@@ -301,6 +431,10 @@ static struct ps_device *dualsense_create(struct hid_device *hdev)
 		goto err;
 	}
 
+	ret = ps_device_register_battery(ps_dev);
+	if (ret)
+		goto err;
+
 	return &ds->base;
 
 err:
-- 
2.26.2

