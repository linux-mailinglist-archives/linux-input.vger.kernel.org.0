Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 412F41BC113
	for <lists+linux-input@lfdr.de>; Tue, 28 Apr 2020 16:23:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727878AbgD1OXG (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 28 Apr 2020 10:23:06 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:39553 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726868AbgD1OXG (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 28 Apr 2020 10:23:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1588083785;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=J849IyjDD8ptEn8ZlcYvdLsp+5tVUGfiF7KemMlS0Yg=;
        b=g3zgau7PNUfhSLYdNFHJ4TRa4nJVEooozjfQ3JRkAn4bVNScGql6Zb1oqdvUUg58lwVn9t
        ze7yZjtwREJYA8rjoVo41i82cFc0m94YlEQHVxImgqkQL6/Orpg0S8kedZU6Y0vn8TQmpb
        E7zkh7Mw5WsIoL7aBH1J9ageGOguO8c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-289-Gsu8H8SIN_2UrwsH8u0Eeg-1; Tue, 28 Apr 2020 10:23:03 -0400
X-MC-Unique: Gsu8H8SIN_2UrwsH8u0Eeg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 68B9E1895A2A;
        Tue, 28 Apr 2020 14:23:02 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-114-62.ams2.redhat.com [10.36.114.62])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 6A104605CB;
        Tue, 28 Apr 2020 14:23:01 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org
Subject: [PATCH 3/6] HID: asus: Add hid_is_using_ll_driver(usb_hid_driver) check
Date:   Tue, 28 Apr 2020 16:22:51 +0200
Message-Id: <20200428142254.252063-3-hdegoede@redhat.com>
In-Reply-To: <20200428142254.252063-1-hdegoede@redhat.com>
References: <20200428142254.252063-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Content-Transfer-Encoding: quoted-printable
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add a hid_is_using_ll_driver(usb_hid_driver) check to ensure that the
parent device is an usb_interface, before casting the parent device
pointer to an usb_interface pointer with to_usb_interface().

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/hid/hid-asus.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
index b3292ff3f61a..719eff589f92 100644
--- a/drivers/hid/hid-asus.c
+++ b/drivers/hid/hid-asus.c
@@ -842,7 +842,8 @@ static int asus_probe(struct hid_device *hdev, const =
struct hid_device_id *id)
 	if (drvdata->quirks & QUIRK_IS_MULTITOUCH)
 		drvdata->tp =3D &asus_i2c_tp;
=20
-	if (drvdata->quirks & QUIRK_T100_KEYBOARD) {
+	if ((drvdata->quirks & QUIRK_T100_KEYBOARD) &&
+	    hid_is_using_ll_driver(hdev, &usb_hid_driver)) {
 		struct usb_interface *intf =3D to_usb_interface(hdev->dev.parent);
=20
 		if (intf->altsetting->desc.bInterfaceNumber =3D=3D T100_TPAD_INTF) {
--=20
2.26.0

