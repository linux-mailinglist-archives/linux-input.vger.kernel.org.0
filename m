Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5928B3D4B28
	for <lists+linux-input@lfdr.de>; Sun, 25 Jul 2021 05:27:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230010AbhGYCrS (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 24 Jul 2021 22:47:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229609AbhGYCrS (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 24 Jul 2021 22:47:18 -0400
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com [IPv6:2607:f8b0:4864:20::833])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30651C06175F
        for <linux-input@vger.kernel.org>; Sat, 24 Jul 2021 20:27:48 -0700 (PDT)
Received: by mail-qt1-x833.google.com with SMTP id k13so4559538qth.10
        for <linux-input@vger.kernel.org>; Sat, 24 Jul 2021 20:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=V+w7E3SD8PDWFdrkChr8aJ6ksiYAMbp6BTd5RzArT6E=;
        b=SR28E/mZ90Fz/ovQ1uRMSKu30GCxVGENywfL2lwI9qH8SSEEgUshx+0xXnTimGMArI
         q3r/DAJfRG/syFANdRI65q5XXYAdR2duLX5Ek206rb460zjHjfAH5qrjxBkRwM7uX2Iy
         stDL2z8bgsrPkw5oyC0UNM3Qv4GLKhAnf7iWeS8tR8p0foFUeCZ3rLarLQ4rBSkgJ5n3
         aUGTWRKZLMG3VvSvpo92+oBQclkuOd0qemEfgiGaCQsPr4hgqVDOObpxRVnab2aejXkY
         adQk9DKppoMiYT0KXYDSJ5r6RlExPXk6PJT3kYM/+57olnqpgzafbL1u7lvjlGaPMoBo
         nTqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=V+w7E3SD8PDWFdrkChr8aJ6ksiYAMbp6BTd5RzArT6E=;
        b=sYr85Lot5JHhhxyYrYfdx2uB3d5HKxtq7ifDo+pEsM796t+xGvG6VUBL828WJAt+om
         TGfc/4PucNCVsvdffEVbDWtMd+aFaHJv/KCc7q2ssUDBZHj5nfbCwp1QU7QJSogzvwKj
         matFaq3T5Kme3+AYOCTGysXSquwtGq8FQh3M4ETK4NRKqi70UWTcuH/u4wKH1hee5pTT
         zUO3HxB3pK9octZ655VH/N1+XrKUEauDToSP0x7asxflby+gMwKW1IyWZLO0B0K8zzO0
         cWbH0E2wNpbup7d3KpUpESQH1N8ppZVCRR/fLRDRuiF0pX7RXfjlP45anlBb3rjyF7A6
         9jVQ==
X-Gm-Message-State: AOAM533to1MLXLAB3yIVNn/FITBlOyDpdc7o5SqmGO/g1xeQ7W+0baPv
        yyM2CsPFZuiZf6WoNbilSquybsqdTVt1vcuU
X-Google-Smtp-Source: ABdhPJwRvPVoOUMLcFkoMQ3dPJhdUFz5sZ7zfqDZRSqe+O8tG+sRRVjNhgVUJjz8Zq7tGUvCNiKy8A==
X-Received: by 2002:ac8:1249:: with SMTP id g9mr10212369qtj.292.1627183667221;
        Sat, 24 Jul 2021 20:27:47 -0700 (PDT)
Received: from Arrakis.djogorchock.com (pool-98-116-189-238.nycmny.fios.verizon.net. [98.116.189.238])
        by smtp.gmail.com with ESMTPSA id j16sm4843738qkk.132.2021.07.24.20.27.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Jul 2021 20:27:46 -0700 (PDT)
From:   "Daniel J. Ogorchock" <djogorchock@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     thunderbird2k@gmail.com, blaws05@gmail.com,
        benjamin.tissoires@redhat.com, jikos@kernel.org,
        Roderick.Colenbrander@sony.com, svv@google.com, s.jegen@gmail.com,
        carmueller@gmail.com, pgriffais@valvesoftware.com,
        hadess@hadess.net, "Daniel J. Ogorchock" <djogorchock@gmail.com>
Subject: [PATCH v14 03/17] HID: nintendo: add power supply support
Date:   Sat, 24 Jul 2021 23:26:54 -0400
Message-Id: <20210725032707.440071-4-djogorchock@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210725032707.440071-1-djogorchock@gmail.com>
References: <20210725032707.440071-1-djogorchock@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This patch adds power_supply functionality to the switch controller
driver for its battery.

Signed-off-by: Daniel J. Ogorchock <djogorchock@gmail.com>
---
 drivers/hid/Kconfig        |   1 +
 drivers/hid/hid-nintendo.c | 134 +++++++++++++++++++++++++++++++++++++
 2 files changed, 135 insertions(+)

diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
index 142656b030b3e..f91e299e480b7 100644
--- a/drivers/hid/Kconfig
+++ b/drivers/hid/Kconfig
@@ -735,6 +735,7 @@ config HID_NINTENDO
 	depends on HID
 	depends on NEW_LEDS
 	depends on LEDS_CLASS
+	select POWER_SUPPLY
 	help
 	Adds support for the Nintendo Switch Joy-Cons and Pro Controller.
 	All controllers support bluetooth, and the Pro Controller also supports
diff --git a/drivers/hid/hid-nintendo.c b/drivers/hid/hid-nintendo.c
index e8f9fb8c3c11b..aea64ea8eb092 100644
--- a/drivers/hid/hid-nintendo.c
+++ b/drivers/hid/hid-nintendo.c
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
@@ -199,6 +201,7 @@ struct joycon_ctlr {
 	struct input_dev *input;
 	struct led_classdev leds[JC_NUM_LEDS];
 	enum joycon_ctlr_state ctlr_state;
+	spinlock_t lock;
 
 	/* The following members are used for synchronous sends/receives */
 	enum joycon_msg_type msg_type;
@@ -216,6 +219,12 @@ struct joycon_ctlr {
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
@@ -446,9 +455,41 @@ static void joycon_parse_report(struct joycon_ctlr *ctlr,
 				struct joycon_input_report *rep)
 {
 	struct input_dev *dev = ctlr->input;
+	unsigned long flags;
+	u8 tmp;
 	u32 btns;
 	u32 id = ctlr->hdev->product;
 
+	/* Parse the battery status */
+	tmp = rep->bat_con;
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
 	btns = hid_field_extract(ctlr->hdev, rep->button_status, 0, 24);
 
 	if (id != USB_DEVICE_ID_NINTENDO_JOYCONR) {
@@ -743,6 +784,91 @@ static int joycon_player_leds_create(struct joycon_ctlr *ctlr)
 	return 0;
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
+		else if (capacity == POWER_SUPPLY_CAPACITY_LEVEL_FULL &&
+			 powered)
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
+	ctlr->battery_desc.type = POWER_SUPPLY_TYPE_BATTERY;
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
+
+	return power_supply_powers(ctlr->battery, &hdev->dev);
+}
+
 /* Common handler for parsing inputs */
 static int joycon_ctlr_read_handler(struct joycon_ctlr *ctlr, u8 *data,
 							      int size)
@@ -834,6 +960,7 @@ static int nintendo_hid_probe(struct hid_device *hdev,
 	hid_set_drvdata(hdev, ctlr);
 	mutex_init(&ctlr->output_mutex);
 	init_waitqueue_head(&ctlr->wait);
+	spin_lock_init(&ctlr->lock);
 
 	ret = hid_parse(hdev);
 	if (ret) {
@@ -906,6 +1033,13 @@ static int nintendo_hid_probe(struct hid_device *hdev,
 		goto err_close;
 	}
 
+	/* Initialize the battery power supply */
+	ret = joycon_power_supply_create(ctlr);
+	if (ret) {
+		hid_err(hdev, "Failed to create power_supply; ret=%d\n", ret);
+		goto err_close;
+	}
+
 	ret = joycon_input_create(ctlr);
 	if (ret) {
 		hid_err(hdev, "Failed to create input device; ret=%d\n", ret);
-- 
2.32.0

