Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0BCBE2A5BE9
	for <lists+linux-input@lfdr.de>; Wed,  4 Nov 2020 02:29:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729802AbgKDB3z (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 3 Nov 2020 20:29:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729701AbgKDB3y (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 3 Nov 2020 20:29:54 -0500
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 880FAC040203
        for <linux-input@vger.kernel.org>; Tue,  3 Nov 2020 17:29:53 -0800 (PST)
Received: by mail-pl1-x643.google.com with SMTP id z1so9462494plo.12
        for <linux-input@vger.kernel.org>; Tue, 03 Nov 2020 17:29:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aMTaSm89kT5TDRihafmXN8fpXabsdYs0qDU43+JwbS0=;
        b=fHKmoVtGYK4sREwOdOU4Lct3hnbiNwEW+GYbl98M7c1mvS5wdl8AE21fkfFF0sd0FZ
         C2PVeaBbQw/o9686zJwDajQOuToUyje3hR7IdmOUKKuOhsdEIXFfQkVk5CNd+5h2cYJj
         ANOgtGhRljNjiHSSOrTiMGFLQTcQDPiuAQ1t4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aMTaSm89kT5TDRihafmXN8fpXabsdYs0qDU43+JwbS0=;
        b=ja6c4YGq5qF+f13tpyS3r9DJHDHg7u0/3Gdn7ztSt+w/d8dR9Pla82B2DbpRlDs7TM
         hB1g98BJ3jhdzIlxzaLvWPQ5bK8NndmfvtbCzL6+w9pTyG+cR6anAqSOjFu7+rNyfxt/
         ZeLeSpFdgnT4IqGqlj3rPv0jqgPfm1qLgKknlHn2ZAcUdBOUtLby/0QnX2GsL6ATl08Y
         Sm5LkaR1/4wdtOfc0mb1jmHCxQvUf0ZIs60Akpq7xmEIPDpQq0boTHyHlEddZtC/RxeU
         c/B/XGqURFz0l+VvBIJn0DIkbjsXMzJ0pYlxGpHEEI4b+78vncuwiRTbgVMd19Pxe2vn
         NgpQ==
X-Gm-Message-State: AOAM5311vUqAVeD1dLCmaBR4Z+Z+bePdHMG4PQbhyA9Z7iz+DvWDsQma
        ha2u9TmQ/ZRogGLNgr5FdXtCBg==
X-Google-Smtp-Source: ABdhPJxCpGL3gLtUMaj65HaRL8OI22vjNZDD93pNWHBqdtvQvNhwYi5Rfdlm5Nm68IFVufqOv1Misg==
X-Received: by 2002:a17:902:654a:b029:d5:e98f:2436 with SMTP id d10-20020a170902654ab02900d5e98f2436mr27621181pln.21.1604453393066;
        Tue, 03 Nov 2020 17:29:53 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:42b0:34ff:fe3d:58e6])
        by smtp.gmail.com with ESMTPSA id m3sm347424pjv.52.2020.11.03.17.29.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2020 17:29:52 -0800 (PST)
From:   Douglas Anderson <dianders@chromium.org>
To:     jkosina@suse.cz, benjamin.tissoires@redhat.com,
        gregkh@linuxfoundation.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, swboyd@chromium.org,
        andrea@borgia.bo.it, kai.heng.feng@canonical.com,
        hdegoede@redhat.com, robh+dt@kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        Aaron Ma <aaron.ma@canonical.com>,
        Anson Huang <Anson.Huang@nxp.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Jiri Kosina <jikos@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Li Yang <leoyang.li@nxp.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michael Walle <michael@walle.cc>,
        Olof Johansson <olof@lixom.net>, Pavel Balan <admin@kryma.net>,
        Shawn Guo <shawnguo@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Will Deacon <will@kernel.org>,
        Xiaofei Tan <tanxiaofei@huawei.com>,
        You-Sheng Yang <vicamo.yang@canonical.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/4] HID: i2c-hid: Reorganize to allow supporting goodix,gt7375p
Date:   Tue,  3 Nov 2020 17:29:25 -0800
Message-Id: <20201104012929.3850691-1-dianders@chromium.org>
X-Mailer: git-send-email 2.29.1.341.ge80a0c044ae-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


The goal of this series is to support the Goodix GT7375P touchscreen.
This touchscreen is special because it has power sequencing
requirements that necessitate driving a reset GPIO.

To do this, we totally rejigger the way i2c-hid is organized so that
it's easier to jam the Goodix support in there.

This series was:
- Tested on a device that uses normal i2c-hid
- Tested on a device that pretended to have a Goodix i2c-hid device on
  it.  I don't have a device with GT7375P setup yet and the person who
  has been testing remotely for me hasn't tested this exact series.  I
  think it should still work, though.
- NOT tested on any ACPI devices (just compile tested).

There are probably still small nits, but hopefully we're getting
closer to something people like.

Changes in v4:
- Fully rejigger so ACPI and OF are full subclasses.
- ("arm64: defconfig: Update config names for i2c-hid rejigger") new for v4.
- Totally redid based on the new subclass system.

Changes in v3:
- Rework to use subclassing.
- Removed Benjamin as a maintainer.
- Fixed compatible in example.
- Updated description.
- Rework to use subclassing.

Changes in v2:
- Use a separate compatible string for this new touchscreen.
- Get timings based on the compatible string.
- ("dt-bindings: HID: i2c-hid: Introduce bindings for the Goodix GT7375P") new in v2.

Douglas Anderson (4):
  HID: i2c-hid: Reorganize so ACPI and OF are subclasses
  arm64: defconfig: Update config names for i2c-hid rejigger
  dt-bindings: HID: i2c-hid: Introduce bindings for the Goodix GT7375P
  HID: i2c-hid: Introduce goodix-i2c-hid as a subclass of i2c-hid

 .../bindings/input/goodix,gt7375p.yaml        |  63 +++++
 arch/arm64/configs/defconfig                  |   3 +-
 drivers/hid/Makefile                          |   2 +-
 drivers/hid/i2c-hid/Kconfig                   |  47 +++-
 drivers/hid/i2c-hid/Makefile                  |   6 +-
 drivers/hid/i2c-hid/i2c-hid-acpi.c            | 167 ++++++++++++
 drivers/hid/i2c-hid/i2c-hid-core.c            | 253 +++---------------
 drivers/hid/i2c-hid/i2c-hid-of-goodix.c       | 120 +++++++++
 drivers/hid/i2c-hid/i2c-hid-of.c              | 149 +++++++++++
 drivers/hid/i2c-hid/i2c-hid.h                 |  24 ++
 include/linux/platform_data/i2c-hid.h         |  41 ---
 11 files changed, 607 insertions(+), 268 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/input/goodix,gt7375p.yaml
 create mode 100644 drivers/hid/i2c-hid/i2c-hid-acpi.c
 create mode 100644 drivers/hid/i2c-hid/i2c-hid-of-goodix.c
 create mode 100644 drivers/hid/i2c-hid/i2c-hid-of.c
 delete mode 100644 include/linux/platform_data/i2c-hid.h

-- 
2.29.1.341.ge80a0c044ae-goog

