Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1F36010277A
	for <lists+linux-input@lfdr.de>; Tue, 19 Nov 2019 15:57:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726637AbfKSO5U (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 19 Nov 2019 09:57:20 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:35204 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727316AbfKSO5U (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 19 Nov 2019 09:57:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1574175438;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=hYADrkZIUduSKYvN5/1PA/AMCY8xtNbejLoDv0IkqWo=;
        b=bUTx7jiWB2u6R/kebGS7VTuHXR11VCah1jFVJeHlYlTpRWXLtuVk96blmpQTKfzvzajBwV
        TL8Dtyjfp5tyHaXcaWtBfW7/YLUARyneJqaNma7KpOxmwU2SNgzz3ile0OsbvPsZqvEYHY
        WaMMPsf2mSV64ZaNJagx848YaQWMEh0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-250-CSrrGvUDOWmjUHp6MWnHTw-1; Tue, 19 Nov 2019 09:57:17 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6DF73A2669;
        Tue, 19 Nov 2019 14:57:16 +0000 (UTC)
Received: from shalem.localdomain.com (ovpn-117-49.ams2.redhat.com [10.36.117.49])
        by smtp.corp.redhat.com (Postfix) with ESMTP id A77989CD1;
        Tue, 19 Nov 2019 14:57:12 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org
Subject: [PATCH] HID: ite: Add USB id match for Acer SW5-012 keyboard dock
Date:   Tue, 19 Nov 2019 15:57:11 +0100
Message-Id: <20191119145711.59399-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: CSrrGvUDOWmjUHp6MWnHTw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The Acer SW5-012 2-in-1 keyboard dock uses a Synaptics S91028 touchpad
which is connected to an ITE 8595 USB keyboard controller chip.

This keyboard has the same quirk for its rfkill / airplane mode hotkey as
other keyboards with the ITE 8595 chip, it only sends a single release
event when pressed and released, it never sends a press event.

This commit adds this keyboards USB id to the hid-ite id-table, fixing
the rfkill key not working on this keyboard.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/hid/hid-ids.h | 1 +
 drivers/hid/hid-ite.c | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index c2e60c727697..50985e321b4f 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -1100,6 +1100,7 @@
 #define USB_DEVICE_ID_SYNAPTICS_LTS2=090x1d10
 #define USB_DEVICE_ID_SYNAPTICS_HD=090x0ac3
 #define USB_DEVICE_ID_SYNAPTICS_QUAD_HD=090x1ac3
+#define USB_DEVICE_ID_SYNAPTICS_ACER_SWITCH5_012=090x2968
 #define USB_DEVICE_ID_SYNAPTICS_TP_V103=090x5710
 #define USB_DEVICE_ID_SYNAPTICS_ACER_SWITCH5=090x81a7
=20
diff --git a/drivers/hid/hid-ite.c b/drivers/hid/hid-ite.c
index a45f2352618d..c436e12feb23 100644
--- a/drivers/hid/hid-ite.c
+++ b/drivers/hid/hid-ite.c
@@ -40,6 +40,9 @@ static int ite_event(struct hid_device *hdev, struct hid_=
field *field,
 static const struct hid_device_id ite_devices[] =3D {
 =09{ HID_USB_DEVICE(USB_VENDOR_ID_ITE, USB_DEVICE_ID_ITE8595) },
 =09{ HID_USB_DEVICE(USB_VENDOR_ID_258A, USB_DEVICE_ID_258A_6A88) },
+=09/* ITE8595 USB kbd ctlr, with Synaptics touchpad connected to it. */
+=09{ HID_USB_DEVICE(USB_VENDOR_ID_SYNAPTICS,
+=09=09=09 USB_DEVICE_ID_SYNAPTICS_ACER_SWITCH5_012) },
 =09{ }
 };
 MODULE_DEVICE_TABLE(hid, ite_devices);
--=20
2.23.0

