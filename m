Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2FDA421D279
	for <lists+linux-input@lfdr.de>; Mon, 13 Jul 2020 11:06:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726991AbgGMJG5 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 13 Jul 2020 05:06:57 -0400
Received: from mga05.intel.com ([192.55.52.43]:65288 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726360AbgGMJG5 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 13 Jul 2020 05:06:57 -0400
IronPort-SDR: rdVohcU+3Q4J8OdjmcMcv+WtIWMDq/z+VRX1/DGDiEyD5OQLL28VgMb8zXYQYWSMHzy/0CfB3Y
 lOza0Ld0/8LA==
X-IronPort-AV: E=McAfee;i="6000,8403,9680"; a="233437816"
X-IronPort-AV: E=Sophos;i="5.75,347,1589266800"; 
   d="scan'208";a="233437816"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2020 02:06:56 -0700
IronPort-SDR: KngRHk5ve9Vleg4jLe3Lwqo7pjZZCYApD84txpQLS2Jy5hTjkz8pq0XWZz58RlwQEqB80dCovP
 +52ySHD/mByQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,347,1589266800"; 
   d="scan'208";a="316001867"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga008.jf.intel.com with ESMTP; 13 Jul 2020 02:06:53 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1juuQH-001ZDR-KF; Mon, 13 Jul 2020 12:06:53 +0300
Date:   Mon, 13 Jul 2020 12:06:53 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Wei Shuai <cpuwolf@gmail.com>
Cc:     "open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)..." 
        <linux-input@vger.kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jeffrey Hugo <jhugo@codeaurora.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Borislav Petkov <bp@suse.de>, Mattias Jacobsson <2pi@mok.nu>,
        Mark Gross <mgross@linux.intel.com>,
        Russell King <rmk+kernel@armlinux.org.uk>,
        Erwan Velu <e.velu@criteo.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] Input: break joystick limitation of maximum 80 buttons
Message-ID: <20200713090653.GB3703480@smile.fi.intel.com>
References: <cpuwolf@gmail.com>
 <20200710065112.18286-1-cpuwolf@gmail.com>
 <CACa7zykn0q9XJAUvrqnNATr4DUv3Kc7XujF3vm6sfRB5pE6YNQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACa7zykn0q9XJAUvrqnNATr4DUv3Kc7XujF3vm6sfRB5pE6YNQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, Jul 12, 2020 at 07:54:54AM +0800, Wei Shuai wrote:
> The joystick max buttons 80 limitation comes from
> 
> #define BTN_JOYSTICK 0x120
> #define BTN_DEAD 0x12f
> #define BTN_TRIGGER_HAPPY 0x2c0
> #define KEY_MAX 0x2ff
> 
> include/uapi/linux/input-event-codes.h
> 
> according to function hidinput_configure_usage() in file drivers/hid/hid-input.c
> 
> the joystick button mapping is not a continues space
> generally speaking, the mapping space is from
> 
> 1. BTN_JOYSTICK~BTN_DEAD
> 2. BTN_TRIGGER_HAPPY~KEY_MAX
> 
> Finally, I got the max limitation is 80.
> The patch is expanding KEY_MAX from 0x2ff to 4ff
> and the change has been verified on 104 button USB HID device on Ubuntu


If you send and resend this patch too often, nobody will take you seriously.
Also, you have to provide versioning and changelog in each submission.
Besides that, above doesn't answer to question "why?". Why are you doing this
at all? What the problem?


-- 
With Best Regards,
Andy Shevchenko


