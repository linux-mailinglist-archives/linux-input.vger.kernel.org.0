Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6E90A194E77
	for <lists+linux-input@lfdr.de>; Fri, 27 Mar 2020 02:32:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727509AbgC0Bcu (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 26 Mar 2020 21:32:50 -0400
Received: from mail-pf1-f201.google.com ([209.85.210.201]:33216 "EHLO
        mail-pf1-f201.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727122AbgC0Bcu (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 26 Mar 2020 21:32:50 -0400
Received: by mail-pf1-f201.google.com with SMTP id o5so6974299pfp.0
        for <linux-input@vger.kernel.org>; Thu, 26 Mar 2020 18:32:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=00RV7bNLHk/+srLS130iQAKmhRfndHchHDNeo4WMsqs=;
        b=OeidLvA5lvefgDK7/Lhlm9pfs2j2GdTsKuu8cUAqJgpnGukG4D3aD9o8ROmAxiZfiC
         N1um11XjyxlpPPHf/FZ8K1Knc0277Ub7tcnjwFjGTNp6UbKWixZoqxIJkikE/UJ+SBJU
         DEoQbeU3GkPGwQK1vCm+BsGV/ZnEauid0cdne89ZrJQXeRkV0wQdsZnIL82oHnGJ8Gy7
         y8hn5XXtGEpKHzaVacRzIMYV4NRWE4E7QwF7lElKf7yq8G+pZwFc1UyIpMRgNs7bKa0z
         scMoBz3E+MotGPm3SgxPfEx/JimkmjYMipqOEL53oJ+eI8rT+Z4JP6MI7vZgX/rVgMOB
         LHJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=00RV7bNLHk/+srLS130iQAKmhRfndHchHDNeo4WMsqs=;
        b=oiHguGPNZT53uaGQS/AC/xM5Skh3Lchphp34Lij3JEsGOE3zSXYF2TMFoUtIQqtICk
         XIc7fWSthJ6FL0rnrrPnXvZOaUVbwqc485liPRdfoTgAn/zAH20ZsaRtth/FyItmFq1j
         Kb1NU3JZ7FsJeck7IsdHsWxkIF+WMnrjjOBkq4n6iwGaTGKVqWMPlQFMqjMAdHBfcccF
         gjDezyTPFa+vcgrRmnm39QkKg2Bv8Votn36UkEWTtkavNWCPZpF2xKxQ03Pq9S9vBtUj
         89fyYLCGzMz2oLwNBQ9xrKHTpNYHl8m7I7DlDJZzYYW5u2XoX5DwJccIIDC0qkmmQ7vE
         PYdg==
X-Gm-Message-State: ANhLgQ17vresWEG7Z9Kse+qsGwcQpcy3IvAgUlJFENrlH7D1vUsonqXy
        8a+uwl9IlTNg2GTfpTKBDcSKU/uhRfMm
X-Google-Smtp-Source: ADFU+vvxEB6/tnu1KoE7CiH6g1ntv3CfQrUiRH4eQWXOoeZZYIIdOLTg20OXiK4zK1sdzoHVsZ96xI4ldhQa
X-Received: by 2002:a63:cf4a:: with SMTP id b10mr11648063pgj.354.1585272768440;
 Thu, 26 Mar 2020 18:32:48 -0700 (PDT)
Date:   Thu, 26 Mar 2020 18:32:35 -0700
Message-Id: <20200327013239.238182-1-rajatja@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.25.1.696.g5e7596f4ac-goog
Subject: [PATCH v3 1/5] input/serio/i8042: Attach fwnode to serio i8042 kbd device
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
v3: Same as v2
v2: Remove the Change-Id from the commit log

 drivers/input/serio/i8042-x86ia64io.h | 1 +
 drivers/input/serio/i8042.c           | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/drivers/input/serio/i8042-x86ia64io.h b/drivers/input/serio/i8042-x86ia64io.h
index dc974c288e880..ed9ec4310d976 100644
--- a/drivers/input/serio/i8042-x86ia64io.h
+++ b/drivers/input/serio/i8042-x86ia64io.h
@@ -927,6 +927,7 @@ static int i8042_pnp_kbd_probe(struct pnp_dev *dev, const struct pnp_device_id *
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
2.25.1.696.g5e7596f4ac-goog

