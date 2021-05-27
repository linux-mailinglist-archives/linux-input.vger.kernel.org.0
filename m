Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 798D53923A0
	for <lists+linux-input@lfdr.de>; Thu, 27 May 2021 02:12:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233315AbhE0AO3 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 26 May 2021 20:14:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232829AbhE0AO2 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 26 May 2021 20:14:28 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7134C061574;
        Wed, 26 May 2021 17:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
        Content-ID:Content-Description:In-Reply-To:References;
        bh=/mkS48c0mh9e8PGwzXLkD0N/csDVEEHF15MWB/exkqw=; b=2Z8CkuWyzbvSKkqqPdVKo0p4Cq
        S4EdPYT/LXn94S81bYRBYp0gY3X0hw5rFwehV2CLt9siXvcRIFkDXGVQMW0MClPZ/rjGL1tY2HB+n
        TUlEEv79v2EGgS84h/CIUWAGKuxg4qhpIMWN4j5vJy5IW1zPpCjYvDwqfT/xEbxit5avKQxzJWpXE
        /u2zK8qEX0Zu66TywY5K/mECMEDjDZHs0XPpHtt+wUdPmZw3hC4xOe3VaYXpkQEvJ4pvoWQBiSQ00
        YuyXROAsqsRA9ZLaqj3tYmfSRAVHGUgpSh4zmBvd9I2l6GovSzg/zOqt59JlMxKNI8DSumBHtWEDr
        /OOvghhw==;
Received: from [2601:1c0:6280:3f0::ce7d] (helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1lm3du-0014je-7c; Thu, 27 May 2021 00:12:54 +0000
From:   Randy Dunlap <rdunlap@infradead.org>
To:     linux-kernel@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Michael Schmitz <schmitz@debian.org>,
        Roman Zippel <zippel@linux-m68k.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
        Michael Schmitz <schmitzmic@gmail.com>
Subject: [PATCH v2] MOUSE_ATARI: fix kconfig unmet dependency warning
Date:   Wed, 26 May 2021 17:12:51 -0700
Message-Id: <20210527001251.8529-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Since the code for ATARI_KBD_CORE does not use drivers/input/keyboard/
code, just move ATARI_KBD_CORE to arch/m68k/Kconfig.machine to remove
this dependency.

Removes this kconfig warning:

WARNING: unmet direct dependencies detected for ATARI_KBD_CORE
  Depends on [n]: !UML && INPUT [=y] && INPUT_KEYBOARD [=n]
  Selected by [y]:
  - MOUSE_ATARI [=y] && !UML && INPUT [=y] && INPUT_MOUSE [=y] && ATARI [=y]

Fixes: c04cb856e20a ("m68k: Atari keyboard and mouse support.")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Michael Schmitz <schmitz@debian.org>
Cc: Roman Zippel <zippel@linux-m68k.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org
Cc: linux-m68k@lists.linux-m68k.org
Suggested-by: Geert Uytterhoeven <geert@linux-m68k.org>
Suggested-by: Michael Schmitz <schmitzmic@gmail.com>
---
v2: move the symbol outside of INPUT_KEYBOARD (Geert) -- all the way
    to Kconfig.machine (Michael). Thanks.

 arch/m68k/Kconfig.machine      |    3 +++
 drivers/input/keyboard/Kconfig |    3 ---
 2 files changed, 3 insertions(+), 3 deletions(-)

--- linux-next-20210525.orig/arch/m68k/Kconfig.machine
+++ linux-next-20210525/arch/m68k/Kconfig.machine
@@ -25,6 +25,9 @@ config ATARI
 	  this kernel on an Atari, say Y here and browse the material
 	  available in <file:Documentation/m68k>; otherwise say N.
 
+config ATARI_KBD_CORE
+	bool
+
 config MAC
 	bool "Macintosh support"
 	depends on MMU
--- linux-next-20210525.orig/drivers/input/keyboard/Kconfig
+++ linux-next-20210525/drivers/input/keyboard/Kconfig
@@ -67,9 +67,6 @@ config KEYBOARD_AMIGA
 	  To compile this driver as a module, choose M here: the
 	  module will be called amikbd.
 
-config ATARI_KBD_CORE
-	bool
-
 config KEYBOARD_APPLESPI
 	tristate "Apple SPI keyboard and trackpad"
 	depends on ACPI && EFI
