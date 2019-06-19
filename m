Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 600B24BB34
	for <lists+linux-input@lfdr.de>; Wed, 19 Jun 2019 16:20:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729993AbfFSOU3 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 19 Jun 2019 10:20:29 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:42339 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730844AbfFSOU3 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 19 Jun 2019 10:20:29 -0400
Received: by mail-wr1-f68.google.com with SMTP id x17so3582196wrl.9
        for <linux-input@vger.kernel.org>; Wed, 19 Jun 2019 07:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+cLoEI1rGhZCsgQxOO5xHLEbOwGBFQor6wshSvPnEQI=;
        b=rlGrLctm+pQE/yUjC3DA1AzqohSk3Gw7yOTlJvIql4nG0azAopbJXpJtjC+ov0r7wW
         lxdIc5jPEtuLhQQ/nRBML4W0JgFt4K3SkryTwripnKbDRZivIkEWRKyRySk468J+t1nG
         z5srWO/G9+XB115FxUygYFY8l3abJobxRQXQ/WXFmwKkVlEVoof31YmZAGo1j6PpH1If
         veEhw3KQDXl90Kq24MU2TtgQ/4wR9blQQYLkn+LyxghudD9rDRjO6vc8a0GmiwNTRWyU
         cu4L5ZDlMW0BnGn9Veq2iH+XJp6AEeDkHAlziTYVavxGzzmEhdYQuhTIax9RGZGy0gZC
         9F4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+cLoEI1rGhZCsgQxOO5xHLEbOwGBFQor6wshSvPnEQI=;
        b=F8qVPBFypOEGm5PrD1DlT71yDr4N3qe8mdVckh95Q7IVlbtG/KFdY0Qt9gQusZtTCF
         lGbYh0tb/Vhd9iCe5VmzETq1OYdX9ZGFsiZIX6G6ZDkEeF/UPIFSyRU1eRPJ/UMkiXkK
         EKvSeaOkVVSpOoPfAOHPnib6tefkXvBRbicU9BEbej14DxI+OZOIfy+Wgy8VB9ejbTMl
         TMuANKOUCW2WWXO2Wlye4Pfm1EDKWw8tFN3zBm2XglJqxLWF9/WJk8xBhtfxyJoOBtZ6
         fYP2AmVK2DvF66f8L2rdHqE/+29jzobj0sk+z4Cz80p9lRdbM0ozeAhCsTC22sd/LGmc
         PVgA==
X-Gm-Message-State: APjAAAVhYqgILB9Y4JphQweYkTyeW8due7D8fII9LdGf9NE+f00DKxzD
        LWROaQej0/J03KlJaHEyrr7NRw==
X-Google-Smtp-Source: APXvYqwdJn4A3b8T3yhYbCCJFG6mJK2lSZdeVNTEgsg3QBuy2sn2YiKC/etFxu3mS/TAN3PRsJ+/XA==
X-Received: by 2002:adf:fc4f:: with SMTP id e15mr42920656wrs.2.1560954025811;
        Wed, 19 Jun 2019 07:20:25 -0700 (PDT)
Received: from localhost.localdomain (amontpellier-652-1-281-69.w109-210.abo.wanadoo.fr. [109.210.96.69])
        by smtp.gmail.com with ESMTPSA id o20sm24209979wrh.8.2019.06.19.07.20.24
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 19 Jun 2019 07:20:25 -0700 (PDT)
From:   Fabien Parent <fparent@baylibre.com>
To:     robh+dt@kernel.org, mark.rutland@arm.com, matthias.bgg@gmail.com,
        lee.jones@linaro.org, lgirdwood@gmail.com, broonie@kernel.org
Cc:     dmitry.torokhov@gmail.com, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        Fabien Parent <fparent@baylibre.com>
Subject: [PATCH v4 7/7] arm64: dts: mt6392: Add PMIC mt6392 dtsi
Date:   Wed, 19 Jun 2019 16:20:13 +0200
Message-Id: <20190619142013.20913-8-fparent@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190619142013.20913-1-fparent@baylibre.com>
References: <20190619142013.20913-1-fparent@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add the regulator nodes for the MT6392 PMIC.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---

V4:
	* No change

V3:
	* No change

V2:
	* Use 'pmic' as node name for the pmic.
	* Use 'regulators' as node name for the regulators
	* use dash instead of underscore for regulator's node names.

---
 arch/arm64/boot/dts/mediatek/mt6392.dtsi | 208 +++++++++++++++++++++++
 1 file changed, 208 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt6392.dtsi

