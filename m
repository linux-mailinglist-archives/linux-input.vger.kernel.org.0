Return-Path: <linux-input+bounces-4286-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EE5A901B05
	for <lists+linux-input@lfdr.de>; Mon, 10 Jun 2024 08:14:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 964F91F22217
	for <lists+linux-input@lfdr.de>; Mon, 10 Jun 2024 06:14:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56493F9F5;
	Mon, 10 Jun 2024 06:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A8UoArvl"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3EA6BA53;
	Mon, 10 Jun 2024 06:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718000044; cv=none; b=EZPVddTPMjjp+/pC9azLjiJL3ujjObClhg8IROWQZz9Axa6fgM9NYauxjS2nIqC9Lg7RgRA+qnjlhe4uQCe+74PCMZ0ULzwWJSKFVHaEFQv3z5iV/WXakpnvx5P2/Df05VSQpur/hzr1WeKROW0mjihF5145Fw+UWplNj+nw4hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718000044; c=relaxed/simple;
	bh=oZnvjgEFrAYO5mKmFhHwLdBkoV6ji/DK6GjZsCsHITI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hHRAAw28GuWIhsOPsL1vq1NA/VKS5/JP3qJ51A/wd4KXzp1/4AhBMDh8nKSvZlC9FTKMJGo4Y5ZVT5MRrzlRJIPBWcdChjjzjsBKFpu0MHaVNwKcDGZIchheE3f8WMU/iCyOoQOjVX2XGF4It3KIhMW3etLgQHdsBFrSIUCOxdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A8UoArvl; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718000042; x=1749536042;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=oZnvjgEFrAYO5mKmFhHwLdBkoV6ji/DK6GjZsCsHITI=;
  b=A8UoArvl33eKxmgUR7I/4T42R3A45T5QpWBFPg4ezeFhXoSQtuSOik9+
   4PXP7aWsytOncjMvZOlWl9tJTJXJvMT2pXG30BXTvuSLkIXmoAq9gjeOK
   4enJ39Z2ZVDbD2DASrzh+sRG8WVTyYu4QkAbnX3qHFCxMmeTLyXexgwnQ
   xNKqN5NHfO40moodqyiXu67FLQNKx93/EHtWbcoZHppke53VOZRKWpa2o
   eypGbEogCmfrgXjpguzfotvkuxG63D0aQgC3WjYAblQX7uDyHzf0LpPXW
   ZTIzp1oVr/2HzVscAz4VqccMx/iCno5xQqHSxN9qIUaSkp1Asb+1yMiPH
   w==;
X-CSE-ConnectionGUID: RZBWWF+URkmd/L/9Pi+urw==
X-CSE-MsgGUID: pZoM00QOTuuy0IB6dYCXLA==
X-IronPort-AV: E=McAfee;i="6600,9927,11098"; a="14520936"
X-IronPort-AV: E=Sophos;i="6.08,226,1712646000"; 
   d="scan'208";a="14520936"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2024 23:14:01 -0700
X-CSE-ConnectionGUID: Ol5AneGsTgu0DKeRm1WaFw==
X-CSE-MsgGUID: jYEJ3JQVQcu6HHlkzOcJqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,226,1712646000"; 
   d="scan'208";a="39038630"
Received: from lkp-server01.sh.intel.com (HELO 8967fbab76b3) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 09 Jun 2024 23:13:59 -0700
Received: from kbuild by 8967fbab76b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sGYI0-0001uK-2S;
	Mon, 10 Jun 2024 06:13:56 +0000
Date: Mon, 10 Jun 2024 14:13:53 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Artur Rojek <contact@artur-rojek.eu>,
	Chris Morgan <macromorgan@hotmail.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: adc-joystick - move axes data into the main
 structure
Message-ID: <202406101440.sNrwqJte-lkp@intel.com>
References: <ZmYlfKDm5sgB44EU@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZmYlfKDm5sgB44EU@google.com>

