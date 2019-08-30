Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B9C4EA39A7
	for <lists+linux-input@lfdr.de>; Fri, 30 Aug 2019 16:55:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727850AbfH3Ozl (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 30 Aug 2019 10:55:41 -0400
Received: from mga06.intel.com ([134.134.136.31]:18314 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727791AbfH3Ozl (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 30 Aug 2019 10:55:41 -0400
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 30 Aug 2019 07:55:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,447,1559545200"; 
   d="scan'208";a="210946213"
Received: from pl-dbox.sh.intel.com (HELO intel.com) ([10.239.13.128])
  by fmsmga002.fm.intel.com with ESMTP; 30 Aug 2019 07:55:37 -0700
Date:   Fri, 30 Aug 2019 23:00:02 +0800
From:   Philip Li <philip.li@intel.com>
To:     Borislav Petkov <bp@alien8.de>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        kbuild test robot <lkp@intel.com>,
        linux-input@vger.kernel.org,
        Thomas Hellstrom <thellstrom@vmware.com>,
        x86-ml <x86@kernel.org>, linux-tip-commits@vger.kernel.org,
        pv-drivers@vmware.com, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-kernel@vger.kernel.org,
        tip-bot2 for Thomas Hellstrom <tip-bot2@linutronix.de>,
        Doug Covelli <dcovelli@vmware.com>,
        Ingo Molnar <mingo@redhat.com>,
        VMware Graphics <linux-graphics-maintainer@vmware.com>,
        kbuild-all@01.org, "H. Peter Anvin" <hpa@zytor.com>,
        Ingo Molnar <mingo@kernel.org>
Subject: Re: [kbuild-all] [tip: x86/vmware] input/vmmouse: Update the
 backdoor call with support for new instructions
Message-ID: <20190830150002.GA6931@intel.com>
References: <156699905611.5321.15444519862547054670.tip-bot2@tip-bot2>
 <201908292325.aLXyyzEx%lkp@intel.com>
 <20190829163353.GC2132@zn.tnic>
 <20190830010349.GD857@intel.com>
 <alpine.DEB.2.21.1908300802390.1938@nanos.tec.linutronix.de>
 <20190830062053.GA2598@intel.com>
 <20190830080650.GA30413@zn.tnic>
 <20190830143645.GA4784@intel.com>
 <20190830144628.GC30413@zn.tnic>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190830144628.GC30413@zn.tnic>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Aug 30, 2019 at 04:46:28PM +0200, Borislav Petkov wrote:
> On Fri, Aug 30, 2019 at 10:36:45PM +0800, Philip Li wrote:
> > yes, we monitor the repo pub/scm/linux/kernel/git/tip/tip.git, and will
> > send build status of head
> 
> ... and what you call "head" is the "master" branch on that repo, right?
Hi Boris, you are right. It is the head of monitored branch, here master branch is
one of the branches on this repo that we monitor.

Early on, there's requirement to blacklist a few branches, which is configured
as below
	blacklist_branch: auto-.*|tmp-.*|base-.*|test.*|.*-for-linus

Except the blacklist branches, we will monitor all other branches. We also
support pull request to update the configuration or email us to update.
Refer to https://github.com/intel/lkp-tests/blob/master/repo/linux/tip.

Thanks

> Just making sure you got that right.
> 
> > (like BUILD SUCCESS or REGRESSION), also provide bisect report of
> > unique error for first bad commit.
> 
> Perfect!
> 
> Thx.
> 
> -- 
> Regards/Gruss,
>     Boris.
> 
> Good mailing practices for 400: avoid top-posting and trim the reply.
