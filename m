Return-Path: <linux-input+bounces-3960-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A72D58D418C
	for <lists+linux-input@lfdr.de>; Thu, 30 May 2024 00:50:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5C815284024
	for <lists+linux-input@lfdr.de>; Wed, 29 May 2024 22:50:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5051D1CB324;
	Wed, 29 May 2024 22:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RVWoYIuG"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B09017557C;
	Wed, 29 May 2024 22:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717023007; cv=none; b=FhT1R280D9WR031smpNuazINCFoj5XWsnzO6P99BAA9esps4uydDx46YKcM0c+FnTngyANytFZiV0PrCcDBfaLD5Fd4dS/NvP+t42KGjJooUTd4QKUMjdwTCd6tXgmfMQjYc994yZY86HKkXBYkcjtGmdZawFrVH1xN05D7uuuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717023007; c=relaxed/simple;
	bh=MR4EEdAPELva80USG9C528+WfQkabdiKFtN1yCOc89g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zq4gJ4aBthJKlQ+lnEjwoK7q90nJwob8EjdPB8w96K+Y9XZBsFK6j27n1r4/9/eq4sp8ej2S9r71Jja3nLMohu6oH9RalvyPvP/Vf/bSpFOxi7YA/csPGpku8PrAiMpp5S/ZJq8U6PrKP6NK5QG5j7LprE18xmrmN3830XuV8ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RVWoYIuG; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717023005; x=1748559005;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MR4EEdAPELva80USG9C528+WfQkabdiKFtN1yCOc89g=;
  b=RVWoYIuGv2ysOHRAmQGHtAtBAbYUgLxSL4BEEWccX6+qU8lx42MDpEUE
   b1ku2rhHbs0zk4Meu4+aM4W3EeFS/Xof4XkJG1bJ/rpGVC+3dW0CtxlGP
   4dFORvlDmaWsHV3l0NzpQIHFoVzx8fFcDPz8zg5Kn4B4wn/TnzwnBPAhc
   8c+ChsN0Fz4y/abVrvYAHkBV0plf67mUGVwqXQJgWLHY43ErA/Xpmaw1/
   BZYiwDEHUrr0mfOGAkxv6/Eaf8Owiaj4pP1gz+E2LDS+gJf9QXcfVKLuc
   5veO4c0UiC3TO8LphLJjkcF+dfVhk9R1p1DgFD6v/iWaYERg08rM14xWV
   Q==;
X-CSE-ConnectionGUID: NBMGZMaLTMK42Du3Uc2u2Q==
X-CSE-MsgGUID: W5XFRn8bSdqp0rB9wbu89g==
X-IronPort-AV: E=McAfee;i="6600,9927,11087"; a="13283106"
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; 
   d="scan'208";a="13283106"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2024 15:50:04 -0700
X-CSE-ConnectionGUID: 0ZNDl4e4QrWgRamclTXhcw==
X-CSE-MsgGUID: 0yqCC1k5SsC783FSROsMhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; 
   d="scan'208";a="40504059"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 29 May 2024 15:50:01 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sCS7K-000EIH-0u;
	Wed, 29 May 2024 22:49:58 +0000
Date: Thu, 30 May 2024 06:49:02 +0800
From: kernel test robot <lkp@intel.com>
To: wangshuaijie@awinic.com, dmitry.torokhov@gmail.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, jeff@labundy.com,
	linux-input@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, wangshuaijie@awinic.com,
	liweilei@awinic.com, kangjiajun@awinic.com
Subject: Re: [PATCH V1 5/5] Add support for Awinic sar sensor.
Message-ID: <202405300600.3YW7nPfV-lkp@intel.com>
References: <20240529130608.783624-6-wangshuaijie@awinic.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240529130608.783624-6-wangshuaijie@awinic.com>

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on e0cce98fe279b64f4a7d81b7f5c3a23d80b92fbc]

