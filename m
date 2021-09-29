Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1AD4C41CF41
	for <lists+linux-input@lfdr.de>; Thu, 30 Sep 2021 00:32:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233018AbhI2Wdu (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 29 Sep 2021 18:33:50 -0400
Received: from mga07.intel.com ([134.134.136.100]:60137 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232425AbhI2Wdt (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 29 Sep 2021 18:33:49 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10122"; a="288712435"
X-IronPort-AV: E=Sophos;i="5.85,334,1624345200"; 
   d="gz'50?scan'50,208,50";a="288712435"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2021 15:32:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,334,1624345200"; 
   d="gz'50?scan'50,208,50";a="707497806"
Received: from lkp-server02.sh.intel.com (HELO f7acefbbae94) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 29 Sep 2021 15:32:03 -0700
Received: from kbuild by f7acefbbae94 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mVi7O-0003Qr-HK; Wed, 29 Sep 2021 22:32:02 +0000
Date:   Thu, 30 Sep 2021 06:31:01 +0800
From:   kernel test robot <lkp@intel.com>
To:     Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        linux-kernel@vger.kernel.org
Cc:     kbuild-all@lists.01.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        linux-input@vger.kernel.org, kernel@collabora.com
Subject: Re: [PATCH 2/2] tty/sysrq: Add configurable handler to execute a
 compound action
Message-ID: <202109300647.oomGMskQ-lkp@intel.com>
References: <20200804162402.2087-3-andrzej.p@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="YiEDa0DAkWCtVeE4"
Content-Disposition: inline
In-Reply-To: <20200804162402.2087-3-andrzej.p@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--YiEDa0DAkWCtVeE4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Andrzej,

I love your patch! Yet something to improve:

[auto build test ERROR on bcf876870b95592b52519ed4aafcf9d95999bc9c]

url:    https://github.com/0day-ci/linux/commits/Andrzej-Pietrasiewicz/Add-configurable-handler-to-execute-a-compound-action/20210929-183114
base:   bcf876870b95592b52519ed4aafcf9d95999bc9c
config: um-x86_64_defconfig (attached as .config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build):
        # https://github.com/0day-ci/linux/commit/c2e145de22842a121477d2c3dbe2bca210434138
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Andrzej-Pietrasiewicz/Add-configurable-handler-to-execute-a-compound-action/20210929-183114
        git checkout c2e145de22842a121477d2c3dbe2bca210434138
        # save the attached .config to linux build tree
        mkdir build_dir
        make W=1 O=build_dir ARCH=um SUBARCH=x86_64 SHELL=/bin/bash drivers/tty/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All error/warnings (new ones prefixed by >>):

   cc1: warning: arch/um/include/uapi: No such file or directory [-Wmissing-include-dirs]
>> drivers/tty/sysrq.c:1159:1: error: expected identifier or '(' before '{' token
    1159 | {
         | ^
   drivers/tty/sysrq.c: In function 'sysrq_action_compound':
>> drivers/tty/sysrq.c:1164:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    1164 | {
         | ^
   drivers/tty/sysrq.c:1168:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    1168 | {
         | ^
   drivers/tty/sysrq.c:1174:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    1174 | {
         | ^
   In file included from include/linux/linkage.h:7,
                    from include/linux/kernel.h:8,
                    from include/linux/list.h:9,
                    from include/linux/rculist.h:10,
                    from include/linux/sched/signal.h:5,
                    from drivers/tty/sysrq.c:18:
>> drivers/tty/sysrq.c:1188:19: error: storage class specified for parameter 'sysrq_toggle_support'
    1188 | EXPORT_SYMBOL_GPL(sysrq_toggle_support);
         |                   ^~~~~~~~~~~~~~~~~~~~
   include/linux/export.h:98:21: note: in definition of macro '___EXPORT_SYMBOL'
      98 |  extern typeof(sym) sym;       \
         |                     ^~~
   include/linux/export.h:155:34: note: in expansion of macro '__EXPORT_SYMBOL'
     155 | #define _EXPORT_SYMBOL(sym, sec) __EXPORT_SYMBOL(sym, sec, "")
         |                                  ^~~~~~~~~~~~~~~
   include/linux/export.h:159:33: note: in expansion of macro '_EXPORT_SYMBOL'
     159 | #define EXPORT_SYMBOL_GPL(sym)  _EXPORT_SYMBOL(sym, "_gpl")
         |                                 ^~~~~~~~~~~~~~
   drivers/tty/sysrq.c:1188:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
    1188 | EXPORT_SYMBOL_GPL(sysrq_toggle_support);
         | ^~~~~~~~~~~~~~~~~
>> include/linux/export.h:99:20: error: storage class specified for parameter '__kstrtab_sysrq_toggle_support'
      99 |  extern const char __kstrtab_##sym[];     \
         |                    ^~~~~~~~~~
   include/linux/export.h:147:39: note: in expansion of macro '___EXPORT_SYMBOL'
     147 | #define __EXPORT_SYMBOL(sym, sec, ns) ___EXPORT_SYMBOL(sym, sec, ns)
         |                                       ^~~~~~~~~~~~~~~~
   include/linux/export.h:155:34: note: in expansion of macro '__EXPORT_SYMBOL'
     155 | #define _EXPORT_SYMBOL(sym, sec) __EXPORT_SYMBOL(sym, sec, "")
         |                                  ^~~~~~~~~~~~~~~
   include/linux/export.h:159:33: note: in expansion of macro '_EXPORT_SYMBOL'
     159 | #define EXPORT_SYMBOL_GPL(sym)  _EXPORT_SYMBOL(sym, "_gpl")
         |                                 ^~~~~~~~~~~~~~
   drivers/tty/sysrq.c:1188:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
    1188 | EXPORT_SYMBOL_GPL(sysrq_toggle_support);
         | ^~~~~~~~~~~~~~~~~
>> include/linux/export.h:100:20: error: storage class specified for parameter '__kstrtabns_sysrq_toggle_support'
     100 |  extern const char __kstrtabns_##sym[];     \
         |                    ^~~~~~~~~~~~
   include/linux/export.h:147:39: note: in expansion of macro '___EXPORT_SYMBOL'
     147 | #define __EXPORT_SYMBOL(sym, sec, ns) ___EXPORT_SYMBOL(sym, sec, ns)
         |                                       ^~~~~~~~~~~~~~~~
   include/linux/export.h:155:34: note: in expansion of macro '__EXPORT_SYMBOL'
     155 | #define _EXPORT_SYMBOL(sym, sec) __EXPORT_SYMBOL(sym, sec, "")
         |                                  ^~~~~~~~~~~~~~~
   include/linux/export.h:159:33: note: in expansion of macro '_EXPORT_SYMBOL'
     159 | #define EXPORT_SYMBOL_GPL(sym)  _EXPORT_SYMBOL(sym, "_gpl")
         |                                 ^~~~~~~~~~~~~~
   drivers/tty/sysrq.c:1188:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
    1188 | EXPORT_SYMBOL_GPL(sysrq_toggle_support);
         | ^~~~~~~~~~~~~~~~~
>> include/linux/export.h:101:24: error: expected declaration specifiers before ';' token
     101 |  __CRC_SYMBOL(sym, sec);       \
         |                        ^
   include/linux/export.h:147:39: note: in expansion of macro '___EXPORT_SYMBOL'
     147 | #define __EXPORT_SYMBOL(sym, sec, ns) ___EXPORT_SYMBOL(sym, sec, ns)
         |                                       ^~~~~~~~~~~~~~~~
   include/linux/export.h:155:34: note: in expansion of macro '__EXPORT_SYMBOL'
     155 | #define _EXPORT_SYMBOL(sym, sec) __EXPORT_SYMBOL(sym, sec, "")
         |                                  ^~~~~~~~~~~~~~~
   include/linux/export.h:159:33: note: in expansion of macro '_EXPORT_SYMBOL'
     159 | #define EXPORT_SYMBOL_GPL(sym)  _EXPORT_SYMBOL(sym, "_gpl")
         |                                 ^~~~~~~~~~~~~~
   drivers/tty/sysrq.c:1188:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
    1188 | EXPORT_SYMBOL_GPL(sysrq_toggle_support);
         | ^~~~~~~~~~~~~~~~~
>> include/linux/export.h:102:2: error: expected declaration specifiers before 'asm'
     102 |  asm(" .section \"__ksymtab_strings\",\"aMS\",%progbits,1 \n" \
         |  ^~~
   include/linux/export.h:147:39: note: in expansion of macro '___EXPORT_SYMBOL'
     147 | #define __EXPORT_SYMBOL(sym, sec, ns) ___EXPORT_SYMBOL(sym, sec, ns)
         |                                       ^~~~~~~~~~~~~~~~
   include/linux/export.h:155:34: note: in expansion of macro '__EXPORT_SYMBOL'
     155 | #define _EXPORT_SYMBOL(sym, sec) __EXPORT_SYMBOL(sym, sec, "")
         |                                  ^~~~~~~~~~~~~~~
   include/linux/export.h:159:33: note: in expansion of macro '_EXPORT_SYMBOL'
     159 | #define EXPORT_SYMBOL_GPL(sym)  _EXPORT_SYMBOL(sym, "_gpl")
         |                                 ^~~~~~~~~~~~~~
   drivers/tty/sysrq.c:1188:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
    1188 | EXPORT_SYMBOL_GPL(sysrq_toggle_support);
         | ^~~~~~~~~~~~~~~~~
   include/linux/export.h:67:36: error: storage class specified for parameter '__ksymtab_sysrq_toggle_support'
      67 |  static const struct kernel_symbol __ksymtab_##sym  \
         |                                    ^~~~~~~~~~
   include/linux/export.h:108:2: note: in expansion of macro '__KSYMTAB_ENTRY'
     108 |  __KSYMTAB_ENTRY(sym, sec)
         |  ^~~~~~~~~~~~~~~
   include/linux/export.h:147:39: note: in expansion of macro '___EXPORT_SYMBOL'
     147 | #define __EXPORT_SYMBOL(sym, sec, ns) ___EXPORT_SYMBOL(sym, sec, ns)
         |                                       ^~~~~~~~~~~~~~~~
   include/linux/export.h:155:34: note: in expansion of macro '__EXPORT_SYMBOL'
     155 | #define _EXPORT_SYMBOL(sym, sec) __EXPORT_SYMBOL(sym, sec, "")
         |                                  ^~~~~~~~~~~~~~~
   include/linux/export.h:159:33: note: in expansion of macro '_EXPORT_SYMBOL'
     159 | #define EXPORT_SYMBOL_GPL(sym)  _EXPORT_SYMBOL(sym, "_gpl")
         |                                 ^~~~~~~~~~~~~~
   drivers/tty/sysrq.c:1188:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
    1188 | EXPORT_SYMBOL_GPL(sysrq_toggle_support);
         | ^~~~~~~~~~~~~~~~~
>> include/linux/export.h:67:22: error: parameter '__ksymtab_sysrq_toggle_support' is initialized
      67 |  static const struct kernel_symbol __ksymtab_##sym  \
         |                      ^~~~~~~~~~~~~
   include/linux/export.h:108:2: note: in expansion of macro '__KSYMTAB_ENTRY'
     108 |  __KSYMTAB_ENTRY(sym, sec)
         |  ^~~~~~~~~~~~~~~
   include/linux/export.h:147:39: note: in expansion of macro '___EXPORT_SYMBOL'
     147 | #define __EXPORT_SYMBOL(sym, sec, ns) ___EXPORT_SYMBOL(sym, sec, ns)
         |                                       ^~~~~~~~~~~~~~~~
   include/linux/export.h:155:34: note: in expansion of macro '__EXPORT_SYMBOL'
     155 | #define _EXPORT_SYMBOL(sym, sec) __EXPORT_SYMBOL(sym, sec, "")
         |                                  ^~~~~~~~~~~~~~~
   include/linux/export.h:159:33: note: in expansion of macro '_EXPORT_SYMBOL'
     159 | #define EXPORT_SYMBOL_GPL(sym)  _EXPORT_SYMBOL(sym, "_gpl")
         |                                 ^~~~~~~~~~~~~~
   drivers/tty/sysrq.c:1188:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
    1188 | EXPORT_SYMBOL_GPL(sysrq_toggle_support);
         | ^~~~~~~~~~~~~~~~~
>> include/linux/export.h:67:36: error: section attribute not allowed for '__ksymtab_sysrq_toggle_support'
      67 |  static const struct kernel_symbol __ksymtab_##sym  \
         |                                    ^~~~~~~~~~
   include/linux/export.h:108:2: note: in expansion of macro '__KSYMTAB_ENTRY'
     108 |  __KSYMTAB_ENTRY(sym, sec)
         |  ^~~~~~~~~~~~~~~
   include/linux/export.h:147:39: note: in expansion of macro '___EXPORT_SYMBOL'
     147 | #define __EXPORT_SYMBOL(sym, sec, ns) ___EXPORT_SYMBOL(sym, sec, ns)
         |                                       ^~~~~~~~~~~~~~~~
   include/linux/export.h:155:34: note: in expansion of macro '__EXPORT_SYMBOL'
     155 | #define _EXPORT_SYMBOL(sym, sec) __EXPORT_SYMBOL(sym, sec, "")
         |                                  ^~~~~~~~~~~~~~~
   include/linux/export.h:159:33: note: in expansion of macro '_EXPORT_SYMBOL'
     159 | #define EXPORT_SYMBOL_GPL(sym)  _EXPORT_SYMBOL(sym, "_gpl")
         |                                 ^~~~~~~~~~~~~~
   drivers/tty/sysrq.c:1188:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
    1188 | EXPORT_SYMBOL_GPL(sysrq_toggle_support);
         | ^~~~~~~~~~~~~~~~~
>> include/linux/export.h:67:22: warning: 'used' attribute ignored [-Wattributes]
      67 |  static const struct kernel_symbol __ksymtab_##sym  \
         |                      ^~~~~~~~~~~~~
   include/linux/export.h:108:2: note: in expansion of macro '__KSYMTAB_ENTRY'
     108 |  __KSYMTAB_ENTRY(sym, sec)
         |  ^~~~~~~~~~~~~~~
   include/linux/export.h:147:39: note: in expansion of macro '___EXPORT_SYMBOL'
     147 | #define __EXPORT_SYMBOL(sym, sec, ns) ___EXPORT_SYMBOL(sym, sec, ns)
         |                                       ^~~~~~~~~~~~~~~~
   include/linux/export.h:155:34: note: in expansion of macro '__EXPORT_SYMBOL'
     155 | #define _EXPORT_SYMBOL(sym, sec) __EXPORT_SYMBOL(sym, sec, "")
         |                                  ^~~~~~~~~~~~~~~
   include/linux/export.h:159:33: note: in expansion of macro '_EXPORT_SYMBOL'
     159 | #define EXPORT_SYMBOL_GPL(sym)  _EXPORT_SYMBOL(sym, "_gpl")
         |                                 ^~~~~~~~~~~~~~
   drivers/tty/sysrq.c:1188:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
    1188 | EXPORT_SYMBOL_GPL(sysrq_toggle_support);
         | ^~~~~~~~~~~~~~~~~
>> include/linux/export.h:67:36: error: alignment may not be specified for '__ksymtab_sysrq_toggle_support'
      67 |  static const struct kernel_symbol __ksymtab_##sym  \
         |                                    ^~~~~~~~~~
   include/linux/export.h:108:2: note: in expansion of macro '__KSYMTAB_ENTRY'
     108 |  __KSYMTAB_ENTRY(sym, sec)
         |  ^~~~~~~~~~~~~~~
   include/linux/export.h:147:39: note: in expansion of macro '___EXPORT_SYMBOL'
     147 | #define __EXPORT_SYMBOL(sym, sec, ns) ___EXPORT_SYMBOL(sym, sec, ns)
         |                                       ^~~~~~~~~~~~~~~~
   include/linux/export.h:155:34: note: in expansion of macro '__EXPORT_SYMBOL'
     155 | #define _EXPORT_SYMBOL(sym, sec) __EXPORT_SYMBOL(sym, sec, "")
         |                                  ^~~~~~~~~~~~~~~
   include/linux/export.h:159:33: note: in expansion of macro '_EXPORT_SYMBOL'
     159 | #define EXPORT_SYMBOL_GPL(sym)  _EXPORT_SYMBOL(sym, "_gpl")
         |                                 ^~~~~~~~~~~~~~
   drivers/tty/sysrq.c:1188:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
    1188 | EXPORT_SYMBOL_GPL(sysrq_toggle_support);
         | ^~~~~~~~~~~~~~~~~
   drivers/tty/sysrq.c:1192:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    1192 | {
         | ^
   drivers/tty/sysrq.c:1215:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    1215 | {
         | ^
   In file included from include/linux/linkage.h:7,
                    from include/linux/kernel.h:8,
                    from include/linux/list.h:9,
                    from include/linux/rculist.h:10,
                    from include/linux/sched/signal.h:5,
                    from drivers/tty/sysrq.c:18:
>> drivers/tty/sysrq.c:1218:15: error: storage class specified for parameter 'register_sysrq_key'
    1218 | EXPORT_SYMBOL(register_sysrq_key);
         |               ^~~~~~~~~~~~~~~~~~
   include/linux/export.h:98:21: note: in definition of macro '___EXPORT_SYMBOL'
      98 |  extern typeof(sym) sym;       \
         |                     ^~~
   include/linux/export.h:155:34: note: in expansion of macro '__EXPORT_SYMBOL'
     155 | #define _EXPORT_SYMBOL(sym, sec) __EXPORT_SYMBOL(sym, sec, "")
         |                                  ^~~~~~~~~~~~~~~
   include/linux/export.h:158:29: note: in expansion of macro '_EXPORT_SYMBOL'
     158 | #define EXPORT_SYMBOL(sym)  _EXPORT_SYMBOL(sym, "")
         |                             ^~~~~~~~~~~~~~
   drivers/tty/sysrq.c:1218:1: note: in expansion of macro 'EXPORT_SYMBOL'
    1218 | EXPORT_SYMBOL(register_sysrq_key);
         | ^~~~~~~~~~~~~
>> include/linux/export.h:99:20: error: storage class specified for parameter '__kstrtab_register_sysrq_key'
      99 |  extern const char __kstrtab_##sym[];     \
         |                    ^~~~~~~~~~
   include/linux/export.h:147:39: note: in expansion of macro '___EXPORT_SYMBOL'
     147 | #define __EXPORT_SYMBOL(sym, sec, ns) ___EXPORT_SYMBOL(sym, sec, ns)
         |                                       ^~~~~~~~~~~~~~~~
   include/linux/export.h:155:34: note: in expansion of macro '__EXPORT_SYMBOL'
     155 | #define _EXPORT_SYMBOL(sym, sec) __EXPORT_SYMBOL(sym, sec, "")
         |                                  ^~~~~~~~~~~~~~~
   include/linux/export.h:158:29: note: in expansion of macro '_EXPORT_SYMBOL'
     158 | #define EXPORT_SYMBOL(sym)  _EXPORT_SYMBOL(sym, "")
         |                             ^~~~~~~~~~~~~~
   drivers/tty/sysrq.c:1218:1: note: in expansion of macro 'EXPORT_SYMBOL'
    1218 | EXPORT_SYMBOL(register_sysrq_key);
         | ^~~~~~~~~~~~~
>> include/linux/export.h:100:20: error: storage class specified for parameter '__kstrtabns_register_sysrq_key'
     100 |  extern const char __kstrtabns_##sym[];     \
         |                    ^~~~~~~~~~~~
   include/linux/export.h:147:39: note: in expansion of macro '___EXPORT_SYMBOL'
     147 | #define __EXPORT_SYMBOL(sym, sec, ns) ___EXPORT_SYMBOL(sym, sec, ns)
         |                                       ^~~~~~~~~~~~~~~~
   include/linux/export.h:155:34: note: in expansion of macro '__EXPORT_SYMBOL'
     155 | #define _EXPORT_SYMBOL(sym, sec) __EXPORT_SYMBOL(sym, sec, "")
         |                                  ^~~~~~~~~~~~~~~
   include/linux/export.h:158:29: note: in expansion of macro '_EXPORT_SYMBOL'
     158 | #define EXPORT_SYMBOL(sym)  _EXPORT_SYMBOL(sym, "")
         |                             ^~~~~~~~~~~~~~
   drivers/tty/sysrq.c:1218:1: note: in expansion of macro 'EXPORT_SYMBOL'
    1218 | EXPORT_SYMBOL(register_sysrq_key);
         | ^~~~~~~~~~~~~
>> include/linux/export.h:101:24: error: expected declaration specifiers before ';' token
     101 |  __CRC_SYMBOL(sym, sec);       \
         |                        ^
   include/linux/export.h:147:39: note: in expansion of macro '___EXPORT_SYMBOL'
     147 | #define __EXPORT_SYMBOL(sym, sec, ns) ___EXPORT_SYMBOL(sym, sec, ns)
         |                                       ^~~~~~~~~~~~~~~~
   include/linux/export.h:155:34: note: in expansion of macro '__EXPORT_SYMBOL'
     155 | #define _EXPORT_SYMBOL(sym, sec) __EXPORT_SYMBOL(sym, sec, "")
         |                                  ^~~~~~~~~~~~~~~
   include/linux/export.h:158:29: note: in expansion of macro '_EXPORT_SYMBOL'
     158 | #define EXPORT_SYMBOL(sym)  _EXPORT_SYMBOL(sym, "")
         |                             ^~~~~~~~~~~~~~
   drivers/tty/sysrq.c:1218:1: note: in expansion of macro 'EXPORT_SYMBOL'
    1218 | EXPORT_SYMBOL(register_sysrq_key);
         | ^~~~~~~~~~~~~
>> include/linux/export.h:102:2: error: expected declaration specifiers before 'asm'
     102 |  asm(" .section \"__ksymtab_strings\",\"aMS\",%progbits,1 \n" \
         |  ^~~
   include/linux/export.h:147:39: note: in expansion of macro '___EXPORT_SYMBOL'
     147 | #define __EXPORT_SYMBOL(sym, sec, ns) ___EXPORT_SYMBOL(sym, sec, ns)
         |                                       ^~~~~~~~~~~~~~~~
   include/linux/export.h:155:34: note: in expansion of macro '__EXPORT_SYMBOL'
     155 | #define _EXPORT_SYMBOL(sym, sec) __EXPORT_SYMBOL(sym, sec, "")
         |                                  ^~~~~~~~~~~~~~~
   include/linux/export.h:158:29: note: in expansion of macro '_EXPORT_SYMBOL'
     158 | #define EXPORT_SYMBOL(sym)  _EXPORT_SYMBOL(sym, "")
         |                             ^~~~~~~~~~~~~~
   drivers/tty/sysrq.c:1218:1: note: in expansion of macro 'EXPORT_SYMBOL'
    1218 | EXPORT_SYMBOL(register_sysrq_key);
         | ^~~~~~~~~~~~~
   include/linux/export.h:67:36: error: storage class specified for parameter '__ksymtab_register_sysrq_key'
      67 |  static const struct kernel_symbol __ksymtab_##sym  \
         |                                    ^~~~~~~~~~
   include/linux/export.h:108:2: note: in expansion of macro '__KSYMTAB_ENTRY'
     108 |  __KSYMTAB_ENTRY(sym, sec)
         |  ^~~~~~~~~~~~~~~
   include/linux/export.h:147:39: note: in expansion of macro '___EXPORT_SYMBOL'
     147 | #define __EXPORT_SYMBOL(sym, sec, ns) ___EXPORT_SYMBOL(sym, sec, ns)
         |                                       ^~~~~~~~~~~~~~~~
   include/linux/export.h:155:34: note: in expansion of macro '__EXPORT_SYMBOL'
     155 | #define _EXPORT_SYMBOL(sym, sec) __EXPORT_SYMBOL(sym, sec, "")
         |                                  ^~~~~~~~~~~~~~~
   include/linux/export.h:158:29: note: in expansion of macro '_EXPORT_SYMBOL'
     158 | #define EXPORT_SYMBOL(sym)  _EXPORT_SYMBOL(sym, "")
         |                             ^~~~~~~~~~~~~~
   drivers/tty/sysrq.c:1218:1: note: in expansion of macro 'EXPORT_SYMBOL'
    1218 | EXPORT_SYMBOL(register_sysrq_key);
         | ^~~~~~~~~~~~~
>> include/linux/export.h:67:22: error: parameter '__ksymtab_register_sysrq_key' is initialized
      67 |  static const struct kernel_symbol __ksymtab_##sym  \
         |                      ^~~~~~~~~~~~~
   include/linux/export.h:108:2: note: in expansion of macro '__KSYMTAB_ENTRY'
     108 |  __KSYMTAB_ENTRY(sym, sec)
         |  ^~~~~~~~~~~~~~~
   include/linux/export.h:147:39: note: in expansion of macro '___EXPORT_SYMBOL'
     147 | #define __EXPORT_SYMBOL(sym, sec, ns) ___EXPORT_SYMBOL(sym, sec, ns)
         |                                       ^~~~~~~~~~~~~~~~
   include/linux/export.h:155:34: note: in expansion of macro '__EXPORT_SYMBOL'
     155 | #define _EXPORT_SYMBOL(sym, sec) __EXPORT_SYMBOL(sym, sec, "")
         |                                  ^~~~~~~~~~~~~~~
   include/linux/export.h:158:29: note: in expansion of macro '_EXPORT_SYMBOL'
     158 | #define EXPORT_SYMBOL(sym)  _EXPORT_SYMBOL(sym, "")
         |                             ^~~~~~~~~~~~~~
   drivers/tty/sysrq.c:1218:1: note: in expansion of macro 'EXPORT_SYMBOL'
    1218 | EXPORT_SYMBOL(register_sysrq_key);
         | ^~~~~~~~~~~~~
>> include/linux/export.h:67:36: error: section attribute not allowed for '__ksymtab_register_sysrq_key'
      67 |  static const struct kernel_symbol __ksymtab_##sym  \
         |                                    ^~~~~~~~~~
   include/linux/export.h:108:2: note: in expansion of macro '__KSYMTAB_ENTRY'
     108 |  __KSYMTAB_ENTRY(sym, sec)
         |  ^~~~~~~~~~~~~~~
   include/linux/export.h:147:39: note: in expansion of macro '___EXPORT_SYMBOL'
     147 | #define __EXPORT_SYMBOL(sym, sec, ns) ___EXPORT_SYMBOL(sym, sec, ns)
         |                                       ^~~~~~~~~~~~~~~~
   include/linux/export.h:155:34: note: in expansion of macro '__EXPORT_SYMBOL'
     155 | #define _EXPORT_SYMBOL(sym, sec) __EXPORT_SYMBOL(sym, sec, "")
         |                                  ^~~~~~~~~~~~~~~
   include/linux/export.h:158:29: note: in expansion of macro '_EXPORT_SYMBOL'
     158 | #define EXPORT_SYMBOL(sym)  _EXPORT_SYMBOL(sym, "")
         |                             ^~~~~~~~~~~~~~
   drivers/tty/sysrq.c:1218:1: note: in expansion of macro 'EXPORT_SYMBOL'
    1218 | EXPORT_SYMBOL(register_sysrq_key);
         | ^~~~~~~~~~~~~
>> include/linux/export.h:67:22: warning: 'used' attribute ignored [-Wattributes]
      67 |  static const struct kernel_symbol __ksymtab_##sym  \
         |                      ^~~~~~~~~~~~~
   include/linux/export.h:108:2: note: in expansion of macro '__KSYMTAB_ENTRY'
     108 |  __KSYMTAB_ENTRY(sym, sec)
         |  ^~~~~~~~~~~~~~~
   include/linux/export.h:147:39: note: in expansion of macro '___EXPORT_SYMBOL'
     147 | #define __EXPORT_SYMBOL(sym, sec, ns) ___EXPORT_SYMBOL(sym, sec, ns)
         |                                       ^~~~~~~~~~~~~~~~
   include/linux/export.h:155:34: note: in expansion of macro '__EXPORT_SYMBOL'
     155 | #define _EXPORT_SYMBOL(sym, sec) __EXPORT_SYMBOL(sym, sec, "")
         |                                  ^~~~~~~~~~~~~~~
   include/linux/export.h:158:29: note: in expansion of macro '_EXPORT_SYMBOL'
     158 | #define EXPORT_SYMBOL(sym)  _EXPORT_SYMBOL(sym, "")
         |                             ^~~~~~~~~~~~~~
   drivers/tty/sysrq.c:1218:1: note: in expansion of macro 'EXPORT_SYMBOL'
    1218 | EXPORT_SYMBOL(register_sysrq_key);
         | ^~~~~~~~~~~~~
>> include/linux/export.h:67:36: error: alignment may not be specified for '__ksymtab_register_sysrq_key'
      67 |  static const struct kernel_symbol __ksymtab_##sym  \
         |                                    ^~~~~~~~~~
   include/linux/export.h:108:2: note: in expansion of macro '__KSYMTAB_ENTRY'
     108 |  __KSYMTAB_ENTRY(sym, sec)
         |  ^~~~~~~~~~~~~~~
   include/linux/export.h:147:39: note: in expansion of macro '___EXPORT_SYMBOL'
     147 | #define __EXPORT_SYMBOL(sym, sec, ns) ___EXPORT_SYMBOL(sym, sec, ns)
         |                                       ^~~~~~~~~~~~~~~~
   include/linux/export.h:155:34: note: in expansion of macro '__EXPORT_SYMBOL'
     155 | #define _EXPORT_SYMBOL(sym, sec) __EXPORT_SYMBOL(sym, sec, "")
         |                                  ^~~~~~~~~~~~~~~
   include/linux/export.h:158:29: note: in expansion of macro '_EXPORT_SYMBOL'
     158 | #define EXPORT_SYMBOL(sym)  _EXPORT_SYMBOL(sym, "")
         |                             ^~~~~~~~~~~~~~
   drivers/tty/sysrq.c:1218:1: note: in expansion of macro 'EXPORT_SYMBOL'
    1218 | EXPORT_SYMBOL(register_sysrq_key);
         | ^~~~~~~~~~~~~
   drivers/tty/sysrq.c:1221:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    1221 | {
         | ^
   In file included from include/linux/linkage.h:7,
                    from include/linux/kernel.h:8,
                    from include/linux/list.h:9,
                    from include/linux/rculist.h:10,
                    from include/linux/sched/signal.h:5,
                    from drivers/tty/sysrq.c:18:
   drivers/tty/sysrq.c:1224:15: error: storage class specified for parameter 'unregister_sysrq_key'
    1224 | EXPORT_SYMBOL(unregister_sysrq_key);
         |               ^~~~~~~~~~~~~~~~~~~~
   include/linux/export.h:98:21: note: in definition of macro '___EXPORT_SYMBOL'
      98 |  extern typeof(sym) sym;       \
         |                     ^~~
   include/linux/export.h:155:34: note: in expansion of macro '__EXPORT_SYMBOL'
     155 | #define _EXPORT_SYMBOL(sym, sec) __EXPORT_SYMBOL(sym, sec, "")
         |                                  ^~~~~~~~~~~~~~~
   include/linux/export.h:158:29: note: in expansion of macro '_EXPORT_SYMBOL'
     158 | #define EXPORT_SYMBOL(sym)  _EXPORT_SYMBOL(sym, "")
         |                             ^~~~~~~~~~~~~~
   drivers/tty/sysrq.c:1224:1: note: in expansion of macro 'EXPORT_SYMBOL'
    1224 | EXPORT_SYMBOL(unregister_sysrq_key);
         | ^~~~~~~~~~~~~
   include/linux/export.h:99:20: error: storage class specified for parameter '__kstrtab_unregister_sysrq_key'
      99 |  extern const char __kstrtab_##sym[];     \
         |                    ^~~~~~~~~~
   include/linux/export.h:147:39: note: in expansion of macro '___EXPORT_SYMBOL'
     147 | #define __EXPORT_SYMBOL(sym, sec, ns) ___EXPORT_SYMBOL(sym, sec, ns)
         |                                       ^~~~~~~~~~~~~~~~
   include/linux/export.h:155:34: note: in expansion of macro '__EXPORT_SYMBOL'
     155 | #define _EXPORT_SYMBOL(sym, sec) __EXPORT_SYMBOL(sym, sec, "")
         |                                  ^~~~~~~~~~~~~~~
   include/linux/export.h:158:29: note: in expansion of macro '_EXPORT_SYMBOL'
     158 | #define EXPORT_SYMBOL(sym)  _EXPORT_SYMBOL(sym, "")
         |                             ^~~~~~~~~~~~~~
   drivers/tty/sysrq.c:1224:1: note: in expansion of macro 'EXPORT_SYMBOL'
    1224 | EXPORT_SYMBOL(unregister_sysrq_key);
         | ^~~~~~~~~~~~~
   include/linux/export.h:100:20: error: storage class specified for parameter '__kstrtabns_unregister_sysrq_key'
     100 |  extern const char __kstrtabns_##sym[];     \
         |                    ^~~~~~~~~~~~
   include/linux/export.h:147:39: note: in expansion of macro '___EXPORT_SYMBOL'
     147 | #define __EXPORT_SYMBOL(sym, sec, ns) ___EXPORT_SYMBOL(sym, sec, ns)
         |                                       ^~~~~~~~~~~~~~~~
   include/linux/export.h:155:34: note: in expansion of macro '__EXPORT_SYMBOL'
     155 | #define _EXPORT_SYMBOL(sym, sec) __EXPORT_SYMBOL(sym, sec, "")
         |                                  ^~~~~~~~~~~~~~~
   include/linux/export.h:158:29: note: in expansion of macro '_EXPORT_SYMBOL'
     158 | #define EXPORT_SYMBOL(sym)  _EXPORT_SYMBOL(sym, "")
         |                             ^~~~~~~~~~~~~~
   drivers/tty/sysrq.c:1224:1: note: in expansion of macro 'EXPORT_SYMBOL'
    1224 | EXPORT_SYMBOL(unregister_sysrq_key);
         | ^~~~~~~~~~~~~
   include/linux/export.h:101:24: error: expected declaration specifiers before ';' token
     101 |  __CRC_SYMBOL(sym, sec);       \
         |                        ^
   include/linux/export.h:147:39: note: in expansion of macro '___EXPORT_SYMBOL'
     147 | #define __EXPORT_SYMBOL(sym, sec, ns) ___EXPORT_SYMBOL(sym, sec, ns)
         |                                       ^~~~~~~~~~~~~~~~
   include/linux/export.h:155:34: note: in expansion of macro '__EXPORT_SYMBOL'
     155 | #define _EXPORT_SYMBOL(sym, sec) __EXPORT_SYMBOL(sym, sec, "")
         |                                  ^~~~~~~~~~~~~~~
   include/linux/export.h:158:29: note: in expansion of macro '_EXPORT_SYMBOL'
     158 | #define EXPORT_SYMBOL(sym)  _EXPORT_SYMBOL(sym, "")
         |                             ^~~~~~~~~~~~~~
   drivers/tty/sysrq.c:1224:1: note: in expansion of macro 'EXPORT_SYMBOL'
    1224 | EXPORT_SYMBOL(unregister_sysrq_key);
         | ^~~~~~~~~~~~~
   include/linux/export.h:102:2: error: expected declaration specifiers before 'asm'
     102 |  asm(" .section \"__ksymtab_strings\",\"aMS\",%progbits,1 \n" \
         |  ^~~
   include/linux/export.h:147:39: note: in expansion of macro '___EXPORT_SYMBOL'
     147 | #define __EXPORT_SYMBOL(sym, sec, ns) ___EXPORT_SYMBOL(sym, sec, ns)
         |                                       ^~~~~~~~~~~~~~~~
   include/linux/export.h:155:34: note: in expansion of macro '__EXPORT_SYMBOL'
     155 | #define _EXPORT_SYMBOL(sym, sec) __EXPORT_SYMBOL(sym, sec, "")
         |                                  ^~~~~~~~~~~~~~~
   include/linux/export.h:158:29: note: in expansion of macro '_EXPORT_SYMBOL'
     158 | #define EXPORT_SYMBOL(sym)  _EXPORT_SYMBOL(sym, "")
         |                             ^~~~~~~~~~~~~~
   drivers/tty/sysrq.c:1224:1: note: in expansion of macro 'EXPORT_SYMBOL'
    1224 | EXPORT_SYMBOL(unregister_sysrq_key);


vim +1159 drivers/tty/sysrq.c

  1158	
> 1159	{
  1160	}
  1161	
> 1162	static void sysrq_action_compound(int key)
  1163	static inline void sysrq_register_handler(void)
> 1164	{
  1165	}
  1166	
  1167	static inline void sysrq_unregister_handler(void)
  1168	{
  1169	}
  1170	
  1171	#endif /* CONFIG_INPUT */
  1172	
  1173	int sysrq_toggle_support(int enable_mask)
  1174	{
  1175		bool was_enabled = sysrq_on();
  1176	
  1177		sysrq_enabled = enable_mask;
  1178	
  1179		if (was_enabled != sysrq_on()) {
  1180			if (sysrq_on())
  1181				sysrq_register_handler();
  1182			else
  1183				sysrq_unregister_handler();
  1184		}
  1185	
  1186		return 0;
  1187	}
> 1188	EXPORT_SYMBOL_GPL(sysrq_toggle_support);
  1189	
  1190	static int __sysrq_swap_key_ops(int key, const struct sysrq_key_op *insert_op_p,
  1191	                                const struct sysrq_key_op *remove_op_p)
  1192	{
  1193		int retval;
  1194	
  1195		spin_lock(&sysrq_key_table_lock);
  1196		if (__sysrq_get_key_op(key) == remove_op_p) {
  1197			__sysrq_put_key_op(key, insert_op_p);
  1198			retval = 0;
  1199		} else {
  1200			retval = -1;
  1201		}
  1202		spin_unlock(&sysrq_key_table_lock);
  1203	
  1204		/*
  1205		 * A concurrent __handle_sysrq either got the old op or the new op.
  1206		 * Wait for it to go away before returning, so the code for an old
  1207		 * op is not freed (eg. on module unload) while it is in use.
  1208		 */
  1209		synchronize_rcu();
  1210	
  1211		return retval;
  1212	}
  1213	
  1214	int register_sysrq_key(int key, const struct sysrq_key_op *op_p)
  1215	{
  1216		return __sysrq_swap_key_ops(key, op_p, NULL);
  1217	}
> 1218	EXPORT_SYMBOL(register_sysrq_key);
  1219	
  1220	int unregister_sysrq_key(int key, const struct sysrq_key_op *op_p)
  1221	{
  1222		return __sysrq_swap_key_ops(key, NULL, op_p);
  1223	}
> 1224	EXPORT_SYMBOL(unregister_sysrq_key);
  1225	
  1226	#ifdef CONFIG_PROC_FS
  1227	/*
  1228	 * writing 'C' to /proc/sysrq-trigger is like sysrq-C
  1229	 */
  1230	static ssize_t write_sysrq_trigger(struct file *file, const char __user *buf,
  1231					   size_t count, loff_t *ppos)
  1232	{
  1233		if (count) {
  1234			char c;
  1235	
  1236			if (get_user(c, buf))
  1237				return -EFAULT;
  1238			__handle_sysrq(c, false);
  1239		}
  1240	
  1241		return count;
  1242	}
  1243	
> 1244	static const struct proc_ops sysrq_trigger_proc_ops = {
> 1245		.proc_write	= write_sysrq_trigger,
  1246		.proc_lseek	= noop_llseek,
  1247	};
  1248	
  1249	static void sysrq_init_procfs(void)
  1250	{
  1251		if (!proc_create("sysrq-trigger", S_IWUSR, NULL,
  1252				 &sysrq_trigger_proc_ops))
  1253			pr_err("Failed to register proc interface\n");
  1254	}
  1255	
  1256	#else
  1257	
  1258	static inline void sysrq_init_procfs(void)
  1259	{
  1260	}
  1261	
  1262	#endif /* CONFIG_PROC_FS */
  1263	
  1264	static int __init sysrq_init(void)
  1265	{
  1266		sysrq_init_procfs();
  1267	
  1268		if (sysrq_on())
  1269			sysrq_register_handler();
  1270	
  1271		return 0;
  1272	}
> 1273	device_initcall(sysrq_init);

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--YiEDa0DAkWCtVeE4
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
E8V+mnSEAAA=

--YiEDa0DAkWCtVeE4--
