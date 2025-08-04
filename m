Return-Path: <linux-input+bounces-13796-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DFCDB19EAF
	for <lists+linux-input@lfdr.de>; Mon,  4 Aug 2025 11:19:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B91313A8B8D
	for <lists+linux-input@lfdr.de>; Mon,  4 Aug 2025 09:19:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 070FF24395C;
	Mon,  4 Aug 2025 09:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B8DCmSQV"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B3DB23C8C7
	for <linux-input@vger.kernel.org>; Mon,  4 Aug 2025 09:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754299190; cv=none; b=rOTvO1WJelCypArxkIgoUJpmz3xbZ/PUaTnXiFliL/d8Jzs46B1azdlD3GpncaM8+VZjwl/GKhjH2Io5cztDw37tPAnPqbI9UawC4UYoJPfbIwNOcTgAYa+Z129wnnYwDCDPTLWy/C7ImyfpTmTtH42FeL0toFbEzioPUxlgPus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754299190; c=relaxed/simple;
	bh=LON9eXeBI1UX+rop2YuQraqsYMaynjGOa49u5wWH3VU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nL5uZJ0U/cxn6PWW3zrkwSHIFEdFPt/vrZqLDp5KZ3SFmob+OLY1wv4qy7J9SLsbhA7PcaDEQPMqE+3XAL+o8HGSL9D3rET7QDodSFP9iIHs7mUM+i7AoXl9KMXixHA2hd+gZXVuHnlu1Mp0slRfzwexsgG2XOge1oLLHFtpHpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B8DCmSQV; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754299189; x=1785835189;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LON9eXeBI1UX+rop2YuQraqsYMaynjGOa49u5wWH3VU=;
  b=B8DCmSQVJ7WElTo/EvudgKoD5waeTrzZCihtablchb35I2dury2iotUz
   WETRzLb8NkT4D0fd0vWNfy7eblKagVvArGSAo8BgQu9vdRGT5+k3x65j7
   phNLbSKkvVSnh/wDW/ra7sXkqjDfxB96cgZntEikw+WWkqFwIxAr2O/tu
   yqc+tv4+l5NO9RTpvtljw2iRvHkViSZ3T1IP0YSGyMTZGXU9Tk0QWhI2h
   198e384XbuZXYUXrhq2JmSe0jJ+zs1hO3x5F6sL6onDmn/BJjgVj3WSo3
   pd7Q+nH08hwAOSTfNucz0K3ciVaAq+pSq7ltq3ODcNAhIk1Vaz0zcaHF4
   w==;
X-CSE-ConnectionGUID: naHPd9G1SMiFhk0mU2JHJQ==
X-CSE-MsgGUID: s3OlEWV/SC+NneFMO40NrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11511"; a="59172908"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="59172908"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2025 02:19:48 -0700
X-CSE-ConnectionGUID: StS0gKWASVifqsuD0CuIHg==
X-CSE-MsgGUID: X7yIoqobQymP8zyNdblt+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="168296665"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 04 Aug 2025 02:19:46 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uirM8-0006vG-01;
	Mon, 04 Aug 2025 09:19:44 +0000
Date: Mon, 4 Aug 2025 17:18:57 +0800
From: kernel test robot <lkp@intel.com>
To: Lee Jones <lee@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-input@vger.kernel.org,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [dtor-input:next 25/25] drivers/input/touch-overlay.c: warning:
 EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
