Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 49D2C178338
	for <lists+linux-input@lfdr.de>; Tue,  3 Mar 2020 20:38:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730855AbgCCTiE (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 3 Mar 2020 14:38:04 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:41366 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730546AbgCCTiE (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 3 Mar 2020 14:38:04 -0500
Received: by mail-wr1-f65.google.com with SMTP id v4so5929629wrs.8
        for <linux-input@vger.kernel.org>; Tue, 03 Mar 2020 11:38:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=m5de54WnIQ8IOccH9uahYYTySI6lBChkx6xWksP5j0E=;
        b=F8bl4ObTM+Nc+ku+7QmqyqOibjWn83Lg/hX8RLEPpATam2/FWqHPowCLfpamK6Ocip
         4V453dVpp7THLtnduhiho6iOBTK7Wg48i1wL/Prsp5lKNidMygvMoOC+4MHaxYEJjFtS
         UWmTv04aGtR1uyhEGc+cYr5g9whw1IbhMdg0Tslc7i29T0GGM3x+QvXsdFPdHy9412gH
         dsTW3EXehV1Y4Tt89oicq31Q8Z4p10e8X/iowc3c/A+XiZFOQpjjVihz6ooQbRGDJgrX
         MSIlOjK7sLlvkrPrWA6QmTk1PxCEmqAeASZt0u5m+HKB0OsnR3Yu+SZzXm4j3CI0mR/D
         7bUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=m5de54WnIQ8IOccH9uahYYTySI6lBChkx6xWksP5j0E=;
        b=NzOj9Huu6uRA0xEPx2v6/DHXwqHDL6CDza+eMm/UFxS+e2vd8WjjlHv5ZGKxrMJNZA
         +TSDn/8fuo0bhtxcfBuwtAdgs59bEAh1r7w/omOmDkKy+6sNL1/fl0A92W0GSByu8wu/
         PboatpLDkImz6gKMAfgaG5HjMGE1lyCxI0mpQnQ5qh5wEL3fgRiN2hRtY89/RWurLZfh
         Z/wqmjMaOoz1Q9xUvt0k3MpOjLE21l1h0fjVX7PJanCeG3Gkj4I4t79nbdeW/yuIx+9C
         7OrqQ6mKcyLSb1zyCT4KUuyFAUQ2Z/NtIVscQbeE7LqqeKdO5fjztiCGik4+Q7qnNmUm
         DvBQ==
X-Gm-Message-State: ANhLgQ30HF6cClGl+v3hPmsSp9OxPBG0htZnzA4cN860tP+JuKE+ZGLh
        eWEFx+ytZsMPrewoQW4bkw0=
X-Google-Smtp-Source: ADFU+vsKPJZtD3BatRIFrfpsF+wwYE6SzpD0ZF9J/+2583tPuP+jHx8m1udlcr2CCLbCxfuEILSTmw==
X-Received: by 2002:adf:9521:: with SMTP id 30mr6749038wrs.349.1583264281854;
        Tue, 03 Mar 2020 11:38:01 -0800 (PST)
Received: from localhost (ip1f115f16.dynamic.kabel-deutschland.de. [31.17.95.22])
        by smtp.gmail.com with ESMTPSA id i8sm30295347wrq.10.2020.03.03.11.38.00
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 03 Mar 2020 11:38:00 -0800 (PST)
Date:   Tue, 3 Mar 2020 20:37:57 +0100
From:   Oliver Graute <oliver.graute@gmail.com>
To:     Marco Felsch <m.felsch@pengutronix.de>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-input@vger.kernel.org, dmitry.torokhov@gmail.com,
        rydberg@bitmath.org, robh@kernel.org, mylene.josserand@bootlin.com,
        p.zabel@pengutronix.de
Subject: Re: RFC: Input: edt-ft5x06 - FT6336G Touch Panel
Message-ID: <20200303193757.GB10366@ripley>
References: <20200302143035.GF16310@optiplex>
 <20200302150011.GC1224808@smile.fi.intel.com>
 <20200302171539.GA10366@ripley>
 <20200302184356.bjjbmidj27se2kpe@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200302184356.bjjbmidj27se2kpe@pengutronix.de>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 02/03/20, Marco Felsch wrote:
> On 20-03-02 18:15, Oliver Graute wrote:
> > On 02/03/20, Andy Shevchenko wrote:
> > > On Mon, Mar 02, 2020 at 03:30:35PM +0100, Oliver Graute wrote:
> > > > Hello,
> > > > 
> > > > I have on of these FT6336G Touch Panels here and I try to get it work
> > > > with the ft6236 driver. It comes up with model identification "0x11". So
> > > > I added that identification to the switch case in
> > > > edt_ft5x06_ts_identify(). But it crashes directly after the probe with a
> > > > corrupted stack. No clue why. Some ideas?
> > > 
> > > >  		 * the identification registers.
> > > > +		case 0x11:   /* EDT EP0110M09 */
> > > 
> > > I have a question, how do you know it's M09 flavour?
> > 
> > This was an assumption after reading this thread on removing the old ft6236
> > driver and looking what the old driver did. There they talk about M09. 
> > 
> > https://patchwork.kernel.org/patch/9264845/
> > 
> > How can I be sure that that is right?
> > 
> > > 
> > > > [    2.232596] i2c i2c-0: LPI2C adapter registered
> > > > [    2.238931] edt_ft5x06 1-0038: probing for EDT FT5x06 I2C
> > > > [    2.244369] edt_ft5x06 1-0038: 1-0038 supply vcc not found, using dummy regulator
> > > 
> > > > [    2.257639] edt_ft5x06 1-0038: Model "EP0110M09", Rev. "�", 0x0 sensors
> > > 
> > > ...because clearly here something wrong with Revision field.
> > 
> > yes, this is suspicious.
> >  
> > > 
> > > > [    2.264536] input: EP0110M09 as /devices/platform/bus@5a000000/5a820000.i2c/i2c-1/1-0038/input/input0
> > > > [    2.273920] edt_ft5x06 1-0038: EDT FT5x06 initialized: IRQ 35, WAKE pin -1, Reset pin -1.
> > > > [    2.282124] Kernel panic - not syncing: stack-protector: Kernel stack is corrupted in: edt_ft5x06_ts_probe+0x9d4/0xa88
> > > > [    2.292830] CPU: 0 PID: 5 Comm: kworker/0:0 Not tainted 5.6.0-rc1-next-20200214-00051-g9874f196742d #69
> > > > [    2.302224] Hardware name: Advantech iMX8QM DMSSE20 (DT)
> > > > [    2.307544] Workqueue: events deferred_probe_work_func
> > > > [    2.312686] Call trace:
> > > > [    2.315141]  dump_backtrace+0x0/0x1c0
> > > > [    2.318802]  show_stack+0x14/0x20
> > > > [    2.322124]  dump_stack+0xb4/0xfc
> > > > [    2.325440]  panic+0x158/0x320
> > > > [    2.328494]  print_tainted+0x0/0xa8
> > > > [    2.331978]  edt_ft5x06_ts_probe+0x9d4/0xa88
> > 
> > The crash is gone after applying Marcos patch from here:
> > 
> > https://www.spinics.net/lists/linux-input/msg65908.html
> 
> That shouldn't fix the problem..
> 
> > Now the driver is loaded, but can't read data with evtest.
> 
> Did you enable the CONFIG_INPUT_EVDEV option?

yes, it was already enabled. But now its working for me. I see events
coming through during touching. My mistake was a wrong configured
interrupt line. But I still have this suspicious revision field and I
observe sometimes a different value there.

Best Regards,

Oliver
