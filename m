Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8244B186F1D
	for <lists+linux-input@lfdr.de>; Mon, 16 Mar 2020 16:50:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732006AbgCPPuH (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 16 Mar 2020 11:50:07 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:50881 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731914AbgCPPuH (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 16 Mar 2020 11:50:07 -0400
Received: by mail-wm1-f67.google.com with SMTP id z13so2183669wml.0
        for <linux-input@vger.kernel.org>; Mon, 16 Mar 2020 08:50:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to:user-agent;
        bh=d0akBS3AITwMDU7SONjbQ/qr1ZJ+AwWFSGeNQBEysbM=;
        b=tEt/Qnh6hdhCZ1hFLvP9D67gQqLmRflCL7i3zrknDkPdAJvnBysAdUOvkHGxumOzvA
         Rv6XVcrVPQq1X1Cme8LqKz/uNDDhRb6NVzh7bi18tiznSzFBj9Ch/4OoWm2FDs6zXXd1
         BtjYdomH4HBnJBc3gHwR87mR+NBLCaKrutP3awTKhepQ+ireS4b2m5K0jy4C9xUg0BZg
         0QUZDVo4YI2ILUlgf8PmS+/zuN4XbZhbOAigsdKlUepqwQuZ+C2HDMn/e7nIXWnkwTx0
         8WbgpBQphZxu7FTS6ddhFKscVlbbSZ3IYxsA4eNsNQsqX+OAO3DBBckOSwz/EUSBR5iD
         xjlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=d0akBS3AITwMDU7SONjbQ/qr1ZJ+AwWFSGeNQBEysbM=;
        b=U759TB2553s1BIiZF+4t5TzTBE1oR9HL6BXUY5Ku8gX+YYDCBXXPoAz/A3MOXYCZQF
         4ciASmqrfcTTfjjO+v6DxRk/Vrmz+OdkUwRdXEdrLlSpftDaCrBBHmy64le+Q8fKvB4o
         ZeK5xre5DARB5rb72cbXKAkOcHzCL6oMWLf3K/+3H1I1yL/7CgtMRP4r/UjbxLVrZ/uc
         9yMfNt3nZt4qUU6gqNarKBNO1MoXcqS3pz+VSzJcNrFkpZfLZRp+pw3h9UppSSGvvIsO
         V4Ql+ujM+L+C2cUU9Rp81fmFCS5l11scCYYJQkFdUhuocTOwaeP1qUh2ToJJJ0XD69bK
         hvoA==
X-Gm-Message-State: ANhLgQ2jW9KOl4OF8fAQbpNyfvcLB5+wv081CfnFI/JTy1cbXV3RPEKq
        580LpqSpgbdAsDkesVzkFWSimfMA2IVjUw==
X-Google-Smtp-Source: ADFU+vv4mrnpeeF0mhtYexDCl7nU8WGJLdy4osOS4SRtGusQNHBRJeGW8GPxVuKp8lXT05UzvZV4aA==
X-Received: by 2002:a7b:c75a:: with SMTP id w26mr10771076wmk.2.1584373804772;
        Mon, 16 Mar 2020 08:50:04 -0700 (PDT)
Received: from localhost (dslb-002-207-138-002.002.207.pools.vodafone-ip.de. [2.207.138.2])
        by smtp.gmail.com with ESMTPSA id i21sm144191wmb.23.2020.03.16.08.50.03
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Mar 2020 08:50:03 -0700 (PDT)
Date:   Mon, 16 Mar 2020 15:57:36 +0100
From:   Oliver Graute <oliver.graute@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     dmitry.torokhov@gmail.com, rydberg@bitmath.org,
        andriy.shevchenko@linux.intel.com, m.felsch@pengutronix.de,
        robh@kernel.org, mylene.josserand@bootlin.com,
        p.zabel@pengutronix.de
Subject: Re: RFC: Input: edt-ft5x06 - FT6336G Touch Panel
Message-ID: <20200316145736.GG16310@optiplex>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200305163649.GC10366@ripley>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 02/03/20, Oliver Graute wrote:
> Hello,
> 
> I have on of these FT6336G Touch Panels here and I try to get it work
> with the ft6236 driver. It comes up with model identification "0x11". So
> I added that identification to the switch case in
> edt_ft5x06_ts_identify(). But it crashes directly after the probe with a
> corrupted stack. No clue why. Some ideas?

I still observe sometimes crashes with ft6236G. When it occurs it is
always a stack corruption in the probe function on bootup.

No clue why stack is corrupted sometimes. Is this related to the buggy
revision field?

Some further suggestions for debugging this?

[    3.806780] edt_ft5x06 1-0038: Model "EP0110M09", Rev. "�", 0x0 sensors
[    3.808468] at24 2-0050: 2-0050 supply vcc not found, using dummy regulator
[    3.814864] DEBUG: edt_ft5x06_ts_probe 1201
[    3.826215] DEBUG: edt_ft5x06_ts_probe 1211
[    3.830512] DEBUG: edt_ft5x06_ts_probe 1214
[    3.834904] input: EP0110M09 as /devices/platform/bus@5a000000/5a820000.i2c/i2c-1/1-0038/input/input0
[    3.844164] at24 2-0050: 4096 byte 24c32 EEPROM, writable, 1 bytes/write
[    3.844264] DEBUG: edt_ft5x06_ts_probe 1222
[    3.850919] i2c i2c-2: LPI2C adapter registered
[    3.855187] edt_ft5x06 1-0038: EDT FT5x06 initialized: IRQ 55, WAKE pin -1, Reset pin -1.
[    3.867878] Kernel panic - not syncing: stack-protector: Kernel stack is corrupted in: edt_ft5x06_ts_probe+0x5c4/0xb00
[    3.878579] CPU: 4 PID: 115 Comm: kworker/u10:2 Not tainted 5.6.0-rc1-next-20200214-00057-g9e78f1560095-dirty #99
[    3.888838] Hardware name: Advantech iMX8QM DMSSE20 (DT)
[    3.894153] Workqueue: events_unbound async_run_entry_fn
[    3.899465] Call trace:
[    3.901909]  dump_backtrace+0x0/0x1c0
[    3.905571]  show_stack+0x14/0x20
[    3.908884]  dump_stack+0xb4/0xfc
[    3.912202]  panic+0x158/0x320
[    3.914929] mmc0: SDHCI controller on 5b010000.mmc [5b010000.mmc] using ADMA
[    3.915254]  print_tainted+0x0/0xa8
[    3.915262]  edt_ft5x06_ts_probe+0x5c4/0xb00
[    3.930063]  i2c_device_probe+0x2d0/0x2f8
[    3.934074]  really_probe+0xd8/0x438
[    3.935270] sdhci-esdhc-imx 5b030000.mmc: Got CD GPIO
[    3.937642]  driver_probe_device+0xdc/0x130
[    3.937648]  __device_attach_driver+0x88/0x108
[    3.942717] sdhci-esdhc-imx 5b030000.mmc: Got WP GPIO
[    3.946872]  bus_for_each_drv+0x74/0xc0
[    3.946875]  __device_attach_async_helper+0xb4/0x100
[    3.946877]  async_run_entry_fn+0x40/0x1a0
[    3.946883]  process_one_work+0x19c/0x320
[    3.973252]  worker_thread+0x48/0x420
[    3.976913]  kthread+0xf0/0x120
[    3.980051]  ret_from_fork+0x10/0x18
[    3.983634] SMP: stopping secondary CPUs
[    3.987558] Kernel Offset: disabled
[    3.991048] CPU features: 0x10002,2100600c
[    3.995148] Memory Limit: none
[    3.998201] ---[ end Kernel panic - not syncing: stack-protector: Kernel stack is corrupted in: edt_ft5x06_ts_probe+0x5c4/0xb00 ]---

Best Regards,

Oliver
