Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4DD632E88FD
	for <lists+linux-input@lfdr.de>; Sat,  2 Jan 2021 23:33:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726821AbhABWcR (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 2 Jan 2021 17:32:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726733AbhABWcR (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sat, 2 Jan 2021 17:32:17 -0500
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBA23C0613D3
        for <linux-input@vger.kernel.org>; Sat,  2 Jan 2021 14:31:36 -0800 (PST)
Received: by mail-pl1-x62b.google.com with SMTP id g3so12480276plp.2
        for <linux-input@vger.kernel.org>; Sat, 02 Jan 2021 14:31:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gaikai-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+GurGTVRw13uBWnuFR+qPVM5snRYfp0UxLHkWC8SaE0=;
        b=ZXvUJYBncGphWFObH9X2TrTuhyKDuBvjtrargeUCBVioPyhgD+qSj56L12m39l8INa
         Ti/mWNGwrbstLQr6UREe4OIwMejw/hc9heke/1ciBikSKc74936rJDPsKCxBKBeK6oWo
         2dZnGnZmZe/7og5vuCZETSLsfEUssau41DvQSdK6mJ1KfrMMYx8kLF7GAkedcDIcIu+j
         yW4vU5dw+yNtKf0W2W+BePW11dnMqqADkS43sHlGH0uCC3v2GK6pPyYNTRP2aRzN7K2b
         whbDBOSb11SkUfa1GrNh1oipa6eImPhnNGstnfUX1so/U9jxdwyojXRu/Wxyro1jBeAQ
         fyiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+GurGTVRw13uBWnuFR+qPVM5snRYfp0UxLHkWC8SaE0=;
        b=tpnKFasbfygfi/WQw+3AJ2mizgueFfX+tjdOjuTRBfVPaleY4vZ60uK1P6Fapb3eGk
         JqPH2h8EowW2yBpzHfqOZCBcHdxMr+g4iwpTX3yiRSOaxZVFEZdXzeZLEGcV7c5Lzkx/
         y0SMKpunkdwXfvdWBphlPEEm01070apFHmjKcMnRpOTBWVGwves4S64aJcuCWGIzcOan
         CQ4ekQeYimWkUEo5sNAKbaE8wV6suxC7uLLehZiZ5KnMhl0I8uXbQoT8H9hKPOq3u5vc
         w0eWYlb0nj4qpzYmT2hy45inRu+M3irDC2jfSBWrAAx1m6WnuyvAliudZtJ29HcQY39y
         wTag==
X-Gm-Message-State: AOAM533XoLd8ljXVSEt+mgfkc1F7ON4znEZPDFpKL4w8XjENUaewg5e6
        Zn9Bi86z3CXszk6R4+dxCflcgw==
X-Google-Smtp-Source: ABdhPJzylIDcwryHfcTK3TCkmLQkbxBabVjlj019V2LsjimHyn0BRIwGETB6MR9A9q5TJrFdWRdPjg==
X-Received: by 2002:a17:902:59dc:b029:da:84c7:f175 with SMTP id d28-20020a17090259dcb02900da84c7f175mr43549099plj.75.1609626696493;
        Sat, 02 Jan 2021 14:31:36 -0800 (PST)
Received: from localhost.localdomain (cpe-76-87-77-78.socal.res.rr.com. [76.87.77.78])
        by smtp.gmail.com with ESMTPSA id r20sm49537931pgb.3.2021.01.02.14.31.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Jan 2021 14:31:36 -0800 (PST)
From:   Roderick Colenbrander <roderick@gaikai.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-input@vger.kernel.org, Chris Ye <lzye@google.com>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Subject: [PATCH v2 03/13] HID: playstation: add DualSense battery support.
Date:   Sat,  2 Jan 2021 14:30:59 -0800
Message-Id: <20210102223109.996781-4-roderick@gaikai.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210102223109.996781-1-roderick@gaikai.com>
References: <20210102223109.996781-1-roderick@gaikai.com>
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
 drivers/hid/hid-playstation.c | 128 +++++++++++++++++++++++++++++++++-
 2 files changed, 126 insertions(+), 3 deletions(-)

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
index af4a635997bb..2fc798d2a8af 100644
--- a/drivers/hid/hid-playstation.c
+++ b/drivers/hid/hid-playstation.c
@@ -21,6 +21,13 @@
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
@@ -136,6 +148,71 @@ static struct input_dev *ps_allocate_input_dev(struct hid_device *hdev, const ch
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
@@ -201,7 +278,9 @@ static int dualsense_parse_report(struct ps_device *ps_dev, struct hid_report *r
 	struct hid_device *hdev = ps_dev->hdev;
 	struct dualsense *ds = container_of(ps_dev, struct dualsense, base);
 	struct dualsense_input_report *ds_report;
-	uint8_t value;
+	uint8_t battery_data, battery_capacity, charging_status, value;
+	int battery_status;
+	unsigned long flags;
 
 	/* DualSense in USB uses the full HID report for reportID 1, but
 	 * Bluetooth uses a minimal HID report for reportID 1 and reports
@@ -242,12 +321,48 @@ static int dualsense_parse_report(struct ps_device *ps_dev, struct hid_report *r
 	input_report_key(ds->gamepad, BTN_MODE,   ds_report->buttons[2] & DS_BUTTONS2_PS_HOME);
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
 
 static struct ps_device *dualsense_create(struct hid_device *hdev)
 {
 	struct dualsense *ds;
+	struct ps_device *ps_dev;
 	int ret;
 
 	ds = devm_kzalloc(&hdev->dev, sizeof(*ds), GFP_KERNEL);
@@ -259,8 +374,11 @@ static struct ps_device *dualsense_create(struct hid_device *hdev)
 	 */
 	hdev->version |= HID_PLAYSTATION_VERSION_PATCH;
 
-	ds->base.hdev = hdev;
-	ds->base.parse_report = dualsense_parse_report;
+	ps_dev = &ds->base;
+	ps_dev->hdev = hdev;
+	ps_dev->battery_capacity = 100; /* initial value until parse_report. */
+	ps_dev->battery_status = POWER_SUPPLY_STATUS_UNKNOWN;
+	ps_dev->parse_report = dualsense_parse_report;
 	hid_set_drvdata(hdev, ds);
 
 	ret = dualsense_get_mac_address(ds);
@@ -276,6 +394,10 @@ static struct ps_device *dualsense_create(struct hid_device *hdev)
 		goto err;
 	}
 
+	ret = ps_device_register_battery(ps_dev);
+	if (ret < 0)
+		goto err;
+
 	return &ds->base;
 
 err:
-- 
2.26.2

