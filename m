Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D58A84496C
	for <lists+linux-input@lfdr.de>; Thu, 13 Jun 2019 19:18:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393261AbfFMRRG (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 13 Jun 2019 13:17:06 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:34633 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728198AbfFLV0K (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 12 Jun 2019 17:26:10 -0400
Received: by mail-pg1-f195.google.com with SMTP id p10so3767886pgn.1;
        Wed, 12 Jun 2019 14:26:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=B9X0MPRX7xZfDuTbCvFOX7nvzRBpgFVnMaQCxz6OgdU=;
        b=IUHfTS4RqAdZf2/0XbVg9yfHfkyKyBql+0jIyDfHuqTb8ueZ+sXHT7IaAw2b+3O8yD
         GN7lJzAiKdQjIwn01eI7DL76WSgM7adjcAZV2+jdGEl/DQcEXECVfPfULEHRvRroLJZl
         8aXZQrAvbQWmaAtgdPe6UA+Ki3X6ia22JhPhBVVv+5OEk9r4J3qP7vpM/w8BL9xvKl9Z
         riFBc96sjOBT1tQNoGJwTQhx1biopgSoH38L2K1BBZlX/NQ/4JU9LAlNMw9SEHhlf3oj
         B5v6aW0sT9rKn0QiaXvdI8bESveALGOQDqgvNMuuUEYiQ8ok5g/Er1vLp1T/QWyfM6kZ
         fBCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=B9X0MPRX7xZfDuTbCvFOX7nvzRBpgFVnMaQCxz6OgdU=;
        b=undzYgRXlURuddZqezjH8TAzKHRFOhng0/sBr9tqC8jPeGqF3eErtd4jviqeVBT9fR
         EFjE/yE3KKqgld+QAlvDQEHrt6qXZZS4LAnn5GP8N7IW/WxQKWVYuK12/BX2CdgYZMtt
         nMI7+HbQsNAgkuCEj6ZdVjpGWxOVHnKhIRUEldVaBlgQR6Ld8IvlqS1hqhDVQnK+vC0K
         i/5vZcb3GrO5VSkdHfsCI+XYBWMiPTMxSEELoK9bgn7aMj4+QJYUqf6/6n2D7vi36pPU
         45oKz80LIjCSTKLH8fATxKDLlma8pl+8a2J/kuP/GOnAsvMFVYaCg2+Q+IAJntaB5k57
         pbKQ==
X-Gm-Message-State: APjAAAWc/zMJfdVdIxoU+b/sZBkx64ldPeUaZ7Gg9+5J8X5lfOsMqSrl
        REURqJIz5XEDiaaY/hYo4Sc=
X-Google-Smtp-Source: APXvYqx8PO+nnCxda+czlOB0lVkz7Xh5HzTIi4gQeji9cay7D3Vp9FWSoTGePngXLYiGjGFyzcZo9w==
X-Received: by 2002:a17:90a:2ec2:: with SMTP id h2mr1211409pjs.119.1560374769098;
        Wed, 12 Jun 2019 14:26:09 -0700 (PDT)
Received: from aw-bldr-10.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id x8sm474023pfa.46.2019.06.12.14.26.06
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 12 Jun 2019 14:26:08 -0700 (PDT)
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Cc:     benjamin.tissoires@redhat.com, dmitry.torokhov@gmail.com,
        jikos@kernel.org, hdegoede@redhat.com, bjorn.andersson@linaro.org,
        agross@kernel.org, lee.jones@linaro.org, xnox@ubuntu.com,
        robh+dt@kernel.org, mark.rutland@arm.com,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: [PATCH v6 0/5] Basic DT support for Lenovo Miix 630
Date:   Wed, 12 Jun 2019 14:26:04 -0700
Message-Id: <20190612212604.32089-1-jeffrey.l.hugo@gmail.com>
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

 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../boot/dts/qcom/msm8998-clamshell.dtsi      | 240 ++++++++++++++++++
 .../boot/dts/qcom/msm8998-lenovo-miix-630.dts |  30 +++
 drivers/hid/hid-quirks.c                      |  78 +++++-
 drivers/input/mouse/elan_i2c_core.c           |   4 +
 5 files changed, 342 insertions(+), 11 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/msm8998-clamshell.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/msm8998-lenovo-miix-630.dts

-- 
2.17.1

