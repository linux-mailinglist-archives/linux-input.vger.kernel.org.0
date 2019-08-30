Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E6480A3A39
	for <lists+linux-input@lfdr.de>; Fri, 30 Aug 2019 17:21:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727896AbfH3PVy (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 30 Aug 2019 11:21:54 -0400
Received: from mga05.intel.com ([192.55.52.43]:57755 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727135AbfH3PVy (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 30 Aug 2019 11:21:54 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 30 Aug 2019 08:21:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,447,1559545200"; 
   d="scan'208";a="186329765"
Received: from pl-dbox.sh.intel.com (HELO intel.com) ([10.239.13.128])
  by orsmga006.jf.intel.com with ESMTP; 30 Aug 2019 08:21:50 -0700
Date:   Fri, 30 Aug 2019 23:26:15 +0800
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
Message-ID: <20190830152615.GA13754@intel.com>
References: <201908292325.aLXyyzEx%lkp@intel.com>
 <20190829163353.GC2132@zn.tnic>
 <20190830010349.GD857@intel.com>
 <alpine.DEB.2.21.1908300802390.1938@nanos.tec.linutronix.de>
 <20190830062053.GA2598@intel.com>
 <20190830080650.GA30413@zn.tnic>
 <20190830143645.GA4784@intel.com>
 <20190830144628.GC30413@zn.tnic>
 <20190830150002.GA6931@intel.com>
 <20190830150653.GD30413@zn.tnic>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190830150653.GD30413@zn.tnic>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Aug 30, 2019 at 05:06:53PM +0200, Borislav Petkov wrote:
> On Fri, Aug 30, 2019 at 11:00:02PM +0800, Philip Li wrote:
> > Early on, there's requirement to blacklist a few branches, which is configured
> > as below
> > 	blacklist_branch: auto-.*|tmp-.*|base-.*|test.*|.*-for-linus
> 
> Looks about right.
> 
> > Except the blacklist branches, we will monitor all other branches.
> 
> Ok, good to know. Just as an optimization to your workflow, in case
> you're interested: the tip/master branch merges all tip branches so if
> you're trying to prioritize which branches to test first due to resource
> constraints, I'd go with tip/master first and then, when I have free
> cycles, I'd do the topic branches.
thanks a lot for the advice. Meanwhile, the internal logic merges branches
to test once to speed up, most of time, more branches will not increase the
build testing workload. Of course, for the non merged branches, we need
test individually, and we will take this information into consideration
to add to our TODO.

> 
> Just as an idea...
> 
> > We also support pull request to update the
> > configuration or email us to update. Refer to
> > https://github.com/intel/lkp-tests/blob/master/repo/linux/tip.
> 
> Ok, cool. I'll talk to tglx about it and might even send you a pull
> request.
> 
> Thx.
> 
> -- 
> Regards/Gruss,
>     Boris.
> 
> Good mailing practices for 400: avoid top-posting and trim the reply.
