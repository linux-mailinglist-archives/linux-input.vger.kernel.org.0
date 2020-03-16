Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 184091873C3
	for <lists+linux-input@lfdr.de>; Mon, 16 Mar 2020 21:02:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732497AbgCPUCA (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 16 Mar 2020 16:02:00 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:36735 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732436AbgCPUB7 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 16 Mar 2020 16:01:59 -0400
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.lab.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1jDvvy-0003N8-H8; Mon, 16 Mar 2020 21:01:58 +0100
Received: from mfe by dude02.lab.pengutronix.de with local (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1jDvvx-0004rE-CK; Mon, 16 Mar 2020 21:01:57 +0100
Date:   Mon, 16 Mar 2020 21:01:57 +0100
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Oliver Graute <oliver.graute@gmail.com>,
        linux-input@vger.kernel.org, dmitry.torokhov@gmail.com,
        rydberg@bitmath.org, robh@kernel.org, mylene.josserand@bootlin.com,
        p.zabel@pengutronix.de
Subject: Re: RFC: Input: edt-ft5x06 - FT6336G Touch Panel
Message-ID: <20200316200157.GA17716@pengutronix.de>
References: <20200305163649.GC10366@ripley>
 <20200316145736.GG16310@optiplex>
 <20200316163054.GV1922688@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200316163054.GV1922688@smile.fi.intel.com>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 21:00:42 up 24 days,  7:17, 51 users,  load average: 0.18, 0.18,
 0.18
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-input@vger.kernel.org
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 20-03-16 18:30, Andy Shevchenko wrote:
> On Mon, Mar 16, 2020 at 03:57:36PM +0100, Oliver Graute wrote:
> > On 02/03/20, Oliver Graute wrote:
> > > Hello,
> > > 
> > > I have on of these FT6336G Touch Panels here and I try to get it work
> > > with the ft6236 driver. It comes up with model identification "0x11". So
> > > I added that identification to the switch case in
> > > edt_ft5x06_ts_identify(). But it crashes directly after the probe with a
> > > corrupted stack. No clue why. Some ideas?
> > 
> > I still observe sometimes crashes with ft6236G. When it occurs it is
> > always a stack corruption in the probe function on bootup.
> > 
> > No clue why stack is corrupted sometimes. Is this related to the buggy
> > revision field?
> > 
> > Some further suggestions for debugging this?
> 
> Are you sure you have proper I²C bus settings on electrical level
> (pull-up strength, line capacitance, etc.)?
> 
> > [    3.806780] edt_ft5x06 1-0038: Model "EP0110M09", Rev. "�", 0x0 sensors
> > [    3.808468] at24 2-0050: 2-0050 supply vcc not found, using dummy regulator
> > [    3.814864] DEBUG: edt_ft5x06_ts_probe 1201
> > [    3.826215] DEBUG: edt_ft5x06_ts_probe 1211
> > [    3.830512] DEBUG: edt_ft5x06_ts_probe 1214
> > [    3.834904] input: EP0110M09 as /devices/platform/bus@5a000000/5a820000.i2c/i2c-1/1-0038/input/input0
> > [    3.844164] at24 2-0050: 4096 byte 24c32 EEPROM, writable, 1 bytes/write
> > [    3.844264] DEBUG: edt_ft5x06_ts_probe 1222
> > [    3.850919] i2c i2c-2: LPI2C adapter registered
> > [    3.855187] edt_ft5x06 1-0038: EDT FT5x06 initialized: IRQ 55, WAKE pin -1, Reset pin -1.
> 
> > [    3.867878] Kernel panic - not syncing: stack-protector: Kernel stack is corrupted in: edt_ft5x06_ts_probe+0x5c4/0xb00
> 
> Maybe you can look at the assembly to see how compiler puts variables on stack. Also enabling KASAN might help.

This would be the easiest way to debug such failures and since ARMv8
support it you just need to enable it =)

Regards,
  Marco

