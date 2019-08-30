Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4985FA3979
	for <lists+linux-input@lfdr.de>; Fri, 30 Aug 2019 16:46:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727729AbfH3Oqg (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 30 Aug 2019 10:46:36 -0400
Received: from mail.skyhub.de ([5.9.137.197]:47476 "EHLO mail.skyhub.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727135AbfH3Oqf (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 30 Aug 2019 10:46:35 -0400
Received: from zn.tnic (p200300EC2F0AAA0001D832AAA778AB1D.dip0.t-ipconnect.de [IPv6:2003:ec:2f0a:aa00:1d8:32aa:a778:ab1d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id A979C1EC0A9C;
        Fri, 30 Aug 2019 16:46:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
        t=1567176393;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
        bh=rdtR+kT6Ig9LDu74bo7+i5kSsEJ/cLZD4Yd90y7ZtoE=;
        b=B3OihVaxZ0kJ3pKQmocPmgmYPvh4ahKHToUvwHCmUdNOnzxeNBSWU3J0kySlCF2DfGmQIp
        Y9b2kw9YHE/rnT5jXtmwCKt91X25iyUdNs59AaiPNmSDPq0lw77WqolP6Z5uJycuzCjMbz
        TnRwV/nAJktuxx2sgRvGkOShvNwNZr4=
Date:   Fri, 30 Aug 2019 16:46:28 +0200
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
Message-ID: <20190830144628.GC30413@zn.tnic>
References: <156699905611.5321.15444519862547054670.tip-bot2@tip-bot2>
 <201908292325.aLXyyzEx%lkp@intel.com>
 <20190829163353.GC2132@zn.tnic>
 <20190830010349.GD857@intel.com>
 <alpine.DEB.2.21.1908300802390.1938@nanos.tec.linutronix.de>
 <20190830062053.GA2598@intel.com>
 <20190830080650.GA30413@zn.tnic>
 <20190830143645.GA4784@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190830143645.GA4784@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Aug 30, 2019 at 10:36:45PM +0800, Philip Li wrote:
> yes, we monitor the repo pub/scm/linux/kernel/git/tip/tip.git, and will
> send build status of head

... and what you call "head" is the "master" branch on that repo, right?
Just making sure you got that right.

> (like BUILD SUCCESS or REGRESSION), also provide bisect report of
> unique error for first bad commit.

Perfect!

Thx.

-- 
Regards/Gruss,
    Boris.

Good mailing practices for 400: avoid top-posting and trim the reply.
