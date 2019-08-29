Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E0DD9A20F4
	for <lists+linux-input@lfdr.de>; Thu, 29 Aug 2019 18:34:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727906AbfH2Qdz (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 29 Aug 2019 12:33:55 -0400
Received: from mx2.suse.de ([195.135.220.15]:54174 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726973AbfH2Qdz (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 29 Aug 2019 12:33:55 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 391E8AEE9;
        Thu, 29 Aug 2019 16:33:54 +0000 (UTC)
Date:   Thu, 29 Aug 2019 18:33:53 +0200
From:   Borislav Petkov <bp@suse.de>
To:     kbuild test robot <lkp@intel.com>
Cc:     tip-bot2 for Thomas Hellstrom <tip-bot2@linutronix.de>,
        kbuild-all@01.org, linux-tip-commits@vger.kernel.org,
        Thomas Hellstrom <thellstrom@vmware.com>,
        Doug Covelli <dcovelli@vmware.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>,
        linux-input@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
        VMware Graphics <linux-graphics-maintainer@vmware.com>,
        pv-drivers@vmware.com, x86-ml <x86@kernel.org>,
        Ingo Molnar <mingo@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [tip: x86/vmware] input/vmmouse: Update the backdoor call with
 support for new instructions
Message-ID: <20190829163353.GC2132@zn.tnic>
References: <156699905611.5321.15444519862547054670.tip-bot2@tip-bot2>
 <201908292325.aLXyyzEx%lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <201908292325.aLXyyzEx%lkp@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Aug 30, 2019 at 12:01:48AM +0800, kbuild test robot wrote:
> Hi tip-bot2,
> 
> Thank you for the patch! Yet something to improve:
> 
> [auto build test ERROR on linus/master]
> [cannot apply to v5.3-rc6 next-20190829]
> [if your patch is applied to the wrong git tree, please drop us a note to help improve the system]

Yes, it looks like it.

> url:    https://github.com/0day-ci/linux/commits/tip-bot2-for-Thomas-Hellstrom/input-vmmouse-Update-the-backdoor-call-with-support-for-new-instructions/20190829-205315

This patch is part of a series which are here:

https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git/log/?h=x86/vmware

so you need the patches before it.

I don't know what you guys are doing to track patches but if you really
wanna test trees, I'd suggest simply testing TIP's tip/master branch
which gets redone on a daily basis instead of testing patches in the
tip-bot{,2} notification mails.

Thx.

-- 
Regards/Gruss,
    Boris.

SUSE Software Solutions Germany GmbH, GF: Felix Imendörffer, HRB 247165, AG München
