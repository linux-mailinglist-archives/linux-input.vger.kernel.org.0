Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5EB0B14E437
	for <lists+linux-input@lfdr.de>; Thu, 30 Jan 2020 21:45:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727240AbgA3Upa (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 30 Jan 2020 15:45:30 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:35081 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727235AbgA3UpY (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 30 Jan 2020 15:45:24 -0500
Received: by mail-wr1-f65.google.com with SMTP id g17so5876781wro.2;
        Thu, 30 Jan 2020 12:45:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=c3k6VjpBHrIjrTaQQqSSGNBzkMebYDOeyw44+9Ugl28=;
        b=BZbL7AZmPKc+N/zSWqpQwIg9PS5WhatQpMDFlKj9pbvh1MPpjOzOeI35auwFWimMqh
         km4io1AwxZ0BGwZ/sZx8gu71qjj5Igb22xaJssDy84Md3aEEvrtYvFwAigu/HxlMKRIK
         TeTXehQbW9+Q6atDHlk9F8j4lPLd4eu/yECKzOH2VGtcDnuh0lheQCUUQf1saD6y6Q8b
         esaHUs7CkrnsPownPc9EcXKcVZ3UhyqpXZnJdQc9yM2oD7BrwZfUXHOsJ8paXMXsz3xT
         wwx/FJlcFJWRoWlDS8y4mLzbAMLr+eJy7Q6aaxmFFXdMX0PBSa5OiDYv6c9Iozpwe5VW
         YQBw==
X-Gm-Message-State: APjAAAXWrWJkmhZfr3jbMlQhKWGLdF1kG0tpJ1WXTuQz0Bn/Cuq40ktE
        2j+frSH3YR0dvZDXXETJBApdGbU/R2I=
X-Google-Smtp-Source: APXvYqzufaKIH2yFtJKt/PAlyEiLYKiQxZwNEqm75p8FMQ5XDYt4a/jHjsFBr4WM0QP6oZC70qK17A==
X-Received: by 2002:a05:6000:8c:: with SMTP id m12mr1285707wrx.142.1580417120933;
        Thu, 30 Jan 2020 12:45:20 -0800 (PST)
Received: from 1aq-andre.garage.tyco.com ([77.107.218.170])
        by smtp.gmail.com with ESMTPSA id x7sm8874885wrq.41.2020.01.30.12.45.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2020 12:45:20 -0800 (PST)
From:   =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To:     linux-kernel@vger.kernel.org
Cc:     =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>,
        Anson Huang <Anson.Huang@nxp.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        =?UTF-8?q?Horia=20Geant=C4=83?= <horia.geanta@nxp.com>,
        Aymen Sghaier <aymen.sghaier@nxp.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
        linux-input@vger.kernel.org
Subject: [PATCH 1/3] ARM: dts: imx7s: add snvs clock to pwrkey
Date:   Thu, 30 Jan 2020 20:45:14 +0000
Message-Id: <20200130204516.4760-1-git@andred.net>
X-Mailer: git-send-email 2.23.0.rc1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On i.MX7, the SNVS requires a clock. This is similar to the clock
bound to the SNVS RTC node, but if the SNVS RTC driver isn't enabled,
then SNVS doesn't work, and as such the pwrkey driver doesn't
work (i.e. hangs the kernel, as the clock isn't enabled).

Also see commit ec2a844ef7c1
("ARM: dts: imx7s: add snvs rtc clock")
for a similar fix.

Signed-off-by: André Draszik <git@andred.net>
Cc: Anson Huang <Anson.Huang@nxp.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: "Horia Geantă" <horia.geanta@nxp.com>
Cc: Aymen Sghaier <aymen.sghaier@nxp.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: linux-crypto@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-input@vger.kernel.org
---
 .../devicetree/bindings/crypto/fsl-sec4.txt     | 17 +++++++++++++++++
 arch/arm/boot/dts/imx7s.dtsi                    |  2 ++
 2 files changed, 19 insertions(+)

diff --git a/Documentation/devicetree/bindings/crypto/fsl-sec4.txt b/Documentation/devicetree/bindings/crypto/fsl-sec4.txt
index 2fe245ca816a..755c2838d658 100644
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
+          enabling and disabling SNVS LP RTC.
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
 
diff --git a/arch/arm/boot/dts/imx7s.dtsi b/arch/arm/boot/dts/imx7s.dtsi
index 1b812f4e7453..6240a6f58048 100644
--- a/arch/arm/boot/dts/imx7s.dtsi
+++ b/arch/arm/boot/dts/imx7s.dtsi
@@ -614,6 +614,8 @@
 					linux,keycode = <KEY_POWER>;
 					wakeup-source;
 					status = "disabled";
+					clocks = <&clks IMX7D_SNVS_CLK>;
+					clock-names = "snvs-pwrkey";
 				};
 			};
 
-- 
2.23.0.rc1

