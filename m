Return-Path: <linux-input+bounces-5409-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4255594A724
	for <lists+linux-input@lfdr.de>; Wed,  7 Aug 2024 13:44:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F0E8B28226C
	for <lists+linux-input@lfdr.de>; Wed,  7 Aug 2024 11:44:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C7171E288B;
	Wed,  7 Aug 2024 11:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SbdEeVJz"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC5FC1DF68A;
	Wed,  7 Aug 2024 11:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723031059; cv=none; b=CUI+AQUY5xoXkeKZ6vpgkt/odiUBfB7kBrCPWtZmtCj+jWXSHp3Ea+Gj9aDYpcbNykEIKDWsy2J4Rxw4/eGuXHkqAl92PNKLEjlVXyK1nspBT5W4K9hKEeasgT+fYEdjIU/Zsh4puntqJU8+O0LxrW/q9SWstqERbHCroo1sjQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723031059; c=relaxed/simple;
	bh=Q+lQTRThOqbJKr3mxGSgIBGBexoepsWD38fgDrU2y0c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HmlfkftcpjqnWMM36beamjhnOGLkTfQrACvo57LQwkIVuNAyiZL3DYcxLoW0pG81DmRPJBIgHrKBwhBiO44McQvLLnOXQDXgrNOgjJtfR/TxdbScH12lmkr5xWohpypKD9VWx+4OTKAbIcLJyNcsMNEG0cs1iqWtKdyEI4BhDWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SbdEeVJz; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723031057; x=1754567057;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Q+lQTRThOqbJKr3mxGSgIBGBexoepsWD38fgDrU2y0c=;
  b=SbdEeVJzy56YUVaIBR7a+x2A0VIU2MqnSfeLBxvTusVXbGhd+V0Z6tJs
   D8wi0wayp8nO7VHo23EbrF4jEcLUDY2uhu+0VdH6dv9okw5DrzozXuQWt
   gFYPE1J2i5LNo9NYNaYW42Op459C+baSZVgpy3JmW2/4/a/ZfULBa9eye
   Z4CKpxuJNiov1Yz2BtklPvatTsD0lXSVENu+3j5Adh3upjIm9t6hdXPrg
   P22g3Hb1LCqWjad+r6U2JKQV9lYOYoHq1uu90DFSv8lpeBkIHOXS3YLne
   XubQMnK197ejDEX84woOsgy3r2ZdB4cGy9cpPtUvwo94xpWlaGMZcM2HI
   Q==;
X-CSE-ConnectionGUID: JuG6PShsTMOMZk0Wdw76ZA==
X-CSE-MsgGUID: EsCkeb4QRKmJOlXoE5pu6w==
X-IronPort-AV: E=McAfee;i="6700,10204,11156"; a="31725182"
X-IronPort-AV: E=Sophos;i="6.09,269,1716274800"; 
   d="scan'208";a="31725182"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2024 04:44:16 -0700
X-CSE-ConnectionGUID: DXZuJho/Qrq+w4+pWJOVcg==
X-CSE-MsgGUID: GBGc5AFnTnuN24MxpgTHMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,269,1716274800"; 
   d="scan'208";a="56693885"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 07 Aug 2024 04:44:14 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sbf5P-0005Ke-1X;
	Wed, 07 Aug 2024 11:44:11 +0000
Date: Wed, 7 Aug 2024 19:43:24 +0800
From: kernel test robot <lkp@intel.com>
To: "Luke D. Jones" <luke@ljones.dev>, linux-input@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	bentiss@kernel.org, jikos@kernel.org,
	"Luke D. Jones" <luke@ljones.dev>
Subject: Re: [PATCH] hid-asus-ally: Add full gamepad support
Message-ID: <202408071932.E7Cxqi0x-lkp@intel.com>
References: <20240806081212.56860-1-luke@ljones.dev>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240806081212.56860-1-luke@ljones.dev>

Hi Luke,

kernel test robot noticed the following build warnings:

