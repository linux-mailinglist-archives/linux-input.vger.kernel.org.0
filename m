Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 17149419544
	for <lists+linux-input@lfdr.de>; Mon, 27 Sep 2021 15:41:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234359AbhI0Nnc (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 27 Sep 2021 09:43:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:38596 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234114AbhI0Nnc (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 27 Sep 2021 09:43:32 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id D3D8560240;
        Mon, 27 Sep 2021 13:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1632750114;
        bh=qjt1s5inuCWKP8g5uDxb3T+aW+Tv4h7k804QMmE7f6Q=;
        h=From:To:Cc:Subject:Date:From;
        b=qHh4HtQTKCNKt4UBPenri2J+5i62Fy+epYkIqTRlWtz0G1J9wulfA3xgCLM+p2tjq
         hRW3Wpb3okm5FffIskLqwtB9QO4YY/J7E181pveRhFBExWTVrePVe8SXLUpTETJNj+
         mv1NyUDEQjQ72apU47P2j54wSjlcQZkdckc77iGKGuKP2bJRenh68dfmClBH3qQvZc
         /UNT61O4P7il44XQIIJIbz1GxhEs8RHOXqSc/vMMzDQPQLRLCbleNQin1gF0VBpsUp
         7AtJtWzMEZKgX2JHhwAAoE2nxUkHgmxEG4YHCSCd+IwvEc6izzzyYtfnS0vyKfIMgP
         FDBTiZxYTMExg==
From:   Mark Brown <broonie@kernel.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, Mark Brown <broonie@kernel.org>
Subject: [PATCH] input: ariel-pwrbutton: Add SPI device ID table
Date:   Mon, 27 Sep 2021 14:41:04 +0100
Message-Id: <20210927134104.38648-1-broonie@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1335; h=from:subject; bh=qjt1s5inuCWKP8g5uDxb3T+aW+Tv4h7k804QMmE7f6Q=; b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBhUcnou1fFjcpY3VkOAM8Gbb1OHApjPbVWvBYTmy4b qHgnFaiJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYVHJ6AAKCRAk1otyXVSH0O9SB/ 9FcFLCscfHjDLwFXmQBO7eQKJ/LaA0NNNhiIBXwIMVpL9qhpLSvB25uLfclNdDf4xBTUqNZVhtWlJk ED/8wP6GWeStxtHgdmZ3wcTYvhJ57zb+7rhq3XbSiNXGzE6hmVm4pEsDHBOwcwhNdNstxsxMc82Z+L 797ucGEjpZT3vC2phN/7z6okHNtBCpDDaJdu48s/i83R5HgruyR71nFH3oQWjVgBAWCzi5a+THXRA4 DFZxuN27zErv4W+cXoMENgPdSoc+BtdUMNcXmtjAAPyIwGtTYdbZtk+d1CHiXxi8L4DTFsd3d4N7vg Fx8qZQsf+MNdRFvxql28yXk8gFpAxo
X-Developer-Key: i=broonie@kernel.org; a=openpgp; fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Currently autoloading for SPI devices does not use the DT ID table, it uses
SPI modalises. Supporting OF modalises is going to be difficult if not
impractical, an attempt was made but has been reverted, so ensure that
module autoloading works for this driver by adding a SPI device ID table.

Fixes: 96c8395e2166 ("spi: Revert modalias changes")
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/input/misc/ariel-pwrbutton.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/input/misc/ariel-pwrbutton.c b/drivers/input/misc/ariel-pwrbutton.c
index 17bbaac8b80c..cdc80715b5fd 100644
--- a/drivers/input/misc/ariel-pwrbutton.c
+++ b/drivers/input/misc/ariel-pwrbutton.c
@@ -149,12 +149,19 @@ static const struct of_device_id ariel_pwrbutton_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, ariel_pwrbutton_of_match);
 
+static const struct spi_device_id ariel_pwrbutton_spi_ids[] = {
+	{ .name = "wyse-ariel-ec-input" },
+	{ }
+};
+MODULE_DEVICE_TABLE(spi, ariel_pwrbutton_spi_ids);
+
 static struct spi_driver ariel_pwrbutton_driver = {
 	.driver = {
 		.name = "dell-wyse-ariel-ec-input",
 		.of_match_table = ariel_pwrbutton_of_match,
 	},
 	.probe = ariel_pwrbutton_probe,
+	.id_table = ariel_pwrbutton_spi_ids,
 };
 module_spi_driver(ariel_pwrbutton_driver);
 
-- 
2.20.1