Message-ID: <202508041754.ykl25o1q-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
head:   a7bee4e7f78089c101be2ad51f4b5ec64782053e
commit: a7bee4e7f78089c101be2ad51f4b5ec64782053e [25/25] Merge tag 'ib-mfd-gpio-input-pwm-v6.17' of git://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd into next
config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20250804/202508041754.ykl25o1q-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250804/202508041754.ykl25o1q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508041754.ykl25o1q-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/iio/common/ssp_sensors/ssp_iio.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/iio/common/st_sensors/st_sensors_buffer.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/iio/common/st_sensors/st_sensors_core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/iio/common/st_sensors/st_sensors_i2c.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/iio/common/st_sensors/st_sensors_spi.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/iio/common/st_sensors/st_sensors_trigger.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/iio/dac/ad3552r-common.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/iio/dac/ad5592r-base.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/iio/dac/ad5686.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/iio/dummy/iio_dummy_evgen.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/iio/gyro/bmg160_core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/iio/gyro/fxas21002c_core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/iio/gyro/st_gyro_core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/iio/humidity/hts221_core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/iio/imu/adis.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/iio/imu/bmi160/bmi160_core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/iio/imu/bmi270/bmi270_core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/iio/imu/bmi323/bmi323_core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/iio/imu/bno055/bno055.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/iio/imu/fxos8700_core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/iio/imu/inv_icm42600/inv_icm42600_core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/iio/imu/inv_mpu6050/inv_mpu_core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/iio/imu/st_lsm9ds0/st_lsm9ds0_core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/iio/industrialio-backend.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/iio/industrialio-configfs.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/iio/industrialio-core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/iio/industrialio-event.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/iio/industrialio-sw-device.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/iio/industrialio-sw-trigger.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/iio/industrialio-trigger.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/iio/light/st_uvis25_core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/iio/magnetometer/bmc150_magn.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/iio/magnetometer/hmc5843_core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/iio/magnetometer/rm3100-core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/iio/magnetometer/st_magn_core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/iio/pressure/bmp280-core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/iio/pressure/bmp280-regmap.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/iio/pressure/hsc030pa.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/iio/pressure/mpl115.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/iio/pressure/mprls0025pa.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/iio/pressure/ms5611_core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/iio/pressure/st_pressure_core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/iio/pressure/zpa2326.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/iio/trigger/stm32-lptimer-trigger.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/iio/trigger/stm32-timer-trigger.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/infiniband/core/addr.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/infiniband/core/cache.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/infiniband/core/cgroup.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/infiniband/core/cm.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/infiniband/core/cma.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/infiniband/core/cq.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/infiniband/core/device.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/infiniband/core/ib_core_uverbs.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/infiniband/core/iwcm.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/infiniband/core/mad.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/infiniband/core/mr_pool.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/infiniband/core/nldev.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/infiniband/core/rdma_core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/infiniband/core/restrack.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/infiniband/core/roce_gid_mgmt.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/infiniband/core/rw.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/infiniband/core/sa_query.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/infiniband/core/security.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/infiniband/core/sysfs.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/infiniband/core/ucaps.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/infiniband/core/umem_dmabuf.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/infiniband/core/uverbs_cmd.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/infiniband/core/uverbs_ioctl.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/infiniband/core/uverbs_main.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/infiniband/core/uverbs_std_types.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/infiniband/sw/rdmavt/ah.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/infiniband/sw/rdmavt/cq.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/infiniband/sw/rdmavt/mcast.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/infiniband/sw/rdmavt/mr.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/infiniband/sw/rdmavt/qp.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/infiniband/sw/rdmavt/rc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/infiniband/sw/rdmavt/vt.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/infiniband/ulp/rtrs/rtrs-clt.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/infiniband/ulp/rtrs/rtrs-srv.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/infiniband/ulp/rtrs/rtrs.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/input/ff-core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/input/ff-memless.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/input/gameport/gameport.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/input/input-poller.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/input/input.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/input/joystick/iforce/iforce-main.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/input/joystick/iforce/iforce-packets.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/input/misc/ad714x.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/input/misc/adxl34x.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/input/misc/cma3000_d0x.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/input/rmi4/rmi_2d_sensor.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/input/rmi4/rmi_bus.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/input/rmi4/rmi_driver.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/input/serio/hil_mlc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/input/serio/hp_sdc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/input/serio/i8042.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/input/serio/libps2.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/input/serio/serio.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/input/sparse-keymap.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
>> drivers/input/touch-overlay.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/input/touchscreen.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/input/touchscreen/ad7879.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/input/touchscreen/cyttsp_core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/input/touchscreen/goodix_berlin_core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/input/touchscreen/tsc200x-core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/input/touchscreen/wm9705.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/input/touchscreen/wm9712.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/input/touchscreen/wm9713.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/input/touchscreen/wm97xx-core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/interconnect/core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/interconnect/icc-clk.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/interconnect/imx/imx.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/interconnect/mediatek/icc-emi.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/interconnect/qcom/bcm-voter.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/interconnect/qcom/icc-common.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/interconnect/qcom/icc-rpm-clocks.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/interconnect/qcom/icc-rpm.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/interconnect/qcom/icc-rpmh.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/interconnect/qcom/smd-rpm.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/iommu/dma-iommu.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/iommu/intel/dmar.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/iommu/intel/iommu.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/iommu/io-pgfault.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/iommu/io-pgtable.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/iommu/iommu-debugfs.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/iommu/iommu-pages.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/iommu/iommu-sva.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/iommu/iommu-sysfs.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/iommu/iommufd/device.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/iommu/iommufd/driver.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/iommu/iommufd/iova_bitmap.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/iommu/iommufd/main.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/iommu/iommufd/vfio_compat.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/iommu/iova.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/iommu/irq_remapping.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/iommu/omap-iommu.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/ipack/ipack.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/irqchip/irq-ath79-misc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/irqchip/irq-renesas-rzv2h.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/irqchip/irq-riscv-imsic-state.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/irqchip/irqchip.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/isdn/capi/kcapi.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/isdn/hardware/mISDN/isdnhdlc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/isdn/hardware/mISDN/mISDNipac.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/isdn/hardware/mISDN/mISDNisar.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/isdn/mISDN/core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/isdn/mISDN/fsm.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/isdn/mISDN/hwchannel.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/isdn/mISDN/layer1.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/leds/led-class-flash.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/leds/led-class-multicolor.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/leds/led-class.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/leds/led-core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/leds/leds-lp55xx-common.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/leds/leds-ti-lmu-common.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/leds/simatic/simatic-ipc-leds-gpio-core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/leds/trigger/ledtrig-backlight.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/leds/trigger/ledtrig-camera.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/leds/trigger/ledtrig-cpu.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/leds/trigger/ledtrig-disk.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/leds/trigger/ledtrig-mtd.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/macintosh/adb.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/macintosh/macio_asic.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/macintosh/mediabay.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/macintosh/smu.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/macintosh/via-cuda.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/macintosh/via-pmu.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/macintosh/windfarm_core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/macintosh/windfarm_pid.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/macintosh/windfarm_smu_sat.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/mailbox/mailbox.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/mailbox/mtk-cmdq-mailbox.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/mailbox/pcc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/mcb/mcb-core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/md/dm-audit.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/md/dm-bio-prison-v1.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/md/dm-bio-prison-v2.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/md/dm-bufio.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/md/dm-builtin.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/md/dm-cache-background-tracker.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/md/dm-cache-policy.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/md/dm-exception-store.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/md/dm-io.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/md/dm-ioctl.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/md/dm-kcopyd.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/md/dm-log.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/md/dm-path-selector.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/md/dm-region-hash.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/md/dm-rq.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/md/dm-snap.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/md/dm-table.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/md/dm-target.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/md/dm-zone.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/md/dm.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/md/md.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/md/persistent-data/dm-block-manager.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/md/raid5-cache.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/md/raid5.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/cec/core/cec-adap.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/cec/core/cec-core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

