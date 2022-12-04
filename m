Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A2E20641E6E
	for <lists+linux-input@lfdr.de>; Sun,  4 Dec 2022 18:57:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230302AbiLDR5B (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 4 Dec 2022 12:57:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230306AbiLDR4m (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 4 Dec 2022 12:56:42 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29F90140D2
        for <linux-input@vger.kernel.org>; Sun,  4 Dec 2022 09:56:42 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id D071CB80B8E
        for <linux-input@vger.kernel.org>; Sun,  4 Dec 2022 17:56:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB925C433D7;
        Sun,  4 Dec 2022 17:56:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1670176600;
        bh=9ZNztioYN8Es4L26nzCb/rarDJBUysAcnb5GkctwPog=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=u6XQjcaC3p2SOPBWid2SZzP5qXOD6UCNrvx4dabC3mBgTXLhnwI872mdnMuMW7P/u
         5lK7PFo73FsW92047J1LsErCjs4Mui0ldlEffNMq9kZP2Kw0yytrjxeEnx+Bve0mie
         qxPnoUd8ttlQtfupuVQodegzLsfpRnAo0zOqttRy1IRX/l6A32ePro23l0z+rnAsUE
         1lKr8WDYMvDiv226NcwEDk1D38EhMCvngcjNm61xKiOPEPPpRDsMOLMa9ObH2u5rO8
         lAHEahjt6xTRGgLHQ74wUVY2+GsF/3eDnO1C/kwLOHhHai5/kQ2RFKSsCUUTVlgvmf
         VvfcYye4UsPLw==
From:   Jonathan Cameron <jic23@kernel.org>
To:     linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [PATCH 28/32] Input: spear-keyboard - improve build coverage using COMPILE_TEST
Date:   Sun,  4 Dec 2022 18:08:37 +0000
Message-Id: <20221204180841.2211588-29-jic23@kernel.org>
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
index 28a9ad8a1466..39717a2e1757 100644
--- a/drivers/input/keyboard/Kconfig
+++ b/drivers/input/keyboard/Kconfig
@@ -709,7 +709,7 @@ config KEYBOARD_OMAP4
 
 config KEYBOARD_SPEAR
 	tristate "ST SPEAR keyboard support"
-	depends on PLAT_SPEAR
+	depends on PLAT_SPEAR || COMPILE_TEST
 	select INPUT_MATRIXKMAP
 	help
 	  Say Y here if you want to use the SPEAR keyboard.
-- 
2.38.1

