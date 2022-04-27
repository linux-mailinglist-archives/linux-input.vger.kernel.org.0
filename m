Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4A495512578
	for <lists+linux-input@lfdr.de>; Thu, 28 Apr 2022 00:46:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233681AbiD0WtX (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 27 Apr 2022 18:49:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235141AbiD0WtW (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 27 Apr 2022 18:49:22 -0400
Received: from endrift.com (endrift.com [173.255.198.10])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 485F72DA97
        for <linux-input@vger.kernel.org>; Wed, 27 Apr 2022 15:46:10 -0700 (PDT)
Received: from localhost.localdomain (unknown [50.106.20.54])
        by endrift.com (Postfix) with ESMTPSA id 138E8A2F1;
        Wed, 27 Apr 2022 15:46:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=endrift.com; s=2020;
        t=1651099569; bh=3gQAL/xpHu6O84vTuq3cvacPA1PAzFm+VRTfvF7e68g=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=D0+wNSYbFUhgeiK1jBxclK47ZQvYaiiCB2prhaDm/Fhz09nvX9WNp7a9xkAE3bM5p
         HKd2Ss+WNzR8FgnX1TfMDmI3OwyhXH0dKeqoqzV+a3ohaZJGNZsAeDIUmC0aASdhT4
         O6cfk9kSKJN7MbDr/4ZsGmWiRRDIZiW1Sksbc3C5clAexzBIw5hTwWhijja/z3r9WQ
         EvI3RpVjNWVqgqx44pokm5Y4QrmWSrE/CzFrFGr+RGRL7TQlGyUx9SkIEVJV+df4dR
         G6w1x0k2eU7oCuSXKdcTVNmphNc3W950nJlVMbfP1zFy5gWV/KQc/FXhER8yMMjvBO
         72umJzGExtujQ==
From:   Vicki Pfau <vi@endrift.com>
To:     linux-input@vger.kernel.org
Cc:     Roderick Colenbrander <roderick.colenbrander@sony.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Vicki Pfau <vi@endrift.com>
Subject: [PATCH 5/6] HID: hid-sony: Add touchpad_mouse param
Date:   Wed, 27 Apr 2022 15:45:25 -0700
Message-Id: <20220427224526.35657-5-vi@endrift.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220427224526.35657-1-vi@endrift.com>
References: <20220427224526.35657-1-vi@endrift.com>
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

Add parameter "touchpad_mouse" to enable disabling or re-enabling exposing the
touchpad input_dev, which can be changed while the module is loaded.

Signed-off-by: Vicki Pfau <vi@endrift.com>
---
 drivers/hid/hid-sony.c | 49 +++++++++++++++++++++++++++++++++++-------
 1 file changed, 41 insertions(+), 8 deletions(-)

diff --git a/drivers/hid/hid-sony.c b/drivers/hid/hid-sony.c
index 1c347b3ca992..c4ccad95ee9a 100644
--- a/drivers/hid/hid-sony.c
+++ b/drivers/hid/hid-sony.c
@@ -98,6 +98,8 @@ static const char ghl_ps3wiiu_magic_data[] = {
 	0x02, 0x08, 0x20, 0x00, 0x00, 0x00, 0x00, 0x00
 };
 
+static bool touchpad_mouse = true;
+
 /* PS/3 Motion controller */
 static u8 motion_rdesc[] = {
 	0x05, 0x01,         /*  Usage Page (Desktop),               */
@@ -525,7 +527,7 @@ struct motion_output_report_02 {
 #define SIXAXIS_INPUT_REPORT_ACC_X_OFFSET 41
 #define SIXAXIS_ACC_RES_PER_G 113
 
-static DEFINE_SPINLOCK(sony_dev_list_lock);
+static DEFINE_MUTEX(sony_dev_list_lock);
 static LIST_HEAD(sony_device_list);
 static DEFINE_IDA(sony_device_id_allocator);
 
@@ -1670,6 +1672,9 @@ static int sony_register_ds4_touchpad(struct sony_sc *sc)
 	struct input_dev *touchpad;
 	int ret;
 
+	if (!touchpad_mouse)
+		return 0;
+
 	rcu_read_lock();
 	touchpad = rcu_dereference(sc->touchpad);
 	rcu_read_unlock();
@@ -2599,10 +2604,9 @@ static inline int sony_compare_connection_type(struct sony_sc *sc0,
 static int sony_check_add_dev_list(struct sony_sc *sc)
 {
 	struct sony_sc *entry;
-	unsigned long flags;
 	int ret;
 
-	spin_lock_irqsave(&sony_dev_list_lock, flags);
+	mutex_lock(&sony_dev_list_lock);
 
 	list_for_each_entry(entry, &sony_device_list, list_node) {
 		ret = memcmp(sc->mac_address, entry->mac_address,
@@ -2624,18 +2628,16 @@ static int sony_check_add_dev_list(struct sony_sc *sc)
 	list_add(&(sc->list_node), &sony_device_list);
 
 unlock:
-	spin_unlock_irqrestore(&sony_dev_list_lock, flags);
+	mutex_unlock(&sony_dev_list_lock);
 	return ret;
 }
 
 static void sony_remove_dev_list(struct sony_sc *sc)
 {
-	unsigned long flags;
-
 	if (sc->list_node.next) {
-		spin_lock_irqsave(&sony_dev_list_lock, flags);
+		mutex_lock(&sony_dev_list_lock);
 		list_del(&(sc->list_node));
-		spin_unlock_irqrestore(&sony_dev_list_lock, flags);
+		mutex_unlock(&sony_dev_list_lock);
 	}
 }
 
@@ -3171,6 +3173,37 @@ static int sony_resume(struct hid_device *hdev)
 
 #endif
 
+static int sony_param_set_touchpad_mouse(const char *val,
+					const struct kernel_param *kp)
+{
+	struct sony_sc *sc;
+	int ret;
+
+	ret = param_set_bool(val, kp);
+	if (ret)
+		return ret;
+
+	mutex_lock(&sony_dev_list_lock);
+	list_for_each_entry(sc, &sony_device_list, list_node) {
+		mutex_lock(&sc->mutex);
+		if (touchpad_mouse)
+			sony_register_ds4_touchpad(sc);
+		else
+			sony_unregister_touchpad(sc);
+		mutex_unlock(&sc->mutex);
+	}
+	mutex_unlock(&sony_dev_list_lock);
+	return 0;
+}
+
+static const struct kernel_param_ops sony_touchpad_mouse_ops = {
+	.set	= sony_param_set_touchpad_mouse,
+	.get	= param_get_bool,
+};
+
+module_param_cb(touchpad_mouse, &sony_touchpad_mouse_ops, &touchpad_mouse, 0644);
+MODULE_PARM_DESC(touchpad_mouse, "Enable mouse emulation using the touchpad");
+
 static const struct hid_device_id sony_devices[] = {
 	{ HID_USB_DEVICE(USB_VENDOR_ID_SONY, USB_DEVICE_ID_SONY_PS3_CONTROLLER),
 		.driver_data = SIXAXIS_CONTROLLER_USB },
-- 
2.36.0

