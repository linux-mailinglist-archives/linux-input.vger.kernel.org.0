Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7FDE057861B
	for <lists+linux-input@lfdr.de>; Mon, 18 Jul 2022 17:17:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233406AbiGRPR5 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 18 Jul 2022 11:17:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235245AbiGRPR5 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 18 Jul 2022 11:17:57 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA9EF26AEA
        for <linux-input@vger.kernel.org>; Mon, 18 Jul 2022 08:17:55 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id e15so12284420wro.5
        for <linux-input@vger.kernel.org>; Mon, 18 Jul 2022 08:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YZAOxtAnAR9sp8dvz4bz9CDD/oWkzFTPpw1SRzra+qQ=;
        b=nCmQPdRhSPqjCGLcYZmldUKFap/RDmNnB5pEqCnebfSq04hFhOlx8g3F8FGlzrXODI
         l0L5mSLDgm6/ZktH2mn/JZwKO0K55J5bRFMvKMUY0xsZcP5j9H3p6TWulGF5eiCRNRnK
         yQtzZntn+74QfFMvoTOec0TQ9056lUpu8mwG9JrqMBYXr8QkfGXq/ZQx6R6TAwk5/F17
         Fwv4QTWUYkDXU81zlkrhyFAqB6SjW/xy2031AiCqrW3PYSu5bmADK3+Wtx5wWbRz41c4
         laOiFLr2quiUWhzS79QxoZ5GkLOVjHiX52hQXj7B+p3S7QOEAs/FflT26Tq0akP+1WY1
         6X6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YZAOxtAnAR9sp8dvz4bz9CDD/oWkzFTPpw1SRzra+qQ=;
        b=w8YUBpOonQ6ppwaD++cB0E8tDHg1TPfDtms/2zyF5s6gcvowlqPAzpen71XYz0+thV
         emqgbY4nCKUpxK1I2GulkEbxkHXhZZ9o6N7rfd3OVgscOhYjOL8B1LtM1iAjluCZHEJV
         8p3e2RoB9iBHqxY5AG8vghcPe3LIfV73rUHUefCzk9SdHh9dm6zztoYC0Ti0EM4iAP8H
         GER7khd32rcPCyeznQMKyOLqB41PgjzO/GmCDbNzY7fq6SfQvA9VM8/8TbeHS8PYaSiR
         imwyWrZc5i/vBBQ56VA25/RFFKGf86abnTiiEacXADBLkR3I23iamYs316gAvQ9qbveV
         D0cQ==
X-Gm-Message-State: AJIora+2XpqR42dRhlP1egoRZPkNWzTK3pzlILmHE6bIfUkGU8L/Um5W
        Fe8szqLaNQzvGnNxzTvjx4149PHESzc8cZCx
X-Google-Smtp-Source: AGRyM1uqHGxPJ8VXShK10UrXukUWeEeOutdBsnCcE+Ih25KhvBsqJvZshlPZZo/OQEri+HYewHBbKA==
X-Received: by 2002:a5d:42c4:0:b0:21e:2cd4:a72e with SMTP id t4-20020a5d42c4000000b0021e2cd4a72emr77645wrr.249.1658157474363;
        Mon, 18 Jul 2022 08:17:54 -0700 (PDT)
Received: from aczubak.c.googlers.com.com (88.140.78.34.bc.googleusercontent.com. [34.78.140.88])
        by smtp.gmail.com with ESMTPSA id t4-20020a1c7704000000b003a308e9a192sm13346075wmi.30.2022.07.18.08.17.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jul 2022 08:17:53 -0700 (PDT)
From:   Angela Czubak <acz@semihalf.com>
To:     linux-input@vger.kernel.org, dmitry.torokhov@gmail.com
Cc:     upstream@semihalf.com, benjamin.tissoires@redhat.com,
        hdegoede@redhat.com, peter.hutterer@who-t.net,
        Angela Czubak <acz@semihalf.com>
Subject: [PATCH v2 2/2] Input: Inactivate slots in input_inhibit_device()
Date:   Mon, 18 Jul 2022 15:17:15 +0000
Message-Id: <20220718151715.1052842-3-acz@semihalf.com>
X-Mailer: git-send-email 2.37.0.170.g444d1eabd0-goog
In-Reply-To: <20220718151715.1052842-1-acz@semihalf.com>
References: <20220718151715.1052842-1-acz@semihalf.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Function input_dev_release_keys() issues BTN_TOUCH = 0 event to the
userpace if there was any touch present.
Make slot state consistent for multitouch devices and send
ABS_MT_TRACKING_ID = -1 for every active slot when the device gets
inhibited.
Factor out sending EV_SYN from input_dev_release_keys() as we may possibly
want to send it later.

