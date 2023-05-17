Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4497F70610C
	for <lists+linux-input@lfdr.de>; Wed, 17 May 2023 09:24:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229591AbjEQHYm (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 17 May 2023 03:24:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229538AbjEQHYk (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 17 May 2023 03:24:40 -0400
Received: from domac.alu.hr (domac.alu.unizg.hr [IPv6:2001:b68:2:2800::3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38840FE;
        Wed, 17 May 2023 00:24:38 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by domac.alu.hr (Postfix) with ESMTP id 9A7D560171;
        Wed, 17 May 2023 09:24:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=alu.unizg.hr; s=mail;
        t=1684308264; bh=iXEDxEC12tt765n+Z70KYNDSx4lfQ56SqIlgcwlTsnE=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=SdgQN+/lXhYAIZDBcLo8UG6QpreCy7pv/QZTGYS/2wlhco0YJsmElbbWZRT8TbwoG
         cKLEyEhIs3c+BWrDPRtjdtEmxPfNDzdPUW/oh5lCiHgfbasOQwX/Jvljy5CavMjDSv
         6ws8EuLxMwkHeJZrRzRHSvBqq6EF4w3XUIqXTx1yLyB3qpTfDEXC3a4cssb+dj3ryI
         J+Ps8xCyBskgWQPZQ6nMAx7QtE3iTmWntDnU/w+hxRMgcC/bUpP1bZsBNXl1+C0JBF
         DrN7PSlXYovmxjMKmssADjOM+zJ00WvVkLKFVbvnTQWV5+1g+y9osExpVFhxvnKY/O
         my3pKWx93ffPw==
X-Virus-Scanned: Debian amavisd-new at domac.alu.hr
Received: from domac.alu.hr ([127.0.0.1])
        by localhost (domac.alu.hr [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id B7Ce7ElT2CoX; Wed, 17 May 2023 09:24:21 +0200 (CEST)
Received: from [10.0.2.65] (grf-nat.grf.hr [161.53.83.23])
        by domac.alu.hr (Postfix) with ESMTPSA id 35D666015F;
        Wed, 17 May 2023 09:24:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=alu.unizg.hr; s=mail;
        t=1684308261; bh=iXEDxEC12tt765n+Z70KYNDSx4lfQ56SqIlgcwlTsnE=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=HYzk4n3RNtMSe8Axu6a+XQVh+ea1s1jpphZ1fO0sCSn4K5pSZD6eDlnyjl0QjHbxY
         knB4bgMjgwrFZSrbt9XxLTjcQZKc4dD9wgbEZHzyRZhVz7hyhDyxImdPLNqCBgczoV
         lC1L4Cp26NAgUex23zO+ZHMNtsJX0ruNG+Bmu+d9GkBBJMGiJaMWBLTbNuLFLNg1pC
         Hc5M8sK+2KPi2QRrSJ1mOLMpFEQAOYgOlrL7Pnx28bWIj5jBiio5/yf/DsZFdTWF1k
         6wh7xmuxom0AE6St8TRhzzRrTtSL1/BMQHZR5ev91J0dKdzT2kjwu3pxTmKCd+TWtj
         Cwz1e378NAG5g==
Message-ID: <f7e7e2b1-921d-6f80-0f4f-596ed1a39c74@alu.unizg.hr>
Date:   Wed, 17 May 2023 09:24:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [BUG][NEW DATA] Kmemleak, possibly hiddev_connect(), in 6.3.0+
 torvalds tree commit gfc4354c6e5c2
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Mirsad Goran Todorovac <mirsad.goran.todorovac@alu.hr>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-input@vger.kernel.org,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Jiri Kosina <jikos@kernel.org>
References: <f64b17fa-d509-ad30-6e8d-e4c979818047@alu.unizg.hr>
 <2023050824-juiciness-catching-9290@gregkh>
 <2023050854-collage-dreamt-660c@gregkh>
 <c73471aa-522a-83a4-5614-506581604301@alu.unizg.hr>
 <2023050958-precut-vividly-94bf@gregkh>
 <987f9008-7eac-e2a4-31f6-8479f0e4a626@alu.unizg.hr>
 <2023051607-sturdy-jiffy-ca99@gregkh>
Content-Language: en-US, hr
From:   Mirsad Goran Todorovac <mirsad.todorovac@alu.unizg.hr>
In-Reply-To: <2023051607-sturdy-jiffy-ca99@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
        T_FILL_THIS_FORM_SHORT,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 16.5.2023. 16:36, Greg Kroah-Hartman wrote:
> On Fri, May 12, 2023 at 11:33:31PM +0200, Mirsad Goran Todorovac wrote:
>> Hi,
>>
>> On 5/9/23 04:59, Greg Kroah-Hartman wrote:
>>> On Tue, May 09, 2023 at 01:51:35AM +0200, Mirsad Goran Todorovac wrote:
>>>>
>>>>
>>>> On 08. 05. 2023. 16:01, Greg Kroah-Hartman wrote:
>>>>> On Mon, May 08, 2023 at 08:51:55AM +0200, Greg Kroah-Hartman wrote:
>>>>>> On Mon, May 08, 2023 at 08:30:07AM +0200, Mirsad Goran Todorovac wrote:
>>>>>>> Hi,
>>>>>>>
>>>>>>> There seems to be a kernel memory leak in the USB keyboard driver.
>>>>>>>
>>>>>>> The leaked memory allocs are 96 and 512 bytes.
>>>>>>>
>>>>>>> The platform is Ubuntu 22.04 LTS on a assembled AMD Ryzen 9 with X670E PG
>>>>>>> Lightning mobo,
>>>>>>> and Genius SlimStar i220 GK-080012 keyboard.
>>>>>>>
>>>>>>> (Logitech M100 HID mouse is not affected by the bug.)
>>>>>>>
>>>>>>> BIOS is:
>>>>>>>
>>>>>>>         *-firmware
>>>>>>>              description: BIOS
>>>>>>>              vendor: American Megatrends International, LLC.
>>>>>>>              physical id: 0
>>>>>>>              version: 1.21
>>>>>>>              date: 04/26/2023
>>>>>>>              size: 64KiB
>>>>>>>
>>>>>>> The kernel is 6.3.0-torvalds-<id>-13466-gfc4354c6e5c2.
>>>>>>>
>>>>>>> The keyboard is recognised as Chicony:
>>>>>>>
>>>>>>>                     *-usb
>>>>>>>                          description: Keyboard
>>>>>>>                          product: CHICONY USB Keyboard
>>>>>>>                          vendor: CHICONY
>>>>>>>                          physical id: 2
>>>>>>>                          bus info: usb@5:2
>>>>>>>                          logical name: input35
>>>>>>>                          logical name: /dev/input/event4
>>>>>>>                          logical name: input35::capslock
>>>>>>>                          logical name: input35::numlock
>>>>>>>                          logical name: input35::scrolllock
>>>>>>>                          logical name: input36
>>>>>>>                          logical name: /dev/input/event5
>>>>>>>                          logical name: input37
>>>>>>>                          logical name: /dev/input/event6
>>>>>>>                          logical name: input38
>>>>>>>                          logical name: /dev/input/event8
>>>>>>>                          version: 2.30
>>>>>>>                          capabilities: usb-2.00 usb
>>>>>>>                          configuration: driver=usbhid maxpower=100mA
>>>>>>> speed=1Mbit/s
>>>>>>>
>>>>>>> The bug is easily reproduced by unplugging the USB keyboard, waiting about a
>>>>>>> couple of seconds,
>>>>>>> and then reconnect and scan for memory leaks twice.
>>>>>>>
>>>>>>> The kmemleak log is as follows [edited privacy info]:
>>>>>>>
>>>>>>> root@hostname:/home/username# cat /sys/kernel/debug/kmemleak
>>>>>>> unreferenced object 0xffff8dd020037c00 (size 96):
>>>>>>>      comm "systemd-udevd", pid 435, jiffies 4294892550 (age 8909.356s)
>>>>>>>      hex dump (first 32 bytes):
>>>>>>>        5d 8e 4e b9 ff ff ff ff 00 00 00 00 00 00 00 00 ].N.............
>>>>>>>        00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
>>>>>>>      backtrace:
>>>>>>>        [<ffffffffb81a74be>] __kmem_cache_alloc_node+0x22e/0x2b0
>>>>>>>        [<ffffffffb8127b6e>] kmalloc_trace+0x2e/0xa0
>>>>>>>        [<ffffffffb87543d9>] class_create+0x29/0x80
>>>>>>>        [<ffffffffb8880d24>] usb_register_dev+0x1d4/0x2e0
>>>>>>
>>>>>> As the call to class_create() in this path is now gone in 6.4-rc1, can
>>>>>> you retry that release to see if this is still there or not?
>>>>>
>>>>> No, wait, it's still there, I was looking at a development branch of
>>>>> mine that isn't sent upstream yet.  And syzbot just reported the same
>>>>> thing:
>>>>> 	https://lore.kernel.org/r/00000000000058d15f05fb264013@google.com
>>>>>
>>>>> So something's wrong here, let me dig into it tomorrow when I get a
>>>>> chance...
>>>>
>>>> If this could help, here is the bisect of the bug (I could not discern what
>>>> could possibly be wrong):
>>>>
>>>> user@host:~/linux/kernel/linux_torvalds$ git bisect log
>>>> git bisect start
>>>> # bad: [ac9a78681b921877518763ba0e89202254349d1b] Linux 6.4-rc1
>>>> git bisect bad ac9a78681b921877518763ba0e89202254349d1b
>>>> # good: [c9c3395d5e3dcc6daee66c6908354d47bf98cb0c] Linux 6.2
>>>> git bisect good c9c3395d5e3dcc6daee66c6908354d47bf98cb0c
>>>> # good: [85496c9b3bf8dbe15e2433d3a0197954d323cadc] Merge branch
>>>> 'net-remove-some-rcu_bh-cruft'
>>>> git bisect good 85496c9b3bf8dbe15e2433d3a0197954d323cadc
>>>> # good: [b68ee1c6131c540a62ecd443be89c406401df091] Merge tag 'scsi-misc' of
>>>> git://git.kernel.org/pub/scm/linux/kernel/git/jejb/scsi
>>>> git bisect good b68ee1c6131c540a62ecd443be89c406401df091
>>>> # bad: [888d3c9f7f3ae44101a3fd76528d3dd6f96e9fd0] Merge tag 'sysctl-6.4-rc1'
>>>> of git://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux
>>>> git bisect bad 888d3c9f7f3ae44101a3fd76528d3dd6f96e9fd0
>>>> # good: [34b62f186db9614e55d021f8c58d22fc44c57911] Merge tag
>>>> 'pci-v6.4-changes' of git://git.kernel.org/pub/scm/linux/kernel/git/pci/pci
>>>> git bisect good 34b62f186db9614e55d021f8c58d22fc44c57911
>>>> # good: [34da76dca4673ab1819830b4924bb5b436325b26] Merge tag
>>>> 'for-linus-2023042601' of
>>>> git://git.kernel.org/pub/scm/linux/kernel/git/hid/hid
>>>> git bisect good 34da76dca4673ab1819830b4924bb5b436325b26
>>>> # good: [97b2ff294381d05e59294a931c4db55276470cb5] Merge tag
>>>> 'staging-6.4-rc1' of
>>>> git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging
>>>> git bisect good 97b2ff294381d05e59294a931c4db55276470cb5
>>>> # good: [2025b2ca8004c04861903d076c67a73a0ec6dfca] mcb-lpc: Reallocate
>>>> memory region to avoid memory overlapping
>>>> git bisect good 2025b2ca8004c04861903d076c67a73a0ec6dfca
>>>> # bad: [d06f5a3f7140921ada47d49574ae6fa4de5e2a89] cdx: fix build failure due
>>>> to sysfs 'bus_type' argument needing to be const
>>>> git bisect bad d06f5a3f7140921ada47d49574ae6fa4de5e2a89
>>>> # good: [dcfbb67e48a2becfce7990386e985b9c45098ee5] driver core: class: use
>>>> lock_class_key already present in struct subsys_private
>>>> git bisect good dcfbb67e48a2becfce7990386e985b9c45098ee5
>>>> # bad: [6f14c02220c791d5c46b0f965b9340c58f3d503d] driver core: create
>>>> class_is_registered()
>>>> git bisect bad 6f14c02220c791d5c46b0f965b9340c58f3d503d
>>>> # good: [2f9e87f5a2941b259336c7ea6c5a1499ede4554a] driver core: Add a
>>>> comment to set_primary_fwnode() on nullifying
>>>> git bisect good 2f9e87f5a2941b259336c7ea6c5a1499ede4554a
>>>> # bad: [02fe26f25325b547b7a31a65deb0326c04bb5174] firmware_loader: Add debug
>>>> message with checksum for FW file
>>>> git bisect bad 02fe26f25325b547b7a31a65deb0326c04bb5174
>>>> # good: [884f8ce42ccec9d0bf11d8bf9f111e5961ca1c82] driver core: class:
>>>> implement class_get/put without the private pointer.
>>>> git bisect good 884f8ce42ccec9d0bf11d8bf9f111e5961ca1c82
>>>> # bad: [3f84aa5ec052dba960baca4ab8a352d43d47028e] base: soc: populate
>>>> machine name in soc_device_register if empty
>>>> git bisect bad 3f84aa5ec052dba960baca4ab8a352d43d47028e
>>>> # bad: [7b884b7f24b42fa25e92ed724ad82f137610afaf] driver core: class.c:
>>>> convert to only use class_to_subsys
>>>> git bisect bad 7b884b7f24b42fa25e92ed724ad82f137610afaf
>>>> # first bad commit: [7b884b7f24b42fa25e92ed724ad82f137610afaf] driver core:
>>>> class.c: convert to only use class_to_subsys
>>>> user@host:~/linux/kernel/linux_torvalds$
>>>
>>> This helps a lot, thanks.  I got the reference counting wrong somewhere
>>> in here, I thought I tested this better, odd it shows up now...
>>>
>>> I'll try to work on it this week.
>>
>> I have figured out that the leak occurs on keyboard unplugging only, one
>> or two leaks (maybe a race condition?).
>>
>> Please NOTE that the number of leaks is now odd:
>>
>> root@defiant:/home/marvin# cat /sys/kernel/debug/kmemleak | grep comm
>>    comm "systemd-udevd", pid 330, jiffies 4294892588 (age 715.772s)
>>    comm "systemd-udevd", pid 330, jiffies 4294892588 (age 715.772s)
>>    comm "kworker/6:0", pid 54, jiffies 4294907989 (age 654.224s)
>>    comm "kworker/6:0", pid 54, jiffies 4294907989 (age 654.272s)
>>    comm "kworker/6:3", pid 3046, jiffies 4294935362 (age 544.780s)
>>    comm "kworker/6:0", pid 54, jiffies 4294964122 (age 429.740s)
>>    comm "kworker/6:0", pid 54, jiffies 4294964122 (age 429.784s)
>> root@defiant:/home/marvin#
>>
>> At one time unplugging keyboard generated only one leak, but only at one
>> time. As it requires manually unplugging keyboard, I didn't seem to find a
>> way to automate it, but it doesn't seem to require root access.
>>
>> BTW, I've seen in syzbot output that kmemleak output has debug source file
>> names and line numbers. I couldn't make that work with the dbg .deb.
>>
>> I will do some more homework, but this was a rough week.
> 
> I made up a patch based on code inspection alone, as I couldn't
> reproduce this locally at all:
> 	https://lore.kernel.org/r/2023051628-thumb-boaster-5680@gregkh
> and it seemed to pass syzbot's tests.
> 
> I've included it here below, can you test it as well?
> 
> Hm, I only tested with a USB mouse unplug/plug cycle, maybe the issue is
> a keyboard?
> 
> thanks,
> 
> greg k-h

Hi, Greg,

Yes, the problem was with the keyboard, and with unplugging, mouse unplugged
w/o problems.

I will test the patch in the afternoon, as the issue did not appear on the
work computer. Probably it is for the best that the exact environment is
reproduced for the test.

Best regards,
Mirsad

> -------------
> 
> diff --git a/drivers/base/class.c b/drivers/base/class.c
> index ac1808d1a2e8..9b44edc8416f 100644
> --- a/drivers/base/class.c
> +++ b/drivers/base/class.c
> @@ -320,6 +322,7 @@ void class_dev_iter_init(struct class_dev_iter *iter, const struct class *class,
>   		start_knode = &start->p->knode_class;
>   	klist_iter_init_node(&sp->klist_devices, &iter->ki, start_knode);
>   	iter->type = type;
> +	iter->sp = sp;
>   }
>   EXPORT_SYMBOL_GPL(class_dev_iter_init);
>   
> @@ -361,6 +364,7 @@ EXPORT_SYMBOL_GPL(class_dev_iter_next);
>   void class_dev_iter_exit(struct class_dev_iter *iter)
>   {
>   	klist_iter_exit(&iter->ki);
> +	subsys_put(iter->sp);
>   }
>   EXPORT_SYMBOL_GPL(class_dev_iter_exit);
>   
> diff --git a/include/linux/device/class.h b/include/linux/device/class.h
> index 9deeaeb457bb..abf3d3bfb6fe 100644
> --- a/include/linux/device/class.h
> +++ b/include/linux/device/class.h
> @@ -74,6 +74,7 @@ struct class {
>   struct class_dev_iter {
>   	struct klist_iter		ki;
>   	const struct device_type	*type;
> +	struct subsys_private		*sp;
>   };
>   
>   int __must_check class_register(const struct class *class);

-- 
Mirsad Todorovac
System engineer
Faculty of Graphic Arts | Academy of Fine Arts
University of Zagreb
Republic of Croatia, the European Union

Sistem inženjer
Grafički fakultet | Akademija likovnih umjetnosti
Sveučilište u Zagrebu

