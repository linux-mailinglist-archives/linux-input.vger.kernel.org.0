Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C74391BC112
	for <lists+linux-input@lfdr.de>; Tue, 28 Apr 2020 16:23:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727856AbgD1OXD (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 28 Apr 2020 10:23:03 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:33738 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726868AbgD1OXD (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 28 Apr 2020 10:23:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1588083782;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=jIX5CYKIQUN2lBh9opYogqEO4R8EycK8YMqe5/ZFfgw=;
        b=PtZ+67qv8oQov9ptPJp9TRaRfrm/dlr1KvQDCw+ubUV6HCP+HOSmQB0qG2LmouLU9mgly6
        zpVyGGqcttvskuhULcYtUqAG5OuUs+tOZIZ2ItKrYGYCzbwnYWhGlKn64mm/2Fwql9y1Cg
        VNT3pAl+ADUxncmzlWBz5xWK4ITQhI8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-118-byavXidDOV-TRLCE32bWdw-1; Tue, 28 Apr 2020 10:23:00 -0400
X-MC-Unique: byavXidDOV-TRLCE32bWdw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C6DDF1895A2A;
        Tue, 28 Apr 2020 14:22:59 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-114-62.ams2.redhat.com [10.36.114.62])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 44E6E60300;
        Tue, 28 Apr 2020 14:22:56 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org
Subject: [PATCH 1/6] HID: asus: Only set EV_REP if we are adding a mapping
Date:   Tue, 28 Apr 2020 16:22:49 +0200
Message-Id: <20200428142254.252063-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Content-Transfer-Encoding: quoted-printable
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Make asus_input_mapping() only set EV_REP if we are adding a mapping.

The T100CHI bluetooth keyboard dock has a few input reports for which
we do not create any mappings (these input-reports are present in the
descriptors but never send).

The hid-asus code relies on the HID core not creating input devices for
input-reports without any mappings. But the present of the EV_REP but
counts as a mapping causing 6 /dev/input/event# nodes to be created for
the T100CHI bluetooth keyboard dock. This change brings the amount of
created /dev/input/event# nodes / input-devices down to 4.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/hid/hid-asus.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
index e6e4c841fb06..ac224c32eeb6 100644
--- a/drivers/hid/hid-asus.c
+++ b/drivers/hid/hid-asus.c
@@ -694,7 +694,6 @@ static int asus_input_mapping(struct hid_device *hdev=
,
=20
 	/* ASUS-specific keyboard hotkeys */
 	if ((usage->hid & HID_USAGE_PAGE) =3D=3D 0xff310000) {
-		set_bit(EV_REP, hi->input->evbit);
 		switch (usage->hid & HID_USAGE) {
 		case 0x10: asus_map_key_clear(KEY_BRIGHTNESSDOWN);	break;
 		case 0x20: asus_map_key_clear(KEY_BRIGHTNESSUP);		break;
@@ -737,11 +736,11 @@ static int asus_input_mapping(struct hid_device *hd=
ev,
 		if (drvdata->quirks & QUIRK_USE_KBD_BACKLIGHT)
 			drvdata->enable_backlight =3D true;
=20
+		set_bit(EV_REP, hi->input->evbit);
 		return 1;
 	}
=20
 	if ((usage->hid & HID_USAGE_PAGE) =3D=3D HID_UP_MSVENDOR) {
-		set_bit(EV_REP, hi->input->evbit);
 		switch (usage->hid & HID_USAGE) {
 		case 0xff01: asus_map_key_clear(BTN_1);	break;
 		case 0xff02: asus_map_key_clear(BTN_2);	break;
@@ -764,6 +763,7 @@ static int asus_input_mapping(struct hid_device *hdev=
,
 			return 0;
 		}
=20
+		set_bit(EV_REP, hi->input->evbit);
 		return 1;
 	}
=20
--=20
2.26.0

