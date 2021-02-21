Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1D2C32099F
	for <lists+linux-input@lfdr.de>; Sun, 21 Feb 2021 11:44:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229817AbhBUKns (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 21 Feb 2021 05:43:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:20352 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229802AbhBUKns (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 21 Feb 2021 05:43:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1613904141;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=95WzN+w1wOtGeC2x3JHydOUXIdt35Y5bPfjanlsuwt8=;
        b=JDMypZ5JrwikfYoCtx9RZbJAvGz45px7NK8rXpDqra8ow6XcBb6g9pnBtbPAed9fDMgO1o
        EDRNicWUcy+w14zlOv3dBCj4ekmJIvxa2DB99MqQF81/zSYgsBFsx56Z0lkuZXoUNu+Xwl
        lAgYPCDBuKOFLd4nWYUGmEzUJkhW5xE=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-478-NkAokv1iP0-JyMI7efGyJA-1; Sun, 21 Feb 2021 05:42:19 -0500
X-MC-Unique: NkAokv1iP0-JyMI7efGyJA-1
Received: by mail-ed1-f69.google.com with SMTP id z12so5386877edb.0
        for <linux-input@vger.kernel.org>; Sun, 21 Feb 2021 02:42:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=95WzN+w1wOtGeC2x3JHydOUXIdt35Y5bPfjanlsuwt8=;
        b=Ar49Hlgje0ORjbBMGRQSy7WbElKayoPWAzWAIVg4vHzu1M4xHBuFdNJxVcra9inB43
         oyv25EvxyLQVoMfNad+tI9Wnp8m/ZYEkvVnB27i4klxX/0hHzL5+GyYLCMvMaArjh0pJ
         pDv8erUL4/TsdAd0Oquo5j7Tf5x3C5Njw1pjbP4AKg9nr/VHJD6hUnB9yWlMlwySJgwo
         FUFqXqEdIUesU0H0Y13vRg+jG3MFZZFp7xKy+e6IsLGC48OizTxafhOn+UF9kkE7LEb8
         MhFmKetcfqoUIWUX+6lrEDTdl6xvrjq5M6lFzakTUh/yj7rlg3sWzZd5bKghTE77ciTE
         fATQ==
X-Gm-Message-State: AOAM531Ok8UNy03Jcq4Wunmtznq9XXdycGs6eHLhoh7bjxJHsVuz0bkP
        dvdVUNWHVUOD7c8uh2Z6TBQx6AwnoPlLBexyCg2hQF7YuaDksBoMr+Fx/DKuNa2PCQSEnNmSGn5
        hXBRXopByWMUTSyDoP+VKNBs=
X-Received: by 2002:a17:906:d18e:: with SMTP id c14mr16684971ejz.302.1613904138220;
        Sun, 21 Feb 2021 02:42:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJztQaUYeLRDrLxWVB6mB2uhWsKVsau6fVcwvouUgdMBOHJjM8btQv8uRfssBeYC1iUxCIlTQQ==
X-Received: by 2002:a17:906:d18e:: with SMTP id c14mr16684965ejz.302.1613904138063;
        Sun, 21 Feb 2021 02:42:18 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id u18sm8121961ejc.76.2021.02.21.02.42.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Feb 2021 02:42:17 -0800 (PST)
Subject: Re: [PATCH v2 6/7] HID: lenovo: Map mic-mute button to KEY_F20
 instead of KEY_MICMUTE
To:     Marek Behun <marek.behun@nic.cz>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, linux-leds@vger.kernel.org
References: <20210220122438.21857-1-hdegoede@redhat.com>
 <20210220122438.21857-7-hdegoede@redhat.com> <20210221024225.4310028d@nic.cz>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <5bda52b5-0f6e-8bce-e53c-108081da87ee@redhat.com>
Date:   Sun, 21 Feb 2021 11:42:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210221024225.4310028d@nic.cz>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 2/21/21 2:42 AM, Marek Behun wrote:
> On Sat, 20 Feb 2021 13:24:37 +0100
> Hans de Goede <hdegoede@redhat.com> wrote:
> 
>> Mapping the mic-mute button to KEY_MICMUTE is technically correct but
>> KEY_MICMUTE translates to a scancode of 256 (248 + 8) under X,
>> which does not fit in 8 bits, so it does not work.
> 
> Why does it need to fit 8 bits? Where is the problem?

As the commit message says, "under X" aka X11 / Xorg. This is a well known
limitation of the X11 input stack / of XKB *as implemented in X11*
the Wayland input stack does not have this limitations and does allow
using raw key-codes >= 248.

If you look at e.g. :
https://github.com/systemd/systemd/blob/main/hwdb.d/60-keyboard.hwdb

Which (mostly) maps custom PS/2 scancodes used for some "media" keys
on laptops to linux evdev KEY_FOO codes, then you will see that there
are no lines there which end with "=micmute" instead there are quite
a few lines like this:

 KEYBOARD_KEY_8a=f20                                    # Microphone mute button; should be micmute

Arguably it would be more correct to have the kernel still send
KEY_MICMUTE and do the remapping to KEY_F20 in userspace in e.g. hwdb.

But that will not work here, the remapping is done based on mapping
the HID usage-code to a new evdev KEY_FOO code, basically overriding
lenovo_input_mapping_tp10_ultrabook_kbd() mapping.

But the "Lenovo ThinkPad 10 Ultrabook Keyboard" uses the same 0x000c0001
usage code for all of its custom Fn+F# media keys, so instead of doing
the mapping purely on usage-code it is done on a combination of usage-code +
the index of the key in the input-report (since the usage-code is not unique
for a single key):

        /*
         * The ThinkPad 10 Ultrabook Keyboard uses 0x000c0001 usage for
         * a bunch of keys which have no standard consumer page code.
         */
        if (usage->hid == 0x000c0001) {
                switch (usage->usage_index) {
                case 8: /* Fn-Esc: Fn-lock toggle */
                        map_key_clear(KEY_FN_ESC);
                        return 1;
                case 9: /* Fn-F4: Mic mute */
                        map_key_clear(LENOVO_KEY_MICMUTE);
                        return 1;
		...


So in this case we cannot fixup the mapping from userspace, as userspace
remapping is purely done based on the "scancode" which in case of HID devices
is the HID usage-code.

I don't even know what will happen if we were to try. I guess that either the
first key with a matching usage-code is remapped, or all of them are remapped,
both of which are wrong.

Regards,

Hans

