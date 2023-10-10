Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 59FBC7BF87C
	for <lists+linux-input@lfdr.de>; Tue, 10 Oct 2023 12:21:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230511AbjJJKVt (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 10 Oct 2023 06:21:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230503AbjJJKVr (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 10 Oct 2023 06:21:47 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30AE3A7
        for <linux-input@vger.kernel.org>; Tue, 10 Oct 2023 03:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1696933255;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=xE1ccqqTffNgSfv/UK92EiUp8YPGkUSRbzfuN3YASPY=;
        b=LIeCCBWyg3zrN9Te0aHw6LkFn0VLHMARLTmsJUD/7Em+bUlf2idr4qxivAaXAZZRd1SLra
        bA8OdobjZsI9G9D+vRYPtgSFCbf/byczRz04GmBPZS4itEDcl8SUWozmCGbKyM9Wo+EW27
        r1wlmtAx6aosR02Bbrfo0cgJXgt3nGk=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-685-B48yPnurOrKgK2Opx2ghKQ-1; Tue, 10 Oct 2023 06:20:49 -0400
X-MC-Unique: B48yPnurOrKgK2Opx2ghKQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BB43F2999B34;
        Tue, 10 Oct 2023 10:20:48 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.194.20])
        by smtp.corp.redhat.com (Postfix) with ESMTP id D6230492B16;
        Tue, 10 Oct 2023 10:20:47 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     =?UTF-8?q?Filipe=20La=C3=ADns?= <lains@riseup.net>,
        Bastien Nocera <hadess@hadess.net>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org
Subject: [PATCH v3 11/12] HID: logitech-hidpp: Drop delayed_work_cb()
Date:   Tue, 10 Oct 2023 12:20:28 +0200
Message-ID: <20231010102029.111003-12-hdegoede@redhat.com>
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

Drop delayed_work_cb() instead make hidpp_connect_event() the workqueue
function itself.

Besides resulting in a small cleanup this will hopefully also make
it clearer that going forward hidpp_connect_event() should only
be run from a workqueue and not be directly invoked.

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
 drivers/hid/hid-logitech-hidpp.c | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
index 4793a3236f17..e75cf4300c59 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -234,8 +234,6 @@ struct hidpp_device {
 #define HIDPP20_ERROR_UNSUPPORTED		0x09
 #define HIDPP20_ERROR				0xff
 
-static void hidpp_connect_event(struct hidpp_device *hidpp_dev);
-
 static int __hidpp_send_report(struct hid_device *hdev,
 				struct hidpp_report *hidpp_report)
 {
@@ -449,13 +447,6 @@ static int hidpp_send_rap_command_sync(struct hidpp_device *hidpp_dev,
 	return ret;
 }
 
-static void delayed_work_cb(struct work_struct *work)
-{
-	struct hidpp_device *hidpp = container_of(work, struct hidpp_device,
-							work);
-	hidpp_connect_event(hidpp);
-}
-
 static inline bool hidpp_match_answer(struct hidpp_report *question,
 		struct hidpp_report *answer)
 {
@@ -4183,8 +4174,9 @@ static struct input_dev *hidpp_allocate_input(struct hid_device *hdev)
 	return input_dev;
 }
 
-static void hidpp_connect_event(struct hidpp_device *hidpp)
+static void hidpp_connect_event(struct work_struct *work)
 {
+	struct hidpp_device *hidpp = container_of(work, struct hidpp_device, work);
 	struct hid_device *hdev = hidpp->hid_dev;
 	struct input_dev *input;
 	char *name, *devm_name;
@@ -4435,7 +4427,7 @@ static int hidpp_probe(struct hid_device *hdev, const struct hid_device_id *id)
 			return ret;
 	}
 
-	INIT_WORK(&hidpp->work, delayed_work_cb);
+	INIT_WORK(&hidpp->work, hidpp_connect_event);
 	mutex_init(&hidpp->send_mutex);
 	init_waitqueue_head(&hidpp->wait);
 
-- 
2.41.0

