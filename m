Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BD5ABAE057
	for <lists+linux-input@lfdr.de>; Mon,  9 Sep 2019 23:45:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731906AbfIIVpC (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 9 Sep 2019 17:45:02 -0400
Received: from mail-out.m-online.net ([212.18.0.9]:57207 "EHLO
        mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726804AbfIIVpC (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 9 Sep 2019 17:45:02 -0400
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
        by mail-out.m-online.net (Postfix) with ESMTP id 46S1sl6X4fz1rJgl;
        Mon,  9 Sep 2019 23:44:59 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
        by mail.m-online.net (Postfix) with ESMTP id 46S1sl5fW3z1qqkC;
        Mon,  9 Sep 2019 23:44:59 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
        by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
        with ESMTP id Jm38tiWNoHwU; Mon,  9 Sep 2019 23:44:58 +0200 (CEST)
X-Auth-Info: Cdsv/1STBWRyEO/GHM5Cc3IizQzwFmrxnuoURXMTUFg=
Received: from localhost.localdomain (85-222-111-42.dynamic.chello.pl [85.222.111.42])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.mnet-online.de (Postfix) with ESMTPSA;
        Mon,  9 Sep 2019 23:44:58 +0200 (CEST)
From:   Lukasz Majewski <lukma@denx.de>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     linux-kernel@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Enrico Weigelt <info@metux.net>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        linux-input@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Lukasz Majewski <lukma@denx.de>
Subject: [PATCH v5 0/3] mfd: mc13xxx: Fixes and enhancements for NXP's mc34708
Date:   Mon,  9 Sep 2019 23:44:37 +0200
Message-Id: <20190909214440.30674-1-lukma@denx.de>
X-Mailer: git-send-email 2.11.0
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This patch set provides several enhancements to mc13xxx MFD family
of devices by introducing mc34708 as a separate device.

This IC has dedicated pen detection feature, which allows better
touchscreen experience.

This is the fifth version of this code (v5).
Discussion regarding previous versions can be found here:
https://lkml.org/lkml/2018/4/12/351
https://www.mail-archive.com/linux-kernel@vger.kernel.org/msg1661934.html
https://www.mail-archive.com/linux-kernel@vger.kernel.org/msg1664296.html
https://lkml.org/lkml/2019/7/17/705

Sascha Hauer (3):
  mfd: mc13xxx: Add mc34708 adc support
  input: touchscreen mc13xxx: Make platform data optional
  input: touchscreen mc13xxx: Add mc34708 support

 drivers/input/touchscreen/mc13783_ts.c | 63 ++++++++++++++---
 drivers/mfd/mc13xxx-core.c             | 98 +++++++++++++++++++++++++-
 include/linux/mfd/mc34708.h            | 37 ++++++++++
 3 files changed, 185 insertions(+), 13 deletions(-)
 create mode 100644 include/linux/mfd/mc34708.h

-- 
2.20.1

