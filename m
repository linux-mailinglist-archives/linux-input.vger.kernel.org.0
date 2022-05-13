Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DF0B4525F39
	for <lists+linux-input@lfdr.de>; Fri, 13 May 2022 12:08:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241657AbiEMJkG (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 13 May 2022 05:40:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353324AbiEMJjy (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 13 May 2022 05:39:54 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D73912A76A1
        for <linux-input@vger.kernel.org>; Fri, 13 May 2022 02:39:52 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id w4so10611534wrg.12
        for <linux-input@vger.kernel.org>; Fri, 13 May 2022 02:39:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JMet90BJ0GvhDF9Jhlj70gOV/8yFnhrxXYWAcJMC/0Q=;
        b=CtNyAGEHfHRORlzMyY2rlFeHwD8EBC0hNNP2aosjpwM5zxuI/GeGbHotlnDzrw4K79
         b3HEZZAXhtvz6NvLNZqXaEqsxLHJ8SO2++99UMt/uSuOxVSI20/6hHpV3C46+0a8djWD
         eiM9vOUjPOKUhp9ZCWV3l+FgJf7oZ6A91lTF/XRB7zJoLi9zwd85XgDoHpro/WLDonwb
         cqz8Q4Pl4rxVWU5Xy0uFjKT/5mHf+nhv+jrzGLBM7hqL41SKPn4hYgi000klOgu7k/wA
         aQYLg5960QiTIDoG+mngG3bnngw+VfUj5pln0ahtjBRZrBXYY9YqC0CZ3N02+y+MhuDV
         6glg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JMet90BJ0GvhDF9Jhlj70gOV/8yFnhrxXYWAcJMC/0Q=;
        b=Ykka/Os+2J5zD9qZc/fTVUeTh7250hcMwek6RwMjfmhqcfRYGkIp6MW2q9lTNUulrs
         n8g54psL+hp7ofnOu1UEWwzcP58RWVqZ+tIPC+UNIbXzJllxaBSdeXVmZf6I73Fi6mUW
         brsZYgxvrHHwDoTgAbXEhfckg/wg1dNNbOrOGQgQljiwBQmUjIKB2+vxPRVtPhRG+qUR
         5BRTwYJtNKl3rnHygxQzIFKjimPkj728x6mWSOhSfeoDTVg8VpuJzHbHfnHxbZlfzfBU
         LkW6DrJWbOxua3I/y80F/MFLZjRO42l6XqK1fceW3exeHK3iJBlHJcxsQPPIOL+hSQr0
         zfVA==
X-Gm-Message-State: AOAM531kQQdjn7nw/mGU7YJ1mDpiF6rF5KTwsjrV4RE5myP/1sHHFOsR
        6fowV8n8TV37a/RqBtUbaPuqyK8LHFJiLzOPCUE=
X-Google-Smtp-Source: ABdhPJwdd7NYrXdXum7EfmD2TiuBjeAHTek/u+/kQouMMQ/9f5Ypl6+DL4k1a8w/L0YzmkzRxJd0wg==
X-Received: by 2002:a5d:64e7:0:b0:20c:5b42:a93c with SMTP id g7-20020a5d64e7000000b0020c5b42a93cmr3210308wri.619.1652434792454;
        Fri, 13 May 2022 02:39:52 -0700 (PDT)
Received: from aczubak.c.googlers.com.com (88.140.78.34.bc.googleusercontent.com. [34.78.140.88])
        by smtp.gmail.com with ESMTPSA id l5-20020adfa385000000b0020ce015ed48sm1631404wrb.103.2022.05.13.02.39.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 May 2022 02:39:52 -0700 (PDT)
From:   Angela Czubak <acz@semihalf.com>
To:     linux-input@vger.kernel.org
Cc:     upstream@semihalf.com, benjamin.tissoires@redhat.com,
        jikos@kernel.org, dmitry.torokhov@gmail.com,
        Angela Czubak <acz@semihalf.com>
Subject: [PATCH v3 14/17] HID: haptic: add hid_haptic_change_control
Date:   Fri, 13 May 2022 09:39:24 +0000
Message-Id: <20220513093927.1632262-15-acz@semihalf.com>
X-Mailer: git-send-email 2.36.0.550.gb090851708-goog
In-Reply-To: <20220513093927.1632262-1-acz@semihalf.com>
References: <20220513093927.1632262-1-acz@semihalf.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
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
index 3d26bd5d15a4..4b3ad5168fbb 100644
--- a/drivers/hid/hid-haptic.c
+++ b/drivers/hid/hid-haptic.c
@@ -6,6 +6,7 @@
  */
 
 #include <linux/input/mt.h>
+#include <linux/mm.h>
 #include <linux/module.h>
 
 #include "hid-haptic.h"
@@ -342,6 +343,46 @@ static int hid_haptic_playback(struct input_dev *dev, int effect_id, int value)
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
@@ -529,6 +570,8 @@ int hid_haptic_init(struct hid_device *hdev,
 		}
 		haptic->effect[r].input_dev = dev;
 		INIT_WORK(&haptic->effect[r].work, haptic_work_handler);
+		INIT_LIST_HEAD(&haptic->effect[r].control);
+		mutex_init(&haptic->effect[r].control_mutex);
 	}
 	haptic->stop_effect.report_buf =
 		hid_alloc_report_buf(haptic->manual_trigger_report,
@@ -558,6 +601,7 @@ int hid_haptic_init(struct hid_device *hdev,
 	ff->private = haptic;
 	ff->upload = hid_haptic_upload_effect;
 	ff->playback = hid_haptic_playback;
+	ff->change_control = hid_haptic_change_control;
 	ff->erase = hid_haptic_erase;
 	ff->destroy = hid_haptic_destroy;
 	if (!try_module_get(THIS_MODULE)) {
@@ -660,13 +704,15 @@ void hid_haptic_handle_press_release(struct hid_haptic_device *haptic)
 	else if (haptic->pressure < haptic->release_threshold)
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
2.36.0.550.gb090851708-goog

