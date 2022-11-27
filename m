Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7E549639B5F
	for <lists+linux-input@lfdr.de>; Sun, 27 Nov 2022 15:29:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229541AbiK0O27 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 27 Nov 2022 09:28:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229496AbiK0O26 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 27 Nov 2022 09:28:58 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CD85DFE7
        for <linux-input@vger.kernel.org>; Sun, 27 Nov 2022 06:28:57 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 24BFCB80AF9
        for <linux-input@vger.kernel.org>; Sun, 27 Nov 2022 14:28:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAE39C433D6;
        Sun, 27 Nov 2022 14:28:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1669559334;
        bh=cwzky6ouGybQ8mPYMRkwMibBYbZn51YfowH4xCJf9kw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=W3XyN7Punt3ugCdBAzt8rVGIQNKONOQ1PK0nx+w/aq3ZW831Y72ejYMajS8ZYROxC
         2JPkNDds/vtm0+JpsTHv4ezAx1RID0V0O6x+UJYkYWX21jyHpsRTtbrP9BICCiIUZw
         EqvejmaSdOkfrkAKY3gTb/S+EYMLdTMnUByAKWqGZlxJuXJpDAxMLW35Zby3Lj42Nb
         J3HkvgnuJ30HcTJm/H+QXAUAL/bb/nw/PZdx9+LfLHzUYVJQ0Bmerv5GnW7uUFjXIp
         tca30w4NtkU9W8aOWX53CXxThiM6rhZSM9f4q4IYE2T2Cgu3y+DdF92Msk61TOXxeb
         F5xm8nTYCoLjg==
From:   Jonathan Cameron <jic23@kernel.org>
To:     linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Michael Hennerich <michael.hennerich@analog.com>
Subject: [PATCH 2/9] Input: ad714x - Fix padding for DMA safe buffers.
Date:   Sun, 27 Nov 2022 14:41:09 +0000
Message-Id: <20221127144116.1418083-3-jic23@kernel.org>
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

Fixes tag is inprecise because there may not have been any architectures
where the two values were different at the time of the earlier fix.

Fixes: c0409feb8689 ("Input: ad714x - use DMA-safe buffers for spi_write()")
Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Michael Hennerich <michael.hennerich@analog.com>
---
 drivers/input/misc/ad714x.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/misc/ad714x.h b/drivers/input/misc/ad714x.h
index af847b5f0d0e..2b8b901183be 100644
--- a/drivers/input/misc/ad714x.h
+++ b/drivers/input/misc/ad714x.h
@@ -41,7 +41,7 @@ struct ad714x_chip {
 	unsigned product;
 	unsigned version;
 
-	__be16 xfer_buf[16] ____cacheline_aligned;
+	__be16 xfer_buf[16] __aligned(ARCH_KMALLOC_MINALIGN);
 
 };
 
-- 
2.38.1

