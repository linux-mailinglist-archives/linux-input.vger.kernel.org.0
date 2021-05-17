Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8F5A3828CF
	for <lists+linux-input@lfdr.de>; Mon, 17 May 2021 11:50:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236080AbhEQJv1 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 17 May 2021 05:51:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29701 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235952AbhEQJv0 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 17 May 2021 05:51:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1621245010;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=l8FPsOS7ruS/48hY6ZEHB00h5yK8tzShpSiSHaKRubM=;
        b=jCqgxRksWT0vcwP4cLGIeETUF846JrGmG1Euluc1t/UN3DodoKCvJnL+V/JVrazwKRHp3H
        Cgy7DTJhQeFJMGYxlaIbvWKsvSKwVxfFLnRWtjtthAA8tEIUypgtQnFL47aoD1lQbbGxRf
        e/17Tgh7PArwpaEuuy8d50Vp4463yVw=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-213-5kc4VbP-ORmXH3FW7RTurg-1; Mon, 17 May 2021 05:50:08 -0400
X-MC-Unique: 5kc4VbP-ORmXH3FW7RTurg-1
Received: by mail-ed1-f71.google.com with SMTP id n6-20020a0564020606b029038cdc241890so3575237edv.20
        for <linux-input@vger.kernel.org>; Mon, 17 May 2021 02:50:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=l8FPsOS7ruS/48hY6ZEHB00h5yK8tzShpSiSHaKRubM=;
        b=XeYlIIpxT8Jsc5xmMjJgZrW3WSLku7Qa9tUjNEq655UZ3hlmy4mGEqnbNd8JiejzgY
         H2iNPSGPRmNPEIc4Ett5qt26VhmqnHGZ6OpmZ5+/qMLj67RWFGBChGvXL5XOFjTnycer
         oJI13ic4dina6f1kXXs+EWwQ95fpRavqwWT94N7w21rfGKUU2WBTwH8ZkCo/KHzd2zWJ
         MxQLtdfCsKaPDUhY6J3G3+XZJWEyFuN5wp3Eef1e2h+PuIobm32C+sp84mexbsIOnPmc
         tsC/uJyYI63xRk3NodYA2h2SXADhXvrXri6P4xfpix2iCfYygnJzHsgA7/vYgFo0dOMB
         i8jA==
X-Gm-Message-State: AOAM533wmshBhGKWlwWACJIda3S2MRIbz4k5FvwpW1gSrT0Ds8oAQsab
        sOeTpZKtgnFJSDgg081KcP9Qatnaps8vi1udQvU2A92+Re2e3WqH8jIgSXliUu5JyZhdyav1naK
        hufEzIIVZZQ2FGJST9pkY2A+WqWzycVPARIWB5r+udrK3184TUoSAEIMd+Z5S1vnmsMpKLTvl4p
        w=
X-Received: by 2002:aa7:d058:: with SMTP id n24mr33841266edo.275.1621245006914;
        Mon, 17 May 2021 02:50:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx4izerJ5zOvnhhuVAMGkgo5g8r0hjBa8lseQ0tInkIe/YpjT0zG1HP9iopJKBndTHp5xN51Q==
X-Received: by 2002:aa7:d058:: with SMTP id n24mr33841239edo.275.1621245006665;
        Mon, 17 May 2021 02:50:06 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id q16sm8291149ejm.12.2021.05.17.02.50.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 May 2021 02:50:06 -0700 (PDT)
Subject: Re: fn-key issue with hid_apple and keychron keyboards
To:     Bastian Venthur <mail@venthur.de>,
        linux-input <linux-input@vger.kernel.org>
References: <f2ac3660-b95c-eb7b-8f92-57af0a27672d@venthur.de>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <f82dd7a1-a5c6-b651-846c-29f6df9436af@redhat.com>
Date:   Mon, 17 May 2021 11:50:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <f2ac3660-b95c-eb7b-8f92-57af0a27672d@venthur.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Bastian,

