Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3871434A2E
	for <lists+linux-input@lfdr.de>; Wed, 20 Oct 2021 13:37:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229864AbhJTLj4 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 20 Oct 2021 07:39:56 -0400
Received: from mga18.intel.com ([134.134.136.126]:59929 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230077AbhJTLjy (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 20 Oct 2021 07:39:54 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10142"; a="215679530"
X-IronPort-AV: E=Sophos;i="5.87,166,1631602800"; 
   d="scan'208";a="215679530"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2021 04:37:40 -0700
X-IronPort-AV: E=Sophos;i="5.87,166,1631602800"; 
   d="scan'208";a="662212910"
Received: from smile.fi.intel.com (HELO smile) ([10.237.72.159])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2021 04:37:38 -0700
Received: from andy by smile with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1md9uJ-000CU6-03;
        Wed, 20 Oct 2021 14:37:19 +0300
Date:   Wed, 20 Oct 2021 14:37:18 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     lianzhi chang <changlianzhi@uniontech.com>
Cc:     linux-kernel@vger.kernel.org, dmitry.torokhov@gmail.com,
        gregkh@linuxfoundation.org, jirislaby@kernel.org,
        linux-input@vger.kernel.org, 282827961@qq.com
Subject: Re: [[PATCH v4]] tty: Fix the keyboard led light display problem
Message-ID: <YW//boJZF3Nj5PmQ@smile.fi.intel.com>
References: <20211020074423.11932-1-changlianzhi@uniontech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211020074423.11932-1-changlianzhi@uniontech.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Oct 20, 2021 at 03:44:23PM +0800, lianzhi chang wrote:
> Switching from the desktop environment to the tty environment,
> the state of the keyboard led lights and the state of the keyboard
> lock are inconsistent. This is because the attribute kb->kbdmode
> of the tty bound in the desktop environment (xorg) is set to

Xorg

> VC_OFF, which causes the ledstate and kb->ledflagstate
> values of the bound tty to always be 0, which causes the switch
> from the desktop When to the tty environment, the LED light
> status is inconsistent with the keyboard lock status.

As per Dmitry's remark you need elaborate in the commit message why you can't
do as he suggested.

...

Accordingly to what I see the below has some trailing white spaces,
can you remove them?

> +static void kbd_update_ledstate(struct input_dev *dev)
> +{

> +	unsigned long leds = (unsigned long)ledstate;

Why casting?

> +	
> +	if (test_bit(EV_LED, dev->evbit)) {
> +		if (ledstate == -1U)

This is a bit weird, but I see that this should be changed in entire module.

> +			ledstate = 0;
> +		if (!!test_bit(LED_NUML, dev->led) != !!test_bit(VC_NUMLOCK, &leds))
> +			ledstate ^= BIT(VC_NUMLOCK);
> +		if (!!test_bit(LED_CAPSL, dev->led) != !!test_bit(VC_CAPSLOCK, &leds))
> +			ledstate ^= BIT(VC_CAPSLOCK);
> +		if (!!test_bit(LED_SCROLLL, dev->led) != !!test_bit(VC_SCROLLOCK, &leds))
> +			ledstate ^= BIT(VC_SCROLLOCK); 
> +	}
> +}

...

Can this...

>  	unsigned int leds;
>  	unsigned long flags;
> +	struct kbd_struct *kb = kbd_table + fg_console;
> +
> +	if (kb->kbdmode == VC_OFF)
> +		return;

...be written as

	struct kbd_struct *kb;
	unsigned int leds;
	unsigned long flags;

	kb = kbd_table + fg_console;
	if (kb->kbdmode == VC_OFF)
		return;

?

-- 
With Best Regards,
Andy Shevchenko


