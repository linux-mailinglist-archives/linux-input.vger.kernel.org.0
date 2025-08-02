Return-Path: <linux-input+bounces-13762-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 07F75B18A03
	for <lists+linux-input@lfdr.de>; Sat,  2 Aug 2025 03:03:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 79E11627765
	for <lists+linux-input@lfdr.de>; Sat,  2 Aug 2025 01:03:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9810B6FBF;
	Sat,  2 Aug 2025 01:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K2JaZVyq"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08A05A48;
	Sat,  2 Aug 2025 01:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754096593; cv=none; b=qANotd8kaEXenlxEyN0IQ8kiD7ieQJSTXhM1K0Zx5TT7B65wogUSjdyUxPMu5WTKAgyyc7BmKRt6ADHpOf6/RKcQLwDMb0IUU/vjNCkU0BI8/x2NI6Nuo0oPimNi9BX0CwiN3IQ02IWs5Tu4GJqWbfE0VXkjksWOHb5GmAtSg3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754096593; c=relaxed/simple;
	bh=AY7j+7mv2dE5hcJpd/tAvFtobFcD1mgqJgfqGiQynVE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PfB49F//3rlDuToLmSqNUxYEpyERIRIkJlNaMaGjrgR7X0znHGt5+6EWqm1ms2SktiuTSekph/iySPUoomsbr8CYSpNOdwWE9KC2TWOJmSGrXH3xFwwfldOIEJU+kpdzn7MBKzoMfkbTuixvptR2a0z2Pq0Bl316c8kZSdniB5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K2JaZVyq; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754096592; x=1785632592;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=AY7j+7mv2dE5hcJpd/tAvFtobFcD1mgqJgfqGiQynVE=;
  b=K2JaZVyq1etD/zfzt4vPgIBgHKKIr8CToFSZDH/Hr5elfUzuY4pXd6ZR
   +uWDe40Xsp83xNdFRf7LaATQk8i4fHtvkR/wmsOw6TmT+g98DerLRwspk
   bVM4ymctXowZhK609325X5c/E97jFLr1keakIIz7Xt19IP3vQ1tdOwU+C
   seXszXSBCKi2WfiSqFet08Dcyjm8gAB5JwO+eWJ21rZGNc2DeXtSjrKDA
   E17MQgIJqhahzy+OhtbxXmBX+JpKkDmH8cSRXjWkzndNF6l+Xh7BzrxhW
   +DHMEmWtwSpQ0KSunNn/Cg7JbnvIAkD0IWg7NeMaS11Lf4abwDu3vLddt
   Q==;
X-CSE-ConnectionGUID: AURiZbY/RWi8kc0hH73cKQ==
X-CSE-MsgGUID: xUY5J8TkSWOIplD3lz9BxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="56586896"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="56586896"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2025 18:03:12 -0700
X-CSE-ConnectionGUID: k31tPsVwSPa+bMhbp3/FQA==
X-CSE-MsgGUID: 5Bej1XubQpKWWuO99tKLyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="168165493"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 01 Aug 2025 18:03:08 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ui0eQ-00053c-00;
	Sat, 02 Aug 2025 01:03:06 +0000
Date: Sat, 2 Aug 2025 09:02:10 +0800
From: kernel test robot <lkp@intel.com>
To: Julien Massot <julien.massot@collabora.com>, kernel@collabora.com,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	Julien Massot <julien.massot@collabora.com>
Subject: Re: [PATCH 1/3] Input: mtk-pmic-keys - MT6359 has a specific release
 irq
Message-ID: <202508020802.nZBo2mGV-lkp@intel.com>
References: <20250801-radxa-nio-12-l-gpio-v1-1-d0840f85d2c8@collabora.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250801-radxa-nio-12-l-gpio-v1-1-d0840f85d2c8@collabora.com>

Hi Julien,

kernel test robot noticed the following build errors:

[auto build test ERROR on b9ddaa95fd283bce7041550ddbbe7e764c477110]

url:    https://github.com/intel-lab-lkp/linux/commits/Julien-Massot/Input-mtk-pmic-keys-MT6359-has-a-specific-release-irq/20250801-211817
base:   b9ddaa95fd283bce7041550ddbbe7e764c477110
patch link:    https://lore.kernel.org/r/20250801-radxa-nio-12-l-gpio-v1-1-d0840f85d2c8%40collabora.com
patch subject: [PATCH 1/3] Input: mtk-pmic-keys - MT6359 has a specific release irq
config: arc-randconfig-002-20250802 (https://download.01.org/0day-ci/archive/20250802/202508020802.nZBo2mGV-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250802/202508020802.nZBo2mGV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508020802.nZBo2mGV-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/input/keyboard/mtk-pmic-keys.c:132:10: error: 'const struct mtk_pmic_regs' has no member named 'key_release_irq'
     132 |         .key_release_irq = true,
         |          ^~~~~~~~~~~~~~~
>> drivers/input/keyboard/mtk-pmic-keys.c:132:28: warning: excess elements in struct initializer
     132 |         .key_release_irq = true,
         |                            ^~~~
   drivers/input/keyboard/mtk-pmic-keys.c:132:28: note: (near initialization for 'mt6359_regs')


vim +132 drivers/input/keyboard/mtk-pmic-keys.c

   120	
   121	static const struct mtk_pmic_regs mt6359_regs = {
   122		.keys_regs[MTK_PMIC_PWRKEY_INDEX] =
   123			MTK_PMIC_KEYS_REGS(MT6359_TOPSTATUS,
   124					   0x2, MT6359_PSC_TOP_INT_CON0, 0x5,
   125					   MTK_PMIC_PWRKEY_RST),
   126		.keys_regs[MTK_PMIC_HOMEKEY_INDEX] =
   127			MTK_PMIC_KEYS_REGS(MT6359_TOPSTATUS,
   128					   0x8, MT6359_PSC_TOP_INT_CON0, 0xa,
   129					   MTK_PMIC_HOMEKEY_RST),
   130		.pmic_rst_reg = MT6359_TOP_RST_MISC,
   131		.rst_lprst_mask = MTK_PMIC_RST_DU_MASK,
 > 132		.key_release_irq = true,
   133	};
   134	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

