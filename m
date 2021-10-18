Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 941E8431004
	for <lists+linux-input@lfdr.de>; Mon, 18 Oct 2021 07:57:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229735AbhJRF7T (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 18 Oct 2021 01:59:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:42938 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229533AbhJRF7T (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 18 Oct 2021 01:59:19 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 088BE60F59;
        Mon, 18 Oct 2021 05:57:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1634536628;
        bh=IhMtnbDqfgygGY4YMMBIa1mbNQ1ngzQqBJHZJTAju04=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=wrw97HNtcyDDr8TsCCYybeLnLcHtJCeujBEXXdqvV3KOAolKrvdMDXC0MQdHk2dtk
         gLUvCov1ljK7451XhPp8uIDWd6Uhwb/l0cjzgD8S7OGOl6bBZzd48oKjOcIbZX0x14
         ym/Ytc7lBd0GK5oZg5A1TrwLEOThd81Q2I+7VJWc=
Date:   Mon, 18 Oct 2021 07:57:00 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     changlianzhi <changlianzhi@uniontech.com>
Cc:     linux-kernel@vger.kernel.org, dmitry.torokhov@gmail.com,
        jirislaby@kernel.org, andriy.shevchenko@linux.intel.com,
        linux-input@vger.kernel.org, 282827961@qq.com
Subject: Re: [PATCH v2 10/18] input&tty: Fix the keyboard led light display
 problem
Message-ID: <YW0MrF2L6rPhC7/Q@kroah.com>
References: <616cd589.1c69fb81.e7b01.b706SMTPIN_ADDED_BROKEN@mx.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <616cd589.1c69fb81.e7b01.b706SMTPIN_ADDED_BROKEN@mx.google.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Oct 18, 2021 at 10:01:34AM +0800, changlianzhi wrote:
> Switching from the desktop environment to the tty environment,
> the state of the keyboard led lights and the state of the keyboard
> lock are inconsistent. This is because the attribute kb->kbdmode
> of the tty bound in the desktop environment (xorg) is set to
> VC_OFF, which causes the ledstate and kb->ledflagstate
> values of the bound tty to always be 0, which causes the switch
> from the desktop When to the tty environment, the LED light
> status is inconsistent with the keyboard lock status.
> 
> Signed-off-by: lianzhi chang <changlianzhi@uniontech.com>
> ---
> v2 10/18:
> (1) Move the definition of ledstate to the input module
> (/drivers/input/input.c),
> and set or get its value through the input_update_ledstate(Replace the
> update_value_ledstate function defined in the last patch, and optimize
> the code according to the proposal) and input_get_ledstate functions.
> (2) To update the ledstate reference in keyboard.c, you must first get
> the value through input_get_ledstate.
> (3)Some macro definitions have been added to input.c.
> 
> drivers/input/input.c | 46 ++++++++++++++++++++++++++++++++++++++-
> drivers/tty/vt/keyboard.c | 19 ++++++++++++++--
> include/linux/input.h | 3 +++
> 3 files changed, 65 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/input/input.c b/drivers/input/input.c
> index ccaeb2426385..8c0ef947ac34 100644
> --- a/drivers/input/input.c
> +++ b/drivers/input/input.c
> @@ -37,6 +37,11 @@ static DEFINE_IDA(input_ida);
> static LIST_HEAD(input_dev_list);
> static LIST_HEAD(input_handler_list);
> +#define VC_SCROLLOCK 0 /* scroll-lock mode */
> +#define VC_NUMLOCK 1 /* numeric lock mode */
> +#define VC_CAPSLOCK 2 /* capslock mode */
> +static unsigned int ledstate = -1U; /* undefined */
> +
> /*
> * input_mutex protects access to both input_dev_list and input_handler_list.
> * This also causes input_[un]register_device and input_[un]register_handler
> @@ -472,8 +477,12 @@ void input_inject_event(struct input_handle *handle,
> rcu_read_lock();
> grab = rcu_dereference(dev->grab);
> - if (!grab || grab == handle)
> + if (!grab || grab == handle) {
> input_handle_event(dev, type, code, value);
> +
> + if (type == EV_LED && code <= LED_SCROLLL)
> + input_update_ledstate(code, value);
> + }
> rcu_read_unlock();
> spin_unlock_irqrestore(&dev->event_lock, flags);
> @@ -481,6 +490,41 @@ void input_inject_event(struct input_handle *handle,
> }
> EXPORT_SYMBOL(input_inject_event);
> +void input_update_ledstate(unsigned int flag, unsigned int value)
> +{
> + unsigned int bit;
> +
> + switch (flag) {
> + case LED_NUML:

<snip>

Again, your email client corrupted the patch and made it so that it can
not be applied :(

Please just use git send-email.

thanks,

greg k-h
