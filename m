Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA28B369702
	for <lists+linux-input@lfdr.de>; Fri, 23 Apr 2021 18:34:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231394AbhDWQfS (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 23 Apr 2021 12:35:18 -0400
Received: from mga01.intel.com ([192.55.52.88]:32256 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229945AbhDWQfS (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 23 Apr 2021 12:35:18 -0400
IronPort-SDR: /C2K7LWhr1WOrejFVblryZcVUmz8N7fxuUbVSSSKPJZbaRc9rJ/OSWpVZQIzzl+daMaIkZarSL
 NZUoL7C5nbmg==
X-IronPort-AV: E=McAfee;i="6200,9189,9963"; a="216782520"
X-IronPort-AV: E=Sophos;i="5.82,246,1613462400"; 
   d="scan'208";a="216782520"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2021 09:34:41 -0700
IronPort-SDR: QsOHzAWUTUPUewLhgNOkCQbfj4cxIbt4u1LRRYil20jjNfnoHtP14gApgKL8UFXACbGE4XlWYX
 YHUJX/bu6GIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,246,1613462400"; 
   d="scan'208";a="618019011"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga005.fm.intel.com with ESMTP; 23 Apr 2021 09:34:36 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 9773116A; Fri, 23 Apr 2021 19:34:54 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mark Brown <broonie@kernel.org>,
        Cezary Rojewski <cezary.rojewski@intel.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org,
        alsa-devel@alsa-project.org
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        Liam Girdwood <liam.r.girdwood@linux.intel.com>,
        Jie Yang <yang.jie@linux.intel.com>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v1 03/14] spi: pxa2xx: Utilize struct device from struct ssp_device
Date:   Fri, 23 Apr 2021 19:34:26 +0300
Message-Id: <20210423163437.89306-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210423163437.89306-1-andriy.shevchenko@linux.intel.com>
References: <20210423163437.89306-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

We have a duplication of struct device in the struct driver_data,
get rid of it and reuse member from struct ssp_device instead.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/spi/spi-pxa2xx-dma.c | 12 +++++-------
 drivers/spi/spi-pxa2xx-pci.c |  1 +
 drivers/spi/spi-pxa2xx.c     | 12 +++++-------
 drivers/spi/spi-pxa2xx.h     |  4 ----
 4 files changed, 11 insertions(+), 18 deletions(-)

diff --git a/drivers/spi/spi-pxa2xx-dma.c b/drivers/spi/spi-pxa2xx-dma.c
index 3b27f356a18f..2e4a49567146 100644
--- a/drivers/spi/spi-pxa2xx-dma.c
+++ b/drivers/spi/spi-pxa2xx-dma.c
@@ -111,7 +111,7 @@ pxa2xx_spi_dma_prepare_one(struct driver_data *drv_data,
 
 	ret = dmaengine_slave_config(chan, &cfg);
 	if (ret) {
-		dev_warn(&drv_data->pdev->dev, "DMA slave config failed\n");
+		dev_warn(drv_data->ssp->dev, "DMA slave config failed\n");
 		return NULL;
 	}
 
@@ -125,7 +125,7 @@ irqreturn_t pxa2xx_spi_dma_transfer(struct driver_data *drv_data)
 
 	status = pxa2xx_spi_read(drv_data, SSSR) & drv_data->mask_sr;
 	if (status & SSSR_ROR) {
-		dev_err(&drv_data->pdev->dev, "FIFO overrun\n");
+		dev_err(drv_data->ssp->dev, "FIFO overrun\n");
 
 		dmaengine_terminate_async(drv_data->controller->dma_rx);
 		dmaengine_terminate_async(drv_data->controller->dma_tx);
@@ -145,16 +145,14 @@ int pxa2xx_spi_dma_prepare(struct driver_data *drv_data,
 
 	tx_desc = pxa2xx_spi_dma_prepare_one(drv_data, DMA_MEM_TO_DEV, xfer);
 	if (!tx_desc) {
-		dev_err(&drv_data->pdev->dev,
-			"failed to get DMA TX descriptor\n");
+		dev_err(drv_data->ssp->dev, "failed to get DMA TX descriptor\n");
 		err = -EBUSY;
 		goto err_tx;
 	}
 
 	rx_desc = pxa2xx_spi_dma_prepare_one(drv_data, DMA_DEV_TO_MEM, xfer);
 	if (!rx_desc) {
-		dev_err(&drv_data->pdev->dev,
-			"failed to get DMA RX descriptor\n");
+		dev_err(drv_data->ssp->dev, "failed to get DMA RX descriptor\n");
 		err = -EBUSY;
 		goto err_rx;
 	}
@@ -191,8 +189,8 @@ void pxa2xx_spi_dma_stop(struct driver_data *drv_data)
 int pxa2xx_spi_dma_setup(struct driver_data *drv_data)
 {
 	struct pxa2xx_spi_controller *pdata = drv_data->controller_info;
-	struct device *dev = &drv_data->pdev->dev;
 	struct spi_controller *controller = drv_data->controller;
+	struct device *dev = drv_data->ssp->dev;
 	dma_cap_mask_t mask;
 
 	dma_cap_zero(mask);
diff --git a/drivers/spi/spi-pxa2xx-pci.c b/drivers/spi/spi-pxa2xx-pci.c
index 14fc41ed2361..f60ed4c62000 100644
--- a/drivers/spi/spi-pxa2xx-pci.c
+++ b/drivers/spi/spi-pxa2xx-pci.c
@@ -239,6 +239,7 @@ static int pxa2xx_spi_pci_probe(struct pci_dev *dev,
 	spi_pdata.dma_burst_size = c->dma_burst_size ? c->dma_burst_size : 1;
 
 	ssp = &spi_pdata.ssp;
+	ssp->dev = &dev->dev;
 	ssp->phys_base = pci_resource_start(dev, 0);
 	ssp->mmio_base = pcim_iomap_table(dev)[0];
 	ssp->port_id = (c->port_id >= 0) ? c->port_id : dev->devfn;
diff --git a/drivers/spi/spi-pxa2xx.c b/drivers/spi/spi-pxa2xx.c
index 82df028c4a71..e9dddcbd92f1 100644
--- a/drivers/spi/spi-pxa2xx.c
+++ b/drivers/spi/spi-pxa2xx.c
@@ -628,7 +628,7 @@ static void int_error_stop(struct driver_data *drv_data, const char* msg)
 	pxa2xx_spi_flush(drv_data);
 	pxa2xx_spi_off(drv_data);
 
-	dev_err(&drv_data->pdev->dev, "%s\n", msg);
+	dev_err(drv_data->ssp->dev, "%s\n", msg);
 
 	drv_data->controller->cur_msg->status = -EIO;
 	spi_finalize_current_transfer(drv_data->controller);
@@ -731,8 +731,7 @@ static void handle_bad_msg(struct driver_data *drv_data)
 		pxa2xx_spi_write(drv_data, SSTO, 0);
 	write_SSSR_CS(drv_data, drv_data->clear_sr);
 
-	dev_err(&drv_data->pdev->dev,
-		"bad message state in interrupt handler\n");
+	dev_err(drv_data->ssp->dev, "bad message state in interrupt handler\n");
 }
 
 static irqreturn_t ssp_int(int irq, void *dev_id)
@@ -748,7 +747,7 @@ static irqreturn_t ssp_int(int irq, void *dev_id)
 	 * the IRQ was not for us (we shouldn't be RPM suspended when the
 	 * interrupt is enabled).
 	 */
-	if (pm_runtime_suspended(&drv_data->pdev->dev))
+	if (pm_runtime_suspended(drv_data->ssp->dev))
 		return IRQ_NONE;
 
 	/*
@@ -1158,7 +1157,7 @@ static int pxa2xx_spi_slave_abort(struct spi_controller *controller)
 	pxa2xx_spi_flush(drv_data);
 	pxa2xx_spi_off(drv_data);
 
-	dev_dbg(&drv_data->pdev->dev, "transfer aborted\n");
+	dev_dbg(drv_data->ssp->dev, "transfer aborted\n");
 
 	drv_data->controller->cur_msg->status = -EINTR;
 	spi_finalize_current_transfer(drv_data->controller);
@@ -1641,7 +1640,7 @@ static int pxa2xx_spi_fw_translate_cs(struct spi_controller *controller,
 {
 	struct driver_data *drv_data = spi_controller_get_devdata(controller);
 
-	if (has_acpi_companion(&drv_data->pdev->dev)) {
+	if (has_acpi_companion(drv_data->ssp->dev)) {
 		switch (drv_data->ssp_type) {
 		/*
 		 * For Atoms the ACPI DeviceSelection used by the Windows
@@ -1707,7 +1706,6 @@ static int pxa2xx_spi_probe(struct platform_device *pdev)
 	drv_data = spi_controller_get_devdata(controller);
 	drv_data->controller = controller;
 	drv_data->controller_info = platform_info;
-	drv_data->pdev = pdev;
 	drv_data->ssp = ssp;
 
 	controller->dev.of_node = pdev->dev.of_node;
diff --git a/drivers/spi/spi-pxa2xx.h b/drivers/spi/spi-pxa2xx.h
index ad9980ebefa6..6724d7e056ce 100644
--- a/drivers/spi/spi-pxa2xx.h
+++ b/drivers/spi/spi-pxa2xx.h
@@ -12,7 +12,6 @@
 #include <linux/errno.h>
 #include <linux/io.h>
 #include <linux/interrupt.h>
-#include <linux/platform_device.h>
 #include <linux/pxa2xx_ssp.h>
 #include <linux/scatterlist.h>
 #include <linux/sizes.h>
@@ -20,9 +19,6 @@
 #include <linux/spi/pxa2xx_spi.h>
 
 struct driver_data {
-	/* Driver model hookup */
-	struct platform_device *pdev;
-
 	/* SSP Info */
 	struct ssp_device *ssp;
 
-- 
2.30.2

