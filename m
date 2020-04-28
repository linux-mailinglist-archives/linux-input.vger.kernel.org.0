Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B76931BC119
	for <lists+linux-input@lfdr.de>; Tue, 28 Apr 2020 16:23:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727920AbgD1OXL (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 28 Apr 2020 10:23:11 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:46595 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727879AbgD1OXL (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 28 Apr 2020 10:23:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1588083790;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=6JhBSGZHS1ql3y1PsLU6Hf30TdPlrsWNhL1SSVcwIFg=;
        b=XYg+BWEnpaUzEMJpAmhLjQfMs4I+IRI1epJFn/MnHG0Co1UaFqf0SKSR/HJxax14TZ41u/
        SHTVj9ezNg4vt2sMj4J+t2qiIBd8aXDvh51nDMrMqENYveAtmC/UBh+vaz+c7KezfhDRdb
        F2Iqc7ZJp9ZcICcGbI/WWSW7eG0d+90=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-500-F_EAzHqbPICA_HEe30sM0w-1; Tue, 28 Apr 2020 10:23:07 -0400
X-MC-Unique: F_EAzHqbPICA_HEe30sM0w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3857580058A;
        Tue, 28 Apr 2020 14:23:06 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-114-62.ams2.redhat.com [10.36.114.62])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 3D4EE605CB;
        Tue, 28 Apr 2020 14:23:05 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org
Subject: [PATCH 6/6] HID: asus: Fix mute and touchpad-toggle keys on Medion Akoya E1239T
Date:   Tue, 28 Apr 2020 16:22:54 +0200
Message-Id: <20200428142254.252063-6-hdegoede@redhat.com>
In-Reply-To: <20200428142254.252063-1-hdegoede@redhat.com>
References: <20200428142254.252063-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Content-Transfer-Encoding: quoted-printable
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The mute key, is broken. All the consumer keys on the keyboard USB
interface work normally, except for mute which only sends press events
and never sends release events.

The touchpad key sends the otherwise unused input report with a report-id
of 5 on the touchpad interface. It too only sends press events. This also
requires extra special handling since the multi-touch touchpad events and
the KEY_F21 events for the touchpad toggle must not be send from the same
input_dev (userspace cannot handle this).

This commit adds special handlig for both, fixing these keys not working.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/hid/hid-asus.c | 60 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
index 317d7392ca8b..c183caf89d49 100644
--- a/drivers/hid/hid-asus.c
+++ b/drivers/hid/hid-asus.c
@@ -42,6 +42,7 @@ MODULE_DESCRIPTION("Asus HID Keyboard and TouchPad");
 #define T100_TPAD_INTF 2
 #define MEDION_E1239T_TPAD_INTF 1
=20
+#define E1239T_TP_TOGGLE_REPORT_ID 0x05
 #define T100CHI_MOUSE_REPORT_ID 0x06
 #define FEATURE_REPORT_ID 0x0d
 #define INPUT_REPORT_ID 0x5d
@@ -111,6 +112,7 @@ struct asus_drvdata {
 	unsigned long quirks;
 	struct hid_device *hdev;
 	struct input_dev *input;
+	struct input_dev *tp_kbd_input;
 	struct asus_kbd_leds *kbd_backlight;
 	const struct asus_touchpad_info *tp;
 	bool enable_backlight;
@@ -275,6 +277,34 @@ static int asus_report_input(struct asus_drvdata *dr=
vdat, u8 *data, int size)
 	return 1;
 }
=20
+static int asus_e1239t_event(struct asus_drvdata *drvdat, u8 *data, int =
size)
+{
+	if (size !=3D 3)
+		return 0;
+
+	/* Handle broken mute key which only sends press events */
+	if (!drvdat->tp &&
+	    data[0] =3D=3D 0x02 && data[1] =3D=3D 0xe2 && data[2] =3D=3D 0x00) =
{
+		input_report_key(drvdat->input, KEY_MUTE, 1);
+		input_sync(drvdat->input);
+		input_report_key(drvdat->input, KEY_MUTE, 0);
+		input_sync(drvdat->input);
+		return 1;
+	}
+
+	/* Handle custom touchpad toggle key which only sends press events */
+	if (drvdat->tp_kbd_input &&
+	    data[0] =3D=3D 0x05 && data[1] =3D=3D 0x02 && data[2] =3D=3D 0x28) =
{
+		input_report_key(drvdat->tp_kbd_input, KEY_F21, 1);
+		input_sync(drvdat->tp_kbd_input);
+		input_report_key(drvdat->tp_kbd_input, KEY_F21, 0);
+		input_sync(drvdat->tp_kbd_input);
+		return 1;
+	}
+
+	return 0;
+}
+
 static int asus_event(struct hid_device *hdev, struct hid_field *field,
 		      struct hid_usage *usage, __s32 value)
 {
@@ -299,6 +329,9 @@ static int asus_raw_event(struct hid_device *hdev,
 	if (drvdata->tp && data[0] =3D=3D INPUT_REPORT_ID)
 		return asus_report_input(drvdata, data, size);
=20
+	if (drvdata->quirks & QUIRK_MEDION_E1239T)
+		return asus_e1239t_event(drvdata, data, size);
+
 	return 0;
 }
=20
@@ -633,6 +666,21 @@ static int asus_input_configured(struct hid_device *=
hdev, struct hid_input *hi)
 	    hi->report->id !=3D T100CHI_MOUSE_REPORT_ID)
 		return 0;
=20
+	/* Handle MULTI_INPUT on E1239T mouse/touchpad USB interface */
+	if (drvdata->tp && (drvdata->quirks & QUIRK_MEDION_E1239T)) {
+		switch (hi->report->id) {
+		case E1239T_TP_TOGGLE_REPORT_ID:
+			input_set_capability(input, EV_KEY, KEY_F21);
+			input->name =3D "Asus Touchpad Keys";
+			drvdata->tp_kbd_input =3D input;
+			return 0;
+		case INPUT_REPORT_ID:
+			break; /* Touchpad report, handled below */
+		default:
+			return 0; /* Ignore other reports */
+		}
+	}
+
 	if (drvdata->tp) {
 		int ret;
=20
@@ -793,6 +841,16 @@ static int asus_input_mapping(struct hid_device *hde=
v,
 		}
 	}
=20
+	/*
+	 * The mute button is broken and only sends press events, we
+	 * deal with this in our raw_event handler, so do not map it.
+	 */
+	if ((drvdata->quirks & QUIRK_MEDION_E1239T) &&
+	    usage->hid =3D=3D (HID_UP_CONSUMER | 0xe2)) {
+		input_set_capability(hi->input, EV_KEY, KEY_MUTE);
+		return -1;
+	}
+
 	return 0;
 }
=20
@@ -895,6 +953,8 @@ static int asus_probe(struct hid_device *hdev, const =
struct hid_device_id *id)
 			to_usb_interface(hdev->dev.parent)->altsetting;
=20
 		if (alt->desc.bInterfaceNumber =3D=3D MEDION_E1239T_TPAD_INTF) {
+			/* For separate input-devs for tp and tp toggle key */
+			hdev->quirks |=3D HID_QUIRK_MULTI_INPUT;
 			drvdata->quirks |=3D QUIRK_SKIP_INPUT_MAPPING;
 			drvdata->tp =3D &medion_e1239t_tp;
 		}
--=20
2.26.0

