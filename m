Return-Path: <linux-input+bounces-4370-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 16D6790980A
	for <lists+linux-input@lfdr.de>; Sat, 15 Jun 2024 13:58:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2786F1C210B8
	for <lists+linux-input@lfdr.de>; Sat, 15 Jun 2024 11:58:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 341033F9C5;
	Sat, 15 Jun 2024 11:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lsHqUmPu"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 126CB10A1E;
	Sat, 15 Jun 2024 11:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718452711; cv=none; b=qMCrHCr43Z/lqdhMRO7cmCZloak8a32BkIH7vSFOrS90QWJ/Werb3oOLciNASOOF/gThAkho0V+lebyb//8xf+XRhJf5Vh3hY7dM76nNsgPiSO8TR84cvDQ7xDEOFI4zJK/zJdGL8fSR4pd/Ns+zHitQrsozfhQw7x7Pspblkfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718452711; c=relaxed/simple;
	bh=8g8K29UGvZQZHmDBFTXU6XG095tGQcdkWR/9aqXmYHE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NaMIhdFTSQ4mrBV0LTktzLHInKn6rhFtwz/2U6DLxzHEWtbIZGz+UMBAoXZb1LhE71C8BwtTWq1d6IDeBACCUrmxxL9iXR5B8/fcP5tWm9ki0iLgNU4h49DOvkBu/VUIeDFYhh075RzR2KkYoiDnKLnsBKqWL8ok5DMPNl+nEDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lsHqUmPu; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718452709; x=1749988709;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8g8K29UGvZQZHmDBFTXU6XG095tGQcdkWR/9aqXmYHE=;
  b=lsHqUmPut815oKAcbqwEC0RvhNCAFb2HZQ3UG530M1XWEBbbl4Yda35s
   EDY1j2hTWYqdKTVljOBU8c/8BYZox2sKGajFGQkyZaG9MyehmPCRuhP91
   mGEgRILSzCmFOxHgaYfm4/Cv2jgrdaETANGCHJ2b/wlmFHOPI/Hs/o6b5
   lBLKs4dq56EFbAAr5CgS3zSRsrpbmyXlYLpmqE9vnjoGrPqy5mPKgcqIk
   7NqnKTTRfo7oWDlnskLTp+VQkJFOK4Gc54bPKtDZwuPyRFpkf11uyPaxP
   ygNEcH0Vp30lQAqB9YYyZm6veM5YFe5I6tesTcVjSsFBpIJyOFS/5LKrO
   Q==;
X-CSE-ConnectionGUID: I63yF81RSK2EPeLbT1vPgw==
X-CSE-MsgGUID: fn5NyWw5TDqQGFSs0BxIVg==
X-IronPort-AV: E=McAfee;i="6700,10204,11103"; a="32885222"
X-IronPort-AV: E=Sophos;i="6.08,240,1712646000"; 
   d="scan'208";a="32885222"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2024 04:58:28 -0700
X-CSE-ConnectionGUID: 5BS+34LDQeKsmKaIhRi90A==
X-CSE-MsgGUID: Kw1yrEcpS9C0GUXo69gFqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,240,1712646000"; 
   d="scan'208";a="40859755"
Received: from lkp-server01.sh.intel.com (HELO 0bcb674f05cd) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 15 Jun 2024 04:58:25 -0700
Received: from kbuild by 0bcb674f05cd with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sIS35-00008s-0h;
	Sat, 15 Jun 2024 11:58:23 +0000
Date: Sat, 15 Jun 2024 19:57:39 +0800
From: kernel test robot <lkp@intel.com>
To: Charles Wang <charles.goodix@gmail.com>, dmitry.torokhov@gmail.com,
	dan.carpenter@linaro.org
Cc: oe-kbuild-all@lists.linux.dev, dianders@chromium.org, robh@kernel.org,
	krzk+dt@kernel.org, jikos@kernel.org, bentiss@kernel.org,
	hbarnor@chromium.org, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Charles Wang <charles.goodix@gmail.com>
Subject: Re: [PATCH v4 1/2] HID: hid-goodix: Add Goodix HID-over-SPI driver
Message-ID: <202406151920.jSO2jara-lkp@intel.com>
References: <20240614121538.236727-2-charles.goodix@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240614121538.236727-2-charles.goodix@gmail.com>

Hi Charles,

kernel test robot noticed the following build warnings:

