Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DEFA747C763
	for <lists+linux-input@lfdr.de>; Tue, 21 Dec 2021 20:17:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241757AbhLUTR6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 21 Dec 2021 14:17:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241746AbhLUTR5 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 21 Dec 2021 14:17:57 -0500
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38C2CC061574
        for <linux-input@vger.kernel.org>; Tue, 21 Dec 2021 11:17:57 -0800 (PST)
Received: by mail-wr1-x431.google.com with SMTP id v7so21606115wrv.12
        for <linux-input@vger.kernel.org>; Tue, 21 Dec 2021 11:17:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XIB6WkBGCFXoVB/X4Gv7+7UWEjHlCE4f1AmUGXlmJB0=;
        b=z8JNlRJ9fo9Xfl7vPCjV+7L81fc6u0WudBXuaEu7qlK6B9QLf1FHpPej+OYqLiR8s2
         I8nEK5tWGDe/du7S9lAfVm1feCZHdFjw+VdmAa9JsYFeJaEWAaDPUwcpFUndAy9SSWCF
         td1tT0HUaSSs3VqFNLy8zmrx8lYSC0+MaprH0IrtntRJf1vFIZsKnXKaTXa/zuVdSvfZ
         rMEq59eX9OLF6UEbBvswHkVySB93rJ9tSyBJmLMAcHbQtfgU43lMXEUPyVEjzYm52Lox
         KzD77/+i790otHHaXyvjE93B1laVM5ULb12UBVRm+s7/1Wqp0+sun0m4cPgHlavw1OiD
         6Ggg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XIB6WkBGCFXoVB/X4Gv7+7UWEjHlCE4f1AmUGXlmJB0=;
        b=gVbO/dZHLUQme23DK3Vi35naMJw1Z/Esbsh9o9hhMvGzV1JKTXtcMxOxlSPOeS1OtD
         nhDCy4cjGTeFwqLQVmec5eQW/XCRY8CFkWBJnI79jq5GYo7s8OXr3Ws1iLC7fY5Ew3Yv
         pLtxO0rCn803wSSAc7BoKCGyWwQhZn1QjcwhytYa5jd97ypM5VrE+t2iyOGWXQlZHSHB
         P6IIhUFs4yMDUnxAolrBHXTgo8kYG3EqdYA3V7plM5eBAXCdNESHmsEmEzEuCWie+F4i
         St/6xcSXJuOrR1OW6Bsaan4gDdpZ6v/FU3NuAu7ZgQ5lVuSu7Mv2E/YEYLgu4/n1ghx1
         VHRg==
X-Gm-Message-State: AOAM530JKzusqE+eqd6mxcDX+QbBPqVpoosVJy3HNpIBZ1990eEIvpPI
        LpHXeeuULWrtq7Aw4czsT4Ng4+RZJbPEsWt4iXI=
X-Google-Smtp-Source: ABdhPJyvxS74R9I0Yc63MyVchppIJXeA7Zc6C7BjSppmPeAXuK95b+JJZsAMYJFdCMSadbroWFSEEw==
X-Received: by 2002:a05:6000:18a2:: with SMTP id b2mr3837320wri.277.1640114275833;
        Tue, 21 Dec 2021 11:17:55 -0800 (PST)
Received: from aczubak.c.googlers.com.com (109.36.187.35.bc.googleusercontent.com. [35.187.36.109])
        by smtp.gmail.com with ESMTPSA id t8sm3994846wmq.32.2021.12.21.11.17.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Dec 2021 11:17:55 -0800 (PST)
From:   Angela Czubak <acz@semihalf.com>
To:     linux-input@vger.kernel.org
Cc:     upstream@semihalf.com, dmitry.torokhov@gmail.com,
        Angela Czubak <acz@semihalf.com>
Subject: [PATCH 17/18] HID: haptic: add hid_haptic_change_control
Date:   Tue, 21 Dec 2021 19:17:42 +0000
Message-Id: <20211221191743.1893185-18-acz@semihalf.com>
X-Mailer: git-send-email 2.34.1.307.g9b7440fafd-goog
In-Reply-To: <20211221191743.1893185-1-acz@semihalf.com>
References: <20211221191743.1893185-1-acz@semihalf.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Implement change_control callbacks for simple haptic device.
If anybody has requested control over an effect, do not generate it
in kernel.

