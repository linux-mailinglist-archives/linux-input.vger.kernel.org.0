Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C6B55639B63
	for <lists+linux-input@lfdr.de>; Sun, 27 Nov 2022 15:29:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229496AbiK0O3E (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 27 Nov 2022 09:29:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229669AbiK0O3D (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 27 Nov 2022 09:29:03 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 026B7DFFA
        for <linux-input@vger.kernel.org>; Sun, 27 Nov 2022 06:29:03 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id AE5E4B80937
        for <linux-input@vger.kernel.org>; Sun, 27 Nov 2022 14:29:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8878EC433C1;
        Sun, 27 Nov 2022 14:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1669559340;
        bh=o3o/moa7MtGu7jJjgZyXVibG/j/nNr3lQLloisbwnVI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=T9CFsokYXD5KaBW91nOgbgFClRhqaEKaRYOnM/QQO670/sG4NN7qBlhyeIfhQrcjT
         fjwFvd+nTrvNhxoDpW9QKpV2otx8BoFY05e88FK57kFNw7GV5tdCseFiNiwG+p7bOp
         wFpXzoP0l2kMJMUKZFKkN8y87vNuXdnXGVUIFDngFHzA3wiC/Kq7OXIsosP9HioBNR
         ZeKKixllMwO0Q4XJ4lkJMg2M2aH9MMChPbSERfexvx4tKoJ4yYDbSdjY0PATASo9kO
         MVgD85UFRdZLLUR4tbr0ppDYrKSfdnBpeNqMof4HyqJlqpXK0ALw6TdR664zjsYBF/
         seDX6NHpRnAOw==
From:   Jonathan Cameron <jic23@kernel.org>
To:     linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Subject: [PATCH 6/9] Input: surface3 - Fix padding for DMA safe buffers.
Date:   Sun, 27 Nov 2022 14:41:13 +0000
Message-Id: <20221127144116.1418083-7-jic23@kernel.org>
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

Presumably this part is little used on boards where this could actually
matter so this is mostly about removing code that might be coppied
elsewhere.

Fixes: 4feacbc24eea ("Input: add new driver for the Surface 3")
Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>
---
 drivers/input/touchscreen/surface3_spi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/surface3_spi.c b/drivers/input/touchscreen/surface3_spi.c
index 1da23e5585a0..6c884fc2b332 100644
--- a/drivers/input/touchscreen/surface3_spi.c
+++ b/drivers/input/touchscreen/surface3_spi.c
@@ -32,7 +32,7 @@ struct surface3_ts_data {
 	struct input_dev *pen_input_dev;
 	int pen_tool;
 
-	u8 rd_buf[SURFACE3_PACKET_SIZE]		____cacheline_aligned;
+	u8 rd_buf[SURFACE3_PACKET_SIZE] __aligned(ARCH_KMALLOC_MINALIGN;
 };
 
 struct surface3_ts_data_finger {
-- 
2.38.1

