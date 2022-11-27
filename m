Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 050D6639B62
	for <lists+linux-input@lfdr.de>; Sun, 27 Nov 2022 15:29:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229678AbiK0O3D (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 27 Nov 2022 09:29:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229676AbiK0O3D (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 27 Nov 2022 09:29:03 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C172BDFF2
        for <linux-input@vger.kernel.org>; Sun, 27 Nov 2022 06:29:02 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 6A9B760DCF
        for <linux-input@vger.kernel.org>; Sun, 27 Nov 2022 14:29:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE280C433D6;
        Sun, 27 Nov 2022 14:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1669559341;
        bh=Jy1T8pXOHg81o+LWMLTgjpQBDvQ3U108dXBJQotRG/c=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=SLAB6/7eN0U7YcGEq/xq+ttawNvdy8g3hjVy0fIxoweFWC71Bb/602/L+61xZ6fbJ
         HmyKruilikxtXQgKxZns+XuAeq1ZPJ59EH3hrtAV6wtzpLELfWzDSj63RTp7XQm4JW
         3HPrk9XD3RK82FgjQqcoorY2ceN5RKkpT/oge5I+VhC1IlUQy8PTk+pLzKu+mdUFUB
         fC5lukkjDfm7WAbiaAxqZ94lgtAmSBLmh8MS2V/AZZp/tj7K29WjuLiD4G6T5Pa3bB
         zlSqHfsor8tagRGkuAriaE4BzQU0UkM7f4Pwp2LaK6K2P9e8KbSrSkBHkrOw31inNI
         xzkNKZZrSKDHg==
From:   Jonathan Cameron <jic23@kernel.org>
To:     linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Lauri Kasanen <cand@gmx.com>
Subject: [PATCH 7/9] Input: n64joy - Fix DMA buffer alignment.
Date:   Sun, 27 Nov 2022 14:41:14 +0000
Message-Id: <20221127144116.1418083-8-jic23@kernel.org>
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

The use of ____cacheline_aligned to ensure a buffer is DMA safe only
enforces the start of the buffer alignment. In this case, sufficient
alignment is already ensured by the use of kzalloc().
____cacheline_aligned does not ensure that no other members of the
structure are placed in the same cacheline after the end of the
buffer marked.  Thus to ensure a DMA safe buffer it must be at the end
of the structure.

Whilst here switch from ____cacheline_aligned to
__aligned(ARCH_KMALLOC_MINALIGN) as on some architectures, with variable
sized cacheline lines across their cache hierarchy, require this
greater alignment guarantee for DMA safety.  Make this change throughout
the driver as it reduces need for a reader to know about the particular
architecture.

Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Lauri Kasanen <cand@gmx.com>
--
Only partly compile tested as I don't have a mips toolchain set up.
Would be great to add the stubs to be able to build these drivers
with COMPILE_TEST.
---
 drivers/input/joystick/n64joy.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/input/joystick/n64joy.c b/drivers/input/joystick/n64joy.c
index 9dbca366613e..d8c50103c108 100644
--- a/drivers/input/joystick/n64joy.c
+++ b/drivers/input/joystick/n64joy.c
@@ -44,12 +44,12 @@ static const char *n64joy_phys[MAX_CONTROLLERS] = {
 };
 
 struct n64joy_priv {
-	u64 si_buf[8] ____cacheline_aligned;
 	struct timer_list timer;
 	struct mutex n64joy_mutex;
 	struct input_dev *n64joy_dev[MAX_CONTROLLERS];
 	u32 __iomem *reg_base;
 	u8 n64joy_opened;
+	u64 si_buf[8] __aligned(ARCH_KMALLOC_MINALIGN);
 };
 
 struct joydata {
@@ -129,7 +129,7 @@ static void n64joy_exec_pif(struct n64joy_priv *priv, const u64 in[8])
 	local_irq_restore(flags);
 }
 
-static const u64 polldata[] ____cacheline_aligned = {
+static const u64 polldata[] __aligned(ARCH_KMALLOC_MINALIGN) = {
 	0xff010401ffffffff,
 	0xff010401ffffffff,
 	0xff010401ffffffff,
@@ -222,7 +222,7 @@ static void n64joy_close(struct input_dev *dev)
 	mutex_unlock(&priv->n64joy_mutex);
 }
 
-static const u64 __initconst scandata[] ____cacheline_aligned = {
+static const u64 __initconst scandata[] __aligned(ARCH_KMALLOC_MINALIGN) = {
 	0xff010300ffffffff,
 	0xff010300ffffffff,
 	0xff010300ffffffff,
-- 
2.38.1

