Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4ED22641E4C
	for <lists+linux-input@lfdr.de>; Sun,  4 Dec 2022 18:56:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229973AbiLDR4J (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 4 Dec 2022 12:56:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230198AbiLDR4J (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 4 Dec 2022 12:56:09 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A231140D2
        for <linux-input@vger.kernel.org>; Sun,  4 Dec 2022 09:56:08 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id D99CDB80B89
        for <linux-input@vger.kernel.org>; Sun,  4 Dec 2022 17:56:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E93F8C433C1;
        Sun,  4 Dec 2022 17:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1670176565;
        bh=OPmnwhlHoAvcRe56vE6iFaFZgMqbpEuwGUI5iVQn/1E=;
        h=From:To:Cc:Subject:Date:From;
        b=nOd3R02vAxNRrKnVX1lojvti6W2VvXRhULOLqY86KlTxzHr9FJlnLOCF1m38II4G3
         nj4R+BhvGzFZDjrb/jY2aTXeYaVOfw8tC/bw2wGTpavgepPxURQX+fgCIl31H1xiKQ
         HIw1vsH8x5aO8BH5k+jRIjG6Z2qwjwwnXtaCxCsO0pc8azN+x5FojejbhkqZ2VMXG8
         /vVOD9++kuNKmvVikqj70QCWufp3Y/CBDm+l2bdt4/NYHxeKw/ceLwDl8hJy5ayfE8
         H9LMiSjSSkmfSSY5cfiZM9YcylX7Yjz5vFeiEdir/bFOpC0TwVNjip3izfbZwYWkYU
         +wv66YoDDQbfw==
From:   Jonathan Cameron <jic23@kernel.org>
To:     linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Tomohiro Yoshidomi <sylph23k@gmail.com>,
        Michael Hennerich <michael.hennerich@analog.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        =?UTF-8?q?Michal=20Vok=C3=A1=C4=8D?= <michal.vokac@ysoft.com>,
        Mattijs Korpershoek <mkorpershoek@baylibre.com>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Stephan Gerhold <stephan@gerhold.net>,
        Marek Vasut <marek.vasut@gmail.com>
Subject: [PATCH 00/32] Input: Joystick keyboard switch to DEFINE_SIMPLE_DEV_PM_OPS()
Date:   Sun,  4 Dec 2022 18:08:09 +0000
Message-Id: <20221204180841.2211588-1-jic23@kernel.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Jonathan Cameron <Jonathan.Cameron@huawei.com>

As part of recent changes to the macros in linux/pm.h, the
SIMPLE_DEV_PM_OPS() macro is deprecated in favor of the comination
of DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr().
More details in the relevant commit message.

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=1a3c7bb088266fa2db017be299f91f1c1894c857

The main advantage of the new versions is that they allow the compiler
to 'see' the callbacks registered, thus avoiding the need to either
protect them with ifdef guards or to mark them __maybe_unused.
The compiler then removes the structure and the callbacks as dead code
in event of !CONFIG_PM_SLEEP.

Ultimately to clean up the old macros the change needs to be done to
all instances of the SIMPLE_DEV_PM_OPS() in the kernel. There are similar
changes to be done for runtime PM macros and more complex PM handling.
This set is just meant to switch over some of the low hanging fruit in
a bite sized chunk.

Also included at the end of this series are:
* a warning fix for pxspad
* allowing various drivers to be build with CONFIG_COMPILE_TEST.

There was one case that really is architecture specific for which I
did only a partial build test.  I pushed these out in a branch that
0-day build and it didn't see any problems.

Cc: Paul Cercueil <paul@crapouillou.net>
Cc: Tomohiro Yoshidomi <sylph23k@gmail.com>
Cc: Michael Hennerich <michael.hennerich@analog.com>
Cc: Stephen Boyd <swboyd@chromium.org>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Michal Vokáč <michal.vokac@ysoft.com>
Cc: Mattijs Korpershoek <mkorpershoek@baylibre.com>
Cc: Marco Felsch <m.felsch@pengutronix.de>
Cc: Stephan Gerhold <stephan@gerhold.net>
Cc: Marek Vasut <marek.vasut@gmail.com>

Jonathan Cameron (32):
  Input: pxspad - switch to DEFINE_SIMPLE_DEV_PM_OPS() and
    pm_sleep_ptr()
  Input: adp5589-keys - switch to DEFINE_SIMPLE_DEV_PM_OPS() and
    pm_sleep_ptr()
  Input: cros-ec-keyb - switch to DEFINE_SIMPLE_DEV_PM_OPS() and
    pm_sleep_ptr()
  Input: cypress-sf - switch to DEFINE_SIMPLE_DEV_PM_OPS() and
    pm_sleep_ptr()
  Input: ep39xx-keypad - switch to DEFINE_SIMPLE_DEV_PM_OPS() and
    pm_sleep_ptr()
  Input: gpio-keys - switch to DEFINE_SIMPLE_DEV_PM_OPS() and
    pm_sleep_ptr()
  Input: ipaq-micro-keys - switch to DEFINE_SIMPLE_DEV_PM_OPS() and
    pm_sleep_ptr()
  Input: mpr121-touchkey - switch to DEFINE_SIMPLE_DEV_PM_OPS() and
    pm_sleep_ptr()
  Input: mtk-pmic-keys - switch to DEFINE_SIMPLE_DEV_PM_OPS() and
    pm_sleep_ptr()
  Input: qt1050 - switch to DEFINE_SIMPLE_DEV_PM_OPS() and
    pm_sleep_ptr()
  Input: spear-keyboard - switch to DEFINE_SIMPLE_DEV_PM_OPS() and
    pm_sleep_ptr()
  Input: tm2-touchkey - switch to DEFINE_SIMPLE_DEV_PM_OPS() and
    pm_sleep_ptr()
  Input: lm8323 - switch to DEFINE_SIMPLE_DEV_PM_OPS() and
    pm_sleep_ptr()
  Input: lpc32xx-keys - switch to DEFINE_SIMPLE_DEV_PM_OPS() and
    pm_sleep_ptr()
  Input: matrix-keypad - switch to DEFINE_SIMPLE_DEV_PM_OPS() and
    pm_sleep_ptr()
  Input: max7359-keypad - switch to DEFINE_SIMPLE_DEV_PM_OPS() and
    pm_sleep_ptr()
  Input: mcs-touchkey - switch to DEFINE_SIMPLE_DEV_PM_OPS() and
    pm_sleep_ptr()
  Input: nomadik-ske-keypad - switch to DEFINE_SIMPLE_DEV_PM_OPS() and
    pm_sleep_ptr()
  Input: pmic8xxx-keypad - switch to DEFINE_SIMPLE_DEV_PM_OPS() and
    pm_sleep_ptr()
  Input: pxa27x_keypad - switch to DEFINE_SIMPLE_DEV_PM_OPS() and
    pm_sleep_ptr()
  Input: qt1070 - switch to DEFINE_SIMPLE_DEV_PM_OPS() and
    pm_sleep_ptr()
  Input: sh-keysc - switch to DEFINE_SIMPLE_DEV_PM_OPS() and
    pm_sleep_ptr()
  Input: st-keyscan - switch to DEFINE_SIMPLE_DEV_PM_OPS() and
    pm_sleep_ptr()
  Input: tc3589x - switch to DEFINE_SIMPLE_DEV_PM_OPS() and
    pm_sleep_ptr()
  Input: tca6416-keypad - switch to DEFINE_SIMPLE_DEV_PM_OPS() and
    pm_sleep_ptr()
  Input: tegra-kbc - switch to DEFINE_SIMPLE_DEV_PM_OPS() and
    pm_sleep_ptr()
  Input: tegra-kbc - allow build with COMPILE_TEST
  Input: spear-keyboard - improve build coverage using COMPILE_TEST
  Input: pxa27xx-keypad - allow build with COMPILE_TEST
  Input: nomadik-ske-keypad - allow building with COMPILE_TEST
  Input: lpc32xx - allow building with COMPILE_TEST
  Input: pxspad: Fix unused data warning when force feedback not
    enabled.

 drivers/input/joystick/psxpad-spi.c         |  9 ++++++---
 drivers/input/keyboard/Kconfig              | 10 +++++-----
 drivers/input/keyboard/adp5589-keys.c       |  8 ++++----
 drivers/input/keyboard/cros_ec_keyb.c       |  6 +++---
 drivers/input/keyboard/cypress-sf.c         | 10 +++++-----
 drivers/input/keyboard/ep93xx_keypad.c      | 10 +++++-----
 drivers/input/keyboard/gpio_keys.c          |  8 ++++----
 drivers/input/keyboard/ipaq-micro-keys.c    | 10 +++++-----
 drivers/input/keyboard/lm8323.c             |  6 ++----
 drivers/input/keyboard/lpc32xx-keys.c       |  8 +++-----
 drivers/input/keyboard/matrix_keypad.c      |  8 +++-----
 drivers/input/keyboard/max7359_keypad.c     |  6 ++----
 drivers/input/keyboard/mcs_touchkey.c       |  8 +++-----
 drivers/input/keyboard/mpr121_touchkey.c    |  8 ++++----
 drivers/input/keyboard/mtk-pmic-keys.c      | 10 +++++-----
 drivers/input/keyboard/nomadik-ske-keypad.c |  8 +++-----
 drivers/input/keyboard/pmic8xxx-keypad.c    |  8 +++-----
 drivers/input/keyboard/pxa27x_keypad.c      |  8 +++-----
 drivers/input/keyboard/qt1050.c             |  8 ++++----
 drivers/input/keyboard/qt1070.c             |  6 ++----
 drivers/input/keyboard/sh_keysc.c           |  8 +++-----
 drivers/input/keyboard/spear-keyboard.c     |  9 +++++----
 drivers/input/keyboard/st-keyscan.c         |  7 +++----
 drivers/input/keyboard/tc3589x-keypad.c     |  8 +++-----
 drivers/input/keyboard/tca6416-keypad.c     |  8 +++-----
 drivers/input/keyboard/tegra-kbc.c          |  7 +++----
 drivers/input/keyboard/tm2-touchkey.c       | 10 +++++-----
 27 files changed, 99 insertions(+), 121 deletions(-)

-- 
2.38.1

