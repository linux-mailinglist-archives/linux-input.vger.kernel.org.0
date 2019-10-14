Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9DD1BD5A60
	for <lists+linux-input@lfdr.de>; Mon, 14 Oct 2019 06:35:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725554AbfJNEfj (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 14 Oct 2019 00:35:39 -0400
Received: from mail-40135.protonmail.ch ([185.70.40.135]:60550 "EHLO
        mail-40135.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725536AbfJNEfj (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 14 Oct 2019 00:35:39 -0400
Date:   Mon, 14 Oct 2019 04:35:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=default; t=1571027734;
        bh=LQhFs9+E+t2MwUyqffX3mJBaav3/gamZjgd4DZ5HcnM=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:
         Feedback-ID:From;
        b=WQq/EV39Hl3Rl7utGlMwR/7bc2dijmzmIGkUmdEV3fk/JDZzfWNGU/oC4WHS3sjiT
         fsIx5KOuNaCmdEgSMOoIdSLVo+43WtxSIXRYdD8BWDV3RNcTfLINZ2zr43kBuwSPPX
         z603mSq2SNgEmcq5If4/Tl+s8mElXwXlbSEXIalE=
To:     kbuild test robot <lkp@intel.com>
From:   Mazin Rezk <mnrzk@protonmail.com>
Cc:     "kbuild-all@lists.01.org" <kbuild-all@lists.01.org>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "benjamin.tissoires@redhat.com" <benjamin.tissoires@redhat.com>,
        "jikos@kernel.org" <jikos@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        =?UTF-8?Q?Filipe_La=C3=ADns?= <lains@archlinux.org>
Reply-To: Mazin Rezk <mnrzk@protonmail.com>
Subject: Re: [PATCH v5 1/2] HID: logitech: Add MX Master over Bluetooth
Message-ID: <TKRbvHYo9MdseQJhtKe0NPnI1BAPwcVBM_mJjDhYyPD46CuOy06PNzSQ6ifxPMMzKXTsRoD2aC_AaY5L9OAovXbof8ItLNZHcXULttZnps8=@protonmail.com>
In-Reply-To: <201910140950.uA9aSUlt%lkp@intel.com>
References: <Mbf4goGxXZTfWwWtQQUke_rNf8kezpNOS9DVEVHf6RnnmjS1oRtMOJf4r14WfCC6GRYVs7gi0uZcIJ18Va2OJowzSbyMUGwLrl6I5fjW48o=@protonmail.com>
 <201910140950.uA9aSUlt%lkp@intel.com>
Feedback-ID: 18B_FC5q-t32TXzMsVp9BgkgrdNH3iwklfW8WOrHrcxZA0WRj7JodCh5VXKxs6A3OaiHK0QNd8wi3SImKex8yQ==:Ext:ProtonMail
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=7.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HK_RANDOM_REPLYTO
        autolearn=no autolearn_force=no version=3.4.2
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.protonmail.ch
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sunday, October 13, 2019 9:28 PM, kbuild test robot <lkp@intel.com> wrot=
e:

> Hi Mazin,
>
> Thank you for the patch! Perhaps something to improve:
>
> [auto build test WARNING on linus/master]
> [cannot apply to v5.4-rc2 next-20191010]
> [if your patch is applied to the wrong git tree, please drop us a note to=
 help
> improve the system. BTW, we also suggest to use '--base' option to specif=
y the
> base tree in git format-patch, please see https://stackoverflow.com/a/374=
06982]
>
> url: https://github.com/0day-ci/linux/commits/Mazin-Rezk/HID-logitech-Add=
-MX-Master-over-Bluetooth/20191014-071534
> config: mips-allmodconfig (attached as .config)
> compiler: mips-linux-gcc (GCC) 7.4.0
> reproduce:
> wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.c=
ross -O ~/bin/make.cross
> chmod +x ~/bin/make.cross
> # save the attached .config to linux build tree
> GCC_VERSION=3D7.4.0 make.cross ARCH=3Dmips
>
> If you fix the issue, kindly add following tag
> Reported-by: kbuild test robot lkp@intel.com
>
> All warnings (new ones prefixed by >>):
>
> In file included from include/linux/ioport.h:15:0,
> from include/linux/device.h:15,
> from drivers/hid/hid-logitech-hidpp.c:13:
> drivers/hid/hid-logitech-hidpp.c: In function 'hidpp_send_rap_command_syn=
c':
>
> > > include/linux/bits.h:8:26: warning: left shift count >=3D width of ty=
pe [-Wshift-count-overflow]
>
>     #define BIT(nr)   (UL(1) << (nr))
>                              ^
>
>
> > > drivers/hid/hid-logitech-hidpp.c:74:43: note: in expansion of macro '=
BIT'
>
>     #define HIDPP_QUIRK_MISSING_SHORT_REPORTS BIT(32)
>                                               ^~~
>
>
> > > drivers/hid/hid-logitech-hidpp.c:347:26: note: in expansion of macro =
'HIDPP_QUIRK_MISSING_SHORT_REPORTS'
>
>      if (hidpp_dev->quirks & HIDPP_QUIRK_MISSING_SHORT_REPORTS &&
>
>                              ^
>
>
> drivers/hid/hid-logitech-hidpp.c: In function 'hidpp_validate_device':
>
> > > include/linux/bits.h:8:26: warning: left shift count >=3D width of ty=
pe [-Wshift-count-overflow]
>
>     #define BIT(nr)   (UL(1) << (nr))
>                              ^
>
>
> > > drivers/hid/hid-logitech-hidpp.c:74:43: note: in expansion of macro '=
BIT'
>
>     #define HIDPP_QUIRK_MISSING_SHORT_REPORTS BIT(32)
>                                               ^~~
>
>
> drivers/hid/hid-logitech-hidpp.c:3496:22: note: in expansion of macro 'HI=
DPP_QUIRK_MISSING_SHORT_REPORTS'
> if (hidpp->quirks & HIDPP_QUIRK_MISSING_SHORT_REPORTS)
>
>                          ^
>
>
> drivers/hid/hid-logitech-hidpp.c: At top level:
>
> > > include/linux/bits.h:8:26: warning: left shift count >=3D width of ty=
pe [-Wshift-count-overflow]
>
>     #define BIT(nr)   (UL(1) << (nr))
>                              ^
>
>
> > > drivers/hid/hid-logitech-hidpp.c:74:43: note: in expansion of macro '=
BIT'
>
>     #define HIDPP_QUIRK_MISSING_SHORT_REPORTS BIT(32)
>                                               ^~~
>
>
> drivers/hid/hid-logitech-hidpp.c:85:40: note: in expansion of macro 'HIDP=
P_QUIRK_MISSING_SHORT_REPORTS'
> #define HIDPP_QUIRK_CLASS_BLUETOOTH_LE HIDPP_QUIRK_MISSING_SHORT_REPORTS
> ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>
> > > drivers/hid/hid-logitech-hidpp.c:3794:5: note: in expansion of macro =
'HIDPP_QUIRK_CLASS_BLUETOOTH_LE'
>
>         HIDPP_QUIRK_CLASS_BLUETOOTH_LE },
>         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>
>
> > > include/linux/bits.h:8:26: warning: left shift count >=3D width of ty=
pe [-Wshift-count-overflow]
>
>     #define BIT(nr)   (UL(1) << (nr))
>                              ^
>
>
> > > drivers/hid/hid-logitech-hidpp.c:74:43: note: in expansion of macro '=
BIT'
>
>     #define HIDPP_QUIRK_MISSING_SHORT_REPORTS BIT(32)
>                                               ^~~
>
>
> drivers/hid/hid-logitech-hidpp.c:85:40: note: in expansion of macro 'HIDP=
P_QUIRK_MISSING_SHORT_REPORTS'
> #define HIDPP_QUIRK_CLASS_BLUETOOTH_LE HIDPP_QUIRK_MISSING_SHORT_REPORTS
> ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/hid/hid-logitech-hidpp.c:3797:5: note: in expansion of macro 'HID=
PP_QUIRK_CLASS_BLUETOOTH_LE'
> HIDPP_QUIRK_CLASS_BLUETOOTH_LE },
> ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>
> -------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
-----
>
> In file included from include/linux/ioport.h:15:0,
> from include/linux/device.h:15,
> from drivers//hid/hid-logitech-hidpp.c:13:
> drivers//hid/hid-logitech-hidpp.c: In function 'hidpp_send_rap_command_sy=
nc':
>
> > > include/linux/bits.h:8:26: warning: left shift count >=3D width of ty=
pe [-Wshift-count-overflow]
>
>     #define BIT(nr)   (UL(1) << (nr))
>                              ^
>
>
> drivers//hid/hid-logitech-hidpp.c:74:43: note: in expansion of macro 'BIT=
'
> #define HIDPP_QUIRK_MISSING_SHORT_REPORTS BIT(32)
> ^~~
> drivers//hid/hid-logitech-hidpp.c:347:26: note: in expansion of macro 'HI=
DPP_QUIRK_MISSING_SHORT_REPORTS'
> if (hidpp_dev->quirks & HIDPP_QUIRK_MISSING_SHORT_REPORTS &&
>
>                              ^
>
>
> drivers//hid/hid-logitech-hidpp.c: In function 'hidpp_validate_device':
>
> > > include/linux/bits.h:8:26: warning: left shift count >=3D width of ty=
pe [-Wshift-count-overflow]
>
>     #define BIT(nr)   (UL(1) << (nr))
>                              ^
>
>
> drivers//hid/hid-logitech-hidpp.c:74:43: note: in expansion of macro 'BIT=
'
> #define HIDPP_QUIRK_MISSING_SHORT_REPORTS BIT(32)
> ^~~
> drivers//hid/hid-logitech-hidpp.c:3496:22: note: in expansion of macro 'H=
IDPP_QUIRK_MISSING_SHORT_REPORTS'
> if (hidpp->quirks & HIDPP_QUIRK_MISSING_SHORT_REPORTS)
>
>                          ^
>
>
> drivers//hid/hid-logitech-hidpp.c: At top level:
>
> > > include/linux/bits.h:8:26: warning: left shift count >=3D width of ty=
pe [-Wshift-count-overflow]
>
>     #define BIT(nr)   (UL(1) << (nr))
>                              ^
>
>
> drivers//hid/hid-logitech-hidpp.c:74:43: note: in expansion of macro 'BIT=
'
> #define HIDPP_QUIRK_MISSING_SHORT_REPORTS BIT(32)
> ^~~
> drivers//hid/hid-logitech-hidpp.c:85:40: note: in expansion of macro 'HID=
PP_QUIRK_MISSING_SHORT_REPORTS'
> #define HIDPP_QUIRK_CLASS_BLUETOOTH_LE HIDPP_QUIRK_MISSING_SHORT_REPORTS
> ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> drivers//hid/hid-logitech-hidpp.c:3794:5: note: in expansion of macro 'HI=
DPP_QUIRK_CLASS_BLUETOOTH_LE'
> HIDPP_QUIRK_CLASS_BLUETOOTH_LE },
> ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>
> > > include/linux/bits.h:8:26: warning: left shift count >=3D width of ty=
pe [-Wshift-count-overflow]
>
>     #define BIT(nr)   (UL(1) << (nr))
>                              ^
>
>
> drivers//hid/hid-logitech-hidpp.c:74:43: note: in expansion of macro 'BIT=
'
> #define HIDPP_QUIRK_MISSING_SHORT_REPORTS BIT(32)
> ^~~
> drivers//hid/hid-logitech-hidpp.c:85:40: note: in expansion of macro 'HID=
PP_QUIRK_MISSING_SHORT_REPORTS'
> #define HIDPP_QUIRK_CLASS_BLUETOOTH_LE HIDPP_QUIRK_MISSING_SHORT_REPORTS
> ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> drivers//hid/hid-logitech-hidpp.c:3797:5: note: in expansion of macro 'HI=
DPP_QUIRK_CLASS_BLUETOOTH_LE'
> HIDPP_QUIRK_CLASS_BLUETOOTH_LE },
> ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>
> vim +/BIT +74 drivers/hid/hid-logitech-hidpp.c
>
> 12
>
> > 13 #include <linux/device.h>
>
>     14=09#include <linux/input.h>
>
>     15=09#include <linux/usb.h>
>
>     16=09#include <linux/hid.h>
>
>     17=09#include <linux/module.h>
>
>     18=09#include <linux/slab.h>
>
>     19=09#include <linux/sched.h>
>
>     20=09#include <linux/sched/clock.h>
>
>     21=09#include <linux/kfifo.h>
>
>     22=09#include <linux/input/mt.h>
>
>     23=09#include <linux/workqueue.h>
>
>     24=09#include <linux/atomic.h>
>
>     25=09#include <linux/fixp-arith.h>
>
>     26=09#include <asm/unaligned.h>
>
>     27=09#include "usbhid/usbhid.h"
>     28=09#include "hid-ids.h"
>     29
>     30=09MODULE_LICENSE("GPL");
>     31=09MODULE_AUTHOR("Benjamin Tissoires <benjamin.tissoires@gmail.com>=
");
>
>     32=09MODULE_AUTHOR("Nestor Lopez Casado <nlopezcasad@logitech.com>");
>
>     33
>     34=09static bool disable_raw_mode;
>     35=09module_param(disable_raw_mode, bool, 0644);
>     36=09MODULE_PARM_DESC(disable_raw_mode,
>     37=09=09"Disable Raw mode reporting for touchpads and keep firmware g=
estures.");
>     38
>     39=09static bool disable_tap_to_click;
>     40=09module_param(disable_tap_to_click, bool, 0644);
>     41=09MODULE_PARM_DESC(disable_tap_to_click,
>     42=09=09"Disable Tap-To-Click mode reporting for touchpads (only on t=
he K400 currently).");
>     43
>     44=09#define REPORT_ID_HIDPP_SHORT=09=09=090x10
>     45=09#define REPORT_ID_HIDPP_LONG=09=09=090x11
>     46=09#define REPORT_ID_HIDPP_VERY_LONG=09=090x12
>     47
>     48=09#define HIDPP_REPORT_SHORT_LENGTH=09=097
>     49=09#define HIDPP_REPORT_LONG_LENGTH=09=0920
>     50=09#define HIDPP_REPORT_VERY_LONG_MAX_LENGTH=0964
>     51
>     52=09#define HIDPP_SUB_ID_CONSUMER_VENDOR_KEYS=090x03
>     53=09#define HIDPP_SUB_ID_ROLLER=09=09=090x05
>     54=09#define HIDPP_SUB_ID_MOUSE_EXTRA_BTNS=09=090x06
>     55
>     56=09#define HIDPP_QUIRK_CLASS_WTP=09=09=09BIT(0)
>     57=09#define HIDPP_QUIRK_CLASS_M560=09=09=09BIT(1)
>     58=09#define HIDPP_QUIRK_CLASS_K400=09=09=09BIT(2)
>     59=09#define HIDPP_QUIRK_CLASS_G920=09=09=09BIT(3)
>     60=09#define HIDPP_QUIRK_CLASS_K750=09=09=09BIT(4)
>     61
>     62=09/* bits 2..20 are reserved for classes */
>     63=09/* #define HIDPP_QUIRK_CONNECT_EVENTS=09=09BIT(21) disabled */
>     64=09#define HIDPP_QUIRK_WTP_PHYSICAL_BUTTONS=09BIT(22)
>     65=09#define HIDPP_QUIRK_NO_HIDINPUT=09=09=09BIT(23)
>     66=09#define HIDPP_QUIRK_FORCE_OUTPUT_REPORTS=09BIT(24)
>     67=09#define HIDPP_QUIRK_UNIFYING=09=09=09BIT(25)
>     68=09#define HIDPP_QUIRK_HI_RES_SCROLL_1P0=09=09BIT(26)
>     69=09#define HIDPP_QUIRK_HI_RES_SCROLL_X2120=09=09BIT(27)
>     70=09#define HIDPP_QUIRK_HI_RES_SCROLL_X2121=09=09BIT(28)
>     71=09#define HIDPP_QUIRK_HIDPP_WHEELS=09=09BIT(29)
>     72=09#define HIDPP_QUIRK_HIDPP_EXTRA_MOUSE_BTNS=09BIT(30)
>     73=09#define HIDPP_QUIRK_HIDPP_CONSUMER_VENDOR_KEYS=09BIT(31)
>
>
> > 74 #define HIDPP_QUIRK_MISSING_SHORT_REPORTS BIT(32)
>
>     75
>
>
> --
>
> 0-DAY kernel test infrastructure Open Source Technology Center
> https://lists.01.org/pipermail/kbuild-all Intel Corporation


It seems that I overlooked that quirks is an unsigned long and is 32-bit
on some architectures. I feel like it's possible to change driver_data
and quirks to unsigned long long but it seems like such an unnecessarily
large change.

Since we've already reached the 32-bit limit for quirks, is it possible
that we could change how many bits are reserved for classes?

Also, could bit 21 be reused for HIDPP_QUIRK_MISSING_SHORT_REPORTS?
