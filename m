Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BF1B57836F3
	for <lists+linux-input@lfdr.de>; Tue, 22 Aug 2023 02:15:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231833AbjHVAOD (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 21 Aug 2023 20:14:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231700AbjHVAN7 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 21 Aug 2023 20:13:59 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AC05189
        for <linux-input@vger.kernel.org>; Mon, 21 Aug 2023 17:13:53 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-4fe457ec6e7so5793447e87.3
        for <linux-input@vger.kernel.org>; Mon, 21 Aug 2023 17:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692663231; x=1693268031;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SALxZGoX3/9kIk4D8MzHrmKOI6Uww1oAjqSJVs71Tto=;
        b=WmxnAp+c6j9cm61vk35qp1hqH9d5d86UnTeeoDw9wBKBZNb79O1px7ad4+GKk7SWBO
         xNz1MyWZl6pd6yiwmSEy5P9kQKaLiqKZoG+HR1kDPkbTQsHwd8TEIWEwJA+ALtGY9vCM
         uW0TdaPYCYq0wz2lfAxCkOyIt9kNLgSF+sg7eSvfLXJC75BHgb03777bkxLuWrqXYFz7
         QWnhxDOCJ5BMKxL6zQpD0+RoNs+L9TXuh9puMV09fvBI9YGuCfH+0k+J7FCPvAzskxV/
         VRjARoSUddOFL/bKlyYEvLL295RCYngYnNXsqA/D/F4OER94sj2Xh3iLS8KqetYTQg3u
         3wGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692663231; x=1693268031;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SALxZGoX3/9kIk4D8MzHrmKOI6Uww1oAjqSJVs71Tto=;
        b=I33w6q+ESWDHkWgISokv7gh7mL2KipTIIXf/8D4HfZ5vNvaXd/WooeEc126dQ2ta9N
         Bv4G+Gm32y6AOKhniBmzDxLm0+oreP7SJi16lI+bH03Xfavug7MHveloP6/li7zhu4Tg
         JlO8AC1xdf4bRB/MU/HOrzMWew+vfzohJDHQWlVZKXaSKy4aEywGinSZ8/55gnL5pVl5
         vrGzNlnQZH8Jp0+rSRwnTs70/3GOudsEswU+dvqrB0y6OpU/JbLPw1aq4Ut3t1FgHGda
         Ch+22Ar2q5TNAhJf1eaT/r9yy6zonQXRbbHT+wuFGMGGmoZZDucZ9ot3qh58qj4H63Lz
         Kg5g==
X-Gm-Message-State: AOJu0Yw64p/WKYC2pSi/WMl4xfN5gGQ+86uwg7vgS3SNahy3xDk+g6s1
        ZhtcmsanC2Notiq/vJrWs0TmAQ==
X-Google-Smtp-Source: AGHT+IGMQmI78sGZbaSMhINrIDvn2+4mx1hPeS+pBt5iU5epHUtf6gOPSFyOEswI1tc0wyaeUS4XYg==
X-Received: by 2002:a05:6512:282c:b0:4ff:8f45:ab86 with SMTP id cf44-20020a056512282c00b004ff8f45ab86mr6775891lfb.25.1692663231155;
        Mon, 21 Aug 2023 17:13:51 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id er23-20020a05651248d700b004fe36e673b8sm912024lfb.178.2023.08.21.17.13.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Aug 2023 17:13:50 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-input@vger.kernel.org
Subject: [PATCH v3 00/32] ARM: dts: qcom: cleanup PMIC usage
Date:   Tue, 22 Aug 2023 03:13:17 +0300
Message-Id: <20230822001349.899298-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

While reviewing APQ8064 CPUFreq patchset, Konrad pointed out that PMICs
are not a part of SoC and as such do not belong to the per-SoC files.

Cleanup the way 32-bit Qualcomm platforms treat PMICs:

- Move SSBI PMICs to separate files (as a bonus merging two different
  instances of PM8921, benefitting both platforms).

- Include such PMIC files only from the board files, keeping SoC file
  generic.

- Move RPM regulator definitions to board files too. They do not belong
  to the SoC dtsi files for the same reason.

- Move PMIC-specific GPIOs and supply properties to individual board
  files.

Note, enabling DT schema triggers warnings for pmic:led@48 in
qcom-apq8060-dragonboard.dts. This node uses custom ('cm3605') trigger
to make the LED follow the state of the proximity / ALS device.
Previously [1] Rob pointed out that this is not the best way and the
device should be switched to `trigger-sources' instead. However as I do
not have this device, I'm not brave enough to introduce these changes.

Note2: DT binding changes are largely independent from the DTS changes,
they can be applied separately.

[1] https://lore.kernel.org/linux-arm-msm/20221205220709.GA2713165-robh@kernel.org

Changes since v2:
- Rebased on top of linux-next to fix conflict
- Picked up dt-bindings patches from old, not-fully merged series.
- qcom,pm8921-keypad: droped the no-autorepeat property (Rob, Dmitry)
- Moved qcom,ssbi to /bus/ (Krzysztof)

Changes since v1:
- To ease reviewing break cleanups from the  "split PMIC" patches
  (Konrad).

Dmitry Baryshkov (32):
  dt-bindings: input: qcom,pm8921-keypad: convert to YAML format
  dt-bindings: mfd: qcom-pm8xxx: add missing child nodes
  dt-bindings: bus: convert qcom,ssbi schema to YAML format
  ARM: dts: qcom: apq8064: correct XOADC register address
  ARM: dts: qcom: msm8960: introduce label for PMIC keypad
  ARM: dts: qcom: msm8660-surf: use keypad label directly
  ARM: dts: qcom: apq8064-nexus7: move sdcc1 node to proper place
  ARM: dts: qcom: mdm9615-wp8548-mangoh-green: group include clauses
  ARM: dts: qcom: strip prefix from PMIC files
  ARM: dts: qcom: apq8064: fix PMIC node labels
  ARM: dts: qcom: mdm9615: fix PMIC node labels
  ARM: dts: qcom: msm8660: fix PMIC node labels
  ARM: dts: qcom: msm8960: fix PMIC node labels
  ARM: dts: qcom: msm8960: split PMIC to separate dtsi files
  ARM: dts: qcom: apq8064: split PMICs to separate dtsi files
  ARM: dts: qcom: mdm9615: split PMIC to separate dtsi files
  ARM: dts: qcom: msm8660: split PMIC to separate dtsi files
  ARM: dts: qcom: pm8058: reorder nodes
  ARM: dts: qcom: pm8921: reorder nodes
  ARM: dts: qcom: pm8018: move reg property
  ARM: dts: qcom: pm8921: move reg property
  ARM: dts: qcom: pm8058: use defined IRQ flags
  ARM: dts: qcom: pm8921: switch to interrupts-extended
  ARM: dts: qcom: pm8018: switch to interrupts-extended
  ARM: dts: qcom: pm8058: switch to interrupts-extended
  ARM: dts: qcom: apq8064: move RPM regulators to board files
  ARM: dts: qcom: mdm9615: move RPM regulators to board files
  ARM: dts: qcom: msm8660: move RPM regulators to board files
  ARM: dts: qcom: msm8960: drop useless rpm regulators node
  ARM: dts: qcom: msm8974: move regulators to board files
  ARM: dts: qcom: pm8921: Disable keypad by default
  ARM: dts: qcom: apq8060-dragonboard: rename mpp ADC channels to
    adc-channel

 .../devicetree/bindings/arm/msm/ssbi.txt      |  18 --
 .../devicetree/bindings/bus/qcom,ssbi.yaml    |  63 ++++++
 .../bindings/input/qcom,pm8921-keypad.yaml    |  89 ++++++++
 .../bindings/input/qcom,pm8xxx-keypad.txt     |  90 --------
 .../devicetree/bindings/mfd/qcom-pm8xxx.yaml  |  26 ++-
 arch/arm/boot/dts/qcom/pm8018.dtsi            |  55 +++++
 arch/arm/boot/dts/qcom/pm8058.dtsi            | 159 +++++++++++++
 .../qcom/{qcom-pm8226.dtsi => pm8226.dtsi}    |   0
 arch/arm/boot/dts/qcom/pm8821.dtsi            |  22 ++
 .../qcom/{qcom-pm8841.dtsi => pm8841.dtsi}    |   0
 arch/arm/boot/dts/qcom/pm8921.dtsi            | 137 +++++++++++
 .../qcom/{qcom-pm8941.dtsi => pm8941.dtsi}    |   0
 .../qcom/{qcom-pma8084.dtsi => pma8084.dtsi}  |   0
 .../dts/qcom/{qcom-pmx55.dtsi => pmx55.dtsi}  |   0
 .../dts/qcom/{qcom-pmx65.dtsi => pmx65.dtsi}  |   0
 .../dts/qcom/qcom-apq8026-asus-sparrow.dts    |   2 +-
 .../dts/qcom/qcom-apq8026-huawei-sturgeon.dts |   2 +-
 .../boot/dts/qcom/qcom-apq8026-lg-lenok.dts   |   2 +-
 .../qcom-apq8026-samsung-matisse-wifi.dts     |   2 +-
 .../dts/qcom/qcom-apq8060-dragonboard.dts     | 160 ++++++++-----
 .../dts/qcom/qcom-apq8064-asus-nexus7-flo.dts |  69 +++---
 .../boot/dts/qcom/qcom-apq8064-cm-qs600.dts   |  31 +--
 .../boot/dts/qcom/qcom-apq8064-ifc6410.dts    |  38 ++--
 .../qcom-apq8064-sony-xperia-lagan-yuga.dts   | 110 +++++----
 arch/arm/boot/dts/qcom/qcom-apq8064.dtsi      | 195 +---------------
 .../dts/qcom/qcom-apq8074-dragonboard.dts     |  31 ++-
 .../boot/dts/qcom/qcom-apq8084-ifc6540.dts    |   2 +-
 arch/arm/boot/dts/qcom/qcom-apq8084-mtp.dts   |   2 +-
 .../qcom/qcom-mdm9615-wp8548-mangoh-green.dts |   4 +-
 .../boot/dts/qcom/qcom-mdm9615-wp8548.dtsi    | 139 +++++++++++-
 arch/arm/boot/dts/qcom/qcom-mdm9615.dtsi      | 181 +--------------
 arch/arm/boot/dts/qcom/qcom-msm8660-surf.dts  |  59 +++--
 arch/arm/boot/dts/qcom/qcom-msm8660.dtsi      | 214 +-----------------
 arch/arm/boot/dts/qcom/qcom-msm8960-cdp.dts   |  23 +-
 .../qcom/qcom-msm8960-samsung-expressatt.dts  |   3 +-
 arch/arm/boot/dts/qcom/qcom-msm8960.dtsi      |  42 +---
 .../qcom-msm8974-lge-nexus5-hammerhead.dts    |  31 ++-
 .../qcom/qcom-msm8974-sony-xperia-rhine.dtsi  |  31 ++-
 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi      |  27 ---
 .../qcom/qcom-msm8974pro-fairphone-fp2.dts    |  31 ++-
 .../qcom/qcom-msm8974pro-oneplus-bacon.dts    |  31 ++-
 .../dts/qcom/qcom-msm8974pro-samsung-klte.dts |  12 +-
 ...-msm8974pro-sony-xperia-shinano-castor.dts |  31 ++-
 arch/arm/boot/dts/qcom/qcom-sdx55-mtp.dts     |   2 +-
 arch/arm/boot/dts/qcom/qcom-sdx55-t55.dts     |   2 +-
 .../dts/qcom/qcom-sdx55-telit-fn980-tlb.dts   |   2 +-
 arch/arm/boot/dts/qcom/qcom-sdx65-mtp.dts     |   2 +-
 47 files changed, 1185 insertions(+), 987 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/msm/ssbi.txt
 create mode 100644 Documentation/devicetree/bindings/bus/qcom,ssbi.yaml
 create mode 100644 Documentation/devicetree/bindings/input/qcom,pm8921-keypad.yaml
 delete mode 100644 Documentation/devicetree/bindings/input/qcom,pm8xxx-keypad.txt
 create mode 100644 arch/arm/boot/dts/qcom/pm8018.dtsi
 create mode 100644 arch/arm/boot/dts/qcom/pm8058.dtsi
 rename arch/arm/boot/dts/qcom/{qcom-pm8226.dtsi => pm8226.dtsi} (100%)
 create mode 100644 arch/arm/boot/dts/qcom/pm8821.dtsi
 rename arch/arm/boot/dts/qcom/{qcom-pm8841.dtsi => pm8841.dtsi} (100%)
 create mode 100644 arch/arm/boot/dts/qcom/pm8921.dtsi
 rename arch/arm/boot/dts/qcom/{qcom-pm8941.dtsi => pm8941.dtsi} (100%)
 rename arch/arm/boot/dts/qcom/{qcom-pma8084.dtsi => pma8084.dtsi} (100%)
 rename arch/arm/boot/dts/qcom/{qcom-pmx55.dtsi => pmx55.dtsi} (100%)
 rename arch/arm/boot/dts/qcom/{qcom-pmx65.dtsi => pmx65.dtsi} (100%)

-- 
2.39.2

