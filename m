Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C1FF26618C
	for <lists+linux-input@lfdr.de>; Fri, 12 Jul 2019 00:24:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728474AbfGKWYI (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 11 Jul 2019 18:24:08 -0400
Received: from mail-out.m-online.net ([212.18.0.10]:52290 "EHLO
        mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726207AbfGKWYI (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 11 Jul 2019 18:24:08 -0400
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
        by mail-out.m-online.net (Postfix) with ESMTP id 45l9ZZ1D5Bz1rGSC;
        Fri, 12 Jul 2019 00:24:06 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
        by mail.m-online.net (Postfix) with ESMTP id 45l9ZZ0Lwtz1qqkC;
        Fri, 12 Jul 2019 00:24:06 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
        by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
        with ESMTP id eWR6m9qiSq97; Fri, 12 Jul 2019 00:24:04 +0200 (CEST)
X-Auth-Info: U5EJGg1A68vYHOMXUFHFoFMuag3MFYDQR2/iDcbPLeM=
Received: from localhost.localdomain (85-222-111-42.dynamic.chello.pl [85.222.111.42])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.mnet-online.de (Postfix) with ESMTPSA;
        Fri, 12 Jul 2019 00:24:04 +0200 (CEST)
From:   Lukasz Majewski <lukma@denx.de>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     linux-kernel@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Enrico Weigelt <info@metux.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        linux-input@vger.kernel.org, Lukasz Majewski <lukma@denx.de>
Subject: [PATCH v2 0/3] mfd: mc13xxx: Fixes and enhancements for NXP's mc34708
Date:   Fri, 12 Jul 2019 00:23:43 +0200
Message-Id: <20190711222346.5245-1-lukma@denx.de>
X-Mailer: git-send-email 2.11.0
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This patch set provides several enhancements to mc13xxx MFD family
of devices by introducing mc34708 as a separate device.

This IC has dedicated pen detection feature, which allows better
touchscreen experience.

This is the seconf version of this code (v2).
Discussion regarding v1 can be found here:
https://lkml.org/lkml/2018/4/12/351
https://www.mail-archive.com/linux-kernel@vger.kernel.org/msg1661934.html
https://www.mail-archive.com/linux-kernel@vger.kernel.org/msg1664296.html

Sascha Hauer (3):
  mfd: mc13xxx: Add mc34708 adc support
  input: touchscreen mc13xxx: Make platform data optional
  input: touchscreen mc13xxx: Add mc34708 support

 drivers/input/touchscreen/mc13783_ts.c |  74 ++++++++++++++++++++----
 drivers/mfd/mc13xxx-core.c             | 102 ++++++++++++++++++++++++++++++++-
 drivers/mfd/mc13xxx.h                  |   3 +
 include/linux/mfd/mc34708.h            |  37 ++++++++++++
 4 files changed, 204 insertions(+), 12 deletions(-)
 create mode 100644 include/linux/mfd/mc34708.h

-- 
2.11.0

