Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D2042B18FE
	for <lists+linux-input@lfdr.de>; Fri, 13 Nov 2020 11:24:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726431AbgKMKYj (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 13 Nov 2020 05:24:39 -0500
Received: from gw.zinitix.com ([211.115.80.188]:57486 "EHLO zinitix.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726176AbgKMKYj (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 13 Nov 2020 05:24:39 -0500
rtoaddr: linux-input@vger.kernel.org
Received: (qmail 2005387 invoked by uid 11001); 13 Nov 2020 19:24:37 +0900
Hanbiro-auth: kdson@zinitix.com
Hanbiro-rcptto: devicetree-spec@vger.kernel.org|linux-input@vger.kernel.org|dmitry.torokhov@gmail.com|kdson@zinitix.com
Hanbiro-remoteip: 127.0.0.1
Hanbiro-Virus: None
Hanbiro-rbl: None
HBSender: kdson@zinitix.com
Received: from unknown (HELO zinitix-H370AORUSGAMING3) (kdson@211.238.111.254)
        by 0 (qmail 1.03 + ejcp v14 + HB patch) with SMTP;
        13 Nov 2020 19:24:37 +0900
Date:   Fri, 13 Nov 2020 19:24:36 +0900
From:   KwangDeok Son <kdson@zinitix.com>
To:     devicetree-spec@vger.kernel.org
Cc:     linux-input@vger.kernel.org, dmitry.torokhov@gmail.com,
        kdson@zinitix.com
Subject: [PATCH] dt-bindings: input: Document the Zinitix Touchpad bindigns.
Message-ID: <20201113192436.54e2f2a6@zinitix-H370AORUSGAMING3>
Organization: Zinitix
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add DT bindings documentation for Zinitix I2C Touchpad.

Signed-off-by: KwangDeok Son <kdson@zinitix.com>

---
diff --git a/Documentation/devicetree/bindings/input/zinitix-touchpad.txt b/Documentation/devicetree/bindings/input/zinitix-touchpad.txt
index e69de29bb2d1..29a3fe9b58cb 100644
--- a/Documentation/devicetree/bindings/input/zinitix-touchpad.txt
+++ b/Documentation/devicetree/bindings/input/zinitix-touchpad.txt
@@ -0,0 +1,28 @@
+Zinitix I2C Touchpad
+
+
+Required properties:
+- compatible: must be "zinitix,zntxtp".
+- reg: I2C address of the chip.
+- interrupts: interrupt to which the chip is connected (see interrupt
+  binding[0]).
+
+
+Optional properties:
+- wakeup-source: touchpad can be used as a wakeup source.
+- vcc-supply: a phandle for the regulator supplying 2.7V to 3.6V power.
+
+[0]: Documentation/devicetree/bindings/interrupt-controller/interrupts.txt
+[1]: Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
+
+
+Example:
+	&i2c0 {
+		touchpad@40 {
+			compatible = "zinitix,zntxtp";
+			reg = <0x40>;
+			interrupt-parent = <&gpio>;
+			interrupts = <0 IRQ_TYPE_EDGE_FALLING>;
+			wakeup-source;
+		};
+	};



