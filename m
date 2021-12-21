Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F59F47C760
	for <lists+linux-input@lfdr.de>; Tue, 21 Dec 2021 20:17:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241754AbhLUTR4 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 21 Dec 2021 14:17:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241746AbhLUTR4 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 21 Dec 2021 14:17:56 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD1A8C061574
        for <linux-input@vger.kernel.org>; Tue, 21 Dec 2021 11:17:55 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id t26so69766wrb.4
        for <linux-input@vger.kernel.org>; Tue, 21 Dec 2021 11:17:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ck2vpnIS2DAqG7HXn27YA+85j6sVgbhINNF0cX2lN3Q=;
        b=pgpC68Vhb42OE/Fa8r1IAvrzmFPn2EAzRQnrqP3Dz/JPjaTSxvzMkFzQ7Bh3KabatW
         jDlelzRCpNf0huwKwneWZsqNHpJ/f7hGR7+zJ2dq8Pn2bBKTqg/Tp03P/rnW+hCyyyzO
         7UDG9AMiUvlisPRvJhcJ9A+cnDDh4agfIqoVdMxEy39sAa9mpv4JSOBi3bjVIs5e/bkd
         UondidNflKbaICOzj/WLP0qMMKw2c5dz7omscXg6K1BDuJi9zvfPp2FA+PBvu+JKBicv
         7nKiYjeH3jcv0KzpEYobMmYNBY1OmluzgtWNUFjami+EOcN6J7am540TUkHm2MvsFk7o
         BlZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ck2vpnIS2DAqG7HXn27YA+85j6sVgbhINNF0cX2lN3Q=;
        b=7gpBNiwASov+D1JaDMYxzHzUTVVBNRj3CdgJXUhrq/xR65T+6BIaJ7a7qjM0oOMoKg
         x4DMcvgY3Vcw1A5XVRYA11u1nKygpGdbI0R8mpF4V+zVJCleZQpMHz1DPJ6XxrQPhR81
         FbJEKh24G19ls5egg+WV3fEuHzsYZQShvBZRyk13PGSHA4q+NEky+FfTyXZmYaYk3gsD
         NEI7d0j/fTq8c2JnW9qlGIaT24gv4XDJrfFynUk3Y8ePG3G90okBSIu0zTAdRCgj3w4o
         YDiKsmnBBJxeAq9+1lU/8ak3rFo5NajZxUmxa3ofIeRBCIMGZo848k9EHm+cPWIeMv3U
         vpAA==
X-Gm-Message-State: AOAM530SMvcerWdXWLUq50C3zDWTsmnnanBpTqLmokgoIAgAqVOYFJRu
        xCVfgcWyEfTFIQatdQ4Oxesw89ZSLYM7zVPp+Cc=
X-Google-Smtp-Source: ABdhPJxNOorVrqDRUN5orHalX0O9IlUFCZ2ShvaKsU0+RGL6dL2UU8uILseUW4GF/ZuOzyvE+MvVig==
X-Received: by 2002:adf:f587:: with SMTP id f7mr3795250wro.671.1640114274510;
        Tue, 21 Dec 2021 11:17:54 -0800 (PST)
Received: from aczubak.c.googlers.com.com (109.36.187.35.bc.googleusercontent.com. [35.187.36.109])
        by smtp.gmail.com with ESMTPSA id t8sm3994846wmq.32.2021.12.21.11.17.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Dec 2021 11:17:54 -0800 (PST)
From:   Angela Czubak <acz@semihalf.com>
To:     linux-input@vger.kernel.org
Cc:     upstream@semihalf.com, dmitry.torokhov@gmail.com,
        Angela Czubak <acz@semihalf.com>
Subject: [PATCH 14/18] HID: haptic: add hid_haptic_switch_mode
Date:   Tue, 21 Dec 2021 19:17:39 +0000
Message-Id: <20211221191743.1893185-15-acz@semihalf.com>
X-Mailer: git-send-email 2.34.1.307.g9b7440fafd-goog
In-Reply-To: <20211221191743.1893185-1-acz@semihalf.com>
References: <20211221191743.1893185-1-acz@semihalf.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Function hid_haptic_switch_mode() can be used to turn off and on the
autonomoums mode for the device. If the device supports press and release
waveforms, let the kernel handle generation of haptic feedback instead of
the device itself.
Implement hid_haptic_resume() and hid_haptic_suspend() so that the
autonomous mode gets switched off at resume and switched on at suspend.

Signed-off-by: Angela Czubak <acz@semihalf.com>
---
 drivers/hid/hid-haptic.c | 89 +++++++++++++++++++++++++++++++++++++---
 drivers/hid/hid-haptic.h | 10 +++++
 2 files changed, 93 insertions(+), 6 deletions(-)

