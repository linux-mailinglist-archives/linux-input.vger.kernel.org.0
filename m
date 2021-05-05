Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70DEC374AAA
	for <lists+linux-input@lfdr.de>; Wed,  5 May 2021 23:40:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234961AbhEEVlI (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 5 May 2021 17:41:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25728 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233492AbhEEVkp (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 5 May 2021 17:40:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1620250788;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=NEdvRvx4IJ+xRqGwkaz89HqKIJ2w+9EsUd+uP2+Gk28=;
        b=Jas35SyRQZCRbrybNrtZZrEBVW2+M6dQFsujF9TjpzUybA+Xb1yOc8NOWnpF6hdQhiDxLx
        KyNm5arWS07Dj15C3dWvYLk3xMrAY2W6Zt1D1dXYy5lZEfGjNmhWSwVt+363R83if1iOpE
        zYImYNKCyIMiVkPQV412psGMEKnKw+s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-591-_8u4x6W3PTaJPDZarOF5rw-1; Wed, 05 May 2021 17:39:46 -0400
X-MC-Unique: _8u4x6W3PTaJPDZarOF5rw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C6FBC801B14;
        Wed,  5 May 2021 21:39:45 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-112-71.ams2.redhat.com [10.36.112.71])
        by smtp.corp.redhat.com (Postfix) with ESMTP id DC5565D6A8;
        Wed,  5 May 2021 21:39:44 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org
Subject: [PATCH v2 4/6] HID: multitouch: Disable event reporting on suspend when our parent is not a wakeup-source
Date:   Wed,  5 May 2021 23:39:33 +0200
Message-Id: <20210505213935.631351-5-hdegoede@redhat.com>
In-Reply-To: <20210505213935.631351-1-hdegoede@redhat.com>
References: <20210505213935.631351-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Disable event reporting on suspend when our parent is not
a wakeup-source. This should help save some extra power in
this case.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v2:
- Use new hid_is_usb_device() helper
---
 drivers/hid/hid-multitouch.c | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
index cfb68e443ddd..24b4a54f7224 100644
--- a/drivers/hid/hid-multitouch.c
+++ b/drivers/hid/hid-multitouch.c
@@ -1759,12 +1759,33 @@ static int mt_probe(struct hid_device *hdev, const struct hid_device_id *id)
 }
 
 #ifdef CONFIG_PM
+
+/* Check if the parent which has the power/wakeup* sysfs attributes may wake the hdev */
+static bool mt_parent_may_wake(struct hid_device *hdev)
+{
+	struct device *parent = hdev->dev.parent;
+
+	/*
+	 * USB-HID is attached to the usb_interface (our parent), the
+	 * power/wakeup* attr are part of the usb-device which is its parent.
+	 */
+	if (hid_is_usb_device(hdev) && parent)
+		parent = parent->parent;
+
+	if (parent)
+		return device_may_wakeup(parent);
+
+	/* Huh? Play it safe and keep reporting events. */
+	return true;
+}
+
 static int mt_suspend(struct hid_device *hdev, pm_message_t state)
 {
 	struct mt_device *td = hid_get_drvdata(hdev);
 
 	/* High latency is desirable for power savings during S3/S0ix */
-	if (td->mtclass.quirks & MT_QUIRK_DISABLE_WAKEUP)
+	if ((td->mtclass.quirks & MT_QUIRK_DISABLE_WAKEUP) ||
+	    !mt_parent_may_wake(hdev))
 		mt_set_modes(hdev, HID_LATENCY_HIGH, false, false);
 	else
 		mt_set_modes(hdev, HID_LATENCY_HIGH, true, true);
-- 
2.31.1

