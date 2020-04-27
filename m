Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 158931BAFE0
	for <lists+linux-input@lfdr.de>; Mon, 27 Apr 2020 23:03:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726602AbgD0VDE (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 27 Apr 2020 17:03:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726442AbgD0VDE (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 27 Apr 2020 17:03:04 -0400
Received: from mail-qt1-x849.google.com (mail-qt1-x849.google.com [IPv6:2607:f8b0:4864:20::849])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D741EC03C1A8
        for <linux-input@vger.kernel.org>; Mon, 27 Apr 2020 14:03:03 -0700 (PDT)
Received: by mail-qt1-x849.google.com with SMTP id e44so21979950qta.9
        for <linux-input@vger.kernel.org>; Mon, 27 Apr 2020 14:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=23GGnMwKYvt3Cgj/lhkkh8PS8CBiboCjGVStVTQoV58=;
        b=uJ3Wv2mn3Q1SH5G5z7pkpeKo+Y1QXqCq3ao34idnjbgsWSe8tTMKo/LZDfBDgSwvJ+
         qKgsWq/UV2BvdfWYtfyu24Cylm6N4eRDHTln1it9IJvuHP1ObRvrToKe/rSJ2+l+alvv
         9XkvWTgmrq0I6aQPz3sDLhld1zpVDIuSof8GyK70zVpvWSrELmm26BzrCygrOJbhaRDM
         Fe8NAjYYDc9VLols4zdTrk+lQtU8GmMBjIifckAuIXoWc9YbRChsliWre51Z6BJ02IG9
         HbzlR3xAR3wg1ypOCeT+s0AGDNR2lOTapxoHwLqXz782WROtbY/WwoXiRhQBmT6Peh4O
         pUDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=23GGnMwKYvt3Cgj/lhkkh8PS8CBiboCjGVStVTQoV58=;
        b=XEwhB+8+0EHkFWL8Gud16Q//fupB7GKUMsFJKnQpmPK1w1uhjNOPkMuInffDPGfsoj
         xS1mtXrTL35HhlxIDloRgE+1oQx6q45fEgPTH0JVr78WWhF+EQUv1fWJ5NocmCGbIDpL
         b+sJ4cHLQvbMOu6mcOsmPfc2xL8E/UOej6c9imBlU6OcoPUIW6U7PPHYEz/3vqmb13j9
         Iig5SwlZPj1e0ClmQjYGdf8KdGG5acYIqDFTqiAxlMtnzQ+EW1GNSgjpOR11DWy2+Cr4
         XPR80NRoaAk8r+GSDc4cFydGF/BdXznmr/rUZL4l1OQfdynwQeZxiYhZjdXxkmZTJDUS
         Alsg==
X-Gm-Message-State: AGi0PuYzhsYZmTjyMmSPRcKlYSIIGwxxeZMgP0wB7CC5KF7XpbuY1sMJ
        c8Q78B0wSM+ARKxOfKNFP7gUhXyUNZRs
X-Google-Smtp-Source: APiQypKahN7ghxLa5ZMhrrRFTqL+QsRn5U1vupwEhsBNUqZHCzWOu1dqTKRMxgn9lK8zEQi9Upg4I8/GRiNS
X-Received: by 2002:a0c:f8cf:: with SMTP id h15mr23168133qvo.22.1588021382826;
 Mon, 27 Apr 2020 14:03:02 -0700 (PDT)
Date:   Mon, 27 Apr 2020 14:02:57 -0700
Message-Id: <20200427210259.91330-1-rajatja@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.26.2.303.gf8c07b1a785-goog
Subject: [PATCH v5 1/3] input/serio/i8042: Attach fwnode to serio i8042 kbd device
From:   Rajat Jain <rajatja@google.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>, dtor@google.com,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rajat Jain <rajatja@google.com>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Enrico Weigelt <info@metux.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Allison Randal <allison@lohutok.net>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, furquan@google.com,
        dlaurie@google.com, bleung@google.com, zentaro@google.com,
        dbehr@google.com
Cc:     rajatxjain@gmail.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Attach the firmware node to the serio i8042 kbd device so that device
properties can be passed from the firmware.

Signed-off-by: Rajat Jain <rajatja@google.com>
---
v5: Same as v4
v4: Same as v3
v3: same as v2
v2: Remove the Change-Id from the commit log

 drivers/input/serio/i8042-x86ia64io.h | 1 +
 drivers/input/serio/i8042.c           | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/drivers/input/serio/i8042-x86ia64io.h b/drivers/input/serio/i8042-x86ia64io.h
index 08e919dbeb5d1..d0c39426ca2c8 100644
--- a/drivers/input/serio/i8042-x86ia64io.h
+++ b/drivers/input/serio/i8042-x86ia64io.h
@@ -938,6 +938,7 @@ static int i8042_pnp_kbd_probe(struct pnp_dev *dev, const struct pnp_device_id *
 	}
 	i8042_pnp_id_to_string(dev->id, i8042_kbd_firmware_id,
 			       sizeof(i8042_kbd_firmware_id));
+	i8042_kbd_fwnode = dev_fwnode(&dev->dev);
 
 	/* Keyboard ports are always supposed to be wakeup-enabled */
 	device_set_wakeup_enable(&dev->dev, true);
diff --git a/drivers/input/serio/i8042.c b/drivers/input/serio/i8042.c
index 20ff2bed3917a..0dddf273afd94 100644
--- a/drivers/input/serio/i8042.c
+++ b/drivers/input/serio/i8042.c
@@ -21,6 +21,7 @@
 #include <linux/i8042.h>
 #include <linux/slab.h>
 #include <linux/suspend.h>
+#include <linux/property.h>
 
 #include <asm/io.h>
 
@@ -124,6 +125,7 @@ MODULE_PARM_DESC(unmask_kbd_data, "Unconditional enable (may reveal sensitive da
 static bool i8042_bypass_aux_irq_test;
 static char i8042_kbd_firmware_id[128];
 static char i8042_aux_firmware_id[128];
+static struct fwnode_handle *i8042_kbd_fwnode;
 
 #include "i8042.h"
 
@@ -1335,6 +1337,7 @@ static int __init i8042_create_kbd_port(void)
 	strlcpy(serio->phys, I8042_KBD_PHYS_DESC, sizeof(serio->phys));
 	strlcpy(serio->firmware_id, i8042_kbd_firmware_id,
 		sizeof(serio->firmware_id));
+	set_primary_fwnode(&serio->dev, i8042_kbd_fwnode);
 
 	port->serio = serio;
 	port->irq = I8042_KBD_IRQ;
-- 
2.26.2.303.gf8c07b1a785-goog

