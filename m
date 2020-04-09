Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C317D1A32BC
	for <lists+linux-input@lfdr.de>; Thu,  9 Apr 2020 12:45:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726574AbgDIKpB (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 9 Apr 2020 06:45:01 -0400
Received: from mga09.intel.com ([134.134.136.24]:42674 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726470AbgDIKpA (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 9 Apr 2020 06:45:00 -0400
IronPort-SDR: GYzRxidsLaNaxzMIpPnlq6OXB6XEEPzF2tH7+gXcQtfk3q1EGJeY39u3Cmafd2KPLjDJepe9Od
 ZRXUomo+tHkQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2020 03:45:00 -0700
IronPort-SDR: W1/gyE6PVURdliezYxKxsxCxdnBzyAxEWBbiAZyFp8ofkxH0uJ9OiU+FXvg4JLHNBG6fToTub9
 VsEl0KNMr3Gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,362,1580803200"; 
   d="scan'208";a="330817067"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga001.jf.intel.com with ESMTP; 09 Apr 2020 03:44:58 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jMUg9-00GvvN-35; Thu, 09 Apr 2020 13:45:01 +0300
Date:   Thu, 9 Apr 2020 13:45:01 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Oliver Graute <oliver.graute@gmail.com>
Cc:     dmitry.torokhov@gmail.com,
        Oliver Graute <oliver.graute@kococonnector.com>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sasha Levin <sashal@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] Input: edt-ft5x06 - fix crash on EDT EP0110M09
Message-ID: <20200409104501.GW3676135@smile.fi.intel.com>
References: <1586424425-27038-1-git-send-email-oliver.graute@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1586424425-27038-1-git-send-email-oliver.graute@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Apr 09, 2020 at 11:27:01AM +0200, Oliver Graute wrote:
> From: Oliver Graute <oliver.graute@kococonnector.com>
> 
> remove edt_ft5x06_ts_readwrite() call because this result in a stack
> corruption crash on EP011M09

And how it's supposed now to work on the rest of variants?

> [    2.968250] edt_ft5x06 1-0038: 1-0038 supply vcc not found, using dummy regulator
> [    2.991327] input: EP0110M09 as /devices/platform/bus@5a000000/5a820000.i2c/i2c-1/1-0038/input/input0
> [    3.011818] Kernel panic - not syncing: stack-protector: Kernel stack is corrupted in: edt_ft5x06_ts_probe+0x9e4/0xa98
> [    3.022519] CPU: 0 PID: 5 Comm: kworker/0:0 Not tainted 5.6.0-rc1-next-20200214+ #69
> [    3.030261] Hardware name: Advantech iMX8QM DMSSE20 (DT)
> [    3.035583] Workqueue: events deferred_probe_work_func
> [    3.040724] Call trace:
> [    3.043179]  dump_backtrace+0x0/0x1c0
> [    3.046839]  show_stack+0x14/0x20
> [    3.050161]  dump_stack+0xb4/0xfc
> [    3.053477]  panic+0x158/0x320
> [    3.056531]  print_tainted+0x0/0xa8
> [    3.060015]  edt_ft5x06_ts_probe+0x9e4/0xa98
> [    3.064286]  i2c_device_probe+0x2d0/0x2f8

No need to have below attached to the commit message. It's irrelevant.

> [    3.068299]  really_probe+0xd8/0x438
> [    3.071874]  driver_probe_device+0xdc/0x130
> [    3.076064]  __device_attach_driver+0x88/0x108

-- 
With Best Regards,
Andy Shevchenko


