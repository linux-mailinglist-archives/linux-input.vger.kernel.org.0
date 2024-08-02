Return-Path: <linux-input+bounces-5289-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 83AE894625B
	for <lists+linux-input@lfdr.de>; Fri,  2 Aug 2024 19:18:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EFBA2B21D1E
	for <lists+linux-input@lfdr.de>; Fri,  2 Aug 2024 17:17:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E41A1537CA;
	Fri,  2 Aug 2024 17:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lwScdWuM"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1462E16BE0C;
	Fri,  2 Aug 2024 17:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722619072; cv=none; b=qNofM3IK3eMDevSYsIIJA5haKBiyzOzmRfe9khoPASNb+P9fRo4SpZy2rQRHclge5Iqy5ecXnCg4ieJsLhuelxuhPqS1DmGNnJKgVpFijcpRPpHHIK9+oBQHart7Gvdw0CpqjTaJFN51E+jy1j8/rfTl5rc5bFdGkOToml5ZJs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722619072; c=relaxed/simple;
	bh=o9DJWhGlqtKQ1iWtEKepaZu/t4tj65qSh5IdSpzdbCo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EHhI/v2i1zc5NGe86KBBg3NAoFJAUv6qz8uUB778GkHgKPG0WFb35+6smupasG1UwW7mSfEFDchp4dZOnJBo4+ozbAHW7EvZLca6lLZsi7frbrT0741EP4xZJU2kq3nDMMtHxJboKJsUxkZhbuAIl2G1XLjb9mBa6SfOE2NQqWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lwScdWuM; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722619071; x=1754155071;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=o9DJWhGlqtKQ1iWtEKepaZu/t4tj65qSh5IdSpzdbCo=;
  b=lwScdWuMXWfATwt8ajLJsjWNIXh7m1sGOtHbIaA4em/8WJd6M5jM0H9A
   82X+4mfvmXYZvg8LS+ktYt4+obivx1m1YllOWGxxvCdxREQgl87nSPaQ9
   lNBkWFAuEBldeRz+C5JTTRds1GgHXo4c1GCpHv2CL3s2h+FT4n5al29qW
   gnQQn2a17XvE27Tj9PXYXAG/0VCr/h9/c9UByXu4I9/GLDn76rELhCqMo
   ey/xwa3BqbInygujcPNLJvSBOJgB1nglbt37eW8oIGoUEDwzy2GoaRriQ
   TqRwOrhc1PLZJCl/4rk5wXvjTMoMdu9/zmrlb+niiCKO/TxNzr/Y+mjfY
   Q==;
X-CSE-ConnectionGUID: QylhNXamQ4m6oQ1EuihGyw==
X-CSE-MsgGUID: BHlwXsjAROGHGIPSalFK0Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11152"; a="31296284"
X-IronPort-AV: E=Sophos;i="6.09,258,1716274800"; 
   d="scan'208";a="31296284"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2024 10:17:50 -0700
X-CSE-ConnectionGUID: hRN/0xX9QpaChBGARfY0ow==
X-CSE-MsgGUID: PPBUJ3eyQS+/+TdOfJxyBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,258,1716274800"; 
   d="scan'208";a="60309478"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 02 Aug 2024 10:17:46 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sZvuR-000xBO-2v;
	Fri, 02 Aug 2024 17:17:43 +0000
Date: Sat, 3 Aug 2024 01:16:52 +0800
From: kernel test robot <lkp@intel.com>
To: Heiko Stuebner <heiko@sntech.de>, lee@kernel.org, jdelvare@suse.com,
	linux@roeck-us.net, dmitry.torokhov@gmail.com, pavel@ucw.cz
Cc: oe-kbuild-all@lists.linux.dev, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, heiko@sntech.de, ukleinek@debian.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-hwmon@vger.kernel.org,
	linux-input@vger.kernel.org, linux-leds@vger.kernel.org
Subject: Re: [PATCH v3 2/7] mfd: add base driver for qnap-mcu devices
Message-ID: <202408030016.QLOhRHF1-lkp@intel.com>
References: <20240731212430.2677900-3-heiko@sntech.de>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240731212430.2677900-3-heiko@sntech.de>

Hi Heiko,

kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20240801]
[also build test WARNING on v6.11-rc1]
[cannot apply to groeck-staging/hwmon-next lee-leds/for-leds-next lee-mfd/for-mfd-next lee-mfd/for-mfd-fixes linus/master v6.11-rc1 v6.10 v6.10-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Heiko-Stuebner/dt-bindings-mfd-add-binding-for-qnap-ts433-mcu-devices/20240802-103948
base:   next-20240801
patch link:    https://lore.kernel.org/r/20240731212430.2677900-3-heiko%40sntech.de
patch subject: [PATCH v3 2/7] mfd: add base driver for qnap-mcu devices
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20240803/202408030016.QLOhRHF1-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240803/202408030016.QLOhRHF1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408030016.QLOhRHF1-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/device.h:15,
                    from include/linux/platform_device.h:13,
                    from include/linux/mfd/core.h:13,
                    from drivers/mfd/qnap-mcu.c:12:
   drivers/mfd/qnap-mcu.c: In function 'qnap_mcu_receive_buf':
>> drivers/mfd/qnap-mcu.c:108:31: warning: format '%lu' expects argument of type 'long unsigned int', but argument 3 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
     108 |                 dev_warn(dev, "received %lu bytes, we were not waiting for\n",
         |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:156:61: note: in expansion of macro 'dev_fmt'
     156 |         dev_printk_index_wrap(_dev_warn, KERN_WARNING, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                             ^~~~~~~
   drivers/mfd/qnap-mcu.c:108:17: note: in expansion of macro 'dev_warn'
     108 |                 dev_warn(dev, "received %lu bytes, we were not waiting for\n",
         |                 ^~~~~~~~
   drivers/mfd/qnap-mcu.c:108:43: note: format string is defined here
     108 |                 dev_warn(dev, "received %lu bytes, we were not waiting for\n",
         |                                         ~~^
         |                                           |
         |                                           long unsigned int
         |                                         %u


vim +108 drivers/mfd/qnap-mcu.c

    96	
    97	static size_t qnap_mcu_receive_buf(struct serdev_device *serdev,
    98					   const u8 *buf, size_t size)
    99	{
   100		struct device *dev = &serdev->dev;
   101		struct qnap_mcu *mcu = dev_get_drvdata(dev);
   102		struct qnap_mcu_reply *reply = mcu->reply;
   103		const u8 *src = buf;
   104		const u8 *end = buf + size;
   105	
   106		mutex_lock(&mcu->reply_lock);
   107		if (!reply) {
 > 108			dev_warn(dev, "received %lu bytes, we were not waiting for\n",
   109				 size);
   110			mutex_unlock(&mcu->reply_lock);
   111			return size;
   112		}
   113	
   114		while (src < end) {
   115			reply->data[reply->received] = *src++;
   116			reply->received++;
   117	
   118			if (reply->received == reply->length) {
   119				complete(&reply->done);
   120				mutex_unlock(&mcu->reply_lock);
   121	
   122				/*
   123				 * We report the consumed number of bytes. If there
   124				 * are still bytes remaining (though there shouldn't)
   125				 * the serdev layer will re-execute this handler with
   126				 * the remainder of the Rx bytes.
   127				 */
   128				return src - buf;
   129			}
   130		}
   131	
   132		/*
   133		 * The only way to get out of the above loop and end up here
   134		 * is through consuming all of the supplied data, so here we
   135		 * report that we processed it all.
   136		 */
   137		mutex_unlock(&mcu->reply_lock);
   138		return size;
   139	}
   140	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

