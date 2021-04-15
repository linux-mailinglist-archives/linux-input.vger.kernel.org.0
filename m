Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3921360837
	for <lists+linux-input@lfdr.de>; Thu, 15 Apr 2021 13:26:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230202AbhDOL0a (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 15 Apr 2021 07:26:30 -0400
Received: from mx3.molgen.mpg.de ([141.14.17.11]:41749 "EHLO mx1.molgen.mpg.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230056AbhDOL03 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 15 Apr 2021 07:26:29 -0400
Received: from [192.168.0.3] (ip5f5aeecf.dynamic.kabel-deutschland.de [95.90.238.207])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: pmenzel)
        by mx.molgen.mpg.de (Postfix) with ESMTPSA id 63181206473CA;
        Thu, 15 Apr 2021 13:26:05 +0200 (CEST)
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, persmule@gmail.com
From:   Paul Menzel <pmenzel@molgen.mpg.de>
Subject: i8042: Can't read CTR while initializing i8042
Message-ID: <6c3c3bf3-ba7a-eacf-04b9-14b4dfb92b77@molgen.mpg.de>
Date:   Thu, 15 Apr 2021 13:26:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Dear Linux folks,


On a mainboard Asus P8Z77-V LX2 with a Nuvoton NCT6779D as Super I/O and 
coreboot with Linux payload, Linux is unable to natively initialize the 
PS/2 keyboard.

```
[    0.000000] Command line: i8042.debug=1
[    0.215363] Kernel command line: i8042.debug=1
[    0.981563] i8042: PNP: PS/2 Controller [PNP0303:PS2K,PNP0f13:PS2M] 
at 0x60,0x64 irq 1,12
[    0.981619] i8042: [0] d1 -> i8042 (command)
[    0.981624] i8042: [0] df -> i8042 (parameter)
[    0.981628] i8042: [0] ff -> i8042 (command)
[    0.981649] i8042: [0] 20 -> i8042 (command)
[    0.985452] i8042: [0]      -- i8042 (wait read timeout)
[    1.498006] i8042: Can't read CTR while initializing i8042
[    1.498043] i8042: probe of i8042 failed with error -5
```

Selecting and executing coreboot’s PS/2 keyboard driver [1], which is 
only intended for payloads with no driver, results in Linux successfully 
initializing the driver.

```
[    0.000000] Command line: i8042.debug=1
[    0.214434] Kernel command line: i8042.debug=1
[    0.987563] i8042: PNP: PS/2 Controller [PNP0303:PS2K,PNP0f13:PS2M] 
at 0x60,0x64 irq 1,12
[    0.987626] i8042: [1] d1 -> i8042 (command)
[    0.987631] i8042: [1] df -> i8042 (parameter)
[    0.987636] i8042: [1] ff -> i8042 (command)
[    0.987659] i8042: [1] 20 -> i8042 (command)
[    0.987769] i8042: [1] 65 <- i8042 (return)
[    0.987821] i8042: [1] 20 -> i8042 (command)
[    0.988035] i8042: [1] 65 <- i8042 (return)
[    0.988040] i8042: [1] 60 -> i8042 (command)
[    0.988149] i8042: [1] 74 -> i8042 (parameter)
[    0.988210] i8042: [1] d3 -> i8042 (command)
[    0.988266] i8042: [1] 5a -> i8042 (parameter)
[    0.988327] i8042: [1] 5a <- i8042 (return)
[    0.988330] i8042: [1] a7 -> i8042 (command)
[    0.988384] i8042: [1] 20 -> i8042 (command)
[    0.988546] i8042: [1] 74 <- i8042 (return)
[    0.988549] i8042: [1] a8 -> i8042 (command)
[    0.988603] i8042: [1] 20 -> i8042 (command)
[    0.988817] i8042: [1] 54 <- i8042 (return)
[    0.988835] i8042: [1] 60 -> i8042 (command)
[    0.988943] i8042: [1] 56 -> i8042 (parameter)
[    0.989000] i8042: [1] d3 -> i8042 (command)
[    0.989057] i8042: [1] a5 -> i8042 (parameter)
[    0.989142] i8042: [1] a5 <- i8042 (aux_test_irq, aux)
[…]
```

The SeaBIOS payload also initializes the PS/2 keyboard correctly with 
its driver [2].

```
/7fee1000\ Start thread
|7fee1000| i8042_flush
|7fee1000| i8042_command cmd=ad
|7fee1000| i8042_wait_write
|7fee1000| i8042_command cmd=a7
|7fee1000| i8042_wait_write
|7fee1000| i8042_flush
|7fee1000| i8042_command cmd=1aa
|7fee1000| i8042_wait_write
|7fee1000| i8042_wait_read
|7fee1000| i8042 param=55
|7fee1000| i8042_command cmd=1ab
|7fee1000| i8042_wait_write
|7fee1000| i8042_wait_read
|7fee1000| i8042 param=0
|7fee1000| ps2_command aux=0 cmd=1ff
|7fee1000| i8042 ctr old=30 new=30
|7fee1000| i8042_command cmd=1060
|7fee1000| i8042_wait_write
|7fee1000| i8042_wait_write
|7fee1000| i8042_command cmd=1060
|7fee1000| i8042_wait_write
|7fee1000| i8042_wait_write
|7fee1000| ps2_sendbyte aux=0 cmd=ff
|7fee1000| i8042_kbd_write c=255
|7fee1000| i8042_wait_write
|7fee1000| ps2 read fa
|7fee1000| ps2 read aa
|7fee1000| i8042_command cmd=1060
|7fee1000| i8042_wait_write
|7fee1000| i8042_wait_write
|7fee1000| ps2_command aux=0 cmd=f5
|7fee1000| i8042 ctr old=30 new=30
|7fee1000| i8042_command cmd=1060
|7fee1000| i8042_wait_write
|7fee1000| i8042_wait_write
|7fee1000| i8042_command cmd=1060
|7fee1000| i8042_wait_write
|7fee1000| i8042_wait_write
|7fee1000| ps2_sendbyte aux=0 cmd=f5
|7fee1000| i8042_kbd_write c=245
|7fee1000| i8042_wait_write
|7fee1000| ps2 read fa
|7fee1000| i8042_command cmd=1060
|7fee1000| i8042_wait_write
|7fee1000| i8042_wait_write
|7fee1000| ps2_command aux=0 cmd=10f0
|7fee1000| i8042 ctr old=30 new=30
|7fee1000| i8042_command cmd=1060
|7fee1000| i8042_wait_write
|7fee1000| i8042_wait_write
|7fee1000| i8042_command cmd=1060
|7fee1000| i8042_wait_write
|7fee1000| i8042_wait_write
|7fee1000| ps2_sendbyte aux=0 cmd=f0
|7fee1000| i8042_kbd_write c=240
|7fee1000| i8042_wait_write
|7fee1000| ps2 read fa
|7fee1000| ps2_sendbyte aux=0 cmd=2
|7fee1000| i8042_kbd_write c=2
|7fee1000| i8042_wait_write
|7fee1000| ps2 read fa
|7fee1000| i8042_command cmd=1060
|7fee1000| i8042_wait_write
|7fee1000| i8042_wait_write
|7fee1000| ps2_command aux=0 cmd=f4
|7fee1000| i8042 ctr old=61 new=70
|7fee1000| i8042_command cmd=1060
|7fee1000| i8042_wait_write
|7fee1000| i8042_wait_write
|7fee1000| i8042_command cmd=1060
|7fee1000| i8042_wait_write
|7fee1000| i8042_wait_write
|7fee1000| ps2_sendbyte aux=0 cmd=f4
|7fee1000| i8042_kbd_write c=244
|7fee1000| i8042_wait_write
|7fee1000| ps2 read fa
|7fee1000| i8042_command cmd=1060
|7fee1000| i8042_wait_write
|7fee1000| i8042_wait_write
|7fee1000| PS2 keyboard initialized
\7fee1000/ End thread
```

At least the SeaBIOS payload does not seem to take CTR into account. 
Should Linux fail gracefully if the CTR cannot be read?


Kind regards,

Paul


[1]: 
https://review.coreboot.org/plugins/gitiles/coreboot/+/refs/heads/master/src/drivers/pc80/pc/keyboard.c
[2]: 
https://review.coreboot.org/plugins/gitiles/seabios/+/refs/heads/master/src/hw/ps2port.c
