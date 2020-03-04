Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BC5F81793D0
	for <lists+linux-input@lfdr.de>; Wed,  4 Mar 2020 16:44:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727804AbgCDPoO (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 4 Mar 2020 10:44:14 -0500
Received: from relmlor1.renesas.com ([210.160.252.171]:42611 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726561AbgCDPoO (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 4 Mar 2020 10:44:14 -0500
X-IronPort-AV: E=Sophos;i="5.70,514,1574089200"; 
   d="scan'208";a="40971363"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 05 Mar 2020 00:44:12 +0900
Received: from marian-VirtualBox.ree.adwin.renesas.com (unknown [10.226.36.164])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id CFEAD400A6CD;
        Thu,  5 Mar 2020 00:44:10 +0900 (JST)
From:   Marian-Cristian Rotariu 
        <marian-cristian.rotariu.rb@bp.renesas.com>
To:     geert@linux-m68k.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Chris Paterson <chris.paterson2@renesas.com>,
        prabhakar.mahadev-lad.rj@bp.renesas.com, dmitry.torokhov@gmail.com,
        linux-input@vger.kernel.org, robh+dt@kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v2] ARM: dts: iwg22d-sodimm: Enable touchscreen
Date:   Wed,  4 Mar 2020 15:44:10 +0000
Message-Id: <1583336650-25848-1-git-send-email-marian-cristian.rotariu.rb@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

In one of the iWave-G22D development board variants, called Generic SODIMM
Development Platform, we have an LCD with touchscreen. The resistive touch
controller, STMPE811 is on the development board and is connected through
the i2c5 of the RZ-G1E.

Additionally, this controller should generate an interrupt to the CPU and
it is connected through GPIO4,4 to the GIC.

Touch was tested with one of our iW-RainboW-G22D-SODIMM RZ/G1E development
platforms.

More details on the iWave website:
https://www.iwavesystems.com/rz-g1e-sodimm-development-kit.html

Changes from v1:
 -remove redundant GPIO code
 -remove obsolete and unused properties
 -sync property values with the comments & the bindings

Signed-off-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
---
 arch/arm/boot/dts/r8a7745-iwg22d-sodimm.dts | 33 +++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/arm/boot/dts/r8a7745-iwg22d-sodimm.dts b/arch/arm/boot/dts/r8a7745-iwg22d-sodimm.dts
index 872f8a6..ab38b39 100644
--- a/arch/arm/boot/dts/r8a7745-iwg22d-sodimm.dts
+++ b/arch/arm/boot/dts/r8a7745-iwg22d-sodimm.dts
@@ -172,6 +172,39 @@
 	status = "okay";
 	clock-frequency = <400000>;
 
+	stmpe811@44 {
+		compatible = "st,stmpe811";
+		reg = <0x44>;
+		interrupt-parent = <&gpio4>;
+		interrupts = <4 IRQ_TYPE_LEVEL_LOW>;
+
+		/* 3.25 MHz ADC clock speed */
+		st,adc-freq = <1>;
+		/* ADC converstion time: 80 clocks */
+		st,sample-time = <4>;
+		/* 12-bit ADC */
+		st,mod-12b = <1>;
+		/* internal ADC reference */
+		st,ref-sel = <0>;
+
+		stmpe_touchscreen {
+			compatible = "st,stmpe-ts";
+			/* 8 sample average control */
+			st,ave-ctrl = <3>;
+			/* 7 length fractional part in z */
+			st,fraction-z = <7>;
+			/*
+			 * 50 mA typical 80 mA max touchscreen drivers
+			 * current limit value
+			 */
+			st,i-drive = <1>;
+			/* 1 ms panel driver settling time */
+			st,settling = <3>;
+			/* 5 ms touch detect interrupt delay */
+			st,touch-det-delay = <5>;
+		};
+	};
+
 	sgtl5000: codec@a {
 		compatible = "fsl,sgtl5000";
 		#sound-dai-cells = <0>;
-- 
2.7.4

