Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 154511B72FC
	for <lists+linux-input@lfdr.de>; Fri, 24 Apr 2020 13:22:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726582AbgDXLWg (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 24 Apr 2020 07:22:36 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:51750 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726289AbgDXLWf (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 24 Apr 2020 07:22:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1587727354;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=gUCLHWAmElsh+/lJ039FcM3EZolvFEjWxKfqHm508vc=;
        b=E6RDjluUZhf6tFRmNtoR1ksUU5PXr2dtL0dEN8cSLuiwT1aPEEEDyxWjYNvAHsvckRaiv6
        YLHa4ZtIrj0fDkuemqWxaOwDNIEjAkSJ6ru33g5IkZ9IUBfbrdmZV0iRnqCfkd3lEb5vcJ
        S0ZP8YVTz2cleroqNHKskMM34UKOahE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-370-YvaS8pPuO1eta7eCoC2qgQ-1; Fri, 24 Apr 2020 07:22:32 -0400
X-MC-Unique: YvaS8pPuO1eta7eCoC2qgQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 69D5A1005510;
        Fri, 24 Apr 2020 11:22:31 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-115-111.ams2.redhat.com [10.36.115.111])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 7237218A48;
        Fri, 24 Apr 2020 11:22:24 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org,
        Joao Moreno <mail@joaomoreno.com>
Subject: [PATCH] HID: apple: Disable Fn-key key-re-mapping on clone keyboards
Date:   Fri, 24 Apr 2020 13:22:22 +0200
Message-Id: <20200424112222.118376-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Content-Transfer-Encoding: quoted-printable
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
index d732d1d10caf..6909c045fece 100644
--- a/drivers/hid/hid-apple.c
+++ b/drivers/hid/hid-apple.c
@@ -54,6 +54,7 @@ MODULE_PARM_DESC(swap_opt_cmd, "Swap the Option (\"Alt\=
") and Command (\"Flag\")
 struct apple_sc {
 	unsigned long quirks;
 	unsigned int fn_on;
+	unsigned int fn_found;
 	DECLARE_BITMAP(pressed_numlock, KEY_CNT);
 };
=20
@@ -339,12 +340,15 @@ static int apple_input_mapping(struct hid_device *h=
dev, struct hid_input *hi,
 		struct hid_field *field, struct hid_usage *usage,
 		unsigned long **bit, int *max)
 {
+	struct apple_sc *asc =3D hid_get_drvdata(hdev);
+
 	if (usage->hid =3D=3D (HID_UP_CUSTOM | 0x0003) ||
 			usage->hid =3D=3D (HID_UP_MSVENDOR | 0x0003) ||
 			usage->hid =3D=3D (HID_UP_HPVENDOR2 | 0x0003)) {
 		/* The fn key on Apple USB keyboards */
 		set_bit(EV_REP, hi->input->evbit);
 		hid_map_usage_clear(hi, usage, bit, max, EV_KEY, KEY_FN);
+		asc->fn_found =3D true;
 		apple_setup_input(hi->input);
 		return 1;
 	}
@@ -371,6 +375,19 @@ static int apple_input_mapped(struct hid_device *hde=
v, struct hid_input *hi,
 	return 0;
 }
=20
+static int apple_input_configured(struct hid_device *hdev,
+		struct hid_input *hidinput)
+{
+	struct apple_sc *asc =3D hid_get_drvdata(hdev);
+
+	if ((asc->quirks & APPLE_HAS_FN) && !asc->fn_found) {
+		hid_info(hdev, "Fn key not found (Apple Wireless Keyboard clone?), dis=
abling Fn key handling\n");
+		asc->quirks =3D 0;
+	}
+
+	return 0;
+}
+
 static int apple_probe(struct hid_device *hdev,
 		const struct hid_device_id *id)
 {
@@ -585,6 +602,7 @@ static struct hid_driver apple_driver =3D {
 	.event =3D apple_event,
 	.input_mapping =3D apple_input_mapping,
 	.input_mapped =3D apple_input_mapped,
+	.input_configured =3D apple_input_configured,
 };
 module_hid_driver(apple_driver);
=20
--=20
2.26.0

