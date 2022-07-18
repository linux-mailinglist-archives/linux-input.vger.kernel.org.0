Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2956557861A
	for <lists+linux-input@lfdr.de>; Mon, 18 Jul 2022 17:17:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235221AbiGRPRy (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 18 Jul 2022 11:17:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233406AbiGRPRx (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 18 Jul 2022 11:17:53 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8BC726AEA
        for <linux-input@vger.kernel.org>; Mon, 18 Jul 2022 08:17:52 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id p26-20020a1c545a000000b003a2fb7c1274so5457307wmi.1
        for <linux-input@vger.kernel.org>; Mon, 18 Jul 2022 08:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fQlo7UeDXI6o2W9nD/fT5IEKlIszvx9aJnZSW1oBAjU=;
        b=A5HOJWoWyF51BemeNU9mf0ylTDmpAQyd0h2enOdlnUhLB/IeGfgsaWu30q98bMdQNa
         acgsL1Yi48GuPp7asKPRCtC9+J+4PCo/NQVhzHPkddHEmke+26lG1FYcNO9yRJgMlHbH
         5Nq26zLhgYwpBKu1VQG3jYq3OFTiNnK6axyIaa2U3xbvvyqCPXqVct5eRK8DSEcOAW/w
         5NpvBtpy8LRVVYMvuNfjC8qvbLR+fnu8gyTqQK7g9JyvyRKrAYNlhfUiLYmGdxlDqPhM
         n/rv34bn6kCUQ6hXlVgcUmq7eeVNHQB3j2b5bq6GdTIs7lAYWke8DpcrUimHFwHnGvNs
         oN8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fQlo7UeDXI6o2W9nD/fT5IEKlIszvx9aJnZSW1oBAjU=;
        b=6jbkbkK9Uo0yCg3+Fxo5UTaYrI/8TklqnHC0+AtYUKFZe/YgEJVEo2wh5YVuIgF9+M
         nlPI2vMyQ3+zXh+qVWDFctm7YlEI54UwR/5btAOgk2UmLgT96thWwNOrlcmyuDfeIFTy
         QBNrhw8+4ty+vJNV0etIdMzjehR83ZRB0fA4elA9RXhk/C5wH1WESBpTwkh1K7MPteAF
         o/O3YsgVQaQ9BjyxmpV5u/3xTJpNGcL4+slgUcZCXdlcutB+YJQ8z9cgoKmz4Pp6mOiY
         L/tmc50UFzplZdKNdrkexYa6tZ2S6QIIb/UXnQZfjCtkQ2V/CULZYZpWlLJ9FF/2Rn11
         LAAQ==
X-Gm-Message-State: AJIora/Rr7T/fw1S+vCUBcBk2Qy4GeJPJYQG45IC7HFlqk4adhjGWWGZ
        J6vaKHAwnyHfjc0MmsklM+lLyiQH/0gt85JJ
X-Google-Smtp-Source: AGRyM1shxVDIzcWbJ1l+PIK+bQT19cbiXJcRoWCfs9mk1892wuiaO+B4qCZFQmrkdZWSEvEI/8BUpA==
X-Received: by 2002:a05:600c:3b24:b0:3a3:1fa6:77d with SMTP id m36-20020a05600c3b2400b003a31fa6077dmr2249863wms.3.1658157471382;
        Mon, 18 Jul 2022 08:17:51 -0700 (PDT)
Received: from aczubak.c.googlers.com.com (88.140.78.34.bc.googleusercontent.com. [34.78.140.88])
        by smtp.gmail.com with ESMTPSA id t4-20020a1c7704000000b003a308e9a192sm13346075wmi.30.2022.07.18.08.17.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jul 2022 08:17:50 -0700 (PDT)
From:   Angela Czubak <acz@semihalf.com>
To:     linux-input@vger.kernel.org, dmitry.torokhov@gmail.com
Cc:     upstream@semihalf.com, benjamin.tissoires@redhat.com,
        hdegoede@redhat.com, peter.hutterer@who-t.net,
        Angela Czubak <acz@semihalf.com>
Subject: [PATCH v2 1/2] Input: properly queue synthetic events
Date:   Mon, 18 Jul 2022 15:17:14 +0000
Message-Id: <20220718151715.1052842-2-acz@semihalf.com>
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

From: Dmitry Torokhov <dmitry.torokhov@gmail.com>

We should not be passing synthetic events (such as autorepeat events)
out of order with the events coming from the hardware device, but rather
add them to pending events and flush them all at once.

This also fixes an issue with timestamps for key release events carrying
stale data from the previous autorepeat event.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Reviewed-by: Angela Czubak <acz@semihalf.com>
---
 drivers/input/input.c | 125 +++++++++++++++++++++---------------------
 1 file changed, 63 insertions(+), 62 deletions(-)

diff --git a/drivers/input/input.c b/drivers/input/input.c
index 1365c9dfb5f29..5e75b175b5949 100644
--- a/drivers/input/input.c
+++ b/drivers/input/input.c
@@ -174,44 +174,6 @@ static void input_pass_values(struct input_dev *dev,
 	}
 }
 
-static void input_pass_event(struct input_dev *dev,
-			     unsigned int type, unsigned int code, int value)
-{
-	struct input_value vals[] = { { type, code, value } };
-
-	input_pass_values(dev, vals, ARRAY_SIZE(vals));
-}
-
-/*
- * Generate software autorepeat event. Note that we take
- * dev->event_lock here to avoid racing with input_event
- * which may cause keys get "stuck".
- */
-static void input_repeat_key(struct timer_list *t)
-{
-	struct input_dev *dev = from_timer(dev, t, timer);
-	unsigned long flags;
-
-	spin_lock_irqsave(&dev->event_lock, flags);
-
-	if (test_bit(dev->repeat_key, dev->key) &&
-	    is_event_supported(dev->repeat_key, dev->keybit, KEY_MAX)) {
-		struct input_value vals[] =  {
-			{ EV_KEY, dev->repeat_key, 2 },
-			input_value_sync
-		};
-
-		input_set_timestamp(dev, ktime_get());
-		input_pass_values(dev, vals, ARRAY_SIZE(vals));
-
-		if (dev->rep[REP_PERIOD])
-			mod_timer(&dev->timer, jiffies +
-					msecs_to_jiffies(dev->rep[REP_PERIOD]));
-	}
-
-	spin_unlock_irqrestore(&dev->event_lock, flags);
-}
-
 #define INPUT_IGNORE_EVENT	0
 #define INPUT_PASS_TO_HANDLERS	1
 #define INPUT_PASS_TO_DEVICE	2
@@ -275,6 +237,10 @@ static int input_get_disposition(struct input_dev *dev,
 	int disposition = INPUT_IGNORE_EVENT;
 	int value = *pval;
 
+	/* filter-out events from inhibited devices */
+	if (dev->inhibited)
+		return INPUT_IGNORE_EVENT;
+
 	switch (type) {
 
 	case EV_SYN:
@@ -375,19 +341,9 @@ static int input_get_disposition(struct input_dev *dev,
 	return disposition;
 }
 
-static void input_handle_event(struct input_dev *dev,
-			       unsigned int type, unsigned int code, int value)
+static void input_event_dispose(struct input_dev *dev, int disposition,
+				unsigned int type, unsigned int code, int value)
 {
-	int disposition;
-
-	/* filter-out events from inhibited devices */
-	if (dev->inhibited)
-		return;
-
-	disposition = input_get_disposition(dev, type, code, &value);
-	if (disposition != INPUT_IGNORE_EVENT && type != EV_SYN)
-		add_input_randomness(type, code, value);
-
 	if ((disposition & INPUT_PASS_TO_DEVICE) && dev->event)
 		dev->event(dev, type, code, value);
 
@@ -426,7 +382,22 @@ static void input_handle_event(struct input_dev *dev,
 		input_pass_values(dev, dev->vals, dev->num_vals);
 		dev->num_vals = 0;
 	}
+}
+
+static void input_handle_event(struct input_dev *dev,
+			       unsigned int type, unsigned int code, int value)
+{
+	int disposition;
+
+	lockdep_assert_held(&dev->event_lock);
+
+	disposition = input_get_disposition(dev, type, code, &value);
+	if (disposition != INPUT_IGNORE_EVENT) {
+		if (type != EV_SYN)
+			add_input_randomness(type, code, value);
 
+		input_event_dispose(dev, disposition, type, code, value);
+	}
 }
 
 /**
@@ -613,7 +584,7 @@ static void __input_release_device(struct input_handle *handle)
 					    lockdep_is_held(&dev->mutex));
 	if (grabber == handle) {
 		rcu_assign_pointer(dev->grab, NULL);
-		/* Make sure input_pass_event() notices that grab is gone */
+		/* Make sure input_pass_values() notices that grab is gone */
 		synchronize_rcu();
 
 		list_for_each_entry(handle, &dev->h_list, d_node)
@@ -736,7 +707,7 @@ void input_close_device(struct input_handle *handle)
 
 	if (!--handle->open) {
 		/*
-		 * synchronize_rcu() makes sure that input_pass_event()
+		 * synchronize_rcu() makes sure that input_pass_values()
 		 * completed and that no more input events are delivered
 		 * through this handle
 		 */
@@ -758,14 +729,12 @@ static void input_dev_release_keys(struct input_dev *dev)
 
 	if (is_event_supported(EV_KEY, dev->evbit, EV_MAX)) {
 		for_each_set_bit(code, dev->key, KEY_CNT) {
-			input_pass_event(dev, EV_KEY, code, 0);
+			input_handle_event(dev, EV_KEY, code, 0);
 			need_sync = true;
 		}
 
 		if (need_sync)
-			input_pass_event(dev, EV_SYN, SYN_REPORT, 1);
-
-		memset(dev->key, 0, sizeof(dev->key));
+			input_handle_event(dev, EV_SYN, SYN_REPORT, 1);
 	}
 }
 
@@ -1004,12 +973,16 @@ int input_set_keycode(struct input_dev *dev,
 	} else if (test_bit(EV_KEY, dev->evbit) &&
 		   !is_event_supported(old_keycode, dev->keybit, KEY_MAX) &&
 		   __test_and_clear_bit(old_keycode, dev->key)) {
-		struct input_value vals[] =  {
-			{ EV_KEY, old_keycode, 0 },
-			input_value_sync
-		};
-
-		input_pass_values(dev, vals, ARRAY_SIZE(vals));
+		/*
+		 * We have to use input_event_dispose() here directly instead
+		 * of input_handle_event() because the key we want to release
+		 * here is considered no longer supported by the device and
+		 * input_handle_event() will ignore it.
+		 */
+		input_event_dispose(dev, INPUT_PASS_TO_HANDLERS,
+				    EV_KEY, old_keycode, 0);
+		input_event_dispose(dev, INPUT_PASS_TO_HANDLERS | INPUT_FLUSH,
+				    EV_SYN, SYN_REPORT, 1);
 	}
 
  out:
@@ -2259,6 +2232,34 @@ static void devm_input_device_unregister(struct device *dev, void *res)
 	__input_unregister_device(input);
 }
 
+/*
+ * Generate software autorepeat event. Note that we take
+ * dev->event_lock here to avoid racing with input_event
+ * which may cause keys get "stuck".
+ */
+static void input_repeat_key(struct timer_list *t)
+{
+	struct input_dev *dev = from_timer(dev, t, timer);
+	unsigned long flags;
+
+	spin_lock_irqsave(&dev->event_lock, flags);
+
+	if (!dev->inhibited &&
+	    test_bit(dev->repeat_key, dev->key) &&
+	    is_event_supported(dev->repeat_key, dev->keybit, KEY_MAX)) {
+
+		input_set_timestamp(dev, ktime_get());
+		input_handle_event(dev, EV_KEY, dev->repeat_key, 2);
+		input_handle_event(dev, EV_SYN, SYN_REPORT, 1);
+
+		if (dev->rep[REP_PERIOD])
+			mod_timer(&dev->timer, jiffies +
+					msecs_to_jiffies(dev->rep[REP_PERIOD]));
+	}
+
+	spin_unlock_irqrestore(&dev->event_lock, flags);
+}
+
 /**
  * input_enable_softrepeat - enable software autorepeat
  * @dev: input device
-- 
2.37.0.170.g444d1eabd0-goog

