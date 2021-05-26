Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5CABC391127
	for <lists+linux-input@lfdr.de>; Wed, 26 May 2021 09:03:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232913AbhEZHFS (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 26 May 2021 03:05:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232336AbhEZHFS (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 26 May 2021 03:05:18 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41122C061574;
        Wed, 26 May 2021 00:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
        Content-ID:Content-Description:In-Reply-To:References;
        bh=LnyynXqRaay9EIKqTDGE/6aSzoHUm9VFq1HVjhq7rak=; b=GC2F1saaBl0IodIk10Z3nk7vAg
        DlP6C6tXb093nfV5WHpZj8CsDXBbfIKbslMvQyS6JYW8AWkgMXjmT4C9uHUyITOT13/re2/EIe56/
        1V56SdMmYbi3OgFCBWFYlfj3UwiK6FN+7/45n31ptPV2xBF3gwR6yh4hMebi7Z5sK39aVJj+prE4j
        mSVj777ijtqOkQTpwQ5Q2MfFUUvgA/7n6zfLNF0zXqg9GRNRb9iAn4SOIwFGHF+8iCNTaIHLWgb3d
        WUAt64FKFuCCZTeAzADcJ8Huwb4RXEe/mpVp/7Hp6EcVkFvUnkswxbSk2D5iDk0yfhN2zBWZgTa4c
        Y/K6i7iw==;
Received: from [2601:1c0:6280:3f0::1c1d] (helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1llnZx-00Brxm-V9; Wed, 26 May 2021 07:03:46 +0000
From:   Randy Dunlap <rdunlap@infradead.org>
To:     linux-kernel@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Michael Schmitz <schmitz@debian.org>,
        Roman Zippel <zippel@linux-m68k.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
Subject: [PATCH] MOUSE_ATARI: fix kconfig unmet dependency warning
Date:   Wed, 26 May 2021 00:03:45 -0700
Message-Id: <20210526070345.31114-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

MOUSE_ATARI should depend on INPUT_KEYBOARD since ATARI_KBD_CORE
depends on INPUT_KEYBOARD. This prevents MOUSE_ATARI from
selecting ATARI_KBD_CORE when INPUT_KEYBOARD is not set/enabled.

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
---
 drivers/input/mouse/Kconfig |    1 +
 1 file changed, 1 insertion(+)

--- linux-next-20210525.orig/drivers/input/mouse/Kconfig
+++ linux-next-20210525/drivers/input/mouse/Kconfig
@@ -348,6 +348,7 @@ config MOUSE_AMIGA
 
 config MOUSE_ATARI
 	tristate "Atari mouse"
+	depends on INPUT_KEYBOARD
 	depends on ATARI
 	select ATARI_KBD_CORE
 	help
