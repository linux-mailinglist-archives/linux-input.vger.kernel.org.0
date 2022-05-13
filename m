Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8A11B526C99
	for <lists+linux-input@lfdr.de>; Fri, 13 May 2022 23:52:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1380222AbiEMVwo (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 13 May 2022 17:52:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353675AbiEMVwn (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 13 May 2022 17:52:43 -0400
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA2F125287
        for <linux-input@vger.kernel.org>; Fri, 13 May 2022 14:52:41 -0700 (PDT)
Received: by mail-pl1-x62b.google.com with SMTP id n8so9193389plh.1
        for <linux-input@vger.kernel.org>; Fri, 13 May 2022 14:52:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=A3DeCmyzMOhZ5g1MUUwlkj6rPj8RtVX0Xz0D5cC6IVM=;
        b=gYI/RHQCEkl4YmyegbByaWZvkpxY9b8fxkAaNtzO7PAbk8/FbEi6StOGplDt7HpTp5
         xNBkVHuQdhufTMXJN0tVNFZLQbG+CeJ78Pi9j0FKbl1sMRf1Vx6B4XXrjTfTlChK6UEF
         QQ4/SW26zSuGYP7yQyHs5r2rAffq8Lv76dfFmKmT5g+PMwWsbiYYYmDyLb4WobqfmLs0
         dkp/3aV6pUdWcW3aOw700GPGrLrsFxYCb6WmPXiN5G2C3liM3wklh43fZlqHUkkaoIYN
         rXG20ib+s5q62m84vyhQIvLQNFMJUHelJ6XnnBeGE6rX2dGxG1sTKj/bduiTZkX7yl2j
         vnxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=A3DeCmyzMOhZ5g1MUUwlkj6rPj8RtVX0Xz0D5cC6IVM=;
        b=4/fk6UPmZ81AsQTKcHnymxqAJhBo3fYkYCZq0YinQ+9hr73tfLVHv3VhR4fmCAZDIG
         dYHVHFOnqcQJ0YTYMGS9ITn/z6K13W8CTGGjPQx1KE+/LRDQqN+dnVn7KROXqU8X1bbO
         PUW9iI3obJ37HMy91K4+O5JZ/ngk5bBLtTaEB2tThck9jUUfbqNJGgnZq7E+8AjHLxfk
         MP+jQtFzow90npT+ehdKoXvSZGTmp/3tCmIX+3VwEn4v2wdGtMmZenoYN/nL2+NYGoiy
         xHTCBRo8uYIk0ZwO+7BSbTUupAepqbknw+ngqsgdYj+09r3kp0boFBd8ar0D/eA7TUay
         80fQ==
X-Gm-Message-State: AOAM533vmns1ZmBjNgXlwBH/4dXzelp9PdO3PExjZwxyvVPqL83Ws6vh
        o0jy3t2dNcykHpNK0jAqWTb7Lrr0tmo=
X-Google-Smtp-Source: ABdhPJz4kiZlWcKszY/eKi515GD4Uq/L/RYyvw9wcUvOwktK5sHgupDAEKOsL0te6Z29f91kgnyCJA==
X-Received: by 2002:a17:902:d541:b0:15e:ba3a:90d2 with SMTP id z1-20020a170902d54100b0015eba3a90d2mr6580824plf.11.1652478761349;
        Fri, 13 May 2022 14:52:41 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:4f00:cef0:71f2:2d00:2ce2:66bf])
        by smtp.gmail.com with ESMTPSA id u21-20020a17090ae01500b001d5e1b124a0sm4066449pjy.7.2022.05.13.14.52.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 May 2022 14:52:41 -0700 (PDT)
From:   Ping Cheng <pinglinux@gmail.com>
X-Google-Original-From: Ping Cheng <ping.cheng@wacom.com>
To:     jikos@kernel.org
Cc:     linux-input@vger.kernel.org, Aaron.Skomra@wacom.com,
        joshua.dickens@wacom.com, Ping Cheng <ping.cheng@wacom.com>,
        Jason Gerecke <jason.gerecke@wacom.com>
Subject: [PATCH 2/2] HID: wacom: Don't register pad_input for touch switch
Date:   Fri, 13 May 2022 14:52:37 -0700
Message-Id: <20220513215237.15121-1-ping.cheng@wacom.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Touch switch state is received through WACOM_PAD_FIELD. However, it
is reported by touch_input. Don't register pad_input if no other pad
events require the interface.

Signed-off-by: Ping Cheng <ping.cheng@wacom.com>
Reviewed-by: Jason Gerecke <jason.gerecke@wacom.com>
---
 drivers/hid/wacom_sys.c |  2 +-
 drivers/hid/wacom_wac.c | 43 ++++++++++++++++++++++++-----------------
 2 files changed, 26 insertions(+), 19 deletions(-)

