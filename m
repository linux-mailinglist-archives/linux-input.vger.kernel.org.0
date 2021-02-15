Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4654F31C314
	for <lists+linux-input@lfdr.de>; Mon, 15 Feb 2021 21:40:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229627AbhBOUjx (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 15 Feb 2021 15:39:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:32199 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229646AbhBOUjv (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 15 Feb 2021 15:39:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1613421505;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=/VKAr0LDzSsP7+gN1iP6v70ytnbm03/E+xwfhNhADE0=;
        b=RNW0yxVMaoHtjFV/h4rr6pHSvK0kDnMg4wd3ouq8l8anQRxAn2O7LefxP6m2T3cLNdo4Yo
        uUeCt1epMYq1rfNYKVgBR+xaNFUEd/gi54Mieb9AYa+60F9Wd8IyNbqXjgm4jPktG1hlXC
        d+hr8Bc6bhq3LlWgC6lJz1R5NAtQPNs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-462-zK44XYk4M2S8P8rD6JuRTA-1; Mon, 15 Feb 2021 15:38:24 -0500
X-MC-Unique: zK44XYk4M2S8P8rD6JuRTA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1776CBBEE2;
        Mon, 15 Feb 2021 20:38:23 +0000 (UTC)
Received: from x1.localdomain (ovpn-115-74.ams2.redhat.com [10.36.115.74])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 25EBF5D9C0;
        Mon, 15 Feb 2021 20:38:22 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org
Subject: [PATCH 4/5] HID: lenovo: Map mic-mute button to KEY_F20 instead of KEY_MICMUTE
Date:   Mon, 15 Feb 2021 21:38:13 +0100
Message-Id: <20210215203814.699633-4-hdegoede@redhat.com>
In-Reply-To: <20210215203814.699633-1-hdegoede@redhat.com>
References: <20210215203814.699633-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Mapping the mic-mute button to KEY_MICMUTE is technically correct but
KEY_MICMUTE translates to a scancode of 256 (248 + 8) under X,
which does not fit in 8 bits, so it does not work.

Because of this userspace is expecting KEY_F20 instead,
theoretically KEY_MICMUTE should work under Wayland but even
there it does not work, because the desktop-environment is
listening only for KEY_F20 and not for KEY_MICMUTE.

Fixes: bc04b37ea0ec ("HID: lenovo: Add ThinkPad 10 Ultrabook Keyboard support")
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/hid/hid-lenovo.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/hid-lenovo.c b/drivers/hid/hid-lenovo.c
index 50ae770a4fb1..045c06ba0ab8 100644
--- a/drivers/hid/hid-lenovo.c
+++ b/drivers/hid/hid-lenovo.c
@@ -33,6 +33,9 @@
 
 #include "hid-ids.h"
 
+/* Userspace expects F20 for mic-mute KEY_MICMUTE does not work */
+#define LENOVO_KEY_MICMUTE KEY_F20
+
 struct lenovo_drvdata {
 	u8 led_report[3]; /* Must be first for proper alignment */
 	int led_state;
@@ -126,7 +129,7 @@ static int lenovo_input_mapping_tpkbd(struct hid_device *hdev,
 	if (usage->hid == (HID_UP_BUTTON | 0x0010)) {
 		/* This sub-device contains trackpoint, mark it */
 		hid_set_drvdata(hdev, (void *)1);
-		map_key_clear(KEY_MICMUTE);
+		map_key_clear(LENOVO_KEY_MICMUTE);
 		return 1;
 	}
 	return 0;
@@ -141,7 +144,7 @@ static int lenovo_input_mapping_cptkbd(struct hid_device *hdev,
 	    (usage->hid & HID_USAGE_PAGE) == HID_UP_LNVENDOR) {
 		switch (usage->hid & HID_USAGE) {
 		case 0x00f1: /* Fn-F4: Mic mute */
-			map_key_clear(KEY_MICMUTE);
+			map_key_clear(LENOVO_KEY_MICMUTE);
 			return 1;
 		case 0x00f2: /* Fn-F5: Brightness down */
 			map_key_clear(KEY_BRIGHTNESSDOWN);
@@ -231,7 +234,7 @@ static int lenovo_input_mapping_tp10_ultrabook_kbd(struct hid_device *hdev,
 			map_key_clear(KEY_FN_ESC);
 			return 1;
 		case 9: /* Fn-F4: Mic mute */
-			map_key_clear(KEY_MICMUTE);
+			map_key_clear(LENOVO_KEY_MICMUTE);
 			return 1;
 		case 10: /* Fn-F7: Control panel */
 			map_key_clear(KEY_CONFIG);
-- 
2.30.1

