Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9BCE0525F49
	for <lists+linux-input@lfdr.de>; Fri, 13 May 2022 12:08:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353324AbiEMJkG (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 13 May 2022 05:40:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1379110AbiEMJjv (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 13 May 2022 05:39:51 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29CB72A7694
        for <linux-input@vger.kernel.org>; Fri, 13 May 2022 02:39:50 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id d5so10661583wrb.6
        for <linux-input@vger.kernel.org>; Fri, 13 May 2022 02:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xyYoV9VEJR4KI6DtmLczZLEmtSnMRuKw1Cj6fks1u+g=;
        b=wbyD9M2Zz4qCGg4iGKb6Ymdv16agQPVP6aClej3V8gFYSWYjqj252TmFd/6ELrN7Xv
         A5Xdap0S+3v19Z++luABjuwxC/r9bDFlhlPjF8HN9F0rA6C+StxIDOjesyf3pDB182nA
         YqL/dk3bAv5gT88TtuTdaLUQhZzfouTBsY8YFWpYlCqkXz6NlTxpBDkVzMI08RoNBB2v
         uHj7Rru7FkvSJCiIBlwrcuJo1J6IB941M6WZHgbpnGMMshHqE9R7hYaoL/cJ6LJ8tEFd
         se3BB/WOHxN5fvZ10iIPqtIGC17URDkLELWNb/fY6m42AR9rAj8xcn7yqeBrcMSq6CRn
         2IUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xyYoV9VEJR4KI6DtmLczZLEmtSnMRuKw1Cj6fks1u+g=;
        b=CMIpIfTbZwCDVFUz7upBvFDn7Ibr3cJwKCBuWLHSZa0Xea2cqm/0T80WjTN1gEn0IZ
         FX6/CxOZaINwL7ntysMotD0zp86tStIRD82pDVWoitWqRxO9woz/H1QEeQ0/NYf0ZkuV
         /6YeE3n0VD3RejGtKfsgKvHScltCWQp83lzdQRxALSeYBHASKq6Zgn9xqn3UPId18nbK
         9pU5SWVWMpRm9xrz10pfAzFWOQAVyNLv2oG5kSaVW2IvpH/qIEgSjyOlt5rJGx8XWM3j
         ZpMVNy39Jyu96EkTk8MrP1QnqEyMMSYlC5Uh6nmCqXf/F9d31ChEIVCfC363KtelpUg/
         pFrg==
X-Gm-Message-State: AOAM531T9GQDx53tcqz+NecuH82cmqI2T3iQH3MsS3mg4JKbQuJLYPrl
        XXcSdk6Ilmm0QYWjiNnIxFAlUXhDLAt3AJbgWu8=
X-Google-Smtp-Source: ABdhPJzG/VuJV5F8pJS6Ra+gky+pEjEsojhy5UQD90AX3OjZRHmfaI5ul0FRahuthV3EJmnK9XTwAw==
X-Received: by 2002:adf:fc4b:0:b0:20c:efe4:19ec with SMTP id e11-20020adffc4b000000b0020cefe419ecmr2027497wrs.430.1652434789761;
        Fri, 13 May 2022 02:39:49 -0700 (PDT)
Received: from aczubak.c.googlers.com.com (88.140.78.34.bc.googleusercontent.com. [34.78.140.88])
        by smtp.gmail.com with ESMTPSA id l5-20020adfa385000000b0020ce015ed48sm1631404wrb.103.2022.05.13.02.39.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 May 2022 02:39:49 -0700 (PDT)
From:   Angela Czubak <acz@semihalf.com>
To:     linux-input@vger.kernel.org
Cc:     upstream@semihalf.com, benjamin.tissoires@redhat.com,
        jikos@kernel.org, dmitry.torokhov@gmail.com,
        Angela Czubak <acz@semihalf.com>
Subject: [PATCH v3 09/17] HID: haptic: add functions handling events
Date:   Fri, 13 May 2022 09:39:19 +0000
Message-Id: <20220513093927.1632262-10-acz@semihalf.com>
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
index 3301bf27dfde..9b89a1f8a631 100644
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
index 67096cc8c233..c26093e3773d 100644
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
2.36.0.550.gb090851708-goog

