Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EBD4A320546
	for <lists+linux-input@lfdr.de>; Sat, 20 Feb 2021 13:26:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229725AbhBTM0Z (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 20 Feb 2021 07:26:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31784 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229724AbhBTM0Y (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 20 Feb 2021 07:26:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1613823899;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=X5CIuI1s7IVeEdEXarLGml6zrn2PXqsJEqYQsNgwU84=;
        b=fShf9EwUPvPekSldvzWDkY9FtL+XtOCd6CEDYSKaRG+bbZ0+LHFX7R4xKPyoPoRA87+JF/
        jxxiF0swWtCtsN8UMZkNUcNW902uj0NbsD1TvMQgPPU4p1Fi4FZCijEOpvHhtneKHRcQrg
        yAySRz5t6Oz8SbGDXxo/NOVHyB74En4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-99-AiA3oIWmMBuFO57nVPknGQ-1; Sat, 20 Feb 2021 07:24:57 -0500
X-MC-Unique: AiA3oIWmMBuFO57nVPknGQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4B9931E561;
        Sat, 20 Feb 2021 12:24:56 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-112-29.ams2.redhat.com [10.36.112.29])
        by smtp.corp.redhat.com (Postfix) with ESMTP id B8221100164C;
        Sat, 20 Feb 2021 12:24:52 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org,
        linux-leds@vger.kernel.org
Subject: [PATCH v2 6/7] HID: lenovo: Map mic-mute button to KEY_F20 instead of KEY_MICMUTE
Date:   Sat, 20 Feb 2021 13:24:37 +0100
Message-Id: <20210220122438.21857-7-hdegoede@redhat.com>
In-Reply-To: <20210220122438.21857-1-hdegoede@redhat.com>
References: <20210220122438.21857-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
index d936edb88f07..041bfa1937a8 100644
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
@@ -128,7 +131,7 @@ static int lenovo_input_mapping_tpkbd(struct hid_device *hdev,
 	if (usage->hid == (HID_UP_BUTTON | 0x0010)) {
 		/* This sub-device contains trackpoint, mark it */
 		hid_set_drvdata(hdev, (void *)1);
-		map_key_clear(KEY_MICMUTE);
+		map_key_clear(LENOVO_KEY_MICMUTE);
 		return 1;
 	}
 	return 0;
@@ -143,7 +146,7 @@ static int lenovo_input_mapping_cptkbd(struct hid_device *hdev,
 	    (usage->hid & HID_USAGE_PAGE) == HID_UP_LNVENDOR) {
 		switch (usage->hid & HID_USAGE) {
 		case 0x00f1: /* Fn-F4: Mic mute */
-			map_key_clear(KEY_MICMUTE);
+			map_key_clear(LENOVO_KEY_MICMUTE);
 			return 1;
 		case 0x00f2: /* Fn-F5: Brightness down */
 			map_key_clear(KEY_BRIGHTNESSDOWN);
@@ -233,7 +236,7 @@ static int lenovo_input_mapping_tp10_ultrabook_kbd(struct hid_device *hdev,
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

