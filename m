Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CE1864BB2F
	for <lists+linux-input@lfdr.de>; Wed, 19 Jun 2019 16:20:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726330AbfFSOUU (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 19 Jun 2019 10:20:20 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:40261 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728671AbfFSOUU (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 19 Jun 2019 10:20:20 -0400
Received: by mail-wm1-f67.google.com with SMTP id v19so2047581wmj.5
        for <linux-input@vger.kernel.org>; Wed, 19 Jun 2019 07:20:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Hv7ZvPZLzbUiYKzhVJVhDN03cgoBQvQ1P83x7kmqqJ8=;
        b=eYmRx+bKnD598q4hqdSi0PiIUrmAzqgGVk2K3pRGvtiy+dhRjaB4BHPUsgQsGnuvWM
         AxkiWg3izNaKbGLuH3VqxYY9TH0qI+U+mpXEHlf3Xc6Fnmq/e/zoC0MjASR5dDfCJ6qK
         Ut+Oh4Sc6wjJQo0Uw6+4sPCYj3vyCJjPH9Rx9trMk5aNaWe3imhPVNQNBDPOoIRw/7Gi
         CYY6yrw4dLOmdP/Nf92GgsNmJQdeqB1w9v3xsn8r+gzlYqUgf5lITHtNKGbEhhRZNIXB
         dwELjvWP++c96kRlY5DzkAqbbQJwr/ucAqbRSTnuuiA0Ae0sH6y4XxWJ42C2a4jlWFAk
         367w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Hv7ZvPZLzbUiYKzhVJVhDN03cgoBQvQ1P83x7kmqqJ8=;
        b=MomFBAXT4KDmo2hkdeDCXKjl2SPwp1bZWdOYjF2iVOuVDJCwGbj0mJKW8dIrpTaOsn
         7m6x83uPg1YgD+xXHvBk1oxJQBmYvOq152lTpaKMYF7SS8zGjOlxQI54Gxw+wwKIuS7/
         JnXp9SRcRgIQja7rCSvNdoq/balBRhfa+bD89jhTE61q4JnxPeNMGTqJPdUAZXT1BVqj
         F6dVuqhSg0qF6vsYmy7GqhhMn/n49Hf55JZHuK4A7sQVoe+5O9vVL2VF8NfPZqp/QSBu
         zPh/s9DxhBMI4AjwEV/CsTVAlJ5wHb5XiFNf9TvY1EQjA7aKSaDiod9R9JxCH/VTCBRn
         zO2Q==
X-Gm-Message-State: APjAAAU1nRJz1vD3FYI36BiZNts6vMUD8vw0WbRGWyFUNZsw8hNfBoxn
        HstZbRbN4vjavRpuG7YaC7LxyA==
X-Google-Smtp-Source: APXvYqycDpy+mhEb93slqG8ihTC/TRXZlI+GDOjc7RwZpphQm68sYJiL/3RQGqxXnadbjDxsHSk4uA==
X-Received: by 2002:a1c:751a:: with SMTP id o26mr8531174wmc.13.1560954018908;
        Wed, 19 Jun 2019 07:20:18 -0700 (PDT)
Received: from localhost.localdomain (amontpellier-652-1-281-69.w109-210.abo.wanadoo.fr. [109.210.96.69])
        by smtp.gmail.com with ESMTPSA id o20sm24209979wrh.8.2019.06.19.07.20.17
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 19 Jun 2019 07:20:18 -0700 (PDT)
From:   Fabien Parent <fparent@baylibre.com>
To:     robh+dt@kernel.org, mark.rutland@arm.com, matthias.bgg@gmail.com,
        lee.jones@linaro.org, lgirdwood@gmail.com, broonie@kernel.org
Cc:     dmitry.torokhov@gmail.com, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        Fabien Parent <fparent@baylibre.com>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v4 1/7] dt-bindings: regulator: add support for MT6392
Date:   Wed, 19 Jun 2019 16:20:07 +0200
Message-Id: <20190619142013.20913-2-fparent@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190619142013.20913-1-fparent@baylibre.com>
References: <20190619142013.20913-1-fparent@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add binding documentation of the regulator for MT6392 SoCs.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---

v4:
	* No change

v3:
	* No change

v2:
	* Use 'pmic' as node name for the pmic.
	* Use 'regulators' as node name for the regulators
	* use dash instead of underscore for regulator's node names.

---
 .../bindings/regulator/mt6392-regulator.txt   | 220 ++++++++++++++++++
 1 file changed, 220 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/mt6392-regulator.txt

diff --git a/Documentation/devicetree/bindings/regulator/mt6392-regulator.txt b/Documentation/devicetree/bindings/regulator/mt6392-regulator.txt
new file mode 100644
index 000000000000..d03c0707fabc
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/mt6392-regulator.txt
@@ -0,0 +1,220 @@
+Mediatek MT6392 Regulator
+
+Required properties:
+- compatible: "mediatek,mt6392-regulator"
+- mt6392regulator: List of regulators provided by this controller. It is named
+  according to its regulator type, buck_<name> and ldo_<name>.
+  The definition for each of these nodes is defined using the standard binding
+  for regulators at Documentation/devicetree/bindings/regulator/regulator.txt.
+
+The valid names for regulators are::
+BUCK:
+  buck_vproc, buck_vsys, buck_vcore
+LDO:
+  ldo_vxo22, ldo_vaud22, ldo_vcama, ldo_vaud28, ldo_vadc18, ldo_vcn35,
+  ldo_vio28. ldo_vusb, ldo_vmc, ldo_vmch, ldo_vemc3v3, ldo_vgp1, ldo_vgp2,
+  ldo_vcn18, ldo_vcamaf, ldo_vm, ldo_vio18, ldo_vcamd, ldo_vcamio, ldo_vm25,
+  ldo_vefuse
+
+Example:
+	pmic {
+		compatible = "mediatek,mt6392", "mediatek,mt6323";
+		mediatek,system-power-controller;
+
+		regulator {
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
-- 
2.20.1

