Return-Path: <linux-input+bounces-4130-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 170AB8FCDEB
	for <lists+linux-input@lfdr.de>; Wed,  5 Jun 2024 14:56:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 04F871C2193A
	for <lists+linux-input@lfdr.de>; Wed,  5 Jun 2024 12:56:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3EFD195F18;
	Wed,  5 Jun 2024 12:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YCvh/j7m"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82A23195F11;
	Wed,  5 Jun 2024 12:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717589403; cv=none; b=klWp08HQYiwQLRX4/wavcnKgqQjPVgoPOIMRUPhNUwHVmmUM4wsWVHK/LQv328cox390MNc+wNAnSLbBdHuRhjelOWNV//VkSujaESGpEFQQBgJG7MAhedZcyTd2PDi1l9ItzHzIBW0Xz+cYLKQ9/qxNyaJdXyIY+IgTTH1Q6Uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717589403; c=relaxed/simple;
	bh=ihSPMKXJSoDmBmyDelPh8UmHtgY7G0/xWWi0ahTNJbU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YLqMzkKmdaoh9G0A9g2lOmvMvpenSi9bqDIwt+hmTLD22jYjg0eGFKi7VHSZ3XEyHwRb/X4gTP/Hr8vNvoZPN4xIVm4W2cwB37iccU4kc42KntT2ghgbHxhZqzGqW7ZjQHX96ZtY7EUS8r2YsrQY2aYFUPoGBTKwmWLFgdp5AZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YCvh/j7m; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717589402; x=1749125402;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ihSPMKXJSoDmBmyDelPh8UmHtgY7G0/xWWi0ahTNJbU=;
  b=YCvh/j7mWYkj9PFI/qlEpMTb4jxW/RcYVkDUpE1x1tp8tXM0AajAnPwP
   J7T1nRuqYwgvFxXBcOXaJFw+vc+9Oiif63pLiW/pheEy8XGaBRbDJvbHk
   mJZ35O/YmDzdeBbyMDZGKARHElYXXiqKf7oo8ZNYSAo3KZ1JKgmXjusaz
   Vr0MzgKD7cFqtJmVw5+3OAnxdaoZHqGpI1GAKBKcsWEV+DKS1awHkF9Hl
   tdvLoPOG+Fz3QGO6HsWs01ptIpfr7w6lnQHOMIRfWHZw0AtmnFA+pwTk/
   rEoOm6wOmEccH1Ec+bovJ2kcAn/UDVhyFKowh0CAy2tWtSKicp6AgHgge
   Q==;
X-CSE-ConnectionGUID: O3xqMYt0Qty9sEH2rzYa4A==
X-CSE-MsgGUID: 6t0c4/9fT1OT+2p4UDpdpA==
X-IronPort-AV: E=McAfee;i="6600,9927,11093"; a="14148503"
X-IronPort-AV: E=Sophos;i="6.08,216,1712646000"; 
   d="scan'208";a="14148503"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2024 05:10:01 -0700
X-CSE-ConnectionGUID: o9NDg8rCToqIylflJCdoYw==
X-CSE-MsgGUID: SxZDpsUuTpqVY9jVaWhi8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,216,1712646000"; 
   d="scan'208";a="42128819"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 05 Jun 2024 05:09:58 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sEpSl-0001UY-1d;
	Wed, 05 Jun 2024 12:09:55 +0000
Date: Wed, 5 Jun 2024 20:09:44 +0800
From: kernel test robot <lkp@intel.com>
To: wangshuaijie@awinic.com, dmitry.torokhov@gmail.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, jeff@labundy.com,
	linux-input@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, wangshuaijie@awinic.com,
	liweilei@awinic.com, kangjiajun@awinic.com
Subject: Re: [PATCH V2 5/5] Add support for Awinic sar sensor.
Message-ID: <202406051942.zY0QbCfv-lkp@intel.com>
References: <20240605091143.163789-6-wangshuaijie@awinic.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240605091143.163789-6-wangshuaijie@awinic.com>

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 32f88d65f01bf6f45476d7edbe675e44fb9e1d58]