On 5/17/21 9:46 AM, Bastian Venthur wrote:
> Hello Hans,
> 
> I'm writing you because apparently you provided the patch [1] for Linux "Disable Fn-key key-re-mapping on clone keyboards" -- which seems related to a bug I've found with Keychron C1 keyboard.
> 
> I'm really sorry if you're not the right contact for those kind of issues, and would be very happy if you could point me to the correct ones.

It is usually a good idea to at least Cc the relevant linux mailinglist on
questions like this. I've added the linux-input list to the Cc now.

> I recently got a Keychron C1 keyboard (but I gather, other Keyboards from this company are affected as well). The keyboard has a physical switch for "Windows" and "Mac" modes, however in both cases the kernel recognizes it as an Apple keyboard and loads the "hid-apple" module. However it does *not* recognize the 'Fn' key and disables it. But the keyboard has one and I have to enable it manually either via:
> 
> # as root:
> echo 2 > /sys/module/hid_apple/parameters/fnmode
> 
> or permanently:
> 
> options hid_apple fnmode=2
> in /etc/modprobe.d/hid_apple.conf
> 
> Without this, I cannot use the Function-keys, they will always be used as Multimedia-keys, regardless if you press Fn + F1 or not.
> 
> Here's the relevant dmesg output when i plug the keyboard in.
> 
> [    6.234069] apple 0003:05AC:024F.0004: input,hidraw3: USB HID v1.11 Keyboard [Keychron Keychron C1] on usb-0000:06:00.4-1.2.1.2/input0
> [    6.234261] apple 0003:05AC:024F.0005: Fn key not found (Apple Wireless Keyboard clone?), disabling Fn key handling
> [    6.294181] apple 0003:05AC:024F.0005: input,hidraw4: USB HID v1.11 Keyboard [Keychron Keychron C1] on usb-0000:06:00.4-1.2.1.2/input1

Ok, so the keyboard presents itself as 2 interfaces. and the "Fn key not found" message
is only being printed for the second interface. So I guess that the trouble F1-F12 keys
are actually coming out of the first interface (the 0003:05AC:024F.0004 device above).

What my patch does it completely disables the fnmode handling, similar to setting the
fnmode parameter to 0, but unlike my (Maxxter KB-BT-001 Bluetooth keyboard) "clone" your
keyboard does actually advertise a Mac style Fn key in its descriptors, at least for the
first interface so it is treated as a standard Mac keyboard where the non Fn behavior of
the F-keys is to send the multimedia events. Normally pressing Fn + F1 - F-12 should then
result in the kernel actually sending F1-F12 and setting fnmode=2 should just invert when
you need to press Fn.

Basically the way the actual mac keyboards work is the simply always send F1 - F12 events
and a separate Fn event and leave it up to the OS to translate this to either plain
F1 - F12 or to the multimedia codes. Where as normal keyboards handle the Fn press
internally and actually send different "scancodes" over the wire to the computer when
Fn + F1 - F12 is pressed.

But if I understand you correctly then the Fn translation hid-apple is doing to make
things work as expected with Mac keyboards is not working for you, IOW with fnmode=1
pressing Fn + F1 does not result in F1 being send, correct ?  This means that your
keyboard behaves more like a normal keyboard instead of as an apple keyboard.

I also wonder if the Fn key sends any events at all (or if it is fully handled internally)...

> I have no idea how to fix this, but I can provide additional information if needed.

Please become root ("sudo su -") and then do:

/sys/kernel/debug/hid/0003:05AC:024F.*/rdesc > Keychron-C1-rdesc

And attach the generated Keychron-C1-rdesc file to your next email.

Also please as root run:

sudo evemu-record

And then select the device belonging to your keyboard and press F1, Fn and Fn + F1,
please repeat this for all input devices belonging to your keyboard and then
copy and paste the output of each run into your next email.

Regards,

Hans

