Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B0B255B5F5F
	for <lists+linux-input@lfdr.de>; Mon, 12 Sep 2022 19:32:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229885AbiILRc2 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 12 Sep 2022 13:32:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229702AbiILRc1 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 12 Sep 2022 13:32:27 -0400
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com [IPv6:2607:f8b0:4864:20::f2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE9CD275C4
        for <linux-input@vger.kernel.org>; Mon, 12 Sep 2022 10:32:25 -0700 (PDT)
Received: by mail-qv1-xf2b.google.com with SMTP id o13so7258292qvw.12
        for <linux-input@vger.kernel.org>; Mon, 12 Sep 2022 10:32:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=oqYENd/2txABU+QCOqmWhZqh5LDN7sKRoTIhe4ZzfVA=;
        b=VbNGOBtc3nRLLsXMZwXV9fuEjFd1jHi8WmEQq6yUJbvN2q8TaPcNVvqRpqKGZGDwT9
         WroiIBVfUpitWRDxVmVH0lBeuthEZeOkfwLwzly3JC80ij/6PrLpoc6THnxAzjoX8PCa
         fd20FfDpPl4LlHpchwwYBj1uF1mnmwdDiwQJA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=oqYENd/2txABU+QCOqmWhZqh5LDN7sKRoTIhe4ZzfVA=;
        b=sM/m1rx9VFxVN27QxXWzHIFaPjcXFyIPi2bjIBMM093y0e55RWm3mFNf6r/jFOpqM7
         apeQKmQwBDAFbXV4UUAdz6T8ig4yxv0GVzgnTQCZMUaPaMex6Ty7EyC7KMXRb3GOg9Rw
         kCvePVsVnZwa5b7252rdLT1UPCe9OpuzWntbItWi/fSLlGmRg+nJlqaoaAKM7DW+G30Y
         /cr0OQBAYmG3jqzBSqQloJ5ilPSrciQ8Es3uui+u1zm68/sacGtwFDCdPXCWbyOOCzeG
         H3EIOt8XFEqFnTwS7UoEDqJw9JR1K6jFq1248zFvM1wWZM0vjCr3tnkUG8fo5YXX7yGb
         G2SA==
X-Gm-Message-State: ACgBeo27piYI80awXkEWmGdcVcnwErkwqvwV4t3dWkwZtBjNmi33+Sw1
        ycH2EeJvEMkNyLFmHoqxmm0LrdtxfiFz8HoF
X-Google-Smtp-Source: AA6agR62JUhrOm1QBbF6atLS+PeF0vej4pYkLNmE3F03qk0GwIEtxJGXHFnnF0Tx1+5oPNGLzJyLkw==
X-Received: by 2002:a05:6214:c8b:b0:4ac:c1f7:660f with SMTP id r11-20020a0562140c8b00b004acc1f7660fmr1748255qvr.52.1663003945044;
        Mon, 12 Sep 2022 10:32:25 -0700 (PDT)
Received: from localhost.localdomain ([159.65.38.31])
        by smtp.gmail.com with ESMTPSA id h63-20020a376c42000000b006b8d1914504sm8289394qkc.22.2022.09.12.10.32.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Sep 2022 10:32:24 -0700 (PDT)
From:   Matt Ranostay <matt.ranostay@konsulko.com>
To:     gupt21@gmail.com, jic23@kernel.org
Cc:     linux-iio@vger.kernel.org, linux-input@vger.kernel.org,
        linux-i2c@vger.kernel.org,
        Matt Ranostay <matt.ranostay@konsulko.com>
Subject: [PATCH v3 4/5] HID: mcp2221: switch i2c registration to devm functions
Date:   Mon, 12 Sep 2022 10:32:01 -0700
Message-Id: <20220912173202.16723-5-matt.ranostay@konsulko.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220912173202.16723-1-matt.ranostay@konsulko.com>
References: <20220912173202.16723-1-matt.ranostay@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Switch from i2c_add_adapter() to resource managed devm_i2c_add_adapter()
for matching rest of driver initialization, and more concise code.

Signed-off-by: Matt Ranostay <matt.ranostay@konsulko.com>
---
 drivers/hid/hid-mcp2221.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/hid/hid-mcp2221.c b/drivers/hid/hid-mcp2221.c
index de52e9f7bb8c..29e69576c3d4 100644
--- a/drivers/hid/hid-mcp2221.c
+++ b/drivers/hid/hid-mcp2221.c
@@ -873,7 +873,7 @@ static int mcp2221_probe(struct hid_device *hdev,
 			"MCP2221 usb-i2c bridge on hidraw%d",
 			((struct hidraw *)hdev->hidraw)->minor);
 
-	ret = i2c_add_adapter(&mcp->adapter);
+	ret = devm_i2c_add_adapter(&hdev->dev, &mcp->adapter);
 	if (ret) {
 		hid_err(hdev, "can't add usb-i2c adapter: %d\n", ret);
 		goto err_i2c;
@@ -884,7 +884,7 @@ static int mcp2221_probe(struct hid_device *hdev,
 	mcp->gc = devm_kzalloc(&hdev->dev, sizeof(*mcp->gc), GFP_KERNEL);
 	if (!mcp->gc) {
 		ret = -ENOMEM;
-		goto err_gc;
+		goto err_i2c;
 	}
 
 	mcp->gc->label = "mcp2221_gpio";
@@ -900,12 +900,10 @@ static int mcp2221_probe(struct hid_device *hdev,
 
 	ret = devm_gpiochip_add_data(&hdev->dev, mcp->gc, mcp);
 	if (ret)
-		goto err_gc;
+		goto err_i2c;
 
 	return 0;
 
-err_gc:
-	i2c_del_adapter(&mcp->adapter);
 err_i2c:
 	hid_hw_close(mcp->hdev);
 err_hstop:
@@ -917,7 +915,6 @@ static void mcp2221_remove(struct hid_device *hdev)
 {
 	struct mcp2221 *mcp = hid_get_drvdata(hdev);
 
-	i2c_del_adapter(&mcp->adapter);
 	hid_hw_close(mcp->hdev);
 	hid_hw_stop(mcp->hdev);
 }
-- 
2.37.2

