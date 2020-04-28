Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B93801BC114
	for <lists+linux-input@lfdr.de>; Tue, 28 Apr 2020 16:23:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726868AbgD1OXH (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 28 Apr 2020 10:23:07 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:32535 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727874AbgD1OXH (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 28 Apr 2020 10:23:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1588083786;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=2Vb5EKhmUULRkguJRzB1f7j9oUwqLG+/1EjWbB3Ztyg=;
        b=DIVH8w4glfz/gUMebFe/+QeJlY0107AMmq+yHuU4Mn5cKT4c+iNHa+VYxZJxdmNXt7ZUEU
        +E0U9yjhi1jBDxYA3AeVOnLjyLQkRCk3lR4BRL6mkIz/PRm0dhi4KpcPA/9JfULNens+Hh
        bv+cnMBbAW2wD00Khb/yeS7aHoAE7WQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-415-74mVI3FLPXehGqg4IagYQQ-1; Tue, 28 Apr 2020 10:23:02 -0400
X-MC-Unique: 74mVI3FLPXehGqg4IagYQQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1C88146B;
        Tue, 28 Apr 2020 14:23:01 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-114-62.ams2.redhat.com [10.36.114.62])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 1E2D7605CB;
        Tue, 28 Apr 2020 14:22:59 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org
Subject: [PATCH 2/6] HID: asus: Simplify skipping of mappings for Asus T100CHI keyboard-dock
Date:   Tue, 28 Apr 2020 16:22:50 +0200
Message-Id: <20200428142254.252063-2-hdegoede@redhat.com>
In-Reply-To: <20200428142254.252063-1-hdegoede@redhat.com>
References: <20200428142254.252063-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Content-Transfer-Encoding: quoted-printable
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Before this commit the code was trying to keep the mapping for the
left mouse-button, do avoid the hidinput_has_been_populated() check
in hid-input.c from triggering and causing the touchpad input_dev ro
get cleaned up.

But the hidinput_has_been_populated() check happens after the
input_configured callback which sets up all the input bit for the
touchpad, so there is no need to preserve the left button mapping.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/hid/hid-asus.c | 21 +++++++--------------
 1 file changed, 7 insertions(+), 14 deletions(-)

diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
index ac224c32eeb6..b3292ff3f61a 100644
--- a/drivers/hid/hid-asus.c
+++ b/drivers/hid/hid-asus.c
@@ -677,20 +677,13 @@ static int asus_input_mapping(struct hid_device *hd=
ev,
 	 * This avoids a bunch of non-functional hid_input devices getting
 	 * created because of the T100CHI using HID_QUIRK_MULTI_INPUT.
 	 */
-	if (drvdata->quirks & (QUIRK_T100CHI | QUIRK_T90CHI)) {
-		if (field->application =3D=3D (HID_UP_GENDESK | 0x0080) ||
-		    usage->hid =3D=3D (HID_UP_GENDEVCTRLS | 0x0024) ||
-		    usage->hid =3D=3D (HID_UP_GENDEVCTRLS | 0x0025) ||
-		    usage->hid =3D=3D (HID_UP_GENDEVCTRLS | 0x0026))
-			return -1;
-		/*
-		 * We use the hid_input for the mouse report for the touchpad,
-		 * keep the left button, to avoid the core removing it.
-		 */
-		if (field->application =3D=3D HID_GD_MOUSE &&
-		    usage->hid !=3D (HID_UP_BUTTON | 1))
-			return -1;
-	}
+	if ((drvdata->quirks & (QUIRK_T100CHI | QUIRK_T90CHI)) &&
+	    (field->application =3D=3D (HID_UP_GENDESK | 0x0080) ||
+	     field->application =3D=3D HID_GD_MOUSE ||
+	     usage->hid =3D=3D (HID_UP_GENDEVCTRLS | 0x0024) ||
+	     usage->hid =3D=3D (HID_UP_GENDEVCTRLS | 0x0025) ||
+	     usage->hid =3D=3D (HID_UP_GENDEVCTRLS | 0x0026)))
+		return -1;
=20
 	/* ASUS-specific keyboard hotkeys */
 	if ((usage->hid & HID_USAGE_PAGE) =3D=3D 0xff310000) {
--=20
2.26.0