diff --git a/drivers/hid/hid-haptic.c b/drivers/hid/hid-haptic.c
index 85c4711f685e..e7fd53d1a7c1 100644
--- a/drivers/hid/hid-haptic.c
+++ b/drivers/hid/hid-haptic.c
@@ -8,6 +8,7 @@
 /*
  */
 
+#include <linux/input/mt.h>
 #include <linux/module.h>
 
 #include "hid-haptic.h"
@@ -200,9 +201,61 @@ static void fill_effect_buf(struct hid_haptic_device *haptic,
 	mutex_unlock(&haptic->manual_trigger_mutex);
 }
 
+static void switch_mode(struct hid_device *hdev, struct hid_haptic_device *haptic,
+			int mode)
+{
+	struct hid_report *rep = haptic->auto_trigger_report;
+	struct hid_field *field;
+	s32 value;
+	int i, j;
+
+	if (mode == HID_HAPTIC_MODE_KERNEL) {
+		value = HID_HAPTIC_ORDINAL_WAVEFORMSTOP;
+		input_mt_pressure_toggle(haptic->input_dev, 0);
+	} else {
+		value = haptic->default_auto_trigger;
+		input_mt_pressure_toggle(haptic->input_dev, 1);
+	}
+
+	mutex_lock(&haptic->auto_trigger_mutex);
+	for (i = 0; i < rep->maxfield; i++) {
+		field = rep->field[i];
+		/* Ignore if report count is out of bounds. */
+		if (field->report_count < 1)
+			continue;
+
+		for (j = 0; j < field->maxusage; j++) {
+			if (field->usage[j].hid == HID_HP_AUTOTRIGGER)
+				field->value[j] = value;
+		}
+	}
+
+	/* send the report */
+	hid_hw_request(hdev, rep, HID_REQ_SET_REPORT);
+	mutex_unlock(&haptic->auto_trigger_mutex);
+	haptic->mode = mode;
+}
+
+#ifdef CONFIG_PM
+void hid_haptic_resume(struct hid_device *hdev, struct hid_haptic_device *haptic)
+{
+	if (haptic->press_ordinal_cur && haptic->release_ordinal_cur)
+		switch_mode(hdev, haptic, HID_HAPTIC_MODE_KERNEL);
+}
+EXPORT_SYMBOL_GPL(hid_haptic_resume);
+
+void hid_haptic_suspend(struct hid_device *hdev, struct hid_haptic_device *haptic)
+{
+	if (haptic->press_ordinal_cur && haptic->release_ordinal_cur)
+		switch_mode(hdev, haptic, HID_HAPTIC_MODE_DEVICE);
+}
+EXPORT_SYMBOL_GPL(hid_haptic_suspend);
+#endif
+
 static int hid_haptic_upload_effect(struct input_dev *dev, struct ff_effect *effect,
 				    struct ff_effect *old)
 {
+	struct hid_device *hdev = input_get_drvdata(dev);
 	struct ff_device *ff = dev->ff;
 	struct hid_haptic_device *haptic = ff->private;
 	int i, ordinal = 0;
@@ -228,6 +281,20 @@ static int hid_haptic_upload_effect(struct input_dev *dev, struct ff_effect *eff
 	fill_effect_buf(haptic, &effect->u.hid, &haptic->effect[effect->id],
 			ordinal);
 
+	if (effect->id == HID_HAPTIC_RELEASE_EFFECT_ID) {
+		if (haptic->press_ordinal_cur &&
+		    haptic->mode == HID_HAPTIC_MODE_DEVICE) {
+			switch_mode(hdev, haptic, HID_HAPTIC_MODE_KERNEL);
+		}
+		haptic->release_ordinal_cur = ordinal;
+	} else if (effect->id == HID_HAPTIC_PRESS_EFFECT_ID) {
+		if (haptic->release_ordinal_cur &&
+		    haptic->mode == HID_HAPTIC_MODE_DEVICE) {
+			switch_mode(hdev, haptic, HID_HAPTIC_MODE_KERNEL);
+		}
+		haptic->press_ordinal_cur = ordinal;
+	}
+
 	return 0;
 }
 
@@ -294,6 +361,7 @@ static void effect_set_default(struct ff_effect *effect)
 static int hid_haptic_erase(struct input_dev *dev, int effect_id)
 {
 	struct hid_haptic_device *haptic = dev->ff->private;
+	struct hid_device *hdev = input_get_drvdata(dev);
 	struct ff_effect effect;
 	int ordinal;
 
@@ -301,21 +369,29 @@ static int hid_haptic_erase(struct input_dev *dev, int effect_id)
 	switch (effect_id) {
 	case HID_HAPTIC_RELEASE_EFFECT_ID:
 		ordinal = haptic->release_ordinal_orig;
-		if (!ordinal)
+		haptic->release_ordinal_cur = ordinal;
+		if (!ordinal) {
 			ordinal = HID_HAPTIC_ORDINAL_WAVEFORMNONE;
-		else
+			if (haptic->mode == HID_HAPTIC_MODE_KERNEL)
+				switch_mode(hdev, haptic, HID_HAPTIC_MODE_DEVICE);
+		} else {
 			effect.u.hid.hid_usage = HID_HP_WAVEFORMRELEASE &
 				HID_USAGE;
+		}
 		fill_effect_buf(haptic, &effect.u.hid, &haptic->effect[effect_id],
 				ordinal);
 		break;
 	case HID_HAPTIC_PRESS_EFFECT_ID:
 		ordinal = haptic->press_ordinal_orig;
-		if (!ordinal)
+		haptic->press_ordinal_cur = ordinal;
+		if (!ordinal) {
 			ordinal = HID_HAPTIC_ORDINAL_WAVEFORMNONE;
-		else
+			if (haptic->mode == HID_HAPTIC_MODE_KERNEL)
+				switch_mode(hdev, haptic, HID_HAPTIC_MODE_DEVICE);
+		} else {
 			effect.u.hid.hid_usage = HID_HP_WAVEFORMPRESS &
 				HID_USAGE;
+		}
 		fill_effect_buf(haptic, &effect.u.hid, &haptic->effect[effect_id],
 				ordinal);
 		break;
@@ -408,6 +484,7 @@ int hid_haptic_init(struct hid_device *hdev,
 	haptic->hid_usage_map[HID_HAPTIC_ORDINAL_WAVEFORMSTOP] =
 		HID_HP_WAVEFORMSTOP & HID_USAGE;
 
+	mutex_init(&haptic->auto_trigger_mutex);
 	for (r = 0; r < haptic->auto_trigger_report->maxfield; r++)
 		parse_auto_trigger_field(haptic, haptic->auto_trigger_report->field[r]);
 
@@ -583,13 +660,13 @@ void hid_haptic_handle_press_release(struct hid_haptic_device *haptic)
 	if (!prev_pressed_state && haptic->pressed_state &&
 	    haptic->mode == HID_HAPTIC_MODE_KERNEL) {
 		spin_lock_irqsave(&input->event_lock, flags);
-		input->ff->playback(input, PRESS_HID_EFFECT_ID, 1);
+		input->ff->playback(input, HID_HAPTIC_PRESS_EFFECT_ID, 1);
 		spin_unlock_irqrestore(&input->event_lock, flags);
 	}
 	if (prev_pressed_state && !haptic->pressed_state &&
 	    haptic->mode == HID_HAPTIC_MODE_KERNEL) {
 		spin_lock_irqsave(&input->event_lock, flags);
-		input->ff->playback(input, RELEASE_HID_EFFECT_ID, 1);
+		input->ff->playback(input, HID_HAPTIC_RELEASE_EFFECT_ID, 1);
 		spin_unlock_irqrestore(&input->event_lock, flags);
 	}
 }
diff --git a/drivers/hid/hid-haptic.h b/drivers/hid/hid-haptic.h
index 27ae1ed576c4..7a4571075a21 100644
--- a/drivers/hid/hid-haptic.h
+++ b/drivers/hid/hid-haptic.h
@@ -82,6 +82,10 @@ int hid_haptic_input_mapping(struct hid_device *hdev,
 int hid_haptic_input_configured(struct hid_device *hdev,
 				struct hid_haptic_device *haptic,
 				struct hid_input *hi);
+#ifdef CONFIG_PM
+void hid_haptic_resume(struct hid_device *hdev, struct hid_haptic_device *haptic);
+void hid_haptic_suspend(struct hid_device *hdev, struct hid_haptic_device *haptic);
+#endif
 int hid_haptic_init(struct hid_device *hdev, struct hid_haptic_device **haptic_ptr);
 void hid_haptic_handle_press_release(struct hid_haptic_device *haptic);
 bool hid_haptic_handle_input(struct hid_haptic_device *haptic);
@@ -117,6 +121,12 @@ int hid_haptic_input_configured(struct hid_device *hdev,
 {
 	return 0;
 }
+#ifdef CONFIG_PM
+static inline
+void hid_haptic_resume(struct hid_device *hdev, struct hid_haptic_device *haptic) {}
+static inline
+void hid_haptic_suspend(struct hid_device *hdev, struct hid_haptic_device *haptic) {}
+#endif
 static inline
 int hid_haptic_init(struct hid_device *hdev, struct hid_haptic_device **haptic_ptr)
 {
-- 
2.34.1.307.g9b7440fafd-goog

