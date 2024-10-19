Return-Path: <linux-input+bounces-7555-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D72E69A4EAD
	for <lists+linux-input@lfdr.de>; Sat, 19 Oct 2024 16:33:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8EE0D1F254C6
	for <lists+linux-input@lfdr.de>; Sat, 19 Oct 2024 14:33:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC7D6219F3;
	Sat, 19 Oct 2024 14:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kexrLE22"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93EC410A12
	for <linux-input@vger.kernel.org>; Sat, 19 Oct 2024 14:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729348418; cv=none; b=nCU6vfFJLQqCNBNx44fg39k0B+rCTUbNOnBYhpMDFhCcDTXz7iT0e4D1ymIm3cC6B3uoCiwKPD9znlvgR8jgNNxL2tQeAA8srhnj4VD5RMQW+TDCkWJfE9dEsm7nbBHcwsLucHDdW5FGSCZ1XF5s+Vw8QCvbZRcVOjAlRVCG3OM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729348418; c=relaxed/simple;
	bh=I/a6OcdGhnboPzCP1pde22XAGGLM1V7shNDvpaVF2nQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Qdt0LASruEsxRY2xG1tvc9q5qXSzwxxCMyp+dtZ/9yhmLR+fo6n4QMyPzDdBkPTJqihAeqRkphyP61eh1qcbT63PwURuRGl33OhXg/BXc6iDz8W8Nu92mcJza8uvlWnt28sG/sNrOAkGb84Wcel7aJzWtrX0MjxNoPi9VqYc4AA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kexrLE22; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729348416; x=1760884416;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=I/a6OcdGhnboPzCP1pde22XAGGLM1V7shNDvpaVF2nQ=;
  b=kexrLE220tl9QoUEqCplCgnQCRq3fW+mINtDWHgXMwb3BUsNjY7GNXBR
   nrcdEsUQmYp70uCFFEVcLEHf8HhnRsH3GZavP00U41O33W7W0nwv3Nz7H
   qrdS7M4rENqAdpcDlqtpB86Cdb7NvF8geCcWo2PTORUjNdebZS7aqMZbd
   FI1sLpo7rW8B7QqmrGGfPCj2Ls97sKug/hgsuEy1yDn8cbe2bB4VuPsH9
   Gq8QPSz9bvUcTpHkR3SkUDsnJOL7De0UkY1oaTCW2bIFX2vpz1puKBux/
   VgE6vGNWVHEttEL59iztpAJnu3ga345fImdfHs3sEuywdHSrC7GeBmJQj
   A==;
X-CSE-ConnectionGUID: ZtwUm9jGTPyHiCI5bf283w==
X-CSE-MsgGUID: dkOrtd8fQBOE090qM5ZPiw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28754772"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="28754772"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2024 07:33:36 -0700
X-CSE-ConnectionGUID: jT1g8V6tRHmwGPeM2celPA==
X-CSE-MsgGUID: k7EwIEH3S3S6npufcE5Tdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,216,1725346800"; 
   d="scan'208";a="83744075"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 19 Oct 2024 07:33:34 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t2AWK-000P4Z-2o;
	Sat, 19 Oct 2024 14:33:32 +0000
Date: Sat, 19 Oct 2024 22:33:16 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-input@vger.kernel.org
Subject: [dtor-input:next 94/110] drivers/input/serio/gscps2.c:221:50: error:
 'struct <anonymous>' has no member named 'ste'; did you mean 'str'?
Message-ID: <202410192242.GL0CoAbv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
head:   2c19d0159944f3aef1c0ebbd9d7fc6c2523e4307
commit: 44f920069911437dbce84084de02b5cba4ba94f7 [94/110] Input: gscps2 - use guard notation when acquiring spinlock
config: parisc-defconfig (https://download.01.org/0day-ci/archive/20241019/202410192242.GL0CoAbv-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241019/202410192242.GL0CoAbv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410192242.GL0CoAbv-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/input/serio/gscps2.c: In function 'gscps2_reset':
>> drivers/input/serio/gscps2.c:201:23: warning: unused variable 'flags' [-Wunused-variable]
     201 |         unsigned long flags;
         |                       ^~~~~
   drivers/input/serio/gscps2.c: In function 'gscps2_read_data':
>> drivers/input/serio/gscps2.c:221:50: error: 'struct <anonymous>' has no member named 'ste'; did you mean 'str'?
     221 |                 ps2port->buffer[ps2port->append].ste = status;
         |                                                  ^~~
         |                                                  str


vim +221 drivers/input/serio/gscps2.c

   194	
   195	/*
   196	 * gscps2_reset() - resets the PS/2 port
   197	 */
   198	
   199	static void gscps2_reset(struct gscps2port *ps2port)
   200	{
 > 201		unsigned long flags;
   202	
   203		/* reset the interface */
   204		guard(spinlock_irqsave)(&ps2port->lock);
   205		gscps2_flush(ps2port);
   206		writeb(0xff, ps2port->addr + GSC_RESET);
   207		gscps2_flush(ps2port);
   208	}
   209	
   210	static LIST_HEAD(ps2port_list);
   211	
   212	static void gscps2_read_data(struct gscps2port *ps2port)
   213	{
   214		u8 status;
   215	
   216		do {
   217			status = gscps2_readb_status(ps2port->addr);
   218			if (!(status & GSC_STAT_RBNE))
   219				break;
   220	
 > 221			ps2port->buffer[ps2port->append].ste = status;
   222			ps2port->buffer[ps2port->append].data =
   223					gscps2_readb_input(ps2port->addr);
   224		} while (true);
   225	}
   226	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

