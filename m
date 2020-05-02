Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7BBEB1C2784
	for <lists+linux-input@lfdr.de>; Sat,  2 May 2020 20:18:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728237AbgEBSSz (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 2 May 2020 14:18:55 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:33221 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728044AbgEBSSz (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sat, 2 May 2020 14:18:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1588443534;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=cWyR41BKV4QS8jOtC5przXBAPhrC1uIR/6Pv3ATqFpM=;
        b=HZK0Ek07mdvEe8Jg8CKEd35RqrIS9CbLxw7Avl/kvdaJFLw8SWUGDva999DB3S2Ak8rXgR
        s3ouTBVfx+q7NRcKZaHSgnlHbZX7VfqxAaa6+Vcv5UIyhsQfgJ59ntOuqjvy6KUtzCgi2r
        dLRnU+DcYgJwScmaf0VW1B0gXeYUXO4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-215-F2bsoP4iOteLZmR_7kO7xQ-1; Sat, 02 May 2020 14:18:49 -0400
X-MC-Unique: F2bsoP4iOteLZmR_7kO7xQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 620D48014D5;
        Sat,  2 May 2020 18:18:48 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-112-4.ams2.redhat.com [10.36.112.4])
        by smtp.corp.redhat.com (Postfix) with ESMTP id B1A2F60612;
        Sat,  2 May 2020 18:18:44 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org,
        Mario Limonciello <mario.limonciello@dell.com>
Subject: [PATCH] HID: quirks: Add HID_QUIRK_NO_INIT_REPORTS quirk for Dell K12A keyboard-dock
Date:   Sat,  2 May 2020 20:18:42 +0200
Message-Id: <20200502181842.113831-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Content-Transfer-Encoding: quoted-printable
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add a HID_QUIRK_NO_INIT_REPORTS quirk for the Dell K12A keyboard-dock,
which can be used with various Dell Venue 11 models.

Without this quirk the keyboard/touchpad combo works fine when connected
at boot, but when hotplugged 9 out of 10 times it will not work properly.
Adding the quirk fixes this.

Cc: Mario Limonciello <mario.limonciello@dell.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/hid/hid-ids.h    | 1 +
 drivers/hid/hid-quirks.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 2efa823a87e4..6fc18dda9578 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -1112,6 +1112,7 @@
 #define USB_DEVICE_ID_SYNAPTICS_LTS2	0x1d10
 #define USB_DEVICE_ID_SYNAPTICS_HD	0x0ac3
 #define USB_DEVICE_ID_SYNAPTICS_QUAD_HD	0x1ac3
+#define USB_DEVICE_ID_SYNAPTICS_DELL_K12A	0x2819
 #define USB_DEVICE_ID_SYNAPTICS_ACER_SWITCH5_012	0x2968
 #define USB_DEVICE_ID_SYNAPTICS_TP_V103	0x5710
 #define USB_DEVICE_ID_SYNAPTICS_ACER_SWITCH5	0x81a7
diff --git a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
index ebec818344af..e4cb543de0cd 100644
--- a/drivers/hid/hid-quirks.c
+++ b/drivers/hid/hid-quirks.c
@@ -163,6 +163,7 @@ static const struct hid_device_id hid_quirks[] =3D {
 	{ HID_USB_DEVICE(USB_VENDOR_ID_SYNAPTICS, USB_DEVICE_ID_SYNAPTICS_LTS2)=
, HID_QUIRK_NO_INIT_REPORTS },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_SYNAPTICS, USB_DEVICE_ID_SYNAPTICS_QUAD_=
HD), HID_QUIRK_NO_INIT_REPORTS },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_SYNAPTICS, USB_DEVICE_ID_SYNAPTICS_TP_V1=
03), HID_QUIRK_NO_INIT_REPORTS },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_SYNAPTICS, USB_DEVICE_ID_SYNAPTICS_DELL_=
K12A), HID_QUIRK_NO_INIT_REPORTS },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_TOPMAX, USB_DEVICE_ID_TOPMAX_COBRAPAD), =
HID_QUIRK_BADPAD },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_TOUCHPACK, USB_DEVICE_ID_TOUCHPACK_RTS),=
 HID_QUIRK_MULTI_INPUT },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_TPV, USB_DEVICE_ID_TPV_OPTICAL_TOUCHSCRE=
EN_8882), HID_QUIRK_NOGET },
--=20
2.26.0

