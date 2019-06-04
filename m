Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D9D37347C2
	for <lists+linux-input@lfdr.de>; Tue,  4 Jun 2019 15:12:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727321AbfFDNMQ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 4 Jun 2019 09:12:16 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:38261 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727093AbfFDNMP (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 4 Jun 2019 09:12:15 -0400
Received: by mail-ed1-f66.google.com with SMTP id g13so420463edu.5
        for <linux-input@vger.kernel.org>; Tue, 04 Jun 2019 06:12:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Uq9U/33yERqkLV58+pdTJVPrMvra1G2m/7gDLl0eoH4=;
        b=lG8RBBCKSrlu5xPjQSfJk4uXF84z23I7EL7OZqmhPJp6uIXCKZZfJbUzpTfmDYHaqu
         qYT3H20tR0b5L0ipuiJYW3snwKnmMrZm182qGIKUJw5K93rguVCb1Zfl62Yj3QuS8WXF
         HIiW+yPqFjR3af4FVMTql/SE8iv6VHpB5HYA6mAGPyntpYaepFldK/G+gaN8Og72GDiW
         SqRmnUtqLHI0xK0O+qeM7uIfQbZZKJYSoOuOiu3qFQgV0npLvjiMzP3nsWCDSjyh24ru
         lRWoU/flLjXYBrinjg+LvyXReAMT6cLJ4F6i2/3a5hcH+g//QJU/SEyyTjykbK8a7+mE
         uaEg==
X-Gm-Message-State: APjAAAW0ljVo78OjzSZgnZ1/LL9Io+cmPYlgzXScXFGeTudnuLPow9/2
        BtVkzEwc4piLIq5RSChKrrT7eg==
X-Google-Smtp-Source: APXvYqzweD/Ucaq1m/S+CFg2rqiCMBkALV7cC+mIIn2DpK+XmQfvHIHyDaqvHcQsSVz5mMP+5v5BgA==
X-Received: by 2002:aa7:d144:: with SMTP id r4mr35764572edo.87.1559653933136;
        Tue, 04 Jun 2019 06:12:13 -0700 (PDT)
Received: from shalem.localdomain (84-106-84-65.cable.dynamic.v4.ziggo.nl. [84.106.84.65])
        by smtp.gmail.com with ESMTPSA id w7sm1242111ejn.92.2019.06.04.06.12.12
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Tue, 04 Jun 2019 06:12:12 -0700 (PDT)
Subject: Re: hid-related 5.2-rc1 boot hang
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Dave Hansen <dave.hansen@intel.com>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
References: <2c1684f6-9def-93dc-54ab-888142fd5e71@intel.com>
 <nycvar.YFH.7.76.1905281913140.1962@cbobk.fhfr.pm>
 <CAO-hwJJzNAuFbdMVFZ4+h7J=bh6QHr_MioyK2yTV=M5R6CTm=A@mail.gmail.com>
 <8a17e6e2-b468-28fd-5b40-0c258ca7efa9@intel.com>
 <4689a737-6c40-b4ae-cc38-5df60318adce@redhat.com>
 <a349dfac-be58-93bd-e44c-080ed935ab06@intel.com>
 <nycvar.YFH.7.76.1906010014150.1962@cbobk.fhfr.pm>
 <e158d983-1e7e-4c49-aaab-ff2092d36438@redhat.com>
 <5471f010-cb42-c548-37e2-2b9c9eba1184@redhat.com>
 <CAO-hwJKRRpsShw6B-YLmsEnjQ+iYtz+VmZK+VSRcDmiBwnS+oA@mail.gmail.com>
 <e431dafc-0fb4-4be3-ac29-dcf125929090@redhat.com>
 <CAO-hwJ+5UYJMnuCS0UL4g45Xc181LraAzc-CMuYB2rcqKGe_Sw@mail.gmail.com>
 <CAO-hwJK0j8SottiqCdDseBW_vR=GjKO4YrFCtjzYeUh-eKPOpA@mail.gmail.com>
 <ea7b2dee-15a6-9b52-fbff-558c36cd72df@redhat.com>
 <CAO-hwJ+ZBuXtuk+i1Q9DwO=uLXDh4oToQyMWhK-8t+ZTS-jUjA@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <e34af7b4-4689-d9d8-fb93-eff177b75409@redhat.com>
Date:   Tue, 4 Jun 2019 15:12:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAO-hwJ+ZBuXtuk+i1Q9DwO=uLXDh4oToQyMWhK-8t+ZTS-jUjA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 04-06-19 14:25, Benjamin Tissoires wrote:
> On Tue, Jun 4, 2019 at 12:50 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Hi,
>>
>> On 04-06-19 12:08, Benjamin Tissoires wrote:
>>> On Tue, Jun 4, 2019 at 9:51 AM Benjamin Tissoires
>>> <benjamin.tissoires@redhat.com> wrote:
>>>>
>>>> On Mon, Jun 3, 2019 at 4:17 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>>>>
>>>>> Hi,
>>>>>
>>>>> On 03-06-19 15:55, Benjamin Tissoires wrote:
>>>>>> On Mon, Jun 3, 2019 at 11:51 AM Hans de Goede <hdegoede@redhat.com> wrote:
>>>>>>>
>>>>>>> Hi Again,
>>>>>>>
>>>>>>> On 03-06-19 11:11, Hans de Goede wrote:
>>>>>>> <snip>
>>>>>>>
>>>>>>>>> not sure about the rest of logitech issues yet) next week.
>>>>>>>>
>>>>>>>> The main problem seems to be the request_module patches. Although I also
>>>>>>
>>>>>> Can't we use request_module_nowait() instead, and set a reasonable
>>>>>> timeout that we detect only once to check if userspace is compatible:
>>>>>>
>>>>>> In pseudo-code:
>>>>>> if (!request_module_checked) {
>>>>>>      request_module_nowait(name);
>>>>>>      use_request_module = wait_event_timeout(wq,
>>>>>>            first_module_loaded, 10 seconds in jiffies);
>>>>>>      request_module_checked = true;
>>>>>> } else if (use_request_module) {
>>>>>>      request_module(name);
>>>>>> }
>>>>>
>>>>> Well looking at the just attached dmesg , the modprobe
>>>>> when triggered by udev from userspace succeeds in about
>>>>> 0.5 seconds, so it seems that the modprobe hangs happens
>>>>> when called from within the kernel rather then from within
>>>>> userspace.
>>>>>
>>>>> What I do not know if is the hang is inside userspace, or
>>>>> maybe it happens when modprobe calls back into the kernel,
>>>>> if the hang happens when modprobe calls back into the kernel,
>>>>> then other modprobes (done from udev) likely will hang too
>>>>> since I think only 1 modprobe can happen at a time.
>>>>>
>>>>> I really wish we knew what distinguished working systems
>>>>> from non working systems :|
>>>>>
>>>>> I cannot find a common denominator; other then the systems
>>>>> are not running Fedora. So far we've reports from both Ubuntu 16.04
>>>>> and Tumbleweed, so software version wise these 2 are wide apart.
>>>>
>>>> I am trying to reproduce the lock locally, and installed an opensuse
>>>> Tumbleweed in a VM. When forwarding a Unifying receiver to the VM, I
>>>> do not see the lock with either my vanilla compiled kernel and the rpm
>>>> found in http://download.opensuse.org/repositories/Kernel:/HEAD/standard/x86_64/
>>>>
>>>> Next step is install Tumbleweed on bare metal, but I do not see how
>>>> this could introduce a difference (maybe USB2 vs 3).
>>>
>>> Making progress here.
>>>
>>> The difference between Ubuntu/Tumbleweed and Fedora: usbhid is shipped
>>> as a module while in Fedora usbhid is included in the kernel.
>>>
>>> If I rmmod hid_* and usbhid, then modprobe usbhid, the command hangs
>>> for 3 minutes.
>>> If usbhid is already loaded, inserting a receiver is immediate
>>> regarding the loading of the external modules.
>>>
>>> So my assumption is that when the device gets detected at boot, usbhid
>>> gets loaded by the kernel event, which in turns attempts to call
>>> __request_module, but the modprobe can't be fulfilled because it's
>>> already waiting for the initial usbhid modprobe to finish.
>>>
>>> Still don't know how to solve that, but I thought I should share.
>>
>> Hmm, we may be hitting the scenario described in the big comment
>> around line 3500 of kernel/module.c.
> 
> Well, we are not locking during do_init_module(), but in waiting for
> the completion of request_module(). So as I read the trace, we wait
> for userspace to call/terminate modprobe.
> 
>>
>> But I'm not sure that is what is happening here.
>>
>> Maybe you can put a WARN_ON(1) in request_module and look at the
>> backtrace ?  That may help to figure out what is going on; or
>> alternatively it might help to find some way to detect this and
>> if it happens skip the request_module...
> 
> Ftrace is much easier to deal with:
> ---
> /sys/kernel/debug/tracing # cat trace
> # tracer: function
> #
> # entries-in-buffer/entries-written: 4/4   #P:4
> #
> #                              _-----=> irqs-off
> #                             / _----=> need-resched
> #                            | / _---=> hardirq/softirq
> #                            || / _--=> preempt-depth
> #                            ||| /     delay
> #           TASK-PID   CPU#  ||||    TIMESTAMP  FUNCTION
> #              | |       |   ||||       |         |
>          modprobe-23236 [003] ....  9191.880917: __request_module
> <-hid_add_device
>          modprobe-23236 [003] ....  9191.880937: <stack trace>
>   => 0xffffffffc0851061
>   => __request_module
>   => hid_add_device
>   => usbhid_probe
>   => usb_probe_interface
>   => really_probe
>   => driver_probe_device
>   => device_driver_attach
>   => __driver_attach
>   => bus_for_each_dev
>   => bus_add_driver
>   => driver_register
>   => usb_register_driver
>   => hid_init
>   => do_one_initcall
>   => do_init_module
>   => load_module
>   => __do_sys_finit_module
>   => do_syscall_64
>   => entry_SYSCALL_64_after_hwframe
>          modprobe-23236 [003] ....  9191.892765: __request_module
> <-hid_add_device
>          modprobe-23236 [003] ....  9191.892784: <stack trace>
>   => 0xffffffffc0851061
>   => __request_module
>   => hid_add_device
>   => usbhid_probe
>   => usb_probe_interface
>   => really_probe
>   => driver_probe_device
>   => device_driver_attach
>   => __driver_attach
>   => bus_for_each_dev
>   => bus_add_driver
>   => driver_register
>   => usb_register_driver
>   => hid_init
>   => do_one_initcall
>   => do_init_module
>   => load_module
>   => __do_sys_finit_module
>   => do_syscall_64
>   => entry_SYSCALL_64_after_hwframe
> ---
> 
> This is what happen with the logitech receiver plugged in and while
> modprobing usbhid. The modprobe command hangs, and I took the trace
> here.
> If I hit Ctrl-C, the modprobe loading continue properly.
> 
> There is nothing special here in the stack trace, except that there
> are 2 calls to request_module here (one for the touchscreen I guess
> and one for the logitech receiver).
> 
> I have attached the call graph of the same sequence:
> wait_for_completion_killable() seems to be the culprit, we are waiting
> for userspace to notify it has done calling modprobe.
> 
> My idea would be to defer any call to hid_add_device() into a
> workqueue and see if that unlocks the situation.

Yes that is probably a good solution. When the first bug reports came
in I was thinking that the nested hid_add_device calls from hid-logitech-dj
calling hid_add_device() were the problem, but those are already deferred
to a workqueue so those are not really nested.

Looking at various callers if hid_add_device, if we always defer, we also
need the caller to give a callback to call on add_device error, which would
then be used to free various resources related to the hid device.

If me make hid_add_device itself always defer, I guess we may want a non
deferred version of hid_add_device for the hid_add_device calls in
hid-logitech-dj.

In essence we are dealing with nested hid_add_device calls here right?

So another solution would be to have an atomic counter and call
atomic_long_inc_return on it before the hid_add_device and then if its
previous value was not 0, skip the request_module ?
This does mean though that we then may get inconsistent behavior if
2 unrelated hid_add_device-s are racing with each-other :|

Regards,

Hans
