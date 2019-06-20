Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A982F4D063
	for <lists+linux-input@lfdr.de>; Thu, 20 Jun 2019 16:28:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732022AbfFTO2H (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 20 Jun 2019 10:28:07 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:40442 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726675AbfFTO2H (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 20 Jun 2019 10:28:07 -0400
Received: by mail-pf1-f195.google.com with SMTP id p184so1772869pfp.7;
        Thu, 20 Jun 2019 07:28:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=MiA7cCUklcR2x8Sie2spJwpUdmRAd/CQhDcyA6ANjAw=;
        b=E77kC/Jy7ff9yCCN4wKKj1l2m62PhfPe62rXCJ9KQ5VuseDlPTzVMnU5Kp9IBANVws
         h1aaRoDp5RoL4fqsL9ZGtxfavOS8baMftS7UuneNm45Kdhhwx73RUmP6s4vkxOS8NYxY
         H9bjvIH4YPorE7wKncvuD2AxkINuBxq8B2fjZj1F0a++B7Ej19nVoG9lP035huV+jDtZ
         IUNMwjvNImBbH2dBwZfTq8eqL4+wh7Zc2O7/jJpEoEAgyCkzs3CUGpriT6JPw4hhTnKI
         3WzfmRalISp4vhPcYaTa+C7E8SKymj8eJ+l4+kFHtZzUZvMSohpPIQcUebuClwsH+18e
         k6ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=MiA7cCUklcR2x8Sie2spJwpUdmRAd/CQhDcyA6ANjAw=;
        b=VrYo4264/kdkEKI4EERe/bvIsdsgm+mQMyV4Ua8nn0zwKPWzGLSJvSShfhbeCORSey
         l8AP5dlTYydl032zPZzJYFgQreopiB3FaNLDe2b01YtPi+2i0f02asiiIhhvI/Neza0u
         zpkQzVT1aO+l1MrNZRXHSAbMGVrnR3LgN56qUqDserYGnZq4Hu06p+D5E41zF7fZGAiv
         HLtth/xS1TYTtFlr347v84wdzEqovRsUnLsue6/F0bagJdTCh7x6ZjjcWvwGb2knEme4
         Va34LI3CuVw7r3PIpuQDkhC8k6UAOrl2nzYkhCWTTDi9XAeqkMP25tmhqcTj2e2B60Wb
         3wWg==
X-Gm-Message-State: APjAAAUMo8MGkT5gpead4dfoYc2NGRT9kz0SJqvr0XPH2wBU2IiTNRQR
        3ryCylMaT9URxoyNQa8EROzW2aGR
X-Google-Smtp-Source: APXvYqwUxehKoFEHxHlAA+fCC+vC65bHH7lMxN6+2Uzwp3CZwgxSvLXmRTIsn01Fhjt/gQDE1nAa0w==
X-Received: by 2002:a62:d45d:: with SMTP id u29mr66380380pfl.135.1561040886466;
        Thu, 20 Jun 2019 07:28:06 -0700 (PDT)
Received: from aw-bldr-10.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id i9sm6682781pfa.168.2019.06.20.07.28.04
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 20 Jun 2019 07:28:05 -0700 (PDT)
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Cc:     benjamin.tissoires@redhat.com, dmitry.torokhov@gmail.com,
        jikos@kernel.org, hdegoede@redhat.com, bjorn.andersson@linaro.org,
        agross@kernel.org, lee.jones@linaro.org, xnox@ubuntu.com,
        robh+dt@kernel.org, mark.rutland@arm.com,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: [PATCH v7 0/5] Basic DT support for Lenovo Miix 630
Date:   Thu, 20 Jun 2019 07:28:01 -0700
Message-Id: <20190620142801.11827-1-jeffrey.l.hugo@gmail.com>
X-Mailer: git-send-email 2.17.1
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The Lenovo Miix 630 is one of three ARM based (specifically Qualcomm
MSM8998) laptops that comes with Windows, and seems to have a dedicated
following of folks intrested to get Linux up and running on it.

This series adds support for the basic functionality this is validated
towork using devicetree.  Although the laptops do feed ACPI to Windows,
the existing MSM8998 support in mainline is DT based, so DT provides a
quick path to functionality while ACPI support is investigated.

The three devices are very similar, but do have differences in the set
of peripherals supported, so the idea is that the vast majority of the
support for all three can live in a common include, which should reduce
overall duplication.  Adding support for the other two devices is tacked
onto the end of the series.

The bleeding edge work for these laptops and work in progress can be
found at https://github.com/aarch64-laptops/prebuilt

v7:
-Removed HID matching on compatible strings as it was determined to be
not needed

v6:
-Export the elan_i2c DT and ACPI ids so that hid-quirks can use them
-Use the elan_i2c ids within hid-quirks to reduce duplication
-Add DTs for the Asus and HP devices since the DT seems finalized, and
folks have been asking

v5:
-Split out elan_i2c changes into their own patch
-Use a static list of strings to match
-Fixed typo of "whitelist"
-Dropped incorrect thermal zones
-Dropped tags from Bjorn and Lee since the functional should be
identical, but the code is structured different

v4:
-Changed the hid-quirks ELAN handling around per Benjamin Tissoires
-Dropped new DT binding

v3:
-Changed "clam" to "clamshell"
-Defined a dt binding for the combo Elan keyboard + touchpad device
-Adjusted the HID quirk to be correct for dt boot
-Removed extranious comment in board dts
-Fixed board level compatible

v2:
-Changed "cls" to "clam" since feedback indicated "cls" is too opaque,
but
"clamshell" is a mouthfull.  "clam" seems to be a happy medium.

Jeffrey Hugo (5):
  Input: elan_i2c: Export the device id whitelist
  HID: quirks: Refactor ELAN 400 and 401 handling
  arm64: dts: qcom: Add Lenovo Miix 630
  arm64: dts: qcom: Add HP Envy x2
  arm64: dts: qcom: Add Asus NovaGo TP370QL

 arch/arm64/boot/dts/qcom/Makefile             |   3 +
 .../dts/qcom/msm8998-asus-novago-tp370ql.dts  |  47 ++++
 .../boot/dts/qcom/msm8998-clamshell.dtsi      | 240 ++++++++++++++++++
 .../boot/dts/qcom/msm8998-hp-envy-x2.dts      |  30 +++
 .../boot/dts/qcom/msm8998-lenovo-miix-630.dts |  30 +++
 drivers/hid/hid-quirks.c                      |  22 +-
 drivers/input/mouse/elan_i2c_core.c           |  54 +---
 include/linux/input/elan-i2c-ids.h            |  68 +++++
 8 files changed, 430 insertions(+), 64 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/msm8998-asus-novago-tp370ql.dts
 create mode 100644 arch/arm64/boot/dts/qcom/msm8998-clamshell.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/msm8998-hp-envy-x2.dts
 create mode 100644 arch/arm64/boot/dts/qcom/msm8998-lenovo-miix-630.dts
 create mode 100644 include/linux/input/elan-i2c-ids.h

-- 
2.17.1

