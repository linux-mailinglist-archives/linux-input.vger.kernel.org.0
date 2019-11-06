Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 04FDCF0EB6
	for <lists+linux-input@lfdr.de>; Wed,  6 Nov 2019 07:07:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729824AbfKFGHA (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 6 Nov 2019 01:07:00 -0500
Received: from mail-yb1-f193.google.com ([209.85.219.193]:33545 "EHLO
        mail-yb1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725812AbfKFGHA (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 6 Nov 2019 01:07:00 -0500
Received: by mail-yb1-f193.google.com with SMTP id i15so1533308ybq.0
        for <linux-input@vger.kernel.org>; Tue, 05 Nov 2019 22:06:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qhDZA4XMDpBgvlpLgnnKNyx03azHcmktwpA0EyvKur0=;
        b=bMi4oNfSGbBRKrwqFiuMGYkUsXQjdjoen/1zrLuEMY3ttkFztk/hyLXezcsj9SaXyE
         kUecCdOCZoHdtJ2Y+2A6DS9k/m70fue2/gUeTxHpWeT+hncXD9kJwkc2ZkM8toirAaWT
         +iKPOF3GAm1BZU6E/XYjyyn1QK84wB+ysMytHLt0KL6SnIem1pEyqDuj7i3HOZ+56Ycp
         HKfRkTaKEums8a7R//u7mZxbj+H0mfuoGiMW0ZreHIakxjPoAdRvnbUFrfg6LnbvFSUc
         LAdZqu15BWz/ncBdYzPoJx5L1i3nYNCdNLaWm1z9PDM1gYCvX7ET7yeYuK+9hs5neK7g
         ryAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qhDZA4XMDpBgvlpLgnnKNyx03azHcmktwpA0EyvKur0=;
        b=Z9eCJq6omg7pVSyRZsP4aHhyOjTAgpKGhWyFw8/dAAfzhYRg2GcCfnypfcMF2lLhmK
         bw8U32UyPJ9A7tojTIDGFFmUhY56blbuOr9dcQPEaw6z4t3TSWfsAD+h+TZ1JPGb/FJc
         e8Y3L21Kj7sVC4lDdXB31iGsfOQtjPfk5Rvz34X/BW6MTlouRB4/wY0cGU1q688uvXTU
         t4gMnK1lDzxJjgDIHorIdtY92Xa9XJGwlvl8iyXCUtBGYrTw89K+pb/vooXA49sJ5CX8
         VBNNHukaYmTZ2p+bM+2/iLNagO0YJmFOArhDLdSdRl68JFsT2EII+IV90ZNY3lr59dFq
         k2nA==
X-Gm-Message-State: APjAAAXV6LD/FyZyEBnvZDImr3zBpP238HmRp0mmKwQpQWm0I3uPCisj
        I3O00yzIh4LV819aBs5upNxH5VaQM/BLog==
X-Google-Smtp-Source: APXvYqyvc3K9A50GE/yHOhbZxqENT/c0rMm/wWZ6zAXjyWc1m5wiITOncBoJwaB8V/SRZlSO9bOlZw==
X-Received: by 2002:a25:790d:: with SMTP id u13mr754918ybc.504.1573020419053;
        Tue, 05 Nov 2019 22:06:59 -0800 (PST)
Received: from Arrakis.djogorchock.com ([136.33.205.58])
        by smtp.gmail.com with ESMTPSA id e82sm11039596ywb.87.2019.11.05.22.06.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2019 22:06:58 -0800 (PST)
From:   "Daniel J. Ogorchock" <djogorchock@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     thunderbird2k@gmail.com, blaws05@gmail.com,
        benjamin.tissoires@redhat.com, jikos@kernel.org,
        Roderick.Colenbrander@sony.com, svv@google.com, s.jegen@gmail.com,
        "Daniel J. Ogorchock" <djogorchock@gmail.com>
Subject: [PATCH v9 03/10] HID: nintendo: add power supply support
Date:   Wed,  6 Nov 2019 00:06:41 -0600
Message-Id: <20191106060648.3018478-4-djogorchock@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191106060648.3018478-1-djogorchock@gmail.com>
References: <20191106060648.3018478-1-djogorchock@gmail.com>
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
 drivers/hid/Kconfig        |   1 +
 drivers/hid/hid-nintendo.c | 133 +++++++++++++++++++++++++++++++++++++
 2 files changed, 134 insertions(+)

diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
index 41f7da50896f..a6e0f399bcab 100644
--- a/drivers/hid/Kconfig
+++ b/drivers/hid/Kconfig
@@ -697,6 +697,7 @@ config HID_NINTENDO
 	depends on HID
 	depends on NEW_LEDS
 	depends on LEDS_CLASS
+	select POWER_SUPPLY
 	help
 	Adds support for the Nintendo Switch Joy-Cons and Pro Controller.
 	All controllers support bluetooth, and the Pro Controller also supports
diff --git a/drivers/hid/hid-nintendo.c b/drivers/hid/hid-nintendo.c
index 21d19bc96792..0caa9e1860ad 100644
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
@@ -434,9 +443,41 @@ static void joycon_parse_report(struct joycon_ctlr *ctlr,
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
@@ -674,6 +715,90 @@ static int joycon_player_leds_create(struct joycon_ctlr *ctlr)
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
@@ -767,6 +892,7 @@ static int nintendo_hid_probe(struct hid_device *hdev,
 	hid_set_drvdata(hdev, ctlr);
 	mutex_init(&ctlr->output_mutex);
 	init_waitqueue_head(&ctlr->wait);
+	spin_lock_init(&ctlr->lock);
 
 	ret = hid_parse(hdev);
 	if (ret) {
@@ -845,6 +971,13 @@ static int nintendo_hid_probe(struct hid_device *hdev,
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
2.23.0

