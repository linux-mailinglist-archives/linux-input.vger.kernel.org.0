Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7643A32B4C7
	for <lists+linux-input@lfdr.de>; Wed,  3 Mar 2021 06:38:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354208AbhCCF2b (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 3 Mar 2021 00:28:31 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:13458 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1445113AbhCBW6W (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 2 Mar 2021 17:58:22 -0500
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.59])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Dqsr45Z24zjVSN;
        Wed,  3 Mar 2021 06:53:56 +0800 (CST)
Received: from SWX921481.china.huawei.com (10.126.201.99) by
 DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server id
 14.3.498.0; Wed, 3 Mar 2021 06:55:28 +0800
From:   Barry Song <song.bao.hua@hisilicon.com>
To:     <tglx@linutronix.de>, <dmitry.torokhov@gmail.com>,
        <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     <maz@kernel.org>, <gregkh@linuxfoundation.org>,
        <linuxarm@openeuler.org>, <jonathan.cameron@huawei.com>,
        Barry Song <song.bao.hua@hisilicon.com>
Subject: [PATCH v5 0/2] add IRQF_NO_AUTOEN for request_irq
Date:   Wed, 3 Mar 2021 11:49:14 +1300
Message-ID: <20210302224916.13980-1-song.bao.hua@hisilicon.com>
X-Mailer: git-send-email 2.21.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.126.201.99]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

-v5:
  * add the same check for IRQF_NO_AUTOEN in request_nmi()
  * combine a dozen of separate patches of input into one (hopefully
    this could easy the life of the maintainers)

-v4:
  * remove the irq_settings magic for NOAUTOEN with respect to
    Thomas's comment

Barry Song (2):
  genirq: add IRQF_NO_AUTOEN for request_irq
  Input: move to use request_irq by IRQF_NO_AUTOEN flag

 drivers/input/keyboard/tca6416-keypad.c  |  3 +--
 drivers/input/keyboard/tegra-kbc.c       |  5 ++---
 drivers/input/touchscreen/ar1021_i2c.c   |  5 +----
 drivers/input/touchscreen/atmel_mxt_ts.c |  5 ++---
 drivers/input/touchscreen/bu21029_ts.c   |  4 ++--
 drivers/input/touchscreen/cyttsp_core.c  |  5 ++---
 drivers/input/touchscreen/melfas_mip4.c  |  5 ++---
 drivers/input/touchscreen/mms114.c       |  4 ++--
 drivers/input/touchscreen/stmfts.c       |  3 +--
 drivers/input/touchscreen/wm831x-ts.c    |  3 +--
 drivers/input/touchscreen/zinitix.c      |  4 ++--
 include/linux/interrupt.h                |  4 ++++
 kernel/irq/manage.c                      | 11 +++++++++--
 13 files changed, 31 insertions(+), 30 deletions(-)

-- 
2.25.1

