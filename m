Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 14E3F48EFF9
	for <lists+linux-input@lfdr.de>; Fri, 14 Jan 2022 19:32:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243050AbiANScq (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 14 Jan 2022 13:32:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243088AbiANSci (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 14 Jan 2022 13:32:38 -0500
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5279CC06173E
        for <linux-input@vger.kernel.org>; Fri, 14 Jan 2022 10:32:38 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id v123so7670121wme.2
        for <linux-input@vger.kernel.org>; Fri, 14 Jan 2022 10:32:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9VwfXgg7eLphDCQdohq0yPt7WdrkP6UeE6DuepexdMI=;
        b=EpsmghBASmSA+4g472Dn0yVR4I4XgNi26rX/vNP8n2bY/Y9e0jSZnRtWnRu7u9l3Uk
         EeQQ+43ibRel2q10vbw8KdRkAPc4uxBM/APYNC/tOdTvG1gPvCqudjMAqtizLLVI8kCW
         M8uu6JAC//6jcemIDX7w9Pz50g9a0CR6/53f/97Me0QAOOGdD4OBjthZy78p6snZs1uq
         LCckxnDDIRgk5jbb4+Xt0fg9rkhbHRE+CP74irY0E2U15dmga70HJoL8FCLZI02L+Eq8
         hsJ4vCOV76Xw6GD6a4yTmd6g/NQNG9GV61pVBgIPlTkRK8h3lpL1cr6QNB7Rhd33JLpQ
         g0SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9VwfXgg7eLphDCQdohq0yPt7WdrkP6UeE6DuepexdMI=;
        b=lFuaPHAULZubKYYV1+OaP8tBNwx1b8uzzbSW3XEEfeUuLEqsiEzYBB7a+d97NM0X1C
         VHdOWjIgl8M+/d7px2CzDUViZNjsdJPVf2rmUVZaULclUYNDoO66zDCY/M1zZwLeh/aC
         38nwGzAllU0pNKutqa2pgiB5+e6uHEco0mgH7QP5xaXq7dtvvPGPbUC5QYqRTKj1cH8b
         EepzG6PhmomzAvFIUe6PDsQYdGl4WUZjUop43bpWgbkZfp062AOCIpgVLLPIFUeAFId+
         WsPqdUO7f1c7ZtT5TdIobz8tNPN72MBDYen4AiJKsB6SJ/4RvyHvX3P4J0zsVTBxCxS3
         LFpQ==
X-Gm-Message-State: AOAM532J4XTyUZT8SAic8zyB6MY/Q0ARCXOvYVrMfLYJO5EHAmOEatX+
        18LaOg2EzdSm6pXNb0V4UEoVZUSJZoFDtqP1yFQ=
X-Google-Smtp-Source: ABdhPJyoYuElB9cp9svuaSkC6agItX7Vh885eixvtHTL6hr2+hvG44A0Ayt7bpptO6mV2p5k+X5pZw==
X-Received: by 2002:a5d:4c81:: with SMTP id z1mr9595982wrs.204.1642185156929;
        Fri, 14 Jan 2022 10:32:36 -0800 (PST)
Received: from aczubak.c.googlers.com.com (109.36.187.35.bc.googleusercontent.com. [35.187.36.109])
        by smtp.gmail.com with ESMTPSA id az4sm6410984wrb.14.2022.01.14.10.32.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jan 2022 10:32:36 -0800 (PST)
From:   Angela Czubak <acz@semihalf.com>
To:     linux-input@vger.kernel.org
Cc:     upstream@semihalf.com, dmitry.torokhov@gmail.com,
        benjamin.tissoires@redhat.com, jikos@kernel.org,
        Angela Czubak <acz@semihalf.com>
Subject: [PATCH v2 15/16] HID: haptic: add hid_haptic_change_control
Date:   Fri, 14 Jan 2022 18:31:51 +0000
Message-Id: <20220114183152.1691659-16-acz@semihalf.com>
X-Mailer: git-send-email 2.34.1.703.g22d0c6ccf7-goog
In-Reply-To: <20220114183152.1691659-1-acz@semihalf.com>
References: <20220114183152.1691659-1-acz@semihalf.com>
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
index 2035b8a6037f..adc11bd1d84b 100644
--- a/drivers/hid/hid-haptic.c
+++ b/drivers/hid/hid-haptic.c
@@ -6,6 +6,7 @@
  */
 
 #include <linux/input/mt.h>
+#include <linux/mm.h>
 #include <linux/module.h>
 
 #include "hid-haptic.h"
@@ -343,6 +344,46 @@ static int hid_haptic_playback(struct input_dev *dev, int effect_id, int value)
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
@@ -527,6 +568,8 @@ int hid_haptic_init(struct hid_device *hdev,
 		}
 		haptic->effect[r].input_dev = dev;
 		INIT_WORK(&haptic->effect[r].work, haptic_work_handler);
+		INIT_LIST_HEAD(&haptic->effect[r].control);
+		mutex_init(&haptic->effect[r].control_mutex);
 	}
 	haptic->stop_effect.report_buf =
 		hid_alloc_report_buf(haptic->manual_trigger_report,
@@ -563,6 +606,7 @@ int hid_haptic_init(struct hid_device *hdev,
 	ff->private = haptic;
 	ff->upload = hid_haptic_upload_effect;
 	ff->playback = hid_haptic_playback;
+	ff->change_control = hid_haptic_change_control;
 	ff->erase = hid_haptic_erase;
 	ff->destroy = hid_haptic_destroy;
 	if (!try_module_get(THIS_MODULE)) {
@@ -652,13 +696,15 @@ void hid_haptic_handle_press_release(struct hid_haptic_device *haptic)
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
2.34.1.703.g22d0c6ccf7-goog

