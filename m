Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4583F2F0067
	for <lists+linux-input@lfdr.de>; Sat,  9 Jan 2021 15:06:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725854AbhAIOFj (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 9 Jan 2021 09:05:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725882AbhAIOFj (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sat, 9 Jan 2021 09:05:39 -0500
X-Greylist: delayed 583 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sat, 09 Jan 2021 06:04:58 PST
Received: from relay03.th.seeweb.it (relay03.th.seeweb.it [IPv6:2001:4b7a:2000:18::164])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96E00C061786
        for <linux-input@vger.kernel.org>; Sat,  9 Jan 2021 06:04:58 -0800 (PST)
Received: from IcarusMOD.eternityproject.eu (unknown [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 0905A1F53E;
        Sat,  9 Jan 2021 14:55:14 +0100 (CET)
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
To:     linux-input@vger.kernel.org
Cc:     konrad.dybcio@somainline.org, marijn.suijten@somainline.org,
        martin.botka@somainline.org, phone-devel@vger.kernel.org,
        linux-kernel@vger.kernel.org, hadess@hadess.net,
        dmitry.torokhov@gmail.com, devicetree@vger.kernel.org,
        robh+dt@kernel.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Subject: [PATCH 1/2] input: goodix: Add support for Goodix GT9286 chip
Date:   Sat,  9 Jan 2021 14:55:11 +0100
Message-Id: <20210109135512.149032-2-angelogioacchino.delregno@somainline.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210109135512.149032-1-angelogioacchino.delregno@somainline.org>
References: <20210109135512.149032-1-angelogioacchino.delregno@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The Goodix GT9286 is a capacitive touch sensor IC based on GT1x.

This chip can be found on a number of smartphones, including the
F(x)tec Pro 1 and the Elephone U.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
---
 drivers/input/touchscreen/goodix.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/input/touchscreen/goodix.c b/drivers/input/touchscreen/goodix.c
index 02c75ea385e0..becc5af21801 100644
--- a/drivers/input/touchscreen/goodix.c
+++ b/drivers/input/touchscreen/goodix.c
@@ -157,6 +157,7 @@ static const struct goodix_chip_id goodix_chip_ids[] = {
 	{ .id = "5663", .data = &gt1x_chip_data },
 	{ .id = "5688", .data = &gt1x_chip_data },
 	{ .id = "917S", .data = &gt1x_chip_data },
+	{ .id = "9286", .data = &gt1x_chip_data },
 
 	{ .id = "911", .data = &gt911_chip_data },
 	{ .id = "9271", .data = &gt911_chip_data },
@@ -1433,6 +1434,7 @@ static const struct of_device_id goodix_of_match[] = {
 	{ .compatible = "goodix,gt927" },
 	{ .compatible = "goodix,gt9271" },
 	{ .compatible = "goodix,gt928" },
+	{ .compatible = "goodix,gt9286" },
 	{ .compatible = "goodix,gt967" },
 	{ }
 };
-- 
2.29.2

