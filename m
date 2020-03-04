Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EE45F178B20
	for <lists+linux-input@lfdr.de>; Wed,  4 Mar 2020 08:10:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725825AbgCDHKy (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 4 Mar 2020 02:10:54 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:43209 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725773AbgCDHKy (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 4 Mar 2020 02:10:54 -0500
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1j9OBB-0006qR-7F; Wed, 04 Mar 2020 08:10:53 +0100
Received: from mfe by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <mfe@pengutronix.de>)
        id 1j9OBA-0002FE-20; Wed, 04 Mar 2020 08:10:52 +0100
Date:   Wed, 4 Mar 2020 08:10:52 +0100
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     Oliver Graute <oliver.graute@gmail.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-input@vger.kernel.org, dmitry.torokhov@gmail.com,
        rydberg@bitmath.org, robh@kernel.org, mylene.josserand@bootlin.com,
        p.zabel@pengutronix.de
Subject: Re: RFC: Input: edt-ft5x06 - FT6336G Touch Panel
Message-ID: <20200304071051.gncrbpscelioxq3b@pengutronix.de>
References: <20200302143035.GF16310@optiplex>
 <20200302150011.GC1224808@smile.fi.intel.com>
 <20200302171539.GA10366@ripley>
 <20200302184356.bjjbmidj27se2kpe@pengutronix.de>
 <20200303193757.GB10366@ripley>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200303193757.GB10366@ripley>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 08:01:19 up 109 days, 22:19, 136 users,  load average: 0.48, 0.27,
 0.13
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-input@vger.kernel.org
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 20-03-03 20:37, Oliver Graute wrote:
> On 02/03/20, Marco Felsch wrote:
> > On 20-03-02 18:15, Oliver Graute wrote:
> > > On 02/03/20, Andy Shevchenko wrote:
> > > > On Mon, Mar 02, 2020 at 03:30:35PM +0100, Oliver Graute wrote:
> > > > > Hello,
> > > > > 
> > > > > I have on of these FT6336G Touch Panels here and I try to get it work
> > > > > with the ft6236 driver. It comes up with model identification "0x11". So
> > > > > I added that identification to the switch case in
> > > > > edt_ft5x06_ts_identify(). But it crashes directly after the probe with a
> > > > > corrupted stack. No clue why. Some ideas?
> > > > 
> > > > >  		 * the identification registers.
> > > > > +		case 0x11:   /* EDT EP0110M09 */
> > > > 
> > > > I have a question, how do you know it's M09 flavour?
> > > 
> > > This was an assumption after reading this thread on removing the old ft6236
> > > driver and looking what the old driver did. There they talk about M09. 
> > > 
> > > https://patchwork.kernel.org/patch/9264845/
> > > 
> > > How can I be sure that that is right?
> > > 
> > > > 
> > > > > [    2.232596] i2c i2c-0: LPI2C adapter registered
> > > > > [    2.238931] edt_ft5x06 1-0038: probing for EDT FT5x06 I2C
> > > > > [    2.244369] edt_ft5x06 1-0038: 1-0038 supply vcc not found, using dummy regulator
> > > > 
> > > > > [    2.257639] edt_ft5x06 1-0038: Model "EP0110M09", Rev. "�", 0x0 sensors
> > > > 
> > > > ...because clearly here something wrong with Revision field.
> > > 
> > > yes, this is suspicious.
> > >  
> > > > 
> > > > > [    2.264536] input: EP0110M09 as /devices/platform/bus@5a000000/5a820000.i2c/i2c-1/1-0038/input/input0
> > > > > [    2.273920] edt_ft5x06 1-0038: EDT FT5x06 initialized: IRQ 35, WAKE pin -1, Reset pin -1.
> > > > > [    2.282124] Kernel panic - not syncing: stack-protector: Kernel stack is corrupted in: edt_ft5x06_ts_probe+0x9d4/0xa88
> > > > > [    2.292830] CPU: 0 PID: 5 Comm: kworker/0:0 Not tainted 5.6.0-rc1-next-20200214-00051-g9874f196742d #69
> > > > > [    2.302224] Hardware name: Advantech iMX8QM DMSSE20 (DT)
> > > > > [    2.307544] Workqueue: events deferred_probe_work_func
> > > > > [    2.312686] Call trace:
> > > > > [    2.315141]  dump_backtrace+0x0/0x1c0
> > > > > [    2.318802]  show_stack+0x14/0x20
> > > > > [    2.322124]  dump_stack+0xb4/0xfc
> > > > > [    2.325440]  panic+0x158/0x320
> > > > > [    2.328494]  print_tainted+0x0/0xa8
> > > > > [    2.331978]  edt_ft5x06_ts_probe+0x9d4/0xa88
> > > 
> > > The crash is gone after applying Marcos patch from here:
> > > 
> > > https://www.spinics.net/lists/linux-input/msg65908.html
> > 
> > That shouldn't fix the problem..
> > 
> > > Now the driver is loaded, but can't read data with evtest.
> > 
> > Did you enable the CONFIG_INPUT_EVDEV option?
> 
> yes, it was already enabled. But now its working for me. I see events
> coming through during touching. My mistake was a wrong configured
> interrupt line. But I still have this suspicious revision field and I
> observe sometimes a different value there.

Did you saw those suspicious behaviour with the GENERIC_FT too?
Shouldn't make a real difference because the GENERIC_FT acts most the
time like the EDT_M09.

The problem is that display suppliers can flash their own firmware on
the touchcontroller and most the time we don't know the firmware
behaviour. Can you give us some more information about the used display?

Regards,
  Marco

> Best Regards,
> 
> Oliver
> 

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
