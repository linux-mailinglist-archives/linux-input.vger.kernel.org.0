Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 007C07BF87B
	for <lists+linux-input@lfdr.de>; Tue, 10 Oct 2023 12:21:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230481AbjJJKVt (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 10 Oct 2023 06:21:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230446AbjJJKVr (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 10 Oct 2023 06:21:47 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6692B8
        for <linux-input@vger.kernel.org>; Tue, 10 Oct 2023 03:21:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1696933264;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=UdpdjyVD02OyEiUcAo5APfINF1etjl5SvdClT84hFg8=;
        b=gK1XIF9Spj2CpRpjx7jf9but2gdJm4x02fUSLWO8dt0P7rtFHrYsHV3ezdOigxfo4i7vVZ
        DaX77qUrBKSm/36EwjZ7WTSiMmewCgR3RyRQwpe34yCQU0Sjk6ueLU/ZHobmtNa2hfATJ4
        2e2qDhA4/CQWY3gwqWM6fHbsJcl6Nqc=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-8-4G4RTYR5OOiI7gJ7KjVO6g-1; Tue, 10 Oct 2023 06:20:50 -0400
X-MC-Unique: 4G4RTYR5OOiI7gJ7KjVO6g-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D33703C1CC36;
        Tue, 10 Oct 2023 10:20:49 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.194.20])
        by smtp.corp.redhat.com (Postfix) with ESMTP id ED562492B16;
        Tue, 10 Oct 2023 10:20:48 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     =?UTF-8?q?Filipe=20La=C3=ADns?= <lains@riseup.net>,
        Bastien Nocera <hadess@hadess.net>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org
Subject: [PATCH v3 12/12] HID: logitech-hidpp: Drop HIDPP_QUIRK_UNIFYING
Date:   Tue, 10 Oct 2023 12:20:29 +0200
Message-ID: <20231010102029.111003-13-hdegoede@redhat.com>
In-Reply-To: <20231010102029.111003-1-hdegoede@redhat.com>
References: <20231010102029.111003-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

HIDPP unifying is only checked once in probe() and it is also
set by probe() itself.

Drop the quirk and replace its one check by the condition which is
used to set the quirk in the first place.

This series has been tested on the following devices:
Logitech Bluetooth Laser Travel Mouse (bluetooth, HID++ 1.0)
Logitech M720 Triathlon (bluetooth, HID++ 4.5)
Logitech M720 Triathlon (unifying, HID++ 4.5)
Logitech K400 Pro (unifying, HID++ 4.1)
Logitech K270 (eQUAD nano Lite, HID++ 2.0)
Logitech M185 (eQUAD nano Lite, HID++ 4.5)
Logitech LX501 keyboard (27 Mhz, HID++ builtin scroll-wheel, HID++ 1.0)
Logitech M-RAZ105 mouse (27 Mhz, HID++ extra mouse buttons, HID++ 1.0)

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/hid/hid-logitech-hidpp.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
index e75cf4300c59..c1bc89560612 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -69,12 +69,11 @@ MODULE_PARM_DESC(disable_tap_to_click,
 #define HIDPP_QUIRK_WTP_PHYSICAL_BUTTONS	BIT(22)
 #define HIDPP_QUIRK_DELAYED_INIT		BIT(23)
 #define HIDPP_QUIRK_FORCE_OUTPUT_REPORTS	BIT(24)
-#define HIDPP_QUIRK_UNIFYING			BIT(25)
-#define HIDPP_QUIRK_HIDPP_WHEELS		BIT(26)
-#define HIDPP_QUIRK_HIDPP_EXTRA_MOUSE_BTNS	BIT(27)
-#define HIDPP_QUIRK_HIDPP_CONSUMER_VENDOR_KEYS	BIT(28)
-#define HIDPP_QUIRK_HI_RES_SCROLL_1P0		BIT(29)
-#define HIDPP_QUIRK_WIRELESS_STATUS		BIT(30)
+#define HIDPP_QUIRK_HIDPP_WHEELS		BIT(25)
+#define HIDPP_QUIRK_HIDPP_EXTRA_MOUSE_BTNS	BIT(26)
+#define HIDPP_QUIRK_HIDPP_CONSUMER_VENDOR_KEYS	BIT(27)
+#define HIDPP_QUIRK_HI_RES_SCROLL_1P0		BIT(28)
+#define HIDPP_QUIRK_WIRELESS_STATUS		BIT(29)
 
 /* These are just aliases for now */
 #define HIDPP_QUIRK_KBD_SCROLL_WHEEL HIDPP_QUIRK_HIDPP_WHEELS
@@ -4405,9 +4404,6 @@ static int hidpp_probe(struct hid_device *hdev, const struct hid_device_id *id)
 		return hid_hw_start(hdev, HID_CONNECT_DEFAULT);
 	}
 
-	if (id->group == HID_GROUP_LOGITECH_DJ_DEVICE)
-		hidpp->quirks |= HIDPP_QUIRK_UNIFYING;
-
 	if (id->group == HID_GROUP_LOGITECH_27MHZ_DEVICE &&
 	    hidpp_application_equals(hdev, HID_GD_MOUSE))
 		hidpp->quirks |= HIDPP_QUIRK_HIDPP_WHEELS |
@@ -4460,7 +4456,7 @@ static int hidpp_probe(struct hid_device *hdev, const struct hid_device_id *id)
 	hid_device_io_start(hdev);
 
 	/* Get name + serial, store in hdev->name + hdev->uniq */
-	if (hidpp->quirks & HIDPP_QUIRK_UNIFYING)
+	if (id->group == HID_GROUP_LOGITECH_DJ_DEVICE)
 		hidpp_unifying_init(hidpp);
 	else
 		hidpp_non_unifying_init(hidpp);
-- 
2.41.0

