Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B2A04639B61
	for <lists+linux-input@lfdr.de>; Sun, 27 Nov 2022 15:29:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229677AbiK0O3C (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 27 Nov 2022 09:29:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229669AbiK0O3A (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 27 Nov 2022 09:29:00 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 284FD637F
        for <linux-input@vger.kernel.org>; Sun, 27 Nov 2022 06:29:00 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id D0EF7B80B03
        for <linux-input@vger.kernel.org>; Sun, 27 Nov 2022 14:28:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A55F3C433D6;
        Sun, 27 Nov 2022 14:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1669559337;
        bh=1JZTrOB0xZLUQUF2V3fwOu6c2MPhxf/sGD9p7hkd+1o=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=HcagDOh40ISzD5X3Zs+AP7MPFi+3kCPV+yIUkZhhem2yf4vaZIqi7O9nA62ZHv6st
         naPo4dx7u411MgC71FD9LNdYCZkkiwCSjBO7dTGF1CdoQiMSYAftitjVO420YyVktw
         rudDD00yaDnaOFawZyVPggGBLo28q0MHV2fDjEcUjHCfikaqpLs6vSUsFG+GUSX3DC
         qVNYPMqZWeukmfjZNoaYoXCKxkIhbYem1BV5wzkN11oRy8GNef5XTMg8Eaz7fek5uk
         mj4z4q7OwyEUTZFZSi48P/XZK7sI34HK0Br6phfLsCxKmkYyG/jt6AZHgyoNBv1rV7
         YAFKeE6uBUC6w==
From:   Jonathan Cameron <jic23@kernel.org>
To:     linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Daniel Mack <daniel@zonque.org>
Subject: [PATCH 4/9] Input: ads7846 - Fix padding for DMA safe buffers.
Date:   Sun, 27 Nov 2022 14:41:11 +0000
Message-Id: <20221127144116.1418083-5-jic23@kernel.org>
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

Fixes: 1dbe7dada2d0 ("Input: ads7846 - make transfer buffers DMA safe")
Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Daniel Mack <daniel@zonque.org>
---
 drivers/input/touchscreen/ads7846.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/input/touchscreen/ads7846.c b/drivers/input/touchscreen/ads7846.c
index bed68a68f330..074ca9f59788 100644
--- a/drivers/input/touchscreen/ads7846.c
+++ b/drivers/input/touchscreen/ads7846.c
@@ -337,7 +337,7 @@ struct ser_req {
 	 * DMA (thus cache coherency maintenance) requires the
 	 * transfer buffers to live in their own cache lines.
 	 */
-	__be16 sample ____cacheline_aligned;
+	__be16 sample __aligned(ARCH_KMALLOC_MINALIGN);
 };
 
 struct ads7845_ser_req {
@@ -348,7 +348,7 @@ struct ads7845_ser_req {
 	 * DMA (thus cache coherency maintenance) requires the
 	 * transfer buffers to live in their own cache lines.
 	 */
-	u8 sample[3] ____cacheline_aligned;
+	u8 sample[3] __aligned(ARCH_KMALLOC_MINALIGN);
 };
 
 static int ads7846_read12_ser(struct device *dev, unsigned command)
-- 
2.38.1

