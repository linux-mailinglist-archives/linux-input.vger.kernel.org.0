Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C208354B5D
	for <lists+linux-input@lfdr.de>; Tue,  6 Apr 2021 05:47:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243554AbhDFDrS (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 5 Apr 2021 23:47:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233639AbhDFDrS (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 5 Apr 2021 23:47:18 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B829C061574
        for <linux-input@vger.kernel.org>; Mon,  5 Apr 2021 20:47:11 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id b8-20020a17090a5508b029014d0fbe9b64so3155855pji.5
        for <linux-input@vger.kernel.org>; Mon, 05 Apr 2021 20:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=hyaMf2u8CPYEMSTHLg/bXiU9iPOxo8uq98nO3Wwp7/Y=;
        b=HXKGXjkQkaULmA7mOc++8gGJG09E7sbuNsB9nVJtSLodksm+NmbR3weLwzhuk61oaV
         zaSOAmEg3SojB+XathEK5ZheoVJouwbzoRHFRqWCSUvQoq3b97ILphA5eSLALm9nu4Xy
         DwNVVAqQ5gDXrs3uktQJAwgE36UG0EFz/REKNNOHq8KIVhNLqYwOfsXbb0gGuGq8S3jz
         7pU7oCQrgU/eH5BsVwUwlYeJK15TDsf+DslWCadE370S2mN3b47izLCSNv6s2ClshLjm
         JaWAUkFAoh8nqiwEutSyRBOntXwVRfD+1pcd/jreSfYRjHJWoQev2pestBfrCiM9EcGq
         2IBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=hyaMf2u8CPYEMSTHLg/bXiU9iPOxo8uq98nO3Wwp7/Y=;
        b=lw7sgpySjgCtSMc+XV9BuQXOUv3cor0yQmsiBfa38wR6TOVBVTwSv+Zhwv8GqWP4cv
         DnoWcJBC6F7MkDnNGoLvdy5AIaYPORPRWnykZ9dmu1ZSW4pIf0flWPRiLJRuq6IgZT0F
         KKKB3JUPECcVC3yx1uPlrbjk3Dj86CU0KlXVSlEdIwH0i0hROqZLfHPvPf/CKYoNzrzS
         NiYWolwpJg3F66TKF2gDR+4AWDXO/hH8S+UU8y/1gNxC5fIaYS2Y4wVWhmfRiWk/i4+D
         b9BgXUzYjrPAnV85aTeSgRzP6xBlvfNOXBcmXu+QYoxUY+adVMCmQyLfJm54eFe0kGoZ
         TFag==
X-Gm-Message-State: AOAM533KdCvqSTz44W47icghXN7pS6646jUYDwV4xBVFhNJV2i02o/RL
        dMvOabMYYKTRzmGfDcSMEeNQr2D1Zqn9Hg==
X-Google-Smtp-Source: ABdhPJxKJlycokXAt9gkrOXKYyqNvu7JwXUFeKL6aXK5f22loLO4mb1wdrXbJWxPX5cxGMrcxlI/dQ==
X-Received: by 2002:a17:90a:668d:: with SMTP id m13mr2462756pjj.140.1617680830235;
        Mon, 05 Apr 2021 20:47:10 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:4f03:fea0:3149:1326:912c:9943])
        by smtp.gmail.com with ESMTPSA id e6sm16653059pfc.159.2021.04.05.20.47.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Apr 2021 20:47:09 -0700 (PDT)
From:   Ping Cheng <pinglinux@gmail.com>
X-Google-Original-From: Ping Cheng <ping.cheng@wacom.com>
To:     linux-input@vger.kernel.org
Cc:     jkosina@suse.cz, Jason.Gerecke@wacom.com,
        Ping Cheng <ping.cheng@wacom.com>
Subject: [PATCH 2/2] HID: wacom: Setup pen input capabilities to the targeted tools
Date:   Mon,  5 Apr 2021 20:46:34 -0700
Message-Id: <20210406034634.643-1-ping.cheng@wacom.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Only set the bits that are supported by the targeted devices.
This patch also removes duplicated set_bit calls.

Signed-off-by: Ping Cheng <ping.cheng@wacom.com>
Reviewed-by: Jason Gerecke <Jason.Gerecke@wacom.com>
---
 drivers/hid/wacom_wac.c | 50 +++++++++++++++++++++++++------------------------
 drivers/hid/wacom_wac.h |  1 +
 2 files changed, 27 insertions(+), 24 deletions(-)

diff --git a/drivers/hid/wacom_wac.c b/drivers/hid/wacom_wac.c
index 5e78636..f938433 100644
--- a/drivers/hid/wacom_wac.c
+++ b/drivers/hid/wacom_wac.c
@@ -1869,8 +1869,6 @@ static void wacom_map_usage(struct input_dev *input, struct hid_usage *usage,
 	usage->type = type;
 	usage->code = code;
 
-	set_bit(type, input->evbit);
-
 	switch (type) {
 	case EV_ABS:
 		input_set_abs_params(input, code, fmin, fmax, fuzz, 0);
@@ -1878,13 +1876,9 @@ static void wacom_map_usage(struct input_dev *input, struct hid_usage *usage,
 				  hidinput_calc_abs_res(field, resolution_code));
 		break;
 	case EV_KEY:
-		input_set_capability(input, EV_KEY, code);
-		break;
 	case EV_MSC:
-		input_set_capability(input, EV_MSC, code);
-		break;
 	case EV_SW:
-		input_set_capability(input, EV_SW, code);
+		input_set_capability(input, type, code);
 		break;
 	}
 }
