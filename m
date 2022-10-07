Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 79B525F7D5F
	for <lists+linux-input@lfdr.de>; Fri,  7 Oct 2022 20:30:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229668AbiJGSaa (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 7 Oct 2022 14:30:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229763AbiJGSaX (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 7 Oct 2022 14:30:23 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6FFBC58A6
        for <linux-input@vger.kernel.org>; Fri,  7 Oct 2022 11:30:19 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id e18so3373233wmq.3
        for <linux-input@vger.kernel.org>; Fri, 07 Oct 2022 11:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7eNbqH85cekTZ3ChqflSp/zVaHBllGQnGWvg/J+jNkk=;
        b=mpASMn2puuT8Sx2p9YkYN79tYcSGUIsiRRrijozmi2cC1AI85uAqYiwxF7FCgDwz9k
         +Iqcpf6rREVklO5bBnPYSxQ6JNpd2SGf4sTnvtuXalYME2MvL4L+qCd6bsBDcnVC2tfO
         hzqVeeWR6DjSp67u5KeyIsovfOUJfpEHTfLB8nvB9AxxAFDdbeMryimbQXfvT2gyMl7T
         j8AsegFdCfmnClFoup5hsr8xQZCAT12c+DmN4QtBXyTw0Z1gMisvtXybCZCC4afdnkaU
         I9on0SP3LZBq1EHkMwLY0Z6gSOXgNMNvdh0uivgvfxk6Kio0ptsyX/z26yq7axmv+1yN
         CfPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7eNbqH85cekTZ3ChqflSp/zVaHBllGQnGWvg/J+jNkk=;
        b=DqkrjRA/Hr+xPsaQ/kQdAcXuGwaUU/Jbh255PIVkb6UO9G8iDCwD20d5HGHMzTTGqf
         +4Vs68HgvuFoWLiaiKFSzRic7JS36qXqVw7/Y1V4mtTNpyt5mfib+UhDw/dChfRyk9bk
         nXqlb5N8vU0wCjhQjMv0d44DdWQZLDoT63ik9Vwyx6lp0h+q81kqgdEMBwouZ4XMhWdM
         aU34A8j/dlWw0r24l+ClER1SrTInrPEJX0cGL6LWpc+GwPfeLxpneDAyQPjx55NN18qD
         PkqC2LSGtffj7zz+1XuqeF66PvrP5hxNlx9EPBraUPazxhD1zvOLyGDzEZjunatBZpr5
         utDg==
X-Gm-Message-State: ACrzQf1ebNFpah9TLEcYJTKMuxuJQQxrGZo2WL5JrTAJI+q0MQwjxbaM
        gDEo59DBRx8777Yiu1hefDsOnnH0tpjTLOMB
X-Google-Smtp-Source: AMsMyM6pKfYUOfiLh+GbP49XXsi33xeYf8ymcNb1/jlFuKt3g52CdvWBj+RBXlTmFw0fpM9qNokHkA==
X-Received: by 2002:a05:600c:1d84:b0:3c2:1ba7:d7c8 with SMTP id p4-20020a05600c1d8400b003c21ba7d7c8mr6038922wms.57.1665167418384;
        Fri, 07 Oct 2022 11:30:18 -0700 (PDT)
Received: from aczubak.c.googlers.com.com (230.213.79.34.bc.googleusercontent.com. [34.79.213.230])
        by smtp.gmail.com with ESMTPSA id l10-20020a05600012ca00b002258235bda3sm2573627wrx.61.2022.10.07.11.30.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Oct 2022 11:30:17 -0700 (PDT)
From:   Angela Czubak <acz@semihalf.com>
To:     linux-input@vger.kernel.org
Cc:     upstream@semihalf.com, benjamin.tissoires@redhat.com,
        jikos@kernel.org, dmitry.torokhov@gmail.com,
        Angela Czubak <acz@semihalf.com>
Subject: [PATCH v4 09/17] HID: haptic: add functions handling events
Date:   Fri,  7 Oct 2022 18:29:37 +0000
Message-Id: <20221007182945.1654046-10-acz@semihalf.com>
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

Implement hid_haptic_handle_press_release() which generates haptic feedback
as well as saves the pressed state of the haptic device.
Function hid_haptic_handle_input() inserts BTN_LEFT and ABS_PRESSURE events
if the device is in kernel mode.
Add functions to increase and reset the state of the pressure detected by
the device.

Signed-off-by: Angela Czubak <acz@semihalf.com>
---
 drivers/hid/hid-haptic.c | 73 +++++++++++++++++++++++++++++++++++++++-
 drivers/hid/hid-haptic.h | 18 ++++++++++
 2 files changed, 90 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/hid-haptic.c b/drivers/hid/hid-haptic.c
index 3301bf27dfdee..9b89a1f8a6316 100644
--- a/drivers/hid/hid-haptic.c
+++ b/drivers/hid/hid-haptic.c
@@ -50,8 +50,13 @@ EXPORT_SYMBOL_GPL(hid_haptic_feature_mapping);
 bool hid_haptic_is_forcepad(struct hid_haptic_device *haptic,
 			    struct hid_input *hi, struct hid_field *field)
 {
-	if (field->unit == HID_UNIT_GRAM || field->unit == HID_UNIT_NEWTON)
+	if (field->unit == HID_UNIT_GRAM || field->unit == HID_UNIT_NEWTON) {
+		haptic->force_logical_minimum = field->logical_minimum;
+		haptic->force_physical_minimum = field->physical_minimum;
+		haptic->force_resolution = input_abs_get_res(hi->input,
+							     ABS_MT_PRESSURE);
 		haptic->is_forcepad = true;
+	}
 	return haptic->is_forcepad;
 }
 EXPORT_SYMBOL_GPL(hid_haptic_is_forcepad);
@@ -346,6 +351,12 @@ static void hid_haptic_destroy(struct ff_device *ff)
 	module_put(THIS_MODULE);
 }
 
+static u32 convert_force_to_logical(struct hid_haptic_device *haptic, u32 value)
+{
+	return (value - haptic->force_physical_minimum) *
+		haptic->force_resolution + haptic->force_logical_minimum;
+}
+
 int hid_haptic_init(struct hid_device *hdev,
 		    struct hid_haptic_device **haptic_ptr)
 {
@@ -479,9 +490,16 @@ int hid_haptic_init(struct hid_device *hdev,
 		goto input_free;
 	}
 
+	haptic->mode = HID_HAPTIC_MODE_DEVICE;
+
 	if (!haptic->is_forcepad)
 		goto exit;
 
+	haptic->press_threshold = convert_force_to_logical(haptic,
+							   HID_HAPTIC_PRESS_THRESH);
+	haptic->release_threshold = convert_force_to_logical(haptic,
+							     HID_HAPTIC_RELEASE_THRESH);
+
 	effect_set_default(&release_effect);
 	if (haptic->release_ordinal_orig)
 		release_effect.u.hid.hid_usage = HID_HP_WAVEFORMRELEASE &
@@ -547,3 +565,56 @@ int hid_haptic_init(struct hid_device *hdev,
 	return ret;
 }
 EXPORT_SYMBOL_GPL(hid_haptic_init);
+
+void hid_haptic_handle_press_release(struct hid_haptic_device *haptic)
+{
+	int prev_pressed_state = haptic->pressed_state;
+	struct input_dev *input = haptic->input_dev;
+	unsigned long flags;
+
+	if (!haptic->is_forcepad)
+		return;
+
+	if (haptic->pressure > haptic->press_threshold)
+		haptic->pressed_state = 1;
+	else if (haptic->pressure < haptic->release_threshold)
+		haptic->pressed_state = 0;
+	if (!prev_pressed_state && haptic->pressed_state &&
+	    haptic->mode == HID_HAPTIC_MODE_KERNEL) {
+		spin_lock_irqsave(&input->event_lock, flags);
+		input->ff->playback(input, PRESS_HID_EFFECT_ID, 1);
+		spin_unlock_irqrestore(&input->event_lock, flags);
+	}
+	if (prev_pressed_state && !haptic->pressed_state &&
+	    haptic->mode == HID_HAPTIC_MODE_KERNEL) {
+		spin_lock_irqsave(&input->event_lock, flags);
+		input->ff->playback(input, RELEASE_HID_EFFECT_ID, 1);
+		spin_unlock_irqrestore(&input->event_lock, flags);
+	}
+}
+EXPORT_SYMBOL_GPL(hid_haptic_handle_press_release);
+
+bool hid_haptic_handle_input(struct hid_haptic_device *haptic)
+{
+	if (haptic->is_forcepad && haptic->mode == HID_HAPTIC_MODE_KERNEL) {
+		input_event(haptic->input_dev, EV_KEY, BTN_LEFT,
+			    haptic->pressed_state);
+		return true;
+	}
+	return false;
+}
+EXPORT_SYMBOL_GPL(hid_haptic_handle_input);
+
+void hid_haptic_pressure_reset(struct hid_haptic_device *haptic)
+{
+	haptic->pressure = 0;
+}
+EXPORT_SYMBOL_GPL(hid_haptic_pressure_reset);
+
+void hid_haptic_pressure_update(struct hid_haptic_device *haptic,
+				__s32 pressure)
+{
+	if (pressure > haptic->pressure)
+		haptic->pressure = pressure;
+}
+EXPORT_SYMBOL_GPL(hid_haptic_pressure_update);
diff --git a/drivers/hid/hid-haptic.h b/drivers/hid/hid-haptic.h
index 67096cc8c2331..c26093e3773d1 100644
--- a/drivers/hid/hid-haptic.h
+++ b/drivers/hid/hid-haptic.h
@@ -83,6 +83,11 @@ int hid_haptic_input_mapping(struct hid_device *hdev,
 bool hid_haptic_input_configured(struct hid_device *hdev,
 				 struct hid_haptic_device *haptic);
 int hid_haptic_init(struct hid_device *hdev, struct hid_haptic_device **haptic_ptr);
+void hid_haptic_handle_press_release(struct hid_haptic_device *haptic);
+bool hid_haptic_handle_input(struct hid_haptic_device *haptic);
+void hid_haptic_pressure_reset(struct hid_haptic_device *haptic);
+void hid_haptic_pressure_update(struct hid_haptic_device *haptic,
+				__s32 pressure);
 #else
 static inline
 void hid_haptic_feature_mapping(struct hid_device *hdev,
@@ -116,4 +121,17 @@ int hid_haptic_init(struct hid_device *hdev, struct hid_haptic_device **haptic_p
 {
 	return 0;
 }
+static inline
+void hid_haptic_handle_press_release(struct hid_haptic_device *haptic) {}
+static inline
+bool hid_haptic_handle_input(struct hid_haptic_device *haptic)
+{
+	return false;
+}
+static inline
+void hid_haptic_pressure_reset(struct hid_haptic_device *haptic) {}
+static inline
+void hid_haptic_pressure_update(struct hid_haptic_device *haptic,
+				  __s32 pressure)
+{}
 #endif
-- 
2.38.0.rc1.362.ged0d419d3c-goog

