Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6D02EA2FDD
	for <lists+linux-input@lfdr.de>; Fri, 30 Aug 2019 08:29:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726510AbfH3G3G (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 30 Aug 2019 02:29:06 -0400
Received: from mga02.intel.com ([134.134.136.20]:20770 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726144AbfH3G3G (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 30 Aug 2019 02:29:06 -0400
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 29 Aug 2019 23:29:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,446,1559545200"; 
   d="scan'208";a="381910899"
Received: from pl-dbox.sh.intel.com (HELO intel.com) ([10.239.13.128])
  by fmsmga006.fm.intel.com with ESMTP; 29 Aug 2019 23:29:01 -0700
Date:   Fri, 30 Aug 2019 14:33:26 +0800
From:   Philip Li <philip.li@intel.com>
To:     Thomas Gleixner <tglx@linutronix.de>
Cc:     Borislav Petkov <bp@suse.de>, kbuild test robot <lkp@intel.com>,
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
Message-ID: <20190830063326.GB2598@intel.com>
References: <156699905611.5321.15444519862547054670.tip-bot2@tip-bot2>
 <201908292325.aLXyyzEx%lkp@intel.com>
 <20190829163353.GC2132@zn.tnic>
 <20190830010349.GD857@intel.com>
 <alpine.DEB.2.21.1908300802390.1938@nanos.tec.linutronix.de>
 <20190830062053.GA2598@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190830062053.GA2598@intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Aug 30, 2019 at 02:20:53PM +0800, Philip Li wrote:
> On Fri, Aug 30, 2019 at 08:06:27AM +0200, Thomas Gleixner wrote:
> > Philip,
> > 
> > On Fri, 30 Aug 2019, Philip Li wrote:
> > 
> > > > wanna test trees, I'd suggest simply testing TIP's tip/master branch
> > > > which gets redone on a daily basis instead of testing patches in the
> > > > tip-bot{,2} notification mails.
> > >
> > > Thanks Boris for the input. Besides the repo monitoring, we also check the patches
> > > in mailing lists, and try to apply patch to a suitable base. Do you think we can
> > > skip the mailing list of tip-bot{,2}?
> > 
> > As I just explained in a reply to another random build failure caused by this.
> > 
> > tip-bot2 is a notification mechanism to let people know that a particular
> > patch has been merged into one of the tip tree branches. These mails are
> > also properly threaded most of the time and reply to the patch which was
> > sent to the mailing list.
> > 
> > So yes, randomly picking patches from tip-bot2 is not useful at all. The
> > mails contain the information to which tip branch the patch has been
> > applied, so the only useful information for your bot is to select the
> > branch which got the new patches and start testing on that one.
> thanks for your patience. I just realize we actually block tip-bot, but
> not tip-bot2. I will update the logic to avoid this issue, and we will
> keep monitor for a while to fix new issue if any.
BTW: the related service need some time to be upgraded after code change,
some already fetched patches will continue sending out noisy mails until
they are consumed. Sorry about this.

> 
> > 
> > Thanks,
> > 
> > 	tglx
