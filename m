Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4AAE12DED7E
	for <lists+linux-input@lfdr.de>; Sat, 19 Dec 2020 07:25:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726333AbgLSGZF (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 19 Dec 2020 01:25:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726359AbgLSGZE (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 19 Dec 2020 01:25:04 -0500
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB467C0611CF
        for <linux-input@vger.kernel.org>; Fri, 18 Dec 2020 22:23:52 -0800 (PST)
Received: by mail-pj1-x1033.google.com with SMTP id lb18so2525630pjb.5
        for <linux-input@vger.kernel.org>; Fri, 18 Dec 2020 22:23:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gaikai-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RE/V3Fxn8Wa5TfwxHlS9iuZPFhLFK2r+Jl8CgSwZmgg=;
        b=drEmzEMztRgu12f7jcUJRQyMNiNzOyVT+2MEz57sDvzQdrGbNL5Tsx5dCgL4y4JuQc
         jC5ho8sA6p/zhawFveZtFLXed4HBJxF55YruLmEWDaLG11+/g7sAWUwcpJDDA1ULiPxw
         MX62X7/O6xEMiFuFtO6t6xRpmsWYO8Yv7AchOlkNqffTwdibLPXEIelwuJdcx7w0wtJE
         9wqOVw6Zn9dlQOXq55GKx1KFiaqqInnaaG/5Q7etmtDyzp3E5FX+Z6Nr4kn87/JoOWns
         FNiS+/hbmL7nZ/QZEeNzpNPtgIqa1Qj7orJ+JCBC9KsLhlGzq4Pz2LzSnKRnhwJL73xX
         QK8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RE/V3Fxn8Wa5TfwxHlS9iuZPFhLFK2r+Jl8CgSwZmgg=;
        b=lT2t8pO6IEeq0W4DPTLGgz8X9AFLrKm7R3NDQcXfDfbUDWyA7jfchMNA0MP1kckWXw
         DEmGErRIKOS1EjDwfFoeDCcaE9MPvq4GVV2Ws0Du8NfbfWDiClbjtNnQoJUeZ9mhL9z9
         4Vf9PXTfp/q77XI/JGCh6WeFRKKKTAhxXXaQdm48KyLBa9FMCzvsQzFaQzrRE0lTv8Q1
         QaLrE9DwodgB5c1vnaO1pd6SQ/fxoia+0UFK1LmNcpeFaZpyweTYc1bbbm8WUobvneq2
         MTgAXIuQjyJeWQ8qBNNWiZvoHjuOnb6wusWTNgBGHRv3XPF032B7WsYXfURQZX9rmTYz
         b1gA==
X-Gm-Message-State: AOAM533fXc6b6yqjZyulfio1/R0URP7YsKGr3bhfOTFJe7M8VBTwEAKi
        JWrH4trOiX0sMHgH2eTHz6K2kO4uR7m3xg==
X-Google-Smtp-Source: ABdhPJz3gA9z+4dk4za0p1EmM3kjzPrpS21ZLqRBL3Za4H8w0c8AEMWUZ6k45zc+su3I25X2q1sbjg==
X-Received: by 2002:a17:902:a511:b029:dc:103:db16 with SMTP id s17-20020a170902a511b02900dc0103db16mr7451274plq.80.1608359032456;
        Fri, 18 Dec 2020 22:23:52 -0800 (PST)
Received: from localhost.localdomain (cpe-76-87-77-78.socal.res.rr.com. [76.87.77.78])
        by smtp.gmail.com with ESMTPSA id bf3sm9655302pjb.45.2020.12.18.22.23.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Dec 2020 22:23:52 -0800 (PST)
From:   Roderick Colenbrander <roderick@gaikai.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-input@vger.kernel.org, Chris Ye <lzye@google.com>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Subject: [PATCH 12/13] HID: playstation: DualSense set LEDs to default player id.
Date:   Fri, 18 Dec 2020 22:23:35 -0800
Message-Id: <20201219062336.72568-13-roderick@gaikai.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201219062336.72568-1-roderick@gaikai.com>
References: <20201219062336.72568-1-roderick@gaikai.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Roderick Colenbrander <roderick.colenbrander@sony.com>

Add a ID allocator to assign player ids to ps_device instances.
Utilize the player id to set a default color on the DualSense its
player LED strip.

Signed-off-by: Roderick Colenbrander <roderick.colenbrander@sony.com>
---
 drivers/hid/hid-playstation.c | 58 +++++++++++++++++++++++++++++++++--
 1 file changed, 56 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/hid-playstation.c b/drivers/hid/hid-playstation.c
index 384449e3095d..a55375ac79a9 100644
--- a/drivers/hid/hid-playstation.c
+++ b/drivers/hid/hid-playstation.c
@@ -20,12 +20,16 @@
 static DEFINE_MUTEX(ps_devices_lock);
 static LIST_HEAD(ps_devices_list);
 
+static DEFINE_IDA(ps_player_id_allocator);
+
 /* Base class for playstation devices. */
 struct ps_device {
 	struct list_head list;
 	struct hid_device *hdev;
 	spinlock_t lock;
 
+	uint32_t player_id;
+
 	struct power_supply_desc battery_desc;
 	struct power_supply *battery;
 	uint8_t battery_capacity;
@@ -288,6 +292,24 @@ static int ps_devices_list_remove(struct ps_device *dev)
 	return 0;
 }
 
+static int ps_device_set_player_id(struct ps_device *dev)
+{
+	int ret = ida_alloc(&ps_player_id_allocator, GFP_KERNEL);
+
+	if (ret < 0)
+		return ret;
+
+	dev->player_id = ret;
+	return 0;
+}
+
+static void ps_device_release_player_id(struct ps_device *dev)
+{
+	ida_free(&ps_player_id_allocator, dev->player_id);
+
+	dev->player_id = -1;
+}
+
 static struct input_dev *ps_allocate_input_dev(struct hid_device *hdev, const char *name_suffix)
 {
 	struct input_dev *input_dev;
@@ -837,8 +859,8 @@ static void dualsense_output_worker(struct work_struct *work)
 	}
 
 	if (ds->update_player_leds) {
-		r->valid_flag1 |= DS_OUTPUT_VALID_FLAG1_PLAYER_INDICATOR_CONTROL_ENABLE;
-		r->player_leds = ds->player_leds_state;
+		common->valid_flag1 |= DS_OUTPUT_VALID_FLAG1_PLAYER_INDICATOR_CONTROL_ENABLE;
+		common->player_leds = ds->player_leds_state;
 
 		ds->update_player_leds = false;
 	}
@@ -1084,6 +1106,28 @@ static int dualsense_reset_leds(struct dualsense *ds)
 	return 0;
 }
 
+static void dualsense_set_player_leds(struct dualsense *ds)
+{
+	/* The DualSense controller has a row of 5 LEDs used for player ids.
+	 * Behavior on the PlayStation 5 console is to center the player id
+	 * across the LEDs, so e.g. player 1 would be "--x--" with x being 'on'.
+	 * Follow a similar mapping here.
+	 */
+	int player_ids[5] = {
+		BIT(2),
+		BIT(3) | BIT(1),
+		BIT(4) | BIT(2) | BIT(0),
+		BIT(4) | BIT(3) | BIT(1) | BIT(0),
+		BIT(4) | BIT(3) | BIT(2) | BIT(1) | BIT(0)
+	};
+
+	uint8_t player_id = ds->base.player_id % 5;
+
+	ds->update_player_leds = true;
+	ds->player_leds_state = player_ids[player_id];
+	schedule_work(&ds->output_worker);
+}
+
 static struct ps_device *dualsense_create(struct hid_device *hdev)
 {
 	struct dualsense *ds;
@@ -1188,6 +1232,15 @@ static struct ps_device *dualsense_create(struct hid_device *hdev)
 			goto err;
 	}
 
+	ret = ps_device_set_player_id((struct ps_device *)ds);
+	if (ret < 0) {
+		hid_err(hdev, "Failed to assign player id for DualSense\n");
+		goto err;
+	}
+
+	/* Set player LEDs to our player id. */
+	dualsense_set_player_leds(ds);
+
 	return (struct ps_device *)ds;
 
 err:
@@ -1256,6 +1309,7 @@ static void ps_remove(struct hid_device *hdev)
 	struct ps_device *dev = hid_get_drvdata(hdev);
 
 	ps_devices_list_remove(dev);
+	ps_device_release_player_id(dev);
 
 	hid_hw_close(hdev);
 	hid_hw_stop(hdev);
-- 
2.26.2

