Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B8D8D639B60
	for <lists+linux-input@lfdr.de>; Sun, 27 Nov 2022 15:29:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229616AbiK0O3B (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 27 Nov 2022 09:29:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229496AbiK0O3A (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 27 Nov 2022 09:29:00 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 290D6DFE7
        for <linux-input@vger.kernel.org>; Sun, 27 Nov 2022 06:29:00 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id BA1EC60DC8
        for <linux-input@vger.kernel.org>; Sun, 27 Nov 2022 14:28:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0997CC433B5;
        Sun, 27 Nov 2022 14:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1669559339;
        bh=L18Nv4SsEp06ll09Dam+tSqGsS4Z0+vqMn31KwkBqE8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=D8SPPc5uYsTQCIDSyMdEZTvqVY5TXgJYt1ThaECoiRGoISnvvZSAuujzheUh6kggW
         Z1Wco4nPrWS3iHKze4uGoNNtNiTNFpmham0jXukO+qqXunTxDfqTCDm07RsnRN62hn
         nPaf3opDS+8+u2DMBTXB11Ary+gBkFuEDcfTDroDrxN+i48zw3Y6ROwlf4XIF12TC9
         CxBCUXiXU8hftZDNdJIaF2/rEOIz14uXqK37xgOEA60qHF0PjkTftQhel06Q90HN88
         XJhIcfp9SJvQIO4k1X+Fd2MkF5XxxTJKDVJ7LDJhEsek71mvpirOxK2r807bPzcIrl
         OP3McQtHBoDcw==
From:   Jonathan Cameron <jic23@kernel.org>
To:     linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Javier Martinez Canillas <javier@dowhile0.org>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 5/9] Input: cyttsp - Fix padding for DMA safe buffers.
Date:   Sun, 27 Nov 2022 14:41:12 +0000
Message-Id: <20221127144116.1418083-6-jic23@kernel.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221127144116.1418083-1-jic23@kernel.org>
References: <20221127144116.1418083-1-jic23@kernel.org>
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

On some architectures (e.g. arm64), ____cachline_aligned only aligns
to the cacheline size of the L1 cache size. L1_CACHE_BYTES in
arch64/include/asm/cache.h  Unfortunately DMA safety on these
architectures requires the buffer no share a last level cache cacheline
given by ARCH_DMA_MINALIGN which has a greater granularity.
ARCH_DMA_MINALIGN is not defined for all architectures, but when it is
defined it is used to set the size of ARCH_KMALLOC_MINALIGN
to allow DMA safe buffer allocations.

As such the correct alignment requirement is
__aligned(ARCH_KMALLOC_MINALIGN).
This has recently been fixed in other subsystems such as IIO.

Fixes tag for this is complex as at the time of original introduction, it
is likely that there were no cases where the two alignments were different.

Fixes: 4065d1e7b216 ("Input: add Cypress TTSP capacitive multi-touch screen support")
Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Javier Martinez Canillas <javier@dowhile0.org>
Cc: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/input/touchscreen/cyttsp_core.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/cyttsp_core.h b/drivers/input/touchscreen/cyttsp_core.h
index 075509e695a2..e87cb323623c 100644
--- a/drivers/input/touchscreen/cyttsp_core.h
+++ b/drivers/input/touchscreen/cyttsp_core.h
@@ -131,7 +131,7 @@ struct cyttsp {
 	u8 lp_intrvl;
 	u8 *bl_keys;
 
-	u8 xfer_buf[] ____cacheline_aligned;
+	u8 xfer_buf[] __aligned(ARCH_KMALLOC_MINALIGN);
 };
 
 struct cyttsp *cyttsp_probe(const struct cyttsp_bus_ops *bus_ops,
-- 
2.38.1

