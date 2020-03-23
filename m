Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E1CDE190228
	for <lists+linux-input@lfdr.de>; Tue, 24 Mar 2020 00:46:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727159AbgCWXpM (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 23 Mar 2020 19:45:12 -0400
Received: from mail-pg1-f202.google.com ([209.85.215.202]:55838 "EHLO
        mail-pg1-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726982AbgCWXpM (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 23 Mar 2020 19:45:12 -0400
Received: by mail-pg1-f202.google.com with SMTP id r10so12066336pgu.22
        for <linux-input@vger.kernel.org>; Mon, 23 Mar 2020 16:45:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=CGN67ai+uJsj1tfuyyku3cDC0jfYqRZasznuB25TKmc=;
        b=Q0if1IPWh8AYjLmejNgFM/5LxJSF4tTmF2CGc43pEBQoAo5A7TUfQn+Fl1tKmCP94O
         YjxNL6tnuwxAWIcr/4lITV7Db7lVzcpMk3rxE/XcW6XqbxCTPsxNogSTJSWnqXNPQTGn
         Z+YZgKyL8RF/m2T+RPJHO9Usk7eQgFW2jlmxTxNMIXdGW9HSADbVQYi9qiw1j/p7InKE
         quFlVly1IFxFxc7hs26rHsjrmEk9jaT85zweyDHV8rFTqho9Z7bXJ62ntmqnYnLa/6Vu
         L/DnRIbIf4LsqFVMlN3ARFgjI1p4IX0XgoS+JIbLgjXLQWi+dChZiw5xn89xw/nqpK8o
         g7fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=CGN67ai+uJsj1tfuyyku3cDC0jfYqRZasznuB25TKmc=;
        b=QIfcpqUbClgWpP91aEPAJWi4/db5h9QcQt18wtZ/azVZpBrMjehfigBL4OdzAJ0yt3
         KPwjZdUX1wxjcznkMqPWN/+LuZbPgGuh3C7OBBtik+Iiz2wWyH7t3qORPr/4Q7nDUD6G
         iQlDUP5bo7H7RWZKwbmCcZFT7b4OyOx+UpDOuepWkDp4uQd4yLtbTiEuJjIUa5EPYWKu
         CpwLr08ewMfLT0JcXKOmYErAntv5do2O394cCgDjAmNdPjTWzIc4UvoujMB+8eD5uKzh
         MwQ5p9gPnSTSgPxnaebV+Y/qLiE7rsqVQh11d0vj11KlCa6uA27LYlCc0zde6dBYvgkK
         J8VQ==
X-Gm-Message-State: ANhLgQ0682gKsXG1K9G7gVRqzt5B+45AP7WyUirhAAeeW6gQjRFAOPlk
        OubyM5gwMqnJXkdvzN952DCv9tBiznw1
X-Google-Smtp-Source: ADFU+vtRoRdRhiliKxgPtQ4nIIHEEpqIJquaKhign2V700OM3SZHQ9ohPI5e6M7C2XEOcvCHlU5HjgmAecY0
X-Received: by 2002:a17:90b:14cb:: with SMTP id jz11mr2036390pjb.142.1585007111026;
 Mon, 23 Mar 2020 16:45:11 -0700 (PDT)
Date:   Mon, 23 Mar 2020 16:45:01 -0700
Message-Id: <20200323234505.226919-1-rajatja@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.25.1.696.g5e7596f4ac-goog
Subject: [PATCH RESEND 1/5] input/serio/i8042: Attach fwnode to serio i8042
 kbd device
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
Change-Id: I36032f4bdee1dc52f26b57734068fd0ee7a6db0b
---
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

