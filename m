Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7814142EE6D
	for <lists+linux-input@lfdr.de>; Fri, 15 Oct 2021 12:07:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237818AbhJOKJc (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 15 Oct 2021 06:09:32 -0400
Received: from mga04.intel.com ([192.55.52.120]:29528 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237638AbhJOKJN (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 15 Oct 2021 06:09:13 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10137"; a="226661320"
X-IronPort-AV: E=Sophos;i="5.85,375,1624345200"; 
   d="scan'208";a="226661320"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2021 03:07:04 -0700
X-IronPort-AV: E=Sophos;i="5.85,375,1624345200"; 
   d="scan'208";a="442474635"
Received: from smile.fi.intel.com (HELO smile) ([10.237.72.159])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2021 03:07:02 -0700
Received: from andy by smile with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1mbMvA-000OuS-Cu;
        Fri, 15 Oct 2021 16:06:48 +0300
Date:   Fri, 15 Oct 2021 16:06:48 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     changlianzhi <changlianzhi@uniontech.com>
Cc:     linux-kernel@vger.kernel.org, dmitry.torokhov@gmail.com,
        gregkh@linuxfoundation.org, jirislaby@kernel.org,
        linux-input@vger.kernel.org, 282827961@qq.com
Subject: Re: [PATCH] input&tty: Fix the keyboard led light display problem
Message-ID: <YWl86Jlv8Qs5PzXW@smile.fi.intel.com>
References: <35696980-2a55-c5c1-3fa9-eadf251dcdde@uniontech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <35696980-2a55-c5c1-3fa9-eadf251dcdde@uniontech.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Oct 15, 2021 at 04:16:35PM +0800, changlianzhi wrote:
> Switching from the desktop environment to the tty environment,
> the state of the keyboard led lights and the state of the keyboard
> lock are inconsistent. This is because the attribute kb->kbdmode
> of the tty bound in the desktop environment (xorg) is set to
> VC_OFF, which causes the ledstate and kb->ledflagstate
> values of the bound tty to always be 0, which causes the switch
> from the desktop When to the tty environment, the LED light
> status is inconsistent with the keyboard lock status.

Have you even read what others tell you?!

If you continue this way, I think it will be guaranteed that your email
ends up in a ban list.

-- 
With Best Regards,
Andy Shevchenko


