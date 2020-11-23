Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 954D52BFFD2
	for <lists+linux-input@lfdr.de>; Mon, 23 Nov 2020 07:15:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726302AbgKWGPM (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 23 Nov 2020 01:15:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725275AbgKWGPM (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 23 Nov 2020 01:15:12 -0500
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E8CAC0613CF;
        Sun, 22 Nov 2020 22:15:12 -0800 (PST)
Received: by mail-pl1-x644.google.com with SMTP id u2so8321364pls.10;
        Sun, 22 Nov 2020 22:15:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=1sNSI9+VHiS8jsCXSpla4wiPIAGnEp4AMU2x4XB2+lI=;
        b=gryl4jYuFxIcEqxDJeXzLyzCzZgG/p0D8YYm7KelV4fOIqo+nsvGcvz7GhSaqxTNA9
         mzld6gafjsqSQpHDyVRfT/LubaK10wMKxOG4tyvgDmkhLotBvmmEWq2ffIL9tBUv8OYq
         mnR+owkUsqn1zhNcH09zahztEynyvcyDU03tg3iEumwfm1IeFfo9+y9PjCfwBidDiql6
         LvoRzFNJeonHC8+hfUqyt+YRDWetNGQSHZ6Wn2rJb6NplM0WGwO+6rv7qKyELlqMZU2b
         FtM/7gfhhKdqn4r/37mTlG+ZKeNEljGx+MEnvM8RyMaj8Kyni91D1jOf4vbE8XkL/xyx
         6/Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=1sNSI9+VHiS8jsCXSpla4wiPIAGnEp4AMU2x4XB2+lI=;
        b=CSGRakQvXbCoK5y9K2dcp1A5vdZiXPNPTuKFYD4m4VpSR9z2/5+HNVSBAVMuSC2FWB
         UcsOErLdEHvrgZ0T/lJVtEZRi8CaM1OvnlPBvx+DUhif7xTBC/D6Lkg5BosBbqO3lRf+
         LGW7BfnI06EkbnSD2Fy8aolBjRcEChYxPv981ykYbU747qcsuDCLCvun15euPWNllEJw
         1MxuA9A81uoTUP6NnBnl3zZvLKWcpBQDKZYwmDL2QVcP096ygSude3lcp1uklPot/2rR
         QZfFLuffUPcAH68hgLtEDWUkWD5zXCbmzsiIic97z9gwEtcRSt8z/ZT/DglAP8xnCyp/
         hG3g==
X-Gm-Message-State: AOAM531nj+lTjxE3OD1RnnLE4CwUcuQ9xSqKIWweJlIA8z8VJWF/YlB0
        7aTFZ43VnCIVBiRx+fhEdjuPNmmNTCg=
X-Google-Smtp-Source: ABdhPJyxzrU59fgcFKpQVfOqbQ816ob5ymVEUOSIClvIlCWJ2PCR3rei0H9ZyLXvIRY0Hmh6n2xhMQ==
X-Received: by 2002:a17:902:ee04:b029:d9:d8a8:fa60 with SMTP id z4-20020a170902ee04b02900d9d8a8fa60mr16849816plb.84.1606112111442;
        Sun, 22 Nov 2020 22:15:11 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id i11sm10617915pfq.156.2020.11.22.22.15.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2020 22:15:10 -0800 (PST)
Date:   Sun, 22 Nov 2020 22:15:08 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-kernel@vger.kernel.org
Subject: [PATCH] Input: soc_button_array - add missing include
Message-ID: <20201123061508.GA1009828@dtor-ws>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This fixes the following build errors:

  CC [M]  drivers/input/misc/soc_button_array.o
drivers/input/misc/soc_button_array.c:156:4: error: implicit declaration of function 'irq_set_irq_type' [-Werror,-Wimplicit-function-declaration]
                        irq_set_irq_type(irq, IRQ_TYPE_LEVEL_LOW);
                        ^
drivers/input/misc/soc_button_array.c:156:26: error: use of undeclared identifier 'IRQ_TYPE_LEVEL_LOW'
                        irq_set_irq_type(irq, IRQ_TYPE_LEVEL_LOW);
                                              ^
2 errors generated.

Fixes: 78a5b53e9fb4 ("Input: soc_button_array - work around DSDTs which modify the irqflags")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/misc/soc_button_array.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/input/misc/soc_button_array.c b/drivers/input/misc/soc_button_array.c
index cae1a3fae83a..d14a65683c5e 100644
--- a/drivers/input/misc/soc_button_array.c
+++ b/drivers/input/misc/soc_button_array.c
@@ -9,6 +9,7 @@
 #include <linux/module.h>
 #include <linux/input.h>
 #include <linux/init.h>
+#include <linux/irq.h>
 #include <linux/kernel.h>
 #include <linux/acpi.h>
 #include <linux/dmi.h>
-- 
2.29.2.454.gaff20da3a2-goog


-- 
Dmitry
