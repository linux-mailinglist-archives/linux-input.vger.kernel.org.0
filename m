Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F57F1D2B0E
	for <lists+linux-input@lfdr.de>; Thu, 14 May 2020 11:13:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726159AbgENJNs (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 14 May 2020 05:13:48 -0400
Received: from mga11.intel.com ([192.55.52.93]:10343 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725878AbgENJNr (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 14 May 2020 05:13:47 -0400
IronPort-SDR: xxVv3EmrF+c3qZMXuxsraL6p0hxrLlmh9N8mxzfxwal+kB9mCsE0s5en6yxSbHP1iCgA95fvbM
 Mvj18Lvpn1gw==
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2020 02:07:45 -0700
IronPort-SDR: g4A2allxmnS86YOcfeDfSUlJV7JZSFVfQXLZno0Vy9WKSrYr8acqtFvj6Vn3tzXc3N3rSZIvHv
 +wPngxYT2Sbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,390,1583222400"; 
   d="gz'50?scan'50,208,50";a="464259207"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 14 May 2020 02:07:42 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1jZ9q9-00046P-QX; Thu, 14 May 2020 17:07:41 +0800
Date:   Thu, 14 May 2020 17:06:58 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org
Cc:     kbuild-all@lists.01.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>, andrzej.p@collabora.com,
        kernel@collabora.com
Subject: Re: [PATCH 5/6] tty/sysrq: Add configurable handler to signal a
 process
Message-ID: <202005141755.2qZ7upd6%lkp@intel.com>
References: <20200511135918.8203-6-andrzej.p@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="TB36FDmn/VVEgNH/"
Content-Disposition: inline
In-Reply-To: <20200511135918.8203-6-andrzej.p@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--TB36FDmn/VVEgNH/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Andrzej,

I love your patch! Yet something to improve:

[auto build test ERROR on 2ef96a5bb12be62ef75b5828c0aab838ebb29cb8]

url:    https://github.com/0day-ci/linux/commits/Andrzej-Pietrasiewicz/Magic-SysRq-extensions/20200514-151142
base:    2ef96a5bb12be62ef75b5828c0aab838ebb29cb8
config: alpha-defconfig (attached as .config)
compiler: alpha-linux-gcc (GCC) 9.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day GCC_VERSION=9.3.0 make.cross ARCH=alpha 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>

All errors (new ones prefixed by >>, old ones prefixed by <<):

drivers/tty/sysrq.c: In function 'sysrq_str_to_signal':
>> drivers/tty/sysrq.c:791:17: error: 'SIGSTKFLT' undeclared (first use in this function); did you mean 'SIGSTKSZ'?
791 |   {"SIGSTKFLT", SIGSTKFLT},
|                 ^~~~~~~~~
|                 SIGSTKSZ
drivers/tty/sysrq.c:791:17: note: each undeclared identifier is reported only once for each function it appears in

vim +791 drivers/tty/sysrq.c

   771	
   772	static void sysrq_str_to_signal(void)
   773	{
   774		static const struct signal_search signals[] = {
   775			{"SIGHUP", SIGHUP},
   776			{"SIGINT", SIGINT},
   777			{"SIGQUIT", SIGQUIT},
   778			{"SIGILL", SIGILL},
   779			{"SIGTRAP", SIGTRAP},
   780			{"SIGABRT", SIGABRT},
   781			{"SIGIOT", SIGIOT},
   782			{"SIGBUS", SIGBUS},
   783			{"SIGFPE", SIGFPE},
   784			{"SIGKILL", SIGKILL},
   785			{"SIGUSR1", SIGUSR1},
   786			{"SIGSEGV", SIGSEGV},
   787			{"SIGUSR2", SIGUSR2},
   788			{"SIGPIPE", SIGPIPE},
   789			{"SIGALRM", SIGALRM},
   790			{"SIGTERM", SIGTERM},
 > 791			{"SIGSTKFLT", SIGSTKFLT},
   792			{"SIGCHLD", SIGCHLD},
   793			{"SIGCONT", SIGCONT},
   794			{"SIGSTOP", SIGSTOP},
   795			{"SIGTSTP", SIGTSTP},
   796			{"SIGTTIN", SIGTTIN},
   797			{"SIGTTOU", SIGTTOU},
   798			{"SIGURG", SIGURG},
   799			{"SIGXCPU", SIGXCPU},
   800			{"SIGXFSZ", SIGXFSZ},
   801			{"SIGVTALRM", SIGVTALRM},
   802			{"SIGPROF", SIGPROF},
   803			{"SIGWINCH", SIGWINCH},
   804			{"SIGIO", SIGIO},
   805			{"SIGPOLL", SIGPOLL},
   806			{"SIGPWR", SIGPWR},
   807			{"SIGSYS", SIGSYS},
   808		};
   809		int i;
   810	
   811		if (!sysrq_signal)
   812			return;
   813	
   814		for (i = 0; i < ARRAY_SIZE(signals); ++i)
   815			if (!strcmp(signals[i].name, sysrq_signal))
   816				break;
   817	
   818		if (i >= ARRAY_SIZE(signals)) {
   819			pr_err("Unknown signal name %s", sysrq_signal);
   820	
   821			return;
   822		}
   823	
   824		sysrq_signal_code = signals[i].code;
   825	}
   826	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--TB36FDmn/VVEgNH/
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
3gAA

--TB36FDmn/VVEgNH/--
