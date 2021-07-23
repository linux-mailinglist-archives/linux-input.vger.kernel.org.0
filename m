Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 20C483D3C2F
	for <lists+linux-input@lfdr.de>; Fri, 23 Jul 2021 17:08:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235509AbhGWO2M (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 23 Jul 2021 10:28:12 -0400
Received: from smtp05.smtpout.orange.fr ([80.12.242.127]:18957 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235503AbhGWO2M (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 23 Jul 2021 10:28:12 -0400
Received: from localhost.localdomain ([80.15.159.30])
        by mwinf5d09 with ME
        id Yf8j250080feRjk03f8j8M; Fri, 23 Jul 2021 17:08:44 +0200
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Fri, 23 Jul 2021 17:08:44 +0200
X-ME-IP: 80.15.159.30
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     jikos@kernel.org, benjamin.tissoires@redhat.com
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] HID: fix typo in Kconfig
Date:   Fri, 23 Jul 2021 17:08:40 +0200
Message-Id: <13c5bff1d50addbb2249b40632fcef0095231ca4.1627052845.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

There is a missing space in "relyingon".
Add it.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/hid/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
index 160554903ef9..76937f716fbe 100644
--- a/drivers/hid/Kconfig
+++ b/drivers/hid/Kconfig
@@ -576,7 +576,7 @@ config HID_LOGITECH_HIDPP
 	depends on HID_LOGITECH
 	select POWER_SUPPLY
 	help
-	Support for Logitech devices relyingon the HID++ Logitech specification
+	Support for Logitech devices relying on the HID++ Logitech specification
 
 	Say Y if you want support for Logitech devices relying on the HID++
 	specification. Such devices are the various Logitech Touchpads (T650,
-- 
2.30.2

