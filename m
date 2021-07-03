Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1DED3BAA66
	for <lists+linux-input@lfdr.de>; Sun,  4 Jul 2021 00:02:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229874AbhGCWFG (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 3 Jul 2021 18:05:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229818AbhGCWFC (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sat, 3 Jul 2021 18:05:02 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F7B0C061764;
        Sat,  3 Jul 2021 15:02:28 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id t3so18394514edc.7;
        Sat, 03 Jul 2021 15:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6NWHzNIVgTYrqzEJ/wMRZOIsI/zAzKZABgGCwsk3RCM=;
        b=dte5+mQfRU0pGl3J6Xq3F/7bKDp/g9/gsVcHeew4UGwXVYKN/tyrFYnn6JXgUmmmVm
         /gZESB+JVmF5T5o2DiEiLUrQpe/VgJRZIZxopzVUnFdQ2F6PfT7TxczPdsXIwensQsSB
         ThDdFLLkUUyTMWtRDtPo+f7u2lCH2ZoXYJOL/aUKab1beuP0y8uhaY973sPqpVsb78Rc
         KnP3Y85eNIOx7JBSJTAvJfAYDkIvFcHsylufio0GEJMgsnsW4fn/UVma6NWP0NrXGGdW
         /mZIaoHMbfYbkMVOsgEb5eAojBX6qmYmxVkhaFv087mwvLirHTtYZts5//qkVz1ikU0E
         P5jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6NWHzNIVgTYrqzEJ/wMRZOIsI/zAzKZABgGCwsk3RCM=;
        b=Av9+Xrx/zm5FzcIzlLgI2bC88TxfAscW75SGR/usAtg4GOIOExAOGILBHfMw4+2lBc
         zCbPvtaxdO14bvbzao5wEet5h7L91l9rBOahnrhTCwFLh4U8jnuAbREy6w8JIrkEIsWq
         PiGwPIBLekjs2TsYfb0MytBv0I577I0MDP7TXsrSXliZDoZARxDgL0jK3bb8AkzzE0za
         8cvVf9z76YFCpYSZhjG6hTi2BKKnZEosE9Yh6zR7HofoELM95xozinrvLJ8gn8meYnK4
         9RnCLIQrhiGBFhTke9Uwpfi+phRPoL+y8atSKR1+2xukH1bD3Zc+c1JdJA752Zhs97Je
         tvqQ==
X-Gm-Message-State: AOAM53328xyBL5FAkuwFqLFRnEMXTLvET+ugVDWrSUBLo5EzW2be5aR9
        OTL8TyG07gQVTeSUxKlL5Do=
X-Google-Smtp-Source: ABdhPJyxrt188AFeT5cWtDDaKJ6m5O7ShihoeaRWzNuWQhLh0RKVAEtLS/yUb9BDqRNYbl8BbVyn/w==
X-Received: by 2002:a05:6402:2681:: with SMTP id w1mr7090616edd.275.1625349747157;
        Sat, 03 Jul 2021 15:02:27 -0700 (PDT)
Received: from warrior.lan ([2a03:7380:2407:bc63:7e28:eb67:305b:8ba0])
        by smtp.gmail.com with ESMTPSA id b25sm3186110edv.9.2021.07.03.15.02.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Jul 2021 15:02:26 -0700 (PDT)
From:   Maxim Mikityanskiy <maxtram95@gmail.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Daniel Kurtz <djkurtz@chromium.org>,
        Oliver Neukum <oneukum@suse.de>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Maxim Mikityanskiy <maxtram95@gmail.com>
Subject: [PATCH 2/6] HID: hid-input: Add phone hook and mic mute buttons for headsets
Date:   Sun,  4 Jul 2021 01:01:58 +0300
Message-Id: <20210703220202.5637-3-maxtram95@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210703220202.5637-1-maxtram95@gmail.com>
References: <20210703220202.5637-1-maxtram95@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

A lot of USBHID headsets available on the market have buttons to toggle
microphone mute and to answer the call/hang up.

According to the HID Usage Tables specification, these usages are on/off
controls, which may be presented by either two buttons, a single toggle
button or a mechanical switch. This commit adds a function called
hidinput_handle_onoff that handles all these cases in a compliant way.

Signed-off-by: Maxim Mikityanskiy <maxtram95@gmail.com>
---
 drivers/hid/hid-input.c                | 140 +++++++++++++++++++++++++
 include/uapi/linux/input-event-codes.h |   8 ++
 2 files changed, 148 insertions(+)

diff --git a/drivers/hid/hid-input.c b/drivers/hid/hid-input.c
index 44b8243f9924..533a7f429a5f 100644
--- a/drivers/hid/hid-input.c
+++ b/drivers/hid/hid-input.c
@@ -579,6 +579,43 @@ static bool hidinput_field_in_collection(struct hid_device *device, struct hid_f
 	return collection->type == type && collection->usage == usage;
 }
 
+/**
+ * hidinput_get_onoff_keycodes - Gets on and off keycodes for OOC usages.
+ * @usage: HID usage.
+ * @code_on: Output parameter for the on keycode.
+ * @code_off: Output parameter for the off keycode.
+ *
+ * Returns true if @usage is a supported on/off control (OOC), as defined by HID
+ * Usage Tables 1.21 (3.4.1.2).
+ *
+ * Depending on the OOC type, we need to send either a toggle keycode or
+ * separate on/off keycodes. This function detects whether @usage is an OOC. If
+ * yes, and if this OOC is supported, it returns the on and off keycodes
+ * corresponding to the toggle keycode stored in usage->code.
+ */
+static bool hidinput_get_onoff_keycodes(struct hid_usage *usage,
+					u16 *code_on, u16 *code_off)
+{
+	if (usage->type != EV_KEY)
+		return false;
+
+	if ((usage->hid & HID_USAGE_PAGE) != HID_UP_TELEPHONY)
+		return false;
+
+	switch (usage->code) {
+	case KEY_TOGGLE_PHONE:
+		*code_on = KEY_PICKUP_PHONE;
+		*code_off = KEY_HANGUP_PHONE;
+		return true;
+	case KEY_MICMUTE:
+		*code_on = KEY_MICMUTE_ON;
+		*code_off = KEY_MICMUTE_OFF;
+		return true;
+	}
+
+	return false;
+}
+
 static void hidinput_configure_usage(struct hid_input *hidinput, struct hid_field *field,
 				     struct hid_usage *usage)
 {
@@ -586,6 +623,7 @@ static void hidinput_configure_usage(struct hid_input *hidinput, struct hid_fiel
 	struct hid_device *device = input_get_drvdata(input);
 	int max = 0, code;
 	unsigned long *bit = NULL;
+	u16 code_on, code_off;
 
 	field->hidinput = hidinput;
 
@@ -887,6 +925,7 @@ static void hidinput_configure_usage(struct hid_input *hidinput, struct hid_fiel
 
 	case HID_UP_TELEPHONY:
 		switch (usage->hid & HID_USAGE) {
+		case 0x20: map_key_clear(KEY_TOGGLE_PHONE);	break;
 		case 0x2f: map_key_clear(KEY_MICMUTE);		break;
 		case 0xb0: map_key_clear(KEY_NUMERIC_0);	break;
 		case 0xb1: map_key_clear(KEY_NUMERIC_1);	break;
@@ -1198,6 +1237,11 @@ static void hidinput_configure_usage(struct hid_input *hidinput, struct hid_fiel
 
 	set_bit(usage->type, input->evbit);
 
+	if (hidinput_get_onoff_keycodes(usage, &code_on, &code_off)) {
+		set_bit(code_on, bit);
+		set_bit(code_off, bit);
+	}
+
 	/*
 	 * This part is *really* controversial:
 	 * - HID aims at being generic so we should do our best to export
@@ -1314,6 +1358,92 @@ static void hidinput_handle_scroll(struct hid_usage *usage,
 	input_event(input, EV_REL, usage->code, hi_res);
 }
 
+/**
+ * hidinput_handle_onoff - Handle on/off control (OOC).
+ * @field: HID field that corresponds to the event.
+ * @value: HID value that corresponds to the event.
+ * @code_toggle: Key code to send when toggling state of the on/off control.
+ * @code_on: Key code to send when turning on the on/off control.
+ * @code_off: Key code to send when turning off the on/off control.
+ *
+ * Returns true if the event was handled, false if the @field flags are invalid.
+ *
+ * Handles on/off control (OOC), as defined by HID Usage Tables 1.21 (3.4.1.2).
+ * Determines the type of the OOC by looking at @field and sends one of the key
+ * codes accordingly. Whenever it's possible to distinguish on and off states,
+ * different key strokes (@code_on, @code_off) are sent, otherwise @code_toggle
+ * is sent.
+ */
+static bool hidinput_handle_onoff(struct hid_field *field, __s32 value, unsigned int scan,
+				  __u16 code_toggle, __u16 code_on, __u16 code_off)
+{
+	struct input_dev *input = field->hidinput->input;
+	__u16 code = 0;
+
+	/* Two buttons, on and off */
+	if ((field->flags & HID_MAIN_ITEM_RELATIVE) &&
+	    (field->flags & HID_MAIN_ITEM_NO_PREFERRED) &&
+	    (field->logical_minimum == -1) &&
+	    (field->logical_maximum == 1)) {
+		if (value != 1 && value != -1)
+			return true;
+
+		code = value == 1 ? code_on : code_off;
+	}
+
+	/* A single button that toggles the on/off state each time it is pressed */
+	if ((field->flags & HID_MAIN_ITEM_RELATIVE) &&
+	    !(field->flags & HID_MAIN_ITEM_NO_PREFERRED) &&
+	    (field->logical_minimum == 0) &&
+	    (field->logical_maximum == 1)) {
+		if (value != 1)
+			return true;
+
+		code = code_toggle;
+	}
+
+	/* A toggle switch that maintains the on/off state mechanically */
+	if (!(field->flags & HID_MAIN_ITEM_RELATIVE) &&
+	    (field->flags & HID_MAIN_ITEM_NO_PREFERRED) &&
+	    (field->logical_minimum == 0) &&
+	    (field->logical_maximum == 1))
+		code = value ? code_on : code_off;
+
+	if (!code)
+		return false;
+
+	input_event(input, EV_MSC, MSC_SCAN, scan);
+	input_event(input, EV_KEY, code, 1);
+	input_sync(input);
+	input_event(input, EV_KEY, code, 0);
+
+	return true;
+}
+
+/**
+ * hidinput_handle_onoffs - Handles an OOC event if the HID usage type is OOC.
+ * @usage: HID usage to check.
+ * @field: HID field that corresponds to the event.
+ * @value: HID value that corresponds to the event.
+ *
+ * Returns: 1 if @usage is a supported on/off control (OOC), as defined by HID
+ *          Usage Tables 1.21 (3.4.1.2).
+ *          0 if @usage is not a supported OOC.
+ *          -EINVAL if @usage is not a valid OOC (@field is invalid).
+ */
+static int hidinput_handle_onoffs(struct hid_usage *usage, struct hid_field *field, __s32 value)
+{
+	u16 code_on, code_off;
+
+	if (!hidinput_get_onoff_keycodes(usage, &code_on, &code_off))
+		return 0;
+
+	if (!hidinput_handle_onoff(field, value, usage->hid, usage->code, code_on, code_off))
+		return -EINVAL;
+
+	return 1;
+}
+
 void hidinput_hid_event(struct hid_device *hid, struct hid_field *field, struct hid_usage *usage, __s32 value)
 {
 	struct input_dev *input;
@@ -1438,6 +1568,16 @@ void hidinput_hid_event(struct hid_device *hid, struct hid_field *field, struct
 	    value == field->value[usage->usage_index])
 		return;
 
+	switch (hidinput_handle_onoffs(usage, field, value)) {
+	case 1:
+		return;
+	case -EINVAL:
+		hid_warn_once(hid, "Invalid OOC usage: code %u, flags %#x, min %d, max %d\n",
+			      usage->code, field->flags,
+			      field->logical_minimum, field->logical_maximum);
+		return;
+	}
+
 	/* report the usage code as scancode if the key status has changed */
 	if (usage->type == EV_KEY &&
 	    (!test_bit(usage->code, input->key)) == value)
diff --git a/include/uapi/linux/input-event-codes.h b/include/uapi/linux/input-event-codes.h
index dd785a5b5076..d490de9ce7fe 100644
--- a/include/uapi/linux/input-event-codes.h
+++ b/include/uapi/linux/input-event-codes.h
@@ -518,6 +518,7 @@
 #define KEY_NOTIFICATION_CENTER	0x1bc	/* Show/hide the notification center */
 #define KEY_PICKUP_PHONE	0x1bd	/* Answer incoming call */
 #define KEY_HANGUP_PHONE	0x1be	/* Decline incoming call */
+#define KEY_TOGGLE_PHONE	0x1bf	/* Toggle phone hook */
 
 #define KEY_DEL_EOL		0x1c0
 #define KEY_DEL_EOS		0x1c1
@@ -660,6 +661,13 @@
 /* Select an area of screen to be copied */
 #define KEY_SELECTIVE_SCREENSHOT	0x27a
 
+/*
+ * In contrast to KEY_MICMUTE (that toggles the mute state), these set specific
+ * (on/off) states.
+ */
+#define KEY_MICMUTE_ON			0x280
+#define KEY_MICMUTE_OFF			0x281
+
 /*
  * Some keyboards have keys which do not have a defined meaning, these keys
  * are intended to be programmed / bound to macros by the user. For most
-- 
2.32.0

