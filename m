Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1D611BC116
	for <lists+linux-input@lfdr.de>; Tue, 28 Apr 2020 16:23:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727874AbgD1OXK (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 28 Apr 2020 10:23:10 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:34028 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727879AbgD1OXJ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 28 Apr 2020 10:23:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1588083788;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=aSG6zGOsgzSiWd6EUvf0jDiB0uhIu4Bu+nL0LZmIQWo=;
        b=GvNgXHuImS5vH/ZZSlgqCWZ28G50bj8dMwVaq4m7ZJh/K/vG/toVH560tOqqYldHr1YXRL
        fa2v3AqwRDwEPN0ZStRfRcq5+9MZePBPXKBNgy+FXkJUyVtgCvfVAR+eyu1dfOQ6mCFQ6v
        zY61t7NZsjNq6wPuQea/jM23Na17u5w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-461-cxRnY3F_NAyX3xxdaVHUrg-1; Tue, 28 Apr 2020 10:23:04 -0400
X-MC-Unique: cxRnY3F_NAyX3xxdaVHUrg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A9C40800D24;
        Tue, 28 Apr 2020 14:23:03 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-114-62.ams2.redhat.com [10.36.114.62])
        by smtp.corp.redhat.com (Postfix) with ESMTP id AD84C605CD;
        Tue, 28 Apr 2020 14:23:02 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org
Subject: [PATCH 4/6] HID: asus: Add report_size to struct asus_touchpad_info
Date:   Tue, 28 Apr 2020 16:22:52 +0200
Message-Id: <20200428142254.252063-4-hdegoede@redhat.com>
In-Reply-To: <20200428142254.252063-1-hdegoede@redhat.com>
References: <20200428142254.252063-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Content-Transfer-Encoding: quoted-printable
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add the report_size to struct asus_touchpad_info instead of calculating i=
t.

This is a preparation patch for adding support for the multi-touch touchp=
ad
found on the Medion Akoya E1239T's keyboard-dock, which uses the same
custom multi-touch protocol as the Asus keyboard-docks (same chipset
vendor, Integrated Technology Express / ITE).

The only difference in that the Akoya E1239T keyboard-dock's input-report=
s
have a 5 byte footer instead of a 1 byte footer, which requires the
report_size to be configurable per touchpad-model.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/hid/hid-asus.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
index 719eff589f92..6d97dbbcc287 100644
--- a/drivers/hid/hid-asus.c
+++ b/drivers/hid/hid-asus.c
@@ -102,6 +102,7 @@ struct asus_touchpad_info {
 	int res_y;
 	int contact_size;
 	int max_contacts;
+	int report_size;
 };
=20
 struct asus_drvdata {
@@ -126,6 +127,7 @@ static const struct asus_touchpad_info asus_i2c_tp =3D=
 {
 	.max_y =3D 1758,
 	.contact_size =3D 5,
 	.max_contacts =3D 5,
+	.report_size =3D 28 /* 2 byte header + 5 * 5 + 1 byte footer */,
 };
=20
 static const struct asus_touchpad_info asus_t100ta_tp =3D {
@@ -135,6 +137,7 @@ static const struct asus_touchpad_info asus_t100ta_tp=
 =3D {
 	.res_y =3D 27, /* units/mm */
 	.contact_size =3D 5,
 	.max_contacts =3D 5,
+	.report_size =3D 28 /* 2 byte header + 5 * 5 + 1 byte footer */,
 };
=20
 static const struct asus_touchpad_info asus_t100ha_tp =3D {
@@ -144,6 +147,7 @@ static const struct asus_touchpad_info asus_t100ha_tp=
 =3D {
 	.res_y =3D 29, /* units/mm */
 	.contact_size =3D 5,
 	.max_contacts =3D 5,
+	.report_size =3D 28 /* 2 byte header + 5 * 5 + 1 byte footer */,
 };
=20
 static const struct asus_touchpad_info asus_t200ta_tp =3D {
@@ -153,6 +157,7 @@ static const struct asus_touchpad_info asus_t200ta_tp=
 =3D {
 	.res_y =3D 28, /* units/mm */
 	.contact_size =3D 5,
 	.max_contacts =3D 5,
+	.report_size =3D 28 /* 2 byte header + 5 * 5 + 1 byte footer */,
 };
=20
 static const struct asus_touchpad_info asus_t100chi_tp =3D {
@@ -162,6 +167,7 @@ static const struct asus_touchpad_info asus_t100chi_t=
p =3D {
 	.res_y =3D 29, /* units/mm */
 	.contact_size =3D 3,
 	.max_contacts =3D 4,
+	.report_size =3D 15 /* 2 byte header + 3 * 4 + 1 byte footer */,
 };
=20
 static void asus_report_contact_down(struct asus_drvdata *drvdat,
@@ -229,7 +235,7 @@ static int asus_report_input(struct asus_drvdata *drv=
dat, u8 *data, int size)
 	int i, toolType =3D MT_TOOL_FINGER;
 	u8 *contactData =3D data + 2;
=20
-	if (size !=3D 3 + drvdat->tp->contact_size * drvdat->tp->max_contacts)
+	if (size !=3D drvdat->tp->report_size)
 		return 0;
=20
 	for (i =3D 0; i < drvdat->tp->max_contacts; i++) {
--=20
2.26.0

