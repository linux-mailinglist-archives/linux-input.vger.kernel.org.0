Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 188EB3E5833
	for <lists+linux-input@lfdr.de>; Tue, 10 Aug 2021 12:22:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239695AbhHJKWU (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 10 Aug 2021 06:22:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239740AbhHJKWT (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 10 Aug 2021 06:22:19 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F8DAC061799;
        Tue, 10 Aug 2021 03:21:57 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id o1-20020a05600c5101b02902e676fe1f04so1507355wms.1;
        Tue, 10 Aug 2021 03:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=G4hGiHeL1Mjmf6XVUKk8wOt6GojnDm02h8vLJYY4Fd0=;
        b=rWJ40QSJhVrhVqniCLhn/XVYrbsG2c3cV72MpBzNtUT2yDnAjn22+LmUkDMgghJT68
         KuPZzpCq+EsTOW5VWvvMrHkl63Pvc0ypjzc1ukacRSYl6PufHckXKtuuO463SvF8JZHh
         T4k/y/Q98QEmQcH8CJahNxiggnRtdI+Ydt11X6pmMZdlOkgJRr4z/oNOROIBHCjc14aI
         Y3zlR7GBh03Q3TV3YWm6T6EgjZLfzxMQevSjCaRehtoYsOYfzgHPaej5MP3cXEGZQreH
         SIZugvLhvRPhp76+aV9384V+eMIoyvzaejmvYh3EvaF49UoIdh3UzAdl/pQstx5lFe0m
         XuEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=G4hGiHeL1Mjmf6XVUKk8wOt6GojnDm02h8vLJYY4Fd0=;
        b=mM18ejxNcIqDF3so/AGppN0MpwagmikEf/6hcy5W6SM+jh/WQbOJVONnNXr8/lb2vd
         8p9M6oRDQuvI8j4pdH1KSY3y4Kb1c1oRiniEOaXR8F/R3sIa3vKJ7+rE4N5vVNFgZr2/
         abZLI3p+OeRFyjhRjrzUD9LR7l1Ez7UHxoIUXhzfm3LAMT2HgpELoYThLBqIFIwTVNrU
         reAjWWi2BvnuM9g8NWTK0LplH+KJHBUxz0pHupUe6aBYLakrMSTgl1hVC525BPOV9YwX
         zAbDkCkFtwQOiCujIjrPpf/5lvUxdlBsU+uQQL5UDFzeVfH2O86NvRzHy0D3wXU7NalM
         vhqQ==
X-Gm-Message-State: AOAM531YSixKplZ3iqOYZMyik4uvQ61GHIi6Z3u0g2oWLBY26djyErH4
        uLOJh3vl0uEgSej62y7ptqI=
X-Google-Smtp-Source: ABdhPJy4aqHtiIzr8sf+y8kG2cOnuDi1EPmaYZzoqMCJfwDzZLlEKsA9mlIVacEWKdNzdW4BqEM1ug==
X-Received: by 2002:a1c:19c1:: with SMTP id 184mr3906865wmz.98.1628590915828;
        Tue, 10 Aug 2021 03:21:55 -0700 (PDT)
Received: from felia.fritz.box ([2001:16b8:2dbc:4b00:a54f:e1ea:825d:f9b3])
        by smtp.gmail.com with ESMTPSA id 104sm23294018wrc.4.2021.08.10.03.21.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Aug 2021 03:21:55 -0700 (PDT)
From:   Lukas Bulwahn <lukas.bulwahn@gmail.com>
To:     Dario Pagani <dario.pagani.146@gmail.com>,
        Kim Kuparinen <kimi.h.kuparinen@gmail.com>,
        Jiri Kosina <jkosina@suse.cz>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: [PATCH] HID: thrustmaster: clean up Makefile and adapt quirks
Date:   Tue, 10 Aug 2021 12:21:48 +0200
Message-Id: <20210810102148.9764-1-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Commit c49c33637802 ("HID: support for initialization of some Thrustmaster
wheels") messed up the Makefile and quirks during the refactoring of this
commit.

Luckily, ./scripts/checkkconfigsymbols.py warns on non-existing configs:

HID_TMINIT
Referencing files: drivers/hid/Makefile, drivers/hid/hid-quirks.c

Following the discussion (see Link), CONFIG_HID_THRUSTMASTER is the
intended config for CONFIG_HID_TMINIT and the file hid-tminit.c was
actually added as hid-thrustmaster.c.

So, clean up Makefile and adapt quirks to that refactoring.

Fixes: c49c33637802 ("HID: support for initialization of some Thrustmaster wheels")
Link: https://lore.kernel.org/linux-input/CAKXUXMx6dByO03f3dX0X5zjvQp0j2AhJBg0vQFDmhZUhtKxRxw@mail.gmail.com/
Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
Dario, Kim, please review, test and ack.
Jiri, Benjamin, please pick this quick fix-up patch.

 drivers/hid/Makefile     | 1 -
 drivers/hid/hid-quirks.c | 2 --
 2 files changed, 3 deletions(-)

diff --git a/drivers/hid/Makefile b/drivers/hid/Makefile
index 1ea1a7c0b20f..e29efcb1c040 100644
--- a/drivers/hid/Makefile
+++ b/drivers/hid/Makefile
@@ -115,7 +115,6 @@ obj-$(CONFIG_HID_STEELSERIES)	+= hid-steelseries.o
 obj-$(CONFIG_HID_SUNPLUS)	+= hid-sunplus.o
 obj-$(CONFIG_HID_GREENASIA)	+= hid-gaff.o
 obj-$(CONFIG_HID_THRUSTMASTER)	+= hid-tmff.o hid-thrustmaster.o
-obj-$(CONFIG_HID_TMINIT)	+= hid-tminit.o
 obj-$(CONFIG_HID_TIVO)		+= hid-tivo.o
 obj-$(CONFIG_HID_TOPSEED)	+= hid-topseed.o
 obj-$(CONFIG_HID_TWINHAN)	+= hid-twinhan.o
diff --git a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
index 51b39bda9a9d..2e104682c22b 100644
--- a/drivers/hid/hid-quirks.c
+++ b/drivers/hid/hid-quirks.c
@@ -662,8 +662,6 @@ static const struct hid_device_id hid_have_special_driver[] = {
 	{ HID_USB_DEVICE(USB_VENDOR_ID_THRUSTMASTER, 0xb653) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_THRUSTMASTER, 0xb654) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_THRUSTMASTER, 0xb65a) },
-#endif
-#if IS_ENABLED(CONFIG_HID_TMINIT)
 	{ HID_USB_DEVICE(USB_VENDOR_ID_THRUSTMASTER, 0xb65d) },
 #endif
 #if IS_ENABLED(CONFIG_HID_TIVO)
-- 
2.17.1