url:    https://github.com/intel-lab-lkp/linux/commits/wangshuaijie-awinic-com/dt-bindings-input-Add-YAML-to-Awinic-sar-sensor/20240605-172023
base:   32f88d65f01bf6f45476d7edbe675e44fb9e1d58
patch link:    https://lore.kernel.org/r/20240605091143.163789-6-wangshuaijie%40awinic.com
patch subject: [PATCH V2 5/5] Add support for Awinic sar sensor.
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20240605/202406051942.zY0QbCfv-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240605/202406051942.zY0QbCfv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406051942.zY0QbCfv-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/input/misc/aw_sar/./comm/aw_sar_comm_interface.c:39: warning: Cannot understand  * @aw_sar_i2c_read() - Read register interface
    on line 39 - I thought it was a doc line
>> drivers/input/misc/aw_sar/./comm/aw_sar_comm_interface.c:80: warning: Cannot understand  * @aw_sar_i2c_write - write register interface
    on line 80 - I thought it was a doc line
>> drivers/input/misc/aw_sar/./comm/aw_sar_comm_interface.c:125: warning: Cannot understand  * @aw_sar_i2c_write_bits() - Write the corresponding bit of the register
    on line 125 - I thought it was a doc line
>> drivers/input/misc/aw_sar/./comm/aw_sar_comm_interface.c:147: warning: Cannot understand  * @aw_sar_i2c_write_seq() - Continuously write data to the chip
    on line 147 - I thought it was a doc line
>> drivers/input/misc/aw_sar/./comm/aw_sar_comm_interface.c:177: warning: Cannot understand  * @aw_sar_i2c_read_seq() - Continuously Read data from chip
    on line 177 - I thought it was a doc line
>> drivers/input/misc/aw_sar/./comm/aw_sar_comm_interface.c:527: warning: Cannot understand  * @aw_sar_parsing_bin_file() - Parse bin file
    on line 527 - I thought it was a doc line
>> drivers/input/misc/aw_sar/./comm/aw_sar_comm_interface.c:582: warning: Cannot understand  * @aw_sar_pow2() - Calculate the second power
    on line 582 - I thought it was a doc line
>> drivers/input/misc/aw_sar/./comm/aw_sar_comm_interface.c:603: warning: Cannot understand  * @aw_sar_load_reg() - Calculate the second power
    on line 603 - I thought it was a doc line
--
>> drivers/input/misc/aw_sar/./aw963xx/aw963xx.c:66: warning: Cannot understand  * @aw963xx_sram_fill_not_wrote_area()
    on line 66 - I thought it was a doc line
--
>> drivers/input/misc/aw_sar/aw_sar.c:1645: warning: Cannot understand  * @aw_sar_chip_init() - sar sensor initialization logic.
    on line 1645 - I thought it was a doc line
>> drivers/input/misc/aw_sar/aw_sar.c:1748: warning: Cannot understand  * @aw_sar_get_chip_info() - Distinguish different chips by chip name and
    on line 1748 - I thought it was a doc line


vim +39 drivers/input/misc/aw_sar/./comm/aw_sar_comm_interface.c

