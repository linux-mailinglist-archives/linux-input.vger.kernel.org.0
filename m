Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D16E22023CB
	for <lists+linux-input@lfdr.de>; Sat, 20 Jun 2020 14:32:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727787AbgFTMck (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 20 Jun 2020 08:32:40 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:59310 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727964AbgFTMcj (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 20 Jun 2020 08:32:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1592656358;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=EQV1LdZ0L4MEuz+bAN0LBeidMSuiY0wyqllM61sMYoU=;
        b=gK1hBHxePhvqNudeTib74nsMH3VdB6PcoQnoVKXl+whuuYp5UmEdf+9QeAF9PCxL0smzSP
        UMFdvUFUrfONZjnrov0fHLX9ZvkCUUNUzsSGTvw0wbPIujGFWeR7m72bFN/cX1JjVweXsq
        t1iFPw3cBziTzub78Ty7uXep7kIQTj0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-303-LlTPT1YFNJ6x6Tag2sienA-1; Sat, 20 Jun 2020 08:32:36 -0400
X-MC-Unique: LlTPT1YFNJ6x6Tag2sienA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5BA5C801503;
        Sat, 20 Jun 2020 12:32:35 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-112-42.ams2.redhat.com [10.36.112.42])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 3CA9971676;
        Sat, 20 Jun 2020 12:32:34 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org,
        Joao Moreno <mail@joaomoreno.com>
Subject: [PATCH resend] HID: apple: Disable Fn-key key-re-mapping on clone keyboards
Date:   Sat, 20 Jun 2020 14:32:29 +0200
Message-Id: <20200620123229.40402-2-hdegoede@redhat.com>
In-Reply-To: <20200620123229.40402-1-hdegoede@redhat.com>
References: <20200620123229.40402-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The Maxxter KB-BT-001 Bluetooth keyboard, which looks somewhat like the
Apple Wireless Keyboard, is using the vendor and product IDs (05AC:0239)
of the Apple Wireless Keyboard (2009 ANSI version) <sigh>.

But its F1 - F10 keys are marked as sending F1 - F10, not the special
functions hid-apple.c maps them too; and since its descriptors do not
contain the HID_UP_CUSTOM | 0x0003 usage apple-hid looks for for the
Fn-key, apple_setup_input() never gets called, so F1 - F6 are mapped
to key-codes which have not been set in the keybit array causing them
to not send any events at all.

The lack of a usage code matching the Fn key in the clone is actually
useful as this allows solving this problem in a generic way.

This commits adds a fn_found flag and it adds a input_configured
callback which checks if this flag is set once all usages have been
mapped. If it is not set, then assume this is a clone and clear the
quirks bitmap so that the hid-apple code does not add any special
handling to this keyboard.

This fixes F1 - F6 not sending anything at all and F7 - F12 sending
the wrong codes on the Maxxter KB-BT-001 Bluetooth keyboard and on
similar clones.

Cc: Joao Moreno <mail@joaomoreno.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Note hid-apple also enables APPLE_NUMLOCK_EMULATION for
USB_DEVICE_ID_APPLE_ALU_WIRELESS_2009_ANSI. At least on the Maxxter clone
this causes numlock to get stuck in the pressed state after pressing it
twice (its get stuck when pressed when the numlock led is on). This might
be specific to the clone, but it would be good to also check if this is
not an issue on an actual Apple Wireless Keyboard.

Joao, can you check the numlock-emulation stuff on your 05AC:0256
(APPLE_ALU_WIRELESS_2011_ISO) keyboard?
---
 drivers/hid/hid-apple.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/hid/hid-apple.c b/drivers/hid/hid-apple.c
index 359bdfbe3701..e82f604d33e9 100644
--- a/drivers/hid/hid-apple.c
+++ b/drivers/hid/hid-apple.c
@@ -60,6 +60,7 @@ MODULE_PARM_DESC(swap_fn_leftctrl, "Swap the Fn and left Control keys. "
 struct apple_sc {
 	unsigned long quirks;
 	unsigned int fn_on;
+	unsigned int fn_found;
 	DECLARE_BITMAP(pressed_numlock, KEY_CNT);
 };
 
@@ -365,12 +366,15 @@ static int apple_input_mapping(struct hid_device *hdev, struct hid_input *hi,
 		struct hid_field *field, struct hid_usage *usage,
 		unsigned long **bit, int *max)
 {
+	struct apple_sc *asc = hid_get_drvdata(hdev);
+
 	if (usage->hid == (HID_UP_CUSTOM | 0x0003) ||
 			usage->hid == (HID_UP_MSVENDOR | 0x0003) ||
 			usage->hid == (HID_UP_HPVENDOR2 | 0x0003)) {
 		/* The fn key on Apple USB keyboards */
 		set_bit(EV_REP, hi->input->evbit);
 		hid_map_usage_clear(hi, usage, bit, max, EV_KEY, KEY_FN);
+		asc->fn_found = true;
 		apple_setup_input(hi->input);
 		return 1;
 	}
@@ -397,6 +401,19 @@ static int apple_input_mapped(struct hid_device *hdev, struct hid_input *hi,
 	return 0;
 }
 
+static int apple_input_configured(struct hid_device *hdev,
+		struct hid_input *hidinput)
+{
+	struct apple_sc *asc = hid_get_drvdata(hdev);
+
+	if ((asc->quirks & APPLE_HAS_FN) && !asc->fn_found) {
+		hid_info(hdev, "Fn key not found (Apple Wireless Keyboard clone?), disabling Fn key handling\n");
+		asc->quirks = 0;
+	}
+
+	return 0;
+}
+
 static int apple_probe(struct hid_device *hdev,
 		const struct hid_device_id *id)
 {
@@ -611,6 +628,7 @@ static struct hid_driver apple_driver = {
 	.event = apple_event,
 	.input_mapping = apple_input_mapping,
 	.input_mapped = apple_input_mapped,
+	.input_configured = apple_input_configured,
 };
 module_hid_driver(apple_driver);
 
-- 
2.26.2

