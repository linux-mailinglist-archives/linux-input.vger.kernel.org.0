Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5E63D1760D8
	for <lists+linux-input@lfdr.de>; Mon,  2 Mar 2020 18:15:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726451AbgCBRPq (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 2 Mar 2020 12:15:46 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:51598 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727209AbgCBRPq (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 2 Mar 2020 12:15:46 -0500
Received: by mail-wm1-f66.google.com with SMTP id a132so120882wme.1
        for <linux-input@vger.kernel.org>; Mon, 02 Mar 2020 09:15:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=KuzdLCmwVtA9MWshSBOmzvPD4Oll5urJoDZy7gAzjCM=;
        b=A7Tjc+sX+4HB5dluoMJ8cPFPHN8kaenVO3uEXpvn7ilNZFVX6B9Iy6aGppFbCAhIQU
         MLFqYcrlT1EylaDqhxqIR1z07TxWLGWlWj1XVgkvce1/PCUTESuBJn5LAeAPZH+aJe/C
         9aQ/Ye7Yn5FQZz0tb88ANotmHSbrD/dhru7DQWiB2pGFxnoxnurf8svD/5sha0dvv4Ht
         dBtumkMSk157OEvGOAtSgiFeM5tUPVwqawjcJ3csPB/Lca4XWoy/LUel8iTb5+F0gszy
         KM24DIs4vFg/7Yni4gQ7/mnYqOCPRgb9R9muTKhvpmNWBv5nQKSX2W/8OBkeazy0jKUL
         X1YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=KuzdLCmwVtA9MWshSBOmzvPD4Oll5urJoDZy7gAzjCM=;
        b=L2T84Vf83VbtW12sVfK4mVzvISIQ4TMd2KyYnLQdBrM8JOFBbiW1sqIJWk0ZHiayAo
         zP1fi9Ak6XpgP4nAtJCWcLJoc2986F8lMGQPkGmpSy1XO6TrVRm4Y5asREB1PgNXKvjv
         9PbFgJjpdHLZbVjtopN/5Z6ztLuztUUAaLKo3ON3rJzKoIiLcGp71MvbPiauuexooUI5
         AS/+PRrT6i1sMX+L6fDKgFiy+afcTIzq0zkkESQunX7iwVqYEg+uGMj9QJSzJVGw0hVz
         1CwB2UdOgZ2EYG83PbzDPZX7YaYOkB+He07QU6vqa+nqLzD2jNKJyyVryJLD/qCIauJj
         awtw==
X-Gm-Message-State: ANhLgQ09F9Y+7WKHPsnCjIXVad44oEDGxH3cEtgErVBcY3s2p30q5tC8
        xYlijSlnETFTmcY+9ckTwDs=
X-Google-Smtp-Source: ADFU+vtRzZRwMaWdlXjKs8AasCUB+/0iyHips+lAW1+LLvZy655xZ5RIBX8h70kkD250H3DS3AX4Hw==
X-Received: by 2002:a05:600c:22d3:: with SMTP id 19mr71885wmg.169.1583169343436;
        Mon, 02 Mar 2020 09:15:43 -0800 (PST)
Received: from localhost (ip1f115f16.dynamic.kabel-deutschland.de. [31.17.95.22])
        by smtp.gmail.com with ESMTPSA id a7sm80255wmj.12.2020.03.02.09.15.41
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 02 Mar 2020 09:15:42 -0800 (PST)
Date:   Mon, 2 Mar 2020 18:15:39 +0100
From:   Oliver Graute <oliver.graute@gmail.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-input@vger.kernel.org, dmitry.torokhov@gmail.com,
        rydberg@bitmath.org, m.felsch@pengutronix.de, robh@kernel.org,
        mylene.josserand@bootlin.com, p.zabel@pengutronix.de
Subject: Re: RFC: Input: edt-ft5x06 - FT6336G Touch Panel
Message-ID: <20200302171539.GA10366@ripley>
References: <20200302143035.GF16310@optiplex>
 <20200302150011.GC1224808@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200302150011.GC1224808@smile.fi.intel.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 02/03/20, Andy Shevchenko wrote:
> On Mon, Mar 02, 2020 at 03:30:35PM +0100, Oliver Graute wrote:
> > Hello,
> > 
> > I have on of these FT6336G Touch Panels here and I try to get it work
> > with the ft6236 driver. It comes up with model identification "0x11". So
> > I added that identification to the switch case in
> > edt_ft5x06_ts_identify(). But it crashes directly after the probe with a
> > corrupted stack. No clue why. Some ideas?
> 
> >  		 * the identification registers.
> > +		case 0x11:   /* EDT EP0110M09 */
> 
> I have a question, how do you know it's M09 flavour?

This was an assumption after reading this thread on removing the old ft6236
driver and looking what the old driver did. There they talk about M09. 

https://patchwork.kernel.org/patch/9264845/

How can I be sure that that is right?

> 
> > [    2.232596] i2c i2c-0: LPI2C adapter registered
> > [    2.238931] edt_ft5x06 1-0038: probing for EDT FT5x06 I2C
> > [    2.244369] edt_ft5x06 1-0038: 1-0038 supply vcc not found, using dummy regulator
> 
> > [    2.257639] edt_ft5x06 1-0038: Model "EP0110M09", Rev. "�", 0x0 sensors
> 
> ...because clearly here something wrong with Revision field.

yes, this is suspicious.
 
> 
> > [    2.264536] input: EP0110M09 as /devices/platform/bus@5a000000/5a820000.i2c/i2c-1/1-0038/input/input0
> > [    2.273920] edt_ft5x06 1-0038: EDT FT5x06 initialized: IRQ 35, WAKE pin -1, Reset pin -1.
> > [    2.282124] Kernel panic - not syncing: stack-protector: Kernel stack is corrupted in: edt_ft5x06_ts_probe+0x9d4/0xa88
> > [    2.292830] CPU: 0 PID: 5 Comm: kworker/0:0 Not tainted 5.6.0-rc1-next-20200214-00051-g9874f196742d #69
> > [    2.302224] Hardware name: Advantech iMX8QM DMSSE20 (DT)
> > [    2.307544] Workqueue: events deferred_probe_work_func
> > [    2.312686] Call trace:
> > [    2.315141]  dump_backtrace+0x0/0x1c0
> > [    2.318802]  show_stack+0x14/0x20
> > [    2.322124]  dump_stack+0xb4/0xfc
> > [    2.325440]  panic+0x158/0x320
> > [    2.328494]  print_tainted+0x0/0xa8
> > [    2.331978]  edt_ft5x06_ts_probe+0x9d4/0xa88

The crash is gone after applying Marcos patch from here:

https://www.spinics.net/lists/linux-input/msg65908.html

Now the driver is loaded, but can't read data with evtest.

Best regards,

Oliver
