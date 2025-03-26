Return-Path: <linux-input+bounces-11303-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C7A1A71FBE
	for <lists+linux-input@lfdr.de>; Wed, 26 Mar 2025 20:56:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B1B833B31A6
	for <lists+linux-input@lfdr.de>; Wed, 26 Mar 2025 19:55:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0FC5253B52;
	Wed, 26 Mar 2025 19:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dZThqn65"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 604EB253349;
	Wed, 26 Mar 2025 19:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743018926; cv=none; b=uUVZ+8VdLWsMEQOuLqOSZhJP+Y8qVyEWuGWpGx1HlzGWU13VAFRLvZxM4b4OW99Og+82o6y4GAk7oW7UCj82TOoWiUafymFrERYrPyhn4PbqxoPcPimc6b7ZnIfBRL2SVKWVQABrIgDcg+aEAbJuadMQW91pR5CFA1M2gaN1REE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743018926; c=relaxed/simple;
	bh=adRAAix6DeWY9R1nR5Lr77KnAVY0W1YpaMjDvN5WTIk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M2iyxj01N9V+Ye4V/jR5+xK7C/p9Ksk9naW8VOMFhMKt+49dnUVZm4Mv3kXZaG5n+WCTKylqeJh6/AOtKLSfrFmOZV8p8fWrGyAOL+BbxiKZcwv5fZVNZOUR+2VuoxwpAHGPb+Carb+1yJfUIYGHSdSe7Eq0ZrOnCKifhMlfX2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dZThqn65; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743018925; x=1774554925;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=adRAAix6DeWY9R1nR5Lr77KnAVY0W1YpaMjDvN5WTIk=;
  b=dZThqn65mJcPmlJspNv64Be5FnLJGW3YCaRNvEtMyShf3gzb2bHhMtcr
   W0yt6666NVU5Zs4dTXX7qrJy6vOrDjn0ab2ujSKlLNfKUy1mguwcGNwZW
   Ik9l8o8GeYf77/BdGuKfahqhumcZe1G0ptZ7zal+SIdpzlxyCU2X8TK3t
   6i51K2CKuOdXg3m4E978lMkdQVhIGM3EeGy21izxgM3VtuMVOh5f62duW
   5io9uKpMN3hEFrVqPEhrUMGu00kzz8ANjHS/HCsI+/Hly6/4hzopm8PqO
   xsO2HUzsD9wtdXvwRDhzREMji0SUJyVFYGsxWz5LZDqKSy1PcsPaYYEsr
   g==;
X-CSE-ConnectionGUID: Bd0tpBjISpe/DUPE2QUwDg==
X-CSE-MsgGUID: E7sohhqfTF+foiFUB3eakw==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="66792896"
X-IronPort-AV: E=Sophos;i="6.14,278,1736841600"; 
   d="scan'208";a="66792896"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2025 12:55:24 -0700
X-CSE-ConnectionGUID: YKrBgZ7ZRxyXZACYfzbeyg==
X-CSE-MsgGUID: Q93VQfcJTcKsad2r+r8xXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,278,1736841600"; 
   d="scan'208";a="130090910"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 26 Mar 2025 12:55:21 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1txWqN-00061n-0h;
	Wed, 26 Mar 2025 19:55:19 +0000
Date: Thu, 27 Mar 2025 03:54:47 +0800
From: kernel test robot <lkp@intel.com>
To: Antheas Kapenekakis <lkml@antheas.dev>,
	platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Corentin Chary <corentin.chary@gmail.com>,
	"Luke D . Jones" <luke@ljones.dev>,
	Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Antheas Kapenekakis <lkml@antheas.dev>
Subject: Re: [PATCH v5 04/11] platform/x86: asus-wmi: Add support for
 multiple kbd RGB handlers
Message-ID: <202503270313.owOkR15i-lkp@intel.com>
References: <20250325184601.10990-5-lkml@antheas.dev>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250325184601.10990-5-lkml@antheas.dev>

Hi Antheas,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 38fec10eb60d687e30c8c6b5420d86e8149f7557]

url:    https://github.com/intel-lab-lkp/linux/commits/Antheas-Kapenekakis/HID-asus-refactor-init-sequence-per-spec/20250326-025845
base:   38fec10eb60d687e30c8c6b5420d86e8149f7557
patch link:    https://lore.kernel.org/r/20250325184601.10990-5-lkml%40antheas.dev
patch subject: [PATCH v5 04/11] platform/x86: asus-wmi: Add support for multiple kbd RGB handlers
config: i386-randconfig-062-20250326 (https://download.01.org/0day-ci/archive/20250327/202503270313.owOkR15i-lkp@intel.com/config)
compiler: clang version 20.1.1 (https://github.com/llvm/llvm-project 424c2d9b7e4de40d0804dd374721e6411c27d1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250327/202503270313.owOkR15i-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503270313.owOkR15i-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/platform/x86/asus-wmi.c:1498:21: sparse: sparse: symbol 'asus_ref' was not declared. Should it be static?
   drivers/platform/x86/asus-wmi.c:2576:33: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __le32 [usertype] @@
   drivers/platform/x86/asus-wmi.c:2576:33: sparse:     expected unsigned int [usertype] val
   drivers/platform/x86/asus-wmi.c:2576:33: sparse:     got restricted __le32 [usertype]

vim +/asus_ref +1498 drivers/platform/x86/asus-wmi.c

  1497	
> 1498	struct asus_hid_ref asus_ref = {
  1499		.listeners = LIST_HEAD_INIT(asus_ref.listeners),
  1500		.asus = NULL,
  1501		.lock = __SPIN_LOCK_UNLOCKED(asus_ref.lock),
  1502	};
  1503	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

