Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6BC4B32CEE
	for <lists+linux-input@lfdr.de>; Mon,  3 Jun 2019 11:32:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727989AbfFCJcP (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 3 Jun 2019 05:32:15 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:35791 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726843AbfFCJcO (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 3 Jun 2019 05:32:14 -0400
Received: by mail-ed1-f66.google.com with SMTP id p26so26048588edr.2
        for <linux-input@vger.kernel.org>; Mon, 03 Jun 2019 02:32:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=5MuUwNLcPfT/+zATBH4u9dUs0Z1WXWpu06xsQGxzqoY=;
        b=TN8GZaVrmVtTiNL/p0B0Wsv5SHZw30C+6ccD06honbDZZScJxYqeTZbR9aCXp0vHbQ
         twSDVF+L481qJn/4/InQPcLktfWZ33oIIo0rxqX4XiEk8RcnYmW4C6k7wuVLKcxKLQ2e
         LvuWKeVobR6/vx423IlgijzbFa+D6tjhC6fUbMahq8CQUDMG3KG6LTkb6vuRQHgfu4BU
         Kl3xBYYGVuC/0r4K5LmaAwHyfSkaYxBRAMn+xX9Db70FLoJnH4nlLio1cOjfbLxGVqEI
         SsWzE1/Bc4k9sGnJX2wO2QvGKeBiZbSUuBqKyZ4EYj1rpu4OZL0MZEW5potkV3J+1/R+
         ZbKA==
X-Gm-Message-State: APjAAAV05sFAH+uggQNdzGlalMkR7LGW5t7qqS4aTYPZHs6MqQ0mAIqa
        usTDNg7zy3p1zxXw60zuQZHqqA==
X-Google-Smtp-Source: APXvYqzPLI+BhjrCwqu59zzJGO7teaba6zJ0gAKWLOiqpf18XHKqh7nGwqSw2w3RyWK/gNr6AyETRQ==
X-Received: by 2002:aa7:d342:: with SMTP id m2mr27474197edr.111.1559554333155;
        Mon, 03 Jun 2019 02:32:13 -0700 (PDT)
Received: from shalem.localdomain (84-106-84-65.cable.dynamic.v4.ziggo.nl. [84.106.84.65])
        by smtp.gmail.com with ESMTPSA id h23sm2513270ejc.34.2019.06.03.02.32.12
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Mon, 03 Jun 2019 02:32:12 -0700 (PDT)
Subject: Re: hid-related 5.2-rc1 boot hang
From:   Hans de Goede <hdegoede@redhat.com>
To:     Jiri Kosina <jikos@kernel.org>, Dave Hansen <dave.hansen@intel.com>
Cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
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
Message-ID: <e602db44-c792-1abe-e389-a71fca6d2ddd@redhat.com>
Date:   Mon, 3 Jun 2019 11:32:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <e158d983-1e7e-4c49-aaab-ff2092d36438@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 03-06-19 11:11, Hans de Goede wrote:
> Hi,
> 
> On 01-06-19 00:15, Jiri Kosina wrote:
>> On Thu, 30 May 2019, Dave Hansen wrote:
>>
>>> On 5/29/19 2:17 AM, Hans de Goede wrote:
>>> ...
>>>> Dave, can you try building your initrd without the hid-logitech-dj module
>>>> included in the initrd?
>>>
>>> I did this on a vanilla 5.2-rc2 kernel (without the reverts) and still
>>> experienced the boot hang while the device was inserted.
>>>
>>>> Also can you check if your modprobe is provided by module-init-tools
>>>> or by kmod ?
>>>
>>> $ dpkg -S `which modprobe`
>>> kmod: /sbin/modprobe
>>
>> Benjamin, Hans, are you looking into this?
> 
> Not really, I cannot reproduce the request_module problem. I was hoping some
> of the info from Dave would help to pinpoint it, but it does not :|
> 
>> If not, I think we should start reverting (at least the request_module()
>> changes
> 
> I agree we need to do something about the request_module changes.
> 
> I myself was thinking about somehow making them conditional, e.g. we
> could add a (temporary) module option defaulting to false for this
> while we investigate further.
> 
> I'm afraid that if we just revert we will never find the root cause and then
> we will be stuck with the suboptimal behavior of first the generic hid driver
> binding followed by a unbind + bind of the new driver shortly afterwards,
> which also leads to a ton of udev events being fired to userspace (well I
> guess this does make for a good stress test of the userspace hotplug code).

Quick update, we have another report of module-loading related problems
which are likely related:

https://bugzilla.kernel.org/show_bug.cgi?id=203741

In this case there is no hang, instead there is a 1 to 3 minute delay.

Regards,

Hans

