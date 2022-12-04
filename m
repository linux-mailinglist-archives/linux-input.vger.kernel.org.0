Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7D82B641E79
	for <lists+linux-input@lfdr.de>; Sun,  4 Dec 2022 18:57:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230308AbiLDR5E (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 4 Dec 2022 12:57:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230311AbiLDR4r (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 4 Dec 2022 12:56:47 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2902140CD
        for <linux-input@vger.kernel.org>; Sun,  4 Dec 2022 09:56:46 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 68957B80B8E
        for <linux-input@vger.kernel.org>; Sun,  4 Dec 2022 17:56:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A128C4347C;
        Sun,  4 Dec 2022 17:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1670176604;
        bh=K+fSMOvuU2e10al0zWqvjQjWybt+yokjbg0Uk34WpBc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=f3TluiuDhVEEUDv83UOPSxzrAa9F+vPCrnkqKIEoSPMORPHyBTRLatE4gQ9XVy+un
         533MJtsD8UNNZ5dyBlCa8ZC1C/QzDXtkWI29Mu8BkIhneVHOT01iHob+6wntDAYWq9
         kdgK9Dtxm9RzZi0J8LKPlbZE0c9KLbzpVic7JKzpnvfXIECWsqJ7s1Yo+xp8foSVAm
         jds8UvmB+xjFcMriu9uRgT/kim7ZqPDQ0x4onxzgtuj/29wEaC6w3cwePmyxDQbqRe
         U6YQ/UVNuxVZRmocxnQkv86m0kYRFIL1IFXoubp/WBFOodNdUqWHms/k303jb+xtxT
         u3R8g0pZEbpxQ==
From:   Jonathan Cameron <jic23@kernel.org>
To:     linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [PATCH 31/32] Input: lpc32xx - allow building with COMPILE_TEST
Date:   Sun,  4 Dec 2022 18:08:40 +0000
Message-Id: <20221204180841.2211588-32-jic23@kernel.org>
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

Used to test the PM changes.

Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 drivers/input/keyboard/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/keyboard/Kconfig b/drivers/input/keyboard/Kconfig
index 3f232d727e31..84490915ae4d 100644
--- a/drivers/input/keyboard/Kconfig
+++ b/drivers/input/keyboard/Kconfig
@@ -390,7 +390,7 @@ config KEYBOARD_LOCOMO
 
 config KEYBOARD_LPC32XX
 	tristate "LPC32XX matrix key scanner support"
-	depends on ARCH_LPC32XX && OF
+	depends on (ARCH_LPC32XX && OF) || COMPILE_TEST
 	select INPUT_MATRIXKMAP
 	help
 	  Say Y here if you want to use NXP LPC32XX SoC key scanner interface,
-- 
2.38.1

