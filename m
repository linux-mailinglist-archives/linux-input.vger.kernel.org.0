Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BEAC441953F
	for <lists+linux-input@lfdr.de>; Mon, 27 Sep 2021 15:40:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234360AbhI0Nme (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 27 Sep 2021 09:42:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:38112 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232185AbhI0Nmd (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 27 Sep 2021 09:42:33 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 95D0E60230;
        Mon, 27 Sep 2021 13:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1632750056;
        bh=O8uvAzoNmBiLvdmdq/5fnnecg4NdC0khGr5cryy07u8=;
        h=From:To:Cc:Subject:Date:From;
        b=TbwgOFH7R/bMhYMiTGydDL/3nH2gEKlsw/RvM9Kez0eQ2jGlpnrEGaDQeSRCFRjMK
         jdvJFwoDLbjZTzPnYCJTi7UcChwCN26lPWQKCL2hnXxjUGcWcrcpWSUtDHBQ4dyMuq
         OP+V0V0SM42Vnei/5p3DWGAXR3Qq6BAgNDeFzDj5hhG/oxrrzBmYrkSNg6rUX0kTMx
         LLoBz2IeCTMI7M4Hl3EhHJbz1j+lhy5UmvY02PB0MqSLFzkbOQLeSfN/g/FCF1avo9
         CRynC/TpRMpwIXfvZVMxyHAC6yDrGf38E9vdAhG1iCg+N/9/+o6rhkoBvV7d6XaTvc
         w4Lpj1F0s/kmQ==
From:   Mark Brown <broonie@kernel.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, Mark Brown <broonie@kernel.org>
Subject: [PATCH] input: rmi_spi: Add missing entries SPI to device ID table
Date:   Mon, 27 Sep 2021 14:40:00 +0100
Message-Id: <20210927134000.15993-1-broonie@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=920; h=from:subject; bh=O8uvAzoNmBiLvdmdq/5fnnecg4NdC0khGr5cryy07u8=; b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBhUcmeu4B8KL3yw+xSEv5zmrmh3QigJ0BtMKbcdfKT xjqoeuaJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYVHJngAKCRAk1otyXVSH0F0LB/ 9V4XeBVNCLGzzQ60Fv8/zmZpbkv/Dlx59bXN75AwxBzneZuJxUPF2jZVVt40xdQEJbv4Ai5h1rrXLi NVBN6WYGXRxqC4X3cELil4lMTzwCFAW7MttI27VOU0BMAE2/jeDZRZBY1hUGeHj9Ct+yP5MaIGqgbB 4ufw0C5i712YXsQjprsKN7CfoH8HDi+cQuFQn/+T/V3KmDYn8w3ktzbdm108FJSq1O5wi+mylgA00s 5Ov1WB8RmRdEdwtPME99myG50SBVnzXoVvUO7/RJMSCxeQfPRBA/ime6AfplJQSZ0T4Bjatj9l/aWs W1QmoeameRcxzjPpvPmfZgdNtjPk/Z
X-Developer-Key: i=broonie@kernel.org; a=openpgp; fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Currently autoloading for SPI devices does not use the DT ID table, it uses
SPI modalises. Supporting OF modalises is going to be difficult if not
impractical, an attempt was made but has been reverted, so ensure that
module autoloading works for this driver by adding SPI IDs for parts that
only have a compatible listed.

Fixes: 96c8395e2166 ("spi: Revert modalias changes")
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/input/rmi4/rmi_spi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/input/rmi4/rmi_spi.c b/drivers/input/rmi4/rmi_spi.c
index c82edda66b23..1dccb8dd8919 100644
--- a/drivers/input/rmi4/rmi_spi.c
+++ b/drivers/input/rmi4/rmi_spi.c
@@ -511,6 +511,7 @@ static const struct dev_pm_ops rmi_spi_pm = {
 
 static const struct spi_device_id rmi_id[] = {
 	{ "rmi4_spi", 0 },
+	{ "rmi4-spi", 0 },
 	{ }
 };
 MODULE_DEVICE_TABLE(spi, rmi_id);
-- 
2.20.1

