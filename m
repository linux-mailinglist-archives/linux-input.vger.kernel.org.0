Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7FE8C4EB09
	for <lists+linux-input@lfdr.de>; Fri, 21 Jun 2019 16:49:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726233AbfFUOtA (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 21 Jun 2019 10:49:00 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:40500 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726002AbfFUOtA (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 21 Jun 2019 10:49:00 -0400
Received: by mail-pl1-f195.google.com with SMTP id a93so3123542pla.7;
        Fri, 21 Jun 2019 07:48:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=xllrJTB8B8ElfqEi7jLajptsKVcgf1poB5tDdPZCtl4=;
        b=XuYJxoFO8NUo0BlBFOH84oyOAfrNEIBDI8YKQK7b0vcvDzfo+xGDpZNnoD2hg47m5k
         ziEJORFZ3T0xxTA2+WKsVbCjMJAKIeYXdG1B3dT47n8I05yaodRAVLRIK4d1p3TiJtZZ
         4zRB0DqxDDF2L/RNsHmB8kRYFARM2GwUrF1Lc9oBekrIuAmArFI0sjARcg1hBxb+Ltda
         G4BbH3wCT5AlJx/JphPxxfllCuZAl+jSqRYlYLQNuzP55Fx+jHXO7DOBTJrDqqyJnB1d
         vSR6r++dJ7nmHsqO9E9ajQSYJtsO/voNRg9TQaTNnsWdHMIWvwPGYVhjgyqtZ+VP9+Lr
         gw3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=xllrJTB8B8ElfqEi7jLajptsKVcgf1poB5tDdPZCtl4=;
        b=r7UieyVGIDeLJANWxj3hX7UxPDaeQIWSkZFa+oFXuHZv8VqhumvI6sM6alEvXTXL3O
         SeWCbBHD4A3wHSgKTzcPPSk+x+1Lz4h9FRc9GjC+9lzNrOTcSZF8vWOo8KyeAI5fUevi
         zF4JFwfT9OizQgpbkg4xFholnpJWqeSz5EH2qxN0H2YNg65DX8GiOTUwsd+amaYJR+Js
         mrSRJXS7mdlrGBH7rpF/9AYQv0nW7Mlr078AxXdusY8b9m57S9rCsFHPxKVPSlveLqUR
         c3IyAGnp0QaK5bnIHt+XPA/PtqMH7RmeVVz1AfWsU6d2FyDCtwr9qohc74tlR9eKffni
         NgEQ==
X-Gm-Message-State: APjAAAXhvO4/FBEnNpG4gNUhoBAtUBbrPvHc9KCq/2W2YB9rdwSwWFOL
        BkRdEDq3VfaFeCWto+/OJqI=
X-Google-Smtp-Source: APXvYqzEx9cEX7WhDSf/+AktxcwIhinYzbOG/rbT4THtM4dftSxhhLqbPBS5viOtU6y18WynvQNdSw==
X-Received: by 2002:a17:902:aa03:: with SMTP id be3mr54044072plb.240.1561128539221;
        Fri, 21 Jun 2019 07:48:59 -0700 (PDT)
Received: from aw-bldr-10.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id j8sm2891737pfi.148.2019.06.21.07.48.57
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 21 Jun 2019 07:48:58 -0700 (PDT)
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Cc:     benjamin.tissoires@redhat.com, dmitry.torokhov@gmail.com,
        jikos@kernel.org, hdegoede@redhat.com, bjorn.andersson@linaro.org,
        agross@kernel.org, lee.jones@linaro.org, xnox@ubuntu.com,
        robh+dt@kernel.org, mark.rutland@arm.com,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: [PATCH v8 0/5] Basic DT support for Lenovo Miix 630
Date:   Fri, 21 Jun 2019 07:48:54 -0700
Message-Id: <20190621144854.38568-1-jeffrey.l.hugo@gmail.com>
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

v8:
-Used original Elan copyright for new header file
-Kept the DT ids in the Elan core driver instead of miving them to the
header
-Fixed "device" misspelling in new header

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
 drivers/input/mouse/elan_i2c_core.c           |  50 +---
 include/linux/input/elan-i2c-ids.h            |  76 ++++++
 8 files changed, 438 insertions(+), 60 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/msm8998-asus-novago-tp370ql.dts
 create mode 100644 arch/arm64/boot/dts/qcom/msm8998-clamshell.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/msm8998-hp-envy-x2.dts
 create mode 100644 arch/arm64/boot/dts/qcom/msm8998-lenovo-miix-630.dts
 create mode 100644 include/linux/input/elan-i2c-ids.h

-- 
2.17.1

