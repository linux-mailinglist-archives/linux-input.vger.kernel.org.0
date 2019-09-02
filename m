Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 98352A52F4
	for <lists+linux-input@lfdr.de>; Mon,  2 Sep 2019 11:36:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731186AbfIBJgy (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 2 Sep 2019 05:36:54 -0400
Received: from mail.skyhub.de ([5.9.137.197]:34398 "EHLO mail.skyhub.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731184AbfIBJgy (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 2 Sep 2019 05:36:54 -0400
Received: from zn.tnic (p200300EC2F064300457D028AAFF6D0C1.dip0.t-ipconnect.de [IPv6:2003:ec:2f06:4300:457d:28a:aff6:d0c1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id A77E21EC06F3;
        Mon,  2 Sep 2019 11:36:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
        t=1567417012;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
        bh=uMMyoFANBQiUKkXtM+OKELpLztUx2WSmL1GhIv0sKAU=;
        b=PxjOk9O0dXU9E7bIKDD2ZEc8hbly/jAUZbTtsoHimpotQwXLizCKcd6cVmjf06OhCOxE77
        djGhJr720LyUela8JuoFpGaw56lj7C29LUqDO/k0KMvE3l0E0g7L4/G4jfMR4YnY16lqTo
        2aeSwLB8dHhL7pqEyOi9p+YwStKBi7I=
Date:   Mon, 2 Sep 2019 11:36:51 +0200
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
Message-ID: <20190902093651.GC9605@zn.tnic>
References: <20190830010349.GD857@intel.com>
 <alpine.DEB.2.21.1908300802390.1938@nanos.tec.linutronix.de>
 <20190830062053.GA2598@intel.com>
 <20190830080650.GA30413@zn.tnic>
 <20190830143645.GA4784@intel.com>
 <20190830144628.GC30413@zn.tnic>
 <20190830150002.GA6931@intel.com>
 <20190830150856.GB6931@intel.com>
 <20190830193557.GF30413@zn.tnic>
 <20190902011342.GA14687@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190902011342.GA14687@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Sep 02, 2019 at 09:13:42AM +0800, Philip Li wrote:
> Thanks Boris, it is applied, and will take effect soon.

Seems to has taken effect. I got the first build report.

Thx!

-- 
Regards/Gruss,
    Boris.

Good mailing practices for 400: avoid top-posting and trim the reply.
