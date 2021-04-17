Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62384362D2B
	for <lists+linux-input@lfdr.de>; Sat, 17 Apr 2021 05:20:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235671AbhDQDUW (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 16 Apr 2021 23:20:22 -0400
Received: from www262.sakura.ne.jp ([202.181.97.72]:57035 "EHLO
        www262.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234999AbhDQDUQ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 16 Apr 2021 23:20:16 -0400
Received: from fsav103.sakura.ne.jp (fsav103.sakura.ne.jp [27.133.134.230])
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 13H3J5UU012332;
        Sat, 17 Apr 2021 12:19:05 +0900 (JST)
        (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav103.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav103.sakura.ne.jp);
 Sat, 17 Apr 2021 12:19:05 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav103.sakura.ne.jp)
Received: from [192.168.1.9] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
        (authenticated bits=0)
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 13H3J55V012327
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
        Sat, 17 Apr 2021 12:19:05 +0900 (JST)
        (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Subject: Re: [syzbot] unexpected kernel reboot (4)
To:     Andrey Konovalov <andreyknvl@gmail.com>,
        Dmitry Vyukov <dvyukov@google.com>
Cc:     syzbot <syzbot+9ce030d4c89856b27619@syzkaller.appspotmail.com>,
        LKML <linux-kernel@vger.kernel.org>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>
References: <000000000000301a4d05bfe14b8f@google.com>
 <CACT4Y+ZT2m7t+o9=VYCE32U_1aUVJXRp_5KgJSdEZC1YXy=qgA@mail.gmail.com>
 <CA+fCnZcWEuYeOx6-0LY+cqtGVbMx2OiyhEELErdfwaHGcUWHbQ@mail.gmail.com>
From:   Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Message-ID: <55f68dce-77e8-b142-0822-fca14b13d4bd@i-love.sakura.ne.jp>
Date:   Sat, 17 Apr 2021 12:19:06 +0900
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <CA+fCnZcWEuYeOx6-0LY+cqtGVbMx2OiyhEELErdfwaHGcUWHbQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 2021/04/15 0:39, Andrey Konovalov wrote:
> On Wed, Apr 14, 2021 at 7:45 AM Dmitry Vyukov <dvyukov@google.com> wrote:
>> The reproducer connects some USB HID device and communicates with the driver.
>> Previously we observed reboots because HID devices can trigger reboot
>> SYSRQ, but we disable it with "CONFIG_MAGIC_SYSRQ is not set".
>> How else can a USB device reboot the machine? Is it possible to disable it?
>> I don't see any direct includes of <linux/reboot.h> in drivers/usb/*
> 
> This happens when a keyboard sends the Ctrl+Alt+Del sequence, see
> fn_boot_it()->ctrl_alt_del() in drivers/tty/vt/keyboard.c.
> 

Regarding ctrl_alt_del() problem, doing

  sh -c 'echo 0 > /proc/sys/kernel/ctrl-alt-del; echo $$ > /proc/sys/kernel/cad_pid'

as root before start fuzzing might help.

Also, with the command above, reproducer still triggers suspend operation which freezes userspace processes.
This could possibly be one of causes for no output / lost connections. Try disabling freeze/suspend related configs?

[   60.881255][ T6280] usb 5-1: new high-speed USB device number 2 using dummy_hcd
[   61.260648][ T6280] usb 5-1: config 0 interface 0 altsetting 0 endpoint 0x81 has an invalid bInterval 0, changing to 7
[   61.274056][ T6280] usb 5-1: New USB device found, idVendor=0926, idProduct=3333, bcdDevice= 0.40
[   61.284700][ T6280] usb 5-1: New USB device strings: Mfr=0, Product=0, SerialNumber=0
[   61.289556][ T6280] usb 5-1: config 0 descriptor??
[   61.780871][ T6280] keytouch 0003:0926:3333.0002: fixing up Keytouch IEC report descriptor
[   61.792015][ T6280] input: HID 0926:3333 as /devices/platform/dummy_hcd.0/usb5/5-1/5-1:0.0/0003:0926:3333.0002/input/input5
[   61.871612][ T6280] keytouch 0003:0926:3333.0002: input,hidraw1: USB HID v0.00 Keyboard [HID 0926:3333] on usb-dummy_hcd.0-1/input0
[   62.137706][ T6847] PM: suspend entry (s2idle)
[   62.147914][ T6847] Filesystems sync: 0.007 seconds
[   62.152031][ T6847] Freezing user space processes ... (elapsed 0.003 seconds) done.
[   62.158369][ T6847] OOM killer disabled.
[   62.159673][ T6847] Freezing remaining freezable tasks ... (elapsed 0.003 seconds) done.
[   62.167440][ T6847] vhci_hcd vhci_hcd.15: suspend vhci_hcd
[   62.169569][ T6847] vhci_hcd vhci_hcd.14: suspend vhci_hcd
[   62.171562][ T6847] vhci_hcd vhci_hcd.13: suspend vhci_hcd
[   62.173500][ T6847] vhci_hcd vhci_hcd.12: suspend vhci_hcd
[   62.175740][ T6847] vhci_hcd vhci_hcd.11: suspend vhci_hcd
[   62.177677][ T6847] vhci_hcd vhci_hcd.10: suspend vhci_hcd
[   62.179725][ T6847] vhci_hcd vhci_hcd.9: suspend vhci_hcd
[   62.181602][ T6847] vhci_hcd vhci_hcd.8: suspend vhci_hcd
[   62.183681][ T6847] vhci_hcd vhci_hcd.7: suspend vhci_hcd
[   62.185594][ T6847] vhci_hcd vhci_hcd.6: suspend vhci_hcd
[   62.187552][ T6847] vhci_hcd vhci_hcd.5: suspend vhci_hcd
[   62.189566][ T6847] vhci_hcd vhci_hcd.4: suspend vhci_hcd
[   62.191767][ T6847] vhci_hcd vhci_hcd.3: suspend vhci_hcd
[   62.193657][ T6847] vhci_hcd vhci_hcd.2: suspend vhci_hcd
[   62.195634][ T6847] vhci_hcd vhci_hcd.1: suspend vhci_hcd
[   62.197430][ T6847] vhci_hcd vhci_hcd.0: suspend vhci_hcd
[   62.249881][    T8] mptbase: ioc0: pci-suspend: pdev=0xffff888005495000, slot=0000:00:10.0, Entering operating state [D0]