21b7e7a6d412d6 shuaijie wang 2024-06-05   37  
21b7e7a6d412d6 shuaijie wang 2024-06-05   38  /**
21b7e7a6d412d6 shuaijie wang 2024-06-05  @39   * @aw_sar_i2c_read() - Read register interface
21b7e7a6d412d6 shuaijie wang 2024-06-05   40   *
21b7e7a6d412d6 shuaijie wang 2024-06-05   41   * @i2c: i2c client.
21b7e7a6d412d6 shuaijie wang 2024-06-05   42   * @reg_addr16: 16 bit register address.
21b7e7a6d412d6 shuaijie wang 2024-06-05   43   * @reg_data32: 32 bit register data.
21b7e7a6d412d6 shuaijie wang 2024-06-05   44   * @return 0 if init succeeded.
21b7e7a6d412d6 shuaijie wang 2024-06-05   45   */
21b7e7a6d412d6 shuaijie wang 2024-06-05   46  int32_t aw_sar_i2c_read(struct i2c_client *i2c, uint16_t reg_addr16,  uint32_t *reg_data32)
21b7e7a6d412d6 shuaijie wang 2024-06-05   47  {
21b7e7a6d412d6 shuaijie wang 2024-06-05   48  	uint8_t r_buf[6] = { 0 };
21b7e7a6d412d6 shuaijie wang 2024-06-05   49  	int8_t cnt = 5;
21b7e7a6d412d6 shuaijie wang 2024-06-05   50  	int32_t ret;
21b7e7a6d412d6 shuaijie wang 2024-06-05   51  
21b7e7a6d412d6 shuaijie wang 2024-06-05   52  	if (!i2c)
21b7e7a6d412d6 shuaijie wang 2024-06-05   53  		return -EINVAL;
21b7e7a6d412d6 shuaijie wang 2024-06-05   54  
21b7e7a6d412d6 shuaijie wang 2024-06-05   55  	r_buf[0] = (unsigned char)(reg_addr16 >> OFFSET_BIT_8);
21b7e7a6d412d6 shuaijie wang 2024-06-05   56  	r_buf[1] = (unsigned char)(reg_addr16);
21b7e7a6d412d6 shuaijie wang 2024-06-05   57  
21b7e7a6d412d6 shuaijie wang 2024-06-05   58  	do {
21b7e7a6d412d6 shuaijie wang 2024-06-05   59  		ret = awinic_i2c_read(i2c, r_buf, 2, &r_buf[2], 4);
21b7e7a6d412d6 shuaijie wang 2024-06-05   60  		if (ret < 0)
21b7e7a6d412d6 shuaijie wang 2024-06-05   61  			dev_err(&i2c->dev, "i2c read error reg: 0x%04x, ret= %d cnt= %d",
21b7e7a6d412d6 shuaijie wang 2024-06-05   62  					reg_addr16, ret, cnt);
21b7e7a6d412d6 shuaijie wang 2024-06-05   63  		else
21b7e7a6d412d6 shuaijie wang 2024-06-05   64  			break;
21b7e7a6d412d6 shuaijie wang 2024-06-05   65  		usleep_range(2000, 3000);
21b7e7a6d412d6 shuaijie wang 2024-06-05   66  	} while (cnt--);
21b7e7a6d412d6 shuaijie wang 2024-06-05   67  
21b7e7a6d412d6 shuaijie wang 2024-06-05   68  	if (cnt < 0) {
21b7e7a6d412d6 shuaijie wang 2024-06-05   69  		dev_err(&i2c->dev, "i2c read error!");
21b7e7a6d412d6 shuaijie wang 2024-06-05   70  		return ret;
21b7e7a6d412d6 shuaijie wang 2024-06-05   71  	}
21b7e7a6d412d6 shuaijie wang 2024-06-05   72  
21b7e7a6d412d6 shuaijie wang 2024-06-05   73  	*reg_data32 = ((uint32_t)r_buf[5] << OFFSET_BIT_0) | ((uint32_t)r_buf[4] << OFFSET_BIT_8) |
21b7e7a6d412d6 shuaijie wang 2024-06-05   74  		      ((uint32_t)r_buf[3] << OFFSET_BIT_16) | ((uint32_t)r_buf[2] << OFFSET_BIT_24);
21b7e7a6d412d6 shuaijie wang 2024-06-05   75  
21b7e7a6d412d6 shuaijie wang 2024-06-05   76  	return 0;
21b7e7a6d412d6 shuaijie wang 2024-06-05   77  }
21b7e7a6d412d6 shuaijie wang 2024-06-05   78  
21b7e7a6d412d6 shuaijie wang 2024-06-05   79  /**
21b7e7a6d412d6 shuaijie wang 2024-06-05  @80   * @aw_sar_i2c_write - write register interface
21b7e7a6d412d6 shuaijie wang 2024-06-05   81   *
21b7e7a6d412d6 shuaijie wang 2024-06-05   82   * @i2c: i2c client.
21b7e7a6d412d6 shuaijie wang 2024-06-05   83   * @reg_addr16: 16 bit register address.
21b7e7a6d412d6 shuaijie wang 2024-06-05   84   * @reg_data32: 32 bit register data.
21b7e7a6d412d6 shuaijie wang 2024-06-05   85   * @return 0 if init succeeded.
21b7e7a6d412d6 shuaijie wang 2024-06-05   86   */
21b7e7a6d412d6 shuaijie wang 2024-06-05   87  int32_t aw_sar_i2c_write(struct i2c_client *i2c, uint16_t reg_addr16, uint32_t reg_data32)
21b7e7a6d412d6 shuaijie wang 2024-06-05   88  {
21b7e7a6d412d6 shuaijie wang 2024-06-05   89  	uint8_t w_buf[6] = { 0 };
21b7e7a6d412d6 shuaijie wang 2024-06-05   90  	int8_t cnt = 5;
21b7e7a6d412d6 shuaijie wang 2024-06-05   91  	int32_t ret;
21b7e7a6d412d6 shuaijie wang 2024-06-05   92  
21b7e7a6d412d6 shuaijie wang 2024-06-05   93  	if (!i2c)
21b7e7a6d412d6 shuaijie wang 2024-06-05   94  		return -EINVAL;
21b7e7a6d412d6 shuaijie wang 2024-06-05   95  
21b7e7a6d412d6 shuaijie wang 2024-06-05   96  	/*reg_addr*/
21b7e7a6d412d6 shuaijie wang 2024-06-05   97  	w_buf[0] = (uint8_t)(reg_addr16 >> OFFSET_BIT_8);
21b7e7a6d412d6 shuaijie wang 2024-06-05   98  	w_buf[1] = (uint8_t)(reg_addr16);
21b7e7a6d412d6 shuaijie wang 2024-06-05   99  	/*data*/
21b7e7a6d412d6 shuaijie wang 2024-06-05  100  	w_buf[2] = (uint8_t)(reg_data32 >> OFFSET_BIT_24);
21b7e7a6d412d6 shuaijie wang 2024-06-05  101  	w_buf[3] = (uint8_t)(reg_data32 >> OFFSET_BIT_16);
21b7e7a6d412d6 shuaijie wang 2024-06-05  102  	w_buf[4] = (uint8_t)(reg_data32 >> OFFSET_BIT_8);
21b7e7a6d412d6 shuaijie wang 2024-06-05  103  	w_buf[5] = (uint8_t)(reg_data32);
21b7e7a6d412d6 shuaijie wang 2024-06-05  104  
21b7e7a6d412d6 shuaijie wang 2024-06-05  105  	do {
21b7e7a6d412d6 shuaijie wang 2024-06-05  106  		ret = awinic_i2c_write(i2c, w_buf, ARRAY_SIZE(w_buf));
21b7e7a6d412d6 shuaijie wang 2024-06-05  107  		if (ret < 0) {
21b7e7a6d412d6 shuaijie wang 2024-06-05  108  			dev_err(&i2c->dev,
21b7e7a6d412d6 shuaijie wang 2024-06-05  109  					"i2c write error reg: 0x%04x data: 0x%08x, ret= %d cnt= %d",
21b7e7a6d412d6 shuaijie wang 2024-06-05  110  					reg_addr16, reg_data32, ret, cnt);
21b7e7a6d412d6 shuaijie wang 2024-06-05  111  		} else {
21b7e7a6d412d6 shuaijie wang 2024-06-05  112  			break;
21b7e7a6d412d6 shuaijie wang 2024-06-05  113  		}
21b7e7a6d412d6 shuaijie wang 2024-06-05  114  	} while (cnt--);
21b7e7a6d412d6 shuaijie wang 2024-06-05  115  
21b7e7a6d412d6 shuaijie wang 2024-06-05  116  	if (cnt < 0) {
21b7e7a6d412d6 shuaijie wang 2024-06-05  117  		dev_err(&i2c->dev, "i2c write error!");
21b7e7a6d412d6 shuaijie wang 2024-06-05  118  		return ret;
21b7e7a6d412d6 shuaijie wang 2024-06-05  119  	}
21b7e7a6d412d6 shuaijie wang 2024-06-05  120  
21b7e7a6d412d6 shuaijie wang 2024-06-05  121  	return 0;
21b7e7a6d412d6 shuaijie wang 2024-06-05  122  }
21b7e7a6d412d6 shuaijie wang 2024-06-05  123  
21b7e7a6d412d6 shuaijie wang 2024-06-05  124  /**
21b7e7a6d412d6 shuaijie wang 2024-06-05 @125   * @aw_sar_i2c_write_bits() - Write the corresponding bit of the register
21b7e7a6d412d6 shuaijie wang 2024-06-05  126   *
21b7e7a6d412d6 shuaijie wang 2024-06-05  127   * @i2c:i2c client.
21b7e7a6d412d6 shuaijie wang 2024-06-05  128   * @reg_addr16: 16 bit register address.
21b7e7a6d412d6 shuaijie wang 2024-06-05  129   * @mask: Write the corresponding bit as 0
21b7e7a6d412d6 shuaijie wang 2024-06-05  130   * @val: Write corresponding data to the register
21b7e7a6d412d6 shuaijie wang 2024-06-05  131   * @return 0 if init succeeded.
21b7e7a6d412d6 shuaijie wang 2024-06-05  132   */
21b7e7a6d412d6 shuaijie wang 2024-06-05  133  int32_t
21b7e7a6d412d6 shuaijie wang 2024-06-05  134  aw_sar_i2c_write_bits(struct i2c_client *i2c, uint16_t reg_addr16, uint32_t mask, uint32_t val)
21b7e7a6d412d6 shuaijie wang 2024-06-05  135  {
21b7e7a6d412d6 shuaijie wang 2024-06-05  136  	uint32_t reg_val;
21b7e7a6d412d6 shuaijie wang 2024-06-05  137  
21b7e7a6d412d6 shuaijie wang 2024-06-05  138  	aw_sar_i2c_read(i2c, reg_addr16, &reg_val);
21b7e7a6d412d6 shuaijie wang 2024-06-05  139  	reg_val &= mask;
21b7e7a6d412d6 shuaijie wang 2024-06-05  140  	reg_val |= (val & (~mask));
21b7e7a6d412d6 shuaijie wang 2024-06-05  141  	aw_sar_i2c_write(i2c, reg_addr16, reg_val);
21b7e7a6d412d6 shuaijie wang 2024-06-05  142  
21b7e7a6d412d6 shuaijie wang 2024-06-05  143  	return 0;
21b7e7a6d412d6 shuaijie wang 2024-06-05  144  }
21b7e7a6d412d6 shuaijie wang 2024-06-05  145  
21b7e7a6d412d6 shuaijie wang 2024-06-05  146  /**
21b7e7a6d412d6 shuaijie wang 2024-06-05 @147   * @aw_sar_i2c_write_seq() - Continuously write data to the chip
21b7e7a6d412d6 shuaijie wang 2024-06-05  148   *
21b7e7a6d412d6 shuaijie wang 2024-06-05  149   * @i2c:i2c client.
21b7e7a6d412d6 shuaijie wang 2024-06-05  150   * @tr_data: Data written
21b7e7a6d412d6 shuaijie wang 2024-06-05  151   * @len: Length of data written
21b7e7a6d412d6 shuaijie wang 2024-06-05  152   * @return 0 if init succeeded.
21b7e7a6d412d6 shuaijie wang 2024-06-05  153   */
21b7e7a6d412d6 shuaijie wang 2024-06-05  154  int32_t aw_sar_i2c_write_seq(struct i2c_client *i2c, uint8_t *tr_data, uint16_t len)
21b7e7a6d412d6 shuaijie wang 2024-06-05  155  {
21b7e7a6d412d6 shuaijie wang 2024-06-05  156  	int8_t cnt = AW_RETRIES;
21b7e7a6d412d6 shuaijie wang 2024-06-05  157  	int32_t ret;
21b7e7a6d412d6 shuaijie wang 2024-06-05  158  
21b7e7a6d412d6 shuaijie wang 2024-06-05  159  	do {
21b7e7a6d412d6 shuaijie wang 2024-06-05  160  		ret = awinic_i2c_write(i2c, tr_data, len);
21b7e7a6d412d6 shuaijie wang 2024-06-05  161  		if (ret < 0)
21b7e7a6d412d6 shuaijie wang 2024-06-05  162  			dev_err(&i2c->dev, "awinic i2c write seq error %d", ret);
21b7e7a6d412d6 shuaijie wang 2024-06-05  163  		else
21b7e7a6d412d6 shuaijie wang 2024-06-05  164  			break;
21b7e7a6d412d6 shuaijie wang 2024-06-05  165  		usleep_range(AW_I2C_RW_RETRY_TIME_MIN, AW_I2C_RW_RETRY_TIME_MAX);
21b7e7a6d412d6 shuaijie wang 2024-06-05  166  	} while (cnt--);
21b7e7a6d412d6 shuaijie wang 2024-06-05  167  
21b7e7a6d412d6 shuaijie wang 2024-06-05  168  	if (cnt < 0) {
21b7e7a6d412d6 shuaijie wang 2024-06-05  169  		dev_err(&i2c->dev, "awinic i2c write error!");
21b7e7a6d412d6 shuaijie wang 2024-06-05  170  		return ret;
21b7e7a6d412d6 shuaijie wang 2024-06-05  171  	}
21b7e7a6d412d6 shuaijie wang 2024-06-05  172  
21b7e7a6d412d6 shuaijie wang 2024-06-05  173  	return 0;
21b7e7a6d412d6 shuaijie wang 2024-06-05  174  }
21b7e7a6d412d6 shuaijie wang 2024-06-05  175  
21b7e7a6d412d6 shuaijie wang 2024-06-05  176  /**
21b7e7a6d412d6 shuaijie wang 2024-06-05 @177   * @aw_sar_i2c_read_seq() - Continuously Read data from chip
21b7e7a6d412d6 shuaijie wang 2024-06-05  178   *
21b7e7a6d412d6 shuaijie wang 2024-06-05  179   * @i2c:i2c client.
21b7e7a6d412d6 shuaijie wang 2024-06-05  180   * @addr: Read address
21b7e7a6d412d6 shuaijie wang 2024-06-05  181   * @addr_len: Length of read address (byte)
21b7e7a6d412d6 shuaijie wang 2024-06-05  182   * @data: Data written
21b7e7a6d412d6 shuaijie wang 2024-06-05  183   * @data_len: Length of data written
21b7e7a6d412d6 shuaijie wang 2024-06-05  184   * @return 0 if init succeeded.
21b7e7a6d412d6 shuaijie wang 2024-06-05  185   */
21b7e7a6d412d6 shuaijie wang 2024-06-05  186  int32_t aw_sar_i2c_read_seq(struct i2c_client *i2c, uint8_t *addr,
21b7e7a6d412d6 shuaijie wang 2024-06-05  187  				uint8_t addr_len, uint8_t *data, uint16_t data_len)
21b7e7a6d412d6 shuaijie wang 2024-06-05  188  {
21b7e7a6d412d6 shuaijie wang 2024-06-05  189  	int8_t cnt = AW_RETRIES;
21b7e7a6d412d6 shuaijie wang 2024-06-05  190  	int32_t ret;
21b7e7a6d412d6 shuaijie wang 2024-06-05  191  
21b7e7a6d412d6 shuaijie wang 2024-06-05  192  	do {
21b7e7a6d412d6 shuaijie wang 2024-06-05  193  		ret = awinic_i2c_read(i2c, addr, addr_len, data, data_len);
21b7e7a6d412d6 shuaijie wang 2024-06-05  194  		if (ret < 0)
21b7e7a6d412d6 shuaijie wang 2024-06-05  195  			dev_err(&i2c->dev, "awinic sar i2c write error %d", ret);
21b7e7a6d412d6 shuaijie wang 2024-06-05  196  		else
21b7e7a6d412d6 shuaijie wang 2024-06-05  197  			break;
21b7e7a6d412d6 shuaijie wang 2024-06-05  198  		usleep_range(AW_I2C_RW_RETRY_TIME_MIN, AW_I2C_RW_RETRY_TIME_MAX);
21b7e7a6d412d6 shuaijie wang 2024-06-05  199  	} while (cnt--);
21b7e7a6d412d6 shuaijie wang 2024-06-05  200  
21b7e7a6d412d6 shuaijie wang 2024-06-05  201  	if (cnt < 0) {
21b7e7a6d412d6 shuaijie wang 2024-06-05  202  		dev_err(&i2c->dev, "awinic sar i2c read error!");
21b7e7a6d412d6 shuaijie wang 2024-06-05  203  		return ret;
21b7e7a6d412d6 shuaijie wang 2024-06-05  204  	}
21b7e7a6d412d6 shuaijie wang 2024-06-05  205  
21b7e7a6d412d6 shuaijie wang 2024-06-05  206  	return 0;
21b7e7a6d412d6 shuaijie wang 2024-06-05  207  }
21b7e7a6d412d6 shuaijie wang 2024-06-05  208  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

