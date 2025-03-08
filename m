Return-Path: <linux-input+bounces-10644-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CDD7A5796A
	for <lists+linux-input@lfdr.de>; Sat,  8 Mar 2025 10:17:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 95C743A7422
	for <lists+linux-input@lfdr.de>; Sat,  8 Mar 2025 09:17:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD3C11B0412;
	Sat,  8 Mar 2025 09:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lBNwUITW"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD69D1AB6D8;
	Sat,  8 Mar 2025 09:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741425434; cv=none; b=qigghBEk9IN8AOrDrJQem8t8thjsl4kJQijO4KpmYNRiA0vyr78x8yn4H5a0yghIO4PRCA4RzgsMvxS0a8nrzygrgNITdesOZIxOiQVDjnI0yHH1KpFkAOWjUbcrcjg72Wyxi0Cxo1z/+qEpVQvYF016a/xzuZaBXNbVPjoHx1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741425434; c=relaxed/simple;
	bh=AmkJ7ad/5jBC0PhnRiqe9SrqTCaM7TojsMxvTR1Lfzo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AMBb4drMBXiIdyWO2t6GtI3RxUh+LWircROWmzf/dmMWq9i7dY1lWhTaO1/UVGtq60Us01Qsw8BhrNMtfsaGN17tq2T3fXqGtRdz4wscSup7sUN9R1aTNGDZCtnK2tPdWv+R5bG3PWeZ2oAk2HPyW5Ha49N9guIOvphUOVkYWDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lBNwUITW; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741425433; x=1772961433;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=AmkJ7ad/5jBC0PhnRiqe9SrqTCaM7TojsMxvTR1Lfzo=;
  b=lBNwUITWvvumSXDnagn65ljFOc10j7iTPAgnZT06DbT1tuFwVaZrR2oD
   VT9vuT7szdxyNHOgREeYhMPeG1Smi1Pud2cSlmD+sRHiWNt5QQjPf8VNS
   jC1AB2m2Q0xXudQXMEzPAwYEvHDn4hTth9Roze57X1flPBOEu3t6gT3Bt
   j2nDv8SV0OkEPGB/o8ouQKTwuMnnmoubrVONjn4xPOpz0JxJyQcyhjcwE
   y5NNKCsamq3adyn6ARrdz8M7sHJvTQAVncLopBnrz106C+CNW74ORID3O
   30xHtbd6f9D8GY8CA7TV3jijYPH+9hz3SvJc0fS1AAARK9lMTHhs2Ruvh
   g==;
X-CSE-ConnectionGUID: toMunO1qSdCOi/vi/B3xaw==
X-CSE-MsgGUID: b8lg6GhJR4qgUTHNH7b2Tg==
X-IronPort-AV: E=McAfee;i="6700,10204,11366"; a="46396075"
X-IronPort-AV: E=Sophos;i="6.14,231,1736841600"; 
   d="scan'208";a="46396075"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2025 01:17:10 -0800
X-CSE-ConnectionGUID: fLV6IGZKT7mtqBEPsh0yXg==
X-CSE-MsgGUID: YbPWow3VRTmnJ5ZpKUccNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="124759205"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 08 Mar 2025 01:17:06 -0800
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tqqIp-0001k0-2h;
	Sat, 08 Mar 2025 09:17:03 +0000
Date: Sat, 8 Mar 2025 17:16:34 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Reidel <adrian@mainlining.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bastien Nocera <hadess@hadess.net>,
	Hans de Goede <hdegoede@redhat.com>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, Luca Weiss <luca.weiss@fairphone.com>,
	linux-input@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
	linux@mainlining.org, ~postmarketos/upstreaming@lists.sr.ht,
	Jens Reidel <adrian@mainlining.org>
Subject: Re: [PATCH v3 2/2] Input: goodix_berlin - Add support for Berlin-A
 series
Message-ID: <202503081606.xAchU9at-lkp@intel.com>
References: <20250307094823.478152-3-adrian@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250307094823.478152-3-adrian@mainlining.org>

Hi Jens,

kernel test robot noticed the following build errors:

[auto build test ERROR on dtor-input/next]
[also build test ERROR on dtor-input/for-linus robh/for-next krzk-dt/for-next linus/master v6.14-rc5 next-20250307]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jens-Reidel/dt-bindings-input-goodix-gt9916-Document-gt9897-compatible/20250307-175154
base:   https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
patch link:    https://lore.kernel.org/r/20250307094823.478152-3-adrian%40mainlining.org
patch subject: [PATCH v3 2/2] Input: goodix_berlin - Add support for Berlin-A series
config: i386-buildonly-randconfig-001-20250308 (https://download.01.org/0day-ci/archive/20250308/202503081606.xAchU9at-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250308/202503081606.xAchU9at-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503081606.xAchU9at-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/input/touchscreen/goodix_berlin_i2c.c: In function 'goodix_berlin_i2c_probe':
>> drivers/input/touchscreen/goodix_berlin_i2c.c:35:36: error: 'cd' undeclared (first use in this function)
      35 |                 i2c_get_match_data(cd->dev);
         |                                    ^~
   drivers/input/touchscreen/goodix_berlin_i2c.c:35:36: note: each undeclared identifier is reported only once for each function it appears in


vim +/cd +35 drivers/input/touchscreen/goodix_berlin_i2c.c

    31	
    32	static int goodix_berlin_i2c_probe(struct i2c_client *client)
    33	{
    34		const struct goodix_berlin_ic_data *ic_data =
  > 35			i2c_get_match_data(cd->dev);
    36		struct regmap *regmap;
    37		int error;
    38	
    39		regmap = devm_regmap_init_i2c(client, &goodix_berlin_i2c_regmap_conf);
    40		if (IS_ERR(regmap))
    41			return PTR_ERR(regmap);
    42	
    43		error = goodix_berlin_probe(&client->dev, client->irq,
    44					    &goodix_berlin_i2c_input_id, regmap,
    45					    ic_data);
    46		if (error)
    47			return error;
    48	
    49		return 0;
    50	}
    51	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

