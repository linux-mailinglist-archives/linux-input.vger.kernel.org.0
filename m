Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C1B9E5F2ECC
	for <lists+linux-input@lfdr.de>; Mon,  3 Oct 2022 12:29:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229529AbiJCK3Y (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 3 Oct 2022 06:29:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229476AbiJCK3W (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 3 Oct 2022 06:29:22 -0400
Received: from tschumacher.net (tschumacher.net [157.90.113.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87AE11DF06
        for <linux-input@vger.kernel.org>; Mon,  3 Oct 2022 03:29:21 -0700 (PDT)
Received: from [10.116.242.58] (unknown [185.209.196.136])
        by tschumacher.net (Postfix) with ESMTPSA id 1F0B71BF498;
        Mon,  3 Oct 2022 12:29:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tschumacher.net;
        s=dkim; t=1664792959;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=JzQLbyyiugeZ3aDJdlaJvZSTXrCcRYN/M0c8+ZXjuWs=;
        b=Wek5czbUxv2EVK1WFNmn+/tKy/s6vjS6NNJs6RbllKHj3f9QlIIJFKVfQ2sx/OpoXbLXfA
        tLwuI1kr0Y0NFd5lOTEyLMWvK3UrLQTmn1MJJfMB3PgbRJhO2hO5eGi46JQKPZFuLHj+Vl
        k6IRAPTB53qEULM49B36SLzyNnjlCPo=
Message-ID: <caee392f-27fb-dff2-6a7e-f58d2d90cc8e@tschumacher.net>
Date:   Mon, 3 Oct 2022 12:29:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
From:   Tim Schumacher <tim@tschumacher.net>
Subject: [PATCH v2] hid-logitech-hidpp: holdable_thumb_buttons parameter for
 Logitech MX Anywhere 3
To:     linux-input@vger.kernel.org
Cc:     =?UTF-8?Q?Filipe_La=c3=adns?= <lains@riseup.net>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On the Logitech MX Anywhere 3 the thumb buttons only activate on release.
This is because the mouse also uses those buttons as modifiers to enable
horizontal scrolling with the mouse wheel. This patch adds the
holdable_thumb_buttons module parameter. Users who don't care about
horizontal scrolling and want properly functioning thumb buttons can set
this parameter. If it's set we use the feature 0x1b04 (special keys and
mouse buttons) to divert thumb button events and handle them in software.

Signed-off-by: Tim Schumacher <tim@tschumacher.net>
---

Thanks for your feedback Bastien! I made the following changes:

* Gate setting by feature 0x1b04 instead of specific device ID
* Style fixes and no magic numbers

diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
index 81de88ab2..25af6aaca 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -41,6 +41,11 @@ module_param(disable_tap_to_click, bool, 0644);
  MODULE_PARM_DESC(disable_tap_to_click,
  	"Disable Tap-To-Click mode reporting for touchpads (only on the K400 currently).");
  
+static bool holdable_thumb_buttons;
+module_param(holdable_thumb_buttons, bool, 0644);
+MODULE_PARM_DESC(holdable_thumb_buttons,
+	"Make it possible to hold down the thumb buttons (tested only on the MX Anywhere 3).");
+
  #define REPORT_ID_HIDPP_SHORT			0x10
  #define REPORT_ID_HIDPP_LONG			0x11
  #define REPORT_ID_HIDPP_VERY_LONG		0x12
@@ -204,6 +209,7 @@ struct hidpp_device {
  	struct hidpp_scroll_counter vertical_wheel_counter;
  
  	u8 wireless_feature_index;
+	u8 special_km_btns_feature_index;
  };
  
  /* HID++ 1.0 error codes */
@@ -1726,6 +1732,25 @@ static int hidpp_set_wireless_feature_index(struct hidpp_device *hidpp)
  	return ret;
  }
  
+/* -------------------------------------------------------------------------- */
+/* 0x1b04: Special keys and mouse buttons                                     */
+/* -------------------------------------------------------------------------- */
+
+#define HIDPP_PAGE_SPECIAL_KM_BTNS				0x1b04
+
+static int hidpp_set_special_km_btns_feature_index(struct hidpp_device *hidpp)
+{
+	u8 feature_type;
+	int ret;
+
+	ret = hidpp_root_get_feature(hidpp,
+				     HIDPP_PAGE_SPECIAL_KM_BTNS,
+				     &hidpp->special_km_btns_feature_index,
+				     &feature_type);
+
+	return ret;
+}
+
  /* -------------------------------------------------------------------------- */
  /* 0x2120: Hi-resolution scrolling                                            */
  /* -------------------------------------------------------------------------- */
@@ -3122,6 +3147,79 @@ static int k400_connect(struct hid_device *hdev, bool connected)
  	return k400_disable_tap_to_click(hidpp);
  }
  
+/* ------------------------------------------------------------------------- */
+/* Holdable thumb buttons                                                    */
+/* ------------------------------------------------------------------------- */
+
+/*
+ * On the Logitech MX Anywhere 3 the thumb buttons only active on release.
+ * This is because the mouse also uses those buttons as modifiers to enable
+ * horizontal scrolling with the mouse wheel.
+ *
+ * Users who don't care about horizontal scrolling and want properly
+ * functioning thumb buttons can set the holdable_thumb_buttons parameter.
+ * If it's set we use the feature 0x1b04 (special keys and mouse buttons)
+ * to divert thumb button events and handle them in software.
+ */
+
+#define CMD_SPECIAL_KM_BTNS_SET_CID_REPORTING		0x31
+#define EVENT_SPECIAL_KM_BTNS_DIVERTED_BTNS_EVENT	0x00
+
+#define CID_BTN_SIDE	0x53
+#define CID_BTN_EXTRA	0x56
+
+static int holdable_thumb_buttons_connect(struct hidpp_device *hidpp)
+{
+	u8 feature_type;
+	int ret;
+	u8 params[5] = { 0 };
+	struct hidpp_report response;
+
+	params[1] = CID_BTN_SIDE;
+	params[2] = BIT(1) | BIT(0); /* dvalid=1 divert=1 */
+	ret = hidpp_send_fap_command_sync(hidpp,
+					  hidpp->special_km_btns_feature_index,
+					  CMD_SPECIAL_KM_BTNS_SET_CID_REPORTING,
+					  params, sizeof(params), &response);
+
+	if (ret)
+		return ret;
+
+	params[1] = CID_BTN_EXTRA;
+	return hidpp_send_fap_command_sync(hidpp,
+					   hidpp->special_km_btns_feature_index,
+					   CMD_SPECIAL_KM_BTNS_SET_CID_REPORTING,
+					   params, sizeof(params), &response);
+}
+
+static int holdable_thumb_buttons_event(struct hidpp_device *hidpp, u8 *data, int size)
+{
+	struct hidpp_report *report = (struct hidpp_report *)data;
+	bool btn_side = 0, btn_extra = 0;
+	int i;
+
+	if (report->fap.feature_index != hidpp->special_km_btns_feature_index ||
+	    report->fap.funcindex_clientid != EVENT_SPECIAL_KM_BTNS_DIVERTED_BTNS_EVENT)
+		return 0;
+
+	for (i = 0; i < 8; i++) {
+		switch (report->fap.params[i]) {
+		case CID_BTN_SIDE:
+			btn_side = 1;
+			break;
+		case CID_BTN_EXTRA:
+			btn_extra = 1;
+			break;
+		}
+	}
+
+	input_report_key(hidpp->input, BTN_SIDE, btn_side);
+	input_report_key(hidpp->input, BTN_EXTRA, btn_extra);
+
+	input_sync(hidpp->input);
+	return 1;
+}
+
  /* ------------------------------------------------------------------------- */
  /* Logitech G920 Driving Force Racing Wheel for Xbox One                     */
  /* ------------------------------------------------------------------------- */
@@ -3620,6 +3718,12 @@ static int hidpp_raw_hidpp_event(struct hidpp_device *hidpp, u8 *data,
  			return ret;
  	}
  
+	if (holdable_thumb_buttons && hidpp->special_km_btns_feature_index) {
+		ret = holdable_thumb_buttons_event(hidpp, data, size);
+		if (ret != 0)
+			return ret;
+	}
+
  	return 0;
  }
  
@@ -3900,6 +4004,12 @@ static void hidpp_connect_event(struct hidpp_device *hidpp)
  			return;
  	}
  
+	if (holdable_thumb_buttons && hidpp->special_km_btns_feature_index) {
+		ret = holdable_thumb_buttons_connect(hidpp);
+		if (ret)
+			return;
+	}
+
  	/* the device is already connected, we can ask for its name and
  	 * protocol */
  	if (!hidpp->protocol_major) {
@@ -4157,6 +4267,14 @@ static int hidpp_probe(struct hid_device *hdev, const struct hid_device_id *id)
  			goto hid_hw_init_fail;
  	}
  
+	if (connected && hidpp->protocol_major >= 2) {
+		ret = hidpp_set_special_km_btns_feature_index(hidpp);
+		if (ret == -ENOENT)
+			hidpp->special_km_btns_feature_index = 0;
+		else if (ret)
+			goto hid_hw_init_fail;
+	}
+
  	if (connected && (hidpp->quirks & HIDPP_QUIRK_CLASS_WTP)) {
  		ret = wtp_get_config(hidpp);
  		if (ret)