Hi Dmitry,

kernel test robot noticed the following build warnings:

[auto build test WARNING on dtor-input/next]
[cannot apply to dtor-input/for-linus hid/for-next linus/master v6.10-rc3 next-20240607]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dmitry-Torokhov/Input-adc-joystick-move-axes-data-into-the-main-structure/20240610-060124
base:   https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
patch link:    https://lore.kernel.org/r/ZmYlfKDm5sgB44EU%40google.com
patch subject: [PATCH] Input: adc-joystick - move axes data into the main structure
config: i386-buildonly-randconfig-006-20240610 (https://download.01.org/0day-ci/archive/20240610/202406101440.sNrwqJte-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240610/202406101440.sNrwqJte-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406101440.sNrwqJte-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/input/joystick/adc-joystick.c:166:9: warning: variable 'axes' is uninitialized when used here [-Wuninitialized]
     166 |                                                  &axes[i].code);
         |                                                   ^~~~
   drivers/input/joystick/adc-joystick.c:134:32: note: initialize the variable 'axes' to silence this warning
     134 |         struct adc_joystick_axis *axes;
         |                                       ^
         |                                        = NULL
>> drivers/input/joystick/adc-joystick.c:241:19: warning: variable 'joy' is uninitialized when used here [-Wuninitialized]
     241 |                 error = PTR_ERR(joy->chans);
         |                                 ^~~
   drivers/input/joystick/adc-joystick.c:233:26: note: initialize the variable 'joy' to silence this warning
     233 |         struct adc_joystick *joy;
         |                                 ^
         |                                  = NULL
   2 warnings generated.


vim +/axes +166 drivers/input/joystick/adc-joystick.c

