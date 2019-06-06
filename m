Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3330D37938
	for <lists+linux-input@lfdr.de>; Thu,  6 Jun 2019 18:12:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729535AbfFFQMW (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 6 Jun 2019 12:12:22 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:45715 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729191AbfFFQMW (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 6 Jun 2019 12:12:22 -0400
Received: by mail-pf1-f193.google.com with SMTP id s11so1780990pfm.12;
        Thu, 06 Jun 2019 09:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=8Zc8qJqb674XuWLoPig1e9WRoBoqYfsMdfDerD1Y84I=;
        b=hWozMkV01JYUjz28wuRy7Z0qFH8zGaqnld1tOMo+U4GaOm5s4ac3WzIF/yF105TzXu
         Ncfw0a2ed1CzP+sss6HMA8UGTJ+1o7CLg+4MTNqiD7oktPdu+/HjiXy40N9eNqn6lOwW
         +1BIiK1/D43/k73x2S6wUGm+q5MTVV/Ygb33OXVlEhbMgxq86cFfJ4vCxborERCA5dlr
         Lttm/Pi2itibF6CZJbzgNj9wdh3SOc9yphBA2GC6N1Zizr4/7/7MT724OCmEztigcPZb
         995iBzTfECIadcZtlG9jnaAeieC2KLU4hhUsSxvQBWTXsLyYFaeuWxCChDbrduBbBZH/
         /gYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=8Zc8qJqb674XuWLoPig1e9WRoBoqYfsMdfDerD1Y84I=;
        b=KoMBEyruTb2KHIR4Sw1ze5bzMpsbhFONopYQKbioB5WYGb0BSw2skZFQllCM7BNzNN
         i/9kzkVndJYevLOwqH5rGHhYN+/CXIeb8NvWGV8KnqEo4Pf5gzX91oacySgslZia1Ffb
         GP2WJoUI/C9EPE/J6eaqcvst8DiBTCTAIZAjn0RExPJME5PgiFtTduCSS3ymH5cQkPrd
         Zl9xU3LVqTSK4b1Jld1oX5AkJxIaBC5CwjSv8vtkV0Pv+Vk3cPbES/dPxYsZSYRgULzE
         vl0VkZYFLabn013MRh74SoUNc0vA0Qa/69+dbs9EmeZexoeLUTSzH13SPRxkjuEo6+pY
         SRoA==
X-Gm-Message-State: APjAAAU2BluWHW+8tT8Em6CS9uCkijv2XmTe4EHyZPKFHPmj5UB8ocMy
        VL+MUbqx3qmZ4DDgVYPtLDE=
X-Google-Smtp-Source: APXvYqyd/bWJhSZ+sgeAGgA3nldsQkOQqnMaAuK5ExRbXjQLzAVGgeJlCiL1GYX6yDfSKPPWtURJog==
X-Received: by 2002:a63:cc43:: with SMTP id q3mr4037399pgi.438.1559837541829;
        Thu, 06 Jun 2019 09:12:21 -0700 (PDT)
Received: from aw-bldr-10.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id j7sm7894239pjb.26.2019.06.06.09.12.20
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 06 Jun 2019 09:12:21 -0700 (PDT)
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Cc:     bjorn.andersson@linaro.org, benjamin.tissoires@redhat.com,
        dmitry.torokhov@gmail.com, jikos@kernel.org, lee.jones@linaro.org,
        robh+dt@kernel.org, mark.rutland@arm.com, agross@kernel.org,
        david.brown@linaro.org, hdegoede@redhat.com,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: [PATCH v5 0/3] Basic DT support for Lenovo Miix 630
Date:   Thu,  6 Jun 2019 09:10:55 -0700
Message-Id: <20190606161055.47089-1-jeffrey.l.hugo@gmail.com>
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
overall duplication.  Adding support for the other two devices as a
follow on should involve minimal work.

The bleeding edge work for these laptops and work in progress can be
found at https://github.com/aarch64-laptops/prebuilt

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

Jeffrey Hugo (3):
  Input: elan_i2c: Add comment about link between elan_i2c and
    hid-quirks
  HID: quirks: Refactor ELAN 400 and 401 handling
  arm64: dts: qcom: Add Lenovo Miix 630

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

