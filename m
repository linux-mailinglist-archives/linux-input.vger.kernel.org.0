Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 67ED331DE52
	for <lists+linux-input@lfdr.de>; Wed, 17 Feb 2021 18:35:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234505AbhBQRfG (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 17 Feb 2021 12:35:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51300 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234521AbhBQRdo (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 17 Feb 2021 12:33:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1613583138;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=oHL7SKw9vvLF4yISsj7spnDs+0ju5Qgji3y4L4bOR7Q=;
        b=LGlT+FqQmQdHgajE+Shu8uQv0fSBc1gWVWJaNYLLy8hvVd4Dinel+1SPsvM/KNKvCVz5+b
        //pTemCryvgSPTN0nljT9iSNjNL5w/QJO5ODA1f1831MkihqN0Rc2fLS+6Whb1admxKGz2
        GR8rYArGZ/2bQ8sAGSvg8T9bu7ltoHw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-291-dCO1wbdNPNqRFHuJsHouHA-1; Wed, 17 Feb 2021 12:32:14 -0500
X-MC-Unique: dCO1wbdNPNqRFHuJsHouHA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ACBF2835E28;
        Wed, 17 Feb 2021 17:32:12 +0000 (UTC)
Received: from plouf.redhat.com (ovpn-116-25.ams2.redhat.com [10.36.116.25])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 0723F60C61;
        Wed, 17 Feb 2021 17:32:10 +0000 (UTC)
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>,
        =?UTF-8?q?Barnab=C3=A1s=20P=C5=91cze?= <pobrn@protonmail.com>
Cc:     linux-input@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Subject: [PATCH 04/11] Revert "HID: playstation: add DualSense player LEDs support."
Date:   Wed, 17 Feb 2021 18:31:51 +0100
Message-Id: <20210217173158.3122868-5-benjamin.tissoires@redhat.com>
In-Reply-To: <20210217173158.3122868-1-benjamin.tissoires@redhat.com>
References: <20210217173158.3122868-1-benjamin.tissoires@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Roderick Colenbrander <roderick.colenbrander@sony.com>

This reverts commit c240f0cb88ec ("HID: playstation: add
DualSense player LEDs support.")

There is currently an ongoing discussion on linux-leds LKML,
and so to give us more room, we need to revert those related
patches from linux-next.

This is not a big deal, they are still not pushed to Linus.

Signed-off-by: Roderick Colenbrander <roderick.colenbrander@sony.com>
Signed-off-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>
---
 drivers/hid/hid-playstation.c | 60 +----------------------------------
 1 file changed, 1 insertion(+), 59 deletions(-)

diff --git a/drivers/hid/hid-playstation.c b/drivers/hid/hid-playstation.c
index 2d96785c397d..c436ac8f7a6f 100644
--- a/drivers/hid/hid-playstation.c
+++ b/drivers/hid/hid-playstation.c
@@ -112,7 +112,6 @@ struct ps_led_info {
 #define DS_OUTPUT_VALID_FLAG1_POWER_SAVE_CONTROL_ENABLE BIT(1)
 #define DS_OUTPUT_VALID_FLAG1_LIGHTBAR_CONTROL_ENABLE BIT(2)
 #define DS_OUTPUT_VALID_FLAG1_RELEASE_LEDS BIT(3)
-#define DS_OUTPUT_VALID_FLAG1_PLAYER_INDICATOR_CONTROL_ENABLE BIT(4)
 #define DS_OUTPUT_VALID_FLAG2_LIGHTBAR_SETUP_CONTROL_ENABLE BIT(1)
 #define DS_OUTPUT_POWER_SAVE_CONTROL_MIC_MUTE BIT(4)
 #define DS_OUTPUT_LIGHTBAR_SETUP_LIGHT_OUT BIT(1)
@@ -158,11 +157,6 @@ struct dualsense {
 	bool last_btn_mic_state;
 	struct led_classdev mute_led;
 
-	/* Player leds */
-	bool update_player_leds;
-	uint8_t player_leds_state;
-	struct led_classdev player_leds[5];
-
 	struct work_struct output_worker;
 	void *output_report_dmabuf;
 	uint8_t output_seq; /* Sequence number for output report. */
@@ -784,35 +778,6 @@ static void dualsense_mute_led_set_brightness(struct led_classdev *led, enum led
 
 }
 
-static enum led_brightness dualsense_player_led_get_brightness(struct led_classdev *led)
-{
-	struct hid_device *hdev = to_hid_device(led->dev->parent);
-	struct dualsense *ds = hid_get_drvdata(hdev);
-
-	return !!(ds->player_leds_state & BIT(led - ds->player_leds));
-}
-
-static void dualsense_player_led_set_brightness(struct led_classdev *led, enum led_brightness value)
-{
-	struct hid_device *hdev = to_hid_device(led->dev->parent);
-	struct dualsense *ds = hid_get_drvdata(hdev);
-	unsigned long flags;
-	unsigned int led_index;
-
-	spin_lock_irqsave(&ds->base.lock, flags);
-
-	led_index = led - ds->player_leds;
-	if (value == LED_OFF)
-		ds->player_leds_state &= ~BIT(led_index);
-	else
-		ds->player_leds_state |= BIT(led_index);
-
-	ds->update_player_leds = true;
-	spin_unlock_irqrestore(&ds->base.lock, flags);
-
-	schedule_work(&ds->output_worker);
-}
-
 static void dualsense_init_output_report(struct dualsense *ds, struct dualsense_output_report *rp,
 		void *buf)
 {
@@ -905,13 +870,6 @@ static void dualsense_output_worker(struct work_struct *work)
 		ds->update_lightbar = false;
 	}
 
-	if (ds->update_player_leds) {
-		common->valid_flag1 |= DS_OUTPUT_VALID_FLAG1_PLAYER_INDICATOR_CONTROL_ENABLE;
-		common->player_leds = ds->player_leds_state;
-
-		ds->update_player_leds = false;
-	}
-
 	if (ds->update_mic_mute) {
 		common->valid_flag1 |= DS_OUTPUT_VALID_FLAG1_MIC_MUTE_LED_CONTROL_ENABLE;
 		common->mute_button_led = ds->mic_muted;
@@ -1161,20 +1119,12 @@ static struct ps_device *dualsense_create(struct hid_device *hdev)
 	struct dualsense *ds;
 	struct ps_device *ps_dev;
 	uint8_t max_output_report_size;
-	int i, ret;
+	int ret;
 
 	static const struct ps_led_info mute_led_info = {
 		"micmute", dualsense_mute_led_get_brightness, dualsense_mute_led_set_brightness
 	};
 
-	static const struct ps_led_info player_leds_info[] = {
-		{ "led1", dualsense_player_led_get_brightness, dualsense_player_led_set_brightness },
-		{ "led2", dualsense_player_led_get_brightness, dualsense_player_led_set_brightness },
-		{ "led3", dualsense_player_led_get_brightness, dualsense_player_led_set_brightness },
-		{ "led4", dualsense_player_led_get_brightness, dualsense_player_led_set_brightness },
-		{ "led5", dualsense_player_led_get_brightness, dualsense_player_led_set_brightness }
-	};
-
 	ds = devm_kzalloc(&hdev->dev, sizeof(*ds), GFP_KERNEL);
 	if (!ds)
 		return ERR_PTR(-ENOMEM);
@@ -1256,14 +1206,6 @@ static struct ps_device *dualsense_create(struct hid_device *hdev)
 	if (ret)
 		goto err;
 
-	for (i = 0; i < ARRAY_SIZE(player_leds_info); i++) {
-		const struct ps_led_info *led_info = &player_leds_info[i];
-
-		ret = ps_led_register(ps_dev, &ds->player_leds[i], led_info);
-		if (ret < 0)
-			goto err;
-	}
-
 	return &ds->base;
 
 err:
-- 
2.29.2

