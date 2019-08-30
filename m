Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 38E80A2F61
	for <lists+linux-input@lfdr.de>; Fri, 30 Aug 2019 08:06:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727023AbfH3GGd (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 30 Aug 2019 02:06:33 -0400
Received: from Galois.linutronix.de ([193.142.43.55]:52250 "EHLO
        Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726920AbfH3GGd (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 30 Aug 2019 02:06:33 -0400
Received: from p5de0b6c5.dip0.t-ipconnect.de ([93.224.182.197] helo=nanos)
        by Galois.linutronix.de with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
        (Exim 4.80)
        (envelope-from <tglx@linutronix.de>)
        id 1i3a3I-00057o-9x; Fri, 30 Aug 2019 08:06:28 +0200
Date:   Fri, 30 Aug 2019 08:06:27 +0200 (CEST)
From:   Thomas Gleixner <tglx@linutronix.de>
To:     Philip Li <philip.li@intel.com>
cc:     Borislav Petkov <bp@suse.de>, kbuild test robot <lkp@intel.com>,
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
Subject: Re: [kbuild-all] [tip: x86/vmware] input/vmmouse: Update the backdoor
 call with support for new instructions
In-Reply-To: <20190830010349.GD857@intel.com>
Message-ID: <alpine.DEB.2.21.1908300802390.1938@nanos.tec.linutronix.de>
References: <156699905611.5321.15444519862547054670.tip-bot2@tip-bot2> <201908292325.aLXyyzEx%lkp@intel.com> <20190829163353.GC2132@zn.tnic> <20190830010349.GD857@intel.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Linutronix-Spam-Score: -1.0
X-Linutronix-Spam-Level: -
X-Linutronix-Spam-Status: No , -1.0 points, 5.0 required,  ALL_TRUSTED=-1,SHORTCIRCUIT=-0.0001
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Philip,

On Fri, 30 Aug 2019, Philip Li wrote:

> > wanna test trees, I'd suggest simply testing TIP's tip/master branch
> > which gets redone on a daily basis instead of testing patches in the
> > tip-bot{,2} notification mails.
>
> Thanks Boris for the input. Besides the repo monitoring, we also check the patches
> in mailing lists, and try to apply patch to a suitable base. Do you think we can
> skip the mailing list of tip-bot{,2}?

As I just explained in a reply to another random build failure caused by this.

tip-bot2 is a notification mechanism to let people know that a particular
patch has been merged into one of the tip tree branches. These mails are
also properly threaded most of the time and reply to the patch which was
sent to the mailing list.

So yes, randomly picking patches from tip-bot2 is not useful at all. The
mails contain the information to which tip branch the patch has been
applied, so the only useful information for your bot is to select the
branch which got the new patches and start testing on that one.

Thanks,

	tglx
