Return-Path: <linux-input+bounces-7064-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 12B7D98FFF9
	for <lists+linux-input@lfdr.de>; Fri,  4 Oct 2024 11:41:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C792F282EF9
	for <lists+linux-input@lfdr.de>; Fri,  4 Oct 2024 09:41:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 892C314A60F;
	Fri,  4 Oct 2024 09:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZN5fD5Uv"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6B9014A0A3;
	Fri,  4 Oct 2024 09:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728034885; cv=none; b=RAUcai5gPnq38btMKvCT9YN8aBq78ChsPUa8oy7R9OOIwzYcHlykLvqh4fE5i6SKGNamEDGVlpgBCZl8vOQeuTA3JrGdJypOHNU6o6MXO6vhLx20Hkfif98xK1hogKuO0DUHbaLxSqheIoGkpRuyc7jbUaqTX0fXeFtiIPyD5tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728034885; c=relaxed/simple;
	bh=9JBueVhaBkpgkhF1OcfvWQoSNbiQ3qimPgMmeqj0X2s=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=DCbniYXiFz5Guxk2gSAN4uwIIC1IDJBD248Jlnnx+FqnQrxU6IBWFjuJadpkdyi7R9pT++/fpu9xaCRjxAE0LSFrBq2mBPrbyVgEkFCsxmHdu1633+FSDQtLLelpjzxctDxVQoD4jIjmTTqkRLosBCZW1x2WfObBIiL8yztmww4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZN5fD5Uv; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728034883; x=1759570883;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=9JBueVhaBkpgkhF1OcfvWQoSNbiQ3qimPgMmeqj0X2s=;
  b=ZN5fD5UvofC92t4L7UgTccFeBnkHKA4gW+QJZKHaDL/Ano8dChLMzHj8
   DkF/dN2Vj+x+qzuau8Tuho/fonOPuXsa252J14m4t8xs5u4sI783CfUDp
   RmkjsUvf6KOyaOMd3ISD5i7SWqDoVtj+sLtkmluGnn1JFKCkQVy7vpdUu
   teXDzmbZGzQ0QQzu/2zQWTPky/ApW9GD7Pbtzb3CDQUm/T3ZxB4YuG9L5
   e/6pa+axnl1/QnKp0fVDyqPMAeRYzyyBzIX0rzoY9eBjq0xROoVFXGgSt
   x4HvLJkT2uDXvchyE/FJ+pNclyTQJgv5fCJ4j6rRzprudioXlowxQl28i
   Q==;
X-CSE-ConnectionGUID: oGm5s0bRQC6abTGVTAGACw==
X-CSE-MsgGUID: L2lEVHpdQzSt00kWYMSdkA==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="37856206"
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; 
   d="scan'208";a="37856206"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2024 02:41:22 -0700
X-CSE-ConnectionGUID: 6TVz6s3zSQ+n/m4bpUPilQ==
X-CSE-MsgGUID: Q02umchTRxeaAG2zUQHmEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; 
   d="scan'208";a="74331918"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2024 02:41:13 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 7CFEE11F727;
	Fri,  4 Oct 2024 12:41:11 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1sweoB-000TUP-1R;
	Fri, 04 Oct 2024 12:41:11 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-bluetooth@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	dmaengine@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	amd-gfx@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-i2c@vger.kernel.org,
	linux-i3c@lists.infradead.org,
	linux-iio@vger.kernel.org,
	linux-input@vger.kernel.org,
	patches@opensource.cirrus.com,
	iommu@lists.linux.dev,
	imx@lists.linux.dev,
	linux-mediatek@lists.infradead.org,
	linux-media@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	netdev@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-pwm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-usb@vger.kernel.org,
	linux-serial@vger.kernel.org,
	greybus-dev@lists.linaro.org,
	asahi@lists.linux.dev
Cc: laurent.pinchart@ideasonboard.com,
	rafael@kernel.org,
	Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: [PATCH 00/51] treewide: Switch to __pm_runtime_put_autosuspend()
Date: Fri,  4 Oct 2024 12:41:01 +0300
Message-Id: <20241004094101.113349-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello everyone,

This set will switch the users of pm_runtime_put_autosuspend() to
__pm_runtime_put_autosuspend() while the former will soon be re-purposed
to include a call to pm_runtime_mark_last_busy(). The two are almost
always used together, apart from bugs which are likely common. Going
forward, most new users should be using pm_runtime_put_autosuspend().