[auto build test WARNING on hid/for-next]
[also build test WARNING on dtor-input/next dtor-input/for-linus robh/for-next linus/master v6.10-rc3 next-20240613]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Charles-Wang/HID-hid-goodix-Add-Goodix-HID-over-SPI-driver/20240614-201949
base:   https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git for-next
patch link:    https://lore.kernel.org/r/20240614121538.236727-2-charles.goodix%40gmail.com
patch subject: [PATCH v4 1/2] HID: hid-goodix: Add Goodix HID-over-SPI driver
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20240615/202406151920.jSO2jara-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240615/202406151920.jSO2jara-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406151920.jSO2jara-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/device.h:15,
                    from include/linux/input.h:19,
                    from include/linux/hid.h:24,
                    from drivers/hid/hid-goodix-spi.c:9:
   drivers/hid/hid-goodix-spi.c: In function 'goodix_spi_read':
>> drivers/hid/hid-goodix-spi.c:147:34: warning: format '%ld' expects argument of type 'long int', but argument 3 has type 'unsigned int' [-Wformat=]
     147 |                 dev_err(ts->dev, "read data len exceed limit %ld",
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:154:56: note: in expansion of macro 'dev_fmt'
     154 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                        ^~~~~~~
   drivers/hid/hid-goodix-spi.c:147:17: note: in expansion of macro 'dev_err'
     147 |                 dev_err(ts->dev, "read data len exceed limit %ld",
         |                 ^~~~~~~
   drivers/hid/hid-goodix-spi.c:147:64: note: format string is defined here
     147 |                 dev_err(ts->dev, "read data len exceed limit %ld",
         |                                                              ~~^
         |                                                                |
         |                                                                long int
         |                                                              %d
   drivers/hid/hid-goodix-spi.c: In function 'goodix_spi_write':
   drivers/hid/hid-goodix-spi.c:181:34: warning: format '%ld' expects argument of type 'long int', but argument 3 has type 'unsigned int' [-Wformat=]
     181 |                 dev_err(ts->dev, "write data len exceed limit %ld",
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:154:56: note: in expansion of macro 'dev_fmt'
     154 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                        ^~~~~~~
   drivers/hid/hid-goodix-spi.c:181:17: note: in expansion of macro 'dev_err'
     181 |                 dev_err(ts->dev, "write data len exceed limit %ld",
         |                 ^~~~~~~
   drivers/hid/hid-goodix-spi.c:181:65: note: format string is defined here
     181 |                 dev_err(ts->dev, "write data len exceed limit %ld",
         |                                                               ~~^
         |                                                                 |
         |                                                                 long int
         |                                                               %d


vim +147 drivers/hid/hid-goodix-spi.c

   137	
   138	static int goodix_spi_read(struct goodix_ts_data *ts, u32 addr,
   139				   void *data, size_t len)
   140	{
   141		struct spi_device *spi = to_spi_device(&ts->spi->dev);
   142		struct spi_transfer xfers;
   143		struct spi_message spi_msg;
   144		int error;
   145	
   146		if (GOODIX_SPI_READ_PREFIX_LEN + len > sizeof(ts->xfer_buf)) {
 > 147			dev_err(ts->dev, "read data len exceed limit %ld",
   148				sizeof(ts->xfer_buf) - GOODIX_SPI_READ_PREFIX_LEN);
   149			return -EINVAL;
   150		}
   151	
   152		/* buffer format: 0xF1 + addr(4bytes) + dummy(3bytes) + data */
   153		ts->xfer_buf[0] = GOODIX_SPI_READ_FLAG;
   154		put_unaligned_be32(addr, ts->xfer_buf + GOODIX_SPI_TRANS_PREFIX_LEN);
   155	
   156		spi_message_init(&spi_msg);
   157		memset(&xfers, 0, sizeof(xfers));
   158		xfers.tx_buf = ts->xfer_buf;
   159		xfers.rx_buf = ts->xfer_buf;
   160		xfers.len = GOODIX_SPI_READ_PREFIX_LEN + len;
   161		spi_message_add_tail(&xfers, &spi_msg);
   162	
   163		error = spi_sync(spi, &spi_msg);
   164		if (error)
   165			dev_err(ts->dev, "spi transfer error: %d", error);
   166		else
   167			memcpy(data, ts->xfer_buf + GOODIX_SPI_READ_PREFIX_LEN, len);
   168	
   169		return error;
   170	}
   171	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

