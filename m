Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 93EF746F91F
	for <lists+linux-input@lfdr.de>; Fri, 10 Dec 2021 03:27:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235928AbhLJCaf (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 9 Dec 2021 21:30:35 -0500
Received: from mail-0301.mail-europe.com ([188.165.51.139]:45068 "EHLO
        mail-0301.mail-europe.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235960AbhLJCaf (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 9 Dec 2021 21:30:35 -0500
Date:   Fri, 10 Dec 2021 02:26:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=connolly.tech;
        s=protonmail; t=1639103217;
        bh=mu0sqQvUggygf7jKzEWPGl0UelkYU3w40dJw8wgxBlw=;
        h=Date:To:From:Cc:Reply-To:Subject:Message-ID:From:To:Cc;
        b=GNF8V+oQyEMMQAWhqMvw0m37ieasw0tmQ/6vl1VeJG9LqdAWQNa2nj6aMZQ205H1X
         sdyB3eNYCd9kFOy+8NZlDc/u0MQtw9zwvU2NWsqll7bmvWpm9yPgbbNul04+k5uOC+
         djvMa/6ak9/KlsYwyImgjxiQoOMNhNlX5/pGYgrU=
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
Subject: [PATCH v4 0/6] input: Introduce support for SPMI haptics found on Qcom PMICs
Message-ID: <20211210022639.2779173-1-caleb@connolly.tech>
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

This series introduces a driver for the SPMI haptics hardware block
found in Qualcomm PMICs. SPMI haptics support LRA (Linear Resonant
Actuator) style haptics, as well as ERM (Eccentric Rotating Mass).
It also supports several modes of driving the haptics, e.g. by loading
the pattern to play into an internal buffer, or using PWM.

More information about the hardware can be found here:
        https://gitlab.com/sdm845-mainline/linux/-/wikis/PMI8998-QPNP-Hapti=
cs

This driver has been written based on downstream sources as no public
documentation is available. It includes initial support for LRA haptics
in buffer mode, this combination seems to be the most common and will
enable haptics on the OnePlus 6 and 6T, PocoPhone F1, OnePlus 5 and
several other Qualcomm devices with mainline kernel support.

The driver is implemented using the ff-memless (forcefeedback) input
framework and makes an attempt to control the strength of vibration relativ=
e
to the magnitude set from userspace.

Changes since v3:
 - Adjust example DTS to avoid creating new warnings in dt_binding_check
 - Address warnings from kernel test robot.

Changes since v2:
 - Addressed Rob's comments on dt-bindings (I'm not sure what to do
   about the pmic compatible?)
 - Fixed some typos

Changes since v1:
 - Replace old QPNP naming with SPMI
 - Address Bjorn's comments on the driver, various style and code cleanups
 - Address Bjorn's comments on the DT bindings and DTS
 - Pickup patches from Joel and Jami to enable haptics on the OnePlus 5
   and Poco F1.

Caleb Connolly (4):
  dt-bindings: input: add Qualcomm SPMI haptics driver
  input: add Qualcomm SPMI haptics driver
  arm64: dts: qcom: pmi8998: introduce spmi haptics
  arm64: dts: qcom: sdm845-oneplus-common: add haptics

Jami Kettunen (1):
  arm64: dts: qcom: msm8998-oneplus-common: Enable PMI8998 haptics

Joel Selvaraj (1):
  arm64: dts: qcom: sdm845-xiaomi-beryllium: add haptics

 .../bindings/input/qcom,spmi-haptics.yaml     | 123 +++
 .../boot/dts/qcom/msm8998-oneplus-common.dtsi |   6 +
 arch/arm64/boot/dts/qcom/pmi8998.dtsi         |  15 +
 .../boot/dts/qcom/sdm845-oneplus-common.dtsi  |   6 +
 .../boot/dts/qcom/sdm845-xiaomi-beryllium.dts |   5 +
 drivers/input/misc/Kconfig                    |  12 +
 drivers/input/misc/Makefile                   |   1 +
 drivers/input/misc/qcom-spmi-haptics.c        | 977 ++++++++++++++++++
 include/dt-bindings/input/qcom,spmi-haptics.h |  32 +
 9 files changed, 1177 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/qcom,spmi-hapti=
cs.yaml
 create mode 100644 drivers/input/misc/qcom-spmi-haptics.c
 create mode 100644 include/dt-bindings/input/qcom,spmi-haptics.h

--
2.34.1


