Return-Path: <linux-input+bounces-3977-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 577518D5885
	for <lists+linux-input@lfdr.de>; Fri, 31 May 2024 04:14:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7B0211C21C54
	for <lists+linux-input@lfdr.de>; Fri, 31 May 2024 02:14:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FD647580A;
	Fri, 31 May 2024 02:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B8Y9Mju1"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF3E9745FD;
	Fri, 31 May 2024 02:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717121666; cv=none; b=U65aYQtO00mrbyb+LhLdaXdQfSFy16tP+ex4FsHKty0pPnJzJZfIYBs/Fkf4CLqDWfV1t4pVjBMfxYyGEzZEoVQrFU6pt3FaQiuK3ir2wj/tRW9IBT+2QktOPKKPgIScqhyrzJ+P9fsCuOweAt9pijKUFM+sqj3YDDyGaeDmAk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717121666; c=relaxed/simple;
	bh=xn2rd7kJ5Qxtu2XGb+Wyt9/YczBrhI26LyxJ9KOGmdI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Iq7htJNv3if0rbwfi8DddmmNICNcPCxhkwhIdXSoL6xJFsLlB7hY+/yMBftO9LjfozRxZbGYw5/Ieh6QwhNRt4FIpG334VwVEwn5kF8RNrhLZBFLnJhZGAS8OXn4Wnt4gGo8lcgDK2xmAUcttDoQh6MiG366wP94PNg5tpvq+aI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B8Y9Mju1; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717121664; x=1748657664;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xn2rd7kJ5Qxtu2XGb+Wyt9/YczBrhI26LyxJ9KOGmdI=;
  b=B8Y9Mju1QxJJyx4zpm87pB6i50bL+DbS8n0TJCuZO4iRcYX+0x0BTB6q
   CwGL2OSkMwh+r8PrLCeMPX5uGGk3BffeMvhnCkD/t4KXJ50Bt1K4fUAO0
   PF6lMBd0b1ouvC4LcAMCmS59GoCbxUtnsrnaGViTqIcc8RFIWct2J3ee+
   LL4/otQ1JGvhdPXABSNglWGPqBz4xgayGHZaYyoWQp6ZjtRgzjdu+K4yu
   Db91Ekz1pTT0G9efTBevw09/W8hkACmpPvqCJjaCiDU2ekynRTlTvb7/Y
   TpqUnawiHRXCDVNCfxB5FZhIyPEQQLaadCij0hgykOujO7v5iCX8XPvLO
   g==;
X-CSE-ConnectionGUID: DnpVZpYLTB6bAPfYZinD1Q==
X-CSE-MsgGUID: IxECV3rPQR2UesQamJ/9fA==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="13521060"
X-IronPort-AV: E=Sophos;i="6.08,202,1712646000"; 
   d="scan'208";a="13521060"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2024 19:14:24 -0700
X-CSE-ConnectionGUID: 7Y5+mafaTTav5NAg9Qp+cA==
X-CSE-MsgGUID: SL2k1zsaQ36x4fwsYkhXkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,202,1712646000"; 
   d="scan'208";a="40466790"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 30 May 2024 19:14:20 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sCrmc-000GOH-02;
	Fri, 31 May 2024 02:14:18 +0000
Date: Fri, 31 May 2024 10:14:01 +0800
From: kernel test robot <lkp@intel.com>
To: Kamel Bouhara <kamel.bouhara@bootlin.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Henrik Rydberg <rydberg@bitmath.org>, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Marco Felsch <m.felsch@pengutronix.de>,
	Jeff LaBundy <jeff@labundy.com>
Cc: oe-kbuild-all@lists.linux.dev, catalin.popescu@leica-geosystems.com,
	mark.satterthwaite@touchnetix.com,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Gregory Clement <gregory.clement@bootlin.com>,
	bsp-development.geo@leica-geosystems.com,
	Kamel Bouhara <kamel.bouhara@bootlin.com>
Subject: Re: [PATCH v12 3/3] Input: Add TouchNetix axiom i2c touchscreen
 driver
Message-ID: <202405311035.5QZSREJv-lkp@intel.com>
References: <20240529091004.107256-4-kamel.bouhara@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240529091004.107256-4-kamel.bouhara@bootlin.com>

Hi Kamel,

kernel test robot noticed the following build errors:

[auto build test ERROR on dtor-input/next]
[also build test ERROR on dtor-input/for-linus robh/for-next krzk-dt/for-next linus/master v6.10-rc1 next-20240529]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kamel-Bouhara/dt-bindings-vendor-prefixes-Add-TouchNetix-AS/20240529-171328
base:   https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
patch link:    https://lore.kernel.org/r/20240529091004.107256-4-kamel.bouhara%40bootlin.com
patch subject: [PATCH v12 3/3] Input: Add TouchNetix axiom i2c touchscreen driver
config: x86_64-randconfig-103-20240531 (https://download.01.org/0day-ci/archive/20240531/202405311035.5QZSREJv-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240531/202405311035.5QZSREJv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405311035.5QZSREJv-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/input/touchscreen/touchnetix_axiom.o: in function `axiom_handle_events':
>> drivers/input/touchscreen/touchnetix_axiom.c:473:(.text+0x245f): undefined reference to `crc16'


vim +473 drivers/input/touchscreen/touchnetix_axiom.c

   442	
   443	/*
   444	 * Validates the crc and demultiplexes the axiom reports to the appropriate
   445	 * report handler
   446	 */
   447	static int axiom_handle_events(struct axiom_data *ts)
   448	{
   449		struct input_dev *input_dev = ts->input_dev;
   450		u8 *report_data = ts->rx_buf;
   451		struct device *dev = ts->dev;
   452		u16 crc_report;
   453		u8 *crc_bytes;
   454		u16 crc_calc;
   455		int error;
   456		u8 len;
   457	
   458		error = axiom_read(ts, AXIOM_REPORT_USAGE_ID, 0, report_data, ts->max_report_len);
   459		if (error)
   460			return error;
   461	
   462		len = (report_data[0] & AXIOM_COMMS_REPORT_LEN_MASK) << 1;
   463		if (len <= 2) {
   464			dev_err(dev, "Zero length report discarded.\n");
   465			return -ENODATA;
   466		}
   467	
   468		/* Validate the report CRC */
   469		crc_bytes = &report_data[len];
   470	
   471		crc_report = get_unaligned_le16(crc_bytes - 2);
   472		/* Length is in 16 bit words and remove the size of the CRC16 itself */
 > 473		crc_calc = crc16(0, report_data, (len - 2));
   474	
   475		if (crc_calc != crc_report) {
   476			dev_err(dev,
   477				"CRC mismatch! Expected: %#x, Calculated CRC: %#x.\n",
   478				crc_report, crc_calc);
   479			return -EINVAL;
   480		}
   481	
   482		switch (report_data[1]) {
   483		case AXIOM_USAGE_2DCTS_REPORT_ID:
   484			if (axiom_process_u41_report(ts, &report_data[1])) {
   485				input_mt_sync_frame(input_dev);
   486				input_sync(input_dev);
   487			}
   488			break;
   489	
   490		case AXIOM_USAGE_2AUX_REPORT_ID:
   491			/* This is an aux report (force) */
   492			axiom_process_u46_report(ts, &report_data[1]);
   493			input_mt_sync(input_dev);
   494			input_sync(input_dev);
   495			break;
   496	
   497		case AXIOM_USAGE_2HB_REPORT_ID:
   498			/* This is a heartbeat report */
   499			break;
   500		default:
   501			return -EINVAL;
   502		}
   503	
   504		return 0;
   505	}
   506	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

