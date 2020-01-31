Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CB8A314ECA1
	for <lists+linux-input@lfdr.de>; Fri, 31 Jan 2020 13:46:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728500AbgAaMq1 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 31 Jan 2020 07:46:27 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:54741 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728479AbgAaMq0 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 31 Jan 2020 07:46:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1580474785;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=MPaV1W08xRnzZ/IFwkvgpcXT45weKhngoauMEtZfra8=;
        b=dpzCfUs0FDM9judmfifbEtMVzA8mbGRF3ShYB2/+g44o7oocKGvEUFMSet1geEd89ns5om
        SxjO6cmSgSmUlk1PDTGOoB5zrdShcxlesUfg2RJQ1fwKy//fWffDhIpVwFnJ7epeaw7qYo
        aEqTyUL7yYFVnL4DPaQxj0IwnpVMjz0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-113-8WlPrYI8MjOWJGmCFxEYJg-1; Fri, 31 Jan 2020 07:46:22 -0500
X-MC-Unique: 8WlPrYI8MjOWJGmCFxEYJg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C615918CA24C;
        Fri, 31 Jan 2020 12:46:21 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-112-56.ams2.redhat.com [10.36.112.56])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 8DED31001B3F;
        Fri, 31 Jan 2020 12:46:17 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org
Subject: [PATCH] HID: generic: Check other drivers match callback from __check_hid_generic
Date:   Fri, 31 Jan 2020 13:46:15 +0100
Message-Id: <20200131124615.27849-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Content-Transfer-Encoding: quoted-printable
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

__check_hid_generic is used to check if there is a driver, other then
the hid-generic driver, which wants to handle the hid-device, in which
case hid_generic_match() will return false so that the other driver can
bind.

But what if the other driver also has a match callback and that indicates
it does not want to handle the device? Then hid-generic should bind to it
and thus hid_generic_match() should NOT return false in that case.

This commit makes __check_hid_generic check if a matching driver has
a match callback and if it does makes its check this, so that
hid-generic will bind to devices which have a matching other driver,
but that other driver's match callback rejects the device.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
This patch was written while fixing the issues with hid-ite on the
Acer SW5-012, where we only want to bind to one interface. In that
specific case this change is not necessary because hid-multitouch will
pick the hid-device which hid-ite's match callback is rejecting.
---
 drivers/hid/hid-generic.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/hid-generic.c b/drivers/hid/hid-generic.c
index f9db991d3c5a..fe3ca7612750 100644
--- a/drivers/hid/hid-generic.c
+++ b/drivers/hid/hid-generic.c
@@ -31,7 +31,13 @@ static int __check_hid_generic(struct device_driver *d=
rv, void *data)
 	if (hdrv =3D=3D &hid_generic)
 		return 0;
=20
-	return hid_match_device(hdev, hdrv) !=3D NULL;
+	if (!hid_match_device(hdev, hdrv))
+		return 0;
+
+	if (!hdrv->match)
+		return 1;
+
+	return hdrv->match(hdev, false);
 }
=20
 static bool hid_generic_match(struct hid_device *hdev,
--=20
2.23.0