Signed-off-by: Angela Czubak <acz@semihalf.com>
---
 drivers/input/input-core-private.h | 16 ++++++++++
 drivers/input/input-mt.c           | 48 +++++++++++++++++++++++++++---
 drivers/input/input.c              | 31 ++++++++++++-------
 include/linux/input/mt.h           |  1 +
 4 files changed, 82 insertions(+), 14 deletions(-)
 create mode 100644 drivers/input/input-core-private.h

diff --git a/drivers/input/input-core-private.h b/drivers/input/input-core-private.h
new file mode 100644
index 0000000000000..116834cf88689
--- /dev/null
+++ b/drivers/input/input-core-private.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef _INPUT_CORE_PRIVATE_H
+#define _INPUT_CORE_PRIVATE_H
+
+/*
+ * Functions and definitions that are private to input core,
+ * should not be used by input drivers or handlers.
+ */
+
+struct input_dev;
+
+void input_mt_release_slots(struct input_dev *dev);
+void input_handle_event(struct input_dev *dev,
+			unsigned int type, unsigned int code, int value);
+
+#endif /* _INPUT_CORE_PRIVATE_H */
diff --git a/drivers/input/input-mt.c b/drivers/input/input-mt.c
index 44fe6f2f063ce..14b53dac1253b 100644
--- a/drivers/input/input-mt.c
+++ b/drivers/input/input-mt.c
@@ -8,6 +8,7 @@
 #include <linux/input/mt.h>
 #include <linux/export.h>
 #include <linux/slab.h>
+#include "input-core-private.h"
 
 #define TRKID_SGN	((TRKID_MAX + 1) >> 1)
 
@@ -259,10 +260,13 @@ static void __input_mt_drop_unused(struct input_dev *dev, struct input_mt *mt)
 {
 	int i;
 
+	lockdep_assert_held(&dev->event_lock);
+
 	for (i = 0; i < mt->num_slots; i++) {
-		if (!input_mt_is_used(mt, &mt->slots[i])) {
-			input_mt_slot(dev, i);
-			input_event(dev, EV_ABS, ABS_MT_TRACKING_ID, -1);
+		if (input_mt_is_active(&mt->slots[i]) &&
+		    !input_mt_is_used(mt, &mt->slots[i])) {
+			input_handle_event(dev, EV_ABS, ABS_MT_SLOT, i);
+			input_handle_event(dev, EV_ABS, ABS_MT_TRACKING_ID, -1);
 		}
 	}
 }
@@ -278,12 +282,43 @@ void input_mt_drop_unused(struct input_dev *dev)
 	struct input_mt *mt = dev->mt;
 
 	if (mt) {
+		unsigned long flags;
+
+		spin_lock_irqsave(&dev->event_lock, flags);
+
 		__input_mt_drop_unused(dev, mt);
 		mt->frame++;
+
+		spin_unlock_irqrestore(&dev->event_lock, flags);
 	}
 }
 EXPORT_SYMBOL(input_mt_drop_unused);
 
+/**
+ * input_mt_release_slots() - Deactivate all slots
+ * @dev: input device with allocated MT slots
+ *
+ * Lift all active slots.
+ */
+void input_mt_release_slots(struct input_dev *dev)
+{
+	struct input_mt *mt = dev->mt;
+
+	lockdep_assert_held(&dev->event_lock);
+
+	if (mt) {
+		/* This will effectively mark all slots unused. */
+		mt->frame++;
+
+		__input_mt_drop_unused(dev, mt);
+
+		if (test_bit(ABS_PRESSURE, dev->absbit))
+			input_handle_event(dev, EV_ABS, ABS_PRESSURE, 0);
+
+		mt->frame++;
+	}
+}
+
 /**
  * input_mt_sync_frame() - synchronize mt frame
  * @dev: input device with allocated MT slots
@@ -300,8 +335,13 @@ void input_mt_sync_frame(struct input_dev *dev)
 	if (!mt)
 		return;
 
-	if (mt->flags & INPUT_MT_DROP_UNUSED)
+	if (mt->flags & INPUT_MT_DROP_UNUSED) {
+		unsigned long flags;
+
+		spin_lock_irqsave(&dev->event_lock, flags);
 		__input_mt_drop_unused(dev, mt);
+		spin_unlock_irqrestore(&dev->event_lock, flags);
+	}
 
 	if ((mt->flags & INPUT_MT_POINTER) && !(mt->flags & INPUT_MT_SEMI_MT))
 		use_count = true;
diff --git a/drivers/input/input.c b/drivers/input/input.c
index 5e75b175b5949..ed415651f49e5 100644
--- a/drivers/input/input.c
+++ b/drivers/input/input.c
@@ -24,8 +24,10 @@
 #include <linux/mutex.h>
 #include <linux/rcupdate.h>
 #include "input-compat.h"
+#include "input-core-private.h"
 #include "input-poller.h"
 
+
 MODULE_AUTHOR("Vojtech Pavlik <vojtech@suse.cz>");
 MODULE_DESCRIPTION("Input core");
 MODULE_LICENSE("GPL");
@@ -142,6 +144,8 @@ static void input_pass_values(struct input_dev *dev,
 	struct input_handle *handle;
 	struct input_value *v;
 
+	lockdep_assert_held(&dev->event_lock);
+
 	if (!count)
 		return;
 
@@ -384,8 +388,8 @@ static void input_event_dispose(struct input_dev *dev, int disposition,
 	}
 }
 
-static void input_handle_event(struct input_dev *dev,
-			       unsigned int type, unsigned int code, int value)
+void input_handle_event(struct input_dev *dev,
+			unsigned int type, unsigned int code, int value)
 {
 	int disposition;
 
@@ -722,20 +726,21 @@ EXPORT_SYMBOL(input_close_device);
  * Simulate keyup events for all keys that are marked as pressed.
  * The function must be called with dev->event_lock held.
  */
