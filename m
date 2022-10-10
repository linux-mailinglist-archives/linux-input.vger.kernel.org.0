Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 861C85FA1B8
	for <lists+linux-input@lfdr.de>; Mon, 10 Oct 2022 18:18:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229552AbiJJQSP (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 10 Oct 2022 12:18:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229729AbiJJQSJ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 10 Oct 2022 12:18:09 -0400
Received: from mail-4022.proton.ch (mail-4022.proton.ch [185.70.40.22])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE64B6F563
        for <linux-input@vger.kernel.org>; Mon, 10 Oct 2022 09:18:05 -0700 (PDT)
Date:   Mon, 10 Oct 2022 16:17:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=connolly.tech;
        s=protonmail; t=1665418683; x=1665677883;
        bh=v8t2lgopjGAlj4wqpLkRQ1AnOzaZKPh8TfSRmc4oklE=;
        h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
         Subject:Reply-To:Feedback-ID:Message-ID;
        b=lOxRxmLyaILR+j+bXkejDUmHL1SmEfzt6EeJ4BvN9pTighkdY+YF9dwmwUo/It/jP
         xt7OYk41es+gckbAfe7lfCvtcidi1vVuYuDlCRSNLzbDFZ/+lZfF2cco2KhZeA8bBh
         astZAlu0V3026VrhzkQ61BVp+L+cZH+2Oc44keMU=
To:     caleb@connolly.tech
From:   Caleb Connolly <caleb@connolly.tech>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        devicetree@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jeff LaBundy <jeff@labundy.com>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Rob Herring <robh+dt@kernel.org>, Tom Rix <trix@redhat.com>
Subject: [PATCH v5 0/2] input: introduce support for Qualcomm SPMI haptics
Message-ID: <20221010161727.1298112-1-caleb@connolly.tech>
Feedback-ID: 10753939:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        TO_EQ_FM_DIRECT_MX autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
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

Changes since v4:
 - Significant rewrite and cleanup
 - switch to dev_err_probe()
 - Run through clang-format

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

Caleb Connolly (2):
  dt-bindings: input: add Qualcomm SPMI haptics driver
  input: add Qualcomm SPMI haptics driver

 .../bindings/input/qcom,spmi-haptics.yaml     | 123 ++++
 drivers/input/misc/Kconfig                    |  15 +
 drivers/input/misc/Makefile                   |   1 +
 drivers/input/misc/qcom-spmi-haptics.c        | 674 ++++++++++++++++++
 include/dt-bindings/input/qcom,spmi-haptics.h |  32 +
 5 files changed, 845 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/qcom,spmi-hapti=
cs.yaml
 create mode 100644 drivers/input/misc/qcom-spmi-haptics.c
 create mode 100644 include/dt-bindings/input/qcom,spmi-haptics.h

--
2.38.0


