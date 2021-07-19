Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2758C3CD1DE
	for <lists+linux-input@lfdr.de>; Mon, 19 Jul 2021 12:28:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235947AbhGSJqx (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 19 Jul 2021 05:46:53 -0400
Received: from smtp-relay-canonical-0.canonical.com ([185.125.188.120]:59844
        "EHLO smtp-relay-canonical-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235172AbhGSJqx (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 19 Jul 2021 05:46:53 -0400
Received: from localhost (1.general.cking.uk.vpn [10.172.193.212])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id BD508408AC;
        Mon, 19 Jul 2021 10:27:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1626690451;
        bh=bMnvG/oWgYe0xTyt+xJvMbwgbB+r0j8c1oN49XEI3Uo=;
        h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type;
        b=KOsMx4++LPULDn7NE27AlQSloFzjekCHJoUxSp7yCZZU6nvYsv9sfErmtQvxKk2rg
         mc8IS5AKlXmtZEJhG6gO7CTCWmb1/8VHONlqb4PkFd31HCLxfM/UKywAUHFXhmsduQ
         mJiSlarag6btFlCNM8fn3qsV+lEfhwmkKnOsIy2QE8D3fjqHlC1yyFHrtqqGOP4e/2
         194+W8fKeHz7HibKyerWm0Jic3K0HRekJSbegZWzZSsLeebSJGtchZcyz49U0ZV0fG
         /OjoXM1z4C/ZyL9Thloodkjrd18Ev1McO6rsPQX/JxcDWevXQQbsYQEVYdIUo5dfqp
         yBaQ8xYMc4rPQ==
From:   Colin King <colin.king@canonical.com>
To:     Jiri Kosina <jikos@kernel.org>, linux-usb@vger.kernel.org,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org
Subject: [PATCH] USB HID: Fix spelling mistake "Uninterruptable" -> "Uninterruptible"
Date:   Mon, 19 Jul 2021 11:27:31 +0100
Message-Id: <20210719102731.15107-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in the Kconfig text. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/hid/usbhid/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/usbhid/Kconfig b/drivers/hid/usbhid/Kconfig
index dcf3a235870f..7c2032f7f44d 100644
--- a/drivers/hid/usbhid/Kconfig
+++ b/drivers/hid/usbhid/Kconfig
@@ -38,7 +38,7 @@ config USB_HIDDEV
 	help
 	  Say Y here if you want to support HID devices (from the USB
 	  specification standpoint) that aren't strictly user interface
-	  devices, like monitor controls and Uninterruptable Power Supplies.
+	  devices, like monitor controls and Uninterruptible Power Supplies.
 
 	  This module supports these devices separately using a separate
 	  event interface on /dev/usb/hiddevX (char 180:96 to 180:111).
-- 
2.31.1

