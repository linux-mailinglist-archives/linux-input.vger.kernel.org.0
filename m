Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1CBAA47AC94
	for <lists+linux-input@lfdr.de>; Mon, 20 Dec 2021 15:45:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235781AbhLTOpo (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 20 Dec 2021 09:45:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53375 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234266AbhLTOoF (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 20 Dec 2021 09:44:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1640011445;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=s0C57x6fIFfjJWlVsoP1UxrAFAXigs4tTiwIaISXgCg=;
        b=AbxZN+br6z6mghPazBtvLB8EV8tw3AtnE4TPSFFY4kB7T9ofsHmKMW2ub7rXocnYW3gDaP
        EZqqDrgt65XeqaQ92oiIYbfSNndxq+X0CaF73pW2PmW5Mr0ivw5JkDz4f4UpuauDGBEtSl
        AVFyOAiE2UlZlemC8AWCEdtQ731ipLA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-450-rXVsBq1nMvyn6aBoFzzdrg-1; Mon, 20 Dec 2021 09:44:01 -0500
X-MC-Unique: rXVsBq1nMvyn6aBoFzzdrg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 744E0100CCC1;
        Mon, 20 Dec 2021 14:43:59 +0000 (UTC)
Received: from [10.39.192.160] (unknown [10.39.192.160])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 81CBA70D56;
        Mon, 20 Dec 2021 14:43:58 +0000 (UTC)
Message-ID: <7d5f55c6-d3e3-9cb9-2d33-de410efce88d@redhat.com>
Date:   Mon, 20 Dec 2021 15:43:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: Trouble parsing HID reports from PDP PS4 remote
Content-Language: en-US
To:     Jeremy Slemp <slempjeremy68@gmail.com>,
        linux-bluetooth@vger.kernel.org,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>
References: <CAHtsx2rK9SE5fn=1hnEZ_GZV6EPVvFLM-O+0HPAk+h+LvsxL2w@mail.gmail.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
In-Reply-To: <CAHtsx2rK9SE5fn=1hnEZ_GZV6EPVvFLM-O+0HPAk+h+LvsxL2w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Jeremy,

On 12/19/21 23:41, Jeremy Slemp wrote:
> I bought a PDP Bluetooth PS4 remote[0] in the hopes of using it to
> send keypress events to my Python script via evdev[1].  I found that
> some of the buttons on the remote generate HID events that are seen by
> evdev, but others do not.  So I'd like to figure out the best way to
> receive events from the currently-unsupported buttons.

If evdev shows some events, this is not related to bluetooth but the HID 
stack in the kernel (I cc-ed linux-input@)

Basically, we might need to add support for this remote in the hid-sony 
driver.

Can you attach the full output of hid-recorder (from the hid-tools[3] 
repository) when you press all of these buttons?

This should give us enough information to reply the event sequence 
locally and fix the drivers if we need.

Cheers,
Benjamin

[3] https://gitlab.freedesktop.org/libevdev/hid-tools

> 
> bluetoothctl describes the device as:
> 
> Device 3E:09:EC:xx:xx:xx (public)
> Name: PDP Media Remote
> Alias: PDP Media Remote
> Class: 0x0000250c
> Paired: yes
> Trusted: yes
> Blocked: no
> Connected: yes
> LegacyPairing: no
> UUID: Human Interface Device... (00001124-0000-1000-8000-00805f9b34fb)
> UUID: PnP Information           (00001200-0000-1000-8000-00805f9b34fb)
> 
> The main module inside the device is an BTM0612C2P[2].
> 
> 
> The "good" buttons flip a bit in a mask in bytes 2-5:
> 
> SHARE button, press/release:
> 
>> ACL Data RX: Handle 11 flags 0x02 dlen 15                           #2232 [hci0] 4474.225390
>        Channel: 65 len 11 [PSM 19 mode 0] {chan 1}
>          a1 01 08 10 00 09 00 16 73 47 06                 ........sG.
>> ACL Data RX: Handle 11 flags 0x02 dlen 15                           #2233 [hci0] 4474.355396
>        Channel: 65 len 11 [PSM 19 mode 0] {chan 1}
>          a1 01 08 00 00 09 00 89 24 5e 56                 ........$^V
> 
> UP ARROW, press/release:
> 
>> ACL Data RX: Handle 11 flags 0x02 dlen 15                           #2240 [hci0] 4536.493867
>        Channel: 65 len 11 [PSM 19 mode 0] {chan 1}
>          a1 01 00 00 00 0a 00 8b 3c 03 4d                 ........<.M
>> ACL Data RX: Handle 11 flags 0x02 dlen 15                           #2241 [hci0] 4536.727587
>        Channel: 65 len 11 [PSM 19 mode 0] {chan 1}
>          a1 01 08 00 00 0a 00 4a 77 73 7d                 .......Jws}
> 
> PINK SQUARE, press/release:
> 
>> ACL Data RX: Handle 11 flags 0x02 dlen 15                           #2259 [hci0] 4676.429686
>        Channel: 65 len 11 [PSM 19 mode 0] {chan 1}
>          a1 01 18 00 00 0a 00 c8 e0 93 1d                 ...........
>> ACL Data RX: Handle 11 flags 0x02 dlen 15                           #2260 [hci0] 4676.639687
>        Channel: 65 len 11 [PSM 19 mode 0] {chan 1}
>          a1 01 08 00 00 0a 00 4a 77 73 7d                 .......Jws}
> 
> 
> The "bad" buttons seem to transmit a constant in byte 6 instead of a
> bitmask in bytes 2-5:
> 
> REWIND, press/release:
> 
>> ACL Data RX: Handle 11 flags 0x02 dlen 15                           #2261 [hci0] 4696.955007
>        Channel: 65 len 11 [PSM 19 mode 0] {chan 1}
>          a1 01 08 00 00 0a 17 8d f2 a0 fe                 ...........
>> ACL Data RX: Handle 11 flags 0x02 dlen 15                           #2262 [hci0] 4697.163765
>        Channel: 65 len 11 [PSM 19 mode 0] {chan 1}
>          a1 01 08 00 00 0a 00 4a 77 73 7d                 .......Jws}
> 
> PLAY, press/release:
> 
>> ACL Data RX: Handle 11 flags 0x02 dlen 15                           #2264 [hci0] 4710.348944
>        Channel: 65 len 11 [PSM 19 mode 0] {chan 1}
>          a1 01 08 00 00 0a 16 1b c2 a7 89                 ...........
>> ACL Data RX: Handle 11 flags 0x02 dlen 15                           #2265 [hci0] 4710.531446
>        Channel: 65 len 11 [PSM 19 mode 0] {chan 1}
>          a1 01 08 00 00 0a 00 4a 77 73 7d                 .......Jws}
> 
> PAUSE, press/release:
> 
>> ACL Data RX: Handle 11 flags 0x02 dlen 15                           #2266 [hci0] 4717.501552
>        Channel: 65 len 11 [PSM 19 mode 0] {chan 1}
>          a1 01 08 00 00 0a 1a 30 8e 11 80                 .......0...
>> ACL Data RX: Handle 11 flags 0x02 dlen 15                           #2267 [hci0] 4717.685317
>        Channel: 65 len 11 [PSM 19 mode 0] {chan 1}
>          a1 01 08 00 00 0a 00 4a 77 73 7d                 .......Jws}
> 
> ENTER, press/release:
> 
>> ACL Data RX: Handle 11 flags 0x02 dlen 15                           #2293 [hci0] 4844.683443
>        Channel: 65 len 11 [PSM 19 mode 0] {chan 1}
>          a1 01 08 00 00 0a 0d f7 0b c2 03                 ...........
>> ACL Data RX: Handle 11 flags 0x02 dlen 15                           #2294 [hci0] 4844.867210
>        Channel: 65 len 11 [PSM 19 mode 0] {chan 1}
>          a1 01 08 00 00 0a 00 4a 77 73 7d                 .......Jws}
> 
> I tried to decode these reports according to the USB HID spec but they
> didn't make much sense to me beyond the "collection (application)"
> part.  Can anyone help understand what this remote is doing?
> 
> 
> [0] https://www.amazon.com/dp/B072C7YZFC
> [1] https://python-evdev.readthedocs.io/en/latest/
> [2] https://www.oemblue.com/download/BTM0612C2P%20Hardware%20Datasheet.pdf
> 
> 

