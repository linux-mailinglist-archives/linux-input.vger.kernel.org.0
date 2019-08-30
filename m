Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 74195A31B4
	for <lists+linux-input@lfdr.de>; Fri, 30 Aug 2019 09:58:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727901AbfH3H6r (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 30 Aug 2019 03:58:47 -0400
Received: from Galois.linutronix.de ([193.142.43.55]:52404 "EHLO
        Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726943AbfH3H6r (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 30 Aug 2019 03:58:47 -0400
Received: from [5.158.153.55] (helo=nanos)
        by Galois.linutronix.de with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
        (Exim 4.80)
        (envelope-from <tglx@linutronix.de>)
        id 1i3bnr-0007Ec-6z; Fri, 30 Aug 2019 09:58:39 +0200
Date:   Fri, 30 Aug 2019 09:58:26 +0200 (CEST)
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
In-Reply-To: <20190830063326.GB2598@intel.com>
Message-ID: <alpine.DEB.2.21.1908300957450.1933@nanos.tec.linutronix.de>
References: <156699905611.5321.15444519862547054670.tip-bot2@tip-bot2> <201908292325.aLXyyzEx%lkp@intel.com> <20190829163353.GC2132@zn.tnic> <20190830010349.GD857@intel.com> <alpine.DEB.2.21.1908300802390.1938@nanos.tec.linutronix.de> <20190830062053.GA2598@intel.com>
 <20190830063326.GB2598@intel.com>
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

On Fri, 30 Aug 2019, Philip Li wrote:
> On Fri, Aug 30, 2019 at 02:20:53PM +0800, Philip Li wrote:
> > thanks for your patience. I just realize we actually block tip-bot, but
> > not tip-bot2. I will update the logic to avoid this issue, and we will
> > keep monitor for a while to fix new issue if any.
>
> BTW: the related service need some time to be upgraded after code change,
> some already fetched patches will continue sending out noisy mails until
> they are consumed. Sorry about this.

All good. I'll just redirect them to /dev/null.

Thanks,

	tglx
