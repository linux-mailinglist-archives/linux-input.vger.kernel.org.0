Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9D3F76CC793
	for <lists+linux-input@lfdr.de>; Tue, 28 Mar 2023 18:11:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231424AbjC1QLe (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 28 Mar 2023 12:11:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229809AbjC1QLd (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 28 Mar 2023 12:11:33 -0400
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4CED9EC4
        for <linux-input@vger.kernel.org>; Tue, 28 Mar 2023 09:11:32 -0700 (PDT)
Received: by mail-pl1-x632.google.com with SMTP id ja10so12168952plb.5
        for <linux-input@vger.kernel.org>; Tue, 28 Mar 2023 09:11:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1680019892;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lmvQbMnquHCs8y3TjlpGBkeBDRpreYiVTLtx4N4ZOyA=;
        b=SklTkt7XAlGaEiYlr3xZ6mZJZStfEYfCsBgZ38u0erR7RTofrxgEGwqFzusUYJa2S8
         K7Cr/pmLlNkqyTimm7SyThSvcsaETTO898sR8JNIDD1uGsVwTMbsDo1xYaE5KItPAfTK
         vV0ut56y40wHhiZ4vhjSYzimq8eaMiIePGaKU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680019892;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lmvQbMnquHCs8y3TjlpGBkeBDRpreYiVTLtx4N4ZOyA=;
        b=2rAzaUiGif54SmYad2HSSf6pF+lZ0eFO6ztNSfEa6phyPBfdGCEayBhG/GEJkKeF43
         G6JX2JI8Lr6sIOo8KyHHTt1GFrX1GcBj2ngQa7hmsYeza1hylyHoat1Eg12jivHJ4L0t
         Aa7dlY0Br/mY1779UOQlPRR54PVWg9GcXSJCjMO7w3E+ctswI7cb4Q7h5W2y0I0i1KAH
         tllX2CIh66Za35igNgyOJ0QWIiCAyInTlsWy2FYn0PUiw2ibMNRgs3JcoQG7A3hf5v2W
         1u+MK3gE7yvv6QIRw2YrOagjCDDZGEzt6dLd4CFRXxD0n0/EV5kVeJgoEs98ueYTyVcb
         rI5w==
X-Gm-Message-State: AAQBX9d8vcgBSevofhcD62M7LYIbOFFRwf2NvmNRAxV46l3eu87tPMC3
        9DqaJF2aVUG48rkb2glvVaUOVA==
X-Google-Smtp-Source: AKy350bAutE4/131jvJcnXx7/MbiMcMc1xssMkpPAPX4tTQMeLm2dW7fSD/Nbd68x8GDIY2V2wtpVg==
X-Received: by 2002:a17:90b:4a02:b0:234:ba34:71bf with SMTP id kk2-20020a17090b4a0200b00234ba3471bfmr16897442pjb.1.1680019892454;
        Tue, 28 Mar 2023 09:11:32 -0700 (PDT)
Received: from torsha.c.googlers.com.com (209.148.168.34.bc.googleusercontent.com. [34.168.148.209])
        by smtp.gmail.com with ESMTPSA id kq3-20020a17090aed0300b0023d0d50edf2sm6264348pjb.42.2023.03.28.09.11.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Mar 2023 09:11:32 -0700 (PDT)
From:   Torsha Banerjee <torsha@chromium.org>
X-Google-Original-From: Torsha Banerjee <torsha@google.com>
To:     u-boot@lists.denx.de
Cc:     Jora Jacobi <jora@google.com>, Torsha Banerjee <torsha@google.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Jiri Kosina <jikos@kernel.org>, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] Series-to: Fred Bloggs <f.blogs@napier.co.nz> Series-cc: Sean O'Brien <seobrien@chromium.org> HID: input:  Restore missing cursor for digitizer devices
Date:   Tue, 28 Mar 2023 16:11:22 +0000
Message-Id: <20230328161119.1.I40a8881b83b0e440ed5368d98b42a2d9a0c105aa@changeid>
X-Mailer: git-send-email 2.40.0.348.gf938b09366-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Jora Jacobi <jora@google.com>

A previously committed patch to remove cursors for HID Digitizer-Pen
devices also removed the cursors for some tablets which have incorrect HID
descriptors. These devices should enumerate with Usage ID "Digitizer"
instead of Usage ID "Pen".

Patch which introduced the issue: commit 8473a93d1ba5
("HID: input: Set INPUT_PROP_-property for HID_UP_DIGITIZERS")

Changes-
Add HID quirk HID_QUIRK_DEVICE_IS_DIGITIZER
Quirk will force INPUT_PROP_POINTER for HID Digitizers
Apply quirk to Huion tablets
Apply quirk to UGEE/XP-Pen tablets based on device ID

Signed-off-by: Torsha Banerjee <torsha@google.com>
---

 drivers/hid/hid-input.c  | 3 ++-
 drivers/hid/hid-quirks.c | 9 +++++++++
 include/linux/hid.h      | 2 ++
 3 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/hid-input.c b/drivers/hid/hid-input.c
index 7fc967964dd8..f0c67baddc8d 100644
--- a/drivers/hid/hid-input.c
+++ b/drivers/hid/hid-input.c
@@ -927,7 +927,8 @@ static void hidinput_configure_usage(struct hid_input *hidinput, struct hid_fiel
 		break;
 
 	case HID_UP_DIGITIZER:
-		if ((field->application & 0xff) == 0x01) /* Digitizer */
+		if (((field->application & 0xff) == 0x01) ||
+			(device->quirks & HID_QUIRK_DEVICE_IS_DIGITIZER)) /* Digitizer */
 			__set_bit(INPUT_PROP_POINTER, input->propbit);
 		else if ((field->application & 0xff) == 0x02) /* Pen */
 			__set_bit(INPUT_PROP_DIRECT, input->propbit);
diff --git a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
index 66e64350f138..094fe4c4f3b3 100644
--- a/drivers/hid/hid-quirks.c
+++ b/drivers/hid/hid-quirks.c
@@ -102,6 +102,8 @@ static const struct hid_device_id hid_quirks[] = {
 	{ HID_USB_DEVICE(USB_VENDOR_ID_HP, USB_PRODUCT_ID_HP_PIXART_OEM_USB_OPTICAL_MOUSE_0941), HID_QUIRK_ALWAYS_POLL },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_HP, USB_PRODUCT_ID_HP_PIXART_OEM_USB_OPTICAL_MOUSE_0641), HID_QUIRK_ALWAYS_POLL },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_HP, USB_PRODUCT_ID_HP_PIXART_OEM_USB_OPTICAL_MOUSE_1f4a), HID_QUIRK_ALWAYS_POLL },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_HUION, USB_DEVICE_ID_HUION_HS64), HID_QUIRK_DEVICE_IS_DIGITIZER },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_HUION, USB_DEVICE_ID_HUION_TABLET), HID_QUIRK_DEVICE_IS_DIGITIZER },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_IDEACOM, USB_DEVICE_ID_IDEACOM_IDC6680), HID_QUIRK_MULTI_INPUT },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_INNOMEDIA, USB_DEVICE_ID_INNEX_GENESIS_ATARI), HID_QUIRK_MULTI_INPUT },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_KYE, USB_DEVICE_ID_KYE_EASYPEN_M610X), HID_QUIRK_MULTI_INPUT },
