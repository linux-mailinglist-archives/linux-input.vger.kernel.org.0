Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A706F1C1087
	for <lists+linux-input@lfdr.de>; Fri,  1 May 2020 11:56:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728480AbgEAJ4d (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 1 May 2020 05:56:33 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:26809 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728325AbgEAJ4d (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 1 May 2020 05:56:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1588326992;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=EKult6bnWGxCh2zPpf9uNAD+v9mpWMdU2nwfLt9cXJ8=;
        b=eBozte05eGYzMUz+tUPVu7uMAVAY2VrllS++pyi4sZvsSOvbjWwM3pUli8MAk6fUKJrleh
        tk3mgzuUWEYc9PLdinzS6e13ZzfJdp7/hxaVEzq7h5IVy4W6R5PlrZ1Nkaw8fPeDRGgSoH
        fMVUIA3/MENlrk7/u3oZwfZrfIfFsu0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-179-seQtuhACMLiR95CZVjIlgw-1; Fri, 01 May 2020 05:56:30 -0400
X-MC-Unique: seQtuhACMLiR95CZVjIlgw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 71A241005510;
        Fri,  1 May 2020 09:56:29 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-112-117.ams2.redhat.com [10.36.112.117])
        by smtp.corp.redhat.com (Postfix) with ESMTP id EF79361520;
        Fri,  1 May 2020 09:56:25 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org
Subject: [PATCH] HID: multitouch: Add MT_QUIRK_FORCE_GET_FEATURE to MT_CLS_WIN_8 quirks
Date:   Fri,  1 May 2020 11:56:24 +0200
Message-Id: <20200501095624.121744-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Content-Transfer-Encoding: quoted-printable
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The touchpad on the Dell Venue 11 Pro 7130's keyboard-dock is multi-touch
capable, using HID_GROUP_MULTITOUCH_WIN_8 and the hid-multitouch driver
correctly binds to it.

But instead of getting multi-touch HID input reports we still get mouse
input reports and corresponding linux input (evdev) node events.

Unloading and reloading the hid-multitouch driver works around this.

Adding the MT_QUIRK_FORCE_GET_FEATURE quirk to the MT_CLS_WIN_8 quirks
makes the driver work correctly the first time it is loaded.

I've chosen to add this quirk to the generic MT_CLS_WIN_8 quirks
because it seems unlikely that this quirk will causes problems for
other MT_CLS_WIN_8 devices and if this device needs it other Win 8
compatible devices might need it too.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/hid/hid-multitouch.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
index 362805ddf377..f9c0429e7348 100644
--- a/drivers/hid/hid-multitouch.c
+++ b/drivers/hid/hid-multitouch.c
@@ -265,6 +265,7 @@ static const struct mt_class mt_classes[] =3D {
 			MT_QUIRK_IGNORE_DUPLICATES |
 			MT_QUIRK_HOVERING |
 			MT_QUIRK_CONTACT_CNT_ACCURATE |
+			MT_QUIRK_FORCE_GET_FEATURE |
 			MT_QUIRK_STICKY_FINGERS |
 			MT_QUIRK_WIN8_PTP_BUTTONS,
 		.export_all_inputs =3D true },
--=20
2.26.0

