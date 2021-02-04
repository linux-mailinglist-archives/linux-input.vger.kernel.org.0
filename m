Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F88C30F362
	for <lists+linux-input@lfdr.de>; Thu,  4 Feb 2021 13:49:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236140AbhBDMqT (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 4 Feb 2021 07:46:19 -0500
Received: from mail.ilitek.com.tw ([60.248.80.92]:36971 "EHLO cello.ilitek.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S235482AbhBDMqS (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 4 Feb 2021 07:46:18 -0500
X-UUID: 406d05822e91449493e7e87d6d945ef8-20210204
X-UUID: 406d05822e91449493e7e87d6d945ef8-20210204
Received: from ex2.ili.com.tw [(192.168.1.132)] by cello.ilitek.com
        (envelope-from <joe_hung@ilitek.com>)
        (Cellopoint E-mail Firewall v4.1.12 Build 0701 with TLSv1.2 ECDHE-RSA-AES128-GCM-SHA256 128/128)
        with ESMTP id 246381420; Thu, 04 Feb 2021 20:38:58 +0800
Received: from EX1.ili.com.tw (192.168.1.131) by EX2.ili.com.tw
 (192.168.1.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Thu, 4 Feb 2021
 20:38:57 +0800
Received: from joehung-Ilitek.ili.com.tw (192.168.18.73) by EX1.ili.com.tw
 (192.168.1.133) with Microsoft SMTP Server id 15.1.2176.2 via Frontend
 Transport; Thu, 4 Feb 2021 20:38:57 +0800
From:   Joe Hung <joe_hung@ilitek.com>
To:     <dmitry.torokhov@gmail.com>, <robh+dt@kernel.org>,
        <devicetree@vger.kernel.org>
CC:     <linux-input@vger.kernel.org>, <joe_hung@ilitek.com>,
        <luca_hsu@ilitek.com>
Subject: [RESEND PATCH 1/2] dt-bindings: input: touchscreen: ilitek_ts_i2c: Add bindings
Date:   Thu, 4 Feb 2021 20:39:01 +0800
Message-ID: <20210204123902.18813-1-joe_hung@ilitek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add binding documentation for ILITEK touch devices.

Signed-off-by: Joe Hung <joe_hung@ilitek.com>
---
 .../input/touchscreen/ilitek_ts_i2c.txt       | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/ilitek_ts_i2c.txt

diff --git a/Documentation/devicetree/bindings/input/touchscreen/ilitek_ts_i2c.txt b/Documentation/devicetree/bindings/input/touchscreen/ilitek_ts_i2c.txt
new file mode 100644
index 000000000000..eb90d3bd7ee7
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/touchscreen/ilitek_ts_i2c.txt
@@ -0,0 +1,23 @@
+Ilitek I2C 23XX/25XX/Lego Series Touch ICs
+
+Required properties:
+- compatible		: Must be equal to one of following:
+			  "ilitek,ili2520"
+			  "ilitek,ili2510"
+- reg			: I2C slave address for touch device.
+- reset-gpios		: GPIO output high to reset pin of touch device.
+- irq-gpios		: GPIO as active low input from touch irq pin.
+
+Example:
+	&i2c1 {
+		/* ... */
+
+		touchscreen@41 {
+			compatible = "ilitek,ili2520";
+			reg = <0x41>;
+			irq-gpios = <&gpio1 13 0>;
+			reset-gpios = <&gpio1 14 GPIO_ACTIVE_HIGH>;
+		};
+
+		/* ... */
+	};
-- 
2.25.1


