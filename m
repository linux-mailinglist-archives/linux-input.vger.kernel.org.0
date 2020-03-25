Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E18511929D9
	for <lists+linux-input@lfdr.de>; Wed, 25 Mar 2020 14:34:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727636AbgCYNej (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 25 Mar 2020 09:34:39 -0400
Received: from esa2.mentor.iphmx.com ([68.232.141.98]:13527 "EHLO
        esa2.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727684AbgCYNeh (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 25 Mar 2020 09:34:37 -0400
IronPort-SDR: 7nni9Zo7tnukpIXzvDEi+pU8gYrdwiDjEPIbG+gIqbfu6jJNbjE7QJq5AYfSu1+a3MB4IH65q9
 eS5bqnfM3duUozuu6fGkPrqmzF6U1CROsoRY3dsvCGo5T7lSfFAbaRi4V8tBn/i2JCTvIwkarV
 uWGeUL7RSrE76qXkw54QMpY8GMfwj/UaNrBKjJMwV7RnzL/REbTNXrQ5MZOc1IzOzFSY/zrVq/
 h3QiBevk/wZYuAdQqEtwz0Z7xscye/29WYRFR9f0LussT0xfAR1DoXnKagvwKhxWlaMpcQwGbR
 U9I=
X-IronPort-AV: E=Sophos;i="5.72,304,1580803200"; 
   d="scan'208";a="47010605"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa2.mentor.iphmx.com with ESMTP; 25 Mar 2020 05:34:37 -0800
IronPort-SDR: cOL0SCIZN/83MrGMSeQXFfuBJ07pjr11Z+8TrlZ6C5Yr37oHxem4FGdgMAa3fWQmUUQmfpOZo5
 0euTDGfedr34YY3PEhpkxST8/jy9K0RBmkExxFY3KH1nTY0PcuhyL29a+fdmpMX+kjhCuytBkX
 z4L4LvZKL1yUBr9F0ZxVzQJzF+tsZZj30OeHjcMkwluXvULbydOEwP55O+5mH0yYghF+wHushr
 NhEN1hiB5x1K+JERI1Tk8rltps8QRn5WChXg+CmnmdlhomqaHBEbi4E9nTHy1yjf7afd/zQSDM
 6AQ=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>,
        <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <bsz@semihalf.com>, <rydberg@bitmath.org>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>,
        <jiada_wang@mentor.com>
Subject: [PATCH v9 14/55] dt-bindings: input: atmel: add suspend mode support
Date:   Wed, 25 Mar 2020 06:32:53 -0700
Message-ID: <20200325133334.19346-15-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200325133334.19346-1-jiada_wang@mentor.com>
References: <20200325133334.19346-1-jiada_wang@mentor.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add suspend mode support for atmel touchscreen driver

Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
---
 .../bindings/input/atmel,maxtouch.txt         |  6 +++++
 MAINTAINERS                                   |  1 +
 include/dt-bindings/input/atmel_mxt_ts.h      | 23 +++++++++++++++++++
 3 files changed, 30 insertions(+)
 create mode 100644 include/dt-bindings/input/atmel_mxt_ts.h

diff --git a/Documentation/devicetree/bindings/input/atmel,maxtouch.txt b/Documentation/devicetree/bindings/input/atmel,maxtouch.txt
index c88919480d37..e28139ce3cae 100644
--- a/Documentation/devicetree/bindings/input/atmel,maxtouch.txt
+++ b/Documentation/devicetree/bindings/input/atmel,maxtouch.txt
@@ -31,6 +31,12 @@ Optional properties for main touchpad device:
 
 - reset-gpios: GPIO specifier for the touchscreen's reset pin (active low)
 
+- atmel,suspend-mode: Select method used to suspend:
+    MXT_SUSPEND_DEEP_SLEEP - use T7 to suspend the device into deep sleep
+    MXT_SUSPEND_T9_CTRL - use T9.CTRL to turn off touch processing
+    MXT_SUSPEND_REGULATOR - use regulators to power down device during suspend
+    Definitions are in <dt-bindings/input/atmel_mxt_ts.h>.
+
 Example:
 
 	touch@4b {
diff --git a/MAINTAINERS b/MAINTAINERS
index e48ab79879ac..350ae664e6f0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2873,6 +2873,7 @@ T:	git git://github.com/ndyer/linux.git
 S:	Maintained
 F:	Documentation/devicetree/bindings/input/atmel,maxtouch.txt
 F:	drivers/input/touchscreen/atmel_mxt_ts.c
+F:	include/dt-bindings/input/atmel_mxt_ts.h
 
 ATMEL WIRELESS DRIVER
 M:	Simon Kelley <simon@thekelleys.org.uk>
diff --git a/include/dt-bindings/input/atmel_mxt_ts.h b/include/dt-bindings/input/atmel_mxt_ts.h
new file mode 100644
index 000000000000..41ed0f8111aa
--- /dev/null
+++ b/include/dt-bindings/input/atmel_mxt_ts.h
@@ -0,0 +1,23 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Atmel maXTouch Touchscreen driver
+ *
+ * Copyright (C) 2015 Atmel Corporation
+ * Author: Nick Dyer <nick.dyer@itdev.co.uk>
+ *
+ * This program is free software; you can redistribute  it and/or modify it
+ * under  the terms of  the GNU General  Public License as published by the
+ * Free Software Foundation;  either version 2 of the  License, or (at your
+ * option) any later version.
+ */
+
+#ifndef __DT_BINDINGS_ATMEL_MXT_TS_H
+#define __DT_BINDINGS_ATMEL_MXT_TS_H
+
+enum mxt_suspend_mode {
+	MXT_SUSPEND_DEEP_SLEEP = 0,
+	MXT_SUSPEND_T9_CTRL = 1,
+	MXT_SUSPEND_REGULATOR = 2,
+};
+
+#endif /* __DT_BINDINGS_ATMEL_MXT_TS_H */
-- 
2.17.1

