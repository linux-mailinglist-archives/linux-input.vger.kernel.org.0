Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F270F354EC3
	for <lists+linux-input@lfdr.de>; Tue,  6 Apr 2021 10:37:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235155AbhDFIhY (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 6 Apr 2021 04:37:24 -0400
Received: from muru.com ([72.249.23.125]:51394 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234953AbhDFIhY (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 6 Apr 2021 04:37:24 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 23EF180A4;
        Tue,  6 Apr 2021 08:38:23 +0000 (UTC)
Date:   Tue, 6 Apr 2021 11:37:07 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Paul Cercueil <paul@crapouillou.net>, od@zcrc.me,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] input: gpio-keys: Use hrtimer for software
 debounce, if possible
Message-ID: <YGwds97OjXIdZF3L@atomide.com>
References: <20210307222240.380583-1-paul@crapouillou.net>
 <20210307222240.380583-3-paul@crapouillou.net>
 <YFpe6EhydawiMjHB@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YFpe6EhydawiMjHB@google.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

* Dmitry Torokhov <dmitry.torokhov@gmail.com> [700101 02:00]:
> On Sun, Mar 07, 2021 at 10:22:40PM +0000, Paul Cercueil wrote:
> > We want to be able to report the input event as soon as the debounce
> > delay elapsed. However, the current code does not really ensure that,
> > as it uses the jiffies-based schedule_delayed_work() API. With a small
> > enough HZ value (HZ <= 100), this results in some input events being
> > lost, when a key is quickly pressed then released (on a human's time
> > scale).
> > 
> > Switching to hrtimers fixes this issue, and will work even on extremely
> > low HZ values (tested at HZ=24). This is however only possible if
> > reading the GPIO is possible without sleeping. If this condition is not
> > met, the previous approach of using a jiffies-based timer is taken.
> > 
> > Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> 
> Applied with minor edits to make more use of debounce_use_hrtimer flag.

While testing Linux next I noticed that this patch causes a null pointer
dereference at least when unbinding a gpio-keys instance, see below.

Regards,

Tony

8< -----------------
Unable to handle kernel NULL pointer dereference at virtual address 0000000c
...
PC is at hrtimer_active+0xc/0x98
LR is at hrtimer_try_to_cancel+0x24/0x140
...
[<c01c43b8>] (hrtimer_active) from [<c01c50f4>] (hrtimer_try_to_cancel+0x24/0x140)
[<c01c50f4>] (hrtimer_try_to_cancel) from [<c01c5224>] (hrtimer_cancel+0x14/0x4c)
[<c01c5224>] (hrtimer_cancel) from [<bf1cae24>] (gpio_keys_attr_store_helper+0x1b8/0x1d8 [gpio_keys])
[<bf1cae24>] (gpio_keys_attr_store_helper [gpio_keys]) from [<bf1cae80>] (gpio_keys_store_disabled_keys+0x18/0x24 [gpio_keys])
[<bf1cae80>] (gpio_keys_store_disabled_keys [gpio_keys]) from [<c038ec7c>] (kernfs_fop_write_iter+0x10c/0x1cc)
[<c038ec7c>] (kernfs_fop_write_iter) from [<c02df858>] (vfs_write+0x2ac/0x404)
[<c02df858>] (vfs_write) from [<c02dfaf4>] (ksys_write+0x64/0xdc)
[<c02dfaf4>] (ksys_write) from [<c0100080>] (ret_fast_syscall+0x0/0x58)