Signed-off-by: Angela Czubak <acz@semihalf.com>
---
 drivers/hid/hid-haptic.c | 50 ++++++++++++++++++++++++++++++++++++++--
 1 file changed, 48 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/hid-haptic.c b/drivers/hid/hid-haptic.c
index e7fd53d1a7c1..366b7f8a2c19 100644
--- a/drivers/hid/hid-haptic.c
+++ b/drivers/hid/hid-haptic.c
@@ -9,6 +9,7 @@
  */
 
 #include <linux/input/mt.h>
+#include <linux/mm.h>
 #include <linux/module.h>
 
 #include "hid-haptic.h"
@@ -348,6 +349,46 @@ static int hid_haptic_playback(struct input_dev *dev, int effect_id, int value)
 	return 0;
 }
 
+static int hid_haptic_change_control(struct input_dev *dev, int effect_id,
+				     struct file *file, int take)
+{
+	struct hid_haptic_device *haptic = dev->ff->private;
+	struct hid_haptic_effect_node *effect_node;
+	struct hid_haptic_effect *effect;
+	bool found = false;
+	int ret = 0;
+
+	effect = &haptic->effect[effect_id];
+	mutex_lock(&effect->control_mutex);
+	list_for_each_entry(effect_node, &effect->control, node) {
+		if (effect_node->file == file) {
+			found = true;
+			break;
+		}
+	}
+	if (take) {
+		if (!found) {
+			effect_node = kvzalloc(sizeof(struct hid_haptic_effect),
+					       GFP_KERNEL);
+			if (!effect_node) {
+				ret = -ENOMEM;
+				goto exit;
+			}
+			effect_node->file = file;
+		}
+		list_add(&effect_node->node, &effect->control);
+	} else {
+		if (found) {
+			list_del(&effect_node->node);
+			kvfree(effect_node);
+		}
+	}
+exit:
+	mutex_unlock(&effect->control_mutex);
+
+	return ret;
+}
+
 static void effect_set_default(struct ff_effect *effect)
 {
 	effect->type = FF_HID;
@@ -533,6 +574,8 @@ int hid_haptic_init(struct hid_device *hdev,
 		}
 		haptic->effect[r].input_dev = dev;
 		INIT_WORK(&haptic->effect[r].work, haptic_work_handler);
+		INIT_LIST_HEAD(&haptic->effect[r].control);
+		mutex_init(&haptic->effect[r].control_mutex);
 	}
 	haptic->stop_effect.report_buf =
 		hid_alloc_report_buf(haptic->manual_trigger_report,
@@ -569,6 +612,7 @@ int hid_haptic_init(struct hid_device *hdev,
 	ff->private = haptic;
 	ff->upload = hid_haptic_upload_effect;
 	ff->playback = hid_haptic_playback;
+	ff->change_control = hid_haptic_change_control;
 	ff->erase = hid_haptic_erase;
 	ff->destroy = hid_haptic_destroy;
 	if (!try_module_get(THIS_MODULE)) {
@@ -658,13 +702,15 @@ void hid_haptic_handle_press_release(struct hid_haptic_device *haptic)
 	else if (haptic->pressure_sum < haptic->release_threshold)
 		haptic->pressed_state = 0;
 	if (!prev_pressed_state && haptic->pressed_state &&
-	    haptic->mode == HID_HAPTIC_MODE_KERNEL) {
+	    haptic->mode == HID_HAPTIC_MODE_KERNEL &&
+	    list_empty(&haptic->effect[HID_HAPTIC_PRESS_EFFECT_ID].control)) {
 		spin_lock_irqsave(&input->event_lock, flags);
 		input->ff->playback(input, HID_HAPTIC_PRESS_EFFECT_ID, 1);
 		spin_unlock_irqrestore(&input->event_lock, flags);
 	}
 	if (prev_pressed_state && !haptic->pressed_state &&
-	    haptic->mode == HID_HAPTIC_MODE_KERNEL) {
+	    haptic->mode == HID_HAPTIC_MODE_KERNEL &&
+	    list_empty(&haptic->effect[HID_HAPTIC_RELEASE_EFFECT_ID].control)) {
 		spin_lock_irqsave(&input->event_lock, flags);
 		input->ff->playback(input, HID_HAPTIC_RELEASE_EFFECT_ID, 1);
 		spin_unlock_irqrestore(&input->event_lock, flags);
-- 
2.34.1.307.g9b7440fafd-goog

