Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2B69C331DA
	for <lists+linux-input@lfdr.de>; Mon,  3 Jun 2019 16:17:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727650AbfFCOR0 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 3 Jun 2019 10:17:26 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:33102 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726968AbfFCOR0 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 3 Jun 2019 10:17:26 -0400
Received: by mail-ed1-f66.google.com with SMTP id y17so9093906edr.0
        for <linux-input@vger.kernel.org>; Mon, 03 Jun 2019 07:17:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=l4Qv4hFPuG2dV+d37O9UvLJnGAcWEQaTt9nnKVcuDC4=;
        b=f7Ik/L1kfe9HmLFcvPr/jApdHSmTrWhqx+v5oac84bBvgCfRusL60JT/qZ2+jYAvtT
         qDtfd5/0bxzg3d9entcrdczCQYvsSxRxHpCqBmTmo6NXl6RK2KuCEE8NwVvVvyXCzjMq
         eh4GhIbe9VYUIP0xZlEXCqVFnpW5h2QefP6XTo4Y7/W5ukuqFYi3GdvmEzbJR/eETku3
         vAlE7mTPox11KM6mmDzkXolQjmeZNFWRTQ5slAw4mebh/Gzo27wnorJn+GHcHswunsaQ
         2lTbffDZjs5X4dggFailVGE0hlY2s/UMp6siFOOLjkHc6YMOL1MfxL6d1pCigVkwWa0F
         0PLQ==
X-Gm-Message-State: APjAAAW5fmgRnt+WQjFkHRI/5voP8J0jecp2v+rZxpnSTuvhnMPHrhMq
        5LE2gCIyL8uMaT4/4RmG70t82A==
X-Google-Smtp-Source: APXvYqzem7LFUqWkFm7Fpj1PhmAahosRf758chprfstLPBa92BiLRvwKvF2Uk/nu0KWjxDmQnrQH6w==
X-Received: by 2002:aa7:d1c5:: with SMTP id g5mr14135805edp.37.1559571444661;
        Mon, 03 Jun 2019 07:17:24 -0700 (PDT)
Received: from shalem.localdomain (84-106-84-65.cable.dynamic.v4.ziggo.nl. [84.106.84.65])
        by smtp.gmail.com with ESMTPSA id o7sm2602517ejj.88.2019.06.03.07.17.23
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Mon, 03 Jun 2019 07:17:23 -0700 (PDT)
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
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <e431dafc-0fb4-4be3-ac29-dcf125929090@redhat.com>
Date:   Mon, 3 Jun 2019 16:17:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAO-hwJKRRpsShw6B-YLmsEnjQ+iYtz+VmZK+VSRcDmiBwnS+oA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 03-06-19 15:55, Benjamin Tissoires wrote:
> On Mon, Jun 3, 2019 at 11:51 AM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Hi Again,
>>
>> On 03-06-19 11:11, Hans de Goede wrote:
>> <snip>
>>
>>>> not sure about the rest of logitech issues yet) next week.
>>>
>>> The main problem seems to be the request_module patches. Although I also
> 
> Can't we use request_module_nowait() instead, and set a reasonable
> timeout that we detect only once to check if userspace is compatible:
> 
> In pseudo-code:
> if (!request_module_checked) {
>    request_module_nowait(name);
>    use_request_module = wait_event_timeout(wq,
>          first_module_loaded, 10 seconds in jiffies);
>    request_module_checked = true;
> } else if (use_request_module) {
>    request_module(name);
> }

Well looking at the just attached dmesg , the modprobe
when triggered by udev from userspace succeeds in about
0.5 seconds, so it seems that the modprobe hangs happens
when called from within the kernel rather then from within
userspace.

What I do not know if is the hang is inside userspace, or
maybe it happens when modprobe calls back into the kernel,
if the hang happens when modprobe calls back into the kernel,
then other modprobes (done from udev) likely will hang too
since I think only 1 modprobe can happen at a time.

I really wish we knew what distinguished working systems
from non working systems :|

I cannot find a common denominator; other then the systems
are not running Fedora. So far we've reports from both Ubuntu 16.04
and Tumbleweed, so software version wise these 2 are wide apart.

>>> have 2 reports of problems with hid-logitech-dj driving the 0xc52f product-id,
>>> so we may need to drop that product-id from hid-logitech-dj, I'm working on
>>> that one...
>>
>> Besides the modprobe hanging issue, the only other issues all
>> (2 reporters) seem to be with 0xc52f receivers. We have a bug
>> open for this:
>>
>> https://bugzilla.kernel.org/show_bug.cgi?id=203619
>>
>> And I've asked the reporter of the second bug to add his logs
>> to that bug.
> 
> We should likely just remove c52f from the list of supported devices.
> C52f receivers seem to have a different firmware as they are meant to
> work with different devices than C534. So I guess it is safer to not
> handle those right now and get the code in when it is ready.

Ack. Can you prepare a patch to drop the c52f id?

Regards,

Hans


