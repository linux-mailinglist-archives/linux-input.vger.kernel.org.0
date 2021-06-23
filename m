Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A57E73B1C33
	for <lists+linux-input@lfdr.de>; Wed, 23 Jun 2021 16:16:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230274AbhFWOSy (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 23 Jun 2021 10:18:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29313 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230061AbhFWOSy (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 23 Jun 2021 10:18:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1624457796;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=3gQSEUr7+936jwGakarzrwh/OEXzOIftwY4fNXdqS7E=;
        b=I+Qrr04ppIMTigwhQoVKsQP6tmLk95emzJdWUbm9kFB8i/Fn1kYo9xP05fxfV3QQyJ6zio
        D8pnpvvHLrJMSUjlYktOxcoZ63h1h6NDBso59jzi2kJVhfQS86zlGiJU2C/LG1tGTOKLGT
        o1pPitUlqJ4ZaJcc14G8UHRtqPyKwUQ=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-248-h0QW4qYcNVyCcuVyk7oe7g-1; Wed, 23 Jun 2021 10:16:34 -0400
X-MC-Unique: h0QW4qYcNVyCcuVyk7oe7g-1
Received: by mail-ed1-f71.google.com with SMTP id y18-20020a0564022712b029038ffac1995eso1394640edd.12
        for <linux-input@vger.kernel.org>; Wed, 23 Jun 2021 07:16:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=3gQSEUr7+936jwGakarzrwh/OEXzOIftwY4fNXdqS7E=;
        b=RmWC0L/6mJLrQkAe0h+MQp7tsvtY926ctY0fyRxdo1+nG6JQc24k4XnOb+yHj9rVEs
         tEfOAPAVOlyrEn0Z7UtcbXq/Zn5WQUIA9MHQOQnRsAHeyjRvdDJgRITCB7wAdJsDAb88
         CZj2ekDPCLND3taZ4Z9T7h72McmoKiIVdhJApBnbg27NGq5NscvsVvulK5ASxOO0vAjA
         RGOTBFp/ZP8kw3Ky2TfiLYLYXIsbN4TmSDapY5LnneIXiyWmCOpf+0iI/APyyR8iPKF+
         E8xuQGcC1CHW+tk+l8LXIyPQwCTIEHdcZxwOU7tyMG5H/u9Ewm0FJdGALMmYksR5i7jb
         /8QQ==
X-Gm-Message-State: AOAM533z3OV5RL5um2UXh1PMsqG9ePB8eXG1HnoRdsaSMAt9bDnD8wdG
        EnQFE4JIsKhLW5Ulh3w++Eco62VefltPp0WhcRS9YRsSRcRMRxeyBxqmL9i3HUoi1adAd/v/awN
        /fXsD9j5VDwX42x2yu3cBTNJzaBrACo4KUrONDraY2a8s5ZI1gpTldgcnTdUGF17UcYynHeSmSn
        0=
X-Received: by 2002:a05:6402:3589:: with SMTP id y9mr10701503edc.218.1624457793215;
        Wed, 23 Jun 2021 07:16:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxcNFYiL0oU9wvy6t7p5ARfXq4FkdG0RyrZShH7fSrC6CH4Jo+cBUBgNV2tKJsARGRgDzdZKQ==
X-Received: by 2002:a05:6402:3589:: with SMTP id y9mr10701467edc.218.1624457792998;
        Wed, 23 Jun 2021 07:16:32 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id e28sm118478edc.24.2021.06.23.07.16.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Jun 2021 07:16:32 -0700 (PDT)
Subject: Re: fn-key issue with hid_apple and keychron keyboards
To:     Bastian Venthur <mail@venthur.de>,
        linux-input <linux-input@vger.kernel.org>
References: <f2ac3660-b95c-eb7b-8f92-57af0a27672d@venthur.de>
 <f82dd7a1-a5c6-b651-846c-29f6df9436af@redhat.com>
 <155865d7-f964-ac9a-2c02-1eabeac0e443@venthur.de>
 <897e57a9-38d8-c05f-ceed-01d486f02726@redhat.com>
 <ae3e52eb-fa43-ce5e-bf81-f014318a02ff@venthur.de>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <0d69820a-30ee-755c-b146-49c2bbc0714f@redhat.com>
Date:   Wed, 23 Jun 2021 16:16:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <ae3e52eb-fa43-ce5e-bf81-f014318a02ff@venthur.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 5/17/21 4:47 PM, Bastian Venthur wrote:
> Hi Hans,
> 
> On 17.05.21 16:26, Hans de Goede wrote:
> 
>>> # /sys/kernel/debug/hid/0003\:05AC\:024F.0004/rdesc
>>> -bash: /sys/kernel/debug/hid/0003:05AC:024F.0004/rdesc: Permission denied
>>> # /sys/kernel/debug/hid/0003\:05AC\:024F.0005/rdesc
>>> -bash: /sys/kernel/debug/hid/0003:05AC:024F.0005/rdesc: Permission denied
>>
>> Ok, this means you are likely running with secure-boot enabled on a somewhat
>> older kernel where /sys/kernel/debug (aka debugfs) gets completely disabled.
>>
>> Can you try (temporarily) disabling secure boot in your BIOS, that should fix
>> things (otherwise there are other ways to get the descriptors but in my
>> experience this way is the easiest)
> 
> Sorry, I've tried booting with secure boot disabled in the BIOS, but with the same result. So I guess we have to get that info the hard way.

Ah, I see. But I don't think I need a descriptor-dump anymore anyways,
see below.

> [...]
> 
>> Ok, so as suspected your keyboard behaves as a normal (non-apple) keyboard
>> using separate (multimedia related) scancodes when using Fn + F1 - F12, in this
>> case even reporting them on a second interface (likely because the first
>> interface is implementing the USB kbd boot protocol to make the kbd work inside
>> the BIOS setup menu).
>>
>> Which means that your keyboard really should just be handled by a the standard
>> hid-input driver rather then being handled by the special hid-apple driver.
>>
>> Now if only it would have not "hijacked" Apple's USB vendor and product id and
>> would just have used their own then everything would just work.
>>
>> IOW this is another clone like the Maxxter kbd I added, but the current
>> clone-detection code is not detecting it (at least not for the first of
>> the usb interfaces which it has).
>>
>> Just to make sure I'm not missing anything, can you redo the evemu-record
>> tests with the switch set to mac mode. And when you gather the rdesc files
>> can you do that twice too, once in windows mode and once in mac mode ?
>>
>> Please unplug and replug the keyboard after changing the switch to make
>> sure that Linux sees the changed descriptors (assuming they change at all).
> 
> Sure, here we go this time with keyboard in Mac mode:
> 
> Select the device event number [0-21]: 11
> # EVEMU 1.3
> # Kernel: 5.10.0-6-amd64
> # DMI: dmi:bvnLENOVO:bvrR1CET61W(1.30):bd12/21/2020:br1.30:efr1.30:svnLENOVO:pn20UHS0G000:pvrThinkPadT14sGen1:rvnLENOVO:rn20UHS0G000:rvrNotDefined:cvnLENOVO:ct10:cvrNone:
> # Input device name: "Keychron Keychron C1"
> # Input device ID: bus 0x03 vendor 0x5ac product 0x24f version 0x111
> # Supported events:
> #   Event type 0 (EV_SYN)
> #     Event code 0 (SYN_REPORT)
> #     Event code 1 (SYN_CONFIG)
> #     Event code 2 (SYN_MT_REPORT)
> #     Event code 3 (SYN_DROPPED)
> #     Event code 4 ((null))
> #     Event code 5 ((null))
> #     Event code 6 ((null))
> #     Event code 7 ((null))
> #     Event code 8 ((null))
> #     Event code 9 ((null))
> #     Event code 10 ((null))
> #     Event code 11 ((null))
> #     Event code 12 ((null))
> #     Event code 13 ((null))
> #     Event code 14 ((null))
> #     Event code 15 (SYN_MAX)
> #   Event type 1 (EV_KEY)
> #     Event code 1 (KEY_ESC)
> #     Event code 2 (KEY_1)
> #     Event code 3 (KEY_2)
> #     Event code 4 (KEY_3)
> #     Event code 5 (KEY_4)
> #     Event code 6 (KEY_5)
> #     Event code 7 (KEY_6)
> #     Event code 8 (KEY_7)
> #     Event code 9 (KEY_8)
> #     Event code 10 (KEY_9)
> #     Event code 11 (KEY_0)
> #     Event code 12 (KEY_MINUS)
> #     Event code 13 (KEY_EQUAL)
> #     Event code 14 (KEY_BACKSPACE)
> #     Event code 15 (KEY_TAB)
> #     Event code 16 (KEY_Q)
> #     Event code 17 (KEY_W)
> #     Event code 18 (KEY_E)
> #     Event code 19 (KEY_R)
> #     Event code 20 (KEY_T)
> #     Event code 21 (KEY_Y)
> #     Event code 22 (KEY_U)
> #     Event code 23 (KEY_I)
> #     Event code 24 (KEY_O)
> #     Event code 25 (KEY_P)
> #     Event code 26 (KEY_LEFTBRACE)
> #     Event code 27 (KEY_RIGHTBRACE)
> #     Event code 28 (KEY_ENTER)
> #     Event code 29 (KEY_LEFTCTRL)
> #     Event code 30 (KEY_A)
> #     Event code 31 (KEY_S)
> #     Event code 32 (KEY_D)
> #     Event code 33 (KEY_F)
> #     Event code 34 (KEY_G)
> #     Event code 35 (KEY_H)
> #     Event code 36 (KEY_J)
> #     Event code 37 (KEY_K)
> #     Event code 38 (KEY_L)
> #     Event code 39 (KEY_SEMICOLON)
> #     Event code 40 (KEY_APOSTROPHE)
> #     Event code 41 (KEY_GRAVE)
> #     Event code 42 (KEY_LEFTSHIFT)
> #     Event code 43 (KEY_BACKSLASH)
> #     Event code 44 (KEY_Z)
> #     Event code 45 (KEY_X)
> #     Event code 46 (KEY_C)
> #     Event code 47 (KEY_V)
> #     Event code 48 (KEY_B)
> #     Event code 49 (KEY_N)
> #     Event code 50 (KEY_M)
> #     Event code 51 (KEY_COMMA)
> #     Event code 52 (KEY_DOT)
> #     Event code 53 (KEY_SLASH)
> #     Event code 54 (KEY_RIGHTSHIFT)
> #     Event code 55 (KEY_KPASTERISK)
> #     Event code 56 (KEY_LEFTALT)
> #     Event code 57 (KEY_SPACE)
> #     Event code 58 (KEY_CAPSLOCK)
> #     Event code 59 (KEY_F1)
> #     Event code 60 (KEY_F2)
> #     Event code 61 (KEY_F3)
> #     Event code 62 (KEY_F4)
> #     Event code 63 (KEY_F5)
> #     Event code 64 (KEY_F6)
> #     Event code 65 (KEY_F7)
> #     Event code 66 (KEY_F8)
> #     Event code 67 (KEY_F9)
> #     Event code 68 (KEY_F10)
> #     Event code 69 (KEY_NUMLOCK)
> #     Event code 70 (KEY_SCROLLLOCK)
> #     Event code 71 (KEY_KP7)
> #     Event code 72 (KEY_KP8)
> #     Event code 73 (KEY_KP9)
> #     Event code 74 (KEY_KPMINUS)
> #     Event code 75 (KEY_KP4)
> #     Event code 76 (KEY_KP5)
> #     Event code 77 (KEY_KP6)
> #     Event code 78 (KEY_KPPLUS)
> #     Event code 79 (KEY_KP1)
> #     Event code 80 (KEY_KP2)
> #     Event code 81 (KEY_KP3)
> #     Event code 82 (KEY_KP0)
> #     Event code 83 (KEY_KPDOT)
> #     Event code 85 (KEY_ZENKAKUHANKAKU)
> #     Event code 86 (KEY_102ND)
> #     Event code 87 (KEY_F11)
> #     Event code 88 (KEY_F12)
> #     Event code 89 (KEY_RO)
> #     Event code 90 (KEY_KATAKANA)
> #     Event code 91 (KEY_HIRAGANA)
> #     Event code 92 (KEY_HENKAN)
> #     Event code 93 (KEY_KATAKANAHIRAGANA)
> #     Event code 94 (KEY_MUHENKAN)
> #     Event code 95 (KEY_KPJPCOMMA)
> #     Event code 96 (KEY_KPENTER)
> #     Event code 97 (KEY_RIGHTCTRL)
> #     Event code 98 (KEY_KPSLASH)
> #     Event code 99 (KEY_SYSRQ)
> #     Event code 100 (KEY_RIGHTALT)
> #     Event code 102 (KEY_HOME)
> #     Event code 103 (KEY_UP)
> #     Event code 104 (KEY_PAGEUP)
> #     Event code 105 (KEY_LEFT)
> #     Event code 106 (KEY_RIGHT)
> #     Event code 107 (KEY_END)
> #     Event code 108 (KEY_DOWN)
> #     Event code 109 (KEY_PAGEDOWN)
> #     Event code 110 (KEY_INSERT)
> #     Event code 111 (KEY_DELETE)
> #     Event code 113 (KEY_MUTE)
> #     Event code 114 (KEY_VOLUMEDOWN)
> #     Event code 115 (KEY_VOLUMEUP)
> #     Event code 116 (KEY_POWER)
> #     Event code 117 (KEY_KPEQUAL)
> #     Event code 119 (KEY_PAUSE)
> #     Event code 120 (KEY_SCALE)
> #     Event code 121 (KEY_KPCOMMA)
> #     Event code 122 (KEY_HANGEUL)
> #     Event code 123 (KEY_HANJA)
> #     Event code 124 (KEY_YEN)
> #     Event code 125 (KEY_LEFTMETA)
> #     Event code 126 (KEY_RIGHTMETA)
> #     Event code 127 (KEY_COMPOSE)
> #     Event code 128 (KEY_STOP)
> #     Event code 129 (KEY_AGAIN)
> #     Event code 130 (KEY_PROPS)
> #     Event code 131 (KEY_UNDO)
> #     Event code 132 (KEY_FRONT)
> #     Event code 133 (KEY_COPY)
> #     Event code 134 (KEY_OPEN)
> #     Event code 135 (KEY_PASTE)
> #     Event code 136 (KEY_FIND)
> #     Event code 137 (KEY_CUT)
> #     Event code 138 (KEY_HELP)
> #     Event code 140 (KEY_CALC)
> #     Event code 142 (KEY_SLEEP)
> #     Event code 150 (KEY_WWW)
> #     Event code 152 (KEY_COFFEE)
> #     Event code 158 (KEY_BACK)
> #     Event code 159 (KEY_FORWARD)
> #     Event code 161 (KEY_EJECTCD)
> #     Event code 163 (KEY_NEXTSONG)
> #     Event code 164 (KEY_PLAYPAUSE)
> #     Event code 165 (KEY_PREVIOUSSONG)
> #     Event code 166 (KEY_STOPCD)
> #     Event code 173 (KEY_REFRESH)
> #     Event code 176 (KEY_EDIT)
> #     Event code 177 (KEY_SCROLLUP)
> #     Event code 178 (KEY_SCROLLDOWN)
> #     Event code 179 (KEY_KPLEFTPAREN)
> #     Event code 180 (KEY_KPRIGHTPAREN)
> #     Event code 183 (KEY_F13)
> #     Event code 184 (KEY_F14)
> #     Event code 185 (KEY_F15)
> #     Event code 186 (KEY_F16)
> #     Event code 187 (KEY_F17)
> #     Event code 188 (KEY_F18)
> #     Event code 189 (KEY_F19)
> #     Event code 190 (KEY_F20)
> #     Event code 191 (KEY_F21)
> #     Event code 192 (KEY_F22)
> #     Event code 193 (KEY_F23)
> #     Event code 194 (KEY_F24)
> #     Event code 204 (KEY_DASHBOARD)
> #     Event code 224 (KEY_BRIGHTNESSDOWN)
> #     Event code 225 (KEY_BRIGHTNESSUP)
> #     Event code 227 (KEY_SWITCHVIDEOMODE)
> #     Event code 228 (KEY_KBDILLUMTOGGLE)
> #     Event code 229 (KEY_KBDILLUMDOWN)
> #     Event code 230 (KEY_KBDILLUMUP)
> #     Event code 240 (KEY_UNKNOWN)
> #     Event code 464 (KEY_FN)
> #   Event type 4 (EV_MSC)
> #     Event code 4 (MSC_SCAN)
> #   Event type 17 (EV_LED)
> #     Event code 0 (LED_NUML)
> #        State 0
> #     Event code 1 (LED_CAPSL)
> #        State 0
> #     Event code 2 (LED_SCROLLL)
> #        State 0
> #     Event code 3 (LED_COMPOSE)
> #        State 0
> #     Event code 4 (LED_KANA)
> #        State 0
> #   Event type 20 (EV_REP)
> #     Event code 0 (REP_DELAY)
> #     Event code 1 (REP_PERIOD)
> # Properties:
> N: Keychron Keychron C1
> I: 0003 05ac 024f 0111
> P: 00 00 00 00 00 00 00 00
> B: 00 0b 00 00 00 00 00 00 00
> B: 01 fe ff ff ff ff ff ff ff
> B: 01 ff ff ef ff df ff be ff
> B: 01 ff 57 40 c1 7a 20 9f ff
> B: 01 07 10 00 00 7b 00 01 00
> B: 01 00 00 00 00 00 00 00 00
> B: 01 00 00 00 00 00 00 00 00
> B: 01 00 00 00 00 00 00 00 00
> B: 01 00 00 01 00 00 00 00 00
> B: 01 00 00 00 00 00 00 00 00
> B: 01 00 00 00 00 00 00 00 00
> B: 01 00 00 00 00 00 00 00 00
> B: 01 00 00 00 00 00 00 00 00
> B: 02 00 00 00 00 00 00 00 00
> B: 03 00 00 00 00 00 00 00 00
> B: 04 10 00 00 00 00 00 00 00
> B: 05 00 00 00 00 00 00 00 00
> B: 11 1f 00 00 00 00 00 00 00
> B: 12 00 00 00 00 00 00 00 00
> B: 14 03 00 00 00 00 00 00 00
> B: 15 00 00 00 00 00 00 00 00
> B: 15 00 00 00 00 00 00 00 00
> ################################
> #      Waiting for events      #
> ################################
> E: 0.000001 0001 001c 0000    # EV_KEY / KEY_ENTER            0
> E: 0.000001 0000 0000 0000    # ------------ SYN_REPORT (0) ---------- +0ms
> E: 3.110107 0001 003b 0001    # EV_KEY / KEY_F1               1
> E: 3.110107 0000 0000 0000    # ------------ SYN_REPORT (0) ---------- +3110ms
> ^[OPE: 3.182884 0001 003b 0000    # EV_KEY / KEY_F1               0
> E: 3.182884 0000 0000 0000    # ------------ SYN_REPORT (0) ---------- +72ms
> E: 5.488823 0001 01d0 0001    # EV_KEY / KEY_FN               1
> E: 5.488823 0000 0000 0000    # ------------ SYN_REPORT (0) ---------- +2306ms
> E: 5.584619 0001 01d0 0000    # EV_KEY / KEY_FN               0
> E: 5.584619 0000 0000 0000    # ------------ SYN_REPORT (0) ---------- +96ms
> E: 6.490736 0001 01d0 0001    # EV_KEY / KEY_FN               1
> E: 6.490736 0000 0000 0000    # ------------ SYN_REPORT (0) ---------- +906ms
> E: 6.642849 0001 00e0 0001    # EV_KEY / KEY_BRIGHTNESSDOWN   1
> E: 6.642849 0000 0000 0000    # ------------ SYN_REPORT (0) ---------- +152ms
> E: 6.692480 0001 00e0 0000    # EV_KEY / KEY_BRIGHTNESSDOWN   0
> E: 6.692480 0000 0000 0000    # ------------ SYN_REPORT (0) ---------- +50ms
> E: 6.825699 0001 01d0 0000    # EV_KEY / KEY_FN               0
> E: 6.825699 0000 0000 0000    # ------------ SYN_REPORT (0) ---------- +133ms
> E: 9.540420 0004 0004 458976    # EV_MSC / MSC_SCAN             458976
> E: 9.540420 0001 001d 0001    # EV_KEY / KEY_LEFTCTRL         1
> E: 9.540420 0000 0000 0000    # ------------ SYN_REPORT (0) ---------- +2715ms
> E: 9.665411 0004 0004 458758    # EV_MSC / MSC_SCAN             458758
> E: 9.665411 0001 002e 0001    # EV_KEY / KEY_C                1
> E: 9.665411 0000 0000 0000    # ------------ SYN_REPORT (0) ---------- +125ms
> 
> 
> This time I see something for F1, Fn, and Fn+F1 (= brightness down)
> 
> Device #2:
> 
> 
> Select the device event number [0-21]: 12
> # EVEMU 1.3
> # Kernel: 5.10.0-6-amd64
> # DMI: dmi:bvnLENOVO:bvrR1CET61W(1.30):bd12/21/2020:br1.30:efr1.30:svnLENOVO:pn20UHS0G000:pvrThinkPadT14sGen1:rvnLENOVO:rn20UHS0G000:rvrNotDefined:cvnLENOVO:ct10:cvrNone:
> # Input device name: "Keychron Keychron C1"
> # Input device ID: bus 0x03 vendor 0x5ac product 0x24f version 0x111
> # Supported events:
> #   Event type 0 (EV_SYN)
> #     Event code 0 (SYN_REPORT)
> #     Event code 1 (SYN_CONFIG)
> #     Event code 2 (SYN_MT_REPORT)
> #     Event code 3 (SYN_DROPPED)
> #     Event code 4 ((null))
> #     Event code 5 ((null))
> #     Event code 6 ((null))
> #     Event code 7 ((null))
> #     Event code 8 ((null))
> #     Event code 9 ((null))
> #     Event code 10 ((null))
> #     Event code 11 ((null))
> #     Event code 12 ((null))
> #     Event code 13 ((null))
> #     Event code 14 ((null))
> #     Event code 15 (SYN_MAX)
> #   Event type 1 (EV_KEY)
> #     Event code 1 (KEY_ESC)
> #     Event code 2 (KEY_1)
> #     Event code 3 (KEY_2)
> #     Event code 4 (KEY_3)
> #     Event code 5 (KEY_4)
> #     Event code 6 (KEY_5)
> #     Event code 7 (KEY_6)
> #     Event code 8 (KEY_7)
> #     Event code 9 (KEY_8)
> #     Event code 10 (KEY_9)
> #     Event code 11 (KEY_0)
> #     Event code 12 (KEY_MINUS)
> #     Event code 13 (KEY_EQUAL)
> #     Event code 14 (KEY_BACKSPACE)
> #     Event code 15 (KEY_TAB)
> #     Event code 16 (KEY_Q)
> #     Event code 17 (KEY_W)
> #     Event code 18 (KEY_E)
> #     Event code 19 (KEY_R)
> #     Event code 20 (KEY_T)
> #     Event code 21 (KEY_Y)
> #     Event code 22 (KEY_U)
> #     Event code 23 (KEY_I)
> #     Event code 24 (KEY_O)
> #     Event code 25 (KEY_P)
> #     Event code 26 (KEY_LEFTBRACE)
> #     Event code 27 (KEY_RIGHTBRACE)
> #     Event code 28 (KEY_ENTER)
> #     Event code 30 (KEY_A)
> #     Event code 31 (KEY_S)
> #     Event code 32 (KEY_D)
> #     Event code 33 (KEY_F)
> #     Event code 34 (KEY_G)
> #     Event code 35 (KEY_H)
> #     Event code 36 (KEY_J)
> #     Event code 37 (KEY_K)
> #     Event code 38 (KEY_L)
> #     Event code 39 (KEY_SEMICOLON)
> #     Event code 40 (KEY_APOSTROPHE)
> #     Event code 41 (KEY_GRAVE)
> #     Event code 43 (KEY_BACKSLASH)
> #     Event code 44 (KEY_Z)
> #     Event code 45 (KEY_X)
> #     Event code 46 (KEY_C)
> #     Event code 47 (KEY_V)
> #     Event code 48 (KEY_B)
> #     Event code 49 (KEY_N)
> #     Event code 50 (KEY_M)
> #     Event code 51 (KEY_COMMA)
> #     Event code 52 (KEY_DOT)
> #     Event code 53 (KEY_SLASH)
> #     Event code 55 (KEY_KPASTERISK)
> #     Event code 57 (KEY_SPACE)
> #     Event code 58 (KEY_CAPSLOCK)
> #     Event code 59 (KEY_F1)
> #     Event code 60 (KEY_F2)
> #     Event code 61 (KEY_F3)
> #     Event code 62 (KEY_F4)
> #     Event code 63 (KEY_F5)
> #     Event code 64 (KEY_F6)
> #     Event code 65 (KEY_F7)
> #     Event code 66 (KEY_F8)
> #     Event code 67 (KEY_F9)
> #     Event code 68 (KEY_F10)
> #     Event code 69 (KEY_NUMLOCK)
> #     Event code 70 (KEY_SCROLLLOCK)
> #     Event code 71 (KEY_KP7)
> #     Event code 72 (KEY_KP8)
> #     Event code 73 (KEY_KP9)
> #     Event code 74 (KEY_KPMINUS)
> #     Event code 75 (KEY_KP4)
> #     Event code 76 (KEY_KP5)
> #     Event code 77 (KEY_KP6)
> #     Event code 78 (KEY_KPPLUS)
> #     Event code 79 (KEY_KP1)
> #     Event code 80 (KEY_KP2)
> #     Event code 81 (KEY_KP3)
> #     Event code 82 (KEY_KP0)
> #     Event code 83 (KEY_KPDOT)
> #     Event code 86 (KEY_102ND)
> #     Event code 87 (KEY_F11)
> #     Event code 88 (KEY_F12)
> #     Event code 96 (KEY_KPENTER)
> #     Event code 98 (KEY_KPSLASH)
> #     Event code 99 (KEY_SYSRQ)
> #     Event code 102 (KEY_HOME)
> #     Event code 103 (KEY_UP)
> #     Event code 104 (KEY_PAGEUP)
> #     Event code 105 (KEY_LEFT)
> #     Event code 106 (KEY_RIGHT)
> #     Event code 107 (KEY_END)
> #     Event code 108 (KEY_DOWN)
> #     Event code 109 (KEY_PAGEDOWN)
> #     Event code 110 (KEY_INSERT)
> #     Event code 111 (KEY_DELETE)
> #     Event code 113 (KEY_MUTE)
> #     Event code 114 (KEY_VOLUMEDOWN)
> #     Event code 115 (KEY_VOLUMEUP)
> #     Event code 116 (KEY_POWER)
> #     Event code 117 (KEY_KPEQUAL)
> #     Event code 119 (KEY_PAUSE)
> #     Event code 120 (KEY_SCALE)
> #     Event code 127 (KEY_COMPOSE)
> #     Event code 128 (KEY_STOP)
> #     Event code 130 (KEY_PROPS)
> #     Event code 131 (KEY_UNDO)
> #     Event code 132 (KEY_FRONT)
> #     Event code 133 (KEY_COPY)
> #     Event code 134 (KEY_OPEN)
> #     Event code 135 (KEY_PASTE)
> #     Event code 136 (KEY_FIND)
> #     Event code 137 (KEY_CUT)
> #     Event code 138 (KEY_HELP)
> #     Event code 139 (KEY_MENU)
> #     Event code 140 (KEY_CALC)
> #     Event code 142 (KEY_SLEEP)
> #     Event code 143 (KEY_WAKEUP)
> #     Event code 144 (KEY_FILE)
> #     Event code 150 (KEY_WWW)
> #     Event code 152 (KEY_COFFEE)
> #     Event code 155 (KEY_MAIL)
> #     Event code 156 (KEY_BOOKMARKS)
> #     Event code 158 (KEY_BACK)
> #     Event code 159 (KEY_FORWARD)
> #     Event code 161 (KEY_EJECTCD)
> #     Event code 163 (KEY_NEXTSONG)
> #     Event code 164 (KEY_PLAYPAUSE)
> #     Event code 165 (KEY_PREVIOUSSONG)
> #     Event code 166 (KEY_STOPCD)
> #     Event code 167 (KEY_RECORD)
> #     Event code 168 (KEY_REWIND)
> #     Event code 169 (KEY_PHONE)
> #     Event code 171 (KEY_CONFIG)
> #     Event code 172 (KEY_HOMEPAGE)
> #     Event code 173 (KEY_REFRESH)
> #     Event code 174 (KEY_EXIT)
> #     Event code 176 (KEY_EDIT)
> #     Event code 177 (KEY_SCROLLUP)
> #     Event code 178 (KEY_SCROLLDOWN)
> #     Event code 181 (KEY_NEW)
> #     Event code 182 (KEY_REDO)
> #     Event code 183 (KEY_F13)
> #     Event code 184 (KEY_F14)
> #     Event code 185 (KEY_F15)
> #     Event code 186 (KEY_F16)
> #     Event code 187 (KEY_F17)
> #     Event code 188 (KEY_F18)
> #     Event code 189 (KEY_F19)
> #     Event code 190 (KEY_F20)
> #     Event code 191 (KEY_F21)
> #     Event code 192 (KEY_F22)
> #     Event code 193 (KEY_F23)
> #     Event code 194 (KEY_F24)
> #     Event code 206 (KEY_CLOSE)
> #     Event code 207 (KEY_PLAY)
> #     Event code 208 (KEY_FASTFORWARD)
> #     Event code 209 (KEY_BASSBOOST)
> #     Event code 210 (KEY_PRINT)
> #     Event code 212 (KEY_CAMERA)
> #     Event code 216 (KEY_CHAT)
> #     Event code 217 (KEY_SEARCH)
> #     Event code 219 (KEY_FINANCE)
> #     Event code 223 (KEY_CANCEL)
> #     Event code 224 (KEY_BRIGHTNESSDOWN)
> #     Event code 225 (KEY_BRIGHTNESSUP)
> #     Event code 228 (KEY_KBDILLUMTOGGLE)
> #     Event code 229 (KEY_KBDILLUMDOWN)
> #     Event code 230 (KEY_KBDILLUMUP)
> #     Event code 231 (KEY_SEND)
> #     Event code 232 (KEY_REPLY)
> #     Event code 233 (KEY_FORWARDMAIL)
> #     Event code 234 (KEY_SAVE)
> #     Event code 235 (KEY_DOCUMENTS)
> #     Event code 240 (KEY_UNKNOWN)
> #     Event code 241 (KEY_VIDEO_NEXT)
> #     Event code 244 (KEY_BRIGHTNESS_AUTO)
> #     Event code 256 (BTN_0)
> #     Event code 353 (KEY_SELECT)
> #     Event code 354 (KEY_GOTO)
> #     Event code 358 (KEY_INFO)
> #     Event code 362 (KEY_PROGRAM)
> #     Event code 366 (KEY_PVR)
> #     Event code 370 (KEY_SUBTITLE)
> #     Event code 372 (KEY_FULL_SCREEN)
> #     Event code 374 (KEY_KEYBOARD)
> #     Event code 375 (KEY_ASPECT_RATIO)
> #     Event code 376 (KEY_PC)
> #     Event code 377 (KEY_TV)
> #     Event code 378 (KEY_TV2)
> #     Event code 379 (KEY_VCR)
> #     Event code 380 (KEY_VCR2)
> #     Event code 381 (KEY_SAT)
> #     Event code 383 (KEY_CD)
> #     Event code 384 (KEY_TAPE)
> #     Event code 386 (KEY_TUNER)
> #     Event code 387 (KEY_PLAYER)
> #     Event code 389 (KEY_DVD)
> #     Event code 392 (KEY_AUDIO)
> #     Event code 393 (KEY_VIDEO)
> #     Event code 396 (KEY_MEMO)
> #     Event code 397 (KEY_CALENDAR)
> #     Event code 398 (KEY_RED)
> #     Event code 399 (KEY_GREEN)
> #     Event code 400 (KEY_YELLOW)
> #     Event code 401 (KEY_BLUE)
> #     Event code 402 (KEY_CHANNELUP)
> #     Event code 403 (KEY_CHANNELDOWN)
> #     Event code 405 (KEY_LAST)
> #     Event code 407 (KEY_NEXT)
> #     Event code 408 (KEY_RESTART)
> #     Event code 409 (KEY_SLOW)
> #     Event code 410 (KEY_SHUFFLE)
> #     Event code 412 (KEY_PREVIOUS)
> #     Event code 416 (KEY_VIDEOPHONE)
> #     Event code 417 (KEY_GAMES)
> #     Event code 418 (KEY_ZOOMIN)
> #     Event code 419 (KEY_ZOOMOUT)
> #     Event code 420 (KEY_ZOOMRESET)
> #     Event code 421 (KEY_WORDPROCESSOR)
> #     Event code 422 (KEY_EDITOR)
> #     Event code 423 (KEY_SPREADSHEET)
> #     Event code 424 (KEY_GRAPHICSEDITOR)
> #     Event code 425 (KEY_PRESENTATION)
> #     Event code 426 (KEY_DATABASE)
> #     Event code 427 (KEY_NEWS)
> #     Event code 428 (KEY_VOICEMAIL)
> #     Event code 429 (KEY_ADDRESSBOOK)
> #     Event code 430 (KEY_MESSENGER)
> #     Event code 431 (KEY_DISPLAYTOGGLE)
> #     Event code 432 (KEY_SPELLCHECK)
> #     Event code 433 (KEY_LOGOFF)
> #     Event code 439 (KEY_MEDIA_REPEAT)
> #     Event code 442 (KEY_IMAGES)
> #     Event code 576 (KEY_BUTTONCONFIG)
> #     Event code 577 (KEY_TASKMANAGER)
> #     Event code 578 (KEY_JOURNAL)
> #     Event code 579 (KEY_CONTROLPANEL)
> #     Event code 580 (KEY_APPSELECT)
> #     Event code 581 (KEY_SCREENSAVER)
> #     Event code 582 (KEY_VOICECOMMAND)
> #     Event code 583 (KEY_ASSISTANT)
> #     Event code 584 (KEY_KBD_LAYOUT_NEXT)
> #     Event code 592 (KEY_BRIGHTNESS_MIN)
> #     Event code 593 (KEY_BRIGHTNESS_MAX)
> #     Event code 608 (KEY_KBDINPUTASSIST_PREV)
> #     Event code 609 (KEY_KBDINPUTASSIST_NEXT)
> #     Event code 610 (KEY_KBDINPUTASSIST_PREVGROUP)
> #     Event code 611 (KEY_KBDINPUTASSIST_NEXTGROUP)
> #     Event code 612 (KEY_KBDINPUTASSIST_ACCEPT)
> #     Event code 613 (KEY_KBDINPUTASSIST_CANCEL)
> #   Event type 2 (EV_REL)
> #     Event code 6 (REL_HWHEEL)
> #     Event code 12 (REL_HWHEEL_HI_RES)
> #   Event type 3 (EV_ABS)
> #     Event code 32 (ABS_VOLUME)
> #       Value        0
> #       Min          0
> #       Max        828
> #       Fuzz         0
> #       Flat         0
> #       Resolution   0
> #   Event type 4 (EV_MSC)
> #     Event code 4 (MSC_SCAN)
> #   Event type 20 (EV_REP)
> #     Event code 0 (REP_DELAY)
> #     Event code 1 (REP_PERIOD)
> # Properties:
> N: Keychron Keychron C1
> I: 0003 05ac 024f 0111
> P: 00 00 00 00 00 00 00 00
> B: 00 0b 00 00 00 00 00 00 00
> B: 01 fe ff ff df ff fb bf fe
> B: 01 ff ff cf 01 cd ff be 81
> B: 01 fd df 41 d9 fa 7b e7 ff
> B: 01 07 c0 17 8b f3 0f 13 00
> B: 01 01 00 00 00 00 00 00 00
> B: 01 00 00 00 00 46 44 d4 bf
> B: 01 2d f3 af 17 ff ff 83 04
> B: 01 00 00 00 00 00 00 00 00
> B: 01 00 00 00 00 00 00 00 00
> B: 01 ff 01 03 00 3f 00 00 00
> B: 01 00 00 00 00 00 00 00 00
> B: 01 00 00 00 00 00 00 00 00
> B: 02 40 10 00 00 00 00 00 00
> B: 03 00 00 00 00 01 00 00 00
> B: 04 10 00 00 00 00 00 00 00
> B: 05 00 00 00 00 00 00 00 00
> B: 11 00 00 00 00 00 00 00 00
> B: 12 00 00 00 00 00 00 00 00
> B: 14 03 00 00 00 00 00 00 00
> B: 15 00 00 00 00 00 00 00 00
> B: 15 00 00 00 00 00 00 00 00
> A: 20 0 828 0 0 0
> ################################
> #      Waiting for events      #
> ################################
> ^[OP^C
> 
> This time I get nothing from F1 except this weird ^[OP, nothing at all from Fn and just brightness down on my screen from Fn+F1 (but no event here).
> 
> BTW: is it relevant, that i still have fnmode=2 set for those tests here? At least for a Windows-like (i.e. non-Apple-) mode of operation that would be my expected default mode anyways.

Thank you for the logs and sorry for being so slow to respond.

So looking at your evemu-record output, the keyboard is actually
behaving like a real Apple keyboard when put in Mac. mode.

This means that you should be able to send a "F1" keypress without
specifying any module parameter at all by pressing "Fn + F1" when
the keyboard is in Mac mode.

IOW in Mac mode everything should work fine, except that you may not
like the default behavior of F1-F12 being to send "multi-media" key
events instead of just plain "F1" - "F12" (and that you can change
with the fnmode=2 module parameter).

Since the keyboard is also using an Apple vendor- + product-id code
when in PC mode, things won't work as well in PC mode though since
then the "Fn" key likely does not actually send an event to the
machine to which the kbd is connected, causing the keys to be
stuck in "multi-media" mode regardless of the Fn key state
since when Fn is not pressed this is the default behavior and when
Fn is pressed then the key-press gets reported on the second
interface / device as a multi-media key-press.

This is really all the fault of the kbd-manufacturer, it should
really use different (non Apple) vendor- + product-ids when in
PC mode.

So the reason why I asked for the descriptors is to see if there
was some way to distuingish this keyboard from real Apple
keyboards, but I've already found a way to do that:

> # Properties:
> N: Keychron Keychron C1

The "Keychron Keychron C1" here comes from the USB device
strings; and we can use that to tell that we are dealing with
this Apple clone.

So now the question becomes what to do with this info though.
As I already said, I believe that in "Mac" mode all is working as
it should.  The problem is the "PC mode", the only thing which
I can come up with is to make fnmode=2 the default on this keyboard,
since that will also work in Mac mode (albeit different as on real
Mac keyboards) while also working in PC mode.

Does anyone (including you, Bastian) has any opinion on making
fnmode=2 the default on this keyboard model ?

Regards,

Hans

