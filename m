Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EECD07C1DA
	for <lists+linux-input@lfdr.de>; Wed, 31 Jul 2019 14:43:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727404AbfGaMn4 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 31 Jul 2019 08:43:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:36142 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726467AbfGaMn4 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 31 Jul 2019 08:43:56 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 94935206B8;
        Wed, 31 Jul 2019 12:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1564577035;
        bh=qdKt8xMkWx3WVKyGM6p4kgZa2A5bUHnif0uObDGpacs=;
        h=From:To:Cc:Subject:Date:From;
        b=2PNMPi2HyAUo2pq0bnVlLzISd0g9zVsRAilNinPTip5E5cYDt4EuxnIXHElkwTvJH
         dPcH2fxP7sNNLV5xbJKld4HmAQXtZsA0TJ9OOL2zD56aMvLQcivlBKx2iiQgNAw2U7
         SBbEoWYOMqoaclJc4+S40fQvW5IGe6rMUuYu8HzU=
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     linux-kernel@vger.kernel.org,
        Richard Gong <richard.gong@linux.intel.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Borislav Petkov <bp@alien8.de>,
        Darren Hart <dvhart@infradead.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ingo Molnar <mingo@redhat.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Tony Prisk <linux@prisktech.co.nz>,
        dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org,
        linux-input@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        x86@kernel.org
Subject: [PATCH v2 00/10] drivers, provide a way to add sysfs groups easily
Date:   Wed, 31 Jul 2019 14:43:39 +0200
Message-Id: <20190731124349.4474-1-gregkh@linuxfoundation.org>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This patch originally started out just as a way for platform drivers to
easily add a sysfs group in a race-free way, but thanks to Dmitry's
patch, this series now is for all drivers in the kernel (hey, a unified
driver model works!!!)

I've only converted a few platform drivers here in this series to show
how it works, but other busses can be converted after the first patch
goes into the tree.

Here's the original 00 message, for people to get an idea of what is
going on here:

If a platform driver wants to add a sysfs group, it has to do so in a
racy way, adding it after the driver is bound.  To resolve this issue,
have the platform driver core do this for the driver, making the
individual drivers logic smaller and simpler, and solving the race at
the same time.

All of these patches depend on the first patch.  I'll take the first one
through my driver-core tree, and any subsystem maintainer can either ack
their individul patch and I will be glad to also merge it, or they can
wait until after 5.4-rc1 when the core patch hits Linus's tree and then
take it, it's up to them.

Thank to Richard Gong for the idea and the testing of the platform
driver patch and to Dmitry Torokhov for rewriting the first patch to
work well for all busses.

-----

V2 - work for all busses and not just platform drivers.


Dmitry Torokhov (1):
  driver core: add dev_groups to all drivers

Greg Kroah-Hartman (9):
  uio: uio_fsl_elbc_gpcm: convert platform driver to use dev_groups
  input: keyboard: gpio_keys: convert platform driver to use dev_groups
  input: axp20x-pek: convert platform driver to use dev_groups
  firmware: arm_scpi: convert platform driver to use dev_groups
  olpc: x01: convert platform driver to use dev_groups
  platform: x86: hp-wmi: convert platform driver to use dev_groups
  video: fbdev: wm8505fb: convert platform driver to use dev_groups
  video: fbdev: w100fb: convert platform driver to use dev_groups
  video: fbdev: sm501fb: convert platform driver to use dev_groups

 arch/x86/platform/olpc/olpc-xo1-sci.c | 17 ++++------
 drivers/base/dd.c                     | 14 ++++++++
 drivers/firmware/arm_scpi.c           |  5 +--
 drivers/input/keyboard/gpio_keys.c    | 13 ++------
 drivers/input/misc/axp20x-pek.c       | 15 ++-------
 drivers/platform/x86/hp-wmi.c         | 47 +++++++--------------------
 drivers/uio/uio_fsl_elbc_gpcm.c       | 23 +++++--------
 drivers/video/fbdev/sm501fb.c         | 37 +++++----------------
 drivers/video/fbdev/w100fb.c          | 23 ++++++-------
 drivers/video/fbdev/wm8505fb.c        | 13 ++++----
 include/linux/device.h                |  3 ++
 11 files changed, 76 insertions(+), 134 deletions(-)

-- 
2.22.0

