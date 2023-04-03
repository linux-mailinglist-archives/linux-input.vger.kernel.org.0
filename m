Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 06F236D3E53
	for <lists+linux-input@lfdr.de>; Mon,  3 Apr 2023 09:44:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231742AbjDCHoI (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 3 Apr 2023 03:44:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231654AbjDCHoF (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 3 Apr 2023 03:44:05 -0400
Received: from smtpbgau2.qq.com (smtpbgau2.qq.com [54.206.34.216])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1CE3EB54
        for <linux-input@vger.kernel.org>; Mon,  3 Apr 2023 00:43:46 -0700 (PDT)
X-QQ-mid: bizesmtp78t1680507756tqmlqfe1
Received: from [172.27.112.111] ( [58.249.112.45])
        by bizesmtp.qq.com (ESMTP) with SMTP id 0
        for <linux-input@vger.kernel.org>; Mon, 03 Apr 2023 15:42:35 +0800 (CST)
X-QQ-SSF: 01400000000000B0F000000A0000000
X-QQ-FEAT: rZJGTgY0+YMhg0nEM5LP9/UoRrRkRELhQwzETcr+pQNOPRN72NWJxHCqjgu2e
        YJGDhENYkXcBOEgfhlMwL2gTdV+bJ6lXNah8RJxPy9NroP0OJ6tK1DfKNSfQEVxAwUyRmHH
        JweAdCcbW9xCodd6ttTcQxxfN2/AmQ0PL/UFGkl4f1EW9snaM8ipZl8zomH7vfmFZChr0oa
        Rq0Ofvx8QDW1OHf8woPiGRaeO8Kgv5tXWvQwmqKLWrWPrXvtBOBaX5lTxQo+24fnSiiAzeI
        Bo+KVIj24t1WZP93sf5iI5K+fa8hwhBWz9olJT6IpOtA/amphnr6bqoPJn9d6UCn4Rjw8MU
        GvSvOgW/OHLyqwr9lICAmN4t0INd1j5uE8+Zr28mlykdDK5UThHRMacQ+U4dlxS1Yz9hn3/
X-QQ-GoodBg: 2
X-BIZMAIL-ID: 12353600545479003282
Message-ID: <A3D566C5B262EC0F+4ede8371-9a20-6e5d-6a8c-b44d15634e26@mail2.sysu.edu.cn>
Date:   Mon, 3 Apr 2023 15:42:35 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
From:   Shang Ye <yesh25@mail2.sysu.edu.cn>
Subject: Seeking directions: Workaround for failed keyboard initialization on
 some Lenovo laptops
To:     linux-input@vger.kernel.org
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:mail2.sysu.edu.cn:qybglogicsvr:qybglogicsvr7
X-Spam-Status: No, score=1.6 required=5.0 tests=FORGED_MUA_MOZILLA,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

There have been quite a few reports about failed keyboard initialization 
on some 9 types of Lenovo Yoga / XiaoXinPro / IdeaPad (14", Intel) 
laptops. A list of them can be found here:
https://github.com/yescallop/atkbd-nogetid#presumably-supported-machines
And a related kernel bug report can be found here:
https://bugzilla.kernel.org/show_bug.cgi?id=216994

I'd like to first provide a dmesg log (without patch) that illustrates 
the problem on my Yoga 14sIHU 2021:
https://gist.github.com/yescallop/5a97d010f226172fafab0933ce8ea8af

At first the KBD port was successfully set up by `i8042`, but then the 
first initialization attempt by `atkbd` failed:

    [    2.698474] i8042: [17] f2 -> i8042 (kbd-data)
    [    2.698678] i8042: [17] fa <- i8042 (interrupt, 0, 1)
    [    2.698746] i8042: [17] 83 <- i8042 (interrupt, 0, 1)
    [    2.698767] i8042: [17] 60 -> i8042 (command)
    [    2.698856] i8042: [17] 66 -> i8042 (parameter)
    [    2.698951] i8042: [17] 60 -> i8042 (command)
    [    2.699092] i8042: [17] 67 -> i8042 (parameter)

It seems that the i8042 implementation on the laptop omitted the `0xab` 
byte from its response to the `GETID` command, thus making the 
`atkbd_probe` function fail for receiving an invalid keyboard ID (should 
normally be `0xab 0x83`).

This situation went on for a few rounds when I pressed and released the 
space key (scan code: 0x39 when pressed, 0xb9 when released). The sixth 
time I pressed the space key, something different happened:

    [   48.188540] i8042: [13664] 39 <- i8042 (interrupt, 0, 1)
    [   48.188658] i8042: [13664] f2 -> i8042 (kbd-data)
    [   48.188998] i8042: [13664] fa <- i8042 (interrupt, 0, 1)
    [   48.709743] i8042: [13821] ed -> i8042 (kbd-data)
    [   48.913069] i8042: [13882] 60 -> i8042 (command)
    [   48.913235] i8042: [13882] 66 -> i8042 (parameter)
    [   48.913446] i8042: [13882] 60 -> i8042 (command)
    [   48.913591] i8042: [13882] 67 -> i8042 (parameter)
    [   48.913672] i8042: [13882] fa <- i8042 (interrupt, 0, 0)

This time even the byte `0x83` was omitted, so the `GETID` command 
failed and `atkbd_probe` tried to set the LEDs on the keyboard, but 
failed again for not receiving an ACK to the command byte `0xed`. 
However, when `i8042_port_close` was later called, an ACK was read from 
the KBD port, which is an indication that the i8042 implementation might 
have failed to raise an interrupt for this ACK.

And the next time I released the space key, the byte `0x83` was omitted 
again, but `atkbd_probe` somehow succeeded in receiving an ACK to the 
`SETLEDS` command, and the keyboard was finally initialized properly.

An easy workaround is to add a kernel parameter `i8042.dumbkbd` in the 
boot loader, but as this makes the Caps Lock LED unusable, some other 
solutions should be considered when it comes to patching the kernel. 
Here I provide two possible solutions:

 1. Add a module parameter in `atkbd`, say `assume_normal_kbd`, that,
    when set to true, makes `atkbd_probe` skip sending the `GETID`
    command and set the keyboard ID directly to `0xab83`. Then, add
    quirks to make it a default for the affected machines.
 2. In `atkbd_probe`: Call `i8042_flush` immediately after the `GETID`
    command is finished, to get rid of any remaining byte in the
    keyboard buffer that is not properly signaled by an interrupt. Then,
    if the command failed or the keyboard ID is invalid, try to set the
    LEDs on anything connected to the KBD port.

I have tried both solutions and both worked nicely on my laptop, but 
there might be some problems with them:

  * For the first solution: Do we add a module parameter, quirks, or
    both? I find that `i8042.probe_defer` is an example for adding both
    of them, and `atkbd_skip_deactivate` for adding only quirks.
  * For the second solution: Is it okay to flush all data in the
    keyboard/mouse buffer down the toilet from this particular call site
    for all machines? I suspect some special handling is required for
    not flushing the data in the mouse buffer but instead sending them
    to the upper layers.
  * For the second solution: Will it do any harm to persistently try to
    set the LEDs on a mouse connected to the KBD port? A comment in
    `atkbd_probe` says "If a mouse is connected, this should make sure
    we don't try to set the LEDs on it." I'm not at all familiar to PS/2
    devices, so can someone maybe explain this a bit?

The second solution is, indeed, a general one that may automatically fix 
similar problems on other machines, without needing to manually add 
quirks in `atkbd`. A example of a similar problem on HP Spectre x360 
13-aw2xxx is described here:
https://patchwork.kernel.org/project/linux-input/patch/20210201160336.16008-1-anton@cpp.in/

But it can nevertheless cause regressions if not thoroughly considered. 
Thus, I'm here seeking for your directions on a workaround for this 
problem, as there can be some better solution that I'm not aware of.

Thanks,
Shang

