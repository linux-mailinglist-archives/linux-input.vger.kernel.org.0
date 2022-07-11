Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CA683570ADD
	for <lists+linux-input@lfdr.de>; Mon, 11 Jul 2022 21:41:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229678AbiGKTlX (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 11 Jul 2022 15:41:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229743AbiGKTlX (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 11 Jul 2022 15:41:23 -0400
Received: from smtp.smtpout.orange.fr (smtp03.smtpout.orange.fr [80.12.242.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B926558FA
        for <linux-input@vger.kernel.org>; Mon, 11 Jul 2022 12:41:22 -0700 (PDT)
Received: from pop-os.home ([90.11.190.129])
        by smtp.orange.fr with ESMTPA
        id AzHUoaJcY26JCAzHUoNSUF; Mon, 11 Jul 2022 21:41:20 +0200
X-ME-Helo: pop-os.home
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Mon, 11 Jul 2022 21:41:20 +0200
X-ME-IP: 90.11.190.129
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        linux-input@vger.kernel.org
Subject: [PATCH] HID: multitouch: Use the bitmap API to allocate bitmaps
Date:   Mon, 11 Jul 2022 21:41:18 +0200
Message-Id: <3ff2b491c397ba4f763fd2fbcb6795f0c33da2f3.1657568452.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Use bitmap_zalloc()/bitmap_free() instead of hand-writing them.

It is less verbose and it improves the semantic.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/hid/hid-multitouch.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
index 2e72922e36f5..2b19938e0fb8 100644
--- a/drivers/hid/hid-multitouch.c
+++ b/drivers/hid/hid-multitouch.c
@@ -1300,10 +1300,9 @@ static int mt_touch_input_configured(struct hid_device *hdev,
 	if (td->is_buttonpad)
 		__set_bit(INPUT_PROP_BUTTONPAD, input->propbit);
 
-	app->pending_palm_slots = devm_kcalloc(&hi->input->dev,
-					       BITS_TO_LONGS(td->maxcontacts),
-					       sizeof(long),
-					       GFP_KERNEL);
+	app->pending_palm_slots = devm_bitmap_zalloc(&hi->input->dev,
+						     td->maxcontacts,
+						     GFP_KERNEL);
 	if (!app->pending_palm_slots)
 		return -ENOMEM;
 
-- 
2.34.1

