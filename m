Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3E98861E810
	for <lists+linux-input@lfdr.de>; Mon,  7 Nov 2022 01:56:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230162AbiKGA4V (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 6 Nov 2022 19:56:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230185AbiKGA4U (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 6 Nov 2022 19:56:20 -0500
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id ED0B4CE1D;
        Sun,  6 Nov 2022 16:56:18 -0800 (PST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CE43323A;
        Sun,  6 Nov 2022 16:56:24 -0800 (PST)
Received: from slackpad.fritz.box (unknown [172.31.20.19])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3D1503F703;
        Sun,  6 Nov 2022 16:56:16 -0800 (PST)
From:   Andre Przywara <andre.przywara@arm.com>
To:     Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>,
        Icenowy Zheng <uwu@icenowy.me>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        Hans de Goede <hdegoede@redhat.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
Subject: [PATCH v2 07/10] ARM: dts: suniv: f1c100s: add LRADC node
Date:   Mon,  7 Nov 2022 00:54:30 +0000
Message-Id: <20221107005433.11079-8-andre.przywara@arm.com>
X-Mailer: git-send-email 2.35.5
In-Reply-To: <20221107005433.11079-1-andre.przywara@arm.com>
References: <20221107005433.11079-1-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The Allwinner F1C100s series of SoCs contain a LRADC (aka. KEYADC)
compatible to the version in other SoCs.
The manual doesn't mention the ratio of the input voltage that is used,
but comparing actual measurements with the values in the register
suggests that it is 3/4 of Vref.

Add the DT node describing the base address and interrupt. As in the
older SoCs, there is no explicit reset or clock gate, also there is a
dedicated, non-multiplexed pin, so need for more properties.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 arch/arm/boot/dts/suniv-f1c100s.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/suniv-f1c100s.dtsi b/arch/arm/boot/dts/suniv-f1c100s.dtsi
index c04cd175f743..111f8bbc2a80 100644
--- a/arch/arm/boot/dts/suniv-f1c100s.dtsi
+++ b/arch/arm/boot/dts/suniv-f1c100s.dtsi
@@ -280,6 +280,14 @@ ir: ir@1c22c00 {
 			status = "disabled";
 		};
 
+		lradc: lradc@1c23400 {
+			compatible = "allwinner,suniv-f1c100s-lradc",
+				     "allwinner,sun8i-a83t-r-lradc";
+			reg = <0x01c23400 0x400>;
+			interrupts = <22>;
+			status = "disabled";
+		};
+
 		uart0: serial@1c25000 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0x01c25000 0x400>;
-- 
2.35.5

