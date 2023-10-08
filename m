Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6FF0F7BCDAC
	for <lists+linux-input@lfdr.de>; Sun,  8 Oct 2023 11:56:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344604AbjJHJ4l (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 8 Oct 2023 05:56:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344601AbjJHJ4j (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 8 Oct 2023 05:56:39 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF0A1D6
        for <linux-input@vger.kernel.org>; Sun,  8 Oct 2023 02:55:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1696758909;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=m5Wx+p0kRhQubpyIx6inGC9BRA9xSG1uoLrE4lbSn08=;
        b=G3I2IT0yVOMXDSd3OyiE9bAE61Wv0zIBm7BfcXEcx0AP7kwqb5ifEDwXkfb0/klnu8OK+R
        BCR8aZlreBxFFoP3Nbj1NcMoJTv7ocz3mUv/BKHdejjciE+DGCW/YkvIgDp3Jh9nJkrnxr
        wOcBMuom8VtkHCsl04NQSryreSEiR4g=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-170-TOKu0S9EMgGB2ACJ6g7qMg-1; Sun, 08 Oct 2023 05:55:06 -0400
X-MC-Unique: TOKu0S9EMgGB2ACJ6g7qMg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7401A101A550;
        Sun,  8 Oct 2023 09:55:06 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.74])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 8D5CEC15BB8;
        Sun,  8 Oct 2023 09:55:05 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     =?UTF-8?q?Filipe=20La=C3=ADns?= <lains@riseup.net>,
        Bastien Nocera <hadess@hadess.net>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org
Subject: [PATCH v2 06/14] HID: logitech-hidpp: Remove wtp_get_config() call from probe()
Date:   Sun,  8 Oct 2023 11:54:49 +0200
Message-ID: <20231008095458.8926-7-hdegoede@redhat.com>
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

For WTP devices which start disconnected (paired with the unifying
receiver, but not connected atm) hidpp_connect_event() takes care
of calling wtp_get_config() when the device later connects.

There is no need to have a separate code path for WTP devices which
are connected at probe() time, these can use the same code-path since
probe() will queue the hidpp_connect_event() for those at probe time.

Drop the unnecessary wtp_get_config() call from probe().

This is a preparation patch for moving the connect check to after
restarting IO, in case we miss a connect packet coming in while IO
is disabled during the restart.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/hid/hid-logitech-hidpp.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
index fe4c4871ea5c..d7375885b0c7 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -4487,11 +4487,7 @@ static int hidpp_probe(struct hid_device *hdev, const struct hid_device_id *id)
 	connected = hidpp_root_get_protocol_version(hidpp) == 0;
 	atomic_set(&hidpp->connected, connected);
 
-	if (connected && (hidpp->quirks & HIDPP_QUIRK_CLASS_WTP)) {
-		ret = wtp_get_config(hidpp);
-		if (ret)
-			goto hid_hw_init_fail;
-	} else if (connected && (hidpp->quirks & HIDPP_QUIRK_CLASS_G920)) {
+	if (connected && (hidpp->quirks & HIDPP_QUIRK_CLASS_G920)) {
 		ret = g920_get_config(hidpp, &data);
 		if (ret)
 			goto hid_hw_init_fail;
-- 
2.41.0

