Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 005BA2CF4E8
	for <lists+linux-input@lfdr.de>; Fri,  4 Dec 2020 20:37:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730737AbgLDThR (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 4 Dec 2020 14:37:17 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:48834 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727661AbgLDThR (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 4 Dec 2020 14:37:17 -0500
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <colin.king@canonical.com>)
        id 1klGsd-0007AZ-Ma; Fri, 04 Dec 2020 19:36:35 +0000
From:   Colin King <colin.king@canonical.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] Input: fix spelling mistake "theses" -> "these" in Kconfig
Date:   Fri,  4 Dec 2020 19:36:35 +0000
Message-Id: <20201204193635.1152241-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in the Kconfig help text. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/input/mouse/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/mouse/Kconfig b/drivers/input/mouse/Kconfig
index d8b6a5dab190..63c9cda555c3 100644
--- a/drivers/input/mouse/Kconfig
+++ b/drivers/input/mouse/Kconfig
@@ -372,7 +372,7 @@ config MOUSE_VSXXXAA
 	select SERIO
 	help
 	  Say Y (or M) if you want to use a DEC VSXXX-AA (hockey
-	  puck) or a VSXXX-GA (rectangular) mouse. Theses mice are
+	  puck) or a VSXXX-GA (rectangular) mouse. These mice are
 	  typically used on DECstations or VAXstations, but can also
 	  be used on any box capable of RS232 (with some adaptor
 	  described in the source file). This driver also works with the
-- 
2.29.2

