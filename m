Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 409A55F2604
	for <lists+linux-input@lfdr.de>; Mon,  3 Oct 2022 00:44:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229476AbiJBWoi (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 2 Oct 2022 18:44:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229496AbiJBWoi (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 2 Oct 2022 18:44:38 -0400
X-Greylist: delayed 489 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sun, 02 Oct 2022 15:44:32 PDT
Received: from tschumacher.net (tschumacher.net [157.90.113.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FE7037409
        for <linux-input@vger.kernel.org>; Sun,  2 Oct 2022 15:44:32 -0700 (PDT)
Received: from [10.116.242.58] (unknown [185.209.196.136])
        by tschumacher.net (Postfix) with ESMTPSA id B21D81BF14C;
        Mon,  3 Oct 2022 00:36:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tschumacher.net;
        s=dkim; t=1664750178;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=zxdZSKdkUXQFNvb1bCK/YOQS6k7xhx78mYO2/scYdDs=;
        b=EDrztzDlu+ma1dDcgUPVAjlnhf7r8oEyud3HqckC9A97uIVjliGlTAKtOqYja2uYhsz0XG
        fGJ6Lfbj5JxDBd4Q2TazTAGKh0WcSywIPb5MKOuLUSVAylaWmZjEhqNZoWrHYPEvqQd1T9
        bRpKnJuHyXVet0V1R+syQFazwCb3mqc=
Message-ID: <20db9bf2-e901-5021-c4b2-7b1e7759ba9c@tschumacher.net>
Date:   Mon, 3 Oct 2022 00:36:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
From:   Tim Schumacher <tim@tschumacher.net>
Subject: [PATCH] hid-logitech-hidpp: holdable_thumb_buttons parameter for
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

Hi,

this is my first kernel patch, please be nice :)
The reason this can't be done in user space with a tool like xmodmap
(exception would be a user space driver) is that without making use of
the 0x1b04 feature the mouse sends nothing whatsoever when the thumb
buttons are pressed down so we can't handle those events. I discovered
this because the thumb buttons felt unresponsive on my mouse and it's
been bugging me since.

I'm not sure if other Logitech devices could benefit from this patch,
something in the spirit of "thumb buttons only activate on release" has
been said about the MX Master series mice on the Arch wiki but I'm not
sure if this is true or if the patch would work as-is. Hope this is not
too specific to get into the kernel.

Regards,
Tim

diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
index 81de88ab2..327116fb9 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -41,6 +41,11 @@ module_param(disable_tap_to_click, bool, 0644);
  MODULE_PARM_DESC(disable_tap_to_click,
  	"Disable Tap-To-Click mode reporting for touchpads (only on the K400 currently).");
  
+static bool holdable_thumb_buttons;
+module_param(holdable_thumb_buttons, bool, 0644);
+MODULE_PARM_DESC(holdable_thumb_buttons,
+	"Make it possible to hold down the thumb buttons (only on the MX Anywhere 3 currently).");
+
  #define REPORT_ID_HIDPP_SHORT			0x10
  #define REPORT_ID_HIDPP_LONG			0x11
  #define REPORT_ID_HIDPP_VERY_LONG		0x12
@@ -64,6 +69,7 @@ MODULE_PARM_DESC(disable_tap_to_click,
  #define HIDPP_QUIRK_CLASS_K400			BIT(2)
  #define HIDPP_QUIRK_CLASS_G920			BIT(3)
  #define HIDPP_QUIRK_CLASS_K750			BIT(4)
+#define HIDPP_QUIRK_CLASS_MX_ANYWHERE_3		BIT(5)
  
  /* bits 2..20 are reserved for classes */
  /* #define HIDPP_QUIRK_CONNECT_EVENTS		BIT(21) disabled */
@@ -3122,6 +3128,106 @@ static int k400_connect(struct hid_device *hdev, bool connected)
  	return k400_disable_tap_to_click(hidpp);
  }
  
+/* ------------------------------------------------------------------------- */
+/* Logitech MX Anywhere 3                                                    */
+/* ------------------------------------------------------------------------- */
+
+/*
+ * On the Logitech MX Anywhere 3 the thumb buttons only activate on release.
+ * This is because the mouse also uses those buttons as modifiers to enable
+ * horizontal scrolling with the mouse wheel.
+ *
+ * Users who don't care about horizontal scrolling and want properly
+ * functioning thumb buttons can set the holdable_thumb_buttons parameter.
+ * If it's set we use the feature 0x1b04 (special keys and mouse buttons)
+ * to divert thumb button events and handle them in software.
+ */
+
+#define HIDPP_PAGE_SPECIAL_KM_BTNS			0x1b04
+#define CMD_SPECIAL_KM_BTNS_SET_CID_REPORTING		0x31
+#define EVENT_SPECIAL_KM_BTNS_DIVERTED_BTNS_EVENT	0x00
+
+struct mx_anywhere_3_private_data {
+	u8 feature_index;
+};
+
+static int mx_anywhere_3_connect(struct hid_device *hdev, bool connected)
+{
+	struct hidpp_device *hidpp = hid_get_drvdata(hdev);
+	struct mx_anywhere_3_private_data *mxa3 = hidpp->private_data;
+	u8 feature_type;
+	int ret;
+	u8 params[5] = { 0 };
+	struct hidpp_report response;
+
+	if (!holdable_thumb_buttons)
+		return 0;
+
+	ret = hidpp_root_get_feature(hidpp, HIDPP_PAGE_SPECIAL_KM_BTNS,
+				     &mxa3->feature_index, &feature_type);
+
+	params[1] = 0x53; // BTN_SIDE
+	params[2] = BIT(1) | BIT(0); // dvalid=1 divert=1
+	ret = hidpp_send_fap_command_sync(hidpp, mxa3->feature_index,
+					  CMD_SPECIAL_KM_BTNS_SET_CID_REPORTING,
+					  params, sizeof(params), &response);
+
+	if (ret)
+		return ret;
+
+	params[1] = 0x56; // BTN_EXTRA
+	return hidpp_send_fap_command_sync(hidpp, mxa3->feature_index,
+					   CMD_SPECIAL_KM_BTNS_SET_CID_REPORTING,
+					   params, sizeof(params), &response);
+}
+
+static int mx_anywhere_3_raw_event(struct hid_device *hdev, u8 *data, int size)
+{
+	struct hidpp_device *hidpp = hid_get_drvdata(hdev);
+	struct mx_anywhere_3_private_data *mxa3 = hidpp->private_data;
+	struct hidpp_report *report = (struct hidpp_report *)data;
+	bool btn_side = 0, btn_extra = 0;
+	int i;
+
+	if (!mxa3->feature_index ||
+	    report->fap.feature_index != mxa3->feature_index ||
+	    report->fap.funcindex_clientid != EVENT_SPECIAL_KM_BTNS_DIVERTED_BTNS_EVENT)
+		return 0;
+
+	for (i = 0; i < 8; i++) {
+		switch (report->fap.params[i]) {
+			case 0x53:
+				btn_side = 1;
+				break;
+			case 0x56:
+				btn_extra = 1;
+				break;
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
+static int mx_anywhere_3_allocate(struct hid_device *hdev)
+{
+	struct hidpp_device *hidpp = hid_get_drvdata(hdev);
+	struct mx_anywhere_3_private_data *mxa3;
+
+	mxa3 = devm_kzalloc(&hdev->dev,
+			    sizeof(struct mx_anywhere_3_private_data),
+			    GFP_KERNEL);
+	if (!mxa3)
+		return -ENOMEM;
+
+	hidpp->private_data = mxa3;
+
+	return 0;
+};
+
  /* ------------------------------------------------------------------------- */
  /* Logitech G920 Driving Force Racing Wheel for Xbox One                     */
  /* ------------------------------------------------------------------------- */
@@ -3669,6 +3775,8 @@ static int hidpp_raw_event(struct hid_device *hdev, struct hid_report *report,
  		return wtp_raw_event(hdev, data, size);
  	else if (hidpp->quirks & HIDPP_QUIRK_CLASS_M560)
  		return m560_raw_event(hdev, data, size);
+	else if (hidpp->quirks & HIDPP_QUIRK_CLASS_MX_ANYWHERE_3)
+		return mx_anywhere_3_raw_event(hdev, data, size);
  
  	return 0;
  }
@@ -3880,6 +3988,10 @@ static void hidpp_connect_event(struct hidpp_device *hidpp)
  		ret = k400_connect(hdev, connected);
  		if (ret)
  			return;
+	} else if (hidpp->quirks & HIDPP_QUIRK_CLASS_MX_ANYWHERE_3) {
+		ret = mx_anywhere_3_connect(hdev, connected);
+		if (ret)
+			return;
  	}
  
  	if (hidpp->quirks & HIDPP_QUIRK_HIDPP_WHEELS) {
@@ -4102,6 +4214,10 @@ static int hidpp_probe(struct hid_device *hdev, const struct hid_device_id *id)
  		ret = k400_allocate(hdev);
  		if (ret)
  			return ret;
+	} else if (hidpp->quirks & HIDPP_QUIRK_CLASS_MX_ANYWHERE_3) {
+		ret = mx_anywhere_3_allocate(hdev);
+		if (ret)
+			return ret;
  	}
  
  	INIT_WORK(&hidpp->work, delayed_work_cb);
@@ -4275,6 +4391,8 @@ static const struct hid_device_id hidpp_devices[] = {
  	  LDJ_DEVICE(0x4082), .driver_data = HIDPP_QUIRK_HI_RES_SCROLL_X2121 },
  	{ /* Mouse Logitech Performance MX */
  	  LDJ_DEVICE(0x101a), .driver_data = HIDPP_QUIRK_HI_RES_SCROLL_1P0 },
+	{ /* Mouse Logitech MX Anywhere 3 */
+	  LDJ_DEVICE(0x4090), .driver_data = HIDPP_QUIRK_CLASS_MX_ANYWHERE_3 },
  	{ /* Keyboard logitech K400 */
  	  LDJ_DEVICE(0x4024),
  	  .driver_data = HIDPP_QUIRK_CLASS_K400 },
-- 
2.37.3
