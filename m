Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 12BC9641E75
	for <lists+linux-input@lfdr.de>; Sun,  4 Dec 2022 18:57:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230371AbiLDR5C (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 4 Dec 2022 12:57:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230307AbiLDR4n (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 4 Dec 2022 12:56:43 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7530140D3
        for <linux-input@vger.kernel.org>; Sun,  4 Dec 2022 09:56:42 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 4499960EDD
        for <linux-input@vger.kernel.org>; Sun,  4 Dec 2022 17:56:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6958C433C1;
        Sun,  4 Dec 2022 17:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1670176601;
        bh=5USbCND1vtOk+Ddksu9R9JsvT7SWTg3/FPRw82671DA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=EuVr9EceeSC5RXnbNNcOV7WmoNP49TvSq/c1y641y/c3aLPstDSOA10kxutz2oxye
         78t4fdFrWxrbdf4eNSzksFgdeyS6gyb5iFBGGsGDuAuVFMRRcWHZtZQYkVLQD6fRFO
         KzvLwbueerxNhEYscbvDOdVXreKg62e3PYNE01nlzLr142V83oWtYsfUjXSNL5wacT
         drSYC8nTXWv+ISPSjoqbtm7DE8sMgFDbE31SuF3XpPmiP8HAXM/KRSwXl8uud8oysO
         qpv/9cMI/OeEr/ouQ4SO6gNqnWeQT4n1aFSF91DyJcOPVyyj+FbyOjsG/gL0a4B5yL
         NGJcBmgqe56nA==
From:   Jonathan Cameron <jic23@kernel.org>
To:     linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [PATCH 29/32] Input: pxa27xx-keypad - allow build with COMPILE_TEST
Date:   Sun,  4 Dec 2022 18:08:38 +0000
Message-Id: <20221204180841.2211588-30-jic23@kernel.org>
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

Used to build test PM changes.

Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 drivers/input/keyboard/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/keyboard/Kconfig b/drivers/input/keyboard/Kconfig
index 39717a2e1757..1a949445f116 100644
--- a/drivers/input/keyboard/Kconfig
+++ b/drivers/input/keyboard/Kconfig
@@ -542,7 +542,7 @@ config KEYBOARD_PINEPHONE
 
 config KEYBOARD_PXA27x
 	tristate "PXA27x/PXA3xx keypad support"
-	depends on PXA27x || PXA3xx || ARCH_MMP
+	depends on PXA27x || PXA3xx || ARCH_MMP || COMPILE_TEST
 	select INPUT_MATRIXKMAP
 	help
 	  Enable support for PXA27x/PXA3xx keypad controller.
-- 
2.38.1

