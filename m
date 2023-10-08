Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 381DD7BCDAE
	for <lists+linux-input@lfdr.de>; Sun,  8 Oct 2023 11:56:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344595AbjJHJ4m (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 8 Oct 2023 05:56:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344594AbjJHJ4j (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 8 Oct 2023 05:56:39 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C61FDB
        for <linux-input@vger.kernel.org>; Sun,  8 Oct 2023 02:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1696758915;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=KJq/Ec7wnLFV4pTAzO90EYK/ZY+gdtXPDKi7fGxTIbI=;
        b=i1D2zJVes1OLz7Ygk1EV80HQr4APFt+zKtzfEcGt/rpH1u86Si6MTyVMqy3UTAlgApRhOe
        C3glC51ys5LKDf1DyhI6I7NH4advBDRa8rGbqsRzadnJdWKgKOiVPYBryF6MfGD9CE4u4v
        bVIOvq4vdps2eNoEUmy4p8cUE7raiN4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-520-CjQCd6YHMiOXQXxUortCWQ-1; Sun, 08 Oct 2023 05:55:10 -0400
X-MC-Unique: CjQCd6YHMiOXQXxUortCWQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DB7EF185A78E;
        Sun,  8 Oct 2023 09:55:09 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.74])
        by smtp.corp.redhat.com (Postfix) with ESMTP id D7803C15BB8;
        Sun,  8 Oct 2023 09:55:08 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     =?UTF-8?q?Filipe=20La=C3=ADns?= <lains@riseup.net>,
        Bastien Nocera <hadess@hadess.net>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org,
        Benjamin Tissoires <bentiss@kernel.org>
Subject: [PATCH v2 09/14] HID: logitech-hidpp: Move the connected check to after restarting IO
Date:   Sun,  8 Oct 2023 11:54:52 +0200
Message-ID: <20231008095458.8926-10-hdegoede@redhat.com>
In-Reply-To: <20231008095458.8926-1-hdegoede@redhat.com>
References: <20231008095458.8926-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

While restarting IO incoming packets get disabled by calling
hid_device_io_stop() and they do not get re-enabled again until
the hid-core enables the when probe() is done.

This leaves a window where connect events may get lost, causing
hidpp to not be aware that a device has (dis)connected.

To fix this fully restart IO using the new hidpp_connect_and_start()
helper and move the connected check to after restarting IO.

This requires calling hid_hw_close() at the end of probe() to balance
the open() now done on restart.

Reported-by: Benjamin Tissoires <bentiss@kernel.org>
Closes: https://lore.kernel.org/linux-input/zjiang3fdy4o7r3daupwpnx6zesmeeerldpx5fno2adzialpre@cdp7tq4araww/
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/hid/hid-logitech-hidpp.c | 33 ++++++++++++++++++++------------
 1 file changed, 21 insertions(+), 12 deletions(-)

diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
index 45b371e7b9ee..ff834f905eda 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -4482,8 +4482,10 @@ static int hidpp_probe(struct hid_device *hdev, const struct hid_device_id *id)
 			 hdev->name);
 
 	/*
-	 * Plain USB connections need to actually call start and open
-	 * on the transport driver to allow incoming data.
+	 * First call hid_hw_start(hdev, 0) to allow IO without connecting any
+	 * hid subdrivers (hid-input, hidraw). This allows retrieving the dev's
+	 * name and serial number and store these in hdev->name and hdev->uniq,
+	 * before the hid-input and hidraw drivers expose these to userspace.
 	 */
 	ret = hidpp_connect_and_start(hidpp, 0);
 	if (ret)
@@ -4495,18 +4497,12 @@ static int hidpp_probe(struct hid_device *hdev, const struct hid_device_id *id)
 	else
 		hidpp_non_unifying_init(hidpp);
 
-	connected = hidpp_root_get_protocol_version(hidpp) == 0;
-	atomic_set(&hidpp->connected, connected);
-
 	if (hidpp->quirks & HIDPP_QUIRK_CLASS_G920) {
 		ret = g920_get_config(hidpp, &data);
 		if (ret)
 			goto hid_hw_init_fail;
 	}
 
-	schedule_work(&hidpp->work);
-	flush_work(&hidpp->work);
-
 	/* Reset the HID node state */
 	hid_device_io_stop(hdev);
 	hid_hw_close(hdev);
@@ -4516,11 +4512,19 @@ static int hidpp_probe(struct hid_device *hdev, const struct hid_device_id *id)
 		connect_mask &= ~HID_CONNECT_HIDINPUT;
 
 	/* Now export the actual inputs and hidraw nodes to the world */
-	ret = hid_hw_start(hdev, connect_mask);
-	if (ret) {
-		hid_err(hdev, "%s:hid_hw_start returned error\n", __func__);
+	ret = hidpp_connect_and_start(hidpp, connect_mask);
+	if (ret)
 		goto hid_hw_start_fail;
-	}
+
+	/*
+	 * Now that incoming packets are enabled and will not be disabled
+	 * again (which may cause missing packets) check the connected state
+	 * of the device.
+	 */
+	connected = hidpp_root_get_protocol_version(hidpp) == 0;
+	atomic_set(&hidpp->connected, connected);
+	schedule_work(&hidpp->work);
+	flush_work(&hidpp->work);
 
 	if (hidpp->quirks & HIDPP_QUIRK_CLASS_G920) {
 		ret = hidpp_ff_init(hidpp, &data);
@@ -4530,6 +4534,11 @@ static int hidpp_probe(struct hid_device *hdev, const struct hid_device_id *id)
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

