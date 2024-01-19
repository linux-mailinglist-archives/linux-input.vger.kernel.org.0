Return-Path: <linux-input+bounces-1350-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 82059833099
	for <lists+linux-input@lfdr.de>; Fri, 19 Jan 2024 23:02:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 308FE287596
	for <lists+linux-input@lfdr.de>; Fri, 19 Jan 2024 22:02:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80C105823A;
	Fri, 19 Jan 2024 22:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="izgzZpF9"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A65495821B
	for <linux-input@vger.kernel.org>; Fri, 19 Jan 2024 22:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705701743; cv=none; b=V07JZ7NDEr8oQ6JUjh/idrxRFMCkEMJsUz/w/e4gARKvvoKA0LBTuqnUZWbf53IPMkaU8CstUBard+3MezBRwn5yFpjVrWJRWfYnCl4ux3+daFymXSkaftReBcEAqHCevbOaq+y0ZjbWCPogfYy5vS8AS0/x3Ptt3TNXtTeaQ10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705701743; c=relaxed/simple;
	bh=6awVfRxtAEE0qZrrYgNTskPSt1swQVGsrDR/RDMf3tc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Qw2qBXJg4x3nFX3GKFD/lTsalI1HC4R7ZTfNymcW0TOTJzy31PC/tdohRe4NICBOoK+RT8TZ4TSZFmFFWeTiUKP1mOGhT8HTPXXkYscxX0Gy6O5AK9DUMm93OYSB83HvYPUCZ41IpxhQoQ7mCk4vI1sqMQFsH1Nv+OdEBCe7R7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=izgzZpF9; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705701742; x=1737237742;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6awVfRxtAEE0qZrrYgNTskPSt1swQVGsrDR/RDMf3tc=;
  b=izgzZpF9f+AmtXfGWlAeV9Q1dZpaAKvCr56ktewhGVNtZ8zfCdmS/9+6
   coYFkvnSwi1hsAIvWIaa5uh2L8DtKSlAJUPgFIXEfI6ZAJ7HOZbhasSL/
   QyFBZvzTsdJx4j6NMdVjA7n9YCmJgWVJD6wgoWJwpH5EnBRhY+mq3Om8B
   xbTYxu+IOlha3Dq8UV5Eo7w1DenbQcU2ZjBzsMlQ0xoJWwMqqqBFlUahK
   773YN3WbvgGGl8EHVb5D77//7Gn3GtpgrSOyTtJ9dA/t1Eb1u6GlvNGAB
   wYw5tO6i4fclxmrsbaKqb4zktdM7Lg99bWHn2nyoHVotkm3VJEQnaGFxD
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10957"; a="19427371"
X-IronPort-AV: E=Sophos;i="6.05,206,1701158400"; 
   d="scan'208";a="19427371"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2024 14:02:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10957"; a="928482752"
X-IronPort-AV: E=Sophos;i="6.05,206,1701158400"; 
   d="scan'208";a="928482752"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 19 Jan 2024 14:02:16 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rQwwI-0004SG-0N;
	Fri, 19 Jan 2024 22:02:14 +0000
Date: Sat, 20 Jan 2024 06:01:59 +0800
From: kernel test robot <lkp@intel.com>
To: Chris Morgan <macromorgan@hotmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-input@vger.kernel.org,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [dtor-input:next 134/135]
 drivers/input/joystick/adc-joystick.c:194:10: error: call to undeclared
 function 'min_array'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202401200525.sV9c5cWM-lkp@intel.com>
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
config: i386-randconfig-001-20240120 (https://download.01.org/0day-ci/archive/20240120/202401200525.sV9c5cWM-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240120/202401200525.sV9c5cWM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401200525.sV9c5cWM-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/input/joystick/adc-joystick.c:194:10: error: call to undeclared function 'min_array'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     194 |                                      min_array(axes[i].range, 2),
         |                                      ^
>> drivers/input/joystick/adc-joystick.c:195:10: error: call to undeclared function 'max_array'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     195 |                                      max_array(axes[i].range, 2),
         |                                      ^
   2 errors generated.


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

