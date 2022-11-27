Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B9E14639B5E
	for <lists+linux-input@lfdr.de>; Sun, 27 Nov 2022 15:28:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229555AbiK0O27 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 27 Nov 2022 09:28:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229541AbiK0O25 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 27 Nov 2022 09:28:57 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C560DFD4
        for <linux-input@vger.kernel.org>; Sun, 27 Nov 2022 06:28:57 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D422860DC6
        for <linux-input@vger.kernel.org>; Sun, 27 Nov 2022 14:28:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DBD5C433C1;
        Sun, 27 Nov 2022 14:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1669559336;
        bh=tg1LAaOqaFFo1uwN5kSo6d9uaNIeLPUSYynENN0A/rs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=gHUCNFNrMjKsxG5+Kv5ZOpR4IFVUZ9JdXm5qsWapQnfxWt4HLyWlAuE/LotufocCZ
         pN6c+22qidX6dzz32xA8+1sdmgkQfslRjJyTUSGnXca8VgY2QfUeDzTptGXrfW48jK
         3J5KqbeEEBjL27SNYNWKX9B9yVb2n6oPdQ9vfB7edt2XCdS7Nlt2fEOAedajD3EOpN
         O92xI8b0aGLk2deuXYfXA6tWGEado1tMCNlo55vVtzUMekO+YR7WY1oS06qGWvNpJJ
         H+LyUCN4lUlYV/vE1IY5nfqJn0+lZr1rfsd9H6hc3dyyVmpESom6GyHdAO5y9uOHvC
         JB8R2y+vIWedQ==
From:   Jonathan Cameron <jic23@kernel.org>
To:     linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Michael Hennerich <michael.hennerich@analog.com>
Subject: [PATCH 3/9] Input: ad7887 - Fix padding for DMA safe buffers.
Date:   Sun, 27 Nov 2022 14:41:10 +0000
Message-Id: <20221127144116.1418083-4-jic23@kernel.org>
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

Fixes tag is imprecise as there may have been no architectures where the
two alignments differed at the time of that patch.

Fixes: 3843384a0554 ("Input: ad7877 - keep dma rx buffers in seperate cache lines")
Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Michael Hennerich <michael.hennerich@analog.com>
---
 drivers/input/touchscreen/ad7877.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/input/touchscreen/ad7877.c b/drivers/input/touchscreen/ad7877.c
index 08f5372f0bfd..eaf11dffb28e 100644
--- a/drivers/input/touchscreen/ad7877.c
+++ b/drivers/input/touchscreen/ad7877.c
@@ -150,7 +150,7 @@ struct ser_req {
 	 * DMA (thus cache coherency maintenance) requires the
 	 * transfer buffers to live in their own cache lines.
 	 */
-	u16 sample ____cacheline_aligned;
+	u16 sample __aligned(ARCH_KMALLOC_MINALIGN);
 };
 
 struct ad7877 {
@@ -189,7 +189,7 @@ struct ad7877 {
 	 * DMA (thus cache coherency maintenance) requires the
 	 * transfer buffers to live in their own cache lines.
 	 */
-	u16 conversion_data[AD7877_NR_SENSE] ____cacheline_aligned;
+	u16 conversion_data[AD7877_NR_SENSE] __aligned(ARCH_KMALLOC_MINALIGN);
 };
 
 static bool gpio3;
-- 
2.38.1

