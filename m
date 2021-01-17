Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6EF822F9667
	for <lists+linux-input@lfdr.de>; Mon, 18 Jan 2021 00:48:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729880AbhAQXr7 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 17 Jan 2021 18:47:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730849AbhAQXp3 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 17 Jan 2021 18:45:29 -0500
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9477DC061757
        for <linux-input@vger.kernel.org>; Sun, 17 Jan 2021 15:44:48 -0800 (PST)
Received: by mail-pf1-x436.google.com with SMTP id o20so745649pfu.0
        for <linux-input@vger.kernel.org>; Sun, 17 Jan 2021 15:44:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gaikai-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lCAr4yY+MvpnQfIk4J8PBh5UeHYogXKrkou3WSyAz58=;
        b=kdsXFCrL33Us7SGJ1IpqNGj6pdXIX1aHCUbX4LJHTMkSDiz3ZmhG5U0H4BSpjmeye7
         NBup/ZAp/KWqMLE0KDq0/CxxyhHJKXennVA67Al4Gpkn/VyYz4ALWOCvyVteSFdY8bpl
         MzUm/et+OQGqd1WdG1GvFI+sDEtyKLT2lzE6W6o14fF4HMfg+oxlPwr5keWC6Q/BnwGc
         6fDhJRzbmSR23wJCxqKFXFyvXi9fqM4rvd7gnSNkcEC116WvBjL05J5Z9HEAZzYvi2+v
         YQKY+29XIQClkA9qgwiwt30sFKSaMXSv+BeIdqasAL5/sQnCftlzDu2uJIXn7pS9aPGc
         cJ0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lCAr4yY+MvpnQfIk4J8PBh5UeHYogXKrkou3WSyAz58=;
        b=moM5pfjncy77F8H+bH+OkVbO4ZzEqu1DmM7cIa2znCukujDetxENMq2qOIGueJthjm
         LHjPizm/IGdhYLu448fovGO2RnoB2dQ7KB6sqLYLPW1reEUsx/KacVAUllJbbnGFWJeg
         lmXgABW+vnwvmI7ISkBRwi/mPCtFnCQJNqIpLzbN1wgB4WwJgv4fI1V6l4vSWM0U64hy
         OnZpAUv7tKGDrINdGgxg3xS3MngphfPjvx7ZBYZgefQfFqzEBPfmeLjrtVsBTfocM/BF
         CsNyoIeR165xRaZKAAwNmM7+NNfhPP3DZ75JMN8fBrO74M0C33t0NCkKSbEF93cKuitU
         qFIA==
X-Gm-Message-State: AOAM531arx6JAI/L5ytKZ0bQwRSgnp6Vqh+68RuDVPq3wriVM60Z1pxR
        lTQlIUMEMunlA8SA7OHRsw1Leg==
X-Google-Smtp-Source: ABdhPJz+0Ul92nWal4BlcJUDdiP7od5T4IflFSXh7tTXEDBJKF7RwD2Vf0R/MTl36nHxWSbdqXk8Dw==
X-Received: by 2002:a62:8012:0:b029:1b7:c65b:92f2 with SMTP id j18-20020a6280120000b02901b7c65b92f2mr1753150pfd.23.1610927088181;
        Sun, 17 Jan 2021 15:44:48 -0800 (PST)
Received: from us8c16456344dc.lan (cpe-76-87-77-78.socal.res.rr.com. [76.87.77.78])
        by smtp.gmail.com with ESMTPSA id i2sm14721568pjd.21.2021.01.17.15.44.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jan 2021 15:44:47 -0800 (PST)
From:   Roderick Colenbrander <roderick@gaikai.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-input@vger.kernel.org, Chris Ye <lzye@google.com>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Subject: [PATCH v4 03/13] HID: playstation: add DualSense battery support.
Date:   Sun, 17 Jan 2021 15:44:25 -0800
Message-Id: <20210117234435.180294-4-roderick@gaikai.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210117234435.180294-1-roderick@gaikai.com>
References: <20210117234435.180294-1-roderick@gaikai.com>
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
 drivers/hid/hid-playstation.c | 132 +++++++++++++++++++++++++++++++++-
 2 files changed, 130 insertions(+), 3 deletions(-)

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
index 2f24039dedbe..c5c450fc25db 100644
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
@@ -140,6 +152,73 @@ static struct input_dev *ps_allocate_input_dev(struct hid_device *hdev, const ch
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
+
+	dev->battery_desc.type = POWER_SUPPLY_TYPE_BATTERY;
+	dev->battery_desc.properties = ps_power_supply_props;
+	dev->battery_desc.num_properties = ARRAY_SIZE(ps_power_supply_props);
+	dev->battery_desc.get_property = ps_battery_get_property;
+	dev->battery_desc.name = devm_kasprintf(&dev->hdev->dev, GFP_KERNEL,
+			"ps-controller-battery-%pMR", dev->mac_address);
+
+	battery = devm_power_supply_register(&dev->hdev->dev, &dev->battery_desc, &battery_cfg);
+	if (IS_ERR(battery)) {
+		int ret = PTR_ERR(battery);
+		hid_err(dev->hdev, "Unable to register battery device: %d\n", ret);
+		return ret;
+	}
+	dev->battery = battery;
+
+	power_supply_powers(dev->battery, &dev->hdev->dev);
+	return 0;
+}
+
 static struct input_dev *ps_gamepad_create(struct hid_device *hdev)
 {
 	struct input_dev *gamepad;
@@ -222,7 +301,9 @@ static int dualsense_parse_report(struct ps_device *ps_dev, struct hid_report *r
 	struct hid_device *hdev = ps_dev->hdev;
 	struct dualsense *ds = container_of(ps_dev, struct dualsense, base);
 	struct dualsense_input_report *ds_report;
-	uint8_t value;
+	uint8_t battery_data, battery_capacity, charging_status, value;
+	int battery_status;
+	unsigned long flags;
 
 	/*
 	 * DualSense in USB uses the full HID report for reportID 1, but
@@ -265,12 +346,49 @@ static int dualsense_parse_report(struct ps_device *ps_dev, struct hid_report *r
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
@@ -283,8 +401,12 @@ static struct ps_device *dualsense_create(struct hid_device *hdev)
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
@@ -300,6 +422,10 @@ static struct ps_device *dualsense_create(struct hid_device *hdev)
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

