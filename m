Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8AB74606489
	for <lists+linux-input@lfdr.de>; Thu, 20 Oct 2022 17:30:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230462AbiJTPaw (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 20 Oct 2022 11:30:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230464AbiJTPaf (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 20 Oct 2022 11:30:35 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B026E14EC52
        for <linux-input@vger.kernel.org>; Thu, 20 Oct 2022 08:30:22 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id z5-20020a17090a8b8500b00210a3a2364fso2617029pjn.0
        for <linux-input@vger.kernel.org>; Thu, 20 Oct 2022 08:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vtWFlgHeVLIcgszEX3flHZnMq+ff54nK2nEe6Uwrz/o=;
        b=BOspPNzDA55Fc0Dnl+fV9GJtyS2F685mxp9ZW5T6xDxNNpriknB1RMS6EkOvelR/Ru
         HJgc1D9fYrYEwC4x68oomFLZ7AdEWEw0NWLWNJdSKpsq/v/LGsU/dliHiz1y8dyVB/b+
         nfN7oCBZU2ViR0mDL5555BaPu29rXupHh72M4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vtWFlgHeVLIcgszEX3flHZnMq+ff54nK2nEe6Uwrz/o=;
        b=Jbrm5aJh5fpfCCJXn3boREIzPoBYFHbJu7q/RM5DD9QuFInD+KXKSJbjLMGtTHrAKg
         A1j2pnGIpHUq2lMRlG3+0UB/0WtSuFicW/zpMm7s7xk9JZCiG5Cb0QYoWc9AxYoizEuf
         jwIZnbWjx8ZC8BS7D+lfMhu5ltoEgWatM2XGKTN9/Soa6KFfK9NYYUj/pnT/XV3Lt7FL
         j2sBOnMiMdnumAgLDtuPcX/avIy+tlVHRj7150WEB2N1A9ubuGWHFCWaq702Cfdgy43k
         goAePKYJ1o+o3sE2GnONU9kiLhc69nL8bypiakNaC03GLCzKuxYR1HCwZ+bV+juBfN4C
         v0+A==
X-Gm-Message-State: ACrzQf1UVNF6PQsQ1HhYo1Br+i/An93p4gZXFhj0dwSynzEWaNr0GeIq
        SsjU1W9vFv1HkYDhYgJwL8tfxyn6xPhEsMF4cK8=
X-Google-Smtp-Source: AMsMyM6KWPhkYRlTgssiPrJgt9Pbxfw7BMQgVS5CkT763o2nXVUzgkyW71nyKSuz+v4ZZIXI4//Vvg==
X-Received: by 2002:a17:90b:2247:b0:20d:a2be:95ae with SMTP id hk7-20020a17090b224700b0020da2be95aemr46792148pjb.244.1666279811633;
        Thu, 20 Oct 2022 08:30:11 -0700 (PDT)
Received: from roguebox.lan ([164.92.70.235])
        by smtp.gmail.com with ESMTPSA id y16-20020a17090264d000b0016c50179b1esm12965573pli.152.2022.10.20.08.30.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Oct 2022 08:30:11 -0700 (PDT)
From:   Matt Ranostay <matt.ranostay@konsulko.com>
To:     jikos@kernel.org, jic23@kernel.org
Cc:     linux-input@vger.kernel.org,
        Matt Ranostay <matt.ranostay@konsulko.com>
Subject: [PATCH 2/2] HID: mcp2221: correct undefined references when CONFIG_GPIOLIB isn't defined
Date:   Thu, 20 Oct 2022 23:30:00 +0800
Message-Id: <20221020153000.30874-3-matt.ranostay@konsulko.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221020153000.30874-1-matt.ranostay@konsulko.com>
References: <20221020153000.30874-1-matt.ranostay@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Singular #ifdef IS_REACHABLE(CONFIG_GPIOLIB) weren't covering all the
gpiolib functions that were being referenced.

Update the code regions that are commented out when CONFIG_GPIOLIB isn't
enabled to avoid errors.

Fixes: 960f9df7c620 ("HID: mcp2221: add ADC/DAC support via iio subsystem")
Signed-off-by: Matt Ranostay <matt.ranostay@konsulko.com>
---
 drivers/hid/hid-mcp2221.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/hid-mcp2221.c b/drivers/hid/hid-mcp2221.c
index 3014932c8cef..5886543b17f3 100644
--- a/drivers/hid/hid-mcp2221.c
+++ b/drivers/hid/hid-mcp2221.c
@@ -585,6 +585,7 @@ static const struct i2c_algorithm mcp_i2c_algo = {
 	.functionality = mcp_i2c_func,
 };
 
+#if IS_REACHABLE(CONFIG_GPIOLIB)
 static int mcp_gpio_get(struct gpio_chip *gc,
 				unsigned int offset)
 {
@@ -688,6 +689,7 @@ static int mcp_gpio_get_direction(struct gpio_chip *gc,
 
 	return GPIO_LINE_DIRECTION_OUT;
 }
+#endif
 
 /* Gives current state of i2c engine inside mcp2221 */
 static int mcp_get_i2c_eng_state(struct mcp2221 *mcp,
@@ -1153,6 +1155,7 @@ static int mcp2221_probe(struct hid_device *hdev,
 	}
 	i2c_set_adapdata(&mcp->adapter, mcp);
 
+#if IS_REACHABLE(CONFIG_GPIOLIB)
 	/* Setup GPIO chip */
 	mcp->gc = devm_kzalloc(&hdev->dev, sizeof(*mcp->gc), GFP_KERNEL);
 	if (!mcp->gc)
@@ -1169,7 +1172,6 @@ static int mcp2221_probe(struct hid_device *hdev,
 	mcp->gc->can_sleep = 1;
 	mcp->gc->parent = &hdev->dev;
 
-#if IS_REACHABLE(CONFIG_GPIOLIB)
 	ret = devm_gpiochip_add_data(&hdev->dev, mcp->gc, mcp);
 	if (ret)
 		return ret;
-- 
2.30.2

