Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA8992EE8FB
	for <lists+linux-input@lfdr.de>; Thu,  7 Jan 2021 23:45:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727624AbhAGWpX (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 7 Jan 2021 17:45:23 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:10036 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726738AbhAGWpX (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 7 Jan 2021 17:45:23 -0500
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.60])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4DBh9D1fYbzj4WZ;
        Fri,  8 Jan 2021 06:43:44 +0800 (CST)
Received: from SWX921481.china.huawei.com (10.126.201.115) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.498.0; Fri, 8 Jan 2021 06:44:34 +0800
From:   Barry Song <song.bao.hua@hisilicon.com>
To:     <dmitry.torokhov@gmail.com>, <tglx@linutronix.de>,
        <maz@kernel.org>, <gregkh@linuxfoundation.org>,
        <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     <linuxarm@openeuler.org>, Barry Song <song.bao.hua@hisilicon.com>
Subject: [PATCH v3 00/12] add IRQF_NO_AUTOEN for request_irq
Date:   Fri, 8 Jan 2021 11:39:14 +1300
Message-ID: <20210107223926.35284-1-song.bao.hua@hisilicon.com>
X-Mailer: git-send-email 2.21.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.126.201.115]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This patchset added IRQF_NO_AUTOEN for request_irq() and converted
drivers/input to this new API.
Other drivers will be handled afterwards.

-v3:
  added examples with respect to Greg's comment

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
 include/linux/interrupt.h                |  3 +++
 kernel/irq/manage.c                      |  8 ++++++++
 kernel/irq/settings.h                    | 10 ++++++++++
 14 files changed, 39 insertions(+), 28 deletions(-)

-- 
2.25.1

