Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F366B199403
	for <lists+linux-input@lfdr.de>; Tue, 31 Mar 2020 12:51:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730653AbgCaKvr (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 31 Mar 2020 06:51:47 -0400
Received: from esa4.mentor.iphmx.com ([68.232.137.252]:43515 "EHLO
        esa4.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730433AbgCaKvq (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 31 Mar 2020 06:51:46 -0400
IronPort-SDR: p2QzR4hAUB+zpiGOFSSu7k+e/bDBBKw4jDwCHzV3Enw4Z+IJaD4SaxyhPYpm6ZLLoQSClUdwKI
 EB1DZJKcCkGtiJmtNY8F9jwjxava4kzffVJ+U7nnZPLfFeZa9KK6OMUdpRgKCGaLDjH5LaHlUA
 uIgoeHAGaH8FgpL4te9dDqVvSgFhKmeSsYrGarmt3phDlLWp5aPuaNG2ZkBkEhoJ61Qd/nPLJn
 Fd3iIghDKKBXCV9MPBVAK0K+cCHTDsyICupDd06MXSzIw7OTyDaQGLkidnmbgW3RytdYd+dPI1
 hRc=
X-IronPort-AV: E=Sophos;i="5.72,327,1580803200"; 
   d="scan'208";a="47330745"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa4.mentor.iphmx.com with ESMTP; 31 Mar 2020 02:51:46 -0800
IronPort-SDR: gVE+UQkcymKqqMjufc8cPKapeWYToVqryG++rpvDxhUG5bRnobkB083brBVw0GnHIUo+Z7pqwh
 Igq90E6YG+0i+Pe7terzzZjWUK5uCWtFitbTEVGQLHw9Ddoel7Vowk5OUeYzSzd1N7w2V/mPQY
 wKdCBIDKX0mzL5By2e0uAGEdS5CrYMY38vOB/vg6S97rvSGsBH5aXNJfajj9/U0hh7cmYWJeed
 X2Zw/MPNzeekeLTgoGdzynPoj5oGGQDbPyuqHYTEz1R4h91x2rmbqPoU101HVLxQ0tQeW7hsHh
 les=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>,
        <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <bsz@semihalf.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>,
        <jiada_wang@mentor.com>
Subject: [PATCH v10 13/55] dt-bindings: input: atmel: add suspend mode support
Date:   Tue, 31 Mar 2020 03:50:09 -0700
Message-ID: <20200331105051.58896-14-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200331105051.58896-1-jiada_wang@mentor.com>
References: <20200331105051.58896-1-jiada_wang@mentor.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add suspend mode support for atmel touchscreen driver

Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
---
 .../bindings/input/atmel,maxtouch.txt         |  9 ++++++++
 MAINTAINERS                                   |  1 +
 include/dt-bindings/input/atmel_mxt_ts.h      | 23 +++++++++++++++++++
 3 files changed, 33 insertions(+)
 create mode 100644 include/dt-bindings/input/atmel_mxt_ts.h

diff --git a/Documentation/devicetree/bindings/input/atmel,maxtouch.txt b/Documentation/devicetree/bindings/input/atmel,maxtouch.txt
index c88919480d37..0307e7f7bb43 100644
--- a/Documentation/devicetree/bindings/input/atmel,maxtouch.txt
+++ b/Documentation/devicetree/bindings/input/atmel,maxtouch.txt
@@ -31,6 +31,15 @@ Optional properties for main touchpad device:
 
 - reset-gpios: GPIO specifier for the touchscreen's reset pin (active low)
 
+- atmel,suspend-mode: Select method used to suspend:
+    MXT_SUSPEND_DEEP_SLEEP - use T7 to suspend the device into deep sleep
+    MXT_SUSPEND_T9_CTRL - use T9.CTRL to turn off touch processing
+    MXT_SUSPEND_REGULATOR - use regulators to power down device during suspend
+    Definitions are in <dt-bindings/input/atmel_mxt_ts.h>.
+
+- vdd: Required supply regulator when MXT_SUSPEND_REGULATOR is used to suspend
+- avdd: Required supply regulator when MXT_SUSPEND_REGULATOR is used to suspend
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

