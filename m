Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C8CD0A2C00
	for <lists+linux-input@lfdr.de>; Fri, 30 Aug 2019 02:59:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727270AbfH3A72 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 29 Aug 2019 20:59:28 -0400
Received: from mga11.intel.com ([192.55.52.93]:14759 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726991AbfH3A72 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 29 Aug 2019 20:59:28 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 29 Aug 2019 17:59:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,445,1559545200"; 
   d="scan'208";a="188724488"
Received: from pl-dbox.sh.intel.com (HELO intel.com) ([10.239.13.128])
  by FMSMGA003.fm.intel.com with ESMTP; 29 Aug 2019 17:59:25 -0700
Date:   Fri, 30 Aug 2019 09:03:49 +0800
From:   Philip Li <philip.li@intel.com>
To:     Borislav Petkov <bp@suse.de>
Cc:     kbuild test robot <lkp@intel.com>, linux-input@vger.kernel.org,
        Thomas Hellstrom <thellstrom@vmware.com>,
        x86-ml <x86@kernel.org>, linux-tip-commits@vger.kernel.org,
        pv-drivers@vmware.com, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-kernel@vger.kernel.org,
        tip-bot2 for Thomas Hellstrom <tip-bot2@linutronix.de>,
        Doug Covelli <dcovelli@vmware.com>,
        Ingo Molnar <mingo@redhat.com>,
        VMware Graphics <linux-graphics-maintainer@vmware.com>,
        kbuild-all@01.org, "H. Peter Anvin" <hpa@zytor.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@kernel.org>
Subject: Re: [kbuild-all] [tip: x86/vmware] input/vmmouse: Update the
 backdoor call with support for new instructions
Message-ID: <20190830010349.GD857@intel.com>
References: <156699905611.5321.15444519862547054670.tip-bot2@tip-bot2>
 <201908292325.aLXyyzEx%lkp@intel.com>
 <20190829163353.GC2132@zn.tnic>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190829163353.GC2132@zn.tnic>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Aug 29, 2019 at 06:33:53PM +0200, Borislav Petkov wrote:
> On Fri, Aug 30, 2019 at 12:01:48AM +0800, kbuild test robot wrote:
> > Hi tip-bot2,
> > 
> > Thank you for the patch! Yet something to improve:
> > 
> > [auto build test ERROR on linus/master]
> > [cannot apply to v5.3-rc6 next-20190829]
> > [if your patch is applied to the wrong git tree, please drop us a note to help improve the system]
> 
> Yes, it looks like it.
> 
> > url:    https://github.com/0day-ci/linux/commits/tip-bot2-for-Thomas-Hellstrom/input-vmmouse-Update-the-backdoor-call-with-support-for-new-instructions/20190829-205315
> 
> This patch is part of a series which are here:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git/log/?h=x86/vmware
> 
> so you need the patches before it.
> 
> I don't know what you guys are doing to track patches but if you really
> wanna test trees, I'd suggest simply testing TIP's tip/master branch
> which gets redone on a daily basis instead of testing patches in the
> tip-bot{,2} notification mails.
Thanks Boris for the input. Besides the repo monitoring, we also check the patches
in mailing lists, and try to apply patch to a suitable base. Do you think we can
skip the mailing list of tip-bot{,2}?

> 
> Thx.
> 
> -- 
> Regards/Gruss,
>     Boris.
> 
> SUSE Software Solutions Germany GmbH, GF: Felix Imendörffer, HRB 247165, AG München
> _______________________________________________
> kbuild-all mailing list
> kbuild-all@lists.01.org
> https://lists.01.org/mailman/listinfo/kbuild-all
