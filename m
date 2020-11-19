Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E84592B96D0
	for <lists+linux-input@lfdr.de>; Thu, 19 Nov 2020 16:53:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728677AbgKSPsH (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 19 Nov 2020 10:48:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:28785 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728642AbgKSPsH (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 19 Nov 2020 10:48:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1605800885;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=e6SJxPdAjcMj1gP0ovBh/1jq5NrmPiJ+D5isIk9VIPQ=;
        b=Ao0DptQXs/73HThGyULz3QIYi3F/XLQhQcw3830+KK0BZKBEZylYRL2jOY7ORvRJyJ1fpI
        7ojp7Y7K5pNfhy8g0oQpWIyCHC/cheMgldE8IiRW1XJoLidGQneYJUuo21wRO+Hq8AjjyY
        zirW8EAG03ASN8SBtX8dD80A8v03UK4=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-510-kbR1536gMciy_x6xj_CkhA-1; Thu, 19 Nov 2020 10:48:03 -0500
X-MC-Unique: kbR1536gMciy_x6xj_CkhA-1
Received: by mail-ed1-f71.google.com with SMTP id bt2so2473772edb.12
        for <linux-input@vger.kernel.org>; Thu, 19 Nov 2020 07:48:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=e6SJxPdAjcMj1gP0ovBh/1jq5NrmPiJ+D5isIk9VIPQ=;
        b=HIHIJeSposuZ71wYEXxnBIhntWenhqlQTbDPDhkPmx+LHP2DIr+tpjatfw6zP9l7NT
         pz/fCju3eBvhDY05Fr7X4RrNpgA85UrsYkQz+J8dadnVtek7DMiVwMnr+8j20tomPufE
         WDXXwhWbhuky83Po2+8CHoPCTl4pYSofumGml3RGEYIJXmYC4V4HNZvCo2JofIn6QXDm
         QRzbdkgIp5Dzz5OqmITU1JbOA+NGeSUO13qtuEslK+H0FWC03kW0P9Rqv7paGhzp530q
         n3roUZewzCfsmFSNAz3W3WAvVyVhmo1REHjamPDimMkMZbP8jgcZj71OFKycBvWDoJO4
         ftXg==
X-Gm-Message-State: AOAM533tDtGwMBP1eIXLAHBjm53pM+CObr9GWDqNcg6FifcjQ/X+hXVU
        H2yrB22rj0Bwr+e+hw6ude/A/u92hZriss58REGIczneHANrq0KmB6t3dyG3boh2GkKGT/bFcyi
        tjjTg1U3NyGOPB+tfUrnuhquGCWdJ0ayEDPWKOAC/z8CYN5+ndj/02oqQfg4Z+eG+QG9eseoG0a
        c=
X-Received: by 2002:a50:b584:: with SMTP id a4mr31574729ede.301.1605800881602;
        Thu, 19 Nov 2020 07:48:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxIlSDdM4HP5PQEVlQawL87Cr908ZEuW1vPjsci/tjZ7y+plkTUfZSWnvXh6AnG4NNKbdUd6A==
X-Received: by 2002:a50:b584:: with SMTP id a4mr31574710ede.301.1605800881369;
        Thu, 19 Nov 2020 07:48:01 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-6c10-fbf3-14c4-884c.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:6c10:fbf3:14c4:884c])
        by smtp.gmail.com with ESMTPSA id w4sm18351ejv.63.2020.11.19.07.48.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2020 07:48:00 -0800 (PST)
Subject: Re: [RFC 0/3] HID: logitech-dj: Dinovo keyboard fixes and
 improvements
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>
References: <20201114212058.19590-1-hdegoede@redhat.com>
 <CAO-hwJJN-1P3XW4i-8R=JBjyFvvyiHK89tN4B7r783LQL1r=sw@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <ae994b5e-ae09-601b-0a61-19988210c072@redhat.com>
Date:   Thu, 19 Nov 2020 16:47:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <CAO-hwJJN-1P3XW4i-8R=JBjyFvvyiHK89tN4B7r783LQL1r=sw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 11/19/20 4:25 PM, Benjamin Tissoires wrote:
> Hi Hans,
> 
> On Sat, Nov 14, 2020 at 10:21 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Hi Benjamin,
>>
>> Here is my patch series for the discussed Dinovo keyboard (receiver)
>> support improvements.
>>
>> I've marked this as a RFC since it has not been tested with a Dinovo Mini
>> (nor a Dinovo Mini receiver) yet.
>>
>> I have tested it extensively with a Dinovo Edge, a MX5000 and a MX5500
>> keyboard. In case of the Dinovo Edge and MX5000 I've not only tested
>> them against their own receiver but also against each-others receiver.
>>
>> Once you have tested this series on your Dinovo Mini, it is ready to
>> go upstream.
> 
> That part is now done, so I guess we can push it upstream :)

Great thank you.

> FTR, the dinovo mini still works fine with this series. I have a weird
> issue where the secondary button gives me a left click, but according
> to the raw logs, this is emitted from the hardware itself and is the
> same whether I am on hid-logitech-dj or not.

A bit offtopic for this thread, but if it is a HID++ 1.0 device, then
you could try setting the HIDPP_QUIRK_HIDPP_EXTRA_MOUSE_BTNS quirk on
it and see if that helps. I've seen several cases with HID++ 1.0 devices
where some keyboard-keys / buttons would not report (or report wrongly)
unless the reporting of them was switched over from the regular HID
input report to the HID++ version of the report.

>> The first patch should probably go to 5.10 as a fix in
>> case someone pairs the Dinovo Mini with a MX5x00 receiver like the
>> reporter of this bug did with his Dinovo Edge:
>> https://bugzilla.redhat.com/show_bug.cgi?id=1811424
> 
> OK, then I can apply it on top of the previous fix. I guess we don't
> need stable@vger.k.o for this one?

Actually this is intended for stable, to avoid getting a repeat of:
https://bugzilla.redhat.com/show_bug.cgi?id=1811424
with a Dinovo Mini. So if you can add a Cc: stable that would be
great.

>> The other 2 are 5.11 material.
> 
> If I have to break the series, I will have to wait for Linus to first
> merge the 5.10 material, then I'll be able to apply the others on
> top...

Ack, that works for me there is no rush to get the other 2 merged.

Regards,

Hans

