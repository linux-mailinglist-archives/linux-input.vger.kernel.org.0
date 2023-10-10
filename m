Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 288697BF875
	for <lists+linux-input@lfdr.de>; Tue, 10 Oct 2023 12:21:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230470AbjJJKVn (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 10 Oct 2023 06:21:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230447AbjJJKVm (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 10 Oct 2023 06:21:42 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D45AB7
        for <linux-input@vger.kernel.org>; Tue, 10 Oct 2023 03:20:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1696933248;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=SPTHomIqCz1WPDkADQoeMwzXe7TQYF1XBzs3+YFEivQ=;
        b=i0aeDXdSv7GVMIXxwME2nUfl4Tucg9qU1wQinndJpCPIgizq7o311pO3jbXHamD5tqmkak
        opL4zSynNgMRuacn3tb4QuwKMMHc3U3kQxbaFSQ9tFfvoQkpNqnYTpPxtrjEHtIt8aWM/5
        NPSwSogzHLzEK8vlxGEVIkrpkbLiIPs=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-600-SA0wyUehMemzrrXcEQ2oBw-1; Tue, 10 Oct 2023 06:20:45 -0400
X-MC-Unique: SA0wyUehMemzrrXcEQ2oBw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 23A5B38116E9;
        Tue, 10 Oct 2023 10:20:45 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.194.20])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 3B1FA492B16;
        Tue, 10 Oct 2023 10:20:44 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     =?UTF-8?q?Filipe=20La=C3=ADns?= <lains@riseup.net>,
        Bastien Nocera <hadess@hadess.net>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org
Subject: [PATCH v3 08/12] HID: logitech-hidpp: Remove connected check for non-unifying devices
Date:   Tue, 10 Oct 2023 12:20:25 +0200
Message-ID: <20231010102029.111003-9-hdegoede@redhat.com>
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

Non-unifying devices (USB, Bluetooth) are always connected during
probe(), remove the unnecessary connected check.

This is a preparation patch for moving all connected state handling
to hidpp_connect_event().

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
 drivers/hid/hid-logitech-hidpp.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
index 55fc80f3be05..21f41c147f9b 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -4487,13 +4487,6 @@ static int hidpp_probe(struct hid_device *hdev, const struct hid_device_id *id)
 
 	connected = hidpp_root_get_protocol_version(hidpp) == 0;
 	atomic_set(&hidpp->connected, connected);
-	if (!(hidpp->quirks & HIDPP_QUIRK_UNIFYING)) {
-		if (!connected) {
-			ret = -ENODEV;
-			hid_err(hdev, "Device not connected");
-			goto hid_hw_init_fail;
-		}
-	}
 
 	schedule_work(&hidpp->work);
 	flush_work(&hidpp->work);
-- 
2.41.0

