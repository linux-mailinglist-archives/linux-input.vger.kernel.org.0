Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ED1737BF86F
	for <lists+linux-input@lfdr.de>; Tue, 10 Oct 2023 12:21:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229941AbjJJKVc (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 10 Oct 2023 06:21:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229898AbjJJKVa (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 10 Oct 2023 06:21:30 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 474649F
        for <linux-input@vger.kernel.org>; Tue, 10 Oct 2023 03:20:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1696933244;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=OUih3xszGL6x2jDUcZVrw9xvvXh1RcUqXW1mldxnndU=;
        b=HElmjYSxHjA9b0oNkW6F36P0RnLgZ+brD5VzpruSggA+ZdY2ZFXNVVk65nFyQ2TQOBhid4
        2po+lzndS7q8MsW0z7qpIm77aQlUy9yzaW6ES/Oiz/lxk61DRSIbPo64KOizTwPUrIegmV
        RXiovWrqSNbUZPgl7UTr5CH7uHBPadc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-437-Jadi0xNMOSi8S77m15Yexg-1; Tue, 10 Oct 2023 06:20:42 -0400
X-MC-Unique: Jadi0xNMOSi8S77m15Yexg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CAA8D802C1A;
        Tue, 10 Oct 2023 10:20:41 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.194.20])
        by smtp.corp.redhat.com (Postfix) with ESMTP id E3571492B16;
        Tue, 10 Oct 2023 10:20:40 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     =?UTF-8?q?Filipe=20La=C3=ADns?= <lains@riseup.net>,
        Bastien Nocera <hadess@hadess.net>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org
Subject: [PATCH v3 05/12] HID: logitech-hidpp: Move g920_get_config() to just before hidpp_ff_init()
Date:   Tue, 10 Oct 2023 12:20:22 +0200
Message-ID: <20231010102029.111003-6-hdegoede@redhat.com>
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

The data retrieved by g920_get_config() is only used by hidpp_ff_init().

Now that the hw is kept open till the end of probe() the g920_get_config()
call can be moved to just before hidpp_ff_init() to have all
the HIDPP_QUIRK_CLASS_G920 together in a single place.

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
 drivers/hid/hid-logitech-hidpp.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
index 707fb9616fc5..dd67749301a8 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -4399,7 +4399,6 @@ static int hidpp_probe(struct hid_device *hdev, const struct hid_device_id *id)
 	int ret;
 	bool connected;
 	unsigned int connect_mask = HID_CONNECT_DEFAULT;
-	struct hidpp_ff_private_data data;
 
 	/* report_fixup needs drvdata to be set before we call hid_parse */
 	hidpp = devm_kzalloc(&hdev->dev, sizeof(*hidpp), GFP_KERNEL);
@@ -4499,12 +4498,6 @@ static int hidpp_probe(struct hid_device *hdev, const struct hid_device_id *id)
 		hidpp_overwrite_name(hdev);
 	}
 
-	if (connected && (hidpp->quirks & HIDPP_QUIRK_CLASS_G920)) {
-		ret = g920_get_config(hidpp, &data);
-		if (ret)
-			goto hid_hw_init_fail;
-	}
-
 	schedule_work(&hidpp->work);
 	flush_work(&hidpp->work);
 
@@ -4519,7 +4512,12 @@ static int hidpp_probe(struct hid_device *hdev, const struct hid_device_id *id)
 	}
 
 	if (hidpp->quirks & HIDPP_QUIRK_CLASS_G920) {
-		ret = hidpp_ff_init(hidpp, &data);
+		struct hidpp_ff_private_data data;
+
+		ret = g920_get_config(hidpp, &data);
+		if (!ret)
+			ret = hidpp_ff_init(hidpp, &data);
+
 		if (ret)
 			hid_warn(hidpp->hid_dev,
 		     "Unable to initialize force feedback support, errno %d\n",
-- 
2.41.0

