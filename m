Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A5767016DA
	for <lists+linux-input@lfdr.de>; Sat, 13 May 2023 15:18:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234165AbjEMNSI (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 13 May 2023 09:18:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233967AbjEMNSG (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 13 May 2023 09:18:06 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E08073AB1
        for <linux-input@vger.kernel.org>; Sat, 13 May 2023 06:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1683983837;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=vp7yABBnAUJAHIhnbEwb+wj0KQF2Mdip00bxB0DfbcI=;
        b=UgQehFg59twX8tmIjSCjg8dGEhl/R+lJWgL8GeMA1xXolZPtUS2Yg108PNypaIpFNrAqgl
        XxvPq41R3jd55ZeXXq/YXZwCCUiMYHQRXdupBkxO4mJ0JLcnshDyxlbfvl3JycnJ9rYelh
        +P9kVzNSGK6NSWby+C8UM/3mm9aKApo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-604-My1NhcPkOkmUrAMwD2WDyg-1; Sat, 13 May 2023 09:17:14 -0400
X-MC-Unique: My1NhcPkOkmUrAMwD2WDyg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 082F485A588;
        Sat, 13 May 2023 13:17:14 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.46])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 70D2363F5F;
        Sat, 13 May 2023 13:17:13 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org
Subject: [PATCH] Input: novatek-nvt-ts - fix input_register_device() failure error message
Date:   Sat, 13 May 2023 15:17:12 +0200
Message-Id: <20230513131712.259057-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Fix input_register_device() failure logging "failed to request irq"
as error message.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/input/touchscreen/novatek-nvt-ts.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/novatek-nvt-ts.c b/drivers/input/touchscreen/novatek-nvt-ts.c
index 3e551f9d31d7..e7f30eeb91ca 100644
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
2.40.1

