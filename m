Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4C9062B509
	for <lists+linux-input@lfdr.de>; Mon, 27 May 2019 14:25:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726733AbfE0MZf (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 27 May 2019 08:25:35 -0400
Received: from laurent.telenet-ops.be ([195.130.137.89]:41148 "EHLO
        laurent.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726522AbfE0MZf (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 27 May 2019 08:25:35 -0400
Received: from ramsan ([84.194.111.163])
        by laurent.telenet-ops.be with bizsmtp
        id HQRZ2000T3XaVaC01QRZR4; Mon, 27 May 2019 14:25:34 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hVEh3-0001UE-Hp; Mon, 27 May 2019 14:25:33 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hVEh3-0001as-GN; Mon, 27 May 2019 14:25:33 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Andrej Shadura <andrew.shadura@collabora.co.uk>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] [trivial] HID: Typo s/to back 0/back to 0/
Date:   Mon, 27 May 2019 14:25:32 +0200
Message-Id: <20190527122532.6084-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Fix a silly word ordering typo.

Fixes: 42337b9d4d958daa ("HID: add driver for U2F Zero built-in LED and RNG")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/hid/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
index c3c390ca369022f0..735223f90035b2bf 100644
--- a/drivers/hid/Kconfig
+++ b/drivers/hid/Kconfig
@@ -1028,7 +1028,7 @@ config HID_U2FZERO
 
 	  U2F Zero only supports blinking its LED, so this driver doesn't
 	  allow setting the brightness to anything but 1, which will
-	  trigger a single blink and immediately reset to back 0.
+	  trigger a single blink and immediately reset back to 0.
 
 config HID_WACOM
 	tristate "Wacom Intuos/Graphire tablet support (USB)"
-- 
2.17.1

