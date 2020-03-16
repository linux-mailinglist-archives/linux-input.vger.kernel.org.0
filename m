Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3EBAD18700B
	for <lists+linux-input@lfdr.de>; Mon, 16 Mar 2020 17:30:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732120AbgCPQa5 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 16 Mar 2020 12:30:57 -0400
Received: from mga07.intel.com ([134.134.136.100]:65285 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732117AbgCPQa5 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 16 Mar 2020 12:30:57 -0400
IronPort-SDR: 8GQD02R94glzS/bQAla9icGEufN3G9uG6DgShr8ln5SIHfQwWH1L+dQhsFB5QMWTnMPHaTJys1
 koc2XIAGXmFw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2020 09:30:56 -0700
IronPort-SDR: ZLiRXGouKPIqFuMDKNpBKWDn6kucI07IlIK0atOKn3TqTsVeLh/3Ben6xe5TUD8Zf4Xk0Kf65x
 CfgmeFikdViQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,561,1574150400"; 
   d="scan'208";a="443402626"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga005.fm.intel.com with ESMTP; 16 Mar 2020 09:30:50 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jDsdi-00A76o-9x; Mon, 16 Mar 2020 18:30:54 +0200
Date:   Mon, 16 Mar 2020 18:30:54 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Oliver Graute <oliver.graute@gmail.com>
Cc:     linux-input@vger.kernel.org, dmitry.torokhov@gmail.com,
        rydberg@bitmath.org, m.felsch@pengutronix.de, robh@kernel.org,
        mylene.josserand@bootlin.com, p.zabel@pengutronix.de
Subject: Re: RFC: Input: edt-ft5x06 - FT6336G Touch Panel
Message-ID: <20200316163054.GV1922688@smile.fi.intel.com>
References: <20200305163649.GC10366@ripley>
 <20200316145736.GG16310@optiplex>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200316145736.GG16310@optiplex>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Mar 16, 2020 at 03:57:36PM +0100, Oliver Graute wrote:
> On 02/03/20, Oliver Graute wrote:
> > Hello,
> > 
> > I have on of these FT6336G Touch Panels here and I try to get it work
> > with the ft6236 driver. It comes up with model identification "0x11". So
> > I added that identification to the switch case in
> > edt_ft5x06_ts_identify(). But it crashes directly after the probe with a
> > corrupted stack. No clue why. Some ideas?
> 
> I still observe sometimes crashes with ft6236G. When it occurs it is
> always a stack corruption in the probe function on bootup.
> 
> No clue why stack is corrupted sometimes. Is this related to the buggy
> revision field?
> 
> Some further suggestions for debugging this?

Are you sure you have proper I²C bus settings on electrical level
(pull-up strength, line capacitance, etc.)?

> [    3.806780] edt_ft5x06 1-0038: Model "EP0110M09", Rev. "�", 0x0 sensors
> [    3.808468] at24 2-0050: 2-0050 supply vcc not found, using dummy regulator
> [    3.814864] DEBUG: edt_ft5x06_ts_probe 1201
> [    3.826215] DEBUG: edt_ft5x06_ts_probe 1211
> [    3.830512] DEBUG: edt_ft5x06_ts_probe 1214
> [    3.834904] input: EP0110M09 as /devices/platform/bus@5a000000/5a820000.i2c/i2c-1/1-0038/input/input0
> [    3.844164] at24 2-0050: 4096 byte 24c32 EEPROM, writable, 1 bytes/write
> [    3.844264] DEBUG: edt_ft5x06_ts_probe 1222
> [    3.850919] i2c i2c-2: LPI2C adapter registered
> [    3.855187] edt_ft5x06 1-0038: EDT FT5x06 initialized: IRQ 55, WAKE pin -1, Reset pin -1.

> [    3.867878] Kernel panic - not syncing: stack-protector: Kernel stack is corrupted in: edt_ft5x06_ts_probe+0x5c4/0xb00

Maybe you can look at the assembly to see how compiler puts variables on stack. Also enabling KASAN might help.

-- 
With Best Regards,
Andy Shevchenko


