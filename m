Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB65D38A0B6
	for <lists+linux-input@lfdr.de>; Thu, 20 May 2021 11:20:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231485AbhETJV2 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 20 May 2021 05:21:28 -0400
Received: from mga04.intel.com ([192.55.52.120]:24403 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230483AbhETJV1 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 20 May 2021 05:21:27 -0400
IronPort-SDR: SabsN1XDguxKkVPMPM0jT/5g164+DmhTVEiMzEPZysmMZ+rdvbLgeSnV2lmTmmSzkJIOuAoOiX
 8hteaQ2cE9lw==
X-IronPort-AV: E=McAfee;i="6200,9189,9989"; a="199233748"
X-IronPort-AV: E=Sophos;i="5.82,313,1613462400"; 
   d="scan'208";a="199233748"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2021 02:20:04 -0700
IronPort-SDR: K7jppVTLmI1HF96E7Mz9uaj/GZm1uPK4WuShVCPLZHJVTsFEI6LIQiulD4O/ZZxomkrm8ULfkf
 y6GVIEE2Ntew==
X-IronPort-AV: E=Sophos;i="5.82,313,1613462400"; 
   d="scan'208";a="473921150"
Received: from shao2-debian.sh.intel.com (HELO [10.239.13.11]) ([10.239.13.11])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2021 02:20:02 -0700
Subject: Re: [kbuild-all] Re: [PATCH 3/5] HID: magicmouse: Magic Trackpad 2
 USB battery capacity
To:     =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>
Cc:     jikos@kernel.org, kbuild-all@lists.01.org,
        benjamin.tissoires@redhat.com, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210511182023.730524-3-jose.exposito89@gmail.com>
 <202105121712.MGWeLu1Q-lkp@intel.com>
 <20210515185021.GA177131@elementary-os.localdomain>
From:   Rong Chen <rong.a.chen@intel.com>
Message-ID: <eeba0785-1d5c-7d4a-d5c4-af6ffb3f4f8b@intel.com>
Date:   Thu, 20 May 2021 17:18:51 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20210515185021.GA177131@elementary-os.localdomain>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org



On 5/16/21 2:50 AM, José Expósito wrote:
> On Wed, May 12, 2021 at 05:39:31PM +0800, kernel test robot wrote:
>> Hi "José,
>>
>> Thank you for the patch! Yet something to improve:
>>
>> [auto build test ERROR on hid/for-next]
>> [also build test ERROR on v5.13-rc1 next-20210511]
>> [If your patch is applied to the wrong git tree, kindly drop us a note.
>> And when submitting patch, we suggest to use '--base' as documented in
>> https://git-scm.com/docs/git-format-patch]
>>
>> url:    https://github.com/0day-ci/linux/commits/Jos-Exp-sito/HID-magicmouse-register-power-supply/20210512-022327
>> base:   https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git for-next
>> config: s390-randconfig-r002-20210512 (attached as .config)
>> compiler: s390-linux-gcc (GCC) 9.3.0
>> reproduce (this is a W=1 build):
>>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>>          chmod +x ~/bin/make.cross
>>          # https://github.com/0day-ci/linux/commit/701f395a5566b6d2fd3a78389983237668902998
>>          git remote add linux-review https://github.com/0day-ci/linux
>>          git fetch --no-tags linux-review Jos-Exp-sito/HID-magicmouse-register-power-supply/20210512-022327
>>          git checkout 701f395a5566b6d2fd3a78389983237668902998
>>          # save the attached .config to linux build tree
>>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross W=1 ARCH=s390
>>
>> If you fix the issue, kindly add following tag as appropriate
>> Reported-by: kernel test robot <lkp@intel.com>
>>
>> All errors (new ones prefixed by >>):
>>
>>     s390-linux-ld: drivers/pcmcia/cistpl.o: in function `set_cis_map':
>>     cistpl.c:(.text+0x3a2): undefined reference to `ioremap'
>>     s390-linux-ld: cistpl.c:(.text+0x3dc): undefined reference to `iounmap'
>>     s390-linux-ld: cistpl.c:(.text+0x404): undefined reference to `iounmap'
>>     s390-linux-ld: cistpl.c:(.text+0x416): undefined reference to `ioremap'
>>     s390-linux-ld: drivers/pcmcia/cistpl.o: in function `release_cis_mem':
>>     cistpl.c:(.text+0xe16): undefined reference to `iounmap'
>>     s390-linux-ld: drivers/hid/hid-magicmouse.o: in function `magicmouse_remove':
>>     hid-magicmouse.c:(.text+0xd2c): undefined reference to `usb_kill_urb'
>>>> s390-linux-ld: hid-magicmouse.c:(.text+0xd48): undefined reference to `usb_free_coherent'
>>>> s390-linux-ld: hid-magicmouse.c:(.text+0xd54): undefined reference to `usb_free_urb'
>>     s390-linux-ld: drivers/hid/hid-magicmouse.o: in function `magicmouse_battery_usb_urb_complete':
>>     hid-magicmouse.c:(.text+0xe12): undefined reference to `usb_submit_urb'
>>     s390-linux-ld: drivers/hid/hid-magicmouse.o: in function `magicmouse_probe':
>>     hid-magicmouse.c:(.text+0x1194): undefined reference to `usb_alloc_urb'
>>>> s390-linux-ld: hid-magicmouse.c:(.text+0x121a): undefined reference to `usb_alloc_coherent'
>>     s390-linux-ld: hid-magicmouse.c:(.text+0x1422): undefined reference to `usb_free_coherent'
>>     s390-linux-ld: hid-magicmouse.c:(.text+0x142e): undefined reference to `usb_free_urb'
>>>> s390-linux-ld: hid-magicmouse.c:(.text+0x1462): undefined reference to `usb_submit_urb'
>> ---
>> 0-DAY CI Kernel Test Service, Intel Corporation
>> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
> Hi all,
>
> I'm a little bit confused about the build errors reported by Intel's test bot and I'd really appreciate human input.
> This is the first patch I submit, so apologies in advance if I missed a basic step.
>
> I compiled and tested every patch before submission and they all compiled and worked on this tree:
> git://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git
>
> After receiving this email, I followed the instructions attached to build it and indeed it failed.
> However, I reverted my changes and the kernel still didn't compile.
>
> Is this something I need to fix?

Hi José Expósito,

I think it's related to HAS_IOMEM in drivers/usb/Kconfig:

menuconfig USB_SUPPORT
         bool "USB support"
         depends on HAS_IOMEM
         default y
         help
           This option adds core support for Universal Serial Bus (USB).
           You will also need drivers from the following menu to make 
use of it.

and I found a similar issue fixed by the below commit:

commit 1f685e6adbbe3c7b1bd9053be771b898d9efa655
Author: Randy Dunlap <rdunlap@infradead.org>
Date:   Tue Jan 5 20:25:31 2021 -0800

     ptp: ptp_ines: prevent build when HAS_IOMEM is not set

     ptp_ines.c uses devm_platform_ioremap_resource(), which is only
     built/available when CONFIG_HAS_IOMEM is enabled.
     CONFIG_HAS_IOMEM is not enabled for arch/s390/, so builds on S390
     have a build error:

     s390-linux-ld: drivers/ptp/ptp_ines.o: in function 
`ines_ptp_ctrl_probe':
     ptp_ines.c:(.text+0x17e6): undefined reference to 
`devm_platform_ioremap_resource'

     Prevent builds of ptp_ines.c when HAS_IOMEM is not set.

     Fixes: bad1eaa6ac31 ("ptp: Add a driver for InES time stamping IP 
core.")
     Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
     Reported-by: kernel test robot <lkp@intel.com>
     Link: lore.kernel.org/r/202101031125.ZEFCUiKi-lkp@intel.com
     Acked-by: Richard Cochran <richardcochran@gmail.com>
     Link: 
https://lore.kernel.org/r/20210106042531.1351-1-rdunlap@infradead.org
     Signed-off-by: Jakub Kicinski <kuba@kernel.org>

diff --git a/drivers/ptp/Kconfig b/drivers/ptp/Kconfig
index d2bf05ccbbe20d..f2edef0df40f5c 100644
--- a/drivers/ptp/Kconfig
+++ b/drivers/ptp/Kconfig
@@ -79,6 +79,7 @@ config DP83640_PHY
  config PTP_1588_CLOCK_INES
         tristate "ZHAW InES PTP time stamping IP core"
         depends on NETWORK_PHY_TIMESTAMPING
+       depends on HAS_IOMEM
         depends on PHYLIB
         depends on PTP_1588_CLOCK
         help

Best Regards,
Rong Chen

>
> Thank you very much in advance,
> José Expósito
> _______________________________________________
> kbuild-all mailing list -- kbuild-all@lists.01.org
> To unsubscribe send an email to kbuild-all-leave@lists.01.org

