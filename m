Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A534A42DA33
	for <lists+linux-input@lfdr.de>; Thu, 14 Oct 2021 15:21:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230434AbhJNNX6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 14 Oct 2021 09:23:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:59936 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230054AbhJNNX6 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 14 Oct 2021 09:23:58 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 498AD60EE5;
        Thu, 14 Oct 2021 13:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1634217713;
        bh=t3FaZ8xgpf16PMd+JevIiZLcGO4h4XG3aZfR3cIB58g=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=FcvociMXe0RUCKnL7vxxtTEZIYs+upjQIsAMJd8V2JLLgSGwu6scjcJUj+wWtzKpg
         MUjjpuopvhsDSZTfWijmTVcTnD0yGgLU6cSqnls1ynBLi6qnMFgBLZM8bah8DB26rS
         EWKzv2mS+f9PS6wifx5uX19gQ5D6pPlZcnZ27TDU=
Date:   Thu, 14 Oct 2021 15:21:51 +0200
From:   gregkh <gregkh@linuxfoundation.org>
To:     "changlianzhi@uniontech.com" <changlianzhi@uniontech.com>
Cc:     linux-kernel <linux-kernel@vger.kernel.org>,
        "dmitry.torokhov" <dmitry.torokhov@gmail.com>,
        jirislaby <jirislaby@kernel.org>,
        "andriy.shevchenko" <andriy.shevchenko@linux.intel.com>,
        linux-input <linux-input@vger.kernel.org>,
        282827961 <282827961@qq.com>
Subject: Re: [PATCH] input&tty: Fix the keyboard led light display problem
Message-ID: <YWgu71RP4ERZYjCy@kroah.com>
References: <20211014085308.9803-1-changlianzhi@uniontech.com>
 <616827d8.1c69fb81.75aa0.eea0SMTPIN_ADDED_BROKEN@mx.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <616827d8.1c69fb81.75aa0.eea0SMTPIN_ADDED_BROKEN@mx.google.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Oct 14, 2021 at 12:50:31PM +0800, changlianzhi@uniontech.com wrote:
> Subject: [PATCH] input&tty: Fix the keyboard led light display problem
> 
> 
> Switching from the desktop environment to the tty environment,
> 
> 
> 
> the state of the keyboard led lights and the state of the keyboard
> 
> 
> 
> lock are inconsistent. This is because the attribute kb->kbdmode
> 
> 
> 
> of the tty bound in the desktop environment (xorg) is set to
> 
> 
> 
> VC_OFF, which causes the ledstate and kb->ledflagstate
> 
> 
> 
> values of the bound tty to always be 0, which causes the switch
> 
> 
> 
> from the desktop When to the tty environment, the LED light
> 
> 
> 
> status is inconsistent with the keyboard lock status.
> 
> 
> 
>  
> 
> 
> 
> Signed-off-by: lianzhi chang <changlianzhi@uniontech.com>
> 
> 
> 
> ---
> 
> 
> 
> drivers/input/input.c     |  7 ++++++-
> 
> 
> 
> drivers/tty/vt/keyboard.c | 30 +++++++++++++++++++++++++++++-
> 
> 
> 
> include/linux/kbd_kern.h  |  2 ++
> 
> 
> 
> 3 files changed, 37 insertions(+), 2 deletions(-)
> 
> 
> 
>  
> 
> 
> 
> diff --git a/drivers/input/input.c b/drivers/input/input.c
> 
> 
> 
> index ccaeb2426385..43c09700bf68 100644
> 
> 
> 
> --- a/drivers/input/input.c
> 
> 
> 
> +++ b/drivers/input/input.c
> 
> 
> 
> @@ -25,6 +25,7 @@
> 
> 
> 
> #include <linux/rcupdate.h>
> 
> 
> 
> #include "input-compat.h"
> 
> 
> 
> #include "input-poller.h"
> 
> 
> 
> +#include <linux/kbd_kern.h>
> 
> 
> 
> MODULE_AUTHOR("Vojtech Pavlik <vojtech@suse.cz>");
> 
> 
> 
> MODULE_DESCRIPTION("Input core");
> 
> 
> 
> @@ -472,8 +473,12 @@ void input_inject_event(struct input_handle *handle,
> 
> 
> 
> rcu_read_lock();
> 
> 
> 
> grab = rcu_dereference(dev->grab);
> 
> 
> 
> - if (!grab || grab == handle)
> 
> 
> 
> + if (!grab || grab == handle) {
> 
> 
> 
> input_handle_event(dev, type, code, value);
> 
> 
> 
> +
> 
> 
> 
> + if (type == EV_LED && code < LED_SCROLLL)
> 
> 
> 
> + update_value_ledstate(code, value);
> 
> 
> 
> + }
> 
> 
> 
> rcu_read_unlock();
> 
> 
> 
> spin_unlock_irqrestore(&dev->event_lock, flags);
> 
> 
> 
> diff --git a/drivers/tty/vt/keyboard.c b/drivers/tty/vt/keyboard.c
> 
> 
> 
> index c7fbbcdcc346..0240915cdfef 100644
> 
> 
> 
> --- a/drivers/tty/vt/keyboard.c
> 
> 
> 
> +++ b/drivers/tty/vt/keyboard.c
> 
> 
> 
> @@ -1140,6 +1140,31 @@ static unsigned char getledstate(void)
> 
> 
> 
> return ledstate & 0xff;
> 
> 
> 
> }
> 
> 
> 
> +void update_value_ledstate(unsigned int flag, unsigned int value)
> 
> 
> 
> +{
> 
> 
> 
> + unsigned int bit;
> 
> 
> 
> +
> 
> 
> 
> + switch (flag) {
> 
> 
> 
> + case LED_NUML:
> 
> 
> 
> + bit = VC_NUMLOCK;
> 
> 
> 
> + break;
> 
> 
> 
> + case LED_CAPSL:
> 
> 
> 

<snip>

Something went very wrong with this patch submission :(

Please fix up your email client and try again, or just use 'git
send-email' directly, as that should be all that you need here.

thanks,

greg k-h
