Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9DDAC7BF87D
	for <lists+linux-input@lfdr.de>; Tue, 10 Oct 2023 12:22:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230503AbjJJKV7 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 10 Oct 2023 06:21:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230483AbjJJKV6 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 10 Oct 2023 06:21:58 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE25DAF
        for <linux-input@vger.kernel.org>; Tue, 10 Oct 2023 03:21:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1696933267;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=/tVr/izul10Iw2LV2X+wvtXF+u95KNN6Rzd+SQqZxB0=;
        b=GbWUMxCMZntCCs7e+vmnHZGDq2AvlS2RGhYuIXMimI9aD3UWaXAYPiOfWtyAnLFrE5QusL
        ErMOf01RCwiKRRStWZnsOonmL6V7eZ+bTLH+kCRL72Bv30QY2XjUZax/ai664zXeQ7kaqa
        IkTn4l6ddFfC5zxzgu34+R7KVLw/y58=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-628-ocDEz45SPH6YqvhdGQfelg-1; Tue, 10 Oct 2023 06:20:48 -0400
X-MC-Unique: ocDEz45SPH6YqvhdGQfelg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A3E2F80CDA1;
        Tue, 10 Oct 2023 10:20:47 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.194.20])
        by smtp.corp.redhat.com (Postfix) with ESMTP id BAB9640BAED;
        Tue, 10 Oct 2023 10:20:46 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     =?UTF-8?q?Filipe=20La=C3=ADns?= <lains@riseup.net>,
        Bastien Nocera <hadess@hadess.net>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org
Subject: [PATCH v3 10/12] HID: logitech-hidpp: Fix connect event race
Date:   Tue, 10 Oct 2023 12:20:27 +0200
Message-ID: <20231010102029.111003-11-hdegoede@redhat.com>
In-Reply-To: <20231010102029.111003-1-hdegoede@redhat.com>
References: <20231010102029.111003-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Spam-Status: No, score=-0.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,PDS_OTHER_BAD_TLD,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

There is a connect event race in hidpp_probe() in these 2 lines:

	connected = hidpp_root_get_protocol_version(hidpp) == 0;
	atomic_set(&hidpp->connected, connected);

Specifically the following can happen:

1. This line from hidpp_probe() is executed:
	connected = hidpp_root_get_protocol_version(hidpp) == 0;
   and sets connected to false;

2. A connect-event packet is received and does:
	atomic_set(&hidpp->connected, true);

3. The next line from hidpp_probe() is executed:
	atomic_set(&hidpp->connected, connected);
   and sets the atomic_t back to 0 again.

4. hidpp_connect_event() runs and sees the connected device
   as disconnected because of this.

To fix this make hidpp_connect_event() query the connection status
of the device itself instead of having it rely on possibly stale
data cached in struct hidpp_device.

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
 drivers/hid/hid-logitech-hidpp.c | 25 +++++--------------------
 1 file changed, 5 insertions(+), 20 deletions(-)

diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
index e945e4e8180f..4793a3236f17 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -194,7 +194,6 @@ struct hidpp_device {
 
 	struct work_struct work;
 	struct kfifo delayed_work_fifo;
-	atomic_t connected;
 	struct input_dev *delayed_input;
 
 	unsigned long quirks;
@@ -3893,8 +3892,6 @@ static int hidpp_raw_hidpp_event(struct hidpp_device *hidpp, u8 *data,
 	}
 
 	if (unlikely(hidpp_report_is_connect_event(hidpp, report))) {
-		atomic_set(&hidpp->connected,
-				!(report->rap.params[0] & (1 << 6)));
 		if (schedule_work(&hidpp->work) == 0)
 			dbg_hid("%s: connect event already queued\n", __func__);
 		return 1;
@@ -4189,12 +4186,14 @@ static struct input_dev *hidpp_allocate_input(struct hid_device *hdev)
 static void hidpp_connect_event(struct hidpp_device *hidpp)
 {
 	struct hid_device *hdev = hidpp->hid_dev;
-	int ret = 0;
-	bool connected = atomic_read(&hidpp->connected);
 	struct input_dev *input;
 	char *name, *devm_name;
+	int ret;
 
-	if (!connected) {
+	/* Get device version to check if it is connected */
+	ret = hidpp_root_get_protocol_version(hidpp);
+	if (ret) {
+		hid_info(hidpp->hid_dev, "Disconnected\n");
 		if (hidpp->battery.ps) {
 			hidpp->battery.online = false;
 			hidpp->battery.status = POWER_SUPPLY_STATUS_UNKNOWN;
@@ -4236,16 +4235,6 @@ static void hidpp_connect_event(struct hidpp_device *hidpp)
 			return;
 	}
 
-	/* the device is already connected, we can ask for its name and
-	 * protocol */
-	if (!hidpp->protocol_major) {
-		ret = hidpp_root_get_protocol_version(hidpp);
-		if (ret) {
-			hid_err(hdev, "Can not get the protocol version.\n");
-			return;
-		}
-	}
-
 	if (hidpp->protocol_major >= 2) {
 		u8 feature_index;
 
@@ -4395,7 +4384,6 @@ static int hidpp_probe(struct hid_device *hdev, const struct hid_device_id *id)
 {
 	struct hidpp_device *hidpp;
 	int ret;
-	bool connected;
 	unsigned int connect_mask = HID_CONNECT_DEFAULT;
 
 	/* report_fixup needs drvdata to be set before we call hid_parse */
@@ -4485,9 +4473,6 @@ static int hidpp_probe(struct hid_device *hdev, const struct hid_device_id *id)
 	else
 		hidpp_non_unifying_init(hidpp);
 
-	connected = hidpp_root_get_protocol_version(hidpp) == 0;
-	atomic_set(&hidpp->connected, connected);
-
 	schedule_work(&hidpp->work);
 	flush_work(&hidpp->work);
 
-- 
2.41.0

