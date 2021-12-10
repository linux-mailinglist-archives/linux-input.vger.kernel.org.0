Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC3B846F920
	for <lists+linux-input@lfdr.de>; Fri, 10 Dec 2021 03:27:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235981AbhLJCal (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 9 Dec 2021 21:30:41 -0500
Received: from mail-4317.proton.ch ([185.70.43.17]:42397 "EHLO
        mail-4317.proton.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235960AbhLJCal (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 9 Dec 2021 21:30:41 -0500
Date:   Fri, 10 Dec 2021 02:27:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=connolly.tech;
        s=protonmail; t=1639103225;
        bh=HPRTLypqlL1v/oJddAQlru6l2IJfkdXX26COEmhucPs=;
        h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
         References:From:To:Cc;
        b=FquTi0+w7hGeWMhBOi0z5TdO2ARBGanGJeBTlGYTYZmsXerSlwHDLJ+W9L+erMiD1
         ad63z18tpdWlhxo3AdGFd8LbqqXe7U5bNxMhkOeb++0aYNoS2oV/Wytd8GGzqfqWed
         M5BWmT6B2mmIt8PocbaLZhCp+f5spQKBzb82j+tA=
To:     caleb@connolly.tech, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, phone-devel@vger.kernel.org
From:   Caleb Connolly <caleb@connolly.tech>
Cc:     Jami Kettunen <jami.kettunen@somainline.org>,
        Joel Selvaraj <jo@jsfamily.in>
Reply-To: Caleb Connolly <caleb@connolly.tech>
Subject: [PATCH v4 3/6] arm64: dts: qcom: pmi8998: introduce spmi haptics
Message-ID: <20211210022639.2779173-4-caleb@connolly.tech>
In-Reply-To: <20211210022639.2779173-1-caleb@connolly.tech>
References: <20211210022639.2779173-1-caleb@connolly.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
        autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
        mailout.protonmail.ch
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add bindings for Qualcomm SPMI haptics on platforms using pmi8998.

Signed-off-by: Caleb Connolly <caleb@connolly.tech>
---
 arch/arm64/boot/dts/qcom/pmi8998.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pmi8998.dtsi b/arch/arm64/boot/dts/qc=
om/pmi8998.dtsi
index 0fef5f113f05..97d993f31ddd 100644
--- a/arch/arm64/boot/dts/qcom/pmi8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/pmi8998.dtsi
@@ -1,4 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0
+#include <dt-bindings/input/qcom,spmi-haptics.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/spmi/spmi.h>

@@ -53,5 +54,19 @@ pmi8998_wled: leds@d800 {
 =09=09=09status =3D "disabled";
 =09=09};

+=09=09pmi8998_haptics: haptics@c000 {
+=09=09=09compatible =3D "qcom,pmi8998-haptics";
+=09=09=09reg =3D <0xc000>;
+
+=09=09=09interrupts =3D <0x3 0xc0 0x0 IRQ_TYPE_EDGE_BOTH>,
+=09=09=09=09     <0x3 0xc0 0x1 IRQ_TYPE_EDGE_BOTH>;
+=09=09=09interrupt-names =3D "short", "play";
+
+=09=09=09qcom,wave-shape =3D <HAP_WAVE_SINE>;
+=09=09=09qcom,play-mode =3D <HAP_PLAY_BUFFER>;
+=09=09=09qcom,brake-pattern =3D <0x3 0x3 0x2 0x1>;
+
+=09=09=09status =3D "disabled";
+=09=09};
 =09};
 };
--
2.34.1


