Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0462927AA7B
	for <lists+linux-input@lfdr.de>; Mon, 28 Sep 2020 11:14:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726558AbgI1JN4 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 28 Sep 2020 05:13:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726380AbgI1JNz (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 28 Sep 2020 05:13:55 -0400
Received: from mxa1.seznam.cz (mxa1.seznam.cz [IPv6:2a02:598:a::78:90])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27B75C061755;
        Mon, 28 Sep 2020 02:13:55 -0700 (PDT)
Received: from email.seznam.cz
        by email-smtpc12b.ko.seznam.cz (email-smtpc12b.ko.seznam.cz [10.53.14.105])
        id 1bae5d8340a009ea1a0791dd;
        Mon, 28 Sep 2020 11:13:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seznam.cz; s=beta;
        t=1601284409; bh=CJzcc3M4KgzZeL8m6J4oAfeKTOqthX9A0aq72URLsjc=;
        h=Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:
         References:MIME-Version:Content-Transfer-Encoding;
        b=kL/irxniBOgGHcIRYQCRIQ/2Y2CRSRiP5e/9G9vzal3iN4d1MbACxE3DGg4gcarhi
         qjJzYCjKHkbpWfoxJiQYB1Cg0XU+3Eg1iEJJAwpppXmwKqt46KlTS60MbvQfvArarl
         +K2p9g5PoxUu6dBx0B8Athn6qQzBBv504lueq9b8=
Received: from localhost.localdomain (ip-228-128.dynamic.ccinternet.cz [212.69.128.228])
        by email-relay27.ko.seznam.cz (Seznam SMTPD 1.3.120) with ESMTP;
        Mon, 28 Sep 2020 11:13:26 +0200 (CEST)  
From:   michael.srba@seznam.cz
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Henrik Rydberg <rydberg@bitmath.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Paul Burton <paulburton@kernel.org>,
        Heiko Stuebner <heiko.stuebner@theobroma-systems.com>,
        Lubomir Rintel <lkundrak@v3.sk>,
        Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Michael Srba <Michael.Srba@seznam.cz>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v5 2/2] dt-bindings: input/touchscreen: add bindings for zinitix
Date:   Mon, 28 Sep 2020 11:10:17 +0200
Message-Id: <20200928091017.6614-2-michael.srba@seznam.cz>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200928091017.6614-1-michael.srba@seznam.cz>
References: <20200928091017.6614-1-michael.srba@seznam.cz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Michael Srba <Michael.Srba@seznam.cz>

This patch adds dts bindings for the zinitix bt541 touchscreen.

Signed-off-by: Michael Srba <Michael.Srba@seznam.cz>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 changes in v2: none
 changes in v3: document zinitix,mode property
 changes in v4: none
 changes in v5: none


 .../bindings/input/touchscreen/zinitix.txt    | 40 +++++++++++++++++++
 .../devicetree/bindings/vendor-prefixes.yaml  |  2 +
 2 files changed, 42 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/zinitix.txt

diff --git a/Documentation/devicetree/bindings/input/touchscreen/zinitix.txt b/Documentation/devicetree/bindings/input/touchscreen/zinitix.txt
new file mode 100644
index 000000000000..446efb9f5f55
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/touchscreen/zinitix.txt
@@ -0,0 +1,40 @@
+Device tree bindings for Zinitx BT541 touchscreen controller
+
+Required properties:
+
+ - compatible		: Should be "zinitix,bt541"
+ - reg			: I2C address of the chip. Should be 0x20
+ - interrupts		: Interrupt to which the chip is connected
+
+Optional properties:
+
+ - vdd-supply		: Analog power supply regulator on VCCA pin
+ - vddo-supply		: Digital power supply regulator on VDD pin
+ - zinitix,mode		: Mode of reporting touch points. Some modes may not work
+			  with a particular ts firmware for unknown reasons. Available
+			  modes are 1 and 2. Mode 2 is the default and preferred.
+
+The touchscreen-* properties are documented in touchscreen.txt in this
+directory.
+
+Example:
+
+	i2c@00000000 {
+		/* ... */
+
+		bt541@20 {
+			compatible = "zinitix,bt541";
+			reg = <0x20>;
+			interrupt-parent = <&msmgpio>;
+			interrupts = <13 IRQ_TYPE_EDGE_FALLING>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&tsp_default>;
+			vdd-supply = <&reg_vdd_tsp>;
+			vddo-supply = <&pm8916_l6>;
+			touchscreen-size-x = <540>;
+			touchscreen-size-y = <960>;
+			zinitix,mode = <2>;
+		};
+
+		/* ... */
+	};
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 967e78c5ec0a..1b0b5e23267d 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1066,6 +1066,8 @@ patternProperties:
     description: Shenzhen Zidoo Technology Co., Ltd.
   "^zii,.*":
     description: Zodiac Inflight Innovations
+  "^zinitix,.*":
+    description: Zinitix Co., Ltd
   "^zte,.*":
     description: ZTE Corp.
   "^zyxel,.*":
-- 
2.24.0
