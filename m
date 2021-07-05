Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72ACA3BBAB4
	for <lists+linux-input@lfdr.de>; Mon,  5 Jul 2021 12:02:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230000AbhGEKFJ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 5 Jul 2021 06:05:09 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:51035 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230291AbhGEKFJ (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 5 Jul 2021 06:05:09 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <colin.king@canonical.com>)
        id 1m0LQt-00038e-5l; Mon, 05 Jul 2021 10:02:31 +0000
From:   Colin King <colin.king@canonical.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] Input: keyboard: Fix spelling mistake in Kconfig "useable" -> "usable"
Date:   Mon,  5 Jul 2021 11:02:30 +0100
Message-Id: <20210705100230.7583-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spellign mistake in the Kconfig text. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/input/keyboard/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/keyboard/Kconfig b/drivers/input/keyboard/Kconfig
index 40a070a2e7f5..e75650e98c9e 100644
--- a/drivers/input/keyboard/Kconfig
+++ b/drivers/input/keyboard/Kconfig
@@ -210,7 +210,7 @@ config KEYBOARD_LKKBD
 	select SERIO
 	help
 	  Say Y here if you want to use a LK201 or LK401 style serial
-	  keyboard. This keyboard is also useable on PCs if you attach
+	  keyboard. This keyboard is also usable on PCs if you attach
 	  it with the inputattach program. The connector pinout is
 	  described within lkkbd.c.
 
-- 
2.31.1