2c2b364fddd551 Artur Rojek     2020-09-28  131  
2c2b364fddd551 Artur Rojek     2020-09-28  132  static int adc_joystick_set_axes(struct device *dev, struct adc_joystick *joy)
2c2b364fddd551 Artur Rojek     2020-09-28  133  {
2c2b364fddd551 Artur Rojek     2020-09-28  134  	struct adc_joystick_axis *axes;
2c2b364fddd551 Artur Rojek     2020-09-28  135  	struct fwnode_handle *child;
815b74328f141f Dmitry Torokhov 2024-06-09  136  	s32 range[2], fuzz, flat;
815b74328f141f Dmitry Torokhov 2024-06-09  137  	unsigned int num_axes;
815b74328f141f Dmitry Torokhov 2024-06-09  138  	int error, i;
2c2b364fddd551 Artur Rojek     2020-09-28  139  
2c2b364fddd551 Artur Rojek     2020-09-28  140  	num_axes = device_get_child_node_count(dev);
2c2b364fddd551 Artur Rojek     2020-09-28  141  	if (!num_axes) {
2c2b364fddd551 Artur Rojek     2020-09-28  142  		dev_err(dev, "Unable to find child nodes\n");
2c2b364fddd551 Artur Rojek     2020-09-28  143  		return -EINVAL;
2c2b364fddd551 Artur Rojek     2020-09-28  144  	}
2c2b364fddd551 Artur Rojek     2020-09-28  145  
2c2b364fddd551 Artur Rojek     2020-09-28  146  	if (num_axes != joy->num_chans) {
2c2b364fddd551 Artur Rojek     2020-09-28  147  		dev_err(dev, "Got %d child nodes for %d channels\n",
2c2b364fddd551 Artur Rojek     2020-09-28  148  			num_axes, joy->num_chans);
2c2b364fddd551 Artur Rojek     2020-09-28  149  		return -EINVAL;
2c2b364fddd551 Artur Rojek     2020-09-28  150  	}
2c2b364fddd551 Artur Rojek     2020-09-28  151  
2c2b364fddd551 Artur Rojek     2020-09-28  152  	device_for_each_child_node(dev, child) {
2c2b364fddd551 Artur Rojek     2020-09-28  153  		error = fwnode_property_read_u32(child, "reg", &i);
2c2b364fddd551 Artur Rojek     2020-09-28  154  		if (error) {
2c2b364fddd551 Artur Rojek     2020-09-28  155  			dev_err(dev, "reg invalid or missing\n");
2c2b364fddd551 Artur Rojek     2020-09-28  156  			goto err_fwnode_put;
2c2b364fddd551 Artur Rojek     2020-09-28  157  		}
2c2b364fddd551 Artur Rojek     2020-09-28  158  
2c2b364fddd551 Artur Rojek     2020-09-28  159  		if (i >= num_axes) {
2c2b364fddd551 Artur Rojek     2020-09-28  160  			error = -EINVAL;
2c2b364fddd551 Artur Rojek     2020-09-28  161  			dev_err(dev, "No matching axis for reg %d\n", i);
2c2b364fddd551 Artur Rojek     2020-09-28  162  			goto err_fwnode_put;
2c2b364fddd551 Artur Rojek     2020-09-28  163  		}
2c2b364fddd551 Artur Rojek     2020-09-28  164  
2c2b364fddd551 Artur Rojek     2020-09-28  165  		error = fwnode_property_read_u32(child, "linux,code",
2c2b364fddd551 Artur Rojek     2020-09-28 @166  						 &axes[i].code);
2c2b364fddd551 Artur Rojek     2020-09-28  167  		if (error) {
2c2b364fddd551 Artur Rojek     2020-09-28  168  			dev_err(dev, "linux,code invalid or missing\n");
2c2b364fddd551 Artur Rojek     2020-09-28  169  			goto err_fwnode_put;
2c2b364fddd551 Artur Rojek     2020-09-28  170  		}
2c2b364fddd551 Artur Rojek     2020-09-28  171  
2c2b364fddd551 Artur Rojek     2020-09-28  172  		error = fwnode_property_read_u32_array(child, "abs-range",
815b74328f141f Dmitry Torokhov 2024-06-09  173  						       range, 2);
2c2b364fddd551 Artur Rojek     2020-09-28  174  		if (error) {
2c2b364fddd551 Artur Rojek     2020-09-28  175  			dev_err(dev, "abs-range invalid or missing\n");
2c2b364fddd551 Artur Rojek     2020-09-28  176  			goto err_fwnode_put;
2c2b364fddd551 Artur Rojek     2020-09-28  177  		}
2c2b364fddd551 Artur Rojek     2020-09-28  178  
815b74328f141f Dmitry Torokhov 2024-06-09  179  		if (range[0] > range[1]) {
6560cfcfb46511 Chris Morgan    2024-01-19  180  			dev_dbg(dev, "abs-axis %d inverted\n", i);
6560cfcfb46511 Chris Morgan    2024-01-19  181  			axes[i].inverted = true;
815b74328f141f Dmitry Torokhov 2024-06-09  182  			swap(range[0], range[1]);
6560cfcfb46511 Chris Morgan    2024-01-19  183  		}
6560cfcfb46511 Chris Morgan    2024-01-19  184  
815b74328f141f Dmitry Torokhov 2024-06-09  185  		fwnode_property_read_u32(child, "abs-fuzz", &fuzz);
815b74328f141f Dmitry Torokhov 2024-06-09  186  		fwnode_property_read_u32(child, "abs-flat", &flat);
2c2b364fddd551 Artur Rojek     2020-09-28  187  
2c2b364fddd551 Artur Rojek     2020-09-28  188  		input_set_abs_params(joy->input, axes[i].code,
815b74328f141f Dmitry Torokhov 2024-06-09  189  				     range[0], range[1], fuzz, flat);
2c2b364fddd551 Artur Rojek     2020-09-28  190  	}
2c2b364fddd551 Artur Rojek     2020-09-28  191  
2c2b364fddd551 Artur Rojek     2020-09-28  192  	return 0;
2c2b364fddd551 Artur Rojek     2020-09-28  193  
2c2b364fddd551 Artur Rojek     2020-09-28  194  err_fwnode_put:
2c2b364fddd551 Artur Rojek     2020-09-28  195  	fwnode_handle_put(child);
2c2b364fddd551 Artur Rojek     2020-09-28  196  	return error;
2c2b364fddd551 Artur Rojek     2020-09-28  197  }
2c2b364fddd551 Artur Rojek     2020-09-28  198  
815b74328f141f Dmitry Torokhov 2024-06-09  199  
815b74328f141f Dmitry Torokhov 2024-06-09  200  /*
815b74328f141f Dmitry Torokhov 2024-06-09  201   * Count how many channels we got. NULL terminated.
815b74328f141f Dmitry Torokhov 2024-06-09  202   * Do not check the storage size if using polling.
815b74328f141f Dmitry Torokhov 2024-06-09  203   */
815b74328f141f Dmitry Torokhov 2024-06-09  204  static int adc_joystick_count_channels(struct device *dev,
815b74328f141f Dmitry Torokhov 2024-06-09  205  				       const struct iio_channel *chans,
815b74328f141f Dmitry Torokhov 2024-06-09  206  				       bool polled,
815b74328f141f Dmitry Torokhov 2024-06-09  207  				       unsigned int *num_chans)
815b74328f141f Dmitry Torokhov 2024-06-09  208  {
815b74328f141f Dmitry Torokhov 2024-06-09  209  	int bits;
815b74328f141f Dmitry Torokhov 2024-06-09  210  	int i;
815b74328f141f Dmitry Torokhov 2024-06-09  211  
815b74328f141f Dmitry Torokhov 2024-06-09  212  	for (i = 0; chans[i].indio_dev; i++) {
815b74328f141f Dmitry Torokhov 2024-06-09  213  		if (polled)
815b74328f141f Dmitry Torokhov 2024-06-09  214  			continue;
815b74328f141f Dmitry Torokhov 2024-06-09  215  		bits = chans[i].channel->scan_type.storagebits;
815b74328f141f Dmitry Torokhov 2024-06-09  216  		if (!bits || bits > 16) {
815b74328f141f Dmitry Torokhov 2024-06-09  217  			dev_err(dev, "Unsupported channel storage size\n");
815b74328f141f Dmitry Torokhov 2024-06-09  218  			return -EINVAL;
815b74328f141f Dmitry Torokhov 2024-06-09  219  		}
815b74328f141f Dmitry Torokhov 2024-06-09  220  		if (bits != chans[0].channel->scan_type.storagebits) {
815b74328f141f Dmitry Torokhov 2024-06-09  221  			dev_err(dev, "Channels must have equal storage size\n");
815b74328f141f Dmitry Torokhov 2024-06-09  222  			return -EINVAL;
815b74328f141f Dmitry Torokhov 2024-06-09  223  		}
815b74328f141f Dmitry Torokhov 2024-06-09  224  	}
815b74328f141f Dmitry Torokhov 2024-06-09  225  
815b74328f141f Dmitry Torokhov 2024-06-09  226  	return i;
815b74328f141f Dmitry Torokhov 2024-06-09  227  }
815b74328f141f Dmitry Torokhov 2024-06-09  228  
2c2b364fddd551 Artur Rojek     2020-09-28  229  static int adc_joystick_probe(struct platform_device *pdev)
2c2b364fddd551 Artur Rojek     2020-09-28  230  {
2c2b364fddd551 Artur Rojek     2020-09-28  231  	struct device *dev = &pdev->dev;
815b74328f141f Dmitry Torokhov 2024-06-09  232  	struct iio_channel *chans;
2c2b364fddd551 Artur Rojek     2020-09-28  233  	struct adc_joystick *joy;
2c2b364fddd551 Artur Rojek     2020-09-28  234  	struct input_dev *input;
815b74328f141f Dmitry Torokhov 2024-06-09  235  	unsigned int poll_interval = 0;
815b74328f141f Dmitry Torokhov 2024-06-09  236  	unsigned int num_chans;
2c2b364fddd551 Artur Rojek     2020-09-28  237  	int error;
2c2b364fddd551 Artur Rojek     2020-09-28  238  
815b74328f141f Dmitry Torokhov 2024-06-09  239  	chans = devm_iio_channel_get_all(dev);
815b74328f141f Dmitry Torokhov 2024-06-09  240  	if (IS_ERR(chans)) {
2c2b364fddd551 Artur Rojek     2020-09-28 @241  		error = PTR_ERR(joy->chans);
2c2b364fddd551 Artur Rojek     2020-09-28  242  		if (error != -EPROBE_DEFER)
2c2b364fddd551 Artur Rojek     2020-09-28  243  			dev_err(dev, "Unable to get IIO channels");
2c2b364fddd551 Artur Rojek     2020-09-28  244  		return error;
2c2b364fddd551 Artur Rojek     2020-09-28  245  	}
2c2b364fddd551 Artur Rojek     2020-09-28  246  
24c06e000e8fa2 Chris Morgan    2022-08-16  247  	error = device_property_read_u32(dev, "poll-interval", &poll_interval);
24c06e000e8fa2 Chris Morgan    2022-08-16  248  	if (error) {
24c06e000e8fa2 Chris Morgan    2022-08-16  249  		/* -EINVAL means the property is absent. */
24c06e000e8fa2 Chris Morgan    2022-08-16  250  		if (error != -EINVAL)
24c06e000e8fa2 Chris Morgan    2022-08-16  251  			return error;
24c06e000e8fa2 Chris Morgan    2022-08-16  252  	} else if (poll_interval == 0) {
24c06e000e8fa2 Chris Morgan    2022-08-16  253  		dev_err(dev, "Unable to get poll-interval\n");
24c06e000e8fa2 Chris Morgan    2022-08-16  254  		return -EINVAL;
24c06e000e8fa2 Chris Morgan    2022-08-16  255  	}
24c06e000e8fa2 Chris Morgan    2022-08-16  256  
815b74328f141f Dmitry Torokhov 2024-06-09  257  	error = adc_joystick_count_channels(dev, chans, poll_interval != 0,
815b74328f141f Dmitry Torokhov 2024-06-09  258  					    &num_chans);
815b74328f141f Dmitry Torokhov 2024-06-09  259  	if (error)
815b74328f141f Dmitry Torokhov 2024-06-09  260  		return error;
815b74328f141f Dmitry Torokhov 2024-06-09  261  
815b74328f141f Dmitry Torokhov 2024-06-09  262  	joy = devm_kzalloc(dev, struct_size(joy, axes, num_chans), GFP_KERNEL);
815b74328f141f Dmitry Torokhov 2024-06-09  263  	if (!joy)
815b74328f141f Dmitry Torokhov 2024-06-09  264  		return -ENOMEM;
815b74328f141f Dmitry Torokhov 2024-06-09  265  
815b74328f141f Dmitry Torokhov 2024-06-09  266  	joy->chans = chans;
815b74328f141f Dmitry Torokhov 2024-06-09  267  	joy->num_chans = num_chans;
2c2b364fddd551 Artur Rojek     2020-09-28  268  
2c2b364fddd551 Artur Rojek     2020-09-28  269  	input = devm_input_allocate_device(dev);
2c2b364fddd551 Artur Rojek     2020-09-28  270  	if (!input) {
2c2b364fddd551 Artur Rojek     2020-09-28  271  		dev_err(dev, "Unable to allocate input device\n");
2c2b364fddd551 Artur Rojek     2020-09-28  272  		return -ENOMEM;
2c2b364fddd551 Artur Rojek     2020-09-28  273  	}
2c2b364fddd551 Artur Rojek     2020-09-28  274  
2c2b364fddd551 Artur Rojek     2020-09-28  275  	joy->input = input;
2c2b364fddd551 Artur Rojek     2020-09-28  276  	input->name = pdev->name;
2c2b364fddd551 Artur Rojek     2020-09-28  277  	input->id.bustype = BUS_HOST;
2c2b364fddd551 Artur Rojek     2020-09-28  278  
2c2b364fddd551 Artur Rojek     2020-09-28  279  	error = adc_joystick_set_axes(dev, joy);
2c2b364fddd551 Artur Rojek     2020-09-28  280  	if (error)
2c2b364fddd551 Artur Rojek     2020-09-28  281  		return error;
2c2b364fddd551 Artur Rojek     2020-09-28  282  
815b74328f141f Dmitry Torokhov 2024-06-09  283  	if (poll_interval != 0) {
24c06e000e8fa2 Chris Morgan    2022-08-16  284  		input_setup_polling(input, adc_joystick_poll);
24c06e000e8fa2 Chris Morgan    2022-08-16  285  		input_set_poll_interval(input, poll_interval);
24c06e000e8fa2 Chris Morgan    2022-08-16  286  	} else {
24c06e000e8fa2 Chris Morgan    2022-08-16  287  		input->open = adc_joystick_open;
24c06e000e8fa2 Chris Morgan    2022-08-16  288  		input->close = adc_joystick_close;
24c06e000e8fa2 Chris Morgan    2022-08-16  289  
24c06e000e8fa2 Chris Morgan    2022-08-16  290  		joy->buffer = iio_channel_get_all_cb(dev, adc_joystick_handle,
24c06e000e8fa2 Chris Morgan    2022-08-16  291  						     joy);
2c2b364fddd551 Artur Rojek     2020-09-28  292  		if (IS_ERR(joy->buffer)) {
2c2b364fddd551 Artur Rojek     2020-09-28  293  			dev_err(dev, "Unable to allocate callback buffer\n");
2c2b364fddd551 Artur Rojek     2020-09-28  294  			return PTR_ERR(joy->buffer);
2c2b364fddd551 Artur Rojek     2020-09-28  295  		}
2c2b364fddd551 Artur Rojek     2020-09-28  296  
24c06e000e8fa2 Chris Morgan    2022-08-16  297  		error = devm_add_action_or_reset(dev, adc_joystick_cleanup,
24c06e000e8fa2 Chris Morgan    2022-08-16  298  						 joy->buffer);
2c2b364fddd551 Artur Rojek     2020-09-28  299  		if (error)  {
2c2b364fddd551 Artur Rojek     2020-09-28  300  			dev_err(dev, "Unable to add action\n");
2c2b364fddd551 Artur Rojek     2020-09-28  301  			return error;
2c2b364fddd551 Artur Rojek     2020-09-28  302  		}
24c06e000e8fa2 Chris Morgan    2022-08-16  303  	}
2c2b364fddd551 Artur Rojek     2020-09-28  304  
7c744d00990ea9 Dmitry Torokhov 2022-08-02  305  	input_set_drvdata(input, joy);
7c744d00990ea9 Dmitry Torokhov 2022-08-02  306  
7c744d00990ea9 Dmitry Torokhov 2022-08-02  307  	error = input_register_device(input);
7c744d00990ea9 Dmitry Torokhov 2022-08-02  308  	if (error) {
7c744d00990ea9 Dmitry Torokhov 2022-08-02  309  		dev_err(dev, "Unable to register input device\n");
7c744d00990ea9 Dmitry Torokhov 2022-08-02  310  		return error;
7c744d00990ea9 Dmitry Torokhov 2022-08-02  311  	}
7c744d00990ea9 Dmitry Torokhov 2022-08-02  312  
2c2b364fddd551 Artur Rojek     2020-09-28  313  	return 0;
2c2b364fddd551 Artur Rojek     2020-09-28  314  }
2c2b364fddd551 Artur Rojek     2020-09-28  315  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

