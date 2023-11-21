Return-Path: <linux-input+bounces-194-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EA1387F3980
	for <lists+linux-input@lfdr.de>; Tue, 21 Nov 2023 23:52:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8A7A6B2189F
	for <lists+linux-input@lfdr.de>; Tue, 21 Nov 2023 22:52:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A78F5A10D;
	Tue, 21 Nov 2023 22:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GNzzSA8P"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94D291AC;
	Tue, 21 Nov 2023 14:52:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700607144; x=1732143144;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7S8HcKQ5GauB14UB7Q9FL/WHd07QSS8icHvhl2hO0n4=;
  b=GNzzSA8PPLCLFZGYzJb6jalvzNrCd75tqIXJeFFZmlLx8RF6xANaEdBP
   OtW9XMEe2AbhxvtzG+Pzfue6+ITc3yRPpn6/keWqpt7FyEoR3N3oM9+X7
   D8nci/p9UMRmhuKSwc9rXa4xf2aGBqaMSEn0TqXc6QfNdCIIxoGCqTfWX
   388iNr1h7kjbUlesR9giZdSEpT3f1gw/hJ24LWH2NHG7vLIqGs6HgZQ1X
   et7A0UfLbUZ/6jUtMxZWlArHv0tEXZSfMK8UM25iajnUG5z+1jJwxAA2b
   2Y8PpCulTFY8EV5h/toJssH57kYEG+068kqC/K4bKHMCeWHURUzRaGy35
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="395860397"
X-IronPort-AV: E=Sophos;i="6.04,217,1695711600"; 
   d="scan'208";a="395860397"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2023 14:52:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,217,1695711600"; 
   d="scan'208";a="15045297"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 21 Nov 2023 14:52:21 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r5ZbO-0008N2-2m;
	Tue, 21 Nov 2023 22:52:18 +0000
Date: Wed, 22 Nov 2023 06:52:09 +0800
From: kernel test robot <lkp@intel.com>
To: Anshul Dalal <anshulusr@gmail.com>, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Anshul Dalal <anshulusr@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh+dt@kernel.org>, Jeff LaBundy <jeff@labundy.com>,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH v10 2/2] input: joystick: driver for Adafruit Seesaw
 Gamepad
Message-ID: <202311220544.BV7xhjMy-lkp@intel.com>
References: <20231121123409.2231115-2-anshulusr@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231121123409.2231115-2-anshulusr@gmail.com>

Hi Anshul,

kernel test robot noticed the following build warnings:

[auto build test WARNING on dtor-input/next]
[also build test WARNING on dtor-input/for-linus hid/for-next linus/master v6.7-rc2 next-20231121]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Anshul-Dalal/input-joystick-driver-for-Adafruit-Seesaw-Gamepad/20231121-204243
base:   https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
patch link:    https://lore.kernel.org/r/20231121123409.2231115-2-anshulusr%40gmail.com
patch subject: [PATCH v10 2/2] input: joystick: driver for Adafruit Seesaw Gamepad
config: alpha-randconfig-r112-20231122 (https://download.01.org/0day-ci/archive/20231122/202311220544.BV7xhjMy-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231122/202311220544.BV7xhjMy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311220544.BV7xhjMy-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/input/joystick/adafruit-seesaw.c:300:34: warning: 'seesaw_of_table' defined but not used [-Wunused-const-variable=]
     300 | static const struct of_device_id seesaw_of_table[] = {
         |                                  ^~~~~~~~~~~~~~~


vim +/seesaw_of_table +300 drivers/input/joystick/adafruit-seesaw.c

   299	
 > 300	static const struct of_device_id seesaw_of_table[] = {
   301		{ .compatible = "adafruit,seesaw-gamepad"},
   302		{ /* Sentinel */ }
   303	};
   304	MODULE_DEVICE_TABLE(of, seesaw_of_table);
   305	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

