Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D78327BF871
	for <lists+linux-input@lfdr.de>; Tue, 10 Oct 2023 12:21:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230096AbjJJKVd (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 10 Oct 2023 06:21:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230293AbjJJKVb (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 10 Oct 2023 06:21:31 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4755AC
        for <linux-input@vger.kernel.org>; Tue, 10 Oct 2023 03:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1696933242;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ZipaRyF9OFkp/h6Gn5toww3lVUmAW/k0zQfiyA9seSI=;
        b=Kkf9hY5kwETJd9s/edV1R5jiNAY4vpHTGZpr5OtacGBbx5oju7ZxIavCYh6rw/CX5MrfxT
        bC11Jh6I1jcyqtW+Fxr002XC2fTFLQLvUzQHfeGCDNfJKGpy6tITPxqZjHR+RKTc5WDkRH
        XawOB17xyg9AF7C3aF5s2gSgIGQlN/c=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-217-112qfx_RMSSl8M1mNtuT6A-1; Tue, 10 Oct 2023 06:20:37 -0400
X-MC-Unique: 112qfx_RMSSl8M1mNtuT6A-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 69A283C1CC35;
        Tue, 10 Oct 2023 10:20:37 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.194.20])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 67F1847AD4A;
        Tue, 10 Oct 2023 10:20:36 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     =?UTF-8?q?Filipe=20La=C3=ADns?= <lains@riseup.net>,
        Bastien Nocera <hadess@hadess.net>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org,
        Benjamin Tissoires <bentiss@kernel.org>
Subject: [PATCH v3 01/12] HID: logitech-hidpp: Don't restart IO, instead defer hid_connect() only
Date:   Tue, 10 Oct 2023 12:20:18 +0200
Message-ID: <20231010102029.111003-2-hdegoede@redhat.com>
In-Reply-To: <20231010102029.111003-1-hdegoede@redhat.com>
References: <20231010102029.111003-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Restarting IO causes 2 problems:

1. Some devices do not like IO being restarted this was addressed in
   commit 498ba2069035 ("HID: logitech-hidpp: Don't restart communication
   if not necessary"), but that change has issues of its own and needs to
   be reverted.

2. Restarting IO and specifically calling hid_device_io_stop() causes
   received packets to be missed, which may cause connect-events to
   get missed.

Restarting IO was introduced in commit 91cf9a98ae41 ("HID: logitech-hidpp:
make .probe usbhid capable") to allow to retrieve the device's name and
serial number and store these in hdev->name and hdev->uniq before
connecting any hid subdrivers (hid-input, hidraw) exporting this info
to userspace.

But this does not require restarting IO, this merely requires deferring
calling hid_connect(). Calling hid_hw_start() with a connect-mask of
0 makes it skip calling hid_connect(), so hidpp_probe() can simply call
hid_connect() later without needing to restart IO.

Remove the stop + restart of IO and instead just call hid_connect() later
to avoid the issues caused by restarting IO.

Now that IO is no longer stopped, hid_hw_close() must be called at the end
of probe() to balance the hid_hw_open() done at the beginning probe().

This series has been tested on the following devices:
Logitech Bluetooth Laser Travel Mouse (bluetooth, HID++ 1.0)
Logitech M720 Triathlon (bluetooth, HID++ 4.5)
Logitech M720 Triathlon (unifying, HID++ 4.5)
Logitech K400 Pro (unifying, HID++ 4.1)
Logitech K270 (eQUAD nano Lite, HID++ 2.0)
Logitech M185 (eQUAD nano Lite, HID++ 4.5)
Logitech LX501 keyboard (27 Mhz, HID++ builtin scroll-wheel, HID++ 1.0)
Logitech M-RAZ105 mouse (27 Mhz, HID++ extra mouse buttons, HID++ 1.0)

Fixes: 498ba2069035 ("HID: logitech-hidpp: Don't restart communication if not necessary")
Suggested-by: Benjamin Tissoires <bentiss@kernel.org>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/hid/hid-logitech-hidpp.c | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
index a209d51bd247..aa4f232c4518 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -4460,8 +4460,10 @@ static int hidpp_probe(struct hid_device *hdev, const struct hid_device_id *id)
 			 hdev->name);
 
 	/*
-	 * Plain USB connections need to actually call start and open
-	 * on the transport driver to allow incoming data.
+	 * First call hid_hw_start(hdev, 0) to allow IO without connecting any
+	 * hid subdrivers (hid-input, hidraw). This allows retrieving the dev's
+	 * name and serial number and store these in hdev->name and hdev->uniq,
+	 * before the hid-input and hidraw drivers expose these to userspace.
 	 */
 	ret = hid_hw_start(hdev, will_restart ? 0 : connect_mask);
 	if (ret) {
@@ -4519,19 +4521,14 @@ static int hidpp_probe(struct hid_device *hdev, const struct hid_device_id *id)
 	flush_work(&hidpp->work);
 
 	if (will_restart) {
-		/* Reset the HID node state */
-		hid_device_io_stop(hdev);
-		hid_hw_close(hdev);
-		hid_hw_stop(hdev);
-
 		if (hidpp->quirks & HIDPP_QUIRK_DELAYED_INIT)
 			connect_mask &= ~HID_CONNECT_HIDINPUT;
 
 		/* Now export the actual inputs and hidraw nodes to the world */
-		ret = hid_hw_start(hdev, connect_mask);
+		ret = hid_connect(hdev, connect_mask);
 		if (ret) {
-			hid_err(hdev, "%s:hid_hw_start returned error\n", __func__);
-			goto hid_hw_start_fail;
+			hid_err(hdev, "%s:hid_connect returned error %d\n", __func__, ret);
+			goto hid_hw_init_fail;
 		}
 	}
 
@@ -4543,6 +4540,11 @@ static int hidpp_probe(struct hid_device *hdev, const struct hid_device_id *id)
 				 ret);
 	}
 
+	/*
+	 * This relies on logi_dj_ll_close() being a no-op so that DJ connection
+	 * events will still be received.
+	 */
+	hid_hw_close(hdev);
 	return ret;
 
 hid_hw_init_fail:
-- 
2.41.0

