Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CD2CE344BD
	for <lists+linux-input@lfdr.de>; Tue,  4 Jun 2019 12:50:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727239AbfFDKuV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 4 Jun 2019 06:50:21 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:32910 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727314AbfFDKuV (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 4 Jun 2019 06:50:21 -0400
Received: by mail-ed1-f65.google.com with SMTP id y17so13276726edr.0
        for <linux-input@vger.kernel.org>; Tue, 04 Jun 2019 03:50:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=GswYLqGRaCoWRXKqTcbui7vFFzTTGq9HoYdg6GrY5ng=;
        b=tzC/HjKSx3UYm1nQtDO6W5I0gDLkvqqx1MoLdII0/wo493uiIMEJfXZOGzFfvTc4rM
         KFznhW+OCRPQkoZWQ+X2wVE6V0jtKHkp3jemrP8/WcWOdTziZi45F5wUklHvkBBgrQ2p
         4dLV9w8n/7wLxVd2+Cg4sa9tkgIIARWVtwqj0OXxl+7I/+2nL2wDagIoIDNSVx1CuYMc
         SznW5RTKZItcMcGyGPPi6KWx+uEwH/3qXLSrypIDt4zAh/HVOXTT3U/1WajA2UpOhWQA
         mKKdlMAsIL5K5hrf2fs8B9stBS2+RL9Dol/qQX2Eo6LwaWPMgWOVH4Gks1fU2uQARQPH
         QkKA==
X-Gm-Message-State: APjAAAVJ7BYWTFfLxAQ0zHDHc0PhCogkH6UTL/p7+DHn9ZcqsSCg/g7R
        Kqw01oMYVDf2NzSX8VEExi4EoQ==
X-Google-Smtp-Source: APXvYqzoDFOet7Lo34yPYlfRGZnQ9ln8w6++jxu3zepHc1RCYOdCNSGhOVydoTfAqDRUOqQD2Zdv0g==
X-Received: by 2002:a05:6402:1701:: with SMTP id y1mr33319483edu.22.1559645419648;
        Tue, 04 Jun 2019 03:50:19 -0700 (PDT)
Received: from shalem.localdomain (84-106-84-65.cable.dynamic.v4.ziggo.nl. [84.106.84.65])
        by smtp.gmail.com with ESMTPSA id y6sm3089886eju.4.2019.06.04.03.50.18
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Tue, 04 Jun 2019 03:50:19 -0700 (PDT)
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
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <ea7b2dee-15a6-9b52-fbff-558c36cd72df@redhat.com>
Date:   Tue, 4 Jun 2019 12:50:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAO-hwJK0j8SottiqCdDseBW_vR=GjKO4YrFCtjzYeUh-eKPOpA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 04-06-19 12:08, Benjamin Tissoires wrote:
> On Tue, Jun 4, 2019 at 9:51 AM Benjamin Tissoires
> <benjamin.tissoires@redhat.com> wrote:
>>
>> On Mon, Jun 3, 2019 at 4:17 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>>
>>> Hi,
>>>
>>> On 03-06-19 15:55, Benjamin Tissoires wrote:
>>>> On Mon, Jun 3, 2019 at 11:51 AM Hans de Goede <hdegoede@redhat.com> wrote:
>>>>>
>>>>> Hi Again,
>>>>>
>>>>> On 03-06-19 11:11, Hans de Goede wrote:
>>>>> <snip>
>>>>>
>>>>>>> not sure about the rest of logitech issues yet) next week.
>>>>>>
>>>>>> The main problem seems to be the request_module patches. Although I also
>>>>
>>>> Can't we use request_module_nowait() instead, and set a reasonable
>>>> timeout that we detect only once to check if userspace is compatible:
>>>>
>>>> In pseudo-code:
>>>> if (!request_module_checked) {
>>>>     request_module_nowait(name);
>>>>     use_request_module = wait_event_timeout(wq,
>>>>           first_module_loaded, 10 seconds in jiffies);
>>>>     request_module_checked = true;
>>>> } else if (use_request_module) {
>>>>     request_module(name);
>>>> }
>>>
>>> Well looking at the just attached dmesg , the modprobe
>>> when triggered by udev from userspace succeeds in about
>>> 0.5 seconds, so it seems that the modprobe hangs happens
>>> when called from within the kernel rather then from within
>>> userspace.
>>>
>>> What I do not know if is the hang is inside userspace, or
>>> maybe it happens when modprobe calls back into the kernel,
>>> if the hang happens when modprobe calls back into the kernel,
>>> then other modprobes (done from udev) likely will hang too
>>> since I think only 1 modprobe can happen at a time.
>>>
>>> I really wish we knew what distinguished working systems
>>> from non working systems :|
>>>
>>> I cannot find a common denominator; other then the systems
>>> are not running Fedora. So far we've reports from both Ubuntu 16.04
>>> and Tumbleweed, so software version wise these 2 are wide apart.
>>
>> I am trying to reproduce the lock locally, and installed an opensuse
>> Tumbleweed in a VM. When forwarding a Unifying receiver to the VM, I
>> do not see the lock with either my vanilla compiled kernel and the rpm
>> found in http://download.opensuse.org/repositories/Kernel:/HEAD/standard/x86_64/
>>
>> Next step is install Tumbleweed on bare metal, but I do not see how
>> this could introduce a difference (maybe USB2 vs 3).
> 
> Making progress here.
> 
> The difference between Ubuntu/Tumbleweed and Fedora: usbhid is shipped
> as a module while in Fedora usbhid is included in the kernel.
> 
> If I rmmod hid_* and usbhid, then modprobe usbhid, the command hangs
> for 3 minutes.
> If usbhid is already loaded, inserting a receiver is immediate
> regarding the loading of the external modules.
> 
> So my assumption is that when the device gets detected at boot, usbhid
> gets loaded by the kernel event, which in turns attempts to call
> __request_module, but the modprobe can't be fulfilled because it's
> already waiting for the initial usbhid modprobe to finish.
> 
> Still don't know how to solve that, but I thought I should share.

Hmm, we may be hitting the scenario described in the big comment
around line 3500 of kernel/module.c.

But I'm not sure that is what is happening here.

Maybe you can put a WARN_ON(1) in request_module and look at the
backtrace ?  That may help to figure out what is going on; or
alternatively it might help to find some way to detect this and
if it happens skip the request_module...

Regards,

Hans