Once this conversion is done and pm_runtime_put_autosuspend() re-purposed,
I'll post another set to merge the calls to __pm_runtime_put_autosuspend()
and pm_runtime_mark_last_busy().

The diff in these patches have been generated using the following
Coccinelle script (besides a manual change in
drivers/iio/magnetometer/af8133j.c):

----------8<-------------------
@@
expression E1;

@@

- pm_runtime_put_autosuspend(E1)
+ __pm_runtime_put_autosuspend(E1)
----------8<-------------------

These patches are on top of today's linux-next (i.e. next-20241004).

Sakari Ailus (51):
  accel/ivpu: Switch to __pm_runtime_put_autosuspend()
  bluetooth: Switch to __pm_runtime_put_autosuspend()
  bus: sunxi-rsb: Switch to __pm_runtime_put_autosuspend()
  hwrng: Switch to __pm_runtime_put_autosuspend()
  clk: Switch to __pm_runtime_put_autosuspend()
  crypto: Switch to __pm_runtime_put_autosuspend()
  dmaengine: Switch to __pm_runtime_put_autosuspend()
  gpio: Switch to __pm_runtime_put_autosuspend()
  drm/amd: Switch to __pm_runtime_put_autosuspend()
  drm/nouveau: Switch to __pm_runtime_put_autosuspend()
  drm/radeon: Switch to __pm_runtime_put_autosuspend()
  drm/panfrost: Switch to __pm_runtime_put_autosuspend()
  drivers: drm: Switch to __pm_runtime_put_autosuspend()
  HSI: omap_ssi_port: Switch to __pm_runtime_put_autosuspend()
  stm class: Switch to __pm_runtime_put_autosuspend()
  i2c: Switch to __pm_runtime_put_autosuspend()
  i3c: master: svc: Switch to __pm_runtime_put_autosuspend()
  i3c: dw: Switch to __pm_runtime_put_autosuspend()
  iio: Switch to __pm_runtime_put_autosuspend()
  Input: omap4-keypad: Switch to __pm_runtime_put_autosuspend()
  Input: cs40l50: Switch to __pm_runtime_put_autosuspend()
  iommu/arm-smmu: Switch to __pm_runtime_put_autosuspend()
  irqchip/imx-irqsteer: Switch to __pm_runtime_put_autosuspend()
  mailbox: mtk-cmdq-mailbox: Switch to __pm_runtime_put_autosuspend()
  media: Switch to __pm_runtime_put_autosuspend()
  mfd: Switch to __pm_runtime_put_autosuspend()
  mei: Switch to __pm_runtime_put_autosuspend()
  mmc: Switch to __pm_runtime_put_autosuspend()
  mtd: rawnand: gpmi: Switch to __pm_runtime_put_autosuspend()
  net: Switch to __pm_runtime_put_autosuspend()
  nfc: trf7970a: Switch to __pm_runtime_put_autosuspend()
  PCI/portdrv: Switch to __pm_runtime_put_autosuspend()
  phy: motorola: phy-mapphone-mdm6600: Switch to
    __pm_runtime_put_autosuspend()
  phy: ti: phy-twl4030-usb: Switch to __pm_runtime_put_autosuspend()
  power: Switch to __pm_runtime_put_autosuspend()
  pwm: img: Switch to __pm_runtime_put_autosuspend()
  regulator: stm32-vrefbuf: Switch to __pm_runtime_put_autosuspend()
  remoteproc: omap: Switch to __pm_runtime_put_autosuspend()
  slimbus: Switch to __pm_runtime_put_autosuspend()
  soundwire: Switch to __pm_runtime_put_autosuspend()
  spi: Switch to __pm_runtime_put_autosuspend()
  staging: Switch to __pm_runtime_put_autosuspend()
  thunderbolt: Switch to __pm_runtime_put_autosuspend()
  serial: Switch to __pm_runtime_put_autosuspend()
  usb: Switch to __pm_runtime_put_autosuspend()
  w1: omap-hdq: Switch to __pm_runtime_put_autosuspend()
  staging: greybus: Switch to __pm_runtime_put_autosuspend()
  ALSA: hda: Switch to __pm_runtime_put_autosuspend()
  ASoC: Switch to __pm_runtime_put_autosuspend()
  ALSA: intel_hdmi: Switch to __pm_runtime_put_autosuspend()
  soc: apple: mailbox: Switch to __pm_runtime_put_autosuspend()

 drivers/accel/ivpu/ivpu_drv.c                 |   2 +-
 drivers/accel/ivpu/ivpu_pm.c                  |   8 +-
 drivers/bluetooth/btmtksdio.c                 |   2 +-
 drivers/bluetooth/hci_bcm.c                   |   6 +-
 drivers/bluetooth/hci_h5.c                    |   4 +-
 drivers/bluetooth/hci_intel.c                 |   6 +-
 drivers/bus/sunxi-rsb.c                       |   4 +-
 drivers/char/hw_random/cctrng.c               |   2 +-
 drivers/char/hw_random/omap3-rom-rng.c        |   2 +-
 drivers/clk/imx/clk-imx8qxp-lpcg.c            |   2 +-
 drivers/clk/imx/clk-scu.c                     |   2 +-
 drivers/clk/qcom/lpassaudiocc-sc7280.c        |   4 +-
 drivers/clk/qcom/lpasscorecc-sc7180.c         |   4 +-
 drivers/crypto/ccree/cc_pm.c                  |   2 +-
 drivers/crypto/hisilicon/qm.c                 |   2 +-
 drivers/crypto/omap-aes-gcm.c                 |   2 +-
 drivers/crypto/omap-aes.c                     |   2 +-
 drivers/crypto/omap-des.c                     |   2 +-
 drivers/crypto/omap-sham.c                    |   2 +-
 drivers/crypto/rockchip/rk3288_crypto_ahash.c |   2 +-
 .../crypto/rockchip/rk3288_crypto_skcipher.c  |   2 +-
 drivers/crypto/stm32/stm32-crc32.c            |   4 +-
 drivers/crypto/stm32/stm32-cryp.c             |   2 +-
 drivers/crypto/stm32/stm32-hash.c             |   2 +-
 drivers/dma/at_xdmac.c                        |  24 +--
 drivers/dma/pl330.c                           |  14 +-
 drivers/dma/qcom/bam_dma.c                    |  10 +-
 drivers/dma/qcom/hidma.c                      |  18 +-
 drivers/dma/qcom/hidma_dbg.c                  |   2 +-
 drivers/dma/qcom/hidma_mgmt.c                 |   4 +-
 drivers/dma/ste_dma40.c                       |  16 +-
 drivers/dma/ti/cppi41.c                       |  10 +-
 drivers/dma/xilinx/zynqmp_dma.c               |   2 +-
 drivers/gpio/gpio-arizona.c                   |  10 +-
 drivers/gpio/gpio-mxc.c                       |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c      |   2 +-
 .../gpu/drm/amd/amdgpu/amdgpu_connectors.c    |  16 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c   | 120 ++++++------
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c   |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       |   6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c     |   6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c       |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c       |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_rap.c       |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c       |   2 +-
 .../gpu/drm/amd/amdgpu/amdgpu_securedisplay.c |   4 +-
 drivers/gpu/drm/amd/amdkfd/kfd_process.c      |   4 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |   2 +-
 drivers/gpu/drm/amd/pm/amdgpu_pm.c            | 178 +++++++++---------
 .../drm/bridge/analogix/analogix_dp_core.c    |   2 +-
 drivers/gpu/drm/bridge/analogix/anx7625.c     |   4 +-
 drivers/gpu/drm/bridge/parade-ps8640.c        |   4 +-
 drivers/gpu/drm/bridge/ti-sn65dsi86.c         |  14 +-
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c         |  12 +-
 drivers/gpu/drm/exynos/exynos_drm_fimc.c      |   4 +-
 drivers/gpu/drm/exynos/exynos_drm_g2d.c       |   4 +-
 drivers/gpu/drm/exynos/exynos_drm_gsc.c       |   6 +-
 drivers/gpu/drm/exynos/exynos_drm_rotator.c   |   2 +-
 drivers/gpu/drm/exynos/exynos_drm_scaler.c    |   2 +-
 drivers/gpu/drm/i915/intel_runtime_pm.c       |   4 +-
 drivers/gpu/drm/imx/dcss/dcss-crtc.c          |   2 +-
 drivers/gpu/drm/lima/lima_sched.c             |   2 +-
 drivers/gpu/drm/msm/adreno/adreno_device.c    |   2 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.c       |   2 +-
 drivers/gpu/drm/msm/msm_gpu.c                 |   2 +-
 drivers/gpu/drm/msm/msm_iommu.c               |   4 +-
 drivers/gpu/drm/msm/msm_submitqueue.c         |   2 +-
 drivers/gpu/drm/nouveau/dispnv50/disp.c       |  10 +-
 drivers/gpu/drm/nouveau/nouveau_connector.c   |   4 +-
 drivers/gpu/drm/nouveau/nouveau_debugfs.c     |   8 +-
 drivers/gpu/drm/nouveau/nouveau_display.c     |   4 +-
 drivers/gpu/drm/nouveau/nouveau_drm.c         |  10 +-
 drivers/gpu/drm/nouveau/nouveau_gem.c         |  10 +-
 drivers/gpu/drm/panel/panel-edp.c             |   8 +-
 .../gpu/drm/panel/panel-samsung-atna33xc20.c  |   6 +-
 drivers/gpu/drm/panel/panel-simple.c          |   6 +-
 drivers/gpu/drm/panfrost/panfrost_job.c       |   4 +-
 drivers/gpu/drm/panfrost/panfrost_mmu.c       |   4 +-
 drivers/gpu/drm/panfrost/panfrost_perfcnt.c   |   4 +-
 drivers/gpu/drm/panthor/panthor_device.c      |   2 +-
 drivers/gpu/drm/panthor/panthor_sched.c       |   6 +-
 drivers/gpu/drm/radeon/radeon_acpi.c          |   2 +-
 drivers/gpu/drm/radeon/radeon_connectors.c    |  20 +-
 drivers/gpu/drm/radeon/radeon_display.c       |   6 +-
 drivers/gpu/drm/radeon/radeon_drv.c           |   4 +-
 drivers/gpu/drm/radeon/radeon_fbdev.c         |   4 +-
 drivers/gpu/drm/radeon/radeon_kms.c           |  10 +-
 drivers/gpu/drm/tegra/submit.c                |   2 +-
 drivers/gpu/drm/tidss/tidss_drv.c             |   2 +-
 drivers/gpu/drm/vc4/vc4_v3d.c                 |   2 +-
 drivers/hsi/controllers/omap_ssi_port.c       |  42 ++---
 drivers/hwtracing/stm/core.c                  |   8 +-
 drivers/i2c/busses/i2c-amd-mp2-pci.c          |   2 +-
 drivers/i2c/busses/i2c-amd-mp2.h              |   2 +-
 drivers/i2c/busses/i2c-at91-master.c          |   2 +-
 drivers/i2c/busses/i2c-cadence.c              |   2 +-
 drivers/i2c/busses/i2c-davinci.c              |   4 +-
 drivers/i2c/busses/i2c-designware-master.c    |   2 +-
 drivers/i2c/busses/i2c-designware-pcidrv.c    |   2 +-
 drivers/i2c/busses/i2c-hix5hd2.c              |   2 +-
 drivers/i2c/busses/i2c-i801.c                 |   4 +-
 drivers/i2c/busses/i2c-img-scb.c              |   6 +-
 drivers/i2c/busses/i2c-imx-lpi2c.c            |   6 +-
 drivers/i2c/busses/i2c-imx.c                  |   4 +-
 drivers/i2c/busses/i2c-mv64xxx.c              |   2 +-
 drivers/i2c/busses/i2c-nvidia-gpu.c           |   4 +-
 drivers/i2c/busses/i2c-omap.c                 |   6 +-
 drivers/i2c/busses/i2c-qcom-cci.c             |   2 +-
 drivers/i2c/busses/i2c-qcom-geni.c            |   2 +-
 drivers/i2c/busses/i2c-qup.c                  |   4 +-
 drivers/i2c/busses/i2c-riic.c                 |   4 +-
 drivers/i2c/busses/i2c-rzv2m.c                |   2 +-
 drivers/i2c/busses/i2c-sprd.c                 |   4 +-
 drivers/i2c/busses/i2c-stm32f7.c              |  10 +-
 drivers/i2c/busses/i2c-xiic.c                 |   2 +-
 drivers/i3c/master/dw-i3c-master.c            |  16 +-
 drivers/i3c/master/svc-i3c-master.c           |  16 +-
 drivers/iio/accel/bmc150-accel-core.c         |   2 +-
 drivers/iio/accel/bmi088-accel-core.c         |   6 +-
 drivers/iio/accel/fxls8962af-core.c           |   2 +-
 drivers/iio/accel/kxcjk-1013.c                |   2 +-
 drivers/iio/accel/kxsd9.c                     |   6 +-
 drivers/iio/accel/mma8452.c                   |   2 +-
 drivers/iio/accel/mma9551_core.c              |   2 +-
 drivers/iio/accel/msa311.c                    |  12 +-
 drivers/iio/adc/ab8500-gpadc.c                |   2 +-
 drivers/iio/adc/at91-sama5d2_adc.c            |  20 +-
 drivers/iio/adc/rcar-gyroadc.c                |   2 +-
 drivers/iio/adc/stm32-adc-core.c              |   2 +-
 drivers/iio/adc/stm32-adc.c                   |  12 +-
 drivers/iio/adc/sun4i-gpadc-iio.c             |   4 +-
 drivers/iio/adc/ti-ads1015.c                  |   2 +-
 drivers/iio/adc/ti-ads1100.c                  |   2 +-
 drivers/iio/adc/ti-ads1119.c                  |   4 +-
 drivers/iio/chemical/atlas-sensor.c           |   4 +-
 .../common/hid-sensors/hid-sensor-trigger.c   |   2 +-
 drivers/iio/dac/stm32-dac.c                   |   6 +-
 drivers/iio/gyro/bmg160_core.c                |   2 +-
 drivers/iio/gyro/fxas21002c_core.c            |   2 +-
 drivers/iio/gyro/mpu3050-core.c               |   6 +-
 drivers/iio/gyro/mpu3050-i2c.c                |   2 +-
 .../iio/imu/inv_icm42600/inv_icm42600_accel.c |  10 +-
 .../imu/inv_icm42600/inv_icm42600_buffer.c    |   2 +-
 .../iio/imu/inv_icm42600/inv_icm42600_gyro.c  |  10 +-
 .../iio/imu/inv_icm42600/inv_icm42600_temp.c  |   2 +-
 drivers/iio/imu/inv_mpu6050/inv_mpu_core.c    |  14 +-
 drivers/iio/imu/inv_mpu6050/inv_mpu_trigger.c |   4 +-
 drivers/iio/imu/kmx61.c                       |   2 +-
 drivers/iio/light/apds9306.c                  |   6 +-
 drivers/iio/light/apds9960.c                  |   4 +-
 drivers/iio/light/bh1780.c                    |   2 +-
 drivers/iio/light/gp2ap002.c                  |   4 +-
 drivers/iio/light/isl29028.c                  |   2 +-
 drivers/iio/light/ltrf216a.c                  |   2 +-
 drivers/iio/light/pa12203001.c                |   2 +-
 drivers/iio/light/rpr0521.c                   |   2 +-
 drivers/iio/light/tsl2583.c                   |   2 +-
 drivers/iio/light/tsl2591.c                   |   4 +-
 drivers/iio/light/us5182d.c                   |   2 +-
 drivers/iio/light/vcnl4000.c                  |   2 +-
 drivers/iio/light/vcnl4035.c                  |   2 +-
 drivers/iio/magnetometer/af8133j.c            |   4 +-
 drivers/iio/magnetometer/ak8974.c             |   4 +-
 drivers/iio/magnetometer/ak8975.c             |   2 +-
 drivers/iio/magnetometer/bmc150_magn.c        |   2 +-
 drivers/iio/magnetometer/tmag5273.c           |   4 +-
 drivers/iio/magnetometer/yamaha-yas530.c      |   4 +-
 drivers/iio/pressure/bmp280-core.c            |  10 +-
 drivers/iio/pressure/icp10100.c               |   2 +-
 drivers/iio/pressure/mpl115.c                 |   4 +-
 drivers/iio/pressure/zpa2326.c                |   4 +-
 .../iio/proximity/pulsedlight-lidar-lite-v2.c |   2 +-
 drivers/iio/proximity/srf04.c                 |   2 +-
 drivers/iio/temperature/mlx90614.c            |   4 +-
 drivers/iio/temperature/mlx90632.c            |   4 +-
 drivers/iio/temperature/mlx90635.c            |   4 +-
 drivers/input/keyboard/omap4-keypad.c         |   8 +-
 drivers/input/misc/cs40l50-vibra.c            |   8 +-
 drivers/iommu/arm/arm-smmu/arm-smmu.c         |   2 +-
 drivers/irqchip/irq-imx-irqsteer.c            |   2 +-
 drivers/mailbox/mtk-cmdq-mailbox.c            |  10 +-
 drivers/media/i2c/alvium-csi2.c               |   2 +-
 drivers/media/i2c/ccs/ccs-core.c              |  10 +-
 drivers/media/i2c/dw9719.c                    |   2 +-
 drivers/media/i2c/gc0308.c                    |   6 +-
 drivers/media/i2c/gc2145.c                    |   8 +-
 drivers/media/i2c/imx283.c                    |   6 +-
 drivers/media/i2c/imx290.c                    |   6 +-
 drivers/media/i2c/imx296.c                    |   4 +-
 drivers/media/i2c/imx415.c                    |   4 +-
 drivers/media/i2c/mt9m114.c                   |  12 +-
 drivers/media/i2c/ov2680.c                    |   2 +-
 drivers/media/i2c/ov4689.c                    |   6 +-
 drivers/media/i2c/ov5640.c                    |   8 +-
 drivers/media/i2c/ov5645.c                    |   6 +-
 drivers/media/i2c/ov5693.c                    |   2 +-
 drivers/media/i2c/ov64a40.c                   |   8 +-
 drivers/media/i2c/ov7251.c                    |   2 +-
 drivers/media/i2c/ov8858.c                    |   4 +-
 drivers/media/i2c/thp7312.c                   |   8 +-
 drivers/media/i2c/video-i2c.c                 |   8 +-
 .../media/platform/nvidia/tegra-vde/h264.c    |   4 +-
 drivers/media/platform/qcom/venus/vdec.c      |   4 +-
 drivers/media/platform/qcom/venus/venc.c      |   4 +-
 .../platform/raspberrypi/pisp_be/pisp_be.c    |   4 +-
 .../media/platform/st/sti/delta/delta-v4l2.c  |   4 +-
 drivers/media/platform/st/sti/hva/hva-hw.c    |   8 +-
 .../media/platform/verisilicon/hantro_drv.c   |   2 +-
 drivers/media/rc/gpio-ir-recv.c               |   2 +-
 drivers/mfd/arizona-irq.c                     |   2 +-
 drivers/mfd/cs40l50-core.c                    |   2 +-
 drivers/mfd/cs42l43.c                         |   2 +-
 drivers/misc/mei/client.c                     |  14 +-
 drivers/mmc/core/core.c                       |   4 +-
 drivers/mmc/host/atmel-mci.c                  |   4 +-
 drivers/mmc/host/dw_mmc-rockchip.c            |   2 +-
 drivers/mmc/host/dw_mmc.c                     |   2 +-
 drivers/mmc/host/mmci.c                       |   2 +-
 drivers/mmc/host/omap_hsmmc.c                 |   6 +-
 drivers/mmc/host/sdhci-msm.c                  |   2 +-
 drivers/mmc/host/sdhci-of-at91.c              |   2 +-
 drivers/mmc/host/sdhci-omap.c                 |   4 +-
 drivers/mmc/host/sdhci-pci-core.c             |   2 +-
 drivers/mmc/host/sdhci-pxav3.c                |   6 +-
 drivers/mmc/host/sdhci-sprd.c                 |   2 +-
 drivers/mmc/host/sdhci-xenon.c                |   2 +-
 drivers/mmc/host/sdhci_am654.c                |   2 +-
 drivers/mmc/host/tmio_mmc_core.c              |   2 +-
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c    |  10 +-
 drivers/net/ethernet/cadence/macb_main.c      |  10 +-
 drivers/net/ethernet/freescale/fec_main.c     |  16 +-
 drivers/net/ethernet/renesas/ravb_main.c      |   8 +-
 drivers/net/ethernet/ti/davinci_mdio.c        |  14 +-
 drivers/net/ipa/ipa_interrupt.c               |   2 +-
 drivers/net/ipa/ipa_main.c                    |   2 +-
 drivers/net/ipa/ipa_modem.c                   |   8 +-
 drivers/net/ipa/ipa_smp2p.c                   |   4 +-
 drivers/net/ipa/ipa_uc.c                      |   4 +-
 drivers/net/wireless/ath/wil6210/pm.c         |   2 +-
 drivers/net/wireless/ti/wl18xx/debugfs.c      |   6 +-
 drivers/net/wireless/ti/wlcore/cmd.c          |   2 +-
 drivers/net/wireless/ti/wlcore/debugfs.c      |  22 +--
 drivers/net/wireless/ti/wlcore/main.c         |  72 +++----
 drivers/net/wireless/ti/wlcore/scan.c         |   2 +-
 drivers/net/wireless/ti/wlcore/sysfs.c        |   2 +-
 drivers/net/wireless/ti/wlcore/testmode.c     |   4 +-
 drivers/net/wireless/ti/wlcore/tx.c           |   2 +-
 drivers/net/wireless/ti/wlcore/vendor_cmd.c   |   6 +-
 drivers/net/wwan/qcom_bam_dmux.c              |   4 +-
 drivers/net/wwan/t7xx/t7xx_hif_cldma.c        |   6 +-
 drivers/net/wwan/t7xx/t7xx_hif_dpmaif_rx.c    |   6 +-
 drivers/net/wwan/t7xx/t7xx_hif_dpmaif_tx.c    |   4 +-
 drivers/nfc/trf7970a.c                        |   2 +-
 drivers/pci/pcie/portdrv.c                    |   2 +-
 drivers/phy/motorola/phy-mapphone-mdm6600.c   |   4 +-
 drivers/phy/ti/phy-twl4030-usb.c              |   8 +-
 drivers/power/supply/bq24190_charger.c        |  28 +--
 drivers/power/supply/twl4030_charger.c        |   2 +-
 drivers/pwm/pwm-img.c                         |   4 +-
 drivers/regulator/stm32-vrefbuf.c             |  12 +-
 drivers/remoteproc/omap_remoteproc.c          |   6 +-
 drivers/slimbus/core.c                        |   2 +-
 drivers/slimbus/messaging.c                   |   4 +-
 drivers/soc/apple/mailbox.c                   |   2 +-
 drivers/soundwire/bus.c                       |   2 +-
 drivers/soundwire/cadence_master.c            |   2 +-
 drivers/soundwire/qcom.c                      |   6 +-
 drivers/spi/atmel-quadspi.c                   |  10 +-
 drivers/spi/spi-cadence-quadspi.c             |   4 +-
 drivers/spi/spi-cadence.c                     |   2 +-
 drivers/spi/spi-dw-pci.c                      |   2 +-
 drivers/spi/spi-fsl-espi.c                    |   4 +-
 drivers/spi/spi-fsl-lpspi.c                   |   4 +-
 drivers/spi/spi-imx.c                         |   6 +-
 drivers/spi/spi-mtk-nor.c                     |   2 +-
 drivers/spi/spi-omap2-mcspi.c                 |   6 +-
 drivers/spi/spi-pxa2xx-pci.c                  |   2 +-
 drivers/spi/spi-s3c64xx.c                     |   6 +-
 drivers/spi/spi-sprd.c                        |   2 +-
 drivers/spi/spi-stm32-qspi.c                  |  14 +-
 drivers/spi/spi-stm32.c                       |   4 +-
 drivers/spi/spi-ti-qspi.c                     |   4 +-
 drivers/spi/spi-zynqmp-gqspi.c                |   2 +-
 drivers/spi/spi.c                             |   6 +-
 drivers/staging/greybus/gbphy.h               |   2 +-
 drivers/staging/media/rkvdec/rkvdec.c         |   2 +-
 drivers/thunderbolt/debugfs.c                 |  22 +--
 drivers/thunderbolt/domain.c                  |   4 +-
 drivers/thunderbolt/icm.c                     |  14 +-
 drivers/thunderbolt/nhi.c                     |   2 +-
 drivers/thunderbolt/retimer.c                 |   4 +-
 drivers/thunderbolt/switch.c                  |   6 +-
 drivers/thunderbolt/tb.c                      |  18 +-
 drivers/thunderbolt/usb4_port.c               |   4 +-
 drivers/tty/serial/8250/8250_omap.c           |  18 +-
 drivers/tty/serial/8250/8250_port.c           |   4 +-
 drivers/tty/serial/fsl_lpuart.c               |   2 +-
 drivers/tty/serial/serial_core.c              |   2 +-
 drivers/tty/serial/uartlite.c                 |   4 +-
 drivers/tty/serial/xilinx_uartps.c            |   2 +-
 drivers/usb/cdns3/cdns3-gadget.c              |   2 +-
 drivers/usb/cdns3/cdnsp-gadget.c              |   2 +-
 drivers/usb/chipidea/core.c                   |   2 +-
 drivers/usb/chipidea/otg_fsm.c                |   2 +-
 drivers/usb/dwc3/core.c                       |   2 +-
 drivers/usb/dwc3/dwc3-am62.c                  |   2 +-
 drivers/usb/dwc3/dwc3-imx8mp.c                |   2 +-
 drivers/usb/gadget/udc/cdns2/cdns2-gadget.c   |   2 +-
 drivers/usb/host/xhci-mtk.c                   |   2 +-
 drivers/usb/misc/apple-mfi-fastcharge.c       |   2 +-
 drivers/usb/mtu3/mtu3_plat.c                  |   2 +-
 drivers/usb/musb/musb_core.c                  |  10 +-
 drivers/usb/musb/musb_debugfs.c               |  10 +-
 drivers/usb/musb/musb_dsps.c                  |   2 +-
 drivers/usb/musb/musb_gadget.c                |   8 +-
 drivers/usb/musb/omap2430.c                   |   2 +-
 drivers/w1/masters/omap_hdq.c                 |  10 +-
 include/linux/greybus/bundle.h                |   2 +-
 sound/hda/hdac_device.c                       |   2 +-
 sound/pci/hda/cs35l41_hda.c                   |   8 +-
 sound/pci/hda/cs35l56_hda.c                   |   2 +-
 sound/pci/hda/hda_intel.c                     |   2 +-
 sound/pci/hda/tas2781_hda_i2c.c               |   6 +-
 sound/soc/atmel/mchp-spdifrx.c                |  12 +-
 sound/soc/codecs/arizona-jack.c               |  12 +-
 sound/soc/codecs/arizona.c                    |   2 +-
 sound/soc/codecs/cs35l41.c                    |   4 +-
 sound/soc/codecs/cs35l45.c                    |   2 +-
 sound/soc/codecs/cs35l56-sdw.c                |   4 +-
 sound/soc/codecs/cs35l56-shared.c             |   2 +-
 sound/soc/codecs/cs35l56.c                    |   2 +-
 sound/soc/codecs/cs42l42-sdw.c                |   2 +-
 sound/soc/codecs/cs42l42.c                    |   4 +-
 sound/soc/codecs/cs42l43-jack.c               |  10 +-
 sound/soc/codecs/cs42l43.c                    |   4 +-
 sound/soc/codecs/hda.c                        |   6 +-
 sound/soc/codecs/madera.c                     |   6 +-
 sound/soc/codecs/max98363.c                   |   2 +-
 sound/soc/codecs/max98373-sdw.c               |   2 +-
 sound/soc/codecs/rt1017-sdca-sdw.c            |   2 +-
 sound/soc/codecs/rt1308-sdw.c                 |   2 +-
 sound/soc/codecs/rt1316-sdw.c                 |   2 +-
 sound/soc/codecs/rt1318-sdw.c                 |   2 +-
 sound/soc/codecs/rt1320-sdw.c                 |   2 +-
 sound/soc/codecs/rt5682-sdw.c                 |   2 +-
 sound/soc/codecs/rt700.c                      |   4 +-
 sound/soc/codecs/rt711-sdca.c                 |   4 +-
 sound/soc/codecs/rt711.c                      |   4 +-
 sound/soc/codecs/rt712-sdca-dmic.c            |   2 +-
 sound/soc/codecs/rt712-sdca.c                 |   4 +-
 sound/soc/codecs/rt715-sdca.c                 |   2 +-
 sound/soc/codecs/rt715.c                      |   2 +-
 sound/soc/codecs/rt722-sdca.c                 |   4 +-
 sound/soc/codecs/wcd-mbhc-v2.c                |   4 +-
 sound/soc/codecs/wsa881x.c                    |   2 +-
 sound/soc/codecs/wsa884x.c                    |   2 +-
 sound/soc/intel/atom/sst/sst_pvt.c            |   2 +-
 sound/soc/intel/avs/core.c                    |   2 +-
 sound/soc/intel/avs/debugfs.c                 |   4 +-
 sound/soc/intel/avs/pcm.c                     |   2 +-
 sound/soc/intel/catpt/pcm.c                   |  12 +-
 sound/soc/intel/catpt/sysfs.c                 |   2 +-
 sound/soc/soc-component.c                     |   2 +-
 sound/soc/sof/control.c                       |   2 +-
 sound/soc/sof/debug.c                         |   2 +-
 sound/soc/sof/ipc3-dtrace.c                   |   2 +-
 sound/soc/sof/ipc4-loader.c                   |   2 +-
 sound/soc/sof/pcm.c                           |   2 +-
 sound/soc/sof/sof-client-ipc-flood-test.c     |   2 +-
 .../soc/sof/sof-client-ipc-kernel-injector.c  |   2 +-
 sound/soc/sof/sof-client-ipc-msg-injector.c   |   2 +-
 sound/soc/sof/sof-client-probes.c             |   6 +-
 sound/x86/intel_hdmi_audio.c                  |   6 +-
 373 files changed, 1076 insertions(+), 1076 deletions(-)

-- 
2.39.5


