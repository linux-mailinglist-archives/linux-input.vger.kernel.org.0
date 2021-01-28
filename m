Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03CAE307C75
	for <lists+linux-input@lfdr.de>; Thu, 28 Jan 2021 18:31:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233070AbhA1R3y (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 28 Jan 2021 12:29:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233076AbhA1R1s (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 28 Jan 2021 12:27:48 -0500
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B0F2C0617A7
        for <linux-input@vger.kernel.org>; Thu, 28 Jan 2021 09:27:08 -0800 (PST)
Received: by mail-pl1-x62e.google.com with SMTP id d13so3730514plg.0
        for <linux-input@vger.kernel.org>; Thu, 28 Jan 2021 09:27:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gaikai-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lCAr4yY+MvpnQfIk4J8PBh5UeHYogXKrkou3WSyAz58=;
        b=dLC3j0XFKc7+iQ4Tu1K2UbvfET2fGH7rkzLSLXQPSNX37lOKf6DnS4sBWtf3QOWtIq
         CvQgqzXJlAKoua9aydb1JXJBqA1yLSpdsdr8oZCzUu/OpXbrOUNiwcimJi9jza9W2irm
         72aAS9OsxkwpxzKRO7bhrVh1XSl/wO3JQ64ZDd2P+DGbAa72QMUuugddDTJ++Dsa98r1
         f6Tue5Jk5xwnVqOjRWASuutZBHJ3f38wqNEjQ/5BYxWJl3ChSxedOTz5Le00zW2bLAWw
         nhhNCyHu/iXZmuUrpILXXZ805frYLYYFCoTSEvZs2+SxWQQ7h0riI2n78PLpwyYMV33m
         O4IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lCAr4yY+MvpnQfIk4J8PBh5UeHYogXKrkou3WSyAz58=;
        b=tsi5r523B0xx+BCCchCiDzCbu0sYl6wCz4nmuEC1UaGJOuwCsGf6aiVHF3GH0N5tRU
         /8l/RZAncurCFi3oXWpt47V/6392+xvTyCbJjStaIjXTJd53dXLI52QCriPielFp7A3i
         MhR0Zk3JPdANXrNo5oMLiyvuDHo4CReYE2hJbhOhogjmVnnbEHcFe880oAvhNfG5BMvY
         Wrr/5pUOKZUJxtE0vAttzJTDQE5yBX0hzQN4ro1moNFFdWdQki/L83S3sDkXM64g2r12
         0i4Q+e0bmu8K99+QewUiKqk6qVn0GtzPkCnXP5gWTfDrCXDM4+VecYQ6/V3k4ERpjyut
         YUOw==
X-Gm-Message-State: AOAM530pNsdPim0dDOJss4/kuu/sYQ5+M1gGubpE1OObFexN1RpaeZSQ
        5ZSfQkWP2tTuzqGhXLY2Vk9s3cYrfcor6Q==
X-Google-Smtp-Source: ABdhPJzbUQRu7msGwR+EijdgHDz/sbgts6hPI9V638gmTnvGKY44YUMjRiWrG58z1f1UfWkgVeiA1Q==
X-Received: by 2002:a17:902:6a83:b029:dc:2a2c:6b91 with SMTP id n3-20020a1709026a83b02900dc2a2c6b91mr598882plk.8.1611854827817;
        Thu, 28 Jan 2021 09:27:07 -0800 (PST)
Received: from us8c16456344dc.lan (cpe-76-87-77-78.socal.res.rr.com. [76.87.77.78])
        by smtp.gmail.com with ESMTPSA id a31sm6190445pgb.93.2021.01.28.09.27.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Jan 2021 09:27:07 -0800 (PST)
From:   Roderick Colenbrander <roderick@gaikai.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-input@vger.kernel.org, Chris Ye <lzye@google.com>,
        =?UTF-8?q?Barnab=C3=A1s=20P=C5=91cze?= <pobrn@protonmail.com>,
        =?UTF-8?q?Samuel=20=C4=8Cavoj?= <sammko@sammserver.com>,
        =?UTF-8?q?Florian=20M=C3=A4rkl?= <linux@florianmaerkl.de>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Subject: [PATCH v5 03/13] HID: playstation: add DualSense battery support.
Date:   Thu, 28 Jan 2021 09:26:47 -0800
Message-Id: <20210128172657.24516-4-roderick@gaikai.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210128172657.24516-1-roderick@gaikai.com>
References: <20210128172657.24516-1-roderick@gaikai.com>
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

