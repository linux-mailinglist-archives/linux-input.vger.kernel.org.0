Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 701975F7D65
	for <lists+linux-input@lfdr.de>; Fri,  7 Oct 2022 20:30:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229637AbiJGSae (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 7 Oct 2022 14:30:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229853AbiJGSa0 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 7 Oct 2022 14:30:26 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4547A3F77
        for <linux-input@vger.kernel.org>; Fri,  7 Oct 2022 11:30:23 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id bi26-20020a05600c3d9a00b003c1e11f54d2so1823834wmb.2
        for <linux-input@vger.kernel.org>; Fri, 07 Oct 2022 11:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yN/8SV8HwDu2Kf1AyTyMFHAwI3gsRsKJUfLOfyh00Qw=;
        b=iEDP6eGaklG7u2cDM9KCLTqADgUCNBwuEVTjWtmdkcBwzqpbKuzCCkCN+UufWfB+Vy
         0oS72mlLqRT4Ovhib2pG1nhgSvSbHCchqXZKWoZSPwYjdPetaoI8SV6jLAPMhVMXQZAv
         QKCXp9GiZy/N8U46QTH46jIADprMG9JqSWkMd6lQtVJzA0REeiRj/0tJF6RMEhHkJfRo
         xCyLYeD66jwa9f19u3Z7rMPkXkyd5nW/xT+cPctElQg6S/uRbQQR/7U6E/TkRmxaHNM8
         v6NfWmUQJ+Xc+gY8x3MM9hSq8wkGeKIkyCotGjf4gt75Li5e8uONczPIbFW9YV3KQOWf
         aEew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yN/8SV8HwDu2Kf1AyTyMFHAwI3gsRsKJUfLOfyh00Qw=;
        b=DdsOIeF2ptgfBH+9Q8e2l7c7kfeKuOBcaEmjVbdUaCTaJvOddINzSZFoj6jnrFCspl
         94VMENTEbQJLBJOct3izcnv9/PAHRV063M2fcLSAJl5rC4VOOZtyFnjRV6hn0VdLVdQT
         R2vgZzXO/A9CvZ3/czZWTyeQuOelC4NqA6JNRNOJdY9pGHsho40iobsaIH5Fks/WyoDS
         OfrgNv1rdc5Ud23a/83kebCATzj47ymV6azyI776PmPJ9+t4+/oV5u3GurgspopT9ww9
         E1fx2fLh2XXDRpkQgdxKDqlZyj60qnfdmextghPQMtBRPjjlb8sB8DVpwtsCJLEYqjfX
         woVA==
X-Gm-Message-State: ACrzQf1HsZy6MmYgEHoiJdAS8RCKmWrx2VMnsdWR2RG8/52wER/+KArl
        mBGcRV3Cc8/tgvL8FAXFAOZct0Gquq4O4d6s
X-Google-Smtp-Source: AMsMyM5G+fpf3KQrhW4cx9M9EwjZdvjAcxbyXxkTnz/vhddqqn6A77OAJBfZqRmrCJGSuJCXxYqgDw==
X-Received: by 2002:a1c:7912:0:b0:3c0:a1a7:e622 with SMTP id l18-20020a1c7912000000b003c0a1a7e622mr8238601wme.138.1665167422185;
        Fri, 07 Oct 2022 11:30:22 -0700 (PDT)
Received: from aczubak.c.googlers.com.com (230.213.79.34.bc.googleusercontent.com. [34.79.213.230])
        by smtp.gmail.com with ESMTPSA id l10-20020a05600012ca00b002258235bda3sm2573627wrx.61.2022.10.07.11.30.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Oct 2022 11:30:21 -0700 (PDT)
From:   Angela Czubak <acz@semihalf.com>
To:     linux-input@vger.kernel.org
Cc:     upstream@semihalf.com, benjamin.tissoires@redhat.com,
        jikos@kernel.org, dmitry.torokhov@gmail.com,
        Angela Czubak <acz@semihalf.com>
Subject: [PATCH v4 14/17] HID: haptic: add hid_haptic_change_control
Date:   Fri,  7 Oct 2022 18:29:42 +0000
Message-Id: <20221007182945.1654046-15-acz@semihalf.com>
X-Mailer: git-send-email 2.38.0.rc1.362.ged0d419d3c-goog
In-Reply-To: <20221007182945.1654046-1-acz@semihalf.com>
References: <20221007182945.1654046-1-acz@semihalf.com>
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

Implement change_control callbacks for simple haptic device.
If anybody has requested control over an effect, do not generate it
in kernel.

Signed-off-by: Angela Czubak <acz@semihalf.com>
---
 drivers/hid/hid-haptic.c | 50 ++++++++++++++++++++++++++++++++++++++--
 1 file changed, 48 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/hid-haptic.c b/drivers/hid/hid-haptic.c
index 3d26bd5d15a4f..4b3ad5168fbb4 100644
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
2.38.0.rc1.362.ged0d419d3c-goog

