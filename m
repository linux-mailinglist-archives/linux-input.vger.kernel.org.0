Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 08B6B3EDFC5
	for <lists+linux-input@lfdr.de>; Tue, 17 Aug 2021 00:20:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232395AbhHPWUb (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 16 Aug 2021 18:20:31 -0400
Received: from mail-0201.mail-europe.com ([51.77.79.158]:55450 "EHLO
        mail-0201.mail-europe.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232318AbhHPWUa (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 16 Aug 2021 18:20:30 -0400
Date:   Mon, 16 Aug 2021 22:19:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=connolly.tech;
        s=protonmail; t=1629152395;
        bh=GUs2dLWJZvDaFr7ZFKo9GzUxOMHWb9uOrrX/8DITKhk=;
        h=Date:To:From:Cc:Reply-To:Subject:From;
        b=m8Mn9Xi0/or4wC0OINTjI58LAaQnXv0qyvGo2Ostyy0pK1QkcOga3HTgw3Xbrya7X
         Zm5MV8/2VmcQRJ04LBCcUnqcCM9cBmxsVXmxsEduY//Fjdm0JmMG+rc4/Tm0uxqo5I
         gU+oNlsFgSlLHZmNJSQ0AA6wnQQcvmbmfB3WUo38=
To:     Caleb Connolly <caleb@connolly.tech>
From:   Caleb Connolly <caleb@connolly.tech>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Joel Selvaraj <jo@jsfamily.in>
Reply-To: Caleb Connolly <caleb@connolly.tech>
Subject: [PATCH v3 0/6] input: Introduce support for SPMI haptics found on Qcom PMICs
Message-ID: <20210816221931.1998187-1-caleb@connolly.tech>
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

 ~ Caleb

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

---
Caleb Connolly (4):
  dt-bindings: input: add Qualcomm SPMI haptics driver
  input: add Qualcomm SPMI haptics driver
  arm64: dts: qcom: pmi8998: introduce spmi haptics
  arm64: dts: qcom: sdm845-oneplus-common: add haptics

Jami Kettunen (1):
  arm64: dts: qcom: msm8998-oneplus-common: Enable PMI8998 haptics

Joel Selvaraj (1):
  arm64: dts: qcom: sdm845-xiaomi-beryllium: add haptics

 .../bindings/input/qcom,spmi-haptics.yaml     | 128 +++
 .../boot/dts/qcom/msm8998-oneplus-common.dtsi |   6 +
 arch/arm64/boot/dts/qcom/pmi8998.dtsi         |  16 +
 .../boot/dts/qcom/sdm845-oneplus-common.dtsi  |   6 +
 .../boot/dts/qcom/sdm845-xiaomi-beryllium.dts |   5 +
 drivers/input/misc/Kconfig                    |  12 +
 drivers/input/misc/Makefile                   |   1 +
 drivers/input/misc/qcom-spmi-haptics.c        | 981 ++++++++++++++++++
 include/dt-bindings/input/qcom,spmi-haptics.h |  32 +
 9 files changed, 1187 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/qcom,spmi-hapti=
cs.yaml
 create mode 100644 drivers/input/misc/qcom-spmi-haptics.c
 create mode 100644 include/dt-bindings/input/qcom,spmi-haptics.h

--
2.32.0