@@ -1298,6 +1300,13 @@ unsigned long hid_lookup_quirk(const struct hid_device *hdev)
 		quirks = hid_gets_squirk(hdev);
 	mutex_unlock(&dquirks_lock);
 
+	/*
+	 * UGEE/XP-Pen HID Pen devices which have 0x0-0x9 as the low nibble
+	 * of the device ID are actually digitizers, not HID Pen devices
+	 */
+	if (hdev->vendor == USB_VENDOR_ID_UGEE && (hdev->product & 0x0F) <= 0x09)
+		quirks |= HID_QUIRK_DEVICE_IS_DIGITIZER;
+
 	return quirks;
 }
 EXPORT_SYMBOL_GPL(hid_lookup_quirk);
diff --git a/include/linux/hid.h b/include/linux/hid.h
index 1ea8c7a3570b..c9cc81e85a33 100644
--- a/include/linux/hid.h
+++ b/include/linux/hid.h
@@ -352,8 +352,10 @@ struct hid_item {
 /* BIT(9) reserved for backward compatibility, was NO_INIT_INPUT_REPORTS */
 #define HID_QUIRK_ALWAYS_POLL			BIT(10)
 #define HID_QUIRK_INPUT_PER_APP			BIT(11)
+
 #define HID_QUIRK_X_INVERT			BIT(12)
 #define HID_QUIRK_Y_INVERT			BIT(13)
+#define HID_QUIRK_DEVICE_IS_DIGITIZER		BIT(14)
 #define HID_QUIRK_SKIP_OUTPUT_REPORTS		BIT(16)
 #define HID_QUIRK_SKIP_OUTPUT_REPORT_ID		BIT(17)
 #define HID_QUIRK_NO_OUTPUT_REPORTS_ON_INTR_EP	BIT(18)
-- 
2.40.0.348.gf938b09366-goog

