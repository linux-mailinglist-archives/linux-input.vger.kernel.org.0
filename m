Return-Path: <linux-input+bounces-2118-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C0AC486B905
	for <lists+linux-input@lfdr.de>; Wed, 28 Feb 2024 21:22:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6F2F51F2A4D8
	for <lists+linux-input@lfdr.de>; Wed, 28 Feb 2024 20:22:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A1FC1474CF;
	Wed, 28 Feb 2024 20:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D8Uc98dr"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3743040859
	for <linux-input@vger.kernel.org>; Wed, 28 Feb 2024 20:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709151756; cv=none; b=BlWNBg6MF9h2GOIFaiesegImrMGiXV0YKur2fMzpbQTiG1XQ5a4H2tA2RrfFn10qqWnOFxPh8eLAYthdb8Eln8ltM1EFX7T1fJLAL6Y4v3mgVJermGfHGIm8Tj48anmB/9OIfpoXNyWbQt5aMXrmqpB8Pc90e6zlYgLyJx1bV/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709151756; c=relaxed/simple;
	bh=j0jSw4rKkDz/y/GDLXUFBoFmSVa/315BKPEEy10JEzQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bfAfVg3lj8qttkzCEl62EyvQ5k0nSbRsC/f6TMbuijiYNl6OEAsqUm7OQ6iJqob8QQPGe+iEAq87h2SWyRjGsHnSrblMpJT1Ke5vG0m9/YTzPCMcHfG7tEwojk0DOUzzvNRRHsexDoOn+wm0UgSRT9f0oeFp11st0GryiTBlAzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D8Uc98dr; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709151753; x=1740687753;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=j0jSw4rKkDz/y/GDLXUFBoFmSVa/315BKPEEy10JEzQ=;
  b=D8Uc98drmu3xyqQBt6/mi5QxLQ8C2b76mqtKXxEWTJYPE/E31yB08+R8
   H1e9LcLsZhezV/EXCZSN/7PZGbtObCENmM6EaFLXJNj5ZNz1GA1v2NCNF
   nrvIuao0ejJj9MOaTS575pMy6nx5ra/bLDW53gjUWh5ZEAD9FLIgCTpmV
   bXRyGn6dIJWJKrOu0x9Zuwr3XIvdlSIts4m2NpTiRchWrlBfWE5AxZ7uc
   wHyHTdz2tf068wF/jYXv+GQl7lqXpue+GHofXvzsFUO9LAuUzsp9FXv7H
   yLLnuNrs15ur/pAbxY9J/xix7hip5ntg4UZNqIKBRVAhVqCqsd8v0K/Y5
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="21034953"
X-IronPort-AV: E=Sophos;i="6.06,191,1705392000"; 
   d="scan'208";a="21034953"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2024 12:22:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,191,1705392000"; 
   d="scan'208";a="7608320"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 28 Feb 2024 12:22:31 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rfQRg-000CMu-1a;
	Wed, 28 Feb 2024 20:22:28 +0000
Date: Thu, 29 Feb 2024 04:22:03 +0800
From: kernel test robot <lkp@intel.com>
To: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-input@vger.kernel.org, Jiri Kosina <jikos@kernel.org>
Subject: [hid:for-next 5/10] drivers/hid/amd-sfh-hid/amd_sfh_pcie.c:413:7:
 error: use of undeclared identifier 'boot_cpu_data'
Message-ID: <202402290458.HbkBPldx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git for-next
head:   f0cd2e82460c8b6c691bf553480c30144f8c32f7
commit: 6296562f30b1caf4b5f44e0c89c8f5cbfdb14b4a [5/10] HID: amd_sfh: Extend MP2 register access to SFH
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20240229/202402290458.HbkBPldx-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project edd4aee4dd9b5b98b2576a6f783e4086173d902a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240229/202402290458.HbkBPldx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402290458.HbkBPldx-lkp@intel.com/

Note: the hid/for-next HEAD f0cd2e82460c8b6c691bf553480c30144f8c32f7 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   In file included from drivers/hid/amd-sfh-hid/amd_sfh_pcie.c:14:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:78:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
         |                                                           ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
     102 | #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
         |                                                      ^
   In file included from drivers/hid/amd-sfh-hid/amd_sfh_pcie.c:14:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:78:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                                                           ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
     115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
         |                                                      ^
   In file included from drivers/hid/amd-sfh-hid/amd_sfh_pcie.c:14:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:78:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:692:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     692 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:700:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     700 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:708:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     708 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:717:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     717 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:726:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     726 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:735:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     735 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
>> drivers/hid/amd-sfh-hid/amd_sfh_pcie.c:413:7: error: use of undeclared identifier 'boot_cpu_data'
     413 |                 if (boot_cpu_data.x86 >= 0x1A)
         |                     ^
   drivers/hid/amd-sfh-hid/amd_sfh_pcie.c:401:45: warning: shift count >= width of type [-Wshift-count-overflow]
     401 |         rc = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(64));
         |                                                    ^~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:77:54: note: expanded from macro 'DMA_BIT_MASK'
      77 | #define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
         |                                                      ^ ~~~
   13 warnings and 1 error generated.


vim +/boot_cpu_data +413 drivers/hid/amd-sfh-hid/amd_sfh_pcie.c

   374	
   375	static int amd_mp2_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
   376	{
   377		struct amd_mp2_dev *privdata;
   378		int rc;
   379	
   380		if (dmi_first_match(dmi_nodevs))
   381			return -ENODEV;
   382	
   383		dmi_check_system(dmi_sfh_table);
   384	
   385		privdata = devm_kzalloc(&pdev->dev, sizeof(*privdata), GFP_KERNEL);
   386		if (!privdata)
   387			return -ENOMEM;
   388	
   389		privdata->pdev = pdev;
   390		dev_set_drvdata(&pdev->dev, privdata);
   391		rc = pcim_enable_device(pdev);
   392		if (rc)
   393			return rc;
   394	
   395		rc = pcim_iomap_regions(pdev, BIT(2), DRIVER_NAME);
   396		if (rc)
   397			return rc;
   398	
   399		privdata->mmio = pcim_iomap_table(pdev)[2];
   400		pci_set_master(pdev);
   401		rc = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(64));
   402		if (rc) {
   403			dev_err(&pdev->dev, "failed to set DMA mask\n");
   404			return rc;
   405		}
   406	
   407		privdata->cl_data = devm_kzalloc(&pdev->dev, sizeof(struct amdtp_cl_data), GFP_KERNEL);
   408		if (!privdata->cl_data)
   409			return -ENOMEM;
   410	
   411		privdata->sfh1_1_ops = (const struct amd_sfh1_1_ops *)id->driver_data;
   412		if (privdata->sfh1_1_ops) {
 > 413			if (boot_cpu_data.x86 >= 0x1A)
   414				privdata->rver = 1;
   415	
   416			rc = devm_work_autocancel(&pdev->dev, &privdata->work, sfh1_1_init_work);
   417			if (rc)
   418				return rc;
   419	
   420			schedule_work(&privdata->work);
   421			return 0;
   422		}
   423	
   424		mp2_select_ops(privdata);
   425	
   426		rc = amd_sfh_irq_init(privdata);
   427		if (rc) {
   428			dev_err(&pdev->dev, "amd_sfh_irq_init failed\n");
   429			return rc;
   430		}
   431	
   432		rc = devm_work_autocancel(&pdev->dev, &privdata->work, sfh_init_work);
   433		if (rc) {
   434			amd_sfh_clear_intr(privdata);
   435			return rc;
   436		}
   437	
   438		schedule_work(&privdata->work);
   439		return 0;
   440	}
   441	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

