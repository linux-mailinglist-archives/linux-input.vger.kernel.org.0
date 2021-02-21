Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BAF2B320A17
	for <lists+linux-input@lfdr.de>; Sun, 21 Feb 2021 12:52:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229663AbhBULwJ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 21 Feb 2021 06:52:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:48034 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229588AbhBULwI (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 21 Feb 2021 06:52:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1613908241;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=jgCQbyaSpGwLluTeb18lM62zxVjI73hVLsgRJVJXLug=;
        b=b7bWm4S5z6jNA5hWWtLuf2IS/hRackfhNpbkn8dzYUOsMsptM07dafAKxXWBDNOYZ3t7fJ
        6uWKQkthc8pby1dfNyy6beM1vsLUm/FZ4hJGTED2Cd+cQkvpPmZd3+aKJeaf916M7A9XUY
        m67/hPaIK1wBPoVqQCuruzMi0V4bMuw=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-488-GGISX6l5Pg-wTCtEuKJEJw-1; Sun, 21 Feb 2021 06:50:38 -0500
X-MC-Unique: GGISX6l5Pg-wTCtEuKJEJw-1
Received: by mail-ed1-f70.google.com with SMTP id s26so368919edq.18
        for <linux-input@vger.kernel.org>; Sun, 21 Feb 2021 03:50:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=jgCQbyaSpGwLluTeb18lM62zxVjI73hVLsgRJVJXLug=;
        b=TzsL71z7hCAlk1/YSsrtDl+8IocnddhfJu5nzC0VehTazrVt73xj4qfGsnzCbsKgeP
         57rtcPKDbqAkwZPVsJOyIz5J61+xChSqL5q5okcBcIoFuaOPtrS2C5F/wHAxxnkuWBpm
         NHTSiBxxDbqfVSw7zmdh1xz3M0qYc+GPOwQkLJwPPxYsCYF+ov8s8FH1LIg5PdyevG9u
         VoiE6pmmvuCTRu3HXy71mMczlFJcDtC9qymzcCmJNRUFx101FumHdfmLegR/ayHTIJUT
         K8yS/NlPi3flLoWauCp5t+NHTrLc2Ep2LumAGru63AqUWkjNpSN1MQE8b3Scy6jJre2U
         yqzQ==
X-Gm-Message-State: AOAM530e32GRboFjt03Xwg0f48CtbhGTlo7zrNyWfg8OfAGOsnLtyWif
        ij1pqFqCdUJoMsEFyxH/sX8xZowLg3e08T2CnBj+v6ZRddwlNGOa9uKbvHTk4mi7ut4JMNeuz/O
        /OgotmW8iFpqNL4rh08LhDN8=
X-Received: by 2002:aa7:d816:: with SMTP id v22mr17886154edq.37.1613908237522;
        Sun, 21 Feb 2021 03:50:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyCQ5xa5fIDUIdrNFiE2kRAnv2Khft/3B2DEwC6WuT0v0kqp1yXv8Ti18Y1Ss0wALh00SFtmQ==
X-Received: by 2002:aa7:d816:: with SMTP id v22mr17886145edq.37.1613908237387;
        Sun, 21 Feb 2021 03:50:37 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id k5sm5495258eja.70.2021.02.21.03.50.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Feb 2021 03:50:37 -0800 (PST)
Subject: Re: [PATCH v2 6/7] HID: lenovo: Map mic-mute button to KEY_F20
 instead of KEY_MICMUTE
To:     =?UTF-8?Q?Marek_Beh=c3=ban?= <kabel@kernel.org>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, linux-leds@vger.kernel.org
References: <20210220122438.21857-1-hdegoede@redhat.com>
 <20210220122438.21857-7-hdegoede@redhat.com> <20210221024225.4310028d@nic.cz>
 <5bda52b5-0f6e-8bce-e53c-108081da87ee@redhat.com>
 <20210221123722.5446fc13@kernel.org>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <6802bf7d-03dd-b51c-b0c6-3955dc137456@redhat.com>
Date:   Sun, 21 Feb 2021 12:50:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210221123722.5446fc13@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 2/21/21 12:37 PM, Marek Behún wrote:
> On Sun, 21 Feb 2021 11:42:16 +0100
> Hans de Goede <hdegoede@redhat.com> wrote:
> 
>> Hi,
>>
>> On 2/21/21 2:42 AM, Marek Behun wrote:
>>> On Sat, 20 Feb 2021 13:24:37 +0100
>>> Hans de Goede <hdegoede@redhat.com> wrote:
>>>   
>>>> Mapping the mic-mute button to KEY_MICMUTE is technically correct but
>>>> KEY_MICMUTE translates to a scancode of 256 (248 + 8) under X,
>>>> which does not fit in 8 bits, so it does not work.  
>>>
>>> Why does it need to fit 8 bits? Where is the problem?  
>>
>> As the commit message says, "under X" aka X11 / Xorg. This is a well known
>> limitation of the X11 input stack / of XKB *as implemented in X11*
>> the Wayland input stack does not have this limitations and does allow
>> using raw key-codes >= 248.
>>
>> If you look at e.g. :
>> https://github.com/systemd/systemd/blob/main/hwdb.d/60-keyboard.hwdb
>>
>> Which (mostly) maps custom PS/2 scancodes used for some "media" keys
>> on laptops to linux evdev KEY_FOO codes, then you will see that there
>> are no lines there which end with "=micmute" instead there are quite
>> a few lines like this:
>>
>>  KEYBOARD_KEY_8a=f20                                    # Microphone mute button; should be micmute
>>
>> Arguably it would be more correct to have the kernel still send
>> KEY_MICMUTE and do the remapping to KEY_F20 in userspace in e.g. hwdb.
>>
>> But that will not work here, the remapping is done based on mapping
>> the HID usage-code to a new evdev KEY_FOO code, basically overriding
>> lenovo_input_mapping_tp10_ultrabook_kbd() mapping.
>>
>> But the "Lenovo ThinkPad 10 Ultrabook Keyboard" uses the same 0x000c0001
>> usage code for all of its custom Fn+F# media keys, so instead of doing
>> the mapping purely on usage-code it is done on a combination of usage-code +
>> the index of the key in the input-report (since the usage-code is not unique
>> for a single key):
>>
>>         /*
>>          * The ThinkPad 10 Ultrabook Keyboard uses 0x000c0001 usage for
>>          * a bunch of keys which have no standard consumer page code.
>>          */
>>         if (usage->hid == 0x000c0001) {
>>                 switch (usage->usage_index) {
>>                 case 8: /* Fn-Esc: Fn-lock toggle */
>>                         map_key_clear(KEY_FN_ESC);
>>                         return 1;
>>                 case 9: /* Fn-F4: Mic mute */
>>                         map_key_clear(LENOVO_KEY_MICMUTE);
>>                         return 1;
>> 		...
>>
>>
>> So in this case we cannot fixup the mapping from userspace, as userspace
>> remapping is purely done based on the "scancode" which in case of HID devices
>> is the HID usage-code.
>>
>> I don't even know what will happen if we were to try. I guess that either the
>> first key with a matching usage-code is remapped, or all of them are remapped,
>> both of which are wrong.
>>
>> Regards,
>>
>> Hans
>>
> 
> And no one ever solved this for X? OMFG :(

Many people have looked into fixing this, but X11 is a network protocol, and
the other side could be a many many years old X-terminal (one of those devices
which don't have their own OS but connect over xdmcp to show a desktop
running on some big machine somewhere else on the LAN).

XKB in X is layered on top of the original X input protocol, and the data
gets passed around multiple times in multiple different structs and it is
limited to a 8 bit wide int everywhere.

Note it is not just micmute. The F13 - F24 F-key range has been used to
work around this for a while now.

I'm aware of the following "mappings" being used for this:

evdev	->	interpreted by userspace as

KEY_F20 ->	mic-mute toggle
KEY_F21 ->	touchpad on/off toggle
KEY_F22 ->	touchpad on
KEY_F23 ->	touchpad off

This is not pretty, I know.

Regards,

Hans

