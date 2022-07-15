Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1B5AA576A5F
	for <lists+linux-input@lfdr.de>; Sat, 16 Jul 2022 01:05:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230222AbiGOXFW (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 15 Jul 2022 19:05:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231810AbiGOXFR (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 15 Jul 2022 19:05:17 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E6E38BAA6
        for <linux-input@vger.kernel.org>; Fri, 15 Jul 2022 16:05:16 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id p9so6854411pjd.3
        for <linux-input@vger.kernel.org>; Fri, 15 Jul 2022 16:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IJe0lgfJICowTRa3UBGHLmthbWN8TcJrFiGAEnt3Rlw=;
        b=lYelmKVyTL9DvhR11oXkn6iU4rPY34KSv/nd6zTi43g0SFhElc+2PFB4SWYf/HJYks
         1F06kEiUEJAWvCjv4pwyPjSVYo2nCWrZT8ybNKqQxS5NihweXaoXxm0t1+Z51yKvpZ7E
         8WNbeHf8PO0HlcqJSmNnRuNPLE2GPTxyaGHPiX0MlBnu9EEhsipfAyf9OsP/2XrJBfhG
         2KOmfMOxf0Bc6I+9x+kcDGlzaQ0cfK2JMNwgFC5Q1+aZpTLretHic7HILggfdm/a5O2B
         DD2ovvwd/WgXkF9vudCK6FmnPHhtX/CR68JZJTMidBCpntsuX0PmKwbsYft3WT8DqQA7
         1WOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IJe0lgfJICowTRa3UBGHLmthbWN8TcJrFiGAEnt3Rlw=;
        b=y2ZWCQCAbBEfLgGw8+vkIMX9UocXyTVUtA6+DD237rrC2mmfe7SUoqNIi5DF8YOKDn
         uS9gwRIAbYvO4Bwet/nU7XU4ShH5tHbJveIc+VDnXz9RR32t9wm1YesdVXbcxErR5FBK
         JmHamtGMZq/jHNrMHijYxpxEg4+wMvy2mtiNkHOzOg7asUg2FNioDAoKF9UuYga3MCeI
         1h+ALsx+k+csMxiSXTbIXUN0plgMll6znJmkkPZ1YqRWqjDtQmRL5otPgqZPissFgY2f
         vm2tlMa38LfHX83EFTThkLp//6PtFFPtUojWaIcF1ks2ZMRRKDT2GV6J9I2Epz+I4/zX
         y/Xg==
X-Gm-Message-State: AJIora8KrbYGrTmZRqUFzthCnXEykLnMMCdRNl7WUJ3lXuqLXHGHjW8f
        WpacDOzEveFLYZKXbwh+ilLWukBmpqsdqQ==
X-Google-Smtp-Source: AGRyM1sniU0KFMFrOnZsHXDopKB4yzhvG9626fXtVC6IJgMbAHYGBSI7NIzGkl8GURNcYzOLP91wcw==
X-Received: by 2002:a17:902:f684:b0:16c:5811:486f with SMTP id l4-20020a170902f68400b0016c5811486fmr15879115plg.64.1657926315514;
        Fri, 15 Jul 2022 16:05:15 -0700 (PDT)
Received: from horus.lan (75-164-183-54.ptld.qwest.net. [75.164.183.54])
        by smtp.gmail.com with ESMTPSA id a18-20020a170902b59200b0016bcc35000asm4037144pls.302.2022.07.15.16.05.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Jul 2022 16:05:14 -0700 (PDT)
From:   Jason Gerecke <killertofu@gmail.com>
X-Google-Original-From: Jason Gerecke <jason.gerecke@wacom.com>
To:     linux-input@vger.kernel.org,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Jiri Kosina <jikos@kernel.org>
Cc:     Ping Cheng <pinglinux@gmail.com>,
        Aaron Armstrong Skomra <skomra@gmail.com>,
        Joshua Dickens <Joshua@Joshua-Dickens.com>,
        Jason Gerecke <jason.gerecke@wacom.com>
Subject: [PATCH] HID: wacom: Force pen out of prox if no events have been received in a while
Date:   Fri, 15 Jul 2022 16:05:19 -0700
Message-Id: <20220715230519.2183-1-jason.gerecke@wacom.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Prox-out events may not be reliably sent by some AES firmware. This can
cause problems for users, particularly due to arbitration logic disabling
touch input while the pen is in prox.

This commit adds a timer which is reset every time a new prox event is
received. When the timer expires we check to see if the pen is still in
prox and force it out if necessary. This is patterend off of the same
solution used by 'hid-letsketch' driver which has a similar problem.

Link: https://github.com/linuxwacom/input-wacom/issues/310
Signed-off-by: Jason Gerecke <jason.gerecke@wacom.com>
---
 drivers/hid/wacom.h     |  3 +++
 drivers/hid/wacom_sys.c |  2 ++
 drivers/hid/wacom_wac.c | 39 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 44 insertions(+)

diff --git a/drivers/hid/wacom.h b/drivers/hid/wacom.h
index 203d27d198b8..3f8b24a57014 100644
--- a/drivers/hid/wacom.h
+++ b/drivers/hid/wacom.h
@@ -91,6 +91,7 @@
 #include <linux/leds.h>
 #include <linux/usb/input.h>
 #include <linux/power_supply.h>
+#include <linux/timer.h>
 #include <asm/unaligned.h>
 
 /*
@@ -167,6 +168,7 @@ struct wacom {
 	struct delayed_work init_work;
 	struct wacom_remote *remote;
 	struct work_struct mode_change_work;
+	struct timer_list idleprox_timer;
 	bool generic_has_leds;
 	struct wacom_leds {
 		struct wacom_group_leds *groups;
@@ -239,4 +241,5 @@ struct wacom_led *wacom_led_find(struct wacom *wacom, unsigned int group,
 struct wacom_led *wacom_led_next(struct wacom *wacom, struct wacom_led *cur);
 int wacom_equivalent_usage(int usage);
 int wacom_initialize_leds(struct wacom *wacom);
+void wacom_idleprox_timeout(struct timer_list *list);
 #endif
diff --git a/drivers/hid/wacom_sys.c b/drivers/hid/wacom_sys.c
index 98384b911288..194a2e327591 100644
--- a/drivers/hid/wacom_sys.c
+++ b/drivers/hid/wacom_sys.c
@@ -2781,6 +2781,7 @@ static int wacom_probe(struct hid_device *hdev,
 	INIT_WORK(&wacom->battery_work, wacom_battery_work);
 	INIT_WORK(&wacom->remote_work, wacom_remote_work);
 	INIT_WORK(&wacom->mode_change_work, wacom_mode_change_work);
+	timer_setup(&wacom->idleprox_timer, &wacom_idleprox_timeout, TIMER_DEFERRABLE);
 
 	/* ask for the report descriptor to be loaded by HID */
 	error = hid_parse(hdev);
@@ -2821,6 +2822,7 @@ static void wacom_remove(struct hid_device *hdev)
 	cancel_work_sync(&wacom->battery_work);
 	cancel_work_sync(&wacom->remote_work);
 	cancel_work_sync(&wacom->mode_change_work);
+	del_timer_sync(&wacom->idleprox_timer);
 	if (hdev->bus == BUS_BLUETOOTH)
 		device_remove_file(&hdev->dev, &dev_attr_speed);
 
diff --git a/drivers/hid/wacom_wac.c b/drivers/hid/wacom_wac.c
index f8cc4bb3e3a7..d049239256a2 100644
--- a/drivers/hid/wacom_wac.c
+++ b/drivers/hid/wacom_wac.c
@@ -11,6 +11,7 @@
 #include "wacom_wac.h"
 #include "wacom.h"
 #include <linux/input/mt.h>
+#include <linux/jiffies.h>
 
 /* resolution for penabled devices */
 #define WACOM_PL_RES		20
@@ -41,6 +42,43 @@ static int wacom_numbered_button_to_key(int n);
 
 static void wacom_update_led(struct wacom *wacom, int button_count, int mask,
 			     int group);
+
+static void wacom_force_proxout(struct wacom_wac *wacom_wac)
+{
+	struct input_dev *input = wacom_wac->pen_input;
+
+	wacom_wac->shared->stylus_in_proximity = 0;
+
+	input_report_key(input, BTN_TOUCH, 0);
+	input_report_key(input, BTN_STYLUS, 0);
+	input_report_key(input, BTN_STYLUS2, 0);
+	input_report_key(input, BTN_STYLUS3, 0);
+	input_report_key(input, wacom_wac->tool[0], 0);
+	if (wacom_wac->serial[0]) {
+		input_report_abs(input, ABS_MISC, 0);
+	}
+	input_report_abs(input, ABS_PRESSURE, 0);
+
+	wacom_wac->tool[0] = 0;
+	wacom_wac->id[0] = 0;
+	wacom_wac->serial[0] = 0;
+
+	input_sync(input);
+}
+
+void wacom_idleprox_timeout(struct timer_list *list)
+{
+	struct wacom *wacom = from_timer(wacom, list, idleprox_timer);
+	struct wacom_wac *wacom_wac = &wacom->wacom_wac;
+
+	if (!wacom_wac->hid_data.sense_state) {
+		return;
+	}
+
+	hid_warn(wacom->hdev, "%s: tool appears to be hung in-prox. forcing it out.\n", __func__);
+	wacom_force_proxout(wacom_wac);
+}
+
 /*
  * Percent of battery capacity for Graphire.
  * 8th value means AC online and show 100% capacity.
@@ -2329,6 +2367,7 @@ static void wacom_wac_pen_event(struct hid_device *hdev, struct hid_field *field
 		value = field->logical_maximum - value;
 		break;
 	case HID_DG_INRANGE:
+		mod_timer(&wacom->idleprox_timer, jiffies + msecs_to_jiffies(100));
 		wacom_wac->hid_data.inrange_state = value;
 		if (!(features->quirks & WACOM_QUIRK_SENSE))
 			wacom_wac->hid_data.sense_state = value;
-- 
2.37.1

