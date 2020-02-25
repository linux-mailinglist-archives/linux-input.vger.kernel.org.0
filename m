Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ABE8516EAEA
	for <lists+linux-input@lfdr.de>; Tue, 25 Feb 2020 17:12:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730950AbgBYQMG (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 25 Feb 2020 11:12:06 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:40239 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729206AbgBYQMG (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 25 Feb 2020 11:12:06 -0500
Received: by mail-wm1-f68.google.com with SMTP id t14so3713545wmi.5;
        Tue, 25 Feb 2020 08:12:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=g6DQBCL1J6m7CoP9ENl+OA6l5n10vKz1KQp1E0CCoWY=;
        b=sRciTubcIEThZ+RT5lykhenWNNSKXJxdptKckXJNiyMWkzy+iJSlzCVPwHZQr6nWM+
         9hJVEl6NlnZ4iLv+a2bpHBABvfsJ2K//ZR8PH/Jpa9wosMRjh+KvnF1jyzsPke+0/92o
         YH9frIGUBdp5AD0+x1cTrtMfKdUru+Kn3HIDJSHPEKBMBzQybr7dAEInRIXSnIzMLL86
         oqbybIkTGK/uUH9nAHmsecbpF4HjPFY1ialbZ+EORUBx3XSjYcuZHOAEKF2K2aXor84I
         GIk7hEP0xpFPUEHz71MBS66uGPnpY9bH0JBezpjau9zwghggzGWfsLOwbhWU+pDIoW8U
         Y+QA==
X-Gm-Message-State: APjAAAVB7sHGtFBLJXfKoqXZ8sB8vHl9BOQmsdEG3Lt9bcoPIBx4cLN/
        NfM97FdD3EiD7SGOp0Y2F1VG+bXYfXw=
X-Google-Smtp-Source: APXvYqz2GddcSqaJtZUCCRWuAVNSfLkFf7wKPo8DHL8CvjqQTROqeO/fxgFpdv9+VIUsyHizZWLqZQ==
X-Received: by 2002:a05:600c:1009:: with SMTP id c9mr30312wmc.162.1582647124463;
        Tue, 25 Feb 2020 08:12:04 -0800 (PST)
Received: from 1aq-andre.garage.tyco.com ([77.107.218.170])
        by smtp.gmail.com with ESMTPSA id h10sm4757339wml.18.2020.02.25.08.12.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2020 08:12:03 -0800 (PST)
From:   =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To:     linux-kernel@vger.kernel.org
Cc:     =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>,
        Rob Herring <robh@kernel.org>,
        =?UTF-8?q?Horia=20Geant=C4=83?= <horia.geanta@nxp.com>,
        Aymen Sghaier <aymen.sghaier@nxp.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Anson Huang <Anson.Huang@nxp.com>,
        Robin Gong <yibin.gong@nxp.com>, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-input@vger.kernel.org
Subject: [PATCH v2 1/6] dt-bindings: crypto: fsl-sec4: add snvs clock to pwrkey
Date:   Tue, 25 Feb 2020 16:11:56 +0000
Message-Id: <20200225161201.1975-1-git@andred.net>
X-Mailer: git-send-email 2.23.0.rc1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On i.MX7 and i.MX8M, the SNVS requires a clock. This is similar to the
clock bound to the SNVS RTC node, but if the SNVS RTC driver isn't
enabled, then SNVS doesn't work, and as such the pwrkey driver doesn't
work (i.e. hangs the kernel, as the clock isn't enabled).

Also see commit ec2a844ef7c1
("ARM: dts: imx7s: add snvs rtc clock")
for a similar fix.

Signed-off-by: André Draszik <git@andred.net>
Acked-by: Rob Herring <robh@kernel.org>
Cc: "Horia Geantă" <horia.geanta@nxp.com>
Cc: Aymen Sghaier <aymen.sghaier@nxp.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: NXP Linux Team <linux-imx@nxp.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Anson Huang <Anson.Huang@nxp.com>
Cc: Robin Gong <yibin.gong@nxp.com>
Cc: linux-crypto@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-input@vger.kernel.org

---
v2:
* split documentation and i.MX7 dts update into two patches
* remove stray RTC references from documentation (copy/paste error)
---
 .../devicetree/bindings/crypto/fsl-sec4.txt     | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/crypto/fsl-sec4.txt b/Documentation/devicetree/bindings/crypto/fsl-sec4.txt
index 2fe245ca816a..a73722c58fab 100644
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
2.23.0.rc1

