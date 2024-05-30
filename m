Return-Path: <linux-input+bounces-3966-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 69DF08D4480
	for <lists+linux-input@lfdr.de>; Thu, 30 May 2024 06:28:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ECA5F285918
	for <lists+linux-input@lfdr.de>; Thu, 30 May 2024 04:28:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D89F1143883;
	Thu, 30 May 2024 04:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C4OOGqum"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A289414387B;
	Thu, 30 May 2024 04:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717043304; cv=none; b=sIQxPoKeVea6FLkxedvQNwKu0sdXSQR9BI87ZrAL5KxLiAtUAlrb4NZXpr+zyGUxgY8uF+LmZG/Hejkyl+Xm9jFwlBJizAu3ZwZfPL/EzymsIWUADQEAXcoH6qdBaLPbdhOCszN4402IW0v5eiXKJmu+wiCTDsQpg6XV37cV3z4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717043304; c=relaxed/simple;
	bh=Vb4DzHQMDZ+bIB/aeLBPJz+U1QFjkT+JOnZ0SfhbWFQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rm7KqOCev7Q3kqXm6qzs7A2YYK51a5VpR7YmKnp3w8QvNuPlbHxCdhz71PFGXCOHzE4LgYiVbIUIQZ02zVOFoCp+noTRkahpFbpjlRvSu69v1+Zu+oUGdhz+SM9kJ1ygO/HltGjK00R+8cPHopd9HEpUm/5mtoACM4iLYNzIF4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C4OOGqum; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717043303; x=1748579303;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Vb4DzHQMDZ+bIB/aeLBPJz+U1QFjkT+JOnZ0SfhbWFQ=;
  b=C4OOGqumpyP8gzlFGZL+SQWm9yUU5sYpbzuCVekfYh0gAQgTVkoevyID
   HnIVeJDrPk1cEaobQ2aEQDXAteSx0uj0rEy0a6pKsbo8Ptidbrbf2s1Ff
   9IktTsUO9h0WItfdnE5QiZpdES2HcS/g+PEpf7J2SaKVAGvMxM0cKiHBB
   W0FpMqMPCVp7KYh5oCw/oSPyQxbakmoEbWutqr4yTYspNMflNbIIeflPI
   fFzIHbZl2t3jiXvNs8dnafw8RLdUMXSOU67hh2JP/VozJ7mtx1G8LCZ0k
   vm8P7dE2KxW4j1i6XpzkdnXFgLpsDQ+5E1G68PlIubySAJkJQk6bpwYPx
   Q==;
X-CSE-ConnectionGUID: nFcj2GjHQrOgRNcoF+w9wA==
X-CSE-MsgGUID: wRWlJ8aMTMSYTY8bL0JVxQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11087"; a="13442423"
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; 
   d="scan'208";a="13442423"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2024 21:28:22 -0700
X-CSE-ConnectionGUID: 92ghtZRYTR+XzmHPUJooHA==
X-CSE-MsgGUID: aPFn0MmTRICJCa7EMg/lOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; 
   d="scan'208";a="36314791"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 29 May 2024 21:28:19 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sCXOi-000Eny-37;
	Thu, 30 May 2024 04:28:16 +0000
Date: Thu, 30 May 2024 12:27:32 +0800
From: kernel test robot <lkp@intel.com>
To: wangshuaijie@awinic.com, dmitry.torokhov@gmail.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, jeff@labundy.com,
	linux-input@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, wangshuaijie@awinic.com,
	liweilei@awinic.com, kangjiajun@awinic.com
Subject: Re: [PATCH V1 5/5] Add support for Awinic sar sensor.
Message-ID: <202405301244.1ZqAu1Pf-lkp@intel.com>
References: <20240529130608.783624-6-wangshuaijie@awinic.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240529130608.783624-6-wangshuaijie@awinic.com>

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on e0cce98fe279b64f4a7d81b7f5c3a23d80b92fbc]

url:    https://github.com/intel-lab-lkp/linux/commits/wangshuaijie-awinic-com/dt-bindings-input-Add-YAML-to-Awinic-sar-sensor/20240529-211303
base:   e0cce98fe279b64f4a7d81b7f5c3a23d80b92fbc
patch link:    https://lore.kernel.org/r/20240529130608.783624-6-wangshuaijie%40awinic.com
patch subject: [PATCH V1 5/5] Add support for Awinic sar sensor.
config: xtensa-randconfig-r064-20240530 (https://download.01.org/0day-ci/archive/20240530/202405301244.1ZqAu1Pf-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240530/202405301244.1ZqAu1Pf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405301244.1ZqAu1Pf-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/input/misc/aw_sar/aw_sar.c:1992:34: warning: 'aw_sar_dt_match' defined but not used [-Wunused-const-variable=]
    1992 | static const struct of_device_id aw_sar_dt_match[] = {
         |                                  ^~~~~~~~~~~~~~~


vim +/aw_sar_dt_match +1992 drivers/input/misc/aw_sar/aw_sar.c

  1991	
> 1992	static const struct of_device_id aw_sar_dt_match[] = {
  1993		{ .compatible = "awinic,aw96103" },
  1994		{ .compatible = "awinic,aw96105" },
  1995		{ .compatible = "awinic,aw96303" },
  1996		{ .compatible = "awinic,aw96305" },
  1997		{ .compatible = "awinic,aw96308" },
  1998	};
  1999	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

