Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4FD472A952C
	for <lists+linux-input@lfdr.de>; Fri,  6 Nov 2020 12:25:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727173AbgKFLZC (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 6 Nov 2020 06:25:02 -0500
Received: from mout.gmx.net ([212.227.15.15]:35353 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727169AbgKFLZC (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 6 Nov 2020 06:25:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1604661893;
        bh=h353MSDKnlc8XqUZeAyhas+YODqkJ+e9pssvf3FjUok=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=aOyFj+ihLNo8vNR9NmndGcVTXCZxT7uI61RkrFne59UM60AeURY4gINR/U4aGc1wV
         JGYwUuDSH4+bx1d8HxYowaKqLVrdFisMVV/cxwXyfDM19MozMROzLd/OrvPHi7GHKq
         lJVHrB3trnuz+2GhRW/Ja9of6I2XxgzhE6n2sWpE=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([37.201.214.162]) by mail.gmx.com (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N5VHM-1kHuQQ4ArS-016wEu; Fri, 06
 Nov 2020 12:24:53 +0100
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
Subject: [PATCH 3/3] ARM: dts: imx50-kobo-aura: Enable eKTF2132 touchscreen
Date:   Fri,  6 Nov 2020 12:24:12 +0100
Message-Id: <20201106112412.390724-4-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201106112412.390724-1-j.neuschaefer@gmx.net>
References: <20201106112412.390724-1-j.neuschaefer@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Eb/mcNh+2C3ChXXzq4O8bBzixHexY7F7ebnCPUuzp8adYY8PHb8
 n+jg1ro2q3wch1bs8eNLfUhN1uK0jv5/95w7l9kD36ePUkIXxF6/FC6NEN7Ddvgm0FQjWzF
 8LNpimBG9tRWA4TxPk9e6fi48+BP+LNEC8BXuLzGXmQFwh/vzZzJXGjmIpb8Deja1avtaJB
 d/j7/6SewIyn7+tu0Xt1w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:K85UTosfvTo=:Kdq+p7usASgZEEWfOffCZO
 3UOnagOb19HiiVSQrSNS32zdAvIUTU9cZrMqleCgARdtR/QdIhpRcXShtp6Y+uqBMt+vQBZdD
 cbihIunTRj5YJEom+ayGoJl+AeHBOziN9wy/azTLQcssQ7ezgO3XC/4B1sq5ZmceWsr4Qe1xe
 Z0+uBrjcN/CNoR0HnygpiOsbvmz0xYIP2dedpbJQhxJgdSpaJWhsbTSSedFbK+/+Ea2Bw8A0n
 wJrlcy7ZxrEKHJ/saXkdKKNulDH/NNDw08qJzDoGjtWxQjPCW61sT+QFjfiRR02793bJIXl5i
 KJpXWO0r22Tm0M+2hQaz/wkLrWstITjeS+ibK7zbPKQhN3ZJPv/2ZvUvWuKoi9OWP4U6+aF3F
 4ySTRylPqO/8L7VTEFXwezOXiTYBBJcmkVYpA4GE81in5NPpNPARCiGh41v4K/Ow628cXngkV
 H4xQosYKYFII/UY/PR84WfOdf6UaCSh4I7IjbVOk3IhLARp5cZXGWqpbXEkLKAeBe+2J+60yJ
 Ar5/1FuKknK1b4JP0FhkD+twsACKcmHE7qSFIoXOw1W6yxba/G4+d9QNvW0VC9PqUnxbEI8hL
 enze9Fo4L5QMETf+tiAhPjeGkZv0XSYvtlRlDoxS30aoNT47hqPV/cDgXnPHBZBd+97z2qDJ/
 jo4RFE2Ku8EsEobTn58BKztr40a/1QNMlXbJBsMZi8ckcWbpio0jAkpmmC/ch36nGUiN5FXJR
 TbmRj+8tYHbxmZW05AU7wFWEGDWiWJC7r9k1eQArmrXM3RZWXkLFoWYbKgeIYmefM3vl33Bp0
 xOr0AcEiT0tDfSrQ04j14B8t6GeR+vWbXqq/RzW+7Haidx50TdZjyLVwIUaYf1QeMN6rOQEtl
 IzK719hMyRlozZiKYDN512y8ycBSVF+PtPne7OsDs=
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The Kobo Aura has an eKTF2132 touchscreen controller.

Although the vendor kernel toggles a reset pin (GPIO5-12) during the
startup sequence, the touchscreen works without it.

Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
=2D--

This patch requires "[PATCH] ARM: dts: imx50-kobo-aura: Add 'grp' suffix
to pinctrl node names" in order to apply cleanly.
(https://lore.kernel.org/lkml/20201031210729.2804471-1-j.neuschaefer@gmx.n=
et/)
=2D--
 arch/arm/boot/dts/imx50-kobo-aura.dts | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/imx50-kobo-aura.dts b/arch/arm/boot/dts/imx=
50-kobo-aura.dts
index b2fbee60271f2..82ce8c43be867 100644
=2D-- a/arch/arm/boot/dts/imx50-kobo-aura.dts
+++ b/arch/arm/boot/dts/imx50-kobo-aura.dts
@@ -120,7 +120,14 @@ &i2c1 {
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
@@ -240,6 +247,13 @@ MX50_PAD_SD3_D7__ESDHC3_DAT7		0x1d4
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

