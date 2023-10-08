Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 344257BCDA3
	for <lists+linux-input@lfdr.de>; Sun,  8 Oct 2023 11:55:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344569AbjJHJzx (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 8 Oct 2023 05:55:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343527AbjJHJzv (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 8 Oct 2023 05:55:51 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4AD6AB9
        for <linux-input@vger.kernel.org>; Sun,  8 Oct 2023 02:55:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1696758908;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=vyKbtYyY6iouGTEtEYqX+tlsTSdPpCWEROB3g6eFfS4=;
        b=TpkdmC9+NJa4CnSYnGpeB4fB5XCnkJWuMX5dFiyEq5+htlYSTLhg33fTuT8+Y22wKJQVxt
        46PIcf4Os2DsTjNwiThQa+lI7ZHT+CSVAR04cKz9LqNNnIgW3bcyvugWuDSrvlg4vJg86u
        f+YKR4bVWuO+AW7dGgHjD2NLeaHTDac=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-193-ZDsapweuN3Ox0U3mvnczvA-1; Sun, 08 Oct 2023 05:55:05 -0400
X-MC-Unique: ZDsapweuN3Ox0U3mvnczvA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 404638039C8;
        Sun,  8 Oct 2023 09:55:04 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.74])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 57C24C15BB8;
        Sun,  8 Oct 2023 09:55:03 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     =?UTF-8?q?Filipe=20La=C3=ADns?= <lains@riseup.net>,
        Bastien Nocera <hadess@hadess.net>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org
Subject: [PATCH v2 04/14] HID: logitech-hidpp: Remove connected check for non-unifying devices
Date:   Sun,  8 Oct 2023 11:54:47 +0200
Message-ID: <20231008095458.8926-5-hdegoede@redhat.com>
In-Reply-To: <20231008095458.8926-1-hdegoede@redhat.com>
References: <20231008095458.8926-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Non-unifying devices (USB, Bluetooth) are always connected during
probe(), remove the unnecessary connected check.

This is a preparation patch for moving querying if the device is connected
to after restarting IO, in case we miss a connect packet coming in while
IO is disabled during the restart.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/hid/hid-logitech-hidpp.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
index e4dbbdf46b97..82f9723154f1 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -4480,13 +4480,6 @@ static int hidpp_probe(struct hid_device *hdev, const struct hid_device_id *id)
 
 	connected = hidpp_root_get_protocol_version(hidpp) == 0;
 	atomic_set(&hidpp->connected, connected);
-	if (!(hidpp->quirks & HIDPP_QUIRK_UNIFYING)) {
-		if (!connected) {
-			ret = -ENODEV;
-			hid_err(hdev, "Device not connected");
-			goto hid_hw_init_fail;
-		}
-	}
 
 	if (connected && hidpp->protocol_major >= 2) {
 		ret = hidpp_set_wireless_feature_index(hidpp);
-- 
2.41.0

