Return-Path: <linux-input+bounces-10643-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D2BAA57967
	for <lists+linux-input@lfdr.de>; Sat,  8 Mar 2025 10:17:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B4C3918928E9
	for <lists+linux-input@lfdr.de>; Sat,  8 Mar 2025 09:17:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3E8919DF53;
	Sat,  8 Mar 2025 09:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EeviCdro"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA9AF166F0C;
	Sat,  8 Mar 2025 09:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741425432; cv=none; b=WZFhCK8vLGW40WanJiNl34Caa4p7mO3KxCTPw7LS8go8xHc6+L5d3nv7c5cH3w0oOu+voYef+zzAQfD6gsfLdJprL+fldMkTmE0z04Nsylk2g60vOJxmdAdh1mtJaMdpyqoG2rntYriAY62DsXcXYq8exo4AtUqCsu9ymekVDMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741425432; c=relaxed/simple;
	bh=oNQG78hYLNkqJIU8Tl66FQzisDtqzypDr0j1eI4poYE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kD1qu3GN2Q925cd+2rroeWQVeUkedzMWMxkJuYtWXVUgDplc1Wq3oW9PEy74rL4TIXco7jS+x7UyLIMu3GWfrZIv7UzQxb3XaVr7yzn22t4ghl6EuqF3ursKbJ1u8tzyFb/vkQV0wb/0MAMplf0+eDYV1xybl5qi+eYv5T4H5gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EeviCdro; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741425431; x=1772961431;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=oNQG78hYLNkqJIU8Tl66FQzisDtqzypDr0j1eI4poYE=;
  b=EeviCdroHPpUcot08vLjnDDZTvnm6xcHrAYhyp026s6sdvHlTvxSAYfd
   Nmvzdq7Ho8HuFU8Npu2CFcHRELxd1OQAD0UIrNpRvc40uMk09cKIGanU2
   t8N7bQnzLhR+ve4E2TUR4xAnNd0dVZtRJqZTVKmjbqz9WTuSfSEIaGYz9
   t60ptqlRV2Vwe/n13ypK1GGFagv1LfnFoU5I7rqNYQU2uDBUN9dRmJONn
   lca1xakwhyUOeMzoLXNYuScCzBvJaj+lLHCswC+4BIeyuUAALa9z4NyIU
   9Sg7uDMQVZD3OXiL4zu+/94mAz/3Ca0gBZl3HB6HL+IKzapgwJ62yCVPf
   g==;
X-CSE-ConnectionGUID: n3omD0u/RVyKYZF7BN1f3A==
X-CSE-MsgGUID: k9eJ+Vd/SsOJyyh2VpQN7Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11366"; a="46396061"
X-IronPort-AV: E=Sophos;i="6.14,231,1736841600"; 
   d="scan'208";a="46396061"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2025 01:17:10 -0800
X-CSE-ConnectionGUID: lE91PsnrTCCgF6HS7Tpqmg==
X-CSE-MsgGUID: +74u2etmQ3CgU7nOLFOodw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="124759207"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 08 Mar 2025 01:17:06 -0800
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tqqIp-0001k2-2v;
	Sat, 08 Mar 2025 09:17:03 +0000
Date: Sat, 8 Mar 2025 17:16:35 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Reidel <adrian@mainlining.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bastien Nocera <hadess@hadess.net>,
	Hans de Goede <hdegoede@redhat.com>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Luca Weiss <luca.weiss@fairphone.com>, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	phone-devel@vger.kernel.org, linux@mainlining.org,
	~postmarketos/upstreaming@lists.sr.ht,
	Jens Reidel <adrian@mainlining.org>
Subject: Re: [PATCH v3 2/2] Input: goodix_berlin - Add support for Berlin-A
 series
Message-ID: <202503081721.EOfR4bx9-lkp@intel.com>
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
config: i386-buildonly-randconfig-003-20250308 (https://download.01.org/0day-ci/archive/20250308/202503081721.EOfR4bx9-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250308/202503081721.EOfR4bx9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503081721.EOfR4bx9-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/input/touchscreen/goodix_berlin_i2c.c:35:22: error: use of undeclared identifier 'cd'
      35 |                 i2c_get_match_data(cd->dev);
         |                                    ^
   1 error generated.


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

