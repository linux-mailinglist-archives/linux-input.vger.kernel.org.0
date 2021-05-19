Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2278B389333
	for <lists+linux-input@lfdr.de>; Wed, 19 May 2021 18:04:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346972AbhESQFg (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 19 May 2021 12:05:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241482AbhESQFe (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 19 May 2021 12:05:34 -0400
Received: from todd.t-8ch.de (todd.t-8ch.de [IPv6:2a01:4f8:c010:41de::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9D8CC06175F
        for <linux-input@vger.kernel.org>; Wed, 19 May 2021 09:04:11 -0700 (PDT)
From:   =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=weissschuh.net;
        s=mail; t=1621440246;
        bh=HjX1XlOaRqJLsyW2CK3RwmEjpoWJVREThQk49QVY79g=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=pSaoOsZLSSK4+Z5Py33kpGAnpxsQ88TsVV86OrAler9Qi8Q+/a/IQmZ9sAh+ZkzhB
         3FiMXSwGbT/tsMqizSvktVCEU34Q2ZuSl6kfwsQw12lY/PhPLOLdz6kl03OgzVo9w1
         YipaCSdlZARTBl3n4tGjYE+e94gBKWXPf1Mxu2tE=
To:     linux-input@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Hans de Goede <hdegoede@redhat.com>
Cc:     =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas@t-8ch.de>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] HID: input: Add support for Programmable Buttons
Date:   Wed, 19 May 2021 18:03:49 +0200
Message-Id: <20210519160349.609690-1-linux@weissschuh.net>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <61dcf8c7-2dcb-4173-fbbd-9adf3412edb7@redhat.com>
References: <61dcf8c7-2dcb-4173-fbbd-9adf3412edb7@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Thomas Weißschuh <thomas@t-8ch.de>

Map them to KEY_MACRO# event codes.

These buttons are defined by HID as follows:
"The user defines the function of these buttons to control software
applications or GUI objects."

This matches the semantics of the KEY_MACRO# input event codes that
Linux supports.

Signed-off-by: Thomas Weißschuh <thomas@t-8ch.de>
---
 drivers/hid/hid-debug.c | 11 +++++++++++
 drivers/hid/hid-input.c |  1 +
 2 files changed, 12 insertions(+)

diff --git a/drivers/hid/hid-debug.c b/drivers/hid/hid-debug.c
index 59f8d716d78f..0e76d9b4530a 100644
--- a/drivers/hid/hid-debug.c
+++ b/drivers/hid/hid-debug.c
@@ -122,6 +122,7 @@ static const struct hid_usage_entry hid_usage_table[] = {
   {  9, 0, "Button" },
   { 10, 0, "Ordinal" },
   { 12, 0, "Consumer" },
+      {0, 0x003, "ProgrammableButtons"},
       {0, 0x238, "HorizontalWheel"},
   { 13, 0, "Digitizers" },
     {0, 0x01, "Digitizer"},
@@ -939,6 +940,16 @@ static const char *keys[KEY_MAX + 1] = {
 	[KEY_KBDINPUTASSIST_NEXTGROUP] = "KbdInputAssistNextGroup",
 	[KEY_KBDINPUTASSIST_ACCEPT] = "KbdInputAssistAccept",
 	[KEY_KBDINPUTASSIST_CANCEL] = "KbdInputAssistCancel",
+	[KEY_MACRO1] = "Macro1", [KEY_MACRO2] = "Macro2", [KEY_MACRO3] = "Macro3",
+	[KEY_MACRO4] = "Macro4", [KEY_MACRO5] = "Macro5", [KEY_MACRO6] = "Macro6",
+	[KEY_MACRO7] = "Macro7", [KEY_MACRO8] = "Macro8", [KEY_MACRO9] = "Macro9",
+	[KEY_MACRO10] = "Macro10", [KEY_MACRO11] = "Macro11", [KEY_MACRO12] = "Macro12",
+	[KEY_MACRO13] = "Macro13", [KEY_MACRO14] = "Macro14", [KEY_MACRO15] = "Macro15",
+	[KEY_MACRO16] = "Macro16", [KEY_MACRO17] = "Macro17", [KEY_MACRO18] = "Macro18",
+	[KEY_MACRO19] = "Macro19", [KEY_MACRO20] = "Macro20", [KEY_MACRO21] = "Macro21",
+	[KEY_MACRO22] = "Macro22", [KEY_MACRO23] = "Macro23", [KEY_MACRO24] = "Macro24",
+	[KEY_MACRO25] = "Macro25", [KEY_MACRO26] = "Macro26", [KEY_MACRO27] = "Macro27",
+	[KEY_MACRO28] = "Macro28", [KEY_MACRO29] = "Macro29", [KEY_MACRO30] = "Macro30",
 };
 
 static const char *relatives[REL_MAX + 1] = {
diff --git a/drivers/hid/hid-input.c b/drivers/hid/hid-input.c
index 18f5e28d475c..7d4dee58d869 100644
--- a/drivers/hid/hid-input.c
+++ b/drivers/hid/hid-input.c
@@ -632,6 +632,7 @@ static void hidinput_configure_usage(struct hid_input *hidinput, struct hid_fiel
 				else
 					code += BTN_TRIGGER_HAPPY - 0x10;
 				break;
+		case HID_CP_CONSUMER_CONTROL: code += KEY_MACRO1; break;
 		default:
 			switch (field->physical) {
 			case HID_GD_MOUSE:

base-commit: efd8929b9eec1cde120abb36d76dd00ff6711023
-- 
2.31.1

