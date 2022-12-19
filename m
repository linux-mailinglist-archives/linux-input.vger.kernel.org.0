Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E7A0D650A77
	for <lists+linux-input@lfdr.de>; Mon, 19 Dec 2022 11:56:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231648AbiLSK4X (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 19 Dec 2022 05:56:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231631AbiLSK4Q (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 19 Dec 2022 05:56:16 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0922A6443
        for <linux-input@vger.kernel.org>; Mon, 19 Dec 2022 02:55:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1671447330;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=UXCJuotbswFr5kiRSvayPv0qeiwEbQ+N4sdM87j/Gfc=;
        b=XRLPygnajmL2tvycoq4kPpQ68DhXDPbYLJC7TXAEV9v9zYJSp9W0/itMisGhqTuRU/HgmB
        TWCZEOui1RruqwPE/qAFc01AM4+Jf8/kCb96V4x0m2CL9gVe9lG7ufUAGO1Fuz91Iv1UrG
        bnf3HOUDjjOwBOAiKvTISRB0e/QaSdw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-1-9a0Z9MxUMsibn0wOjk8oyw-1; Mon, 19 Dec 2022 05:55:28 -0500
X-MC-Unique: 9a0Z9MxUMsibn0wOjk8oyw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2FAF7100F93C;
        Mon, 19 Dec 2022 10:55:27 +0000 (UTC)
Received: from plouf.redhat.com (unknown [10.39.195.17])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 32994112132E;
        Mon, 19 Dec 2022 10:55:26 +0000 (UTC)
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
To:     Jiri Kosina <jikos@kernel.org>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        stable@vger.kernel.org
Subject: [PATCH] HID: multitouch: enable trackstick of Asus ExpertBook B2502
Date:   Mon, 19 Dec 2022 11:55:21 +0100
Message-Id: <20221219105521.73467-1-benjamin.tissoires@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This device has a trackstick that is sent through the same HID device
than the touchpad.
Unfortunately there are 2 mice attached to that device descriptor, with
the first one for the touchpad when the second is for the trackstick.

Force all devices to be exported.

Cc: stable@vger.kernel.org # 5.8+
Link: https://bugzilla.redhat.com/show_bug.cgi?id=2154204
Signed-off-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>
---
 drivers/hid/hid-multitouch.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
index 91a4d3fc30e0..91ac72b32d45 100644
--- a/drivers/hid/hid-multitouch.c
+++ b/drivers/hid/hid-multitouch.c
@@ -1860,6 +1860,12 @@ static const struct hid_device_id mt_devices[] = {
 			USB_VENDOR_ID_ASUSTEK,
 			USB_DEVICE_ID_ASUSTEK_T304_KEYBOARD) },
 
+	/* Asus ExpertBook with trackstick */
+	{ .driver_data = MT_CLS_WIN_8_FORCE_MULTI_INPUT,
+		HID_DEVICE(BUS_I2C, HID_GROUP_MULTITOUCH_WIN_8,
+			USB_VENDOR_ID_ELAN,
+			0x3148) },
+
 	/* Atmel panels */
 	{ .driver_data = MT_CLS_SERIAL,
 		MT_USB_DEVICE(USB_VENDOR_ID_ATMEL,
-- 
2.38.1

