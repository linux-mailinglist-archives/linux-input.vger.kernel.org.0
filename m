Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DD09B6124F4
	for <lists+linux-input@lfdr.de>; Sat, 29 Oct 2022 20:49:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229515AbiJ2StT (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 29 Oct 2022 14:49:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229562AbiJ2StS (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 29 Oct 2022 14:49:18 -0400
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3D5B4523F
        for <linux-input@vger.kernel.org>; Sat, 29 Oct 2022 11:49:17 -0700 (PDT)
Received: by mail-pg1-x530.google.com with SMTP id 20so7489901pgc.5
        for <linux-input@vger.kernel.org>; Sat, 29 Oct 2022 11:49:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gaikai-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uo6RIOOMyXIxyO79tDm+28Enw9XTfu92Kn4mjGezzMw=;
        b=qMB3hDDiMMZ2wPvLGwxx6z+Bt7OkozE+aWGuK3npmadnPTNQZ3xeNyubq5tfnLk0th
         4057jPvmJ1XToASo9HNFAbF+G08CzIEQwuDEJLGBqYQbWJqig4hCpmUA+hXmZHWZo/tH
         jFfEHu2dEo0eZkNYPfM4vUVeUjdc1asRUk1pkn56Pt23dDE7eVWYDN5DyFggXpr8nvJg
         VmYBDTpU1cX2sTpFh4JqsMOM5XVaXRuSUmmL1IctEuXTj9p63wzuDEkWZDe1U6eEaqG4
         NDHYLQgwQKB+geaRBhCteEHQ92UDnOAss8X1XT7F8x/SoDPn5LPicgSbOrjqPy8t1Tzj
         CLPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uo6RIOOMyXIxyO79tDm+28Enw9XTfu92Kn4mjGezzMw=;
        b=DTApmgj0poRTsGaYxgweveRvEqms0Q8qzMG9N0fLVWI/6LlddqpoFSesqpsigHePqf
         sgIKvJUF7kKnFUmOeSE1IjbeN7TUCULb4Pd89G8uIuGnld2UqiarCi0bDPl9U5d9Y7ic
         YwTb6/ZDf9K5ZsccWGVdAvppMlQSaD1H+d8o1ZODoseQajjhLh4XLQx0dHzfBQNxfbD1
         39/9vTzZA6yu/i9yLAIQ2W/Rvn5ufbHgbArgIrQSWjxEz9a3yU3CKNQpOlYX4MEvn/F4
         nKLahfF69R8aGKzgZgr42T9X/E3sOaw5WYi8WdM6NeQ2hTP2am70Q6AMcpaTyR8S1B1J
         h4dQ==
X-Gm-Message-State: ACrzQf3s8NkBYgNAUMaOx8BZ1XbZQdDn4HUNlfHdpTYSRjD00Gk0M4y/
        hM+4oPAVFZjfrp6PSBZiT5lyUiAXs8UIHAcM
X-Google-Smtp-Source: AMsMyM60IfIYaiAuWG16xOwsbZdpnZ8RLsAEZSAZBlviitM16Hs/CHyAAmdM3suUwHCicrmBjeUHWQ==
X-Received: by 2002:a63:5909:0:b0:46e:c98d:e07c with SMTP id n9-20020a635909000000b0046ec98de07cmr5060924pgb.530.1667069357219;
        Sat, 29 Oct 2022 11:49:17 -0700 (PDT)
Received: from localhost.localdomain ([76.242.116.65])
        by smtp.gmail.com with ESMTPSA id gb7-20020a17090b060700b0020d9306e735sm1377566pjb.20.2022.10.29.11.49.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Oct 2022 11:49:16 -0700 (PDT)
From:   Roderick Colenbrander <roderick@gaikai.com>
X-Google-Original-From: Roderick Colenbrander <roderick.colenbrander@sony.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-input@vger.kernel.org,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Subject: [PATCH 03/13] HID: playstation: add DualShock4 battery support.
Date:   Sat, 29 Oct 2022 11:48:41 -0700
Message-Id: <20221029184851.282366-4-roderick.colenbrander@sony.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221029184851.282366-1-roderick.colenbrander@sony.com>
References: <20221029184851.282366-1-roderick.colenbrander@sony.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Provide DualShock4 battery support through powersupply framework.

Signed-off-by: Roderick Colenbrander <roderick.colenbrander@sony.com>
---
 drivers/hid/hid-playstation.c | 70 +++++++++++++++++++++++++++++++++--
 1 file changed, 66 insertions(+), 4 deletions(-)

diff --git a/drivers/hid/hid-playstation.c b/drivers/hid/hid-playstation.c
index df4353a4f1e9..20111aa20e86 100644
--- a/drivers/hid/hid-playstation.c
+++ b/drivers/hid/hid-playstation.c
@@ -291,6 +291,12 @@ struct dualsense_output_report {
 #define DS4_FEATURE_REPORT_PAIRING_INFO		0x12
 #define DS4_FEATURE_REPORT_PAIRING_INFO_SIZE	16
 
+/* Status field of DualShock4 input report. */
+#define DS4_STATUS0_BATTERY_CAPACITY	GENMASK(3, 0)
+#define DS4_STATUS0_CABLE_STATE		BIT(4)
+/* Battery status within batery_status field. */
+#define DS4_BATTERY_STATUS_FULL		11
+
 struct dualshock4 {
 	struct ps_device base;
 	struct input_dev *gamepad;
@@ -302,15 +308,16 @@ struct dualshock4_input_report_common {
 	uint8_t rx, ry;
 	uint8_t buttons[3];
 	uint8_t z, rz;
-
 	uint8_t reserved[20];
+	uint8_t status[2];
+	uint8_t reserved2;
 } __packed;
-static_assert(sizeof(struct dualshock4_input_report_common) == 29);
+static_assert(sizeof(struct dualshock4_input_report_common) == 32);
 
 struct dualshock4_input_report_usb {
 	uint8_t report_id; /* 0x01 */
 	struct dualshock4_input_report_common common;
-	uint8_t reserved[34];
+	uint8_t reserved[31];
 } __packed;
 static_assert(sizeof(struct dualshock4_input_report_usb) == DS4_INPUT_REPORT_USB_SIZE);
 
@@ -1549,7 +1556,9 @@ static int dualshock4_parse_report(struct ps_device *ps_dev, struct hid_report *
 	struct hid_device *hdev = ps_dev->hdev;
 	struct dualshock4 *ds4 = container_of(ps_dev, struct dualshock4, base);
 	struct dualshock4_input_report_common *ds4_report;
-	uint8_t value;
+	uint8_t battery_capacity, value;
+	int battery_status;
+	unsigned long flags;
 
 	/*
 	 * DualShock4 in USB uses the full HID report for reportID 1, but
@@ -1594,6 +1603,53 @@ static int dualshock4_parse_report(struct ps_device *ps_dev, struct hid_report *
 	input_report_key(ds4->gamepad, BTN_MODE,   ds4_report->buttons[2] & DS_BUTTONS2_PS_HOME);
 	input_sync(ds4->gamepad);
 
+	/*
+	 * Interpretation of the battery_capacity data depends on the cable state.
+	 * When no cable is connected (bit4 is 0):
+	 * - 0:10: percentage in units of 10%.
+	 * When a cable is plugged in:
+	 * - 0-10: percentage in units of 10%.
+	 * - 11: battery is full
+	 * - 14: not charging due to Voltage or temperature error
+	 * - 15: charge error
+	 */
+	if (ds4_report->status[0] & DS4_STATUS0_CABLE_STATE) {
+		uint8_t battery_data = ds4_report->status[0] & DS4_STATUS0_BATTERY_CAPACITY;
+
+		if (battery_data < 10) {
+			/* Take the mid-point for each battery capacity value,
+			 * because on the hardware side 0 = 0-9%, 1=10-19%, etc.
+			 * This matches official platform behavior, which does
+			 * the same.
+			 */
+			battery_capacity = battery_data * 10 + 5;
+			battery_status = POWER_SUPPLY_STATUS_CHARGING;
+		} else if (battery_data == 10) {
+			battery_capacity = 100;
+			battery_status = POWER_SUPPLY_STATUS_CHARGING;
+		} else if (battery_data == DS4_BATTERY_STATUS_FULL) {
+			battery_capacity = 100;
+			battery_status = POWER_SUPPLY_STATUS_FULL;
+		} else { /* 14, 15 and undefined values */
+			battery_capacity = 0;
+			battery_status = POWER_SUPPLY_STATUS_UNKNOWN;
+		}
+	} else {
+		uint8_t battery_data = ds4_report->status[0] & DS4_STATUS0_BATTERY_CAPACITY;
+
+		if (battery_data < 10)
+			battery_capacity = battery_data * 10 + 5;
+		else /* 10 */
+			battery_capacity = 100;
+
+		battery_status = POWER_SUPPLY_STATUS_DISCHARGING;
+	}
+
+	spin_lock_irqsave(&ps_dev->lock, flags);
+	ps_dev->battery_capacity = battery_capacity;
+	ps_dev->battery_status = battery_status;
+	spin_unlock_irqrestore(&ps_dev->lock, flags);
+
 	return 0;
 }
 
@@ -1616,6 +1672,8 @@ static struct ps_device *dualshock4_create(struct hid_device *hdev)
 	ps_dev = &ds4->base;
 	ps_dev->hdev = hdev;
 	spin_lock_init(&ps_dev->lock);
+	ps_dev->battery_capacity = 100; /* initial value until parse_report. */
+	ps_dev->battery_status = POWER_SUPPLY_STATUS_UNKNOWN;
 	ps_dev->parse_report = dualshock4_parse_report;
 	hid_set_drvdata(hdev, ds4);
 
@@ -1642,6 +1700,10 @@ static struct ps_device *dualshock4_create(struct hid_device *hdev)
 		goto err;
 	}
 
+	ret = ps_device_register_battery(ps_dev);
+	if (ret)
+		goto err;
+
 	ret = ps_device_set_player_id(ps_dev);
 	if (ret) {
 		hid_err(hdev, "Failed to assign player id for DualShock4: %d\n", ret);
-- 
2.37.3

