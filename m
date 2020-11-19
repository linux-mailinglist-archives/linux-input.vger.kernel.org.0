Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF8BB2B9703
	for <lists+linux-input@lfdr.de>; Thu, 19 Nov 2020 16:54:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728963AbgKSPyI (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 19 Nov 2020 10:54:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60859 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727431AbgKSPyI (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 19 Nov 2020 10:54:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1605801246;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=xk6iT52B5KZcmhiAZuaylROKlWfTCtEr1Mst29GNXgI=;
        b=W6/CG3agULQjl5uIUN+ZvYZ0VW8kDC1620aRDY27GVihpz89rU/0EFww6NmXc1InuMyCRL
        7UZWxrbQ1ZiUx81AEbqF5kvlxpxBswqLR+h1H6pxtIdK7RqO4N2n5WUp+gtp7Pb5Q5vgU6
        isZqvbJfMkWKc7ioUuXvzfRnSzmWNN4=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-379-s531LGuxMD-UZR0T_JI_4w-1; Thu, 19 Nov 2020 10:54:04 -0500
X-MC-Unique: s531LGuxMD-UZR0T_JI_4w-1
Received: by mail-ed1-f69.google.com with SMTP id f20so2467837edx.23
        for <linux-input@vger.kernel.org>; Thu, 19 Nov 2020 07:54:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=xk6iT52B5KZcmhiAZuaylROKlWfTCtEr1Mst29GNXgI=;
        b=lnAmcR+Acr9JZyFK3ZWic5Qb9/wnrFc4j5XAs6rXE3UpG/jVWiOzSMEH7ibFiIjEjx
         LJmDqrSboR3teuYJyKDbKa4NrkZ1CDei6SA2SO7BAI6rpHh0O7318wbvaW/SZgul71o7
         VS2ZhEjmtUc7b86WTsz4BFtB8x5c6q3SxHcYNKK6qxwPSg2JpPeFZL4xAaxtogVf6zDO
         Le+WAfR5Zc3+rqlTb3pUV0PjKdCxWb4mcEeqS9FOfhw+wYfDQNzn8s4XmIDVxIgcAn2P
         tChzhZsYFacjQuB6HT1miZDVU8xyG767uN/yqhj02/i6pKeg1sfeXTd0a8WxnLeeKiJD
         tKvg==
X-Gm-Message-State: AOAM532k3G7Q0IOY7IKOIfc89C0y0UVvzqCBBuaHsv+6sGcMgOFrcihl
        wxK1lKkLXmq4rxrugqqJkEVCf3OrQbSyyDu1k3dQqj4i/HL0yLE1SpTRPKw5gafvIKgmRV3PqEx
        lS7jLPVB4PPV625p7JvS1OMJneb1Ryuw0b/4/26rs0Q5aYw1CG6HeI0OS/+Vgc+tXFY83oaJAAK
        U=
X-Received: by 2002:a17:906:d8c9:: with SMTP id re9mr3723550ejb.266.1605801242758;
        Thu, 19 Nov 2020 07:54:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy1BX2RTTK27vHgLLgX7gAwm52p+z2RoGygy0+KPgyyU8smeAguy1Ju2SRBuXLbswKISIaahw==
X-Received: by 2002:a17:906:d8c9:: with SMTP id re9mr3723525ejb.266.1605801242494;
        Thu, 19 Nov 2020 07:54:02 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-6c10-fbf3-14c4-884c.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:6c10:fbf3:14c4:884c])
        by smtp.gmail.com with ESMTPSA id by8sm15579861edb.49.2020.11.19.07.54.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2020 07:54:01 -0800 (PST)
Subject: Re: [RFC 0/3] HID: logitech-dj: Dinovo keyboard fixes and
 improvements
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>
References: <20201114212058.19590-1-hdegoede@redhat.com>
 <CAO-hwJJN-1P3XW4i-8R=JBjyFvvyiHK89tN4B7r783LQL1r=sw@mail.gmail.com>
 <ae994b5e-ae09-601b-0a61-19988210c072@redhat.com>
 <CAO-hwJ+CtAKiH7da7TAFOkTELp4aNsJz4nNSQ2DV+pFKqx9GvQ@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <022fac63-71e4-c0cd-e454-2a53d7e8ad85@redhat.com>
Date:   Thu, 19 Nov 2020 16:54:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <CAO-hwJ+CtAKiH7da7TAFOkTELp4aNsJz4nNSQ2DV+pFKqx9GvQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 11/19/20 4:52 PM, Benjamin Tissoires wrote:
> On Thu, Nov 19, 2020 at 4:48 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Hi,
>>
>> On 11/19/20 4:25 PM, Benjamin Tissoires wrote:
>>> Hi Hans,
>>>
>>> On Sat, Nov 14, 2020 at 10:21 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>>>
>>>> Hi Benjamin,
>>>>
>>>> Here is my patch series for the discussed Dinovo keyboard (receiver)
>>>> support improvements.
>>>>
>>>> I've marked this as a RFC since it has not been tested with a Dinovo Mini
>>>> (nor a Dinovo Mini receiver) yet.
>>>>
>>>> I have tested it extensively with a Dinovo Edge, a MX5000 and a MX5500
>>>> keyboard. In case of the Dinovo Edge and MX5000 I've not only tested
>>>> them against their own receiver but also against each-others receiver.
>>>>
>>>> Once you have tested this series on your Dinovo Mini, it is ready to
>>>> go upstream.
>>>
>>> That part is now done, so I guess we can push it upstream :)
>>
>> Great thank you.
>>
>>> FTR, the dinovo mini still works fine with this series. I have a weird
>>> issue where the secondary button gives me a left click, but according
>>> to the raw logs, this is emitted from the hardware itself and is the
>>> same whether I am on hid-logitech-dj or not.
>>
>> A bit offtopic for this thread, but if it is a HID++ 1.0 device, then
>> you could try setting the HIDPP_QUIRK_HIDPP_EXTRA_MOUSE_BTNS quirk on
>> it and see if that helps. I've seen several cases with HID++ 1.0 devices
>> where some keyboard-keys / buttons would not report (or report wrongly)
>> unless the reporting of them was switched over from the regular HID
>> input report to the HID++ version of the report.
> 
> I'll have to test this, yes. Thanks.
> 
>>
>>>> The first patch should probably go to 5.10 as a fix in
>>>> case someone pairs the Dinovo Mini with a MX5x00 receiver like the
>>>> reporter of this bug did with his Dinovo Edge:
>>>> https://bugzilla.redhat.com/show_bug.cgi?id=1811424
>>>
>>> OK, then I can apply it on top of the previous fix. I guess we don't
>>> need stable@vger.k.o for this one?
>>
>> Actually this is intended for stable, to avoid getting a repeat of:
>> https://bugzilla.redhat.com/show_bug.cgi?id=1811424
>> with a Dinovo Mini. So if you can add a Cc: stable that would be
>> great.
>>
> 
> Oops, I have already pushed it without the tag. I guess we can always
> request it later...

No problem, the Fixes tag which it has alone should be enough for it to get
picked into the stable series.

Regards,

Hans

