Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B13A66511A
	for <lists+linux-input@lfdr.de>; Wed, 11 Jan 2023 02:31:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229651AbjAKBbN (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 10 Jan 2023 20:31:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230053AbjAKBbL (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 10 Jan 2023 20:31:11 -0500
X-Greylist: delayed 417 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 10 Jan 2023 17:31:09 PST
Received: from endrift.com (endrift.com [173.255.198.10])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BAE512AFA
        for <linux-input@vger.kernel.org>; Tue, 10 Jan 2023 17:31:09 -0800 (PST)
Received: from nebulosa.vulpes.eutheria.net (unknown [50.47.218.115])
        by endrift.com (Postfix) with ESMTPSA id 7E6C9A2AF;
        Tue, 10 Jan 2023 17:24:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=endrift.com; s=2020;
        t=1673400251; bh=DqtHKZ5jtU6DDxotGqA36FtdBtoKh5dI5+YV6QWDkf8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=k1A91Jzllu+8DdcWT9CggFnDvRszdiV/ecVxmiVZMzONZs1/xhHd0Q+fIrI2OXG1b
         CJnbdA0XzzNsRociKnjKnBnpML2M5irS+5PHJt4fc0t68XBD8smfwTmvFaZ1yGT+kh
         US+o9P/Tr1kKFK0RaRrJG9Z+TBHwYVftIXjWKmu2LaSQeC7/XIdxfPuoCqdv5S+UF0
         m0fq9ayMIl2G19D0WRGztAksWRipbVCRk5FmdtRp3EaX0ybBLfCcS1CJxVGlRV+zRl
         ET1+EkFqk1Tl2EWTyKBasoO5zfoezh3N5+pWP5sHz6PzHhLRAgjEBcN0dbGAJa9kZx
         8TVhGvaa1xbmg==
From:   Vicki Pfau <vi@endrift.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org
Cc:     Vicki Pfau <vi@endrift.com>
Subject: [PATCH 2/2] HID: hid-steam: Add rumble on Deck
Date:   Tue, 10 Jan 2023 17:23:36 -0800
Message-Id: <20230111012336.2915827-2-vi@endrift.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230111012336.2915827-1-vi@endrift.com>
References: <20230111012336.2915827-1-vi@endrift.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The Steam Deck includes a new report that allows for emulating XInput-style
rumble motors with the Deck's actuators. This adds support for passing these
values directly to the Deck.

Signed-off-by: Vicki Pfau <vi@endrift.com>
---
 drivers/hid/Kconfig     |  8 ++++++
 drivers/hid/hid-steam.c | 55 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 63 insertions(+)

diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
index e2a5d30c8895..e9de0a2d3cd3 100644
--- a/drivers/hid/Kconfig
+++ b/drivers/hid/Kconfig
@@ -1025,6 +1025,14 @@ config HID_STEAM
 	without running the Steam Client. It supports both the wired and
 	the wireless adaptor.
 
+config STEAM_FF
+	bool "Steam Deck force feedback support"
+	depends on HID_STEAM
+	select INPUT_FF_MEMLESS
+	help
+	Say Y here if you want to enable force feedback support for the Steam
+	Deck.
+
 config HID_STEELSERIES
 	tristate "Steelseries SRW-S1 steering wheel support"
 	help
diff --git a/drivers/hid/hid-steam.c b/drivers/hid/hid-steam.c
index efd192d6c51a..788b5baaf145 100644
--- a/drivers/hid/hid-steam.c
+++ b/drivers/hid/hid-steam.c
@@ -91,6 +91,7 @@ static LIST_HEAD(steam_devices);
 #define STEAM_CMD_FORCEFEEDBAK		0x8f
 #define STEAM_CMD_REQUEST_COMM_STATUS	0xb4
 #define STEAM_CMD_GET_SERIAL		0xae
+#define STEAM_CMD_HAPTIC_RUMBLE		0xeb
 
 /* Some useful register ids */
 #define STEAM_REG_LPAD_MODE		0x07
@@ -134,6 +135,9 @@ struct steam_device {
 	u8 battery_charge;
 	u16 voltage;
 	struct delayed_work heartbeat;
+	struct work_struct rumble_work;
+	u16 rumble_left;
+	u16 rumble_right;
 };
 
 static int steam_recv_report(struct steam_device *steam,
@@ -290,6 +294,45 @@ static inline int steam_request_conn_status(struct steam_device *steam)
 	return steam_send_report_byte(steam, STEAM_CMD_REQUEST_COMM_STATUS);
 }
 
+static inline int steam_haptic_rumble(struct steam_device *steam,
+				u16 intensity, u16 left_speed, u16 right_speed,
+				u8 left_gain, u8 right_gain)
+{
+	u8 report[11] = {STEAM_CMD_HAPTIC_RUMBLE, 9};
+
+	report[3] = intensity & 0xFF;
+	report[4] = intensity >> 8;
+	report[5] = left_speed & 0xFF;
+	report[6] = left_speed >> 8;
+	report[7] = right_speed & 0xFF;
+	report[8] = right_speed >> 8;
+	report[9] = left_gain;
+	report[10] = right_gain;
+
+	return steam_send_report(steam, report, sizeof(report));
+}
+
+static void steam_haptic_rumble_cb(struct work_struct *work)
+{
+	struct steam_device *steam = container_of(work, struct steam_device,
+							rumble_work);
+	steam_haptic_rumble(steam, 0, steam->rumble_left,
+		steam->rumble_right, 2, 0);
+}
+
+#ifdef CONFIG_STEAM_FF
+static int steam_play_effect(struct input_dev *dev, void *data,
+				struct ff_effect *effect)
+{
+	struct steam_device *steam = input_get_drvdata(dev);
+
+	steam->rumble_left = effect->u.rumble.strong_magnitude;
+	steam->rumble_right = effect->u.rumble.weak_magnitude;
+
+	return schedule_work(&steam->rumble_work);
+}
+#endif
+
 static void steam_set_lizard_mode(struct steam_device *steam, bool enable)
 {
 	if (enable) {
@@ -541,6 +584,15 @@ static int steam_input_register(struct steam_device *steam)
 	input_abs_set_res(input, ABS_HAT0X, STEAM_PAD_RESOLUTION);
 	input_abs_set_res(input, ABS_HAT0Y, STEAM_PAD_RESOLUTION);
 
+#ifdef CONFIG_STEAM_FF
+	if (steam->quirks & STEAM_QUIRK_DECK) {
+		input_set_capability(input, EV_FF, FF_RUMBLE);
+		ret = input_ff_create_memless(input, NULL, steam_play_effect);
+		if (ret)
+			goto init_ff_fail;
+	}
+#endif
+
 	ret = input_register_device(input);
 	if (ret)
 		goto input_register_fail;
@@ -549,6 +601,7 @@ static int steam_input_register(struct steam_device *steam)
 	return 0;
 
 input_register_fail:
+init_ff_fail:
 	input_free_device(input);
 	return ret;
 }
@@ -842,6 +895,7 @@ static int steam_probe(struct hid_device *hdev,
 	INIT_WORK(&steam->work_connect, steam_work_connect_cb);
 	INIT_LIST_HEAD(&steam->list);
 	INIT_DEFERRABLE_WORK(&steam->heartbeat, steam_lizard_mode_heartbeat);
+	INIT_WORK(&steam->rumble_work, steam_haptic_rumble_cb);
 
 	steam->client_hdev = steam_create_client_hid(hdev);
 	if (IS_ERR(steam->client_hdev)) {
@@ -898,6 +952,7 @@ static int steam_probe(struct hid_device *hdev,
 client_hdev_fail:
 	cancel_work_sync(&steam->work_connect);
 	cancel_delayed_work_sync(&steam->heartbeat);
+	cancel_work_sync(&steam->rumble_work);
 steam_alloc_fail:
 	hid_err(hdev, "%s: failed with error %d\n",
 			__func__, ret);
-- 
2.39.0

