Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AF9B8A5EB7
	for <lists+linux-input@lfdr.de>; Tue,  3 Sep 2019 03:02:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725973AbfICBCT (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 2 Sep 2019 21:02:19 -0400
Received: from mga09.intel.com ([134.134.136.24]:2801 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725955AbfICBCT (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 2 Sep 2019 21:02:19 -0400
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 02 Sep 2019 18:02:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,461,1559545200"; 
   d="scan'208";a="211821902"
Received: from pl-dbox.sh.intel.com (HELO intel.com) ([10.239.13.128])
  by fmsmga002.fm.intel.com with ESMTP; 02 Sep 2019 18:02:15 -0700
Date:   Tue, 3 Sep 2019 09:06:46 +0800
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
Message-ID: <20190903010646.GA21851@intel.com>
References: <alpine.DEB.2.21.1908300802390.1938@nanos.tec.linutronix.de>
 <20190830062053.GA2598@intel.com>
 <20190830080650.GA30413@zn.tnic>
 <20190830143645.GA4784@intel.com>
 <20190830144628.GC30413@zn.tnic>
 <20190830150002.GA6931@intel.com>
 <20190830150856.GB6931@intel.com>
 <20190830193557.GF30413@zn.tnic>
 <20190902011342.GA14687@intel.com>
 <20190902093651.GC9605@zn.tnic>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190902093651.GC9605@zn.tnic>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Sep 02, 2019 at 11:36:51AM +0200, Borislav Petkov wrote:
> On Mon, Sep 02, 2019 at 09:13:42AM +0800, Philip Li wrote:
> > Thanks Boris, it is applied, and will take effect soon.
> 
> Seems to has taken effect. I got the first build report.
thanks for the info, Boris, glad to know this.

> 
> Thx!
> 
> -- 
> Regards/Gruss,
>     Boris.
> 
> Good mailing practices for 400: avoid top-posting and trim the reply.
