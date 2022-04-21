Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2D4F650A244
	for <lists+linux-input@lfdr.de>; Thu, 21 Apr 2022 16:27:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1389285AbiDUOaQ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 21 Apr 2022 10:30:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1389241AbiDUOaO (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 21 Apr 2022 10:30:14 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 485933EA93
        for <linux-input@vger.kernel.org>; Thu, 21 Apr 2022 07:27:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650551243; x=1682087243;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4J2UUuc90UmV2G3ZQ27HUNCRZRGdc1JlbZHxuDDQ2RI=;
  b=Yl7kOQWZ1QSurJdUxPFWE/NqSo3M8HesXHoZFx23/kLRMzqcTs1FW+o/
   psu2/e0JHIfCUCeHlAgyror0CGn6Ud3I8kvcgxNrOnPtTMkCGqWrccgqk
   X70WnQfXF/Q6chIR04nlqaEWyoeiFS8WWmh987omGRhKvc7ZMgFv9vRUS
   jfa6EaX2/jVV8RfwdWN0v7ap2eUhGjAzR0IAkllPji/8zkycb0rmGYMVc
   H5hheZh/Z+EGUwdXw7yYM0W9Hm2n823J93N7Yu30CbSmpm2rg6zjslamZ
   rTqXAeLEbFyMURt70x/jGaSdhxT8kZhtK2sIXGqKXdVyeCaP81+Lo0VBr
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10324"; a="251680030"
X-IronPort-AV: E=Sophos;i="5.90,278,1643702400"; 
   d="scan'208";a="251680030"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2022 07:27:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,278,1643702400"; 
   d="scan'208";a="866249273"
Received: from lkp-server01.sh.intel.com (HELO 3abc53900bec) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 21 Apr 2022 07:27:20 -0700
Received: from kbuild by 3abc53900bec with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1nhXmB-0008TP-LF;
        Thu, 21 Apr 2022 14:27:19 +0000
Date:   Thu, 21 Apr 2022 22:26:46 +0800
From:   kernel test robot <lkp@intel.com>
To:     Joshua-Dickens <Joshua@joshua-dickens.com>
Cc:     llvm@lists.linux.dev, kbuild-all@lists.01.org,
        linux-input@vger.kernel.org, Jiri Kosina <jkosina@suse.cz>,
        Joshua Dickens <joshua.dickens@wacom.com>,
        Jason Gerecke <jason.gerecke@wacom.com>
Subject: [hid:for-5.19/wacom 1/2] drivers/hid/wacom_wac.c:2411:42: warning:
 format specifies type 'unsigned short' but the argument has type 'int'
Message-ID: <202204212217.M2efI2Po-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git for-5.19/wacom
head:   6ff1cae2e30a79265bcce85f617663c480936ab0
commit: 6d09085b38e5ace0001cf4f3cdbd4bf247533b61 [1/2] HID: wacom: Adding Support for new usages
config: riscv-randconfig-r026-20220420 (https://download.01.org/0day-ci/archive/20220421/202204212217.M2efI2Po-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project bac6cd5bf85669e3376610cfc4c4f9ca015e7b9b)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git/commit/?id=6d09085b38e5ace0001cf4f3cdbd4bf247533b61
        git remote add hid https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git
        git fetch --no-tags hid for-5.19/wacom
        git checkout 6d09085b38e5ace0001cf4f3cdbd4bf247533b61
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/hid/ kernel/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from drivers/hid/wacom_wac.c:11:
   In file included from drivers/hid/wacom_wac.h:10:
   In file included from include/linux/kfifo.h:42:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:464:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:477:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                                                     ^
   In file included from drivers/hid/wacom_wac.c:11:
   In file included from drivers/hid/wacom_wac.h:10:
   In file included from include/linux/kfifo.h:42:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:490:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from drivers/hid/wacom_wac.c:11:
   In file included from drivers/hid/wacom_wac.h:10:
   In file included from include/linux/kfifo.h:42:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:501:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:511:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:521:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:1024:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
                                                     ~~~~~~~~~~ ^
>> drivers/hid/wacom_wac.c:2411:42: warning: format specifies type 'unsigned short' but the argument has type 'int' [-Wformat]
                           hid_warn(hdev, "Dropped %hu packets", value - wacom_wac->hid_data.sequence_number);
                                                   ~~~           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                                                   %d
   include/linux/hid.h:1210:31: note: expanded from macro 'hid_warn'
           dev_warn(&(hid)->dev, fmt, ##__VA_ARGS__)
                                 ~~~    ^~~~~~~~~~~
   include/linux/dev_printk.h:146:70: note: expanded from macro 'dev_warn'
           dev_printk_index_wrap(_dev_warn, KERN_WARNING, dev, dev_fmt(fmt), ##__VA_ARGS__)
                                                                       ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
                   _p_func(dev, fmt, ##__VA_ARGS__);                       \
                                ~~~    ^~~~~~~~~~~
   8 warnings generated.


vim +2411 drivers/hid/wacom_wac.c

  2292	
  2293	static void wacom_wac_pen_event(struct hid_device *hdev, struct hid_field *field,
  2294			struct hid_usage *usage, __s32 value)
  2295	{
  2296		struct wacom *wacom = hid_get_drvdata(hdev);
  2297		struct wacom_wac *wacom_wac = &wacom->wacom_wac;
  2298		struct wacom_features *features = &wacom_wac->features;
  2299		struct input_dev *input = wacom_wac->pen_input;
  2300		unsigned equivalent_usage = wacom_equivalent_usage(usage->hid);
  2301	
  2302		if (wacom_wac->is_invalid_bt_frame)
  2303			return;
  2304	
  2305		switch (equivalent_usage) {
  2306		case HID_GD_Z:
  2307			/*
  2308			 * HID_GD_Z "should increase as the control's position is
  2309			 * moved from high to low", while ABS_DISTANCE instead
  2310			 * increases in value as the tool moves from low to high.
  2311			 */
  2312			value = field->logical_maximum - value;
  2313			break;
  2314		case HID_DG_INRANGE:
  2315			wacom_wac->hid_data.inrange_state = value;
  2316			if (!(features->quirks & WACOM_QUIRK_SENSE))
  2317				wacom_wac->hid_data.sense_state = value;
  2318			return;
  2319		case HID_DG_INVERT:
  2320			wacom_wac->hid_data.invert_state = value;
  2321			return;
  2322		case HID_DG_ERASER:
  2323		case HID_DG_TIPSWITCH:
  2324			wacom_wac->hid_data.tipswitch |= value;
  2325			return;
  2326		case HID_DG_BARRELSWITCH:
  2327			wacom_wac->hid_data.barrelswitch = value;
  2328			return;
  2329		case HID_DG_BARRELSWITCH2:
  2330			wacom_wac->hid_data.barrelswitch2 = value;
  2331			return;
  2332		case HID_DG_TOOLSERIALNUMBER:
  2333			if (value) {
  2334				wacom_wac->serial[0] = (wacom_wac->serial[0] & ~0xFFFFFFFFULL);
  2335				wacom_wac->serial[0] |= wacom_s32tou(value, field->report_size);
  2336			}
  2337			return;
  2338		case HID_DG_TWIST:
  2339			/*
  2340			 * Userspace expects pen twist to have its zero point when
  2341			 * the buttons/finger is on the tablet's left. HID values
  2342			 * are zero when buttons are toward the top.
  2343			 */
  2344			value = wacom_offset_rotation(input, usage, value, 1, 4);
  2345			break;
  2346		case WACOM_HID_WD_SENSE:
  2347			wacom_wac->hid_data.sense_state = value;
  2348			return;
  2349		case WACOM_HID_WD_SERIALHI:
  2350			if (value) {
  2351				__u32 raw_value = wacom_s32tou(value, field->report_size);
  2352	
  2353				wacom_wac->serial[0] = (wacom_wac->serial[0] & 0xFFFFFFFF);
  2354				wacom_wac->serial[0] |= ((__u64)raw_value) << 32;
  2355				/*
  2356				 * Non-USI EMR devices may contain additional tool type
  2357				 * information here. See WACOM_HID_WD_TOOLTYPE case for
  2358				 * more details.
  2359				 */
  2360				if (value >> 20 == 1) {
  2361					wacom_wac->id[0] |= raw_value & 0xFFFFF;
  2362				}
  2363			}
  2364			return;
  2365		case WACOM_HID_WD_TOOLTYPE:
  2366			/*
  2367			 * Some devices (MobileStudio Pro, and possibly later
  2368			 * devices as well) do not return the complete tool
  2369			 * type in their WACOM_HID_WD_TOOLTYPE usage. Use a
  2370			 * bitwise OR so the complete value can be built
  2371			 * up over time :(
  2372			 */
  2373			wacom_wac->id[0] |= wacom_s32tou(value, field->report_size);
  2374			return;
  2375		case WACOM_HID_WD_OFFSETLEFT:
  2376			if (features->offset_left && value != features->offset_left)
  2377				hid_warn(hdev, "%s: overriding existing left offset "
  2378					 "%d -> %d\n", __func__, value,
  2379					 features->offset_left);
  2380			features->offset_left = value;
  2381			return;
  2382		case WACOM_HID_WD_OFFSETRIGHT:
  2383			if (features->offset_right && value != features->offset_right)
  2384				hid_warn(hdev, "%s: overriding existing right offset "
  2385					 "%d -> %d\n", __func__, value,
  2386					 features->offset_right);
  2387			features->offset_right = value;
  2388			return;
  2389		case WACOM_HID_WD_OFFSETTOP:
  2390			if (features->offset_top && value != features->offset_top)
  2391				hid_warn(hdev, "%s: overriding existing top offset "
  2392					 "%d -> %d\n", __func__, value,
  2393					 features->offset_top);
  2394			features->offset_top = value;
  2395			return;
  2396		case WACOM_HID_WD_OFFSETBOTTOM:
  2397			if (features->offset_bottom && value != features->offset_bottom)
  2398				hid_warn(hdev, "%s: overriding existing bottom offset "
  2399					 "%d -> %d\n", __func__, value,
  2400					 features->offset_bottom);
  2401			features->offset_bottom = value;
  2402			return;
  2403		case WACOM_HID_WD_REPORT_VALID:
  2404			wacom_wac->is_invalid_bt_frame = !value;
  2405			return;
  2406		case WACOM_HID_WD_BARRELSWITCH3:
  2407			wacom_wac->hid_data.barrelswitch3 = value;
  2408			return;
  2409		case WACOM_HID_WD_SEQUENCENUMBER:
  2410			if (wacom_wac->hid_data.sequence_number != value)
> 2411				hid_warn(hdev, "Dropped %hu packets", value - wacom_wac->hid_data.sequence_number);
  2412			wacom_wac->hid_data.sequence_number = value + 1;
  2413			return;
  2414		}
  2415	
  2416		/* send pen events only when touch is up or forced out
  2417		 * or touch arbitration is off
  2418		 */
  2419		if (!usage->type || delay_pen_events(wacom_wac))
  2420			return;
  2421	
  2422		/* send pen events only when the pen is in range */
  2423		if (wacom_wac->hid_data.inrange_state)
  2424			input_event(input, usage->type, usage->code, value);
  2425		else if (wacom_wac->shared->stylus_in_proximity && !wacom_wac->hid_data.sense_state)
  2426			input_event(input, usage->type, usage->code, 0);
  2427	}
  2428	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
