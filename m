Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 784F22DED75
	for <lists+linux-input@lfdr.de>; Sat, 19 Dec 2020 07:24:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726347AbgLSGYY (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 19 Dec 2020 01:24:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726326AbgLSGYY (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 19 Dec 2020 01:24:24 -0500
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC883C061285
        for <linux-input@vger.kernel.org>; Fri, 18 Dec 2020 22:23:43 -0800 (PST)
Received: by mail-pl1-x62e.google.com with SMTP id v3so2562768plz.13
        for <linux-input@vger.kernel.org>; Fri, 18 Dec 2020 22:23:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gaikai-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mZExmW7iXFa7OvQ2NU0UVMluz1MqYzWFAsdd7+pcH3Y=;
        b=T5EFyUUt9tus+lcMLhDdJFRNlV+9XRQ5nkXz+tleFQL2wyhadR3bM55jTyqEdUlc7n
         MEZEt5snbsiTHPQp9lkNQyKJTbPHa67s57RhY/QuM5zcSiyrQ7F9KtafQQiD56xVsDW+
         Q15uJMTYI6qgwCQrdska3FaV/CtSGwnS06dXwNIRyqOUSXzLK8V7ahcJeEu7/cACAfou
         VTOAAXL6hSipzrhlokityWMl9kYoBTML6y3fj9DLhI3eH0cOy8gA13m4liju7zT2U9ou
         w5BPUm6yo7k07JQuiyDYeZw2SGEVWihTcat3hsMKihd/XtKDmBeuJHVV6XfVwPPHQvTn
         Y7Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mZExmW7iXFa7OvQ2NU0UVMluz1MqYzWFAsdd7+pcH3Y=;
        b=N1+nXcFS3qQ24iXQKVSUG9f9xEHnxyJiEb+MDtcARjVg5GO42/DyIdUJlOhe5LiZJZ
         rNGC2I+poga9CX9jBrUdC0+nqkqnT51g8r0KTbv//nxA9wur/CkBBitURJHpOBem3aXq
         Jx06ELXcmM0/YGCQUm1uUUknEhilrG1RJUmScaHbEvLLBn938Cl1+Flnfpj6cHdOOcmn
         P6D/398RG/ITJytFsUZ+oRa+NANZFeakTCmeFpoVaYg129yoO2cHiWtpPk/doZB8y0u1
         wGGQhxS8osyiBWfDRZMzt+/vpn/6VY1MwsztJz9IG6M8bOtWkorquySwzGBMY2uUM1JQ
         e7zg==
X-Gm-Message-State: AOAM530gdwSVDHlK50LN56LNFS/r7WIP4gm987AOkH0qCos67MzbKzmE
        0ZXw+jJ9Nq6aGA300nKqHXNiLQ==
X-Google-Smtp-Source: ABdhPJyAW0bFgkjjvpfPgreEe1+QOekq+84SEKlsqU4HazDRf1KAW8k4ERYZtzp/fKnSN6ZFTBQIPA==
X-Received: by 2002:a17:90a:ae02:: with SMTP id t2mr7704178pjq.169.1608359023541;
        Fri, 18 Dec 2020 22:23:43 -0800 (PST)
Received: from localhost.localdomain (cpe-76-87-77-78.socal.res.rr.com. [76.87.77.78])
        by smtp.gmail.com with ESMTPSA id bf3sm9655302pjb.45.2020.12.18.22.23.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Dec 2020 22:23:43 -0800 (PST)
From:   Roderick Colenbrander <roderick@gaikai.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-input@vger.kernel.org, Chris Ye <lzye@google.com>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Subject: [PATCH 03/13] HID: playstation: add DualSense battery support.
Date:   Fri, 18 Dec 2020 22:23:26 -0800
Message-Id: <20201219062336.72568-4-roderick@gaikai.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201219062336.72568-1-roderick@gaikai.com>
References: <20201219062336.72568-1-roderick@gaikai.com>
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
 drivers/hid/hid-playstation.c | 122 +++++++++++++++++++++++++++++++++-
 2 files changed, 122 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
index d3258e806998..ef175c1cb15c 100644
--- a/drivers/hid/Kconfig
+++ b/drivers/hid/Kconfig
@@ -857,6 +857,7 @@ config HID_PLAYSTATION
 	tristate "PlayStation HID Driver"
 	default !EXPERT
 	depends on HID
+	select POWER_SUPPLY
 	help
 	  Provides support for Sony PS5 controllers including support for
 	  its special functionalities e.g. touchpad, lights and motion
diff --git a/drivers/hid/hid-playstation.c b/drivers/hid/hid-playstation.c
index 88823a7ba1a0..598d262e2a08 100644
--- a/drivers/hid/hid-playstation.c
+++ b/drivers/hid/hid-playstation.c
@@ -17,6 +17,13 @@
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
 	uint8_t mac_address[6];
 
 	int (*parse_report)(struct ps_device *dev, struct hid_report *report, u8 *data, int size);
@@ -44,6 +51,11 @@ struct ps_device {
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
@@ -131,6 +143,71 @@ static struct input_dev *ps_allocate_input_dev(struct hid_device *hdev, const ch
 	return input_dev;
 }
 
+static enum power_supply_property ps_power_supply_props[] = {
+	POWER_SUPPLY_PROP_STATUS,
+	POWER_SUPPLY_PROP_PRESENT,
+	POWER_SUPPLY_PROP_CAPACITY,
+	POWER_SUPPLY_PROP_SCOPE
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
+		hid_err(dev->hdev, "Unable to register battery device.\n");
+		return PTR_ERR(battery);
+	}
+	dev->battery = battery;
+
+	power_supply_powers(dev->battery, &dev->hdev->dev);
+	return 0;
+}
 
 static struct input_dev *ps_gamepad_create(struct hid_device *hdev)
 {
@@ -191,7 +268,9 @@ static int dualsense_parse_report(struct ps_device *ps_dev, struct hid_report *r
 	struct hid_device *hdev = ps_dev->hdev;
 	struct dualsense *ds = (struct dualsense *)ps_dev;
 	struct dualsense_input_report *ds_report;
-	uint8_t value;
+	uint8_t battery_data, battery_capacity, charging_status, value;
+	int battery_status;
+	unsigned long flags;
 
 	/* DualSense in USB uses the full HID report for reportID 1, but
 	 * Bluetooth uses a minimal HID report for reportID 1 and reports
@@ -232,6 +311,41 @@ static int dualsense_parse_report(struct ps_device *ps_dev, struct hid_report *r
 	input_report_key(ds->gamepad, BTN_MODE, ds_report->buttons[2] & DS_BUTTONS2_PS_HOME);
 	input_sync(ds->gamepad);
 
+	battery_data = ds_report->status & DS_STATUS_BATTERY_CAPACITY;
+	charging_status = (ds_report->status & DS_STATUS_CHARGING) >> DS_STATUS_CHARGING_SHIFT;
+
+	switch (charging_status) {
+	case 0x0:
+		/* Each unit of battery data corresponds to 10%
+		 * 0 = 0-9%, 1 = 10-19%, .. and 10 = 100%
+		 */
+		battery_capacity = battery_data == 10 ? 100 : battery_data * 10 + 5;
+		battery_status = POWER_SUPPLY_STATUS_DISCHARGING;
+		break;
+	case 0x1:
+		battery_capacity = battery_data == 10 ? 100 : battery_data * 10 + 5;
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
 
@@ -250,6 +364,8 @@ static struct ps_device *dualsense_create(struct hid_device *hdev)
 	hdev->version |= 0x8000;
 
 	ds->base.hdev = hdev;
+	ds->base.battery_capacity = 100; /* initial value until parse_report. */
+	ds->base.battery_status = POWER_SUPPLY_STATUS_UNKNOWN;
 	ds->base.parse_report = dualsense_parse_report;
 	hid_set_drvdata(hdev, ds);
 
@@ -266,6 +382,10 @@ static struct ps_device *dualsense_create(struct hid_device *hdev)
 		goto err;
 	}
 
+	ret = ps_device_register_battery((struct ps_device *)ds);
+	if (ret < 0)
+		goto err;
+
 	return (struct ps_device *)ds;
 
 err:
-- 
2.26.2

