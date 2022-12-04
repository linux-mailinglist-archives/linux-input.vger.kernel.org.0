Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 90B4B641E77
	for <lists+linux-input@lfdr.de>; Sun,  4 Dec 2022 18:57:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230311AbiLDR5E (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 4 Dec 2022 12:57:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230313AbiLDR4s (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 4 Dec 2022 12:56:48 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBD27140CD
        for <linux-input@vger.kernel.org>; Sun,  4 Dec 2022 09:56:47 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id A4423B80B89
        for <linux-input@vger.kernel.org>; Sun,  4 Dec 2022 17:56:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 753CBC433D7;
        Sun,  4 Dec 2022 17:56:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1670176605;
        bh=C3Qqjsr5mOVDXnjvLYCTzX1P+UCmIt8ADdw1UMIGVeg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=mgyr5utLUO10F2xf9SQRs84UDVxkLZqRcxR+fpe+3JdgFz0ZYn6QGmMB0mTmpArUE
         EvN2kpPZFroUVjsFKTAIjJgPnWv6Jj55lvLl91X3ustwb97/OrsRQVljRqojpQat3R
         KC1lm6NnojajddihNEkKvvUrWxbvgEiHrlZVtCE5zfHgXwbefsAUP2EoS8sByXPNQk
         ZJlcDea95N0oq3mVHkKuUVqFPklFd7Dx7RyWjqjpFmHFyP6fYUq2fD6CvP2BRzA7qe
         gCUpnCuppzJaiYjMxV4m9qaRomvWsNHl0gjkkTSNk5LKEF2u7nojGuR6tkh9cLJ3pk
         I8/O8SUfEKu0Q==
From:   Jonathan Cameron <jic23@kernel.org>
To:     linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Tomohiro Yoshidomi <sylph23k@gmail.com>
Subject: [PATCH 32/32] Input: pxspad: Fix unused data warning when force feedback not enabled.
Date:   Sun,  4 Dec 2022 18:08:41 +0000
Message-Id: <20221204180841.2211588-33-jic23@kernel.org>
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

The functions using this data were protected with
Do the same for the data used only in those functions.

Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Tomohiro Yoshidomi <sylph23k@gmail.com>
---
 drivers/input/joystick/psxpad-spi.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/input/joystick/psxpad-spi.c b/drivers/input/joystick/psxpad-spi.c
index 2c395af13d42..de734a927b4d 100644
--- a/drivers/input/joystick/psxpad-spi.c
+++ b/drivers/input/joystick/psxpad-spi.c
@@ -44,6 +44,8 @@ static const u8 PSX_CMD_POLL[] = {
 	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
 	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
 };
+
+#ifdef CONFIG_JOYSTICK_PSXPAD_SPI_FF
 /*	0x01, 0x43, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00 */
 static const u8 PSX_CMD_ENTER_CFG[] = {
 	0x80, 0xC2, 0x00, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00
@@ -56,6 +58,7 @@ static const u8 PSX_CMD_EXIT_CFG[] = {
 static const u8 PSX_CMD_ENABLE_MOTOR[]	= {
 	0x80, 0xB2, 0x00, 0x00, 0x80, 0xFF, 0xFF, 0xFF, 0xFF
 };
+#endif /* CONFIG_JOYSTICK_PSXPAD_SPI_FF */
 
 struct psxpad {
 	struct spi_device *spi;
-- 
2.38.1

