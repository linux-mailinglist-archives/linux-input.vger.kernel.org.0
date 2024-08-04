Return-Path: <linux-input+bounces-5308-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 93BEC946BE6
	for <lists+linux-input@lfdr.de>; Sun,  4 Aug 2024 03:21:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F2C921F21A28
	for <lists+linux-input@lfdr.de>; Sun,  4 Aug 2024 01:21:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 274E31860;
	Sun,  4 Aug 2024 01:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LOU2MVWz"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67EFC370;
	Sun,  4 Aug 2024 01:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722734508; cv=none; b=alFnNR+KBDm6/udpZ5xr/OgoaOlcAWY3edOoL04tavLR4v2wd5LvDSiufM0nCaUPyE2gVpqPnWDYfEDSMo4boy8nBxJC8rE6Xbr0CxX5r78hgPyseQrO6hTVpsdKaXe9QVwYbboE+0i9i9oyKkdxA6AUtm9FpWzYUAqfk2BA5xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722734508; c=relaxed/simple;
	bh=ULD8hu/6LbE9TECygni6jXGyKWNJRoJvqssfORjqyc8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EojY7FpQr+EFbk0JHX7yluHRkWVLihwXVvyexj1mHNxnCDLppwoiisrBW7rwHLC7/c1D+qqj2SxauERcksZbJ1sllYtYTNIZDez+wkpjR4wA0ykiGydW36rhFXlGLvyWubH3i1GJeJjZkwklw5IDiVT361nPcNbPxmJUlNCSHtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LOU2MVWz; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722734506; x=1754270506;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ULD8hu/6LbE9TECygni6jXGyKWNJRoJvqssfORjqyc8=;
  b=LOU2MVWzaJyoyqVF79SI1vqNewRmL68GO7EuatB6b9j2gRTjo2vZlnAh
   8tNsAjvgubCxTIRRajJpbN8ZfPhU1q8T47uF7I+x8r6g4zLWZlu201NGB
   rxcPQkZGRZJ15HSTGRnnM0aTwh5BwSphuzl1mEs6Mu3Ysw4q91uPi2AeS
   ZVKNAM9tNCzra0HbIqQgC4++FIeC3F8wpDzCBAkdL4xtJ9/Ao0/qcBTVU
   bFvUp0vj7pP/LNiL8p56xy95vMqfZqZ/kck9WWPW5FnsTgr00mCknlEfx
   V2XoNr53R4HG97siWwzt7G70MjsrcMqmkXtcRw8F7A6sJuHmPuoKk4wj8
   w==;
X-CSE-ConnectionGUID: ckbaHkxhQkmZGr81agKgdw==
X-CSE-MsgGUID: ZHWW/Z0sRKmSpb0xIArajw==
X-IronPort-AV: E=McAfee;i="6700,10204,11153"; a="20859135"
X-IronPort-AV: E=Sophos;i="6.09,261,1716274800"; 
   d="scan'208";a="20859135"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2024 18:21:45 -0700
X-CSE-ConnectionGUID: cqwGBeSoQvuKkFJN5XcBXA==
X-CSE-MsgGUID: 44clfnrcTBWWL/76f/LRnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,261,1716274800"; 
   d="scan'208";a="55705972"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 03 Aug 2024 18:21:41 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1saPwH-00013S-38;
	Sun, 04 Aug 2024 01:21:37 +0000
Date: Sun, 4 Aug 2024 09:21:33 +0800
From: kernel test robot <lkp@intel.com>
To: Heiko Stuebner <heiko@sntech.de>, lee@kernel.org, jdelvare@suse.com,
	linux@roeck-us.net, dmitry.torokhov@gmail.com, pavel@ucw.cz
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, heiko@sntech.de,
	ukleinek@debian.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-hwmon@vger.kernel.org,
	linux-input@vger.kernel.org, linux-leds@vger.kernel.org
Subject: Re: [PATCH v3 2/7] mfd: add base driver for qnap-mcu devices
Message-ID: <202408040850.uHsR1c30-lkp@intel.com>
References: <20240731212430.2677900-3-heiko@sntech.de>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240731212430.2677900-3-heiko@sntech.de>

Hi Heiko,

kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20240801]
[also build test WARNING on v6.11-rc1]
[cannot apply to groeck-staging/hwmon-next lee-leds/for-leds-next lee-mfd/for-mfd-next lee-mfd/for-mfd-fixes linus/master v6.11-rc1 v6.10 v6.10-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Heiko-Stuebner/dt-bindings-mfd-add-binding-for-qnap-ts433-mcu-devices/20240802-103948
base:   next-20240801
patch link:    https://lore.kernel.org/r/20240731212430.2677900-3-heiko%40sntech.de
patch subject: [PATCH v3 2/7] mfd: add base driver for qnap-mcu devices
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20240804/202408040850.uHsR1c30-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 423aec6573df4424f90555468128e17073ddc69e)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240804/202408040850.uHsR1c30-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408040850.uHsR1c30-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/mfd/qnap-mcu.c:17:
   In file included from include/linux/serdev.h:10:
   In file included from include/linux/iopoll.h:14:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/mfd/qnap-mcu.c:17:
   In file included from include/linux/serdev.h:10:
   In file included from include/linux/iopoll.h:14:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/mfd/qnap-mcu.c:17:
   In file included from include/linux/serdev.h:10:
   In file included from include/linux/iopoll.h:14:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
>> drivers/mfd/qnap-mcu.c:109:5: warning: format specifies type 'unsigned long' but the argument has type 'size_t' (aka 'unsigned int') [-Wformat]
     108 |                 dev_warn(dev, "received %lu bytes, we were not waiting for\n",
         |                                         ~~~
         |                                         %zu
     109 |                          size);
         |                          ^~~~
   include/linux/dev_printk.h:156:70: note: expanded from macro 'dev_warn'
     156 |         dev_printk_index_wrap(_dev_warn, KERN_WARNING, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                                     ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ~~~    ^~~~~~~~~~~
   7 warnings generated.


vim +109 drivers/mfd/qnap-mcu.c

    96	
    97	static size_t qnap_mcu_receive_buf(struct serdev_device *serdev,
    98					   const u8 *buf, size_t size)
    99	{
   100		struct device *dev = &serdev->dev;
   101		struct qnap_mcu *mcu = dev_get_drvdata(dev);
   102		struct qnap_mcu_reply *reply = mcu->reply;
   103		const u8 *src = buf;
   104		const u8 *end = buf + size;
   105	
   106		mutex_lock(&mcu->reply_lock);
   107		if (!reply) {
   108			dev_warn(dev, "received %lu bytes, we were not waiting for\n",
 > 109				 size);
   110			mutex_unlock(&mcu->reply_lock);
   111			return size;
   112		}
   113	
   114		while (src < end) {
   115			reply->data[reply->received] = *src++;
   116			reply->received++;
   117	
   118			if (reply->received == reply->length) {
   119				complete(&reply->done);
   120				mutex_unlock(&mcu->reply_lock);
   121	
   122				/*
   123				 * We report the consumed number of bytes. If there
   124				 * are still bytes remaining (though there shouldn't)
   125				 * the serdev layer will re-execute this handler with
   126				 * the remainder of the Rx bytes.
   127				 */
   128				return src - buf;
   129			}
   130		}
   131	
   132		/*
   133		 * The only way to get out of the above loop and end up here
   134		 * is through consuming all of the supplied data, so here we
   135		 * report that we processed it all.
   136		 */
   137		mutex_unlock(&mcu->reply_lock);
   138		return size;
   139	}
   140	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

