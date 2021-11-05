Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7950D4463B8
	for <lists+linux-input@lfdr.de>; Fri,  5 Nov 2021 14:01:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229581AbhKENEJ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 5 Nov 2021 09:04:09 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:39048 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229529AbhKENEI (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 5 Nov 2021 09:04:08 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: andrzej.p)
        with ESMTPSA id AB1B21F463C4
Subject: Re: [RFC] tty/sysrq: Add alternative SysRq key
From:   Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To:     "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc:     Pavel Machek <pavel@ucw.cz>, linux-kernel@vger.kernel.org,
        linux-input@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jiri Slaby <jirislaby@kernel.org>, kernel@collabora.com
References: <20211103155438.11167-1-andrzej.p@collabora.com>
 <20211104120111.GB23122@duo.ucw.cz>
 <17ccc35d-441c-70c1-a80a-28a4ff824535@collabora.com>
 <alpine.DEB.2.21.2111041227510.57165@angie.orcam.me.uk>
 <alpine.DEB.2.21.2111041311260.57165@angie.orcam.me.uk>
 <9fbe062a-2992-0361-e72a-f2b1523143dd@collabora.com>
Message-ID: <b3a917ef-8a70-80b6-8c79-48ce4628b9e8@collabora.com>
Date:   Fri, 5 Nov 2021 14:01:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <9fbe062a-2992-0361-e72a-f2b1523143dd@collabora.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

W dniu 04.11.2021 o 15:17, Andrzej Pietrasiewicz pisze:
> Hi Maciej,
> 
> W dniu 04.11.2021 o 14:13, Maciej W. Rozycki pisze:
>> On Thu, 4 Nov 2021, Maciej W. Rozycki wrote:
>>
>>>   The reason for this is with their more recent laptops Lenovo in their
>>> infinite wisdom have placed the <PrintScreen> key (which in a traditional
>>> PS/2-keyboard manner produces <SysRq> when combined with <Alt>) in their
>>> keyboards between the right <Alt> and <Ctrl> keys.  With thumbs not being
>>> as accurate as other fingers (and the overall misdesign of the keyboard
>>> and touchpad interface) you can imagine how often I have inadvertently hit
>>> <SysRq> combined with a letter key, wreaking havoc to my system (and of
>>> course I want to keep the key enabled for times when I do need it).
>>
>>   On second thoughts this can be disabled with `setkeycodes 54 0' once we
>> do have an alternative combination available.
>>
> 
> Doesn't `setkeycodes` affect only one keyboard? What if there are more
> keyboards connected to a machine?
> 
>  From drivers/tty/vt/keyboard.c:
> 
> /*
>   * Translation of scancodes to keycodes. We set them on only the first
>   * keyboard in the list that accepts the scancode and keycode.
>   * Explanation for not choosing the first attached keyboard anymore:
>   *  USB keyboards for example have two event devices: one for all "normal"
>   *  keys and one for extra function keys (like "volume up", "make coffee",
>   *  etc.). So this means that scancodes for the extra function keys won't
>   *  be valid for the first event device, but will be for the second.
>   */
> 

My second thoughts: if we run `setkeycodes` to map, say, F10 as SysRq,
don't we lose F10?

Andrzej
