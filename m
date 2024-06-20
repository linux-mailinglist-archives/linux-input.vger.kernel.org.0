Return-Path: <linux-input+bounces-4485-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FAA490FF0C
	for <lists+linux-input@lfdr.de>; Thu, 20 Jun 2024 10:38:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3E6491C235ED
	for <lists+linux-input@lfdr.de>; Thu, 20 Jun 2024 08:38:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CCFA199237;
	Thu, 20 Jun 2024 08:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gw8PI9Fa"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73A263A1AC
	for <linux-input@vger.kernel.org>; Thu, 20 Jun 2024 08:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718872727; cv=none; b=prFbpsItTbOMWAodcXLcN9E01BMnIr20Fk+Q7WvPdTOxRbyEV+9qmBXigAer6NepMh1oru7ObaRsKMCOr1rSrE9gtDvbyqlmV8qCS5pvZVUgdbgBuTvoCRbfz8zZgzRVV2e1C8R/C7CUTSwwdJDUIPOk/NC7Df8H2qE60YdpObw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718872727; c=relaxed/simple;
	bh=nUNb37LQf/rFfh4F+DXuEcF+KXMQ2p9VQrsoqy0ECq0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HVYqxOddGJ7lYgNO1hx9gkq450m63TBPEsNgVfUal1GD+LIRWq7DlrPoPr/wztDrmeKVsTmYuciw1vN40N6BTP3h42iX7uDxfJGCN2+fAraNp136ItYctkhdMz//rRdCAhvexqMhojswW4YQa/f2vHx27Uw4+N7lbLYTPzMwMt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gw8PI9Fa; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718872725; x=1750408725;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nUNb37LQf/rFfh4F+DXuEcF+KXMQ2p9VQrsoqy0ECq0=;
  b=gw8PI9Fais5aXTpbSgIofQ2iXIv0yKSuJj6OqziiiCzorYJmUD0i7pNF
   N9YrkxhfYai39cOihnhMbU9Yrl8ZEvGYwN48htxPBFMRP2VvXpPD3nsLk
   psL2KCzMBVG7KqciRE3j8po8J1UsJ/QzEZNLMFttzDZ0zezRd7rPIc03w
   dZWU5kOsBtwKa9LpRDXXyKmaN0INCGsrGp+MBcz71AKqK+VaFRJZee6V9
   BSdnM0unDDiZmFMBvOk7Ed3ykYLA0Ay2XBP2GN5UcHxSUm1iyosEipz21
   Tt04/8OxgBoTg0Clo4/Xc1vhAIW26mt2D4vNl1z6n7lIQjLyX/IX69lvk
   Q==;
X-CSE-ConnectionGUID: /BaEmM2QQ8m/RjjV2zYQbQ==
X-CSE-MsgGUID: svJ4Uum9S72HEHjIRKTWiw==
X-IronPort-AV: E=McAfee;i="6700,10204,11108"; a="12159290"
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; 
   d="scan'208";a="12159290"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2024 01:38:45 -0700
X-CSE-ConnectionGUID: KzsQpKClSqyGQ6QHLerIGw==
X-CSE-MsgGUID: yVvjWm7VS9udSAx3nG4bXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; 
   d="scan'208";a="46619326"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 20 Jun 2024 01:38:43 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sKDJZ-0007Ro-1r;
	Thu, 20 Jun 2024 08:38:41 +0000
Date: Thu, 20 Jun 2024 16:37:46 +0800
From: kernel test robot <lkp@intel.com>
To: "Luke D. Jones" <luke@ljones.dev>
Cc: oe-kbuild-all@lists.linux.dev, linux-input@vger.kernel.org,
	Jiri Kosina <jikos@kernel.org>
Subject: [hid:for-next 1/2]
 include/linux/platform_data/x86/asus-wmi.h:174:64: warning: missing braces
 around initializer
Message-ID: <202406201647.E2BChvPJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git for-next
head:   fa9057ccb9c323816e0f2599a2d91f5c856b0004
commit: bda38f9a41d89b47dce54932f88d0e0edee00cae [1/2] HID: asus: use hid for brightness control on keyboard
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20240620/202406201647.E2BChvPJ-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240620/202406201647.E2BChvPJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406201647.E2BChvPJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/hid/hid-asus.c:29:
>> include/linux/platform_data/x86/asus-wmi.h:174:64: warning: missing braces around initializer [-Wmissing-braces]
     174 | static const struct dmi_system_id asus_use_hid_led_dmi_ids[] = {
         |                                                                ^


vim +174 include/linux/platform_data/x86/asus-wmi.h

   173	
 > 174	static const struct dmi_system_id asus_use_hid_led_dmi_ids[] = {
   175		{
   176			.matches = {
   177				DMI_MATCH(DMI_PRODUCT_FAMILY, "ROG Zephyrus"),
   178			},
   179		},
   180		{
   181			.matches = {
   182				DMI_MATCH(DMI_PRODUCT_FAMILY, "ROG Strix"),
   183			},
   184		},
   185		{
   186			.matches = {
   187				DMI_MATCH(DMI_PRODUCT_FAMILY, "ROG Flow"),
   188			},
   189		},
   190		{
   191			.matches = {
   192				DMI_MATCH(DMI_BOARD_NAME, "GA403"),
   193			},
   194		},
   195		{
   196			.matches = {
   197				DMI_MATCH(DMI_BOARD_NAME, "GU605"),
   198			},
   199		},
   200		{
   201			.matches = {
   202				DMI_MATCH(DMI_BOARD_NAME, "RC71L"),
   203			},
   204		},
   205		NULL,
   206	};
   207	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

