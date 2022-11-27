Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2E78F639B64
	for <lists+linux-input@lfdr.de>; Sun, 27 Nov 2022 15:29:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229681AbiK0O3G (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 27 Nov 2022 09:29:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229690AbiK0O3E (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 27 Nov 2022 09:29:04 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33CC4DFF3
        for <linux-input@vger.kernel.org>; Sun, 27 Nov 2022 06:29:04 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C10AA60DC8
        for <linux-input@vger.kernel.org>; Sun, 27 Nov 2022 14:29:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40566C433C1;
        Sun, 27 Nov 2022 14:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1669559343;
        bh=QsL8vDZaeyn70YUIfKe1Z7n3hslJX8WYpKdZzZmdcTc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=NtPni+349EamRADKKGpJZ9fqq/ONta2ohnash1+mydVAizXpAda/2jpd3nSs7STz8
         P3VMG65P0vB6eVbYhV0Piywdz3mGdY5F006BHZfTlDqclZPsKlE/8Z+3b0/YYWWFE6
         yvxZniY8hNRHJC2wm6+N/e2KzxZa9Jy56tFrmtR/ngysyrPDlfFj0HV8U9BmlDnKY9
         beGSTef+sEyI/xXq2lT8X/YQbfkZHPau0uZwhfWnfTa0rTol3TG9nui6CaFhc6FIVz
         sye0QcgCLDaBE5wXq4qGm8EEGBdDxHqjJZSQBnPS7esVXS+CLqaCUNaOyQshD3bFo7
         XnRu1klQtWTCQ==
From:   Jonathan Cameron <jic23@kernel.org>
To:     linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Daniel Hung-yu Wu <hywu@google.com>
Subject: [PATCH 8/9] Input: atmel_captouch - Avoid suspect DMA buffer alignment.
Date:   Sun, 27 Nov 2022 14:41:15 +0000
Message-Id: <20221127144116.1418083-9-jic23@kernel.org>
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

This is probably not a fix as such, because likely this particular
device is only used on devices where the given alignment is sufficient.

Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Daniel Hung-yu Wu <hywu@google.com>
---
 drivers/input/misc/atmel_captouch.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/misc/atmel_captouch.c b/drivers/input/misc/atmel_captouch.c
index 051aded6815a..9681c763356c 100644
--- a/drivers/input/misc/atmel_captouch.c
+++ b/drivers/input/misc/atmel_captouch.c
@@ -71,7 +71,7 @@ struct atmel_captouch_device {
 	u32 num_btn;
 	u32 keycodes[MAX_NUM_OF_BUTTONS];
 	u8 prev_btn;
-	u8 xfer_buf[8] ____cacheline_aligned;
+	u8 xfer_buf[8] __aligned(ARCH_KMALLOC_MINALIGN);
 };
 
 /*
-- 
2.38.1

