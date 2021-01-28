Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B13E0308133
	for <lists+linux-input@lfdr.de>; Thu, 28 Jan 2021 23:43:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231199AbhA1WmH (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 28 Jan 2021 17:42:07 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:12347 "EHLO
        szxga07-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229828AbhA1WmF (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 28 Jan 2021 17:42:05 -0500
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.60])
        by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4DRb5L6sdhz7cTV;
        Fri, 29 Jan 2021 06:40:06 +0800 (CST)
Received: from SWX921481.china.huawei.com (10.126.203.74) by
 DGGEMS405-HUB.china.huawei.com (10.3.19.205) with Microsoft SMTP Server id
 14.3.498.0; Fri, 29 Jan 2021 06:41:12 +0800
From:   Barry Song <song.bao.hua@hisilicon.com>
To:     <tglx@linutronix.de>, <dmitry.torokhov@gmail.com>,
        <maz@kernel.org>, <gregkh@linuxfoundation.org>,
        <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     <linuxarm@openeuler.org>, Barry Song <song.bao.hua@hisilicon.com>
Subject: [PATCH v4 00/12] add IRQF_NO_AUTOEN for request_irq
Date:   Fri, 29 Jan 2021 11:35:26 +1300
Message-ID: <20210128223538.20272-1-song.bao.hua@hisilicon.com>
X-Mailer: git-send-email 2.21.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.126.203.74]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This patchset added IRQF_NO_AUTOEN for request_irq() and converted
drivers/input to this new API.
Other drivers will be handled afterwards.

-v4:
  remove the irq_settings magic for NOAUTOEN

Barry Song (12):
  genirq: add IRQF_NO_AUTOEN for request_irq
  Input: ar1021 - request_irq by IRQF_NO_AUTOEN and remove disable_irq
  Input: atmel_mxt_ts - request_irq by IRQF_NO_AUTOEN and remove
    disable_irq
  Input: melfas_mip4 - request_irq by IRQF_NO_AUTOEN and remove
    disable_irq
  Input: bu21029_ts - request_irq by IRQF_NO_AUTOEN and remove
    irq_set_status_flags
  Input: stmfts - request_irq by IRQF_NO_AUTOEN and remove
    irq_set_status_flags
  Input: zinitix - request_irq by IRQF_NO_AUTOEN and remove
    irq_set_status_flags
  Input: mms114 - request_irq by IRQF_NO_AUTOEN and remove disable_irq
  Input: wm831x-ts - request_irq by IRQF_NO_AUTOEN and remove
    disable_irq
  Input: cyttsp - request_irq by IRQF_NO_AUTOEN and remove disable_irq
  Input: tegra-kbc - request_irq by IRQF_NO_AUTOEN and remove
    disable_irq
  Input: tca6416-keypad - request_irq by IRQF_NO_AUTOEN and remove
    disable_irq

 drivers/input/keyboard/tca6416-keypad.c  | 3 +--
 drivers/input/keyboard/tegra-kbc.c       | 5 ++---
 drivers/input/touchscreen/ar1021_i2c.c   | 5 +----
 drivers/input/touchscreen/atmel_mxt_ts.c | 5 ++---
 drivers/input/touchscreen/bu21029_ts.c   | 4 ++--
 drivers/input/touchscreen/cyttsp_core.c  | 5 ++---
 drivers/input/touchscreen/melfas_mip4.c  | 5 ++---
 drivers/input/touchscreen/mms114.c       | 4 ++--
 drivers/input/touchscreen/stmfts.c       | 3 +--
 drivers/input/touchscreen/wm831x-ts.c    | 3 +--
 drivers/input/touchscreen/zinitix.c      | 4 ++--
 include/linux/interrupt.h                | 3 +++
 kernel/irq/manage.c                      | 8 +++++++-
 13 files changed, 28 insertions(+), 29 deletions(-)

-- 
2.25.1

