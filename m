Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A6DF641E76
	for <lists+linux-input@lfdr.de>; Sun,  4 Dec 2022 18:57:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230307AbiLDR5D (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 4 Dec 2022 12:57:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230308AbiLDR4q (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 4 Dec 2022 12:56:46 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D050140D0
        for <linux-input@vger.kernel.org>; Sun,  4 Dec 2022 09:56:45 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 36644B80B89
        for <linux-input@vger.kernel.org>; Sun,  4 Dec 2022 17:56:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DD83C433D7;
        Sun,  4 Dec 2022 17:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1670176602;
        bh=M06wx+LNFiv20E9gjNs7DU6pLRQHN5vbeixul1/66Qw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Lu6ged76+3oGzzH5HPqbRxj92KtknePnRWq8/RYhTSkV+P9NwTi5APdtKJbW3umHP
         SgYrKAw46otmZNjL+kUkbmfOt470St2o197cYkOZXW5K9wrDMCzB650oSuqogCvT+g
         Jp5V6YCflZyrUSO5yuWoa5RpS7vx6FclYVCcyqwL4XQ+cQzWO6ZwZ7fDJTY+kW32wW
         A8S+cgX7vcOih+OhisV2wsYWnSV8PGAmyfTZHpE/EIYVVP4ycPG2Nudy3QRyJJj5sr
         WcAC+H+YUMXc+fFZNQgGbjS7gVP/j8x5GXI5ew3P0NTqgBHvqhndIM0iawdVMFeg83
         GVcF5VyDQXgnQ==
From:   Jonathan Cameron <jic23@kernel.org>
To:     linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [PATCH 30/32] Input: nomadik-ske-keypad - allow building with COMPILE_TEST
Date:   Sun,  4 Dec 2022 18:08:39 +0000
Message-Id: <20221204180841.2211588-31-jic23@kernel.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221204180841.2211588-1-jic23@kernel.org>
References: <20221204180841.2211588-1-jic23@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Jonathan Cameron <Jonathan.Cameron@huawei.com>

Used to build test the PM changes.

Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 drivers/input/keyboard/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/keyboard/Kconfig b/drivers/input/keyboard/Kconfig
index 1a949445f116..3f232d727e31 100644
--- a/drivers/input/keyboard/Kconfig
+++ b/drivers/input/keyboard/Kconfig
@@ -487,7 +487,7 @@ config KEYBOARD_NEWTON
 
 config KEYBOARD_NOMADIK
 	tristate "ST-Ericsson Nomadik SKE keyboard"
-	depends on (ARCH_NOMADIK || ARCH_U8500)
+	depends on (ARCH_NOMADIK || ARCH_U8500 || COMPILE_TEST)
 	select INPUT_MATRIXKMAP
 	help
 	  Say Y here if you want to use a keypad provided on the SKE controller
-- 
2.38.1

