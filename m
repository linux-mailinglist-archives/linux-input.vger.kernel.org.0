Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5061B67C2FD
	for <lists+linux-input@lfdr.de>; Thu, 26 Jan 2023 04:01:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235065AbjAZDBt (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 25 Jan 2023 22:01:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229458AbjAZDBs (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 25 Jan 2023 22:01:48 -0500
Received: from endrift.com (endrift.com [173.255.198.10])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D92D45C0D9
        for <linux-input@vger.kernel.org>; Wed, 25 Jan 2023 19:01:46 -0800 (PST)
Received: from nebulosa.vulpes.eutheria.net (unknown [50.47.218.115])
        by endrift.com (Postfix) with ESMTPSA id C2302A2B2;
        Wed, 25 Jan 2023 19:01:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=endrift.com; s=2020;
        t=1674702106; bh=L1K99HNzupjB4FlPgPzIZ6ULBF6/CqggSWwz2YFxKfw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=YeFRPAlxMfaS50jO0+cKD1eJ41Z0YzdrRgYU7gjHx/mlaHWQeJcGn+lCDKuB19NBX
         Ch5TfTewfgLAbgNnGODE6MEUl0J3yrdDf6t5+SJpCPpcXdtY698v3LIGQPNwUZqpjP
         CxF2qOldzyx0AhklDJYaHNV6b25mLU7LObrRrKjp/LM+OKB2iPfJTTcR2y9g9/8x++
         Lu6Bww+XVvQfrKo37b/RSpZb2YdX0tePX4+b8DoNII4++Jjt9MFbBdFx/mLeFauW0s
         FkmGUrxRC54a2YEpQYLYy5gPu7wnmObU+lE+iU4CKNPfACDhtlXSZE7ePX1hG1xXd1
         EGsf9GDUbX+lA==
From:   Vicki Pfau <vi@endrift.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Lyude Paul <lyude@redhat.com>, linux-input@vger.kernel.org
Cc:     Vicki Pfau <vi@endrift.com>
Subject: [PATCH v2 2/2] HID: hid-steam: Add rumble on Deck
Date:   Wed, 25 Jan 2023 19:01:26 -0800
Message-Id: <20230126030126.895670-3-vi@endrift.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230111012336.2915827-2-vi@endrift.com>
References: <20230111012336.2915827-2-vi@endrift.com>
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
Reviewed-by: Lyude Paul <lyude@redhat.com>
---
 drivers/hid/Kconfig     |  8 ++++++
 drivers/hid/hid-steam.c | 54 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 62 insertions(+)

diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
index 20402d0a7eab..ce488cf8765f 100644
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
index 09330d9bfee3..aaca390ca299 100644
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
@@ -540,6 +583,15 @@ static int steam_input_register(struct steam_device *steam)
 	input_abs_set_res(input, ABS_HAT0X, STEAM_PAD_RESOLUTION);
 	input_abs_set_res(input, ABS_HAT0Y, STEAM_PAD_RESOLUTION);
 
+#ifdef CONFIG_STEAM_FF
+	if (steam->quirks & STEAM_QUIRK_DECK) {
+		input_set_capability(input, EV_FF, FF_RUMBLE);
+		ret = input_ff_create_memless(input, NULL, steam_play_effect);
+		if (ret)
+			goto input_register_fail;
+	}
+#endif
+
 	ret = input_register_device(input);
 	if (ret)
 		goto input_register_fail;
@@ -841,6 +893,7 @@ static int steam_probe(struct hid_device *hdev,
 	INIT_WORK(&steam->work_connect, steam_work_connect_cb);
 	INIT_LIST_HEAD(&steam->list);
 	INIT_DEFERRABLE_WORK(&steam->heartbeat, steam_lizard_mode_heartbeat);
+	INIT_WORK(&steam->rumble_work, steam_haptic_rumble_cb);
 
 	steam->client_hdev = steam_create_client_hid(hdev);
 	if (IS_ERR(steam->client_hdev)) {
@@ -897,6 +950,7 @@ static int steam_probe(struct hid_device *hdev,
 client_hdev_fail:
 	cancel_work_sync(&steam->work_connect);
 	cancel_delayed_work_sync(&steam->heartbeat);
+	cancel_work_sync(&steam->rumble_work);
 steam_alloc_fail:
 	hid_err(hdev, "%s: failed with error %d\n",
 			__func__, ret);
-- 
2.39.1

