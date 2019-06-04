Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0829934AF4
	for <lists+linux-input@lfdr.de>; Tue,  4 Jun 2019 16:51:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727616AbfFDOvp (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 4 Jun 2019 10:51:45 -0400
Received: from mail.z3ntu.xyz ([128.199.32.197]:46820 "EHLO mail.z3ntu.xyz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727422AbfFDOvp (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 4 Jun 2019 10:51:45 -0400
X-Greylist: delayed 428 seconds by postgrey-1.27 at vger.kernel.org; Tue, 04 Jun 2019 10:51:44 EDT
Received: from localhost.localdomain (80-110-121-20.cgn.dynamic.surfer.at [80.110.121.20])
        by mail.z3ntu.xyz (Postfix) with ESMTPSA id 372D2C62C0;
        Tue,  4 Jun 2019 14:44:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
        t=1559659474; bh=f8oeSATHDBbxU/b+96ktGMMjGmkACkAmrJx1PQ0GIvY=;
        h=From:To:Cc:Subject:Date;
        b=OMw0svqmPt8cRVBV0t9Vg2B8scLiG7zlIevdrdAR8Q0aL0d7WiyPVszoaOUMhqjF1
         pz6z7tJ45Gq2h9cGT2kw0NE6VRbrFieY/vJHYFe36KQsZ/O63AVDpkGb3tOMO5lQgr
         gI+Sy/JdoiR8w15j9Kf/UqFHRrtSFO4xT4jxhoRI=
From:   Luca Weiss <luca@z3ntu.xyz>
Cc:     Luca Weiss <luca@z3ntu.xyz>, Hans de Goede <hdegoede@redhat.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>,
        linux-input@vger.kernel.org (open list:SUN4I LOW RES ADC ATTACHED
        TABLET KEYS DRIVER),
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS),
        linux-arm-kernel@lists.infradead.org (moderated list:ARM/Allwinner
        sunXi SoC support), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] arm64: dts: allwinner: a64: Add lradc node
Date:   Tue,  4 Jun 2019 16:42:53 +0200
Message-Id: <20190604144252.26965-1-luca@z3ntu.xyz>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add a node describing the KEYADC on the A64.

Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
---
 .../devicetree/bindings/input/sun4i-lradc-keys.txt        | 1 +
 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi             | 8 ++++++++
 2 files changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/sun4i-lradc-keys.txt b/Documentation/devicetree/bindings/input/sun4i-lradc-keys.txt
index 496125c6bfb7..507b737612ea 100644
--- a/Documentation/devicetree/bindings/input/sun4i-lradc-keys.txt
+++ b/Documentation/devicetree/bindings/input/sun4i-lradc-keys.txt
@@ -5,6 +5,7 @@ Required properties:
  - compatible: should be one of the following string:
 		"allwinner,sun4i-a10-lradc-keys"
 		"allwinner,sun8i-a83t-r-lradc"
+		"allwinner,sun50i-a64-lradc", "allwinner,sun8i-a83t-r-lradc"
  - reg: mmio address range of the chip
  - interrupts: interrupt to which the chip is connected
  - vref-supply: powersupply for the lradc reference voltage
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
index 7734f70e1057..3a42352b5c9f 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
@@ -704,6 +704,14 @@
 			status = "disabled";
 		};
 
+		lradc: lradc@1c21800 {
+			compatible = "allwinner,sun50i-a64-lradc",
+				     "allwinner,sun8i-a83t-r-lradc";
+			reg = <0x01c21800 0x400>;
+			interrupts = <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
 		i2s0: i2s@1c22000 {
 			#sound-dai-cells = <0>;
 			compatible = "allwinner,sun50i-a64-i2s",
-- 
2.21.0

