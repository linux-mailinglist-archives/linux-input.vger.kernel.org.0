Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB61B3563B2
	for <lists+linux-input@lfdr.de>; Wed,  7 Apr 2021 08:05:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345349AbhDGGFq (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 7 Apr 2021 02:05:46 -0400
Received: from muru.com ([72.249.23.125]:51744 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237120AbhDGGFo (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 7 Apr 2021 02:05:44 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id D2BE880A4;
        Wed,  7 Apr 2021 06:06:42 +0000 (UTC)
Date:   Wed, 7 Apr 2021 09:05:30 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Paul Cercueil <paul@crapouillou.net>, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: gpio-keys - fix crash when disabliing GPIO-less
 buttons
Message-ID: <YG1Lqra86g3GekmG@atomide.com>
References: <YG1DFFgojSVfdpaz@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YG1DFFgojSVfdpaz@google.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

* Dmitry Torokhov <dmitry.torokhov@gmail.com> [210407 05:30]:
> My brain-damaged adjustments to Paul's patch caused crashes in
> gpio_keys_disable_button() when driver is used in GPIO-less (i.e.
> purely interrupt-driven) setups, because I mixed together debounce and
> release timers when they are in fact separate:
> 
> Unable to handle kernel NULL pointer dereference at virtual address 0000000c
> ...
> PC is at hrtimer_active+0xc/0x98
> LR is at hrtimer_try_to_cancel+0x24/0x140
> ...
> [<c01c43b8>] (hrtimer_active) from [<c01c50f4>] (hrtimer_try_to_cancel+0x24/0x140)
> [<c01c50f4>] (hrtimer_try_to_cancel) from [<c01c5224>] (hrtimer_cancel+0x14/0x4c)
> [<c01c5224>] (hrtimer_cancel) from [<bf1cae24>] (gpio_keys_attr_store_helper+0x1b8/0x1d8 [gpio_keys])
> [<bf1cae24>] (gpio_keys_attr_store_helper [gpio_keys]) from [<bf1cae80>] (gpio_keys_store_disabled_keys+0x18/0x24 [gpio_keys])
> [<bf1cae80>] (gpio_keys_store_disabled_keys [gpio_keys]) from [<c038ec7c>] (kernfs_fop_write_iter+0x10c/0x1cc)
> [<c038ec7c>] (kernfs_fop_write_iter) from [<c02df858>] (vfs_write+0x2ac/0x404)
> [<c02df858>] (vfs_write) from [<c02dfaf4>] (ksys_write+0x64/0xdc)
> [<c02dfaf4>] (ksys_write) from [<c0100080>] (ret_fast_syscall+0x0/0x58)
> 
> Let's fix it up.
> 
> Fixes: c9efb0ba281e ("Input: gpio-keys - use hrtimer for software debounce, if possible")
> Reported-by: Tony Lindgren <tony@atomide.com>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
> 
> Tony, could you please try this patch and see if it fixes the crash you
> observed?

Yes great, thanks this works for me:

Tested-by: Tony Lindgren <tony@atomide.com>
