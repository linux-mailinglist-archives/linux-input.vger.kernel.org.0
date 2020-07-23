Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C914722A9DE
	for <lists+linux-input@lfdr.de>; Thu, 23 Jul 2020 09:44:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727118AbgGWHnc (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 23 Jul 2020 03:43:32 -0400
Received: from inva020.nxp.com ([92.121.34.13]:37046 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726108AbgGWHnb (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 23 Jul 2020 03:43:31 -0400
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 0B1C61A0083;
        Thu, 23 Jul 2020 09:43:29 +0200 (CEST)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id F1AD71A007B;
        Thu, 23 Jul 2020 09:43:28 +0200 (CEST)
Received: from fsr-ub1864-014.ea.freescale.net (fsr-ub1864-014.ea.freescale.net [10.171.95.219])
        by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 593FB202B6;
        Thu, 23 Jul 2020 09:43:28 +0200 (CEST)
From:   =?UTF-8?q?Horia=20Geant=C4=83?= <horia.geanta@nxp.com>
To:     Herbert Xu <herbert@gondor.apana.org.au>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     "David S. Miller" <davem@davemloft.net>,
        Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>,
        Robin Gong <yibin.gong@nxp.com>,
        Anson Huang <anson.huang@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        Aymen Sghaier <aymen.sghaier@nxp.com>,
        Adam Ford <aford173@gmail.com>, linux-input@vger.kernel.org,
        linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, NXP Linux Team <linux-imx@nxp.com>
Subject: [PATCH v3 1/3] dt-bindings: crypto: fsl-sec4: add snvs clock to pwrkey
Date:   Thu, 23 Jul 2020 10:43:12 +0300
Message-Id: <20200723074314.3304-2-horia.geanta@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200723074314.3304-1-horia.geanta@nxp.com>
References: <20200723074314.3304-1-horia.geanta@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: André Draszik <git@andred.net>

On i.MX7 and i.MX8M, the SNVS requires a clock. This is similar to the
clock bound to the SNVS RTC node, but if the SNVS RTC driver isn't
enabled, then SNVS doesn't work, and as such the pwrkey driver doesn't
work (i.e. hangs the kernel, as the clock isn't enabled).

Also see commit ec2a844ef7c1
("ARM: dts: imx7s: add snvs rtc clock")
for a similar fix.

Signed-off-by: André Draszik <git@andred.net>
Acked-by: Rob Herring <robh@kernel.org>
Reviewed-by: Horia Geantă <horia.geanta@nxp.com>
Signed-off-by: Horia Geantă <horia.geanta@nxp.com>
---
 .../devicetree/bindings/crypto/fsl-sec4.txt     | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/crypto/fsl-sec4.txt b/Documentation/devicetree/bindings/crypto/fsl-sec4.txt
index 8f359f473ada..1800d57edb66 100644
--- a/Documentation/devicetree/bindings/crypto/fsl-sec4.txt
+++ b/Documentation/devicetree/bindings/crypto/fsl-sec4.txt
@@ -449,6 +449,19 @@ System ON/OFF key driver
       Value type: <phandle>
       Definition: this is phandle to the register map node.
 
+   - clocks
+      Usage: optional, required if SNVS LP requires explicit
+          enablement of clocks
+      Value type: <prop_encoded-array>
+      Definition:  a clock specifier describing the clock required for
+          enabling and disabling SNVS LP.
+
+   - clock-names
+      Usage: optional, required if SNVS LP requires explicit
+          enablement of clocks
+      Value type: <string>
+      Definition: clock name string should be "snvs-pwrkey".
+
 EXAMPLE:
 	snvs-pwrkey@020cc000 {
 		compatible = "fsl,sec-v4.0-pwrkey";
@@ -456,6 +469,8 @@ EXAMPLE:
 		interrupts = <0 4 0x4>
 	        linux,keycode = <116>; /* KEY_POWER */
 		wakeup-source;
+		clocks = <&clks IMX7D_SNVS_CLK>;
+		clock-names = "snvs-pwrkey";
 	};
 
 =====================================================================
@@ -547,6 +562,8 @@ FULL EXAMPLE
 			interrupts = <0 4 0x4>;
 			linux,keycode = <116>; /* KEY_POWER */
 			wakeup-source;
+			clocks = <&clks IMX7D_SNVS_CLK>;
+			clock-names = "snvs-pwrkey";
 		};
 	};
 
-- 
2.17.1

