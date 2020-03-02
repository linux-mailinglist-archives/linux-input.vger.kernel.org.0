Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 13F5F175DC3
	for <lists+linux-input@lfdr.de>; Mon,  2 Mar 2020 16:00:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727170AbgCBPAN (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 2 Mar 2020 10:00:13 -0500
Received: from mga09.intel.com ([134.134.136.24]:19105 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727113AbgCBPAN (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 2 Mar 2020 10:00:13 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 02 Mar 2020 07:00:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,507,1574150400"; 
   d="scan'208";a="412329745"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga005.jf.intel.com with ESMTP; 02 Mar 2020 07:00:10 -0800
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1j8mYF-006Hz7-Uu; Mon, 02 Mar 2020 17:00:11 +0200
Date:   Mon, 2 Mar 2020 17:00:11 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Oliver Graute <oliver.graute@gmail.com>
Cc:     linux-input@vger.kernel.org, dmitry.torokhov@gmail.com,
        rydberg@bitmath.org, m.felsch@pengutronix.de, robh@kernel.org,
        mylene.josserand@bootlin.com, p.zabel@pengutronix.de
Subject: Re: RFC: Input: edt-ft5x06 - FT6336G Touch Panel
Message-ID: <20200302150011.GC1224808@smile.fi.intel.com>
References: <20200302143035.GF16310@optiplex>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200302143035.GF16310@optiplex>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Mar 02, 2020 at 03:30:35PM +0100, Oliver Graute wrote:
> Hello,
> 
> I have on of these FT6336G Touch Panels here and I try to get it work
> with the ft6236 driver. It comes up with model identification "0x11". So
> I added that identification to the switch case in
> edt_ft5x06_ts_identify(). But it crashes directly after the probe with a
> corrupted stack. No clue why. Some ideas?

>  		 * the identification registers.
> +		case 0x11:   /* EDT EP0110M09 */

I have a question, how do you know it's M09 flavour?

> [    2.232596] i2c i2c-0: LPI2C adapter registered
> [    2.238931] edt_ft5x06 1-0038: probing for EDT FT5x06 I2C
> [    2.244369] edt_ft5x06 1-0038: 1-0038 supply vcc not found, using dummy regulator

> [    2.257639] edt_ft5x06 1-0038: Model "EP0110M09", Rev. "�", 0x0 sensors

...because clearly here something wrong with Revision field.

> [    2.264536] input: EP0110M09 as /devices/platform/bus@5a000000/5a820000.i2c/i2c-1/1-0038/input/input0
> [    2.273920] edt_ft5x06 1-0038: EDT FT5x06 initialized: IRQ 35, WAKE pin -1, Reset pin -1.
> [    2.282124] Kernel panic - not syncing: stack-protector: Kernel stack is corrupted in: edt_ft5x06_ts_probe+0x9d4/0xa88
> [    2.292830] CPU: 0 PID: 5 Comm: kworker/0:0 Not tainted 5.6.0-rc1-next-20200214-00051-g9874f196742d #69
> [    2.302224] Hardware name: Advantech iMX8QM DMSSE20 (DT)
> [    2.307544] Workqueue: events deferred_probe_work_func
> [    2.312686] Call trace:
> [    2.315141]  dump_backtrace+0x0/0x1c0
> [    2.318802]  show_stack+0x14/0x20
> [    2.322124]  dump_stack+0xb4/0xfc
> [    2.325440]  panic+0x158/0x320
> [    2.328494]  print_tainted+0x0/0xa8
> [    2.331978]  edt_ft5x06_ts_probe+0x9d4/0xa88

-- 
With Best Regards,
Andy Shevchenko


