Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB1E72B12D0
	for <lists+linux-input@lfdr.de>; Fri, 13 Nov 2020 00:31:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726045AbgKLXba (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 12 Nov 2020 18:31:30 -0500
Received: from mout.gmx.net ([212.227.15.18]:39941 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725894AbgKLXb2 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 12 Nov 2020 18:31:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1605223871;
        bh=CdJMCH63lCU/DX0aU+Lzcr/mdjo2e/7o4vxJsSxA9oE=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
        b=Nv3EWAaYbZjvPKAKCIaH6GflQ+3K6ngd1Zv2J14+LK8P5g4eSSbELb/XrMcHG7Y/T
         pT8pl98Mf3qbVjtQR9f1YT2BZjXjOYee7ljmBV67Tj+v57TWAn3lFydFzC+vQ4fUEL
         yV9KNh3pvJqG3lfHPcF7Krzu3c82C7nn4pzFG8S0=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([37.201.214.162]) by mail.gmx.com (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MAwXr-1kS7de0w5B-00BNPG; Fri, 13
 Nov 2020 00:31:11 +0100
From:   =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To:     linux-input@vger.kernel.org
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2] ARM: dts: imx50-kobo-aura: Enable eKTF2132 touchscreen
Date:   Fri, 13 Nov 2020 00:30:54 +0100
Message-Id: <20201112233054.3837465-1-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:/2hvDUrpEcLQPLUwNRXXVjzm9d2LhtPJf6RxQ1jqI1i7wV/0+jx
 KkH4z3ivuf/pWe/BYfWfV0JC2rwyU63Xi6ZHvqgKKHdDmga4SVGsEHLqMWTmu1t6pxOvFjl
 fHiUJFYA1id7wSIwddXGUznAZ6zphYNOcffPPqHFa96Qt7wyei0EvJHNnoNiowjKoi06m3V
 s3hSPTCuyam8SqLr3DG6Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:hWiCK0EAw5k=:h7oJ9j4+CujP3BWS9O3hby
 VXbzXA2zHVXTIIy3jS7nVBDuAIwsIm7Yww+XzA+23JPznGrux2J3Qnn3pQJLD3s3scuKHw4xi
 Z0jwulyGJIcZsPUZRml6Ew/0B3dizaw/UxlhcA4Lxw/Om8RfQovgMuBChX3MEXw0C0Se8Fsgi
 5jTxoBced6/t64mBSP8kgOMPK97Z5Nane7fWDP8D/GMcOv2SW3oW3mPXY7LqR1Xe1spHOg1SI
 E1Jltm6mXEsSP91k4VJ04BFyEaQFMCiod9oPuZ3vI6CqTcYxcqDQIekFPXHR1Ui6Q4oMngXT7
 wajQCn1+9tWPlzUk5SXO1r+0MFLhRmGQAmim6SV02dqpBxWflyWsUvYWrgPet6+M0jQrxjckl
 Uhwvt7o6VL+qroa2XcV8Fka6E+aV/C2ghu90pgZ0njOgRSejQ5ol/UpmkuHf7cBmfwi2w+BVU
 9qmsIO2j50S/Pybe6HoGYdpBihqCMiuUUD32FVGl7qOeVSzsu4APaHy/IkzhVuMly3rz6ezU7
 McGIkKsj0ic2LkcmTZcWtr9BDrPNbLSorvQmZiSDGNiyoBiLIhaGL6L7pvp8nPtRKn4zGM5dv
 2XUrlwPStovQ5mXv1eufLMkLWDF3BC/mDabqbh1sjwlKPhxpX8XT+QimGSm4oGB8r5D2l1te9
 l7UMNRtMYkN0ZG9J6fqETCrucBtMIOXoSGhJWXd8pSz9tYIOKGmg6MpQ6Th48zAuFvuiv2I0K
 JWd47YOL+TmvDBkYwlYKKJV0a1x9EJdY3ekTtyiZhSKoJZSbPVZQeECxRi+tG+D0kMxoWFRxw
 3oUwRYUVpDeSYU0TDyKeLDNUbUTHoAg9tdXbA0+Kt/RueLWMyde89j+oNlE1pPaHiD8O6/EQd
 R+YNTX2LE095QfxsIcY6ZGcxByz8r+88rI6CZYWZw=
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The Kobo Aura has an eKTF2132 touchscreen controller.

Although the vendor kernel toggles a reset pin (GPIO5-12) during the
startup sequence, the touchscreen works without it.

Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
=2D--

v2:
- Fix devicetree build by adding #include <dt-bindings/interrupt-controlle=
r/irq.h>
- Drop the first two patches, which been applied in the meantime

v1:
- https://lore.kernel.org/lkml/20201106112412.390724-4-j.neuschaefer@gmx.n=
et/
=2D--
 arch/arm/boot/dts/imx50-kobo-aura.dts | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/imx50-kobo-aura.dts b/arch/arm/boot/dts/imx=
50-kobo-aura.dts
index 53b3995d37e7f..97cfd970fe742 100644
=2D-- a/arch/arm/boot/dts/imx50-kobo-aura.dts
+++ b/arch/arm/boot/dts/imx50-kobo-aura.dts
@@ -6,6 +6,7 @@
 /dts-v1/;
 #include "imx50.dtsi"
 #include <dt-bindings/input/input.h>
+#include <dt-bindings/interrupt-controller/irq.h>

 / {
 	model =3D "Kobo Aura (N514)";
@@ -119,7 +120,14 @@ &i2c1 {
 	pinctrl-0 =3D <&pinctrl_i2c1>;
 	status =3D "okay";

-	/* TODO: ektf2132 touch controller at 0x15 */
+	touchscreen@15 {
+		reg =3D <0x15>;
+		compatible =3D "elan,ektf2132";
+		pinctrl-names =3D "default";
+		pinctrl-0 =3D <&pinctrl_ts>;
+		power-gpios =3D <&gpio4 9 GPIO_ACTIVE_HIGH>;
+		interrupts-extended =3D <&gpio5 13 IRQ_TYPE_EDGE_FALLING>;
+	};
 };

 &i2c2 {
@@ -225,6 +233,13 @@ MX50_PAD_SD3_D7__ESDHC3_DAT7		0x1d4
 		>;
 	};

+	pinctrl_ts: tsgrp {
+		fsl,pins =3D <
+			MX50_PAD_CSPI_MOSI__GPIO4_9		0x0
+			MX50_PAD_SD2_D5__GPIO5_13		0x0
+		>;
+	};
+
 	pinctrl_uart2: uart2grp {
 		fsl,pins =3D <
 			MX50_PAD_UART2_TXD__UART2_TXD_MUX	0x1e4
=2D-
2.28.0

