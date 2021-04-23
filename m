Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BEF2E36971B
	for <lists+linux-input@lfdr.de>; Fri, 23 Apr 2021 18:35:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243226AbhDWQf2 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 23 Apr 2021 12:35:28 -0400
Received: from mga01.intel.com ([192.55.52.88]:32278 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231504AbhDWQf0 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 23 Apr 2021 12:35:26 -0400
IronPort-SDR: LEbJDbCM5TRNqe9YHNnq9EefY024uthkyK0DSNyFVuljC3SuWrhkVeTD8CrmThdiyGsixZDDaR
 u4WUUAxlRikw==
X-IronPort-AV: E=McAfee;i="6200,9189,9963"; a="216782558"
X-IronPort-AV: E=Sophos;i="5.82,246,1613462400"; 
   d="scan'208";a="216782558"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2021 09:34:48 -0700
IronPort-SDR: ZfNVxrOLgu95YdAIHQN5YDKnzDgAu+eRebKmZAfdwpq0Q/vM9f60nBp2doWFT8LrSnx1HEGvl0
 z3AAXHeuU0gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,246,1613462400"; 
   d="scan'208";a="424290615"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga007.jf.intel.com with ESMTP; 23 Apr 2021 09:34:44 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 45F3717E; Fri, 23 Apr 2021 19:35:00 +0300 (EEST)
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
Subject: [PATCH v1 14/14] spi: pxa2xx: Introduce special type for Merrifield SPIs
Date:   Fri, 23 Apr 2021 19:34:37 +0300
Message-Id: <20210423163437.89306-14-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210423163437.89306-1-andriy.shevchenko@linux.intel.com>
References: <20210423163437.89306-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Intel Merrifield SPI is actually more closer to PXA3xx. It has extended FIFO
(32 bytes) and additional registers to get or set FIFO thresholds.

Introduce new type for Intel Merrifield SPI host controllers and handle bigger
FIFO size.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/spi/spi-pxa2xx-pci.c   |  2 +-
 drivers/spi/spi-pxa2xx.c       | 32 +++++++++++++++++++++++++++++---
 include/linux/spi/pxa2xx_ssp.h | 16 ++++++++++++++++
 3 files changed, 46 insertions(+), 4 deletions(-)

diff --git a/drivers/spi/spi-pxa2xx-pci.c b/drivers/spi/spi-pxa2xx-pci.c
index 5af0a3fbc1b0..5df6e11b345d 100644
--- a/drivers/spi/spi-pxa2xx-pci.c
+++ b/drivers/spi/spi-pxa2xx-pci.c
@@ -179,7 +179,7 @@ static struct pxa_spi_info spi_info_configs[] = {
 		.rx_param = &bsw2_rx_param,
 	},
 	[PORT_MRFLD] = {
-		.type = PXA27x_SSP,
+		.type = MRFLD_SSP,
 		.max_clk_rate = 25000000,
 		.setup = mrfld_spi_setup,
 	},
diff --git a/drivers/spi/spi-pxa2xx.c b/drivers/spi/spi-pxa2xx.c
index 5a4f808eefde..313095bfa7dd 100644
--- a/drivers/spi/spi-pxa2xx.c
+++ b/drivers/spi/spi-pxa2xx.c
@@ -200,6 +200,11 @@ static bool is_mmp2_ssp(const struct driver_data *drv_data)
 	return drv_data->ssp_type == MMP2_SSP;
 }
 