diff --git a/arch/arm64/boot/dts/mediatek/mt6392.dtsi b/arch/arm64/boot/dts/mediatek/mt6392.dtsi
new file mode 100644
index 000000000000..5621968c64e4
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt6392.dtsi
@@ -0,0 +1,208 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2019 MediaTek Inc.
+ */
+
+&pwrap {
+	mt6392_pmic: pmic {
+		compatible = "mediatek,mt6392", "mediatek,mt6323";
+		mediatek,system-power-controller;
+
+		regulators {
+			compatible = "mediatek,mt6392-regulator";
+
+			mt6392_vproc_reg: buck-vproc {
+				regulator-name = "buck_vproc";
+				regulator-min-microvolt = < 700000>;
+				regulator-max-microvolt = <1350000>;
+				regulator-ramp-delay = <12500>;
+				regulator-always-on;
+				regulator-boot-on;
+			};
+
+			mt6392_vsys_reg: buck-vsys {
+				regulator-name = "buck_vsys";
+				regulator-min-microvolt = <1400000>;
+				regulator-max-microvolt = <2987500>;
+				regulator-ramp-delay = <25000>;
+				regulator-always-on;
+				regulator-boot-on;
+			};
+
+			mt6392_vcore_reg: buck-vcore {
+				regulator-name = "buck_vcore";
+				regulator-min-microvolt = < 700000>;
+				regulator-max-microvolt = <1350000>;
+				regulator-ramp-delay = <12500>;
+				regulator-always-on;
+				regulator-boot-on;
+			};
+
+			mt6392_vxo22_reg: ldo-vxo22 {
+				regulator-name = "ldo_vxo22";
+				regulator-min-microvolt = <2200000>;
+				regulator-max-microvolt = <2200000>;
+				regulator-enable-ramp-delay = <110>;
+				regulator-always-on;
+				regulator-boot-on;
+			};
+
+			mt6392_vaud22_reg: ldo-vaud22 {
+				regulator-name = "ldo_vaud22";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <2200000>;
+				regulator-enable-ramp-delay = <264>;
+				regulator-always-on;
+				regulator-boot-on;
+			};
+
+			mt6392_vcama_reg: ldo-vcama {
+				regulator-name = "ldo_vcama";
+				regulator-min-microvolt = <2800000>;
+				regulator-max-microvolt = <2800000>;
+				regulator-enable-ramp-delay = <264>;
+			};
+
+			mt6392_vaud28_reg: ldo-vaud28 {
+				regulator-name = "ldo_vaud28";
+				regulator-min-microvolt = <2800000>;
+				regulator-max-microvolt = <2800000>;
+				regulator-enable-ramp-delay = <264>;
+				regulator-always-on;
+				regulator-boot-on;
+			};
+
+			mt6392_vadc18_reg: ldo-vadc18 {
+				regulator-name = "ldo_vadc18";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-enable-ramp-delay = <264>;
+				regulator-always-on;
+				regulator-boot-on;
+			};
+
+			mt6392_vcn35_reg: ldo-vcn35 {
+				regulator-name = "ldo_vcn35";
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3600000>;
+				regulator-enable-ramp-delay = <264>;
+			};
+
+			mt6392_vio28_reg: ldo-vio28 {
+				regulator-name = "ldo_vio28";
+				regulator-min-microvolt = <2800000>;
+				regulator-max-microvolt = <2800000>;
+				regulator-enable-ramp-delay = <264>;
+				regulator-always-on;
+				regulator-boot-on;
+			};
+
+			mt6392_vusb_reg: ldo-vusb {
+				regulator-name = "ldo_vusb";
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-enable-ramp-delay = <264>;
+				regulator-always-on;
+				regulator-boot-on;
+			};
+
+			mt6392_vmc_reg: ldo-vmc {
+				regulator-name = "ldo_vmc";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-enable-ramp-delay = <264>;
+				regulator-boot-on;
+			};
+
+			mt6392_vmch_reg: ldo-vmch {
+				regulator-name = "ldo_vmch";
+				regulator-min-microvolt = <3000000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-enable-ramp-delay = <264>;
+				regulator-boot-on;
+			};
+
+			mt6392_vemc3v3_reg: ldo-vemc3v3 {
+				regulator-name = "ldo_vemc3v3";
+				regulator-min-microvolt = <3000000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-enable-ramp-delay = <264>;
+				regulator-boot-on;
+			};
+
+			mt6392_vgp1_reg: ldo-vgp1 {
+				regulator-name = "ldo_vgp1";
+				regulator-min-microvolt = <1200000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-enable-ramp-delay = <264>;
+			};
+
+			mt6392_vgp2_reg: ldo-vgp2 {
+				regulator-name = "ldo_vgp2";
+				regulator-min-microvolt = <1200000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-enable-ramp-delay = <264>;
+			};
+
+			mt6392_vcn18_reg: ldo-vcn18 {
+				regulator-name = "ldo_vcn18";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-enable-ramp-delay = <264>;
+			};
+
+			mt6392_vcamaf_reg: ldo-vcamaf {
+				regulator-name = "ldo_vcamaf";
+				regulator-min-microvolt = <1200000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-enable-ramp-delay = <264>;
+			};
+
+			mt6392_vm_reg: ldo-vm {
+				regulator-name = "ldo_vm";
+				regulator-min-microvolt = <1240000>;
+				regulator-max-microvolt = <1390000>;
+				regulator-enable-ramp-delay = <264>;
+				regulator-always-on;
+				regulator-boot-on;
+			};
+
+			mt6392_vio18_reg: ldo-vio18 {
+				regulator-name = "ldo_vio18";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-enable-ramp-delay = <264>;
+				regulator-always-on;
+				regulator-boot-on;
+			};
+
+			mt6392_vcamd_reg: ldo-vcamd {
+				regulator-name = "ldo_vcamd";
+				regulator-min-microvolt = <1200000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-enable-ramp-delay = <264>;
+			};
+
+			mt6392_vcamio_reg: ldo-vcamio {
+				regulator-name = "ldo_vcamio";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-enable-ramp-delay = <264>;
+			};
+
+			mt6392_vm25_reg: ldo-vm25 {
+				regulator-name = "ldo_vm25";
+				regulator-min-microvolt = <2500000>;
+				regulator-max-microvolt = <2500000>;
+				regulator-enable-ramp-delay = <264>;
+			};
+
+			mt6392_vefuse_reg: ldo-vefuse {
+				regulator-name = "ldo_vefuse";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <2000000>;
+				regulator-enable-ramp-delay = <264>;
+			};
+		};
+	};
+};
-- 
2.20.1

