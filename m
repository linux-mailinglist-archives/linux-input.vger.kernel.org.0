Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 96FF3639B65
	for <lists+linux-input@lfdr.de>; Sun, 27 Nov 2022 15:29:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229676AbiK0O3G (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 27 Nov 2022 09:29:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229679AbiK0O3G (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 27 Nov 2022 09:29:06 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CA2EDFDA
        for <linux-input@vger.kernel.org>; Sun, 27 Nov 2022 06:29:05 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 2989660DE1
        for <linux-input@vger.kernel.org>; Sun, 27 Nov 2022 14:29:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 979BDC433D7;
        Sun, 27 Nov 2022 14:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1669559344;
        bh=AzGsp3e9BQEjPDsjEpI77hRwJ51e8bdKfmP/HYluH0U=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=BHxMq6epvis6ZM9SJZdSgazX6v7Rkc5AB/aXPArG8SdR1+gS6oW/pj8idhtlns2hG
         1NF9HnXlP/NlonCPb6iNG2dDUxtzydGSo4GeQ8riQYCW4GElmIOv259j9yzN4YNh5/
         sS65JSX2DDzi9YJ1XnGlwO+OP99ZeQtVvrL2tyNQ0RMv0IAhL0oaIMug+yUnqSPHuW
         YBQr4tRSl5s1yLw56/A/egYGRHjmwroo4K1ffOYH3k4QU0FUVPMiEwbrtqKDjsjNm+
         s3gOphw9tCog4p9XiTJ6HMmRBT+ri07GL3fe6+HVMKwYVnzHKtqf5+12qwLB2eKpRu
         gPnGwY2i2cBCA==
From:   Jonathan Cameron <jic23@kernel.org>
To:     linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Daniel Hung-yu Wu <hywu@google.com>
Subject: [PATCH 9/9] Input: elants - Fix suspect DMA buffer alignment
Date:   Sun, 27 Nov 2022 14:41:16 +0000
Message-Id: <20221127144116.1418083-10-jic23@kernel.org>
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

Fixes: 00f73f97527f ("Input: elants_i2c - use DMA safe i2c when possible")
Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Daniel Hung-yu Wu <hywu@google.com>
---
 drivers/input/touchscreen/elants_i2c.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/elants_i2c.c b/drivers/input/touchscreen/elants_i2c.c
index 879a4d984c90..7ad58518c651 100644
--- a/drivers/input/touchscreen/elants_i2c.c
+++ b/drivers/input/touchscreen/elants_i2c.c
@@ -184,7 +184,7 @@ struct elants_data {
 	bool keep_power_in_suspend;
 
 	/* Must be last to be used for DMA operations */
-	u8 buf[MAX_PACKET_SIZE] ____cacheline_aligned;
+	u8 buf[MAX_PACKET_SIZE] __aligned(ARCH_KMALLOC_MINALIGN);
 };
 
 static int elants_i2c_send(struct i2c_client *client,
-- 
2.38.1

