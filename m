Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 411037BF879
	for <lists+linux-input@lfdr.de>; Tue, 10 Oct 2023 12:21:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230478AbjJJKVq (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 10 Oct 2023 06:21:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230438AbjJJKVp (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 10 Oct 2023 06:21:45 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2780694
        for <linux-input@vger.kernel.org>; Tue, 10 Oct 2023 03:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1696933256;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Hr8b9UdRX/e9NOqeyZt7s7MC031+VH1EB3UMxauKTdg=;
        b=MmieonOUsSh3lclPUwdGVjzgKjRTFjJ0hphgnPhHGe25pkWLIH4iicjM1n/3QHqIJvvr14
        sfGGZKyy1vrwx/RUk+0h0ZGoF9dACL7jZX7XCp099tljvn7fCZEsudAcBYvS7YVdIbF8yr
        JtEM0C3M/CNpe2sC08iZxtSRfRMYUlA=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-266-nkrwff9mMZC6Mg8F60jhnw-1; Tue, 10 Oct 2023 06:20:43 -0400
X-MC-Unique: nkrwff9mMZC6Mg8F60jhnw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E3F973C1CC28;
        Tue, 10 Oct 2023 10:20:42 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.194.20])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 0889A492B16;
        Tue, 10 Oct 2023 10:20:41 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     =?UTF-8?q?Filipe=20La=C3=ADns?= <lains@riseup.net>,
        Bastien Nocera <hadess@hadess.net>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org
Subject: [PATCH v3 06/12] HID: logitech-hidpp: Move hidpp_overwrite_name() to before connect check
Date:   Tue, 10 Oct 2023 12:20:23 +0200
Message-ID: <20231010102029.111003-7-hdegoede@redhat.com>
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

Move the hidpp_overwrite_name() call to before the connect check, this
puts it at the same place in the probe() order as hidpp_serial_init()
which seems more logical. This should not make a difference since this
is in the non-unifying path and only unifying devices can be probed
in non-connected state.

This is a preparation patch for moving all connected state handling
to hidpp_connect_event().

Doing this before the connect check requires dropping the protocol
version check since protocol_major is not set yet now. Instead
this relies on hidpp_root_get_feature(HIDPP_PAGE_GET_DEVICE_NAME_TYPE)
failing on older devices, just like how hidpp_get_serial() relies on
hidpp_root_get_feature(HIDPP_PAGE_DEVICE_INFORMATION) failing on older
devices. So this again makes the code more consistent.

Also stop printing an error on failure now, since with the proto
version check gone failures are expected to happen on older devices.

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
Note: The weird unbalanced curly braces in the "else { ... }" go away
in the next patch in the series.
---
 drivers/hid/hid-logitech-hidpp.c | 21 ++++++++-------------
 1 file changed, 8 insertions(+), 13 deletions(-)

diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
index dd67749301a8..799d1a429d81 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -4135,19 +4135,12 @@ static void hidpp_overwrite_name(struct hid_device *hdev)
 	struct hidpp_device *hidpp = hid_get_drvdata(hdev);
 	char *name;
 
-	if (hidpp->protocol_major < 2)
-		return;
-
 	name = hidpp_get_device_name(hidpp);
-
-	if (!name) {
-		hid_err(hdev, "unable to retrieve the name of the device");
-	} else {
+	if (name) {
 		dbg_hid("HID++: Got name: %s\n", name);
 		snprintf(hdev->name, sizeof(hdev->name), "%s", name);
+		kfree(name);
 	}
-
-	kfree(name);
 }
 
 static int hidpp_input_open(struct input_dev *dev)
@@ -4483,8 +4476,12 @@ static int hidpp_probe(struct hid_device *hdev, const struct hid_device_id *id)
 
 	if (hidpp->quirks & HIDPP_QUIRK_UNIFYING)
 		hidpp_unifying_init(hidpp);
-	else if (hid_is_usb(hidpp->hid_dev))
-		hidpp_serial_init(hidpp);
+	else {
+		if (hid_is_usb(hidpp->hid_dev))
+			hidpp_serial_init(hidpp);
+
+		hidpp_overwrite_name(hdev);
+	}
 
 	connected = hidpp_root_get_protocol_version(hidpp) == 0;
 	atomic_set(&hidpp->connected, connected);
@@ -4494,8 +4491,6 @@ static int hidpp_probe(struct hid_device *hdev, const struct hid_device_id *id)
 			hid_err(hdev, "Device not connected");
 			goto hid_hw_init_fail;
 		}
-
-		hidpp_overwrite_name(hdev);
 	}
 
 	schedule_work(&hidpp->work);
-- 
2.41.0

