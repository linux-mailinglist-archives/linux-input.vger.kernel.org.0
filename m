Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AFF6046BABC
	for <lists+linux-input@lfdr.de>; Tue,  7 Dec 2021 13:10:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231712AbhLGMO2 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 7 Dec 2021 07:14:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51088 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231564AbhLGMO2 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 7 Dec 2021 07:14:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1638879057;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=3y3lsKqJemOobGZzaMNADWy8VaBlOgIA/+pS5K7kvmw=;
        b=R2qLLaVh/ohWJbZV8hjjxI3ub2pCGRVxwXTApXAE0FChyfhn/lSJ+qGVazs7e2m8zcDoZy
        Zz94w1YfiRVwPn7/fIyD+REyLDcWYXrc4iPxJMtFNukYxc25k5JkizsY38Cf5z0/dVanbf
        dsdBCs8MmgVwS+xN9xYnU6ovNw8ehqU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-174-WP4aF6NiOvqwG2jgjrxg_Q-1; Tue, 07 Dec 2021 07:10:56 -0500
X-MC-Unique: WP4aF6NiOvqwG2jgjrxg_Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 74CBC1B2C985;
        Tue,  7 Dec 2021 12:10:55 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.194.249])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 7A765694BF;
        Tue,  7 Dec 2021 12:10:54 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org
Subject: [PATCH] HID: Ignore battery for Elan touchscreen on Asus UX550VE
Date:   Tue,  7 Dec 2021 13:10:53 +0100
Message-Id: <20211207121053.136906-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Battery status is reported for the Asus UX550VE touchscreen even though
it does not have a battery. Prevent it from always reporting the
battery as low.

BugLink: https://bugzilla.redhat.com/show_bug.cgi?id=1897823
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/hid/hid-ids.h   | 1 +
 drivers/hid/hid-input.c | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 07045184d36e..c773408038e7 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -399,6 +399,7 @@
 #define USB_DEVICE_ID_HP_X2_10_COVER	0x0755
 #define I2C_DEVICE_ID_HP_ENVY_X360_15	0x2d05
 #define I2C_DEVICE_ID_HP_SPECTRE_X360_15	0x2817
+#define USB_DEVICE_ID_ASUS_UX550VE_TOUCHSCREEN	0x2544
 #define USB_DEVICE_ID_ASUS_UX550_TOUCHSCREEN	0x2706
 #define I2C_DEVICE_ID_SURFACE_GO_TOUCHSCREEN	0x261A
 
diff --git a/drivers/hid/hid-input.c b/drivers/hid/hid-input.c
index 217f2d1b91c5..03f994541981 100644
--- a/drivers/hid/hid-input.c
+++ b/drivers/hid/hid-input.c
@@ -325,6 +325,8 @@ static const struct hid_device_id hid_battery_quirks[] = {
 	  HID_BATTERY_QUIRK_IGNORE },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_ELAN, USB_DEVICE_ID_ASUS_UX550_TOUCHSCREEN),
 	  HID_BATTERY_QUIRK_IGNORE },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_ELAN, USB_DEVICE_ID_ASUS_UX550VE_TOUCHSCREEN),
+	  HID_BATTERY_QUIRK_IGNORE },
 	{ HID_I2C_DEVICE(USB_VENDOR_ID_ELAN, I2C_DEVICE_ID_HP_ENVY_X360_15),
 	  HID_BATTERY_QUIRK_IGNORE },
 	{ HID_I2C_DEVICE(USB_VENDOR_ID_ELAN, I2C_DEVICE_ID_HP_SPECTRE_X360_15),
-- 
2.33.1

