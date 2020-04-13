Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A69F1A6A9D
	for <lists+linux-input@lfdr.de>; Mon, 13 Apr 2020 18:55:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732176AbgDMQy5 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 13 Apr 2020 12:54:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1732172AbgDMQy4 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 13 Apr 2020 12:54:56 -0400
X-Greylist: delayed 494 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 13 Apr 2020 09:54:55 PDT
Received: from mx-rz-1.rrze.uni-erlangen.de (mx-rz-1.rrze.uni-erlangen.de [IPv6:2001:638:a000:1025::14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6B91C0A3BDC
        for <linux-input@vger.kernel.org>; Mon, 13 Apr 2020 09:54:55 -0700 (PDT)
Received: from mx-rz-smart.rrze.uni-erlangen.de (mx-rz-smart.rrze.uni-erlangen.de [IPv6:2001:638:a000:1025::1e])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by mx-rz-1.rrze.uni-erlangen.de (Postfix) with ESMTPS id 491DzM2mFlz8vpx;
        Mon, 13 Apr 2020 18:46:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fau.de; s=fau-2013;
        t=1586796399; bh=J7BnlfxDY1iQhm1L8Xa0CZLSTby8XTDuqBDDYzO5m98=;
        h=From:To:Cc:Subject:Date:From:To:CC:Subject;
        b=pGSBXp8fyBQaLKIIddAhM4zdQztudzreZXznQIycPTqh+DSClQH6jNJLJWmhwhI/4
         +t/u+CqwxOlAUFUCvr00c8Ff0K4+19anbxQOrjsLsAwepjDTcu66XEaWcnIlunLzqK
         vs4akZVsRfnMjpxXx7yCtTmWNrup6YlT5rIwjGyXh/xwXAMrRIryauz/gTPMKpSJzP
         qFY3R5ghQ3vB5J+uwzrmJUT+1C2MHEyEANfBa+N4HtKTmvrAK7gOWZJMaXsaQ9WDe0
         W8US7rQGAmvKNmGTAGl7aFkpr4Se8pxkpkrF84KcA9uBBrSa+3j2JPyn+/8dteGBd5
         zqItXkW33ncPA==
X-Virus-Scanned: amavisd-new at boeck4.rrze.uni-erlangen.de (RRZE)
X-RRZE-Flag: Not-Spam
X-RRZE-Submit-IP: 2003:d5:722:8400:e224:3dd3:7a:5a33
Received: from FabPC.fritz.box (p200300D507228400E2243DD3007A5A33.dip0.t-ipconnect.de [IPv6:2003:d5:722:8400:e224:3dd3:7a:5a33])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: U2FsdGVkX1+cpYfWUcv3WDkbY7gMHvKM5+zNcTuQX7k=)
        by smtp-auth.uni-erlangen.de (Postfix) with ESMTPSA id 491DzJ6TCcz8vmw;
        Mon, 13 Apr 2020 18:46:36 +0200 (CEST)
From:   Fabian Schindlatz <fabian.schindlatz@fau.de>
To:     Hans de Goede <hdegoede@redhat.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org
Cc:     Fabian Schindlatz <fabian.schindlatz@fau.de>
Subject: [PATCH] HID: Add support for Logitech G11 extra keys
Date:   Mon, 13 Apr 2020 18:46:28 +0200
Message-Id: <20200413164628.38283-1-fabian.schindlatz@fau.de>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The Logitech G11 keyboard is a cheap variant of the G15 without the LCD
screen. It uses the same layout for its extra and macro keys (G1 - G18,
M1-M3, MR) and - from the input subsystem's perspective - behaves just
like the G15, so we can treat it as such.

Tested it with my own keyboard.

Signed-off-by: Fabian Schindlatz <fabian.schindlatz@fau.de>
---
 drivers/hid/hid-ids.h    | 1 +
 drivers/hid/hid-lg-g15.c | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index b18b13147..c6d614413 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -759,6 +759,7 @@
 #define USB_DEVICE_ID_LOGITECH_RUMBLEPAD2	0xc218
 #define USB_DEVICE_ID_LOGITECH_RUMBLEPAD2_2	0xc219
 #define USB_DEVICE_ID_LOGITECH_G15_LCD		0xc222
+#define USB_DEVICE_ID_LOGITECH_G11		0xc225
 #define USB_DEVICE_ID_LOGITECH_G15_V2_LCD	0xc227
 #define USB_DEVICE_ID_LOGITECH_G510		0xc22d
 #define USB_DEVICE_ID_LOGITECH_G510_USB_AUDIO	0xc22e
diff --git a/drivers/hid/hid-lg-g15.c b/drivers/hid/hid-lg-g15.c
index ad4b5412a..ef0cbcd75 100644
--- a/drivers/hid/hid-lg-g15.c
+++ b/drivers/hid/hid-lg-g15.c
@@ -872,6 +872,10 @@ static int lg_g15_probe(struct hid_device *hdev, const struct hid_device_id *id)
 }
 
 static const struct hid_device_id lg_g15_devices[] = {
+	/* The G11 is a G15 without the LCD, treat it as a G15 */
+	{ HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH,
+		USB_DEVICE_ID_LOGITECH_G11),
+		.driver_data = LG_G15 },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH,
 			 USB_DEVICE_ID_LOGITECH_G15_LCD),
 		.driver_data = LG_G15 },
-- 
2.26.0

