Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 80A381138A1
	for <lists+linux-input@lfdr.de>; Thu,  5 Dec 2019 01:25:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728213AbfLEAZK (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 4 Dec 2019 19:25:10 -0500
Received: from onstation.org ([52.200.56.107]:54056 "EHLO onstation.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728053AbfLEAZK (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 4 Dec 2019 19:25:10 -0500
Received: from localhost.localdomain (c-98-239-145-235.hsd1.wv.comcast.net [98.239.145.235])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: masneyb)
        by onstation.org (Postfix) with ESMTPSA id 9161D3E95C;
        Thu,  5 Dec 2019 00:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=onstation.org;
        s=default; t=1575505509;
        bh=jc1PJE+8yGFVsNBkOUuUeXIzbxW2vJhuM2IJtGofqXQ=;
        h=From:To:Cc:Subject:Date:From;
        b=gnfFmDPZTH6NNieh6XomfevdNEupKnTOxkjiSSCg8BFSL654u2I+GwDKst2kjHu+s
         LoAhkbkIiPcJcial4QUBvsnT8kR7MxfIHLNuyNnB6ggh1j4qLVTmrmjlFjZVvbD92F
         iygJW38kmuV6Rr3PbCSw7zIrNrtM3vjHtAKDUsI0=
From:   Brian Masney <masneyb@onstation.org>
To:     sboyd@kernel.org, dmitry.torokhov@gmail.com, robh+dt@kernel.org
Cc:     mark.rutland@arm.com, agross@kernel.org,
        bjorn.andersson@linaro.org, mturquette@baylibre.com,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: [PATCH 0/7] qcom: add clk-vibrator driver
Date:   Wed,  4 Dec 2019 19:24:56 -0500
Message-Id: <20191205002503.13088-1-masneyb@onstation.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This patch series adds support for the vibrator that's found on the
Nexus 5 phone. I previously added a msm-vibrator driver to the input
subsystem, however that's not the correct approach since the direct
register writes should occur from within the clk subsystem based on the
conversation at
https://lore.kernel.org/lkml/20190516085018.2207-1-masneyb@onstation.org/

So this patch series:

  - Adds support for setting the clock duty cycle to clk-rcg2.c
  - Removes the msm-vibrator driver and adds a generic clk-vibrator
    driver in its place. No one is using this driver at the moment so we
    shouldn't get any complaints.

I also included the defconfig and dts changes. Once this whole series is
deemed to be ready, it can be merged in pieces through the different
subsystems. I included everything here as one patch series so everyone
can see the complete picture of what I'm doing.

Sorry it took me awhile to get back to correcting this; was working on
other tasks on this phone.

Brian Masney (7):
  clk: qcom: add support for setting the duty cycle
  dt-bindings: Input: drop msm-vibrator in favor of clk-vibrator
  Input: drop msm-vibrator in favor of clk-vibrator driver
  dt-bindings: Input: introduce new clock vibrator bindings
  Input: introduce new clock vibrator driver
  ARM: qcom_defconfig: drop msm-vibrator in favor of clk-vibrator driver
  ARM: dts: qcom: msm8974-hammerhead: add support for vibrator

 .../bindings/input/clk-vibrator.yaml          |  60 ++++++++
 .../bindings/input/msm-vibrator.txt           |  36 -----
 .../qcom-msm8974-lge-nexus5-hammerhead.dts    |  30 ++++
 arch/arm/configs/qcom_defconfig               |   2 +-
 drivers/clk/qcom/clk-rcg.h                    |   4 +
 drivers/clk/qcom/clk-rcg2.c                   |  61 +++++++-
 drivers/input/misc/Kconfig                    |  20 +--
 drivers/input/misc/Makefile                   |   2 +-
 .../misc/{msm-vibrator.c => clk-vibrator.c}   | 138 +++++++-----------
 9 files changed, 216 insertions(+), 137 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/input/clk-vibrator.yaml
 delete mode 100644 Documentation/devicetree/bindings/input/msm-vibrator.txt
 rename drivers/input/misc/{msm-vibrator.c => clk-vibrator.c} (51%)

-- 
2.21.0

