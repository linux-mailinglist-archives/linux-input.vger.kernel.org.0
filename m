Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B2DBF15F3B
	for <lists+linux-input@lfdr.de>; Tue,  7 May 2019 10:21:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726206AbfEGIVk (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 7 May 2019 04:21:40 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:36597 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725780AbfEGIVj (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 7 May 2019 04:21:39 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
        (Exim 4.76)
        (envelope-from <colin.king@canonical.com>)
        id 1hNvLz-0001kW-Ty; Tue, 07 May 2019 08:21:36 +0000
From:   Colin King <colin.king@canonical.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Marco Felsch <m.felsch@pengutronix.de>,
        linux-input@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH][next] Input: qt1050: fix less than zero comparison on an unsigned int
Date:   Tue,  7 May 2019 09:21:35 +0100
Message-Id: <20190507082135.21538-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently the less than zero comparison of val is always false because
val is an unsigned int. Fix this by making val a signed int.

Addresses-Coverity: ("Unsigned compared against zero")
Fixes: a33ff45923c8 ("Input: qt1050 - add Microchip AT42QT1050 support")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/input/keyboard/qt1050.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/keyboard/qt1050.c b/drivers/input/keyboard/qt1050.c
index 6b1603cb7515..4debddb13972 100644
--- a/drivers/input/keyboard/qt1050.c
+++ b/drivers/input/keyboard/qt1050.c
@@ -222,7 +222,7 @@ static struct regmap_config qt1050_regmap_config = {
 
 static bool qt1050_identify(struct qt1050_priv *ts)
 {
-	unsigned int val;
+	int val;
 
 	/* Read Chip ID */
 	regmap_read(ts->regmap, QT1050_CHIP_ID, &val);
-- 
2.20.1

