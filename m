Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D949974D5BE
	for <lists+linux-input@lfdr.de>; Mon, 10 Jul 2023 14:37:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229774AbjGJMhb (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 10 Jul 2023 08:37:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229462AbjGJMha (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 10 Jul 2023 08:37:30 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C603011A
        for <linux-input@vger.kernel.org>; Mon, 10 Jul 2023 05:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1688992599;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=9JvRco+Tgte9aqCDrBBT4Li8b1fghmYlP1pozXh3++c=;
        b=gHKFuXho+BMBkPpxMXg6qmJxvEJx5V4gkr1C38xnxnbqj3ffhc5PoUrCKswAVigX5308v/
        J547eFJcPRTN/YJwB+C7S0Z1vbrqGPxJN5vYMUXEf7lWfQz2ByMZoHaqhcjTuUMwdzA99q
        n5aoqyrq9dvxWZc3I+FJXOKZVp6RmSY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-391-TM3Q1NqsMPC0TS2GPEi0PA-1; Mon, 10 Jul 2023 08:36:35 -0400
X-MC-Unique: TM3Q1NqsMPC0TS2GPEi0PA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8C7D83C10144;
        Mon, 10 Jul 2023 12:36:35 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.195.29])
        by smtp.corp.redhat.com (Postfix) with ESMTP id B95EFF66BB;
        Mon, 10 Jul 2023 12:36:34 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org,
        Peter Hutterer <peter.hutterer@who-t.net>
Subject: [PATCH resend 1/2] Input: novatek-nvt-ts - fix input_register_device() failure error message
Date:   Mon, 10 Jul 2023 14:36:32 +0200
Message-ID: <20230710123633.323937-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Fix input_register_device() failure logging "failed to request irq"
as error message.

Reviewed-by: Peter Hutterer <peter.hutterer@who-t.net>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/input/touchscreen/novatek-nvt-ts.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/novatek-nvt-ts.c b/drivers/input/touchscreen/novatek-nvt-ts.c
index 7f7d879aac6d..047e371448ce 100644
--- a/drivers/input/touchscreen/novatek-nvt-ts.c
+++ b/drivers/input/touchscreen/novatek-nvt-ts.c
@@ -272,7 +272,7 @@ static int nvt_ts_probe(struct i2c_client *client)
 
 	error = input_register_device(input);
 	if (error) {
-		dev_err(dev, "failed to request irq: %d\n", error);
+		dev_err(dev, "failed to register input device: %d\n", error);
 		return error;
 	}
 
-- 
2.41.0

