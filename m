Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5C7FBA31CD
	for <lists+linux-input@lfdr.de>; Fri, 30 Aug 2019 10:06:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728289AbfH3IG6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 30 Aug 2019 04:06:58 -0400
Received: from mail.skyhub.de ([5.9.137.197]:42988 "EHLO mail.skyhub.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727850AbfH3IG6 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 30 Aug 2019 04:06:58 -0400
Received: from zn.tnic (p200300EC2F0AAA00D143FB30E0E334BB.dip0.t-ipconnect.de [IPv6:2003:ec:2f0a:aa00:d143:fb30:e0e3:34bb])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 1730D1EC08E5;
        Fri, 30 Aug 2019 10:06:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
        t=1567152416;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
        bh=qXLbeGuCB4Q7DKwqF4nt9wPYEUvkZL9LoEnennVSvS4=;
        b=qlDbJykMOgPx7lXzq2UWDmuqF6MhWEeP6Y3t3rFOnYgASqSDdn7vxp14p41LwcuuqtGJ1X
        5MXAOx1jhcSa4KSRabjnGQeMaiSyM0rqrSdcE8Bez/AUd0s5OvOmshnOQhkNvfd272S5ch
        zLj35RlTRCchYcsteoG7QV4qj1qNb80=
Date:   Fri, 30 Aug 2019 10:06:50 +0200
From:   Borislav Petkov <bp@alien8.de>
To:     Philip Li <philip.li@intel.com>
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
Message-ID: <20190830080650.GA30413@zn.tnic>
References: <156699905611.5321.15444519862547054670.tip-bot2@tip-bot2>
 <201908292325.aLXyyzEx%lkp@intel.com>
 <20190829163353.GC2132@zn.tnic>
 <20190830010349.GD857@intel.com>
 <alpine.DEB.2.21.1908300802390.1938@nanos.tec.linutronix.de>
 <20190830062053.GA2598@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190830062053.GA2598@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Aug 30, 2019 at 02:20:53PM +0800, Philip Li wrote:
> thanks for your patience. I just realize we actually block tip-bot, but
> not tip-bot2. I will update the logic to avoid this issue, and we will
> keep monitor for a while to fix new issue if any.

... and just to reiterate: it would be a *lot-lot* more useful if you
guys tested the single tip branches or the combined tip/master on a
daily basis as that is the x86 queue that goes to Linus eventually. That
is, if you do not test it already. But we don't get any "we tested this
branch" email so I'm thinking you don't...

Thx.

-- 
Regards/Gruss,
    Boris.

Good mailing practices for 400: avoid top-posting and trim the reply.