+static bool is_mrfld_ssp(const struct driver_data *drv_data)
+{
+	return drv_data->ssp_type == MRFLD_SSP;
+}
+
 static void pxa2xx_spi_update(const struct driver_data *drv_data, u32 reg, u32 mask, u32 value)
 {
 	if ((pxa2xx_spi_read(drv_data, reg) & mask) != value)
@@ -1087,6 +1092,15 @@ static int pxa2xx_spi_transfer_one(struct spi_controller *controller,
 		pxa2xx_spi_update(drv_data, SSITF, GENMASK(15, 0), chip->lpss_tx_threshold);
 	}
 
+	if (is_mrfld_ssp(drv_data)) {
+		u32 thresh = 0;
+
+		thresh |= SFIFOTT_RxThresh(chip->lpss_rx_threshold);
+		thresh |= SFIFOTT_TxThresh(chip->lpss_tx_threshold);
+
+		pxa2xx_spi_update(drv_data, SFIFOTT, 0xffffffff, thresh);
+	}
+
 	if (is_quark_x1000_ssp(drv_data))
 		pxa2xx_spi_update(drv_data, DDS_RATE, GENMASK(23, 0), chip->dds_rate);
 
@@ -1253,6 +1267,11 @@ static int setup(struct spi_device *spi)
 		tx_hi_thres = 0;
 		rx_thres = RX_THRESH_QUARK_X1000_DFLT;
 		break;
+	case MRFLD_SSP:
+		tx_thres = TX_THRESH_MRFLD_DFLT;
+		tx_hi_thres = 0;
+		rx_thres = RX_THRESH_MRFLD_DFLT;
+		break;
 	case CE4100_SSP:
 		tx_thres = TX_THRESH_CE4100_DFLT;
 		tx_hi_thres = 0;
@@ -1328,9 +1347,16 @@ static int setup(struct spi_device *spi)
 		chip->cr1 |= SSCR1_SPH;
 	}
 
-	chip->lpss_rx_threshold = SSIRF_RxThresh(rx_thres);
-	chip->lpss_tx_threshold = SSITF_TxLoThresh(tx_thres)
-				| SSITF_TxHiThresh(tx_hi_thres);
+	if (is_lpss_ssp(drv_data)) {
+		chip->lpss_rx_threshold = SSIRF_RxThresh(rx_thres);
+		chip->lpss_tx_threshold = SSITF_TxLoThresh(tx_thres) |
+					  SSITF_TxHiThresh(tx_hi_thres);
+	}
+
+	if (is_mrfld_ssp(drv_data)) {
+		chip->lpss_rx_threshold = rx_thres;
+		chip->lpss_tx_threshold = tx_thres;
+	}
 
 	/* set dma burst and threshold outside of chip_info path so that if
 	 * chip_info goes away after setting chip->enable_dma, the
diff --git a/include/linux/spi/pxa2xx_ssp.h b/include/linux/spi/pxa2xx_ssp.h
index fdfbe17e15f4..2b21bc1f3c73 100644
--- a/include/linux/spi/pxa2xx_ssp.h
+++ b/include/linux/spi/pxa2xx_ssp.h
@@ -183,6 +183,21 @@ struct device_node;
 #define SSACD_ACPS(x)		((x) << 4)	/* Audio clock PLL select */
 #define SSACD_SCDX8		BIT(7)		/* SYSCLK division ratio select */
 
+/* Intel Merrifield SSP */
+#define SFIFOL			0x68		/* FIFO level */
+#define SFIFOTT			0x6c		/* FIFO trigger threshold */
+
+#define RX_THRESH_MRFLD_DFLT	16
+#define TX_THRESH_MRFLD_DFLT	16
+
+#define SFIFOL_TFL_MASK		GENMASK(15, 0)	/* Transmit FIFO Level mask */
+#define SFIFOL_RFL_MASK		GENMASK(31, 16)	/* Receive FIFO Level mask */
+
+#define SFIFOTT_TFT		GENMASK(15, 0)	/* Transmit FIFO Threshold (mask) */
+#define SFIFOTT_TxThresh(x)	(((x) - 1) << 0)	/* TX FIFO trigger threshold / level */
+#define SFIFOTT_RFT		GENMASK(31, 16)	/* Receive FIFO Threshold (mask) */
+#define SFIFOTT_RxThresh(x)	(((x) - 1) << 16)	/* RX FIFO trigger threshold / level */
+
 /* LPSS SSP */
 #define SSITF			0x44		/* TX FIFO trigger level */
 #define SSITF_TxHiThresh(x)	(((x) - 1) << 0)
@@ -205,6 +220,7 @@ enum pxa_ssp_type {
 	MMP2_SSP,
 	PXA910_SSP,
 	CE4100_SSP,
+	MRFLD_SSP,
 	QUARK_X1000_SSP,
 	LPSS_LPT_SSP, /* Keep LPSS types sorted with lpss_platforms[] */
 	LPSS_BYT_SSP,
-- 
2.30.2

