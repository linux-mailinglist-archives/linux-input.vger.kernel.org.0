Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26D6945077D
	for <lists+linux-input@lfdr.de>; Mon, 15 Nov 2021 15:49:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231594AbhKOOwH (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 15 Nov 2021 09:52:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232166AbhKOOwE (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 15 Nov 2021 09:52:04 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F2F8C061714;
        Mon, 15 Nov 2021 06:49:03 -0800 (PST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: andrzej.p)
        with ESMTPSA id B2D361F44CEF
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
        t=1636987742; bh=JorIZ5hhzSrh5qFWXEzqB7ZLaVuUqeQfg7BJ8jnsGZQ=;
        h=Subject:From:To:Cc:References:Date:In-Reply-To:From;
        b=f+a0vSycNMq8ZJhvvn4mWrlUAidtpOt6F7NmeqLbZefJoWUY27QN3/hp7vNEm6icl
         5SqS/HZdv+zS/tTol/Espj+cXcvc+SX4exTV5F9hsAvgYUrEPZjdYk3tgMJ10yOQku
         w2AM87zjsDverTk4qCxyqjkD0QtPr+O4Km6IQ8cbSH+P6fAIv+YkIUbAK9QH5UvsHJ
         0VN01UrsZ/N0gG8YXHx4qETXPOc5p9NiFFZNXJ+rMpfRngatVJxSCxVTPC1G0l8ujO
         FoZofm6fxwOORXl1UCjMgo4tqt6fAiQfrCtc2ac5RKb94kMEqmQdEdyixX+CTePEOF
         dUtejiVhlNcYA==
Subject: Re: [RFC] tty/sysrq: Add alternative SysRq key
From:   Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     "Maciej W. Rozycki" <macro@orcam.me.uk>,
        Pavel Machek <pavel@ucw.cz>, linux-kernel@vger.kernel.org,
        linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jiri Slaby <jirislaby@kernel.org>, kernel@collabora.com
References: <20211103155438.11167-1-andrzej.p@collabora.com>
 <20211104120111.GB23122@duo.ucw.cz>
 <17ccc35d-441c-70c1-a80a-28a4ff824535@collabora.com>
 <alpine.DEB.2.21.2111041227510.57165@angie.orcam.me.uk>
 <alpine.DEB.2.21.2111041311260.57165@angie.orcam.me.uk>
 <9fbe062a-2992-0361-e72a-f2b1523143dd@collabora.com>
 <b3a917ef-8a70-80b6-8c79-48ce4628b9e8@collabora.com>
 <YYUxNaDG0DquQvke@kroah.com>
 <bec3ea81-4084-02ab-d26d-7215296cf2ee@collabora.com>
Message-ID: <cfb67d0e-99d9-3dc9-f0fe-3a1b90b3c3b0@collabora.com>
Date:   Mon, 15 Nov 2021 15:48:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <bec3ea81-4084-02ab-d26d-7215296cf2ee@collabora.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Jiri, Greg,


W dniu 05.11.2021 o 15:06, Andrzej Pietrasiewicz pisze:
> Hi Greg,
> 
> W dniu 05.11.2021 o 14:27, Greg Kroah-Hartman pisze:
>> On Fri, Nov 05, 2021 at 02:01:23PM +0100, Andrzej Pietrasiewicz wrote:
>>> Hi,
>>>
>>> W dniu 04.11.2021 o 15:17, Andrzej Pietrasiewicz pisze:
>>>> Hi Maciej,
>>>>
>>>> W dniu 04.11.2021 o 14:13, Maciej W. Rozycki pisze:
>>>>> On Thu, 4 Nov 2021, Maciej W. Rozycki wrote:
>>>>>
>>>>>>    The reason for this is with their more recent laptops Lenovo in their
>>>>>> infinite wisdom have placed the <PrintScreen> key (which in a traditional
>>>>>> PS/2-keyboard manner produces <SysRq> when combined with <Alt>) in their
>>>>>> keyboards between the right <Alt> and <Ctrl> keys.  With thumbs not being
>>>>>> as accurate as other fingers (and the overall misdesign of the keyboard
>>>>>> and touchpad interface) you can imagine how often I have inadvertently hit
>>>>>> <SysRq> combined with a letter key, wreaking havoc to my system (and of
>>>>>> course I want to keep the key enabled for times when I do need it).
>>>>>
>>>>>    On second thoughts this can be disabled with `setkeycodes 54 0' once we
>>>>> do have an alternative combination available.
>>>>>
>>>>
>>>> Doesn't `setkeycodes` affect only one keyboard? What if there are more
>>>> keyboards connected to a machine?
>>>>
>>>>   From drivers/tty/vt/keyboard.c:
>>>>
>>>> /*
>>>>    * Translation of scancodes to keycodes. We set them on only the first
>>>>    * keyboard in the list that accepts the scancode and keycode.
>>>>    * Explanation for not choosing the first attached keyboard anymore:
>>>>    *  USB keyboards for example have two event devices: one for all "normal"
>>>>    *  keys and one for extra function keys (like "volume up", "make coffee",
>>>>    *  etc.). So this means that scancodes for the extra function keys won't
>>>>    *  be valid for the first event device, but will be for the second.
>>>>    */
>>>>
>>>
>>> My second thoughts: if we run `setkeycodes` to map, say, F10 as SysRq,
>>> don't we lose F10?
>>
>> The fact that this patch adds a "new" sysrq key no matter what is a
>> non-starter, please think through the consequences of such a change...
>>
> 
> I wouldn't say this RFC adds a "new" sysrq no matter what. It does so only
> when the input device (keyboard) does _not_ have SysRq key at all. So I would
> say that this patch adds a replacement SysRq key if the SysRq key proper is
> _physically_ absent. Which seems not such a bad thing to me. The problem I'm
> trying to solve is exactly this: what to use as SysRq if there's no SysRq?
> 

What approach is acceptable then? Any criteria other than "go guess"?
Is "connect an external keyboard" the _only_ choice Linux wants to offer
to its users in case of devices such as e.g. Chromebooks?

Regards,

Andrzej
