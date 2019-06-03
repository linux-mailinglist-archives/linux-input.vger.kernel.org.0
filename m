Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 025673284B
	for <lists+linux-input@lfdr.de>; Mon,  3 Jun 2019 08:07:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726821AbfFCGHE (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 3 Jun 2019 02:07:04 -0400
Received: from mail-it1-f194.google.com ([209.85.166.194]:38269 "EHLO
        mail-it1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726597AbfFCGHD (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 3 Jun 2019 02:07:03 -0400
Received: by mail-it1-f194.google.com with SMTP id h9so10615528itk.3
        for <linux-input@vger.kernel.org>; Sun, 02 Jun 2019 23:07:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ai9LBrA4yDa4u/E1vGeFNRSBQEWLys7bHB+R2U6EqcE=;
        b=R0qmtpk+F3ohLFCZeM/SdhuJf5Dn/L0phjMCKHIwuP9NQNohW0y+mY0YhnX5Ot4KdY
         VdvXasyShS7ARDqzLNTj3gAe0ElxB7+l8HrEUbiGTqmI6Gan2lan/Fm1WDyV4+znAAYu
         v/T2WYBx2VGfC0+hG4AnJMo1Vl5XSLqUPMCebhLO719/vYzUT9sXqoHhuy8iABXJoU1N
         l4wBGQv5jxve3/V964fgd03JeSRRuRl8L5nRU1dH/v3aM3cJuhXvw41RqDG+CW7sJGSG
         /lzdAWS1uZGaewLn8FQ3jX8BVJb991tN3e6sLVwVM82nQU1g7c7bSJyFV/0IKok6MDZB
         6RDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ai9LBrA4yDa4u/E1vGeFNRSBQEWLys7bHB+R2U6EqcE=;
        b=Nf4fOhPWcj9PU/XY3ktrRLVUphQp9uFn6f/tWfLdWGXIN9s+4lJGkXB+vTizEtRPhy
         cJEdI44/YEz0lt9pE8c0DmS4PWcpBFZZs/qSXQXemuJogmda4AJbntvI+pETfbUgTItU
         97OR2NG29DboNvPMd11aaMCwGVN9Mz+zxafcWg/YUEmsYEGYc0xf7/H5fDa3JPDz2tlf
         /n3vSWLT23kaXn33TpCZBF5DGSNjjsneZkBcj4kk5VN5HaTWBJ8VLcNDqckguV9IAblk
         ap1iILpNBMU0pTwQr/oocnCL/MBS59ocN+I3evxBMBN4iHjTQzjei0c1glitWrAoPkUi
         y9Dg==
X-Gm-Message-State: APjAAAW1mb1t92wUj0guEalFnWYFRTQPmjO3xL0dJ3rhQxFZkMupGJw5
        YFhOYjpovYuzcd8pHuDvbTP5y+Bx62dRkg==
X-Google-Smtp-Source: APXvYqwgeBwx7UZUcKxwkQAkXfobtSmaMq5MURK/tL4Jma5RSEyhnnN3A3NJJSBJQoWLLbsaZVuyaA==
X-Received: by 2002:a05:660c:ac1:: with SMTP id k1mr16630959itl.113.1559542022925;
        Sun, 02 Jun 2019 23:07:02 -0700 (PDT)
Received: from localhost.localdomain ([136.61.179.39])
        by smtp.gmail.com with ESMTPSA id 14sm6124808itl.1.2019.06.02.23.07.01
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 02 Jun 2019 23:07:02 -0700 (PDT)
From:   "Daniel J. Ogorchock" <djogorchock@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     thunderbird2k@gmail.com, blaws05@gmail.com,
        benjamin.tissoires@redhat.com, jikos@kernel.org,
        Roderick.Colenbrander@sony.com, jbrandst@2ds.eu,
        "Daniel J. Ogorchock" <djogorchock@gmail.com>
Subject: [PATCH v5 3/5] HID: joycon: add power supply support
Date:   Mon,  3 Jun 2019 01:06:42 -0500
Message-Id: <20190603060644.10338-4-djogorchock@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190603060644.10338-1-djogorchock@gmail.com>
References: <20190603060644.10338-1-djogorchock@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This patch adds power_supply functionality to the switch controller
driver for its battery.

Signed-off-by: Daniel J. Ogorchock <djogorchock@gmail.com>
---
 drivers/hid/Kconfig      |   1 +
 drivers/hid/hid-joycon.c | 132 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 133 insertions(+)

diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
index cf88bbc54208..2ab2fa378eda 100644
--- a/drivers/hid/Kconfig
+++ b/drivers/hid/Kconfig
@@ -457,6 +457,7 @@ config HID_JOYCON
 	depends on HID
 	depends on NEW_LEDS
 	depends on LEDS_CLASS
+	select POWER_SUPPLY
 	help
 	Adds support for the Nintendo Switch Joy-Cons and Pro Controller.
 	All controllers support bluetooth, and the Pro Controller also supports
diff --git a/drivers/hid/hid-joycon.c b/drivers/hid/hid-joycon.c
index a2ae4bbaffcd..0b2cba2a604c 100644
--- a/drivers/hid/hid-joycon.c
+++ b/drivers/hid/hid-joycon.c
@@ -11,6 +11,7 @@
  *   https://github.com/MTCKC/ProconXInput
  *   hid-wiimote kernel hid driver
  *   hid-logitech-hidpp driver
+ *   hid-sony driver
  *
  * This driver supports the Nintendo Switch Joy-Cons and Pro Controllers. The
  * Pro Controllers can either be used over USB or Bluetooth.
@@ -27,6 +28,7 @@
 #include <linux/input.h>
 #include <linux/leds.h>
 #include <linux/module.h>
+#include <linux/power_supply.h>
 #include <linux/spinlock.h>
 
 /*
@@ -187,6 +189,7 @@ struct joycon_ctlr {
 	struct input_dev *input;
 	struct led_classdev leds[JC_NUM_LEDS];
 	enum joycon_ctlr_state ctlr_state;
+	spinlock_t lock;
 
 	/* The following members are used for synchronous sends/receives */
 	enum joycon_msg_type msg_type;
@@ -204,6 +207,12 @@ struct joycon_ctlr {
 	struct joycon_stick_cal right_stick_cal_x;
 	struct joycon_stick_cal right_stick_cal_y;
 
+	/* power supply data */
+	struct power_supply *battery;
+	struct power_supply_desc battery_desc;
+	u8 battery_capacity;
+	bool battery_charging;
+	bool host_powered;
 };
 
 static int __joycon_hid_send(struct hid_device *hdev, u8 *data, size_t len)
@@ -407,9 +416,41 @@ static int joycon_map_stick_val(struct joycon_stick_cal *cal, s32 val)
 static void joycon_parse_report(struct joycon_ctlr *ctlr, u8 *data)
 {
 	struct input_dev *dev = ctlr->input;
+	unsigned long flags;
+	u8 tmp;
 	u32 btns;
 	u32 id = ctlr->hdev->product;
 
+	/* Parse the battery status */
+	tmp = data[2];
+	spin_lock_irqsave(&ctlr->lock, flags);
+	ctlr->host_powered = tmp & BIT(0);
+	ctlr->battery_charging = tmp & BIT(4);
+	tmp = tmp >> 5;
+	switch (tmp) {
+	case 0: /* empty */
+		ctlr->battery_capacity = POWER_SUPPLY_CAPACITY_LEVEL_CRITICAL;
+		break;
+	case 1: /* low */
+		ctlr->battery_capacity = POWER_SUPPLY_CAPACITY_LEVEL_LOW;
+		break;
+	case 2: /* medium */
+		ctlr->battery_capacity = POWER_SUPPLY_CAPACITY_LEVEL_NORMAL;
+		break;
+	case 3: /* high */
+		ctlr->battery_capacity = POWER_SUPPLY_CAPACITY_LEVEL_HIGH;
+		break;
+	case 4: /* full */
+		ctlr->battery_capacity = POWER_SUPPLY_CAPACITY_LEVEL_FULL;
+		break;
+	default:
+		ctlr->battery_capacity = POWER_SUPPLY_CAPACITY_LEVEL_UNKNOWN;
+		hid_warn(ctlr->hdev, "Invalid battery status\n");
+		break;
+	}
+	spin_unlock_irqrestore(&ctlr->lock, flags);
+
+	/* Parse the buttons and sticks */
 	btns = hid_field_extract(ctlr->hdev, data + 3, 0, 24);
 
 	if (id != USB_DEVICE_ID_NINTENDO_JOYCONR) {
@@ -660,6 +701,89 @@ static int joycon_player_leds_create(struct joycon_ctlr *ctlr)
 	return ret;
 }
 
+static int joycon_battery_get_property(struct power_supply *supply,
+				       enum power_supply_property prop,
+				       union power_supply_propval *val)
+{
+	struct joycon_ctlr *ctlr = power_supply_get_drvdata(supply);
+	unsigned long flags;
+	int ret = 0;
+	u8 capacity;
+	bool charging;
+	bool powered;
+
+	spin_lock_irqsave(&ctlr->lock, flags);
+	capacity = ctlr->battery_capacity;
+	charging = ctlr->battery_charging;
+	powered = ctlr->host_powered;
+	spin_unlock_irqrestore(&ctlr->lock, flags);
+
+	switch (prop) {
+	case POWER_SUPPLY_PROP_PRESENT:
+		val->intval = 1;
+		break;
+	case POWER_SUPPLY_PROP_SCOPE:
+		val->intval = POWER_SUPPLY_SCOPE_DEVICE;
+		break;
+	case POWER_SUPPLY_PROP_CAPACITY_LEVEL:
+		val->intval = capacity;
+		break;
+	case POWER_SUPPLY_PROP_STATUS:
+		if (charging)
+			val->intval = POWER_SUPPLY_STATUS_CHARGING;
+		else if (capacity == 100 && powered)
+			val->intval = POWER_SUPPLY_STATUS_FULL;
+		else
+			val->intval = POWER_SUPPLY_STATUS_DISCHARGING;
+		break;
+	default:
+		ret = -EINVAL;
+		break;
+	}
+	return ret;
+}
+
+static enum power_supply_property joycon_battery_props[] = {
+	POWER_SUPPLY_PROP_PRESENT,
+	POWER_SUPPLY_PROP_CAPACITY_LEVEL,
+	POWER_SUPPLY_PROP_SCOPE,
+	POWER_SUPPLY_PROP_STATUS,
+};
+
+static int joycon_power_supply_create(struct joycon_ctlr *ctlr)
+{
+	struct hid_device *hdev = ctlr->hdev;
+	struct power_supply_config supply_config = { .drv_data = ctlr, };
+	const char * const name_fmt = "nintendo_switch_controller_battery_%s";
+	int ret = 0;
+
+	/* Set initially to unknown before receiving first input report */
+	ctlr->battery_capacity = POWER_SUPPLY_CAPACITY_LEVEL_UNKNOWN;
+
+	/* Configure the battery's description */
+	ctlr->battery_desc.properties = joycon_battery_props;
+	ctlr->battery_desc.num_properties =
+					ARRAY_SIZE(joycon_battery_props);
+	ctlr->battery_desc.get_property = joycon_battery_get_property;
+	ctlr->battery_desc.use_for_apm = 0;
+	ctlr->battery_desc.name = devm_kasprintf(&hdev->dev, GFP_KERNEL,
+						 name_fmt,
+						 dev_name(&hdev->dev));
+	if (!ctlr->battery_desc.name)
+		return -ENOMEM;
+
+	ctlr->battery = devm_power_supply_register(&hdev->dev,
+						   &ctlr->battery_desc,
+						   &supply_config);
+	if (IS_ERR(ctlr->battery)) {
+		ret = PTR_ERR(ctlr->battery);
+		hid_err(hdev, "Failed to register battery; ret=%d\n", ret);
+		return ret;
+	}
+	power_supply_powers(ctlr->battery, &hdev->dev);
+	return 0;
+}
+
 /* Common handler for parsing inputs */
 static int joycon_ctlr_read_handler(struct joycon_ctlr *ctlr, u8 *data,
 							      int size)
@@ -764,6 +888,7 @@ static int joycon_hid_probe(struct hid_device *hdev,
 	hid_set_drvdata(hdev, ctlr);
 	mutex_init(&ctlr->output_mutex);
 	init_waitqueue_head(&ctlr->wait);
+	spin_lock_init(&ctlr->lock);
 
 	ret = hid_parse(hdev);
 	if (ret) {
@@ -832,6 +957,13 @@ static int joycon_hid_probe(struct hid_device *hdev,
 		goto err_close;
 	}
 
+	/* Initialize the battery power supply */
+	ret = joycon_power_supply_create(ctlr);
+	if (ret) {
+		hid_err(hdev, "Failed to create power_supply; ret=%d\n", ret);
+		goto err_close;
+	}
+
 	ctlr->ctlr_state = JOYCON_CTLR_STATE_READ;
 
 	hid_dbg(hdev, "probe - success\n");
-- 
2.21.0

