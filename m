Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55F1A460A2B
	for <lists+linux-input@lfdr.de>; Sun, 28 Nov 2021 22:10:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237186AbhK1VNP (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 28 Nov 2021 16:13:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59366 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1353193AbhK1VLO (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 28 Nov 2021 16:11:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1638133677;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=X2tPuYHx/ztAOPZauE7pxyDcw2S4692iCzEWNXpaFiU=;
        b=aS7nyuTtg8GfvrkjnD7bYgZ3YOT0qPn1ZObhhtBL954gTMvfUOr7AhboF6YfprnGokEBeR
        kSjolwTgjIRaE0B4e3eShaLz88xgdxDkvSJjTJZ2Al+Wz/8KzlxMYK8YQ/Xt0piZekLsIN
        n86A2QP4a4RljG8gZpjIQXoF5jPlZ3g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-51-kWfbWs_yOIGy9AkCqw_Zyw-1; Sun, 28 Nov 2021 16:07:54 -0500
X-MC-Unique: kWfbWs_yOIGy9AkCqw_Zyw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6136F1853024;
        Sun, 28 Nov 2021 21:07:53 +0000 (UTC)
Received: from x1.localdomain (unknown [10.39.192.65])
        by smtp.corp.redhat.com (Postfix) with ESMTP id E74E65D9C0;
        Sun, 28 Nov 2021 21:07:49 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org
Subject: [PATCH] HID: quirks: Add quirk for the Microsoft Surface 3 type-cover
Date:   Sun, 28 Nov 2021 22:07:48 +0100
Message-Id: <20211128210748.460254-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add a HID_QUIRK_NO_INIT_REPORTS quirk for the
Microsoft Surface 3 (non pro) type-cover.

Trying to init the reports seems to confuse the type-cover and
causes 2 issues:

1. Despite hid-multitouch sending the command to switch the
touchpad to multitouch mode, it keeps sending events on the
mouse emulation interface.

2. The touchpad completely stops sending events after a reboot.

Adding the HID_QUIRK_NO_INIT_REPORTS quirk fixes both issues.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/hid/hid-ids.h    | 1 +
 drivers/hid/hid-quirks.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 95037a3e2e6e..8b2358da4d15 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -885,6 +885,7 @@
 #define USB_DEVICE_ID_MS_TOUCH_COVER_2   0x07a7
 #define USB_DEVICE_ID_MS_TYPE_COVER_2    0x07a9
 #define USB_DEVICE_ID_MS_POWER_COVER     0x07da
+#define USB_DEVICE_ID_MS_SURFACE3_COVER		0x07de
 #define USB_DEVICE_ID_MS_XBOX_ONE_S_CONTROLLER	0x02fd
 #define USB_DEVICE_ID_MS_PIXART_MOUSE    0x00cb
 #define USB_DEVICE_ID_8BITDO_SN30_PRO_PLUS      0x02e0
diff --git a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
index 06b7908c874c..ee7e504e7279 100644
--- a/drivers/hid/hid-quirks.c
+++ b/drivers/hid/hid-quirks.c
@@ -124,6 +124,7 @@ static const struct hid_device_id hid_quirks[] = {
 	{ HID_USB_DEVICE(USB_VENDOR_ID_MCS, USB_DEVICE_ID_MCS_GAMEPADBLOCK), HID_QUIRK_MULTI_INPUT },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_MICROSOFT, USB_DEVICE_ID_MS_PIXART_MOUSE), HID_QUIRK_ALWAYS_POLL },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_MICROSOFT, USB_DEVICE_ID_MS_POWER_COVER), HID_QUIRK_NO_INIT_REPORTS },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_MICROSOFT, USB_DEVICE_ID_MS_SURFACE3_COVER), HID_QUIRK_NO_INIT_REPORTS },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_MICROSOFT, USB_DEVICE_ID_MS_SURFACE_PRO_2), HID_QUIRK_NO_INIT_REPORTS },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_MICROSOFT, USB_DEVICE_ID_MS_TOUCH_COVER_2), HID_QUIRK_NO_INIT_REPORTS },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_MICROSOFT, USB_DEVICE_ID_MS_TYPE_COVER_2), HID_QUIRK_NO_INIT_REPORTS },
-- 
2.33.1

