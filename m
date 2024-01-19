Return-Path: <linux-input+bounces-1352-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A2709833105
	for <lists+linux-input@lfdr.de>; Fri, 19 Jan 2024 23:56:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3FE721F21F99
	for <lists+linux-input@lfdr.de>; Fri, 19 Jan 2024 22:56:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D0EE56B7B;
	Fri, 19 Jan 2024 22:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Pi62taVs"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E670E56770
	for <linux-input@vger.kernel.org>; Fri, 19 Jan 2024 22:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.134.136.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705704981; cv=none; b=QhrizvdUDMSo3nowA91XkSbJLId4YA3MMnnZa6BqHd2Q/0Fc5s+yqrV12uoCNS+T2qba+GYrhQGuIdZ+QLYxd2/b6rZBpI58O1Cn+P8Ab/F97gP+LIU3NAHuLusUbN05jkCLTrgQVgdsHMNEPUHDKzSPKX0hk/bR6FEgD8bCp40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705704981; c=relaxed/simple;
	bh=tN315j0NSemgGjT2ezAHTsuMyOgBcErGqNkbFzkfvmE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lAyqm04JmkOEzhQ12XRr/UkufV1mV37DRBgcvhkJygwYAWC22AV1N+QZsgr2C60z62OVI/togQBhHZAQn/ZjuAIMLYXlyZde2fx9Q1y74Os/dM69NoTj59VKn5pfdSKHIo9Vef+UIFLF6UAbMMQ0dDx3GSVhvJppgoW1D7v0S78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Pi62taVs; arc=none smtp.client-ip=134.134.136.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705704979; x=1737240979;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tN315j0NSemgGjT2ezAHTsuMyOgBcErGqNkbFzkfvmE=;
  b=Pi62taVs5dOxCg5M9vsffegVjFAncD0VqLpXzV3+JJjh8RLmdoU/c5fl
   eFGWj2UkwSfBx46Ll9nZ8DwYQmypZb7k9akG4qnI4ci1syeWvHDDSyJQ4
   IZad8Pc0ctISW58hQWApcstIHZgR5QHBwZRT19TC6O2OiOo/84kuSap73
   +TsS4i1E7gRbfYU67xq+G9YbSuZg084bxH9JI5xJPyU/uXTYPk+u50gOQ
   VIWEd3DY2XXWu1cauAYTPKDDZXyVJt5CB14aIiJ8KN9nNqbjuoXeYYs3I
   3CnYZT5XFdQn7xXwOHuVfVTqTQMrRqxXCNuigSjRC9bdc0AE+8xvoyfYl
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10957"; a="467231465"
X-IronPort-AV: E=Sophos;i="6.05,206,1701158400"; 
   d="scan'208";a="467231465"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2024 14:56:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10957"; a="928492805"
X-IronPort-AV: E=Sophos;i="6.05,206,1701158400"; 
   d="scan'208";a="928492805"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 19 Jan 2024 14:56:17 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rQxmY-0004UG-3A;
	Fri, 19 Jan 2024 22:56:14 +0000
Date: Sat, 20 Jan 2024 06:55:32 +0800
From: kernel test robot <lkp@intel.com>
To: Chris Morgan <macromorgan@hotmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-input@vger.kernel.org,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [dtor-input:next 134/135]
 drivers/input/joystick/adc-joystick.c:194:10: error: implicit declaration of
 function 'min_array'
Message-ID: <202401200614.B4PnBzhk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
head:   3af6e24a456437d323d1080bd254053f7af05234
commit: 6380a59c534ecab1462608a1f76490289a45a377 [134/135] Input: adc-joystick - handle inverted axes
config: i386-randconfig-011-20240120 (https://download.01.org/0day-ci/archive/20240120/202401200614.B4PnBzhk-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240120/202401200614.B4PnBzhk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401200614.B4PnBzhk-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/input/joystick/adc-joystick.c: In function 'adc_joystick_set_axes':
>> drivers/input/joystick/adc-joystick.c:194:10: error: implicit declaration of function 'min_array' [-Werror=implicit-function-declaration]
     194 |          min_array(axes[i].range, 2),
         |          ^~~~~~~~~
>> drivers/input/joystick/adc-joystick.c:195:10: error: implicit declaration of function 'max_array'; did you mean 'kmalloc_array'? [-Werror=implicit-function-declaration]
     195 |          max_array(axes[i].range, 2),
         |          ^~~~~~~~~
         |          kmalloc_array
   cc1: some warnings being treated as errors


vim +/min_array +194 drivers/input/joystick/adc-joystick.c

   135	
   136	static int adc_joystick_set_axes(struct device *dev, struct adc_joystick *joy)
   137	{
   138		struct adc_joystick_axis *axes;
   139		struct fwnode_handle *child;
   140		int num_axes, error, i;
   141	
   142		num_axes = device_get_child_node_count(dev);
   143		if (!num_axes) {
   144			dev_err(dev, "Unable to find child nodes\n");
   145			return -EINVAL;
   146		}
   147	
   148		if (num_axes != joy->num_chans) {
   149			dev_err(dev, "Got %d child nodes for %d channels\n",
   150				num_axes, joy->num_chans);
   151			return -EINVAL;
   152		}
   153	
   154		axes = devm_kmalloc_array(dev, num_axes, sizeof(*axes), GFP_KERNEL);
   155		if (!axes)
   156			return -ENOMEM;
   157	
   158		device_for_each_child_node(dev, child) {
   159			error = fwnode_property_read_u32(child, "reg", &i);
   160			if (error) {
   161				dev_err(dev, "reg invalid or missing\n");
   162				goto err_fwnode_put;
   163			}
   164	
   165			if (i >= num_axes) {
   166				error = -EINVAL;
   167				dev_err(dev, "No matching axis for reg %d\n", i);
   168				goto err_fwnode_put;
   169			}
   170	
   171			error = fwnode_property_read_u32(child, "linux,code",
   172							 &axes[i].code);
   173			if (error) {
   174				dev_err(dev, "linux,code invalid or missing\n");
   175				goto err_fwnode_put;
   176			}
   177	
   178			error = fwnode_property_read_u32_array(child, "abs-range",
   179							       axes[i].range, 2);
   180			if (error) {
   181				dev_err(dev, "abs-range invalid or missing\n");
   182				goto err_fwnode_put;
   183			}
   184	
   185			if (axes[i].range[0] > axes[i].range[1]) {
   186				dev_dbg(dev, "abs-axis %d inverted\n", i);
   187				axes[i].inverted = true;
   188			}
   189	
   190			fwnode_property_read_u32(child, "abs-fuzz", &axes[i].fuzz);
   191			fwnode_property_read_u32(child, "abs-flat", &axes[i].flat);
   192	
   193			input_set_abs_params(joy->input, axes[i].code,
 > 194					     min_array(axes[i].range, 2),
 > 195					     max_array(axes[i].range, 2),
   196					     axes[i].fuzz, axes[i].flat);
   197			input_set_capability(joy->input, EV_ABS, axes[i].code);
   198		}
   199	
   200		joy->axes = axes;
   201	
   202		return 0;
   203	
   204	err_fwnode_put:
   205		fwnode_handle_put(child);
   206		return error;
   207	}
   208	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

