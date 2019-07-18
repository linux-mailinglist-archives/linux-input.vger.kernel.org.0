Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 01EB56C4CC
	for <lists+linux-input@lfdr.de>; Thu, 18 Jul 2019 04:08:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727851AbfGRCH0 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 17 Jul 2019 22:07:26 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:2676 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727541AbfGRCH0 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 17 Jul 2019 22:07:26 -0400
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id 615E2D74EC604C7DB965;
        Thu, 18 Jul 2019 10:07:24 +0800 (CST)
Received: from localhost (10.133.213.239) by DGGEMS408-HUB.china.huawei.com
 (10.3.19.208) with Microsoft SMTP Server id 14.3.439.0; Thu, 18 Jul 2019
 10:07:18 +0800
From:   YueHaibing <yuehaibing@huawei.com>
To:     <dmitry.torokhov@gmail.com>, <hsweeten@visionengravers.com>,
        <robh@kernel.org>, <arnd@arndb.de>, <ronald@innovation.ch>,
        <andriy.shevchenko@linux.intel.com>
CC:     <linux-kernel@vger.kernel.org>, <linux-input@vger.kernel.org>,
        YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH] Input: applespi: Fix build error without CONFIG_PCI
Date:   Thu, 18 Jul 2019 10:06:54 +0800
Message-ID: <20190718020654.39860-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.133.213.239]
X-CFilter-Loop: Reflected
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

If CONFIG_KEYBOARD_APPLESPI is set to y, but
CONFIG_PCI is not set, building will fails:

drivers/spi/spi-pxa2xx-pci.c: In function pxa2xx_spi_pci_probe:
drivers/spi/spi-pxa2xx-pci.c:208:8: error: implicit declaration of function pcim_enable_device;
 did you mean pci_enable_device? [-Werror=implicit-function-declaration]
  ret = pcim_enable_device(dev);
        ^~~~~~~~~~~~~~~~~~
        pci_enable_device
drivers/spi/spi-pxa2xx-pci.c:239:8: error: implicit declaration of function pci_alloc_irq_vectors;
 did you mean pci_alloc_consistent? [-Werror=implicit-function-declaration]
  ret = pci_alloc_irq_vectors(dev, 1, 1, PCI_IRQ_ALL_TYPES);
        ^~~~~~~~~~~~~~~~~~~~~

Make CONFIG_KEYBOARD_APPLESPI depends on CONFIG_PCI
to fix this.

Reported-by: Hulk Robot <hulkci@huawei.com>
Fixes: b426ac045209 ("Input: add Apple SPI keyboard and trackpad driver")
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/input/keyboard/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/keyboard/Kconfig b/drivers/input/keyboard/Kconfig
index dd934c4..fefcc46 100644
--- a/drivers/input/keyboard/Kconfig
+++ b/drivers/input/keyboard/Kconfig
@@ -74,7 +74,7 @@ config ATARI_KBD_CORE
 config KEYBOARD_APPLESPI
 	tristate "Apple SPI keyboard and trackpad"
 	depends on ACPI && EFI
-	depends on SPI
+	depends on SPI && PCI
 	depends on X86 || COMPILE_TEST
 	imply SPI_PXA2XX
 	imply SPI_PXA2XX_PCI
-- 
2.7.4


