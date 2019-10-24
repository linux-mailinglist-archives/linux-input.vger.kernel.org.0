Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9B71BE326B
	for <lists+linux-input@lfdr.de>; Thu, 24 Oct 2019 14:33:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2439203AbfJXMdD (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 24 Oct 2019 08:33:03 -0400
Received: from baptiste.telenet-ops.be ([195.130.132.51]:48014 "EHLO
        baptiste.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2439157AbfJXMdC (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 24 Oct 2019 08:33:02 -0400
Received: from ramsan ([84.195.182.253])
        by baptiste.telenet-ops.be with bizsmtp
        id HQZ0210055USYZQ01QZ0Bw; Thu, 24 Oct 2019 14:33:00 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iNcIW-0005tO-03; Thu, 24 Oct 2019 14:33:00 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iNcIV-0003Ny-V2; Thu, 24 Oct 2019 14:32:59 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Jiri Kosina <jkosina@suse.cz>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Andrej Shadura <andrew.shadura@collabora.co.uk>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2] HID: Typo s/to back 0/back to 0/
Date:   Thu, 24 Oct 2019 14:32:58 +0200
Message-Id: <20191024123258.12959-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Fix a silly word ordering typo.

Fixes: 42337b9d4d958daa ("HID: add driver for U2F Zero built-in LED and RNG")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Andrej Shadura <andrew.shadura@collabora.co.uk>
---
v2:
  - Add Acked-by.
---
 drivers/hid/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
index 1ecb5124421c00cd..47c520b9013e16f9 100644
--- a/drivers/hid/Kconfig
+++ b/drivers/hid/Kconfig
@@ -1038,7 +1038,7 @@ config HID_U2FZERO
 
 	  U2F Zero only supports blinking its LED, so this driver doesn't
 	  allow setting the brightness to anything but 1, which will
-	  trigger a single blink and immediately reset to back 0.
+	  trigger a single blink and immediately reset back to 0.
 
 config HID_WACOM
 	tristate "Wacom Intuos/Graphire tablet support (USB)"
-- 
2.17.1

