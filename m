Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 42F2F34EA3
	for <lists+linux-input@lfdr.de>; Tue,  4 Jun 2019 19:22:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726293AbfFDRWN (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 4 Jun 2019 13:22:13 -0400
Received: from mail.z3ntu.xyz ([128.199.32.197]:49678 "EHLO mail.z3ntu.xyz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726324AbfFDRWM (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 4 Jun 2019 13:22:12 -0400
Received: from localhost.localdomain (80-110-121-20.cgn.dynamic.surfer.at [80.110.121.20])
        by mail.z3ntu.xyz (Postfix) with ESMTPSA id 1AB48C637C;
        Tue,  4 Jun 2019 17:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
        t=1559668930; bh=BiJVO+igEvB/BvDV1guw1BMUA9XYdzPpn3R1VKC8Wmg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=gr/cp8Ekax3nNSNz0bYu9BJ8eO9tpM8CvlbQwKB5VZRzVNIpTf7cplSa6bXNIlcEG
         pgYfG0wmJ6UWmXgkjMEM/t4z79l/gyzQvwseGu815a2FD7la7THMd3kMg9wGRWQE/z
         WOqPbWGEd/i3o5v7M6C6qxKuwZpyg1ksnkW5MDZM=
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
        sunXi SoC support), linux-kernel@vger.kernel.org (open list),
        ~martijnbraam/pmos-upstream@lists.sr.ht
Subject: [PATCH v2 2/2] arm64: dts: allwinner: a64: Add lradc node
Date:   Tue,  4 Jun 2019 19:21:54 +0200
Message-Id: <20190604172154.25472-2-luca@z3ntu.xyz>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190604172154.25472-1-luca@z3ntu.xyz>
References: <20190604172154.25472-1-luca@z3ntu.xyz>
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
Changes since v1:
 - Use a a64 compatible with a fallback to the a83t one (the A64 also
   uses a 3/4 voltage divider, as is the case with the A83T)
 - Correct the reg property (size 0x100 => 0x400)

 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
index 8c5b521e6389..ba0ab1045e00 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
@@ -730,6 +730,14 @@
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

