Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C051E14ECA3
	for <lists+linux-input@lfdr.de>; Fri, 31 Jan 2020 13:46:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728537AbgAaMqk (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 31 Jan 2020 07:46:40 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:28881 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728479AbgAaMqk (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 31 Jan 2020 07:46:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1580474799;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=8wSr4OLmXPuR/spJW6OBXha3IO0TSijhhM4xgV10aMU=;
        b=LrZFq8Av7kFgDt11EeQEdQIqjJCsKr2m/A62uwpT31GjBpLcOeb+mHxZ2wWlasGyFg0DIc
        ta6n7SDhekLZifvWc2MBm+LkoKNflkl3BgE4VyAYNq+6GENKeOmqgAIVCGEdMrTEWvGY3w
        blex9eiwjgMqu5Gvb78jSg4VH7Ea93Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-25-ByCYwl5RPgeQLqWKVHGQaw-1; Fri, 31 Jan 2020 07:46:31 -0500
X-MC-Unique: ByCYwl5RPgeQLqWKVHGQaw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9A4AD8017CC;
        Fri, 31 Jan 2020 12:46:30 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-112-56.ams2.redhat.com [10.36.112.56])
        by smtp.corp.redhat.com (Postfix) with ESMTP id AE3FA60BE1;
        Fri, 31 Jan 2020 12:46:26 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org
Subject: [PATCH] HID: quirks: Remove ITE 8595 entry from hid_have_special_driver
Date:   Fri, 31 Jan 2020 13:46:25 +0100
Message-Id: <20200131124625.27895-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Content-Transfer-Encoding: quoted-printable
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The ITE 8595 chip used in various 2-in-1 keyboard docks works fine with
the hid-generic driver (minus the RF_KILL key) and also keeps working fin=
e
when swapping drivers, so there is no need to have it in the
hid_have_special_driver list.

Note the other 2 USB ids in hid-ite.c were never added to
hid_have_special_driver.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/hid/hid-quirks.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
index 0e7b2d998395..503cfbe207ab 100644
--- a/drivers/hid/hid-quirks.c
+++ b/drivers/hid/hid-quirks.c
@@ -397,9 +397,6 @@ static const struct hid_device_id hid_have_special_dr=
iver[] =3D {
 	{ HID_USB_DEVICE(USB_VENDOR_ID_HOLTEK_ALT, USB_DEVICE_ID_HOLTEK_ALT_MOU=
SE_A081) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_HOLTEK_ALT, USB_DEVICE_ID_HOLTEK_ALT_MOU=
SE_A0C2) },
 #endif
-#if IS_ENABLED(CONFIG_HID_ITE)
-	{ HID_USB_DEVICE(USB_VENDOR_ID_ITE, USB_DEVICE_ID_ITE8595) },
-#endif
 #if IS_ENABLED(CONFIG_HID_ICADE)
 	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_ION, USB_DEVICE_ID_ICADE) },
 #endif
--=20
2.23.0