@@ -2196,6 +2190,18 @@ static void wacom_wac_pad_report(struct hid_device *hdev,
 	}
 }
 
+static void wacom_set_barrel_switch3_usage(struct wacom_wac *wacom_wac)
+{
+	struct input_dev *input = wacom_wac->pen_input;
+	struct wacom_features *features = &wacom_wac->features;
+
+	if (!(features->quirks & WACOM_QUIRK_AESPEN) &&
+	    wacom_wac->hid_data.barrelswitch &&
+	    wacom_wac->hid_data.barrelswitch2 &&
+	    wacom_wac->hid_data.serialhi)
+		input_set_capability(input, EV_KEY, BTN_STYLUS3);
+}
+
 static void wacom_wac_pen_usage_mapping(struct hid_device *hdev,
 		struct hid_field *field, struct hid_usage *usage)
 {
@@ -2236,13 +2242,21 @@ static void wacom_wac_pen_usage_mapping(struct hid_device *hdev,
 		wacom_map_usage(input, usage, field, EV_ABS, ABS_Z, 0);
 		break;
 	case HID_DG_ERASER:
+		input_set_capability(input, EV_KEY, BTN_TOOL_RUBBER);
+		wacom_map_usage(input, usage, field, EV_KEY, BTN_TOUCH, 0);
+		break;
 	case HID_DG_TIPSWITCH:
+		input_set_capability(input, EV_KEY, BTN_TOOL_PEN);
 		wacom_map_usage(input, usage, field, EV_KEY, BTN_TOUCH, 0);
 		break;
 	case HID_DG_BARRELSWITCH:
+		wacom_wac->hid_data.barrelswitch = true;
+		wacom_set_barrel_switch3_usage(wacom_wac);
 		wacom_map_usage(input, usage, field, EV_KEY, BTN_STYLUS, 0);
 		break;
 	case HID_DG_BARRELSWITCH2:
+		wacom_wac->hid_data.barrelswitch2 = true;
+		wacom_set_barrel_switch3_usage(wacom_wac);
 		wacom_map_usage(input, usage, field, EV_KEY, BTN_STYLUS2, 0);
 		break;
 	case HID_DG_TOOLSERIALNUMBER:
@@ -2254,22 +2268,12 @@ static void wacom_wac_pen_usage_mapping(struct hid_device *hdev,
 		wacom_map_usage(input, usage, field, EV_KEY, BTN_TOOL_PEN, 0);
 		break;
 	case WACOM_HID_WD_SERIALHI:
+		wacom_wac->hid_data.serialhi = true;
+		wacom_set_barrel_switch3_usage(wacom_wac);
 		wacom_map_usage(input, usage, field, EV_ABS, ABS_MISC, 0);
-
-		if (!(features->quirks & WACOM_QUIRK_AESPEN)) {
-			set_bit(EV_KEY, input->evbit);
-			input_set_capability(input, EV_KEY, BTN_TOOL_PEN);
-			input_set_capability(input, EV_KEY, BTN_TOOL_RUBBER);
-			input_set_capability(input, EV_KEY, BTN_TOOL_BRUSH);
-			input_set_capability(input, EV_KEY, BTN_TOOL_PENCIL);
-			input_set_capability(input, EV_KEY, BTN_TOOL_AIRBRUSH);
-			if (!(features->device_type & WACOM_DEVICETYPE_DIRECT)) {
-				input_set_capability(input, EV_KEY, BTN_TOOL_MOUSE);
-				input_set_capability(input, EV_KEY, BTN_TOOL_LENS);
-			}
-		}
 		break;
 	case WACOM_HID_WD_FINGERWHEEL:
+		input_set_capability(input, EV_KEY, BTN_TOOL_AIRBRUSH);
 		wacom_map_usage(input, usage, field, EV_ABS, ABS_WHEEL, 0);
 		break;
 	}
@@ -3591,11 +3595,9 @@ int wacom_setup_pen_input_capabilities(struct input_dev *input_dev,
 	else
 		__set_bit(INPUT_PROP_POINTER, input_dev->propbit);
 
-	if (features->type == HID_GENERIC) {
-		/* setup has already been done; apply otherwise-undetectible quirks */
-		input_set_capability(input_dev, EV_KEY, BTN_STYLUS3);
+	if (features->type == HID_GENERIC)
+		/* setup has already been done */
 		return 0;
-	}
 
 	input_dev->evbit[0] |= BIT_MASK(EV_KEY) | BIT_MASK(EV_ABS);
 	__set_bit(BTN_TOUCH, input_dev->keybit);
diff --git a/drivers/hid/wacom_wac.h b/drivers/hid/wacom_wac.h
index e15f70f..9211f1d 100644
--- a/drivers/hid/wacom_wac.h
+++ b/drivers/hid/wacom_wac.h
@@ -320,6 +320,7 @@ struct hid_data {
 	bool tipswitch;
 	bool barrelswitch;
 	bool barrelswitch2;
+	bool serialhi;
 	int x;
 	int y;
 	int pressure;
-- 
2.17.1

