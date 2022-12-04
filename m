Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B9ED3641E74
	for <lists+linux-input@lfdr.de>; Sun,  4 Dec 2022 18:57:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230306AbiLDR5C (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 4 Dec 2022 12:57:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230304AbiLDR4m (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 4 Dec 2022 12:56:42 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA005140CD
        for <linux-input@vger.kernel.org>; Sun,  4 Dec 2022 09:56:41 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 94B6EB80B92
        for <linux-input@vger.kernel.org>; Sun,  4 Dec 2022 17:56:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CF13C433C1;
        Sun,  4 Dec 2022 17:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1670176599;
        bh=Dx7r1yc4Gya8vLmmjUMmR/jNA9Ing0ovYlagkS/LdMc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ZFes9/17J1EoJoH7NPi2xoQ78Al2F8CwZJT90tp9AahxVppVct5hTqOezdU2PYBNA
         2KkbBwc7r15eF4lkZx2vvCjk35DcDtEIhMhXeQoXSag14I/8jT8PRzLUCkco43ruB/
         XvSZO/IE7FCVe6Sskpqm+zsn1dj1MHE4gU+jz3WZR3KLHBkdGaFUWSrmMCfbD7/4wE
         0ZeAGgA/0+tnwOVDgOoD3bLu+nLP7DeF+VYsZajUReJpOcdk6/WqlP0oKpbK7uV1br
         ljnWgYfrxDcYXrqik3/Ag2u+BCVAdzjimV0crGhBtT7hHEwB3gklAb6Ll0K4PCy2qY
         xQ6Wc6iW2ROzA==
From:   Jonathan Cameron <jic23@kernel.org>
To:     linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [PATCH 27/32] Input: tegra-kbc - allow build with COMPILE_TEST
Date:   Sun,  4 Dec 2022 18:08:36 +0000
Message-Id: <20221204180841.2211588-28-jic23@kernel.org>
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
index 00292118b79b..28a9ad8a1466 100644
--- a/drivers/input/keyboard/Kconfig
+++ b/drivers/input/keyboard/Kconfig
@@ -508,7 +508,7 @@ config KEYBOARD_NSPIRE
 
 config KEYBOARD_TEGRA
 	tristate "NVIDIA Tegra internal matrix keyboard controller support"
-	depends on ARCH_TEGRA && OF
+	depends on (ARCH_TEGRA && OF) || COMPILE_TEST
 	select INPUT_MATRIXKMAP
 	help
 	  Say Y here if you want to use a matrix keyboard connected directly
-- 
2.38.1

