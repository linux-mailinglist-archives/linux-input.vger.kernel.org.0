Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 62EE1574776
	for <lists+linux-input@lfdr.de>; Thu, 14 Jul 2022 10:45:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231504AbiGNIpF (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 14 Jul 2022 04:45:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236884AbiGNIpE (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 14 Jul 2022 04:45:04 -0400
Received: from smtpdh19-2.aruba.it (smtpdh19-2.aruba.it [62.149.155.149])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 81752402CE
        for <linux-input@vger.kernel.org>; Thu, 14 Jul 2022 01:45:03 -0700 (PDT)
Received: from asem-TANK-H61.asem.intra ([151.1.184.193])
        by Aruba Outgoing Smtp  with ESMTPSA
        id BuRhoA7r5bvrcBuS2oFpka; Thu, 14 Jul 2022 10:44:03 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
        t=1657788243; bh=82V/BwzKSn3pPk/IVOhT7YMBofgVkaQwuuRmgiOZ8AI=;
        h=From:To:Subject:Date:MIME-Version;
        b=fCgG3z87lo5hPrXnZqGmrXMcSMwVvR/zGqfkug8Rb5VPpn50/wx5WvhXJEdM2GyjV
         HdVtKuvPtx0g5utOsWPF6vkw7KooBIvrZ2d2z5xRrYyH23wwPLTLAXQCEay2zSg2Lr
         aZ0onVr7fSblVMpEH6TVWKbbeMjliaB3ZuvK0sp2Umv/YPcWqipuivtvx0LdNeSrZX
         /AOQm+CnHxZuuASbxDVfvVckAspYMqhq1aB3jUjUDXnwLcwl5vvExV0Do30Lpy/uCW
         pVMHIkroPOlarPqDK7zvAJYpJ1UXzGLs4cANlHs0R5h3EQEvcM/807GUUW+ZAEqlQy
         uMSajsQffzXng==
From:   Luca Ellero <luca.ellero@brickedbrain.com>
To:     dmitry.torokhov@gmail.com, daniel@zonque.org,
        m.felsch@pengutronix.de, andriy.shevchenko@linux.intel.com,
        u.kleine-koenig@pengutronix.de, mkl@pengutronix.de,
        miquel.raynal@bootlin.com, imre.deak@nokia.com
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Luca Ellero <l.ellero@asem.it>
Subject: [PATCH 1/3] ads7846: don't report pressure for ads7845
Date:   Thu, 14 Jul 2022 10:43:17 +0200
Message-Id: <20220714084319.107334-2-luca.ellero@brickedbrain.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220714084319.107334-1-luca.ellero@brickedbrain.com>
References: <20220714084319.107334-1-luca.ellero@brickedbrain.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfP/NCL/d34WAYZfIx8PIc1a46cfqL0txdrtSAjzBLOqzYJz9dGtL7B6qA/P+bWEXxldcT2EybS7VBymHJAO/hPClUUKZlgQFyOghGUtzTY5FWgvRsNIo
 MP9xARjbbtIHXtJug3VSCdXWc3r7M/au4SpW9ACUNoo5RR25R8XQN7aAIuk2pzxBCcmwAzgYpDMPalqtDBLTbWuXvteyHcQxw/OsBxxxYkhnnxqeekOv7F5B
 Puz22GTennozlkfw6NTpwGw1Pq4Rx1lmQzhgIz95HIMb6VHkekvW/Vu1e9LAGodO5m2vImirxyrH8tu5c4Fcj0rlLVySkxFalSFacoI/zc3XoyDGkI61XEt+
 sEVX8phtWtEyyXYObN95pRC66VaoKs0tjcOgpfE5ChgiQWKCY9R6BL50XKtDvknhTK/aa7UqnJTKEc4gYYLyqyPOBJ5ZwhPBS+54ZcsRgrMouRedqj89o3v4
 eL0Dfp5SjDXiW3g7TrLV+WHBBFRqw81JtxmlyJVRmeVjPexLo4i/FUXBDHv7CuyAGhoowcdt8V1fh8D6bBRzCyJOUlnrVOyFacl346oiU4sJA7lUFagMdfW7
 Izs=
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Luca Ellero <l.ellero@asem.it>

ADS7845 doesn't support pressure.
This patch avoids the following error reported by libinput-list-devices:
"ADS7845 Touchscreen: kernel bug: device has min == max on ABS_PRESSURE"

Signed-off-by: Luca Ellero <l.ellero@asem.it>
---
 drivers/input/touchscreen/ads7846.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/input/touchscreen/ads7846.c b/drivers/input/touchscreen/ads7846.c
index bed68a68f330..24605c40d039 100644
--- a/drivers/input/touchscreen/ads7846.c
+++ b/drivers/input/touchscreen/ads7846.c
@@ -1316,8 +1316,9 @@ static int ads7846_probe(struct spi_device *spi)
 			pdata->y_min ? : 0,
 			pdata->y_max ? : MAX_12BIT,
 			0, 0);
-	input_set_abs_params(input_dev, ABS_PRESSURE,
-			pdata->pressure_min, pdata->pressure_max, 0, 0);
+	if (ts->model != 7845)
+		input_set_abs_params(input_dev, ABS_PRESSURE,
+				pdata->pressure_min, pdata->pressure_max, 0, 0);
 
 	/*
 	 * Parse common framework properties. Must be done here to ensure the
-- 
2.25.1

