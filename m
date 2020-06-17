Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44D2B1FC67B
	for <lists+linux-input@lfdr.de>; Wed, 17 Jun 2020 08:56:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725554AbgFQGzv (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 17 Jun 2020 02:55:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726341AbgFQGzu (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 17 Jun 2020 02:55:50 -0400
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DC8BC0613EE
        for <linux-input@vger.kernel.org>; Tue, 16 Jun 2020 23:55:50 -0700 (PDT)
Received: from ramsan ([IPv6:2a02:1810:ac12:ed20:b57b:2191:a081:571d])
        by albert.telenet-ops.be with bizsmtp
        id s6vm2200R1Jlgh2066vmRX; Wed, 17 Jun 2020 08:55:47 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jlRz8-0007Mi-Da; Wed, 17 Jun 2020 08:55:46 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jlRz8-0006j2-Bd; Wed, 17 Jun 2020 08:55:46 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>
Cc:     linux-sh@vger.kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/2] sh: Remove Cayman board support
Date:   Wed, 17 Jun 2020 08:55:37 +0200
Message-Id: <20200617065539.25805-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

	Hi all,

Commit 37744feebc086908 ("sh: remove sh5 support") removed all core SH5
support, but forgot to remove board support for the SH5-based Hitachi
Cayman development board.

This patch (hopefully) completes the removal, by dropping Cayman board
support, and Cayman-specific handling in the i8042 driver.

Both patches can be applied independently.
The first patch is intended for the SH tree.
The second patch is intended for the input tree, but could be merged
through the SH tree, if acked.

Thanks!

Geert Uytterhoeven (2):
  sh: Remove SH5-based Cayman platform
  input: i8042 - Remove special Cayman handling

 arch/sh/Kconfig                     |   5 +-
 arch/sh/Makefile                    |   5 -
 arch/sh/boards/Kconfig              |   6 -
 arch/sh/boards/mach-cayman/Makefile |   5 -
 arch/sh/boards/mach-cayman/irq.c    | 148 -----------------------
 arch/sh/boards/mach-cayman/panic.c  |  46 -------
 arch/sh/boards/mach-cayman/setup.c  | 181 ----------------------------
 arch/sh/configs/cayman_defconfig    |  66 ----------
 arch/sh/drivers/pci/Makefile        |   1 -
 arch/sh/drivers/pci/fixups-cayman.c |  78 ------------
 arch/sh/tools/mach-types            |   1 -
 drivers/input/serio/i8042-io.h      |   2 -
 12 files changed, 2 insertions(+), 542 deletions(-)
 delete mode 100644 arch/sh/boards/mach-cayman/Makefile
 delete mode 100644 arch/sh/boards/mach-cayman/irq.c
 delete mode 100644 arch/sh/boards/mach-cayman/panic.c
 delete mode 100644 arch/sh/boards/mach-cayman/setup.c
 delete mode 100644 arch/sh/configs/cayman_defconfig
 delete mode 100644 arch/sh/drivers/pci/fixups-cayman.c

-- 
2.17.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