[auto build test WARNING on hid/for-next]
[also build test WARNING on next-20240807]
[cannot apply to linus/master v6.11-rc2]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Luke-D-Jones/hid-asus-ally-Add-full-gamepad-support/20240806-170850
base:   https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git for-next
patch link:    https://lore.kernel.org/r/20240806081212.56860-1-luke%40ljones.dev
patch subject: [PATCH] hid-asus-ally: Add full gamepad support
config: csky-randconfig-r113-20240807 (https://download.01.org/0day-ci/archive/20240807/202408071932.E7Cxqi0x-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20240807/202408071932.E7Cxqi0x-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408071932.E7Cxqi0x-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/hid/hid-asus-ally.c:561:1: sparse: sparse: symbol 'dev_attr_ally_x_qam_mode' was not declared. Should it be static?
>> drivers/hid/hid-asus-ally.c:845:1: sparse: sparse: symbol 'dev_attr_btn_mapping_apply' was not declared. Should it be static?
>> drivers/hid/hid-asus-ally.c:884:1: sparse: sparse: symbol 'dev_attr_btn_mapping_m2' was not declared. Should it be static?
>> drivers/hid/hid-asus-ally.c:884:1: sparse: sparse: symbol 'dev_attr_btn_mapping_m2_macro' was not declared. Should it be static?
>> drivers/hid/hid-asus-ally.c:884:1: sparse: sparse: symbol 'dev_attr_btn_mapping_m2_turbo' was not declared. Should it be static?
>> drivers/hid/hid-asus-ally.c:885:1: sparse: sparse: symbol 'dev_attr_btn_mapping_m1' was not declared. Should it be static?
>> drivers/hid/hid-asus-ally.c:885:1: sparse: sparse: symbol 'dev_attr_btn_mapping_m1_macro' was not declared. Should it be static?
>> drivers/hid/hid-asus-ally.c:885:1: sparse: sparse: symbol 'dev_attr_btn_mapping_m1_turbo' was not declared. Should it be static?
>> drivers/hid/hid-asus-ally.c:886:1: sparse: sparse: symbol 'dev_attr_btn_mapping_a' was not declared. Should it be static?
>> drivers/hid/hid-asus-ally.c:886:1: sparse: sparse: symbol 'dev_attr_btn_mapping_a_macro' was not declared. Should it be static?
>> drivers/hid/hid-asus-ally.c:886:1: sparse: sparse: symbol 'dev_attr_btn_mapping_a_turbo' was not declared. Should it be static?
>> drivers/hid/hid-asus-ally.c:887:1: sparse: sparse: symbol 'dev_attr_btn_mapping_b' was not declared. Should it be static?
>> drivers/hid/hid-asus-ally.c:887:1: sparse: sparse: symbol 'dev_attr_btn_mapping_b_macro' was not declared. Should it be static?
>> drivers/hid/hid-asus-ally.c:887:1: sparse: sparse: symbol 'dev_attr_btn_mapping_b_turbo' was not declared. Should it be static?
>> drivers/hid/hid-asus-ally.c:888:1: sparse: sparse: symbol 'dev_attr_btn_mapping_x' was not declared. Should it be static?
>> drivers/hid/hid-asus-ally.c:888:1: sparse: sparse: symbol 'dev_attr_btn_mapping_x_macro' was not declared. Should it be static?
>> drivers/hid/hid-asus-ally.c:888:1: sparse: sparse: symbol 'dev_attr_btn_mapping_x_turbo' was not declared. Should it be static?
>> drivers/hid/hid-asus-ally.c:889:1: sparse: sparse: symbol 'dev_attr_btn_mapping_y' was not declared. Should it be static?
>> drivers/hid/hid-asus-ally.c:889:1: sparse: sparse: symbol 'dev_attr_btn_mapping_y_macro' was not declared. Should it be static?
>> drivers/hid/hid-asus-ally.c:889:1: sparse: sparse: symbol 'dev_attr_btn_mapping_y_turbo' was not declared. Should it be static?
>> drivers/hid/hid-asus-ally.c:890:1: sparse: sparse: symbol 'dev_attr_btn_mapping_lb' was not declared. Should it be static?
>> drivers/hid/hid-asus-ally.c:890:1: sparse: sparse: symbol 'dev_attr_btn_mapping_lb_macro' was not declared. Should it be static?
>> drivers/hid/hid-asus-ally.c:890:1: sparse: sparse: symbol 'dev_attr_btn_mapping_lb_turbo' was not declared. Should it be static?
>> drivers/hid/hid-asus-ally.c:891:1: sparse: sparse: symbol 'dev_attr_btn_mapping_rb' was not declared. Should it be static?
>> drivers/hid/hid-asus-ally.c:891:1: sparse: sparse: symbol 'dev_attr_btn_mapping_rb_macro' was not declared. Should it be static?
>> drivers/hid/hid-asus-ally.c:891:1: sparse: sparse: symbol 'dev_attr_btn_mapping_rb_turbo' was not declared. Should it be static?
>> drivers/hid/hid-asus-ally.c:892:1: sparse: sparse: symbol 'dev_attr_btn_mapping_ls' was not declared. Should it be static?
>> drivers/hid/hid-asus-ally.c:892:1: sparse: sparse: symbol 'dev_attr_btn_mapping_ls_macro' was not declared. Should it be static?
>> drivers/hid/hid-asus-ally.c:892:1: sparse: sparse: symbol 'dev_attr_btn_mapping_ls_turbo' was not declared. Should it be static?
>> drivers/hid/hid-asus-ally.c:893:1: sparse: sparse: symbol 'dev_attr_btn_mapping_rs' was not declared. Should it be static?
>> drivers/hid/hid-asus-ally.c:893:1: sparse: sparse: symbol 'dev_attr_btn_mapping_rs_macro' was not declared. Should it be static?
>> drivers/hid/hid-asus-ally.c:893:1: sparse: sparse: symbol 'dev_attr_btn_mapping_rs_turbo' was not declared. Should it be static?
>> drivers/hid/hid-asus-ally.c:894:1: sparse: sparse: symbol 'dev_attr_btn_mapping_lt' was not declared. Should it be static?
>> drivers/hid/hid-asus-ally.c:894:1: sparse: sparse: symbol 'dev_attr_btn_mapping_lt_macro' was not declared. Should it be static?
>> drivers/hid/hid-asus-ally.c:894:1: sparse: sparse: symbol 'dev_attr_btn_mapping_lt_turbo' was not declared. Should it be static?
>> drivers/hid/hid-asus-ally.c:895:1: sparse: sparse: symbol 'dev_attr_btn_mapping_rt' was not declared. Should it be static?
>> drivers/hid/hid-asus-ally.c:895:1: sparse: sparse: symbol 'dev_attr_btn_mapping_rt_macro' was not declared. Should it be static?
>> drivers/hid/hid-asus-ally.c:895:1: sparse: sparse: symbol 'dev_attr_btn_mapping_rt_turbo' was not declared. Should it be static?
>> drivers/hid/hid-asus-ally.c:896:1: sparse: sparse: symbol 'dev_attr_btn_mapping_dpad_u' was not declared. Should it be static?
>> drivers/hid/hid-asus-ally.c:896:1: sparse: sparse: symbol 'dev_attr_btn_mapping_dpad_u_macro' was not declared. Should it be static?
>> drivers/hid/hid-asus-ally.c:896:1: sparse: sparse: symbol 'dev_attr_btn_mapping_dpad_u_turbo' was not declared. Should it be static?
>> drivers/hid/hid-asus-ally.c:897:1: sparse: sparse: symbol 'dev_attr_btn_mapping_dpad_d' was not declared. Should it be static?
>> drivers/hid/hid-asus-ally.c:897:1: sparse: sparse: symbol 'dev_attr_btn_mapping_dpad_d_macro' was not declared. Should it be static?
>> drivers/hid/hid-asus-ally.c:897:1: sparse: sparse: symbol 'dev_attr_btn_mapping_dpad_d_turbo' was not declared. Should it be static?
>> drivers/hid/hid-asus-ally.c:898:1: sparse: sparse: symbol 'dev_attr_btn_mapping_dpad_l' was not declared. Should it be static?
>> drivers/hid/hid-asus-ally.c:898:1: sparse: sparse: symbol 'dev_attr_btn_mapping_dpad_l_macro' was not declared. Should it be static?
>> drivers/hid/hid-asus-ally.c:898:1: sparse: sparse: symbol 'dev_attr_btn_mapping_dpad_l_turbo' was not declared. Should it be static?
>> drivers/hid/hid-asus-ally.c:899:1: sparse: sparse: symbol 'dev_attr_btn_mapping_dpad_r' was not declared. Should it be static?
>> drivers/hid/hid-asus-ally.c:899:1: sparse: sparse: symbol 'dev_attr_btn_mapping_dpad_r_macro' was not declared. Should it be static?
>> drivers/hid/hid-asus-ally.c:899:1: sparse: sparse: symbol 'dev_attr_btn_mapping_dpad_r_turbo' was not declared. Should it be static?
>> drivers/hid/hid-asus-ally.c:900:1: sparse: sparse: symbol 'dev_attr_btn_mapping_view' was not declared. Should it be static?
>> drivers/hid/hid-asus-ally.c:900:1: sparse: sparse: symbol 'dev_attr_btn_mapping_view_macro' was not declared. Should it be static?
>> drivers/hid/hid-asus-ally.c:900:1: sparse: sparse: symbol 'dev_attr_btn_mapping_view_turbo' was not declared. Should it be static?
>> drivers/hid/hid-asus-ally.c:901:1: sparse: sparse: symbol 'dev_attr_btn_mapping_menu' was not declared. Should it be static?
>> drivers/hid/hid-asus-ally.c:901:1: sparse: sparse: symbol 'dev_attr_btn_mapping_menu_macro' was not declared. Should it be static?
>> drivers/hid/hid-asus-ally.c:901:1: sparse: sparse: symbol 'dev_attr_btn_mapping_menu_turbo' was not declared. Should it be static?
>> drivers/hid/hid-asus-ally.c:952:1: sparse: sparse: symbol 'dev_attr_btn_mapping_reset' was not declared. Should it be static?
>> drivers/hid/hid-asus-ally.c:1028:1: sparse: sparse: symbol 'dev_attr_gamepad_mode' was not declared. Should it be static?
>> drivers/hid/hid-asus-ally.c:1037:1: sparse: sparse: symbol 'dev_attr_gamepad_vibration_intensity_index' was not declared. Should it be static?
>> drivers/hid/hid-asus-ally.c:1115:1: sparse: sparse: symbol 'dev_attr_gamepad_vibration_intensity' was not declared. Should it be static?
>> drivers/hid/hid-asus-ally.c:1202:1: sparse: sparse: symbol 'dev_attr_axis_xyz_deadzone_index' was not declared. Should it be static?
>> drivers/hid/hid-asus-ally.c:1204:1: sparse: sparse: symbol 'dev_attr_xpad_axis_xy_left_deadzone' was not declared. Should it be static?
>> drivers/hid/hid-asus-ally.c:1205:1: sparse: sparse: symbol 'dev_attr_xpad_axis_xy_right_deadzone' was not declared. Should it be static?
>> drivers/hid/hid-asus-ally.c:1206:1: sparse: sparse: symbol 'dev_attr_xpad_axis_z_left_deadzone' was not declared. Should it be static?
>> drivers/hid/hid-asus-ally.c:1207:1: sparse: sparse: symbol 'dev_attr_xpad_axis_z_right_deadzone' was not declared. Should it be static?
>> drivers/hid/hid-asus-ally.c:1288:1: sparse: sparse: symbol 'dev_attr_xpad_axis_xy_left_ADZ' was not declared. Should it be static?
>> drivers/hid/hid-asus-ally.c:1313:1: sparse: sparse: symbol 'dev_attr_xpad_axis_xy_right_ADZ' was not declared. Should it be static?
>> drivers/hid/hid-asus-ally.c:1321:1: sparse: sparse: symbol 'dev_attr_rc_point_index' was not declared. Should it be static?
>> drivers/hid/hid-asus-ally.c:1390:1: sparse: sparse: symbol 'dev_attr_rc_point_left_1' was not declared. Should it be static?
>> drivers/hid/hid-asus-ally.c:1391:1: sparse: sparse: symbol 'dev_attr_rc_point_left_2' was not declared. Should it be static?
>> drivers/hid/hid-asus-ally.c:1392:1: sparse: sparse: symbol 'dev_attr_rc_point_left_3' was not declared. Should it be static?
>> drivers/hid/hid-asus-ally.c:1393:1: sparse: sparse: symbol 'dev_attr_rc_point_left_4' was not declared. Should it be static?
>> drivers/hid/hid-asus-ally.c:1395:1: sparse: sparse: symbol 'dev_attr_rc_point_right_1' was not declared. Should it be static?
>> drivers/hid/hid-asus-ally.c:1396:1: sparse: sparse: symbol 'dev_attr_rc_point_right_2' was not declared. Should it be static?
>> drivers/hid/hid-asus-ally.c:1397:1: sparse: sparse: symbol 'dev_attr_rc_point_right_3' was not declared. Should it be static?
>> drivers/hid/hid-asus-ally.c:1398:1: sparse: sparse: symbol 'dev_attr_rc_point_right_4' was not declared. Should it be static?
>> drivers/hid/hid-asus-ally.c:1586:1: sparse: sparse: symbol 'dev_attr_xpad_axis_xy_left_cal' was not declared. Should it be static?
>> drivers/hid/hid-asus-ally.c:1587:1: sparse: sparse: symbol 'dev_attr_xpad_axis_xy_right_cal' was not declared. Should it be static?
>> drivers/hid/hid-asus-ally.c:1588:1: sparse: sparse: symbol 'dev_attr_xpad_axis_z_left_cal' was not declared. Should it be static?
>> drivers/hid/hid-asus-ally.c:1589:1: sparse: sparse: symbol 'dev_attr_xpad_axis_z_right_cal' was not declared. Should it be static?
>> drivers/hid/hid-asus-ally.c:1597:1: sparse: sparse: symbol 'dev_attr_xpad_axis_xy_cal_index' was not declared. Should it be static?
>> drivers/hid/hid-asus-ally.c:1605:1: sparse: sparse: symbol 'dev_attr_xpad_axis_z_cal_index' was not declared. Should it be static?
>> drivers/hid/hid-asus-ally.c:1643:1: sparse: sparse: symbol 'dev_attr_xpad_axis_xy_left_cal_reset' was not declared. Should it be static?
>> drivers/hid/hid-asus-ally.c:1644:1: sparse: sparse: symbol 'dev_attr_xpad_axis_xy_right_cal_reset' was not declared. Should it be static?
>> drivers/hid/hid-asus-ally.c:1645:1: sparse: sparse: symbol 'dev_attr_xpad_axis_z_left_cal_reset' was not declared. Should it be static?
>> drivers/hid/hid-asus-ally.c:1646:1: sparse: sparse: symbol 'dev_attr_xpad_axis_z_right_cal_reset' was not declared. Should it be static?

vim +/dev_attr_ally_x_qam_mode +561 drivers/hid/hid-asus-ally.c

   545	
   546	static ssize_t ally_x_qam_mode_store(struct device *dev, struct device_attribute *attr,
   547					     const char *buf, size_t count)
   548	{
   549		struct ally_x_device *ally_x = drvdata.ally_x;
   550		bool val;
   551		int ret;
   552	
   553		ret = kstrtobool(buf, &val);
   554		if (ret < 0)
   555			return ret;
   556	
   557		ally_x->qam_btns_steam_mode = val;
   558	
   559		return count;
   560	}
 > 561	ALLY_DEVICE_ATTR_RW(ally_x_qam_mode, qam_mode);
   562	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

