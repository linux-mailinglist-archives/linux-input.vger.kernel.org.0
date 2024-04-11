Return-Path: <linux-input+bounces-2930-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E47838A136A
	for <lists+linux-input@lfdr.de>; Thu, 11 Apr 2024 13:45:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2167E1C2191C
	for <lists+linux-input@lfdr.de>; Thu, 11 Apr 2024 11:45:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0512149DF3;
	Thu, 11 Apr 2024 11:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LGgaYWU0"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26DB014A4CA
	for <linux-input@vger.kernel.org>; Thu, 11 Apr 2024 11:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712835871; cv=none; b=dDi0InZE22urc+WZCYQRvKYkeC9JgEgPay1dOUD/JCAIf3/hEt5rQcyhxtOJHQV4r0akz67t/vtyWwaCOYEk8nwUtMCw55J+sUKmyifQdm2kVwySsPpOFoRadKbmK3KQm0vVcEod/fV1H71T0Wq+fbKAIT6uxOpmOF+o3vCWz58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712835871; c=relaxed/simple;
	bh=ke4esdcE0x6GgQ9qunkK32d0/Y0fAo/3FWGyBx+G2+A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Am0gYNFWFzMSRFF+vIu1BOswhReXjHCp2rDcRfO6ZelALY8VaMmdWROUitRN/4mfGXPoCgQKlnT+seFGf7BxEd+qUrwPZTVwvREHdeAYiNZNjLH+ffIgLXzaJ2JoQl/ADHyO9PylORtHI9Nysa9F7eqLpxqYdAwCbIxyFsYzWbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LGgaYWU0; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712835868; x=1744371868;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ke4esdcE0x6GgQ9qunkK32d0/Y0fAo/3FWGyBx+G2+A=;
  b=LGgaYWU0v459E9h5UY0KIWjEELVGBfokoSPi2csjPFQ/4o9P48192Xgn
   4ZoYoNX2wawCYBJyZ/xx4WnyDuVfo+p/GbOYCUU1JzjQUkHHyJBKfGt/j
   IIrzX+/IMq43zlPpJ/9Z9/yoC4WJATDVAZNe53VA2/SxAWs+W1MqoF9vV
   7Jbc1yN3wdXRbYxrIhmEDRybIdRerzcKXYFOGr7a3T5lBH1odaaE9bSB/
   xhPgEoBMLfljaq35kSmDNyo8zLKQV2+rGeezsPybb9+sOlq5S3g6Uqnf4
   m59QmiyVauhUfW7eQbBgE9xk4q+Rb9hHqIHQ18D7eogECTlCG6ERJaVP8
   A==;
X-CSE-ConnectionGUID: zmCqqxM4SnOAhyLp3G/CGg==
X-CSE-MsgGUID: +z3rcq1jQHCJGmY6SZalng==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="19630999"
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; 
   d="scan'208";a="19630999"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2024 04:44:27 -0700
X-CSE-ConnectionGUID: FfZCsihQSQ2UFFhPvrIWjw==
X-CSE-MsgGUID: 1WO5lka7S62zT4tChgfY7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; 
   d="scan'208";a="52057889"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 11 Apr 2024 04:44:26 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rusqu-0008ZR-0e;
	Thu, 11 Apr 2024 11:44:24 +0000
Date: Thu, 11 Apr 2024 19:43:40 +0800
From: kernel test robot <lkp@intel.com>
To: Benjamin Tissoires <bentiss@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-input@vger.kernel.org
Subject: [hid:for-6.10/hid-bpf 5/7] ld.lld: error: undefined symbol:
 hid_input_report
Message-ID: <202404111903.69WRBBjD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git for-6.10/hid-bpf
head:   685dadafbde29dc3d6b7a13be284d684b06d4d4f
commit: 9be50ac30a83896a753ab9f64e941763bb7900be [5/7] HID: bpf: allow to inject HID event from BPF
config: i386-buildonly-randconfig-001-20240411 (https://download.01.org/0day-ci/archive/20240411/202404111903.69WRBBjD-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240411/202404111903.69WRBBjD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404111903.69WRBBjD-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: hid_input_report
   >>> referenced by hid_bpf_dispatch.c
   >>>               drivers/hid/bpf/hid_bpf_dispatch.o:(hid_bpf_input_report) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