diff --git a/drivers/hid/wacom_sys.c b/drivers/hid/wacom_sys.c
index 066c567dbaa2..9a81e63c330e 100644
--- a/drivers/hid/wacom_sys.c
+++ b/drivers/hid/wacom_sys.c
@@ -2121,7 +2121,7 @@ static int wacom_register_inputs(struct wacom *wacom)
 
 	error = wacom_setup_pad_input_capabilities(pad_input_dev, wacom_wac);
 	if (error) {
-		/* no pad in use on this interface */
+		/* no pad events using this interface */
 		input_free_device(pad_input_dev);
 		wacom_wac->pad_input = NULL;
 		pad_input_dev = NULL;
diff --git a/drivers/hid/wacom_wac.c b/drivers/hid/wacom_wac.c
index 3bee4f46003d..6491dc6b3ea8 100644
--- a/drivers/hid/wacom_wac.c
+++ b/drivers/hid/wacom_wac.c
@@ -2017,7 +2017,6 @@ static void wacom_wac_pad_usage_mapping(struct hid_device *hdev,
 		wacom_wac->has_mute_touch_switch = true;
 		usage->type = EV_SW;
 		usage->code = SW_MUTE_DEVICE;
-		features->device_type |= WACOM_DEVICETYPE_PAD;
 		break;
 	case WACOM_HID_WD_TOUCHSTRIP:
 		wacom_map_usage(input, usage, field, EV_ABS, ABS_RX, 0);
@@ -2097,6 +2096,30 @@ static void wacom_wac_pad_event(struct hid_device *hdev, struct hid_field *field
 			wacom_wac->hid_data.inrange_state |= value;
 	}
 
+	/* Process touch switch state first since it is reported through touch interface,
+	 * which is indepentent of pad interface. In the case when there are no other pad
+	 * events, the pad interface will not even be created.
+	 */
+	if ((equivalent_usage == WACOM_HID_WD_MUTE_DEVICE) ||
+	   (equivalent_usage == WACOM_HID_WD_TOUCHONOFF)) {
+		if (wacom_wac->shared->touch_input) {
+			bool *is_touch_on = &wacom_wac->shared->is_touch_on;
+
+			if (equivalent_usage == WACOM_HID_WD_MUTE_DEVICE && value)
+				*is_touch_on = !(*is_touch_on);
+			else if (equivalent_usage == WACOM_HID_WD_TOUCHONOFF)
+				*is_touch_on = value;
+
+			input_report_switch(wacom_wac->shared->touch_input,
+					    SW_MUTE_DEVICE, !(*is_touch_on));
+			input_sync(wacom_wac->shared->touch_input);
+		}
+		return;
+	}
+
+	if (!input)
+		return;
+
 	switch (equivalent_usage) {
 	case WACOM_HID_WD_TOUCHRING:
 		/*
@@ -2132,22 +2155,6 @@ static void wacom_wac_pad_event(struct hid_device *hdev, struct hid_field *field
 			input_event(input, usage->type, usage->code, 0);
 		break;
 
-	case WACOM_HID_WD_MUTE_DEVICE:
-	case WACOM_HID_WD_TOUCHONOFF:
-		if (wacom_wac->shared->touch_input) {
-			bool *is_touch_on = &wacom_wac->shared->is_touch_on;
-
-			if (equivalent_usage == WACOM_HID_WD_MUTE_DEVICE && value)
-				*is_touch_on = !(*is_touch_on);
-			else if (equivalent_usage == WACOM_HID_WD_TOUCHONOFF)
-				*is_touch_on = value;
-
-			input_report_switch(wacom_wac->shared->touch_input,
-					    SW_MUTE_DEVICE, !(*is_touch_on));
-			input_sync(wacom_wac->shared->touch_input);
-		}
-		break;
-
 	case WACOM_HID_WD_MODE_CHANGE:
 		if (wacom_wac->is_direct_mode != value) {
 			wacom_wac->is_direct_mode = value;
@@ -2808,7 +2815,7 @@ void wacom_wac_event(struct hid_device *hdev, struct hid_field *field,
 	/* usage tests must precede field tests */
 	if (WACOM_BATTERY_USAGE(usage))
 		wacom_wac_battery_event(hdev, field, usage, value);
-	else if (WACOM_PAD_FIELD(field) && wacom->wacom_wac.pad_input)
+	else if (WACOM_PAD_FIELD(field))
 		wacom_wac_pad_event(hdev, field, usage, value);
 	else if (WACOM_PEN_FIELD(field) && wacom->wacom_wac.pen_input)
 		wacom_wac_pen_event(hdev, field, usage, value);
-- 
2.25.1

