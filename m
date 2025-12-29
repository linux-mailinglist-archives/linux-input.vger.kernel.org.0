Return-Path: <linux-input+bounces-16712-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AB9CACE5B27
	for <lists+linux-input@lfdr.de>; Mon, 29 Dec 2025 02:43:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 337973006A7C
	for <lists+linux-input@lfdr.de>; Mon, 29 Dec 2025 01:43:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A1043A1E7E;
	Mon, 29 Dec 2025 01:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RKg3EVJM"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D0311862A;
	Mon, 29 Dec 2025 01:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766972584; cv=none; b=neIRDK9yVGPp+7Lznz6QFkmw+exqtkbdAukujbSD9MM08AXGfOaGt8mLfHgFPvWFlrDjw/o4Q8yb3mZ/Kag9s9clu5/gCig0gzCXvI1L9kEfMpjgHlsipPibS5BTq+h3r+cpxtK11dQltNYfrpZKHefn6TfC6EeEYYZPj/Vzxww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766972584; c=relaxed/simple;
	bh=g6jBJo7CxXBUIVz7H0SxdbGhys+ZolE2nHgaE02tAl8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IZdLiHrM5l4ImDEY8VH36spxzEajuHwf+DMGZGhpzV7GaGrT1S7XEiFSPXkCwLigVY3TlpVCQPQo0Wb7kN3LT/rpXJ+euEDhAzwXvqc0yux5ILOBDUYVVu0wxvXXytEa/ZCHhiU5lyWE6aTjUgL5ASm/ZHf5vhgFOEm+mZGq57g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RKg3EVJM; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766972582; x=1798508582;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=g6jBJo7CxXBUIVz7H0SxdbGhys+ZolE2nHgaE02tAl8=;
  b=RKg3EVJMeA9TDyBfzrrjD1aQWktMr9G52kcbXu0I2bPz9tBAkY6I4sdz
   FnJqPX5lFt4NDVkWrXVcwA264f4PCGVwEb7PvkfYx2CtKd9UCyFwkKSsH
   dWR/rjlpNftng7stx56N53qkK6EPfumZYVxHkHkAeAR5SgiDXsqwxa5L1
   bbgrvr+9ggZpbDbKJRDNxgPQwx1YNYGfnxZ5C3gIg02ptlZA/aLDN1HSW
   uz2VsUYe7YSpF6vYIAsmS0HmuslG3bTjEZDx8hBAs2UQ+t87x1xOsmXVB
   GF6kBNo32C0DwG4KW0BQpCFysLVnrloJJmpzdXR2HHBiJa2aLPy3AJqGQ
   w==;
X-CSE-ConnectionGUID: Artx6qhUTR6TC6QCQ2IIAQ==
X-CSE-MsgGUID: NDcGadimQYO2actd0taqzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11655"; a="79319595"
X-IronPort-AV: E=Sophos;i="6.21,184,1763452800"; 
   d="scan'208";a="79319595"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2025 17:43:01 -0800
X-CSE-ConnectionGUID: ogcKJU6IRGSpUjDzHWXGDQ==
X-CSE-MsgGUID: A1f2BonGSzihMp+0mTGPUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,184,1763452800"; 
   d="scan'208";a="238222157"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 28 Dec 2025 17:42:59 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1va2Hh-000000007e4-26H2;
	Mon, 29 Dec 2025 01:42:57 +0000
Date: Mon, 29 Dec 2025 02:42:11 +0100
From: kernel test robot <lkp@intel.com>
To: Sriman Achanta <srimanachanta@gmail.com>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Sriman Achanta <srimanachanta@gmail.com>
Subject: Re: [PATCH 3/4] Documentation: ABI: Document SteelSeries headset
 sysfs attributes
Message-ID: <202512290229.oFaoatlF-lkp@intel.com>
References: <20251228122025.154682-4-srimanachanta@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251228122025.154682-4-srimanachanta@gmail.com>

Hi Sriman,

kernel test robot noticed the following build warnings:

[auto build test WARNING on hid/for-next]
[also build test WARNING on linus/master v6.19-rc3 next-20251219]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sriman-Achanta/HID-hid-ids-Add-SteelSeries-Arctis-headset-device-IDs/20251228-202426
base:   https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git for-next
patch link:    https://lore.kernel.org/r/20251228122025.154682-4-srimanachanta%40gmail.com
patch subject: [PATCH 3/4] Documentation: ABI: Document SteelSeries headset sysfs attributes
reproduce: (https://download.01.org/0day-ci/archive/20251229/202512290229.oFaoatlF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512290229.oFaoatlF-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Using alabaster theme
   ERROR: Cannot find file ./include/linux/pci.h
   WARNING: No kernel-doc for file ./include/linux/pci.h
   ERROR: Cannot find file ./include/linux/mod_devicetable.h
   WARNING: No kernel-doc for file ./include/linux/mod_devicetable.h
>> Documentation/ABI/testing/sysfs-driver-hid-steelseries:47: WARNING: Definition list ends without a blank line; unexpected unindent. [docutils]
   Documentation/ABI/testing/sysfs-driver-hid-steelseries:35: WARNING: Definition list ends without a blank line; unexpected unindent. [docutils]
   Documentation/ABI/testing/sysfs-driver-hid-steelseries:62: WARNING: Definition list ends without a blank line; unexpected unindent. [docutils]
   ERROR: Cannot find file ./include/linux/bootconfig.h
   WARNING: No kernel-doc for file ./include/linux/bootconfig.h
   ERROR: Cannot find file ./include/linux/pstore_zone.h


vim +47 Documentation/ABI/testing/sysfs-driver-hid-steelseries

  > 47	What:		/sys/class/hid/drivers/steelseries/<dev>/chatmix_level
    48	Date:		January 2025
    49	KernelVersion:	6.19
    50	Contact:	Sriman Achanta <srimanachanta@gmail.com>
    51	Description:
    52			Reports the current balance between Game and Chat audio channels
    53			(ChatMix). This value changes when the physical ChatMix dial
    54			on the headset is adjusted.
    55	
    56			Range: 0-128
    57			       0   = 100% Chat / 0% Game
    58			       64  = 50% Chat / 50% Game (Balanced)
    59			       128 = 0% Chat / 100% Game
    60			Access: Read
    61	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