url:    https://github.com/intel-lab-lkp/linux/commits/wangshuaijie-awinic-com/dt-bindings-input-Add-YAML-to-Awinic-sar-sensor/20240529-211303
base:   e0cce98fe279b64f4a7d81b7f5c3a23d80b92fbc
patch link:    https://lore.kernel.org/r/20240529130608.783624-6-wangshuaijie%40awinic.com
patch subject: [PATCH V1 5/5] Add support for Awinic sar sensor.
config: riscv-randconfig-r071-20240530 (https://download.01.org/0day-ci/archive/20240530/202405300600.3YW7nPfV-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240530/202405300600.3YW7nPfV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405300600.3YW7nPfV-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/input/misc/aw_sar/./comm/aw_sar_comm_interface.c:489:28: warning: conflicting types for 'aw_parse_bin_header_1_0_0' due to enum/integer mismatch; have 'enum aw_bin_err_val(struct aw_bin *)' [-Wenum-int-mismatch]
     489 | static enum aw_bin_err_val aw_parse_bin_header_1_0_0(struct aw_bin *bin)
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/input/misc/aw_sar/./comm/aw_sar_comm_interface.c:234:12: note: previous declaration of 'aw_parse_bin_header_1_0_0' with type 'int(struct aw_bin *)'
     234 | static int aw_parse_bin_header_1_0_0(struct aw_bin *bin);
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~
--
>> drivers/input/misc/aw_sar/./aw9610x/aw9610x.c:166:9: warning: no previous prototype for 'aw9610x_check_chipid' [-Wmissing-prototypes]
     166 | int32_t aw9610x_check_chipid(void *data)
         |         ^~~~~~~~~~~~~~~~~~~~
>> drivers/input/misc/aw_sar/./aw9610x/aw9610x.c:863:9: warning: no previous prototype for 'aw9610x_init' [-Wmissing-prototypes]
     863 | int32_t aw9610x_init(struct aw_sar *p_sar)
         |         ^~~~~~~~~~~~
>> drivers/input/misc/aw_sar/./aw9610x/aw9610x.c:880:6: warning: no previous prototype for 'aw9610x_deinit' [-Wmissing-prototypes]
     880 | void aw9610x_deinit(struct aw_sar *p_sar)
         |      ^~~~~~~~~~~~~~
--
   drivers/input/misc/aw_sar/./aw963xx/aw963xx.c: In function 'aw963xx_irq_handle_func':
>> drivers/input/misc/aw_sar/./aw963xx/aw963xx.c:309:17: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
     309 |         int32_t ret;
         |                 ^~~
   drivers/input/misc/aw_sar/./aw963xx/aw963xx.c: At top level:
>> drivers/input/misc/aw_sar/./aw963xx/aw963xx.c:602:9: warning: no previous prototype for 'aw963xx_check_chipid' [-Wmissing-prototypes]
     602 | int32_t aw963xx_check_chipid(void *data)
         |         ^~~~~~~~~~~~~~~~~~~~
>> drivers/input/misc/aw_sar/./aw963xx/aw963xx.c:955:9: warning: no previous prototype for 'aw963xx_init' [-Wmissing-prototypes]
     955 | int32_t aw963xx_init(struct aw_sar *p_sar)
         |         ^~~~~~~~~~~~
   drivers/input/misc/aw_sar/./aw963xx/aw963xx.c: In function 'aw963xx_init':
>> drivers/input/misc/aw_sar/./aw963xx/aw963xx.c:957:25: warning: variable 'aw963xx' set but not used [-Wunused-but-set-variable]
     957 |         struct aw963xx *aw963xx;
         |                         ^~~~~~~
   drivers/input/misc/aw_sar/./aw963xx/aw963xx.c: At top level:
>> drivers/input/misc/aw_sar/./aw963xx/aw963xx.c:974:6: warning: no previous prototype for 'aw963xx_deinit' [-Wmissing-prototypes]
     974 | void aw963xx_deinit(struct aw_sar *p_sar)
         |      ^~~~~~~~~~~~~~
   drivers/input/misc/aw_sar/./aw963xx/aw963xx.c: In function 'aw963xx_deinit':
   drivers/input/misc/aw_sar/./aw963xx/aw963xx.c:976:25: warning: variable 'aw963xx' set but not used [-Wunused-but-set-variable]
     976 |         struct aw963xx *aw963xx;
         |                         ^~~~~~~
--
>> drivers/input/misc/aw_sar/./comm/aw_sar_comm_interface.c:39: warning: Cannot understand  * @brief Read register interface
    on line 39 - I thought it was a doc line
>> drivers/input/misc/aw_sar/./comm/aw_sar_comm_interface.c:80: warning: Cannot understand  * @brief write register interface
    on line 80 - I thought it was a doc line
>> drivers/input/misc/aw_sar/./comm/aw_sar_comm_interface.c:125: warning: Cannot understand  * @brief Write the corresponding bit of the register
    on line 125 - I thought it was a doc line
>> drivers/input/misc/aw_sar/./comm/aw_sar_comm_interface.c:147: warning: Cannot understand  * @brief Continuously write data to the chip
    on line 147 - I thought it was a doc line
>> drivers/input/misc/aw_sar/./comm/aw_sar_comm_interface.c:177: warning: Cannot understand  * @brief Continuously Read data from chip
    on line 177 - I thought it was a doc line
>> drivers/input/misc/aw_sar/./comm/aw_sar_comm_interface.c:237: warning: Cannot understand  *
    on line 237 - I thought it was a doc line
>> drivers/input/misc/aw_sar/./comm/aw_sar_comm_interface.c:544: warning: Cannot understand  * @brief Parse bin file
    on line 544 - I thought it was a doc line
>> drivers/input/misc/aw_sar/./comm/aw_sar_comm_interface.c:599: warning: Cannot understand  * @brief Calculate the second power
    on line 599 - I thought it was a doc line
   drivers/input/misc/aw_sar/./comm/aw_sar_comm_interface.c:620: warning: Cannot understand  * @brief Calculate the second power
    on line 620 - I thought it was a doc line
--
>> drivers/input/misc/aw_sar/./aw963xx/aw963xx.c:66: warning: Cannot understand  * @brief  |----------------code ram-----------------|
    on line 66 - I thought it was a doc line
--
>> drivers/input/misc/aw_sar/aw_sar.c:1647: warning: Cannot understand  * @brief sar sensor initialization logic.
    on line 1647 - I thought it was a doc line
>> drivers/input/misc/aw_sar/aw_sar.c:1750: warning: Cannot understand  * @brief Distinguish different chips by chip name and obtain relevant chip information
    on line 1750 - I thought it was a doc line
>> drivers/input/misc/aw_sar/aw_sar.c:1825: warning: Cannot understand  * @brief Drive logic entry
    on line 1825 - I thought it was a doc line


vim +489 drivers/input/misc/aw_sar/./comm/aw_sar_comm_interface.c

b01a8a3a3fadc9 shuaijie wang 2024-05-29  477  
b01a8a3a3fadc9 shuaijie wang 2024-05-29  478  /********************************************************
b01a8a3a3fadc9 shuaijie wang 2024-05-29  479   *
b01a8a3a3fadc9 shuaijie wang 2024-05-29  480   * If the bin framework header version is 1.0.0,
b01a8a3a3fadc9 shuaijie wang 2024-05-29  481   * determine the data type of bin, and then perform different processing
b01a8a3a3fadc9 shuaijie wang 2024-05-29  482   * according to the data type
b01a8a3a3fadc9 shuaijie wang 2024-05-29  483   * If it is a single bin data type, write the data directly into the structure array
b01a8a3a3fadc9 shuaijie wang 2024-05-29  484   * If it is a multi-bin data type, first obtain the number of bins,
b01a8a3a3fadc9 shuaijie wang 2024-05-29  485   * and then recursively call the bin frame header processing function
b01a8a3a3fadc9 shuaijie wang 2024-05-29  486   * according to the bin number to process the frame header information of each bin separately
b01a8a3a3fadc9 shuaijie wang 2024-05-29  487   *
b01a8a3a3fadc9 shuaijie wang 2024-05-29  488   ********************************************************/
b01a8a3a3fadc9 shuaijie wang 2024-05-29 @489  static enum aw_bin_err_val aw_parse_bin_header_1_0_0(struct aw_bin *bin)
b01a8a3a3fadc9 shuaijie wang 2024-05-29  490  {
b01a8a3a3fadc9 shuaijie wang 2024-05-29  491  	unsigned int bin_data_type;
b01a8a3a3fadc9 shuaijie wang 2024-05-29  492  	enum aw_bin_err_val ret;
b01a8a3a3fadc9 shuaijie wang 2024-05-29  493  
b01a8a3a3fadc9 shuaijie wang 2024-05-29  494  	bin_data_type = AW_SAR_GET_32_DATA(*(bin->p_addr + 11),
b01a8a3a3fadc9 shuaijie wang 2024-05-29  495  				    *(bin->p_addr + 10),
b01a8a3a3fadc9 shuaijie wang 2024-05-29  496  				    *(bin->p_addr + 9), *(bin->p_addr + 8));
b01a8a3a3fadc9 shuaijie wang 2024-05-29  497  	switch (bin_data_type) {
b01a8a3a3fadc9 shuaijie wang 2024-05-29  498  	case DATA_TYPE_REGISTER:
b01a8a3a3fadc9 shuaijie wang 2024-05-29  499  	case DATA_TYPE_DSP_REG:
b01a8a3a3fadc9 shuaijie wang 2024-05-29  500  	case DATA_TYPE_SOC_APP:
b01a8a3a3fadc9 shuaijie wang 2024-05-29  501  		// Divided into two processing methods,
b01a8a3a3fadc9 shuaijie wang 2024-05-29  502  		// one is single bin processing,
b01a8a3a3fadc9 shuaijie wang 2024-05-29  503  		// and the other is single bin processing in multi bin
b01a8a3a3fadc9 shuaijie wang 2024-05-29  504  		bin->single_bin_parse_num += 1;
b01a8a3a3fadc9 shuaijie wang 2024-05-29  505  		if (!bin->multi_bin_parse_num)
b01a8a3a3fadc9 shuaijie wang 2024-05-29  506  			bin->header_info[bin->all_bin_parse_num].valid_data_addr = 60;
b01a8a3a3fadc9 shuaijie wang 2024-05-29  507  		aw_get_single_bin_header_1_0_0(bin);
b01a8a3a3fadc9 shuaijie wang 2024-05-29  508  		break;
b01a8a3a3fadc9 shuaijie wang 2024-05-29  509  	case DATA_TYPE_MULTI_BINS:
b01a8a3a3fadc9 shuaijie wang 2024-05-29  510  		/* Get the number of times to enter multi bins */
b01a8a3a3fadc9 shuaijie wang 2024-05-29  511  		bin->multi_bin_parse_num += 1;
b01a8a3a3fadc9 shuaijie wang 2024-05-29  512  		ret = aw_get_multi_bin_header_1_0_0(bin);
b01a8a3a3fadc9 shuaijie wang 2024-05-29  513  		if (ret < 0)
b01a8a3a3fadc9 shuaijie wang 2024-05-29  514  			return ret;
b01a8a3a3fadc9 shuaijie wang 2024-05-29  515  		break;
b01a8a3a3fadc9 shuaijie wang 2024-05-29  516  	default:
b01a8a3a3fadc9 shuaijie wang 2024-05-29  517  		return AW_BIN_ERROR_DATA_TYPE;
b01a8a3a3fadc9 shuaijie wang 2024-05-29  518  	}
b01a8a3a3fadc9 shuaijie wang 2024-05-29  519  	return AW_BIN_ERROR_NONE;
b01a8a3a3fadc9 shuaijie wang 2024-05-29  520  }
b01a8a3a3fadc9 shuaijie wang 2024-05-29  521  
b01a8a3a3fadc9 shuaijie wang 2024-05-29  522  /* get the bin's header version */
b01a8a3a3fadc9 shuaijie wang 2024-05-29  523  static enum aw_bin_err_val aw_check_bin_header_version(struct aw_bin *bin)
b01a8a3a3fadc9 shuaijie wang 2024-05-29  524  {
b01a8a3a3fadc9 shuaijie wang 2024-05-29  525  	unsigned int header_version;
b01a8a3a3fadc9 shuaijie wang 2024-05-29  526  	enum aw_bin_err_val ret;
b01a8a3a3fadc9 shuaijie wang 2024-05-29  527  
b01a8a3a3fadc9 shuaijie wang 2024-05-29  528  	header_version = AW_SAR_GET_32_DATA(*(bin->p_addr + 7), *(bin->p_addr + 6),
b01a8a3a3fadc9 shuaijie wang 2024-05-29  529  				     *(bin->p_addr + 5), *(bin->p_addr + 4));
b01a8a3a3fadc9 shuaijie wang 2024-05-29  530  
b01a8a3a3fadc9 shuaijie wang 2024-05-29  531  
b01a8a3a3fadc9 shuaijie wang 2024-05-29  532  	// Write data to the corresponding structure array
b01a8a3a3fadc9 shuaijie wang 2024-05-29  533  	// according to different formats of the bin frame header version
b01a8a3a3fadc9 shuaijie wang 2024-05-29  534  	switch (header_version) {
b01a8a3a3fadc9 shuaijie wang 2024-05-29  535  	case HEADER_VERSION_1_0_0:
b01a8a3a3fadc9 shuaijie wang 2024-05-29  536  		ret = aw_parse_bin_header_1_0_0(bin);
b01a8a3a3fadc9 shuaijie wang 2024-05-29  537  		return ret;
b01a8a3a3fadc9 shuaijie wang 2024-05-29  538  	default:
b01a8a3a3fadc9 shuaijie wang 2024-05-29  539  		return AW_BIN_ERROR_HEADER_VERSION;
b01a8a3a3fadc9 shuaijie wang 2024-05-29  540  	}
b01a8a3a3fadc9 shuaijie wang 2024-05-29  541  }
b01a8a3a3fadc9 shuaijie wang 2024-05-29  542  
b01a8a3a3fadc9 shuaijie wang 2024-05-29  543  /**
b01a8a3a3fadc9 shuaijie wang 2024-05-29 @544   * @brief Parse bin file
b01a8a3a3fadc9 shuaijie wang 2024-05-29  545   *
b01a8a3a3fadc9 shuaijie wang 2024-05-29  546   * @param bin: Store the contents of the parsed bin file
b01a8a3a3fadc9 shuaijie wang 2024-05-29  547   * @return 0 if init succeeded, other if error
b01a8a3a3fadc9 shuaijie wang 2024-05-29  548   */
b01a8a3a3fadc9 shuaijie wang 2024-05-29  549  enum aw_bin_err_val aw_sar_parsing_bin_file(struct aw_bin *bin)
b01a8a3a3fadc9 shuaijie wang 2024-05-29  550  {
b01a8a3a3fadc9 shuaijie wang 2024-05-29  551  	enum aw_bin_err_val ret;
b01a8a3a3fadc9 shuaijie wang 2024-05-29  552  	int i;
b01a8a3a3fadc9 shuaijie wang 2024-05-29  553  
b01a8a3a3fadc9 shuaijie wang 2024-05-29  554  	if (!bin)
b01a8a3a3fadc9 shuaijie wang 2024-05-29  555  		return AW_BIN_ERROR_NULL_POINT;
b01a8a3a3fadc9 shuaijie wang 2024-05-29  556  	bin->p_addr = bin->info.data;
b01a8a3a3fadc9 shuaijie wang 2024-05-29  557  	bin->all_bin_parse_num = 0;
b01a8a3a3fadc9 shuaijie wang 2024-05-29  558  	bin->multi_bin_parse_num = 0;
b01a8a3a3fadc9 shuaijie wang 2024-05-29  559  	bin->single_bin_parse_num = 0;
b01a8a3a3fadc9 shuaijie wang 2024-05-29  560  
b01a8a3a3fadc9 shuaijie wang 2024-05-29  561  	/* filling bins header info */
b01a8a3a3fadc9 shuaijie wang 2024-05-29  562  	ret = aw_check_bin_header_version(bin);
b01a8a3a3fadc9 shuaijie wang 2024-05-29  563  	if (ret < 0)
b01a8a3a3fadc9 shuaijie wang 2024-05-29  564  		return ret;
b01a8a3a3fadc9 shuaijie wang 2024-05-29  565  	bin->p_addr = NULL;
b01a8a3a3fadc9 shuaijie wang 2024-05-29  566  
b01a8a3a3fadc9 shuaijie wang 2024-05-29  567  	/* check bin header info */
b01a8a3a3fadc9 shuaijie wang 2024-05-29  568  	for (i = 0; i < bin->all_bin_parse_num; i++) {
b01a8a3a3fadc9 shuaijie wang 2024-05-29  569  		/* check sum */
b01a8a3a3fadc9 shuaijie wang 2024-05-29  570  		ret = aw_check_sum(bin, i);
b01a8a3a3fadc9 shuaijie wang 2024-05-29  571  		if (ret < 0)
b01a8a3a3fadc9 shuaijie wang 2024-05-29  572  			return ret;
b01a8a3a3fadc9 shuaijie wang 2024-05-29  573  
b01a8a3a3fadc9 shuaijie wang 2024-05-29  574  		/* check register num */
b01a8a3a3fadc9 shuaijie wang 2024-05-29  575  		if (bin->header_info[i].bin_data_type == DATA_TYPE_REGISTER) {
b01a8a3a3fadc9 shuaijie wang 2024-05-29  576  			ret = aw_check_register_num_v1(bin, i);
b01a8a3a3fadc9 shuaijie wang 2024-05-29  577  			if (ret < 0)
b01a8a3a3fadc9 shuaijie wang 2024-05-29  578  				return ret;
b01a8a3a3fadc9 shuaijie wang 2024-05-29  579  			/* check dsp reg num */
b01a8a3a3fadc9 shuaijie wang 2024-05-29  580  		} else if (bin->header_info[i].bin_data_type == DATA_TYPE_DSP_REG) {
b01a8a3a3fadc9 shuaijie wang 2024-05-29  581  			ret = aw_check_dsp_reg_num_v1(bin, i);
b01a8a3a3fadc9 shuaijie wang 2024-05-29  582  			if (ret < 0)
b01a8a3a3fadc9 shuaijie wang 2024-05-29  583  				return ret;
b01a8a3a3fadc9 shuaijie wang 2024-05-29  584  			/* check soc app num */
b01a8a3a3fadc9 shuaijie wang 2024-05-29  585  		} else if (bin->header_info[i].bin_data_type == DATA_TYPE_SOC_APP) {
b01a8a3a3fadc9 shuaijie wang 2024-05-29  586  			ret = aw_check_soc_app_num_v1(bin, i);
b01a8a3a3fadc9 shuaijie wang 2024-05-29  587  			if (ret < 0)
b01a8a3a3fadc9 shuaijie wang 2024-05-29  588  				return ret;
b01a8a3a3fadc9 shuaijie wang 2024-05-29  589  		} else {
b01a8a3a3fadc9 shuaijie wang 2024-05-29  590  			bin->header_info[i].valid_data_len = bin->header_info[i].bin_data_len;
b01a8a3a3fadc9 shuaijie wang 2024-05-29  591  		}
b01a8a3a3fadc9 shuaijie wang 2024-05-29  592  	}
b01a8a3a3fadc9 shuaijie wang 2024-05-29  593  
b01a8a3a3fadc9 shuaijie wang 2024-05-29  594  	return AW_BIN_ERROR_NONE;
b01a8a3a3fadc9 shuaijie wang 2024-05-29  595  }
b01a8a3a3fadc9 shuaijie wang 2024-05-29  596  /*********************************Parse bin file code end************************************/
b01a8a3a3fadc9 shuaijie wang 2024-05-29  597  
b01a8a3a3fadc9 shuaijie wang 2024-05-29  598  /**
b01a8a3a3fadc9 shuaijie wang 2024-05-29 @599   * @brief Calculate the second power
b01a8a3a3fadc9 shuaijie wang 2024-05-29  600   *
b01a8a3a3fadc9 shuaijie wang 2024-05-29  601   * @param cnt: ifrequency
b01a8a3a3fadc9 shuaijie wang 2024-05-29  602   * @return the second power
b01a8a3a3fadc9 shuaijie wang 2024-05-29  603   */
b01a8a3a3fadc9 shuaijie wang 2024-05-29  604  uint32_t aw_sar_pow2(uint32_t cnt)
b01a8a3a3fadc9 shuaijie wang 2024-05-29  605  {
b01a8a3a3fadc9 shuaijie wang 2024-05-29  606  	uint32_t sum = 1;
b01a8a3a3fadc9 shuaijie wang 2024-05-29  607  	uint32_t i;
b01a8a3a3fadc9 shuaijie wang 2024-05-29  608  
b01a8a3a3fadc9 shuaijie wang 2024-05-29  609  	if (cnt == 0) {
b01a8a3a3fadc9 shuaijie wang 2024-05-29  610  		sum = 1;
b01a8a3a3fadc9 shuaijie wang 2024-05-29  611  	} else {
b01a8a3a3fadc9 shuaijie wang 2024-05-29  612  		for (i = 0; i < cnt; i++)
b01a8a3a3fadc9 shuaijie wang 2024-05-29  613  			sum *= 2;
b01a8a3a3fadc9 shuaijie wang 2024-05-29  614  	}
b01a8a3a3fadc9 shuaijie wang 2024-05-29  615  
b01a8a3a3fadc9 shuaijie wang 2024-05-29  616  	return sum;
b01a8a3a3fadc9 shuaijie wang 2024-05-29  617  }
b01a8a3a3fadc9 shuaijie wang 2024-05-29  618  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

