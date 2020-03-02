Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8520A175D3E
	for <lists+linux-input@lfdr.de>; Mon,  2 Mar 2020 15:33:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727316AbgCBOdZ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 2 Mar 2020 09:33:25 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:35860 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727053AbgCBOdX (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 2 Mar 2020 09:33:23 -0500
Received: by mail-wr1-f65.google.com with SMTP id j16so12908664wrt.3
        for <linux-input@vger.kernel.org>; Mon, 02 Mar 2020 06:33:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :content-transfer-encoding:user-agent;
        bh=RZzaofGf7yHMPKjnMledf6gUNO74LKVHiyMrcOdHPLg=;
        b=WeqJQmgh39zCflZEW4NXvV0xBmE7m5krc4Jx0g9ZApc6Gd7PYLp7SNtMDkVEKnZPGk
         Qoj8oJPRPI0wsHqB4+pO13YEKYnO1P24Yk7NEN7aFY5XrKGd7kUujBkdyEwb8jtT5rm/
         fbfpwtTkD1Gybb5aElMKLxpVrgn4kf8J8HpKe8g5TmiJU0V6y6WF3H8zUopmq3LZeVOj
         +6xOPGw3sTU04J7Jxl/gkkln7tbPAt7xIX1ctwzGveq+s43PWmmn33ZM7XFXQ0aWoTQR
         BTRQPf9k/ooXXC08Wt4vLF1wUAXSuaKLXBxuzvhZ45A7p1ePfPRHgxtm1Or0s9eyqFdB
         3HvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:content-transfer-encoding:user-agent;
        bh=RZzaofGf7yHMPKjnMledf6gUNO74LKVHiyMrcOdHPLg=;
        b=My/YYk551sJNcttI1WL15fYY/vkrXXw1QL4ob9PB7/fr0Z/UNEWO0u6yohHkdtnQe7
         DU3tSA0+u4qja5tsdOgXPPuib2b032SCpkN/gOnhYVSjozuSwtYCotb8XMjC00nFTxZB
         48epd5tsK7H2Dqythi+QvQktIokKA/ua+Ov4K+xmcI/UfOg0u49HUbhSl8j3YGVJg+Vc
         Lh48UNTTY9X3XBwIOBBFdh9g1o0VunDjUfO4B1wJ/qomW57qVlTSpk3Kis5evsPj4SAJ
         y7bA93M/jA4BKt8l+p4XZ2j1KUZgH/zPojbwxxf9/FOZ1SYxeXAwXEwegs9fAy8J1XJ9
         C9Lw==
X-Gm-Message-State: APjAAAW3ix2sVeZz/N26ppvlT7yh8tCjNqTS5DaXS2mGEdnpNYVxT+yK
        PP/eDqV2An3GqOYVENIU9FejohuXfanhbw==
X-Google-Smtp-Source: APXvYqxycsCm4aF7RoDT1jUoeWiSl3aM7y/gctMJC5TMPJDx1NSsa0pQyILQTbM52QsOvVrpsp6zfA==
X-Received: by 2002:adf:de10:: with SMTP id b16mr21667070wrm.145.1583159601181;
        Mon, 02 Mar 2020 06:33:21 -0800 (PST)
Received: from localhost (dslb-002-207-138-002.002.207.pools.vodafone-ip.de. [2.207.138.2])
        by smtp.gmail.com with ESMTPSA id d7sm18330500wmc.6.2020.03.02.06.33.20
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Mar 2020 06:33:20 -0800 (PST)
Date:   Mon, 2 Mar 2020 15:30:35 +0100
From:   Oliver Graute <oliver.graute@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     dmitry.torokhov@gmail.com, rydberg@bitmath.org,
        andriy.shevchenko@linux.intel.com, m.felsch@pengutronix.de,
        robh@kernel.org, mylene.josserand@bootlin.com,
        p.zabel@pengutronix.de
Subject: RFC: Input: edt-ft5x06 - FT6336G Touch Panel
Message-ID: <20200302143035.GF16310@optiplex>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hello,

I have on of these FT6336G Touch Panels here and I try to get it work
with the ft6236 driver. It comes up with model identification "0x11". So
I added that identification to the switch case in
edt_ft5x06_ts_identify(). But it crashes directly after the probe with a
corrupted stack. No clue why. Some ideas?

Best regards,

Oliver


@@ -879,6 +879,7 @@ static int edt_ft5x06_ts_identify(struct i2c_client *client,
 		 * the identification registers.
 		 */
 		switch (rdbuf[0]) {
+		case 0x11:   /* EDT EP0110M09 */
 		case 0x35:   /* EDT EP0350M09 */
 		case 0x43:   /* EDT EP0430M09 */
 		case 0x50:   /* EDT EP0500M09 */

In my device tree I added the following:

&i2c2 {
	#address-cells = <1>;
	#size-cells = <0>;
	clock-frequency = <100000>;
	pinctrl-names = "default";
	pinctrl-0 = <&pinctrl_lpi2c2>;
	status = "okay";

	polytouch: edt_ft6236@38 {
		compatible = "focaltech,ft6236";
		reg = <0x38>;
		pinctrl-names = "default";
		pinctrl-0 = <&pinctrl_edt_ft5x06>;
		interrupt-parent = <&lsio_gpio0>;
		interrupts = <2 0>;
	};
};

[    2.232596] i2c i2c-0: LPI2C adapter registered
[    2.238931] edt_ft5x06 1-0038: probing for EDT FT5x06 I2C
[    2.244369] edt_ft5x06 1-0038: 1-0038 supply vcc not found, using dummy regulator
[    2.257639] edt_ft5x06 1-0038: Model "EP0110M09", Rev. "�", 0x0 sensors
[    2.264536] input: EP0110M09 as /devices/platform/bus@5a000000/5a820000.i2c/i2c-1/1-0038/input/input0
[    2.273920] edt_ft5x06 1-0038: EDT FT5x06 initialized: IRQ 35, WAKE pin -1, Reset pin -1.
[    2.282124] Kernel panic - not syncing: stack-protector: Kernel stack is corrupted in: edt_ft5x06_ts_probe+0x9d4/0xa88
[    2.292830] CPU: 0 PID: 5 Comm: kworker/0:0 Not tainted 5.6.0-rc1-next-20200214-00051-g9874f196742d #69
[    2.302224] Hardware name: Advantech iMX8QM DMSSE20 (DT)
[    2.307544] Workqueue: events deferred_probe_work_func
[    2.312686] Call trace:
[    2.315141]  dump_backtrace+0x0/0x1c0
[    2.318802]  show_stack+0x14/0x20
[    2.322124]  dump_stack+0xb4/0xfc
[    2.325440]  panic+0x158/0x320
[    2.328494]  print_tainted+0x0/0xa8
[    2.331978]  edt_ft5x06_ts_probe+0x9d4/0xa88
[    2.336248]  i2c_device_probe+0x2d0/0x2f8
[    2.340258]  really_probe+0xd8/0x438
[    2.343836]  driver_probe_device+0xdc/0x130
[    2.348017]  __device_attach_driver+0x88/0x108
[    2.352464]  bus_for_each_drv+0x74/0xc0
[    2.356302]  __device_attach+0xdc/0x160
[    2.360133]  device_initial_probe+0x10/0x18
[    2.364312]  bus_probe_device+0x90/0x98
[    2.368151]  device_add+0x434/0x770
[    2.371636]  device_register+0x1c/0x28
[    2.375383]  i2c_new_client_device+0x134/0x2a8
[    2.379833]  of_i2c_register_device+0xb0/0xd8
[    2.384192]  of_i2c_register_devices+0x9c/0x198
[    2.388724]  i2c_register_adapter+0x150/0x418
[    2.393076]  __i2c_add_numbered_adapter+0x58/0xa0
[    2.397776]  i2c_add_adapter+0x9c/0xc8
[    2.401525]  lpi2c_imx_probe+0x1b0/0x2a0
[    2.405451]  platform_drv_probe+0x50/0xa0
[    2.409461]  really_probe+0xd8/0x438
[    2.413032]  driver_probe_device+0xdc/0x130
[    2.417210]  __device_attach_driver+0x88/0x108
[    2.421658]  bus_for_each_drv+0x74/0xc0
[    2.425489]  __device_attach+0xdc/0x160
[    2.429321]  device_initial_probe+0x10/0x18
[    2.433499]  bus_probe_device+0x90/0x98
[    2.437331]  deferred_probe_work_func+0x88/0xd8
[    2.441864]  process_one_work+0x19c/0x320
[    2.445870]  worker_thread+0x1f0/0x420
[    2.449622]  kthread+0xf0/0x120
[    2.452762]  ret_from_fork+0x10/0x18
[    2.456349] SMP: stopping secondary CPUs
[    2.460272] Kernel Offset: disabled
[    2.463762] CPU features: 0x00002,2000200c
[    2.467859] Memory Limit: none
[    2.470927] ---[ end Kernel panic - not syncing: stack-protector: Kernel stack is corrupted in: edt_ft5x06_ts_probe+0x9d4/0xa88 ]---