-static void input_dev_release_keys(struct input_dev *dev)
+static bool input_dev_release_keys(struct input_dev *dev)
 {
 	bool need_sync = false;
 	int code;
 
+	lockdep_assert_held(&dev->event_lock);
+
 	if (is_event_supported(EV_KEY, dev->evbit, EV_MAX)) {
 		for_each_set_bit(code, dev->key, KEY_CNT) {
 			input_handle_event(dev, EV_KEY, code, 0);
 			need_sync = true;
 		}
-
-		if (need_sync)
-			input_handle_event(dev, EV_SYN, SYN_REPORT, 1);
 	}
+
+	return need_sync;
 }
 
 /*
@@ -762,7 +767,8 @@ static void input_disconnect_device(struct input_dev *dev)
 	 * generate events even after we done here but they will not
 	 * reach any handlers.
 	 */
-	input_dev_release_keys(dev);
+	if (input_dev_release_keys(dev))
+		input_handle_event(dev, EV_SYN, SYN_REPORT, 1);
 
 	list_for_each_entry(handle, &dev->h_list, d_node)
 		handle->open = 0;
@@ -1757,7 +1763,8 @@ void input_reset_device(struct input_dev *dev)
 	spin_lock_irqsave(&dev->event_lock, flags);
 
 	input_dev_toggle(dev, true);
-	input_dev_release_keys(dev);
+	if (input_dev_release_keys(dev))
+		input_handle_event(dev, EV_SYN, SYN_REPORT, 1);
 
 	spin_unlock_irqrestore(&dev->event_lock, flags);
 	mutex_unlock(&dev->mutex);
@@ -1779,7 +1786,9 @@ static int input_inhibit_device(struct input_dev *dev)
 	}
 
 	spin_lock_irq(&dev->event_lock);
+	input_mt_release_slots(dev);
 	input_dev_release_keys(dev);
+	input_handle_event(dev, EV_SYN, SYN_REPORT, 1);
 	input_dev_toggle(dev, false);
 	spin_unlock_irq(&dev->event_lock);
 
@@ -1830,7 +1839,8 @@ static int input_dev_suspend(struct device *dev)
 	 * Keys that are pressed now are unlikely to be
 	 * still pressed when we resume.
 	 */
-	input_dev_release_keys(input_dev);
+	if (input_dev_release_keys(input_dev))
+		input_handle_event(input_dev, EV_SYN, SYN_REPORT, 1);
 
 	/* Turn off LEDs and sounds, if any are active. */
 	input_dev_toggle(input_dev, false);
@@ -1864,7 +1874,8 @@ static int input_dev_freeze(struct device *dev)
 	 * Keys that are pressed now are unlikely to be
 	 * still pressed when we resume.
 	 */
-	input_dev_release_keys(input_dev);
+	if (input_dev_release_keys(input_dev))
+		input_handle_event(input_dev, EV_SYN, SYN_REPORT, 1);
 
 	spin_unlock_irq(&input_dev->event_lock);
 
diff --git a/include/linux/input/mt.h b/include/linux/input/mt.h
index 3b8580bd33c14..af7e64a76e12c 100644
--- a/include/linux/input/mt.h
+++ b/include/linux/input/mt.h
@@ -108,6 +108,7 @@ static inline void input_mt_report_slot_inactive(struct input_dev *dev)
 void input_mt_report_finger_count(struct input_dev *dev, int count);
 void input_mt_report_pointer_emulation(struct input_dev *dev, bool use_count);
 void input_mt_drop_unused(struct input_dev *dev);
+void input_mt_release_slots(struct input_dev *dev);
 
 void input_mt_sync_frame(struct input_dev *dev);
 
-- 
2.37.0.170.g444d1eabd0-goog

