Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA4C942D91A
	for <lists+linux-input@lfdr.de>; Thu, 14 Oct 2021 14:13:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230314AbhJNMP2 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 14 Oct 2021 08:15:28 -0400
Received: from mga02.intel.com ([134.134.136.20]:22209 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230268AbhJNMPZ (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 14 Oct 2021 08:15:25 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10136"; a="214825408"
X-IronPort-AV: E=Sophos;i="5.85,372,1624345200"; 
   d="scan'208";a="214825408"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2021 05:13:21 -0700
X-IronPort-AV: E=Sophos;i="5.85,372,1624345200"; 
   d="scan'208";a="461171559"
Received: from smile.fi.intel.com (HELO smile) ([10.237.72.159])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2021 05:13:14 -0700
Received: from andy by smile with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1mb2Pk-000CUu-Cu;
        Thu, 14 Oct 2021 18:13:00 +0300
Date:   Thu, 14 Oct 2021 18:13:00 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     lianzhi chang <changlianzhi@uniontech.com>
Cc:     linux-kernel@vger.kernel.org, dmitry.torokhov@gmail.com,
        gregkh@linuxfoundation.org, jirislaby@kernel.org,
        linux-input@vger.kernel.org, 282827961@qq.com
Subject: Re: [PATCH] input&tty: Fix the keyboard led light display problem
Message-ID: <YWhI/DzNjivU6jQ6@smile.fi.intel.com>
References: <20211014071627.23256-1-changlianzhi@uniontech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211014071627.23256-1-changlianzhi@uniontech.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Oct 14, 2021 at 03:16:27PM +0800, lianzhi chang wrote:
> Switching from the desktop environment to the tty environment,
> the state of the keyboard led lights and the state of the keyboard
> lock are inconsistent. This is because the attribute kb->kbdmode
> of the tty bound in the desktop environment (xorg) is set to
> VC_OFF, which causes the ledstate and kb->ledflagstate
> values of the bound tty to always be 0, which causes the switch
> from the desktop When to the tty environment, the LED light
> status is inconsistent with the keyboard lock status.

...

> +void update_value_ledstate(unsigned int flag, unsigned int value)
> +{
> +	unsigned int bit;

unsigned long bit;

(see below why)

> +	switch (flag) {
> +	case LED_NUML:
> +		bit = VC_NUMLOCK;
> +		break;
> +	case LED_CAPSL:
> +		bit = VC_CAPSLOCK;
> +		break;
> +	case LED_SCROLLL:
> +		bit = VC_SCROLLOCK;
> +		break;
> +	default:
> +		WARN_ON_ONCE(1);
> +		return;
> +	}

> +	if (value)
> +		ledstate |= BIT(bit);
> +	else
> +		ledstate &= ~BIT(BIT);

NIH assign_bit().

On top of that, what is BIT as parameter does in the else branch? Have you
compiled this?

> +}

...

>  	unsigned int leds;
>  	unsigned long flags;

> +	struct kbd_struct *kb = kbd_table + fg_console;

Reversed xmas tree order?

...

>  extern void setledstate(struct kbd_struct *kbd, unsigned int led);

>  

Not sure if wee need this blank line, since both functions are from the same
(functional) group.

> +extern void update_value_ledstate(int flag, int value);

-- 
With Best Regards,
Andy Shevchenko


