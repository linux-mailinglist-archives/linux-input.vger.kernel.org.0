Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E112C206EBA
	for <lists+linux-input@lfdr.de>; Wed, 24 Jun 2020 10:11:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389629AbgFXILs (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 24 Jun 2020 04:11:48 -0400
Received: from ms-10.1blu.de ([178.254.4.101]:33312 "EHLO ms-10.1blu.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388818AbgFXILs (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 24 Jun 2020 04:11:48 -0400
Received: from [78.43.71.214] (helo=marius.fritz.box)
        by ms-10.1blu.de with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <mail@mariuszachmann.de>)
        id 1jnzjy-0000VK-4y; Wed, 24 Jun 2020 09:22:38 +0200
From:   Marius Zachmann <mail@mariuszachmann.de>
To:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Marius Zachmann <mail@mariuszachmann.de>,
        linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject: [PATCH v4 2/3] hwmon: add Documentation
Date:   Wed, 24 Jun 2020 09:21:53 +0200
Message-Id: <20200624072154.22486-3-mail@mariuszachmann.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200624072154.22486-1-mail@mariuszachmann.de>
References: <20200624072154.22486-1-mail@mariuszachmann.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Con-Id: 241080
X-Con-U: 0-mail
X-Originating-IP: 78.43.71.214
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Signed-off-by: Marius Zachmann <mail@mariuszachmann.de>
---
 Documentation/hwmon/corsair-cpro.rst | 40 ++++++++++++++++++++++++++++
 Documentation/hwmon/index.rst        |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 Documentation/hwmon/corsair-cpro.rst

diff --git a/Documentation/hwmon/corsair-cpro.rst b/Documentation/hwmon/corsair-cpro.rst
new file mode 100644
index 000000000000..2383c6f72115
--- /dev/null
+++ b/Documentation/hwmon/corsair-cpro.rst
@@ -0,0 +1,40 @@
+.. SPDX-License-Identifier: GPL-2.0-or-later
+
+Kernel driver corsair-cpro
+==========================
+
+Supported devices:
+
+  * Corsair Commander Pro
+  * Corsair Commander Pro (1000D)
+
+Author: Marius Zachmann
+
+Description
+-----------
+
+This driver implements the sysfs interface for the Corsair Commander Pro.
+The Corsair Commander Pro is a USB device with 6 fan connectors,
+4 temperature sensor connectors and 2 Corsair LED connectors.
+It can read the voltage levels on the SATA power connector.
+
+Usage Notes
+-----------
+
+Since it is a USB device, hotswapping is possible. The device is autodetected.
+
+Sysfs entries
+-------------
+
+======================= =====================================================================
+in0_input		Voltage on SATA 12v
+in1_input		Voltage on SATA 5v
+in2_input		Voltage on SATA 3.3v
+temp[1-4]_input		Temperature on connected temperature sensors
+temp[1-4] label		Shows "nc" after name, when not connected
+fan[1-6]_input		Connected fan rpm.
+fan[1-6]_label		Shows connection status of the fan as detected by the device.
+pwm[1-6]		Sets the fan speed. Values from 0-255.
+			When reading, it reports the last value if it was set by the driver.
+			Otherwise returns 0.
+======================= =====================================================================
diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
index 55ff4b7c5349..750d3a975d82 100644
--- a/Documentation/hwmon/index.rst
+++ b/Documentation/hwmon/index.rst
@@ -47,6 +47,7 @@ Hardware Monitoring Kernel Drivers
    bel-pfe
    bt1-pvt
    coretemp
+   corsair-cpro
    da9052
    da9055
    dell-smm-hwmon
-- 
2.27.0

