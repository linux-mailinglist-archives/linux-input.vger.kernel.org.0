Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 083912ABF3B
	for <lists+linux-input@lfdr.de>; Mon,  9 Nov 2020 15:52:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730556AbgKIOwg (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 9 Nov 2020 09:52:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:29921 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729950AbgKIOwg (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 9 Nov 2020 09:52:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1604933554;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=wyASXJWqc46031Uf9Z70fpFSxLQq5esgBO8Dsb2GQ2U=;
        b=EYFbnOxFum1rKF6Ex9NcAuw4Vs4WnkNc2EcNuX69+HOOD7XnFLKDzE1NM2FDCo9BW4uwyj
        j6XBbfaCY8PbVf92wJU1SAahubU/qVmvkNbA2HEGJjtfFFu5klROb/WIokJRzL42+mCWl7
        rIUdqsJ1yyPgGPnq8nBJl2v4u7bbkX4=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-148-Uey84rejOy6L6znmwerBdw-1; Mon, 09 Nov 2020 09:52:31 -0500
X-MC-Unique: Uey84rejOy6L6znmwerBdw-1
Received: by mail-ed1-f70.google.com with SMTP id c2so2801085edw.21
        for <linux-input@vger.kernel.org>; Mon, 09 Nov 2020 06:52:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=wyASXJWqc46031Uf9Z70fpFSxLQq5esgBO8Dsb2GQ2U=;
        b=Uk9rthufTxBeANWT6yA8PcLHO59K8kCBAnGBNU9suEsP00/A2pEvfkBjpoVL6YuDPP
         0YOau0LZqRjM6l3LnCSfpadWRheitiUk5ctu5hJ7/Pe1fpimWeepUG+VfMFavs7/Xk91
         gtYB9KbmQXQ7O4JhDjjOZjH9s4Lh1UzJ0f8nRU6FGQ8tz6cStTbKx/RvGyDiRaKzhzFq
         /5DlYIx2kaIANtiv1SYaoeE3zmTw3lU1B+kT5xA+0TwmE/JHkQ0l67Xz9lw3XRnhtS3S
         0LXewraXJw4oK3XmBkb7jJPSUlgG2J1hOc1QNM6PdkzrMo2NtEYH3Wce/+JhiJw1znWq
         hMDg==
X-Gm-Message-State: AOAM533l9LNSbREKAaNbWNozj/Zh9ALAtcxyMSjArXhSku6epBgqzmOx
        KHoE1/a3aMvMTIYXad4NWKtj3rAXos342cdvlxvkXRSArJc1HalhXMYtvJPf9TWgcCV9jwdB3+1
        pne8QT1OyVVia+hcUSan/Kss=
X-Received: by 2002:a17:907:2166:: with SMTP id rl6mr15497271ejb.61.1604933550598;
        Mon, 09 Nov 2020 06:52:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz+2v6xzNZW7ELtKDBSrr/SHUX+WSeJuLL5hifrDbZwJDiEllSTfhwms9bT8HMR+2AWiEhKaQ==
X-Received: by 2002:a17:907:2166:: with SMTP id rl6mr15497241ejb.61.1604933550336;
        Mon, 09 Nov 2020 06:52:30 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-6c10-fbf3-14c4-884c.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:6c10:fbf3:14c4:884c])
        by smtp.gmail.com with ESMTPSA id u2sm9059030edr.70.2020.11.09.06.52.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2020 06:52:29 -0800 (PST)
Subject: Re: How to handle a level-triggered interrupt that is slow to
 de-assert itself
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Jamie McClymont <jamie@kwiius.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-input <linux-input@vger.kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
References: <a491261f-8463-474d-a6b3-d674670c7bb7@www.fastmail.com>
 <CAHp75VcBB9wGdrBKXXSnCeHRwS1uEEz9TSrnbxzZ5g+yGdXaiA@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <1bca4d42-c055-b765-bd82-f3a9f74ae32f@redhat.com>
Date:   Mon, 9 Nov 2020 15:52:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <CAHp75VcBB9wGdrBKXXSnCeHRwS1uEEz9TSrnbxzZ5g+yGdXaiA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 11/9/20 3:30 PM, Andy Shevchenko wrote:
> On Mon, Nov 9, 2020 at 2:57 PM Jamie McClymont <jamie@kwiius.com> wrote:
> 
> Looking into the problem I think the better people to answer are ones
> from the input subsystem (or closer), so I have added a few to the Cc
> list.
> 
>> Background context:
>>
>> I'm continuing my efforts to reverse-engineer and write a driver for the Goodix GXFP5187 fingerprint sensor in my Huawei Matebook X Pro (the host is an Intel i5-8250U).
>>
>> The device is connected via SPI plus a GPIO Interrupt pin, defined like so in the ACPI tables:
>>
>>     GpioInt (Level, ActiveLow, ExclusiveAndWake, PullUp, 0x0000,
>>         "\\_SB.PCI0.GPI0", 0x00, ResourceConsumer, ,) { 0x0000 }
>>
>> This line is held down by the device when it has a message for the host, and stays held down until the host finishes reading the message out over SPI.
>>
>> I'm handling this with a devm_request_threaded_irq-type handler, where the irq part is just "return IRQ_WAKE_THREAD", and the threaded part does all the work. My understanding is that this is a reasonable approach since I don't have tight latency requirements (and the sleeping spi functions are convenient, plus I don't want to introduce any unnecessary jitter to the system) -- please correct me if I shouldn't actually be using a threaded handler here.
>>
>> ---
>>
>> Here's my problem:
>>
>> the IRQ line actually stays held down for roughly 180us after I've finished reading out the message over SPI. That means that as soon as the handler finishes, a new one starts, and it reads out corrupted data, since the sensor doesn't have anything to say.
>>
>> This is okay in theory -- the corrupted message header can be detected by its checksum, and disregarded. However, this leads to a race condition where the chip can decide it DOES have something to say to the host, WHILE the host is reading out the corrupted header. At that point, the two sides de-sync in their ideas of what needs to be read, and everything stops working.
>>
>> So, I'd like some way to pause interrupt handling for 200us+, and only re-run the handler if the line is still held down after that time.
>>
>> My first approach was to add a sleep (usleep_range) at the end of the threaded handler, right before returning IRQ_HANDLED. However, it appears that after the sleep finishes, the IRQ is triggered one more time -- presumably it has been set as pending before/during the sleep?

That should not happen, as long as the threaded handler clears the interrupt source before it returns,
then the IRQ should not be triggered a second time.

The IRQ will be masked as soon as it registers the first time and then stay masked until
the threaded handler is done, note this behavior requires setting the IRQF_ONESHOT flag.
Which AFAIK is mandatory for threaded handlers anyways unless you are also providing a
non-threaded handler ?

I'm not sure what the conventions are if you supply both and not set IRQF_ONESHOT.

But it sounds to me like you should only provide a threaded-handler and pass
IRQF_ONESHOT when requesting the IRQ.

As long as you do the following:

1) Clear the reason why the device is asserting its IRQ in the threaded handler
2) Wait at minimum any IRQ clearing latency before exiting the threaded handler

Then the IRQ should not fire a second time after 2.

Probably something which you have already tried, but have you tried using a slightly
longer sleep ?

To me using usleep_range at the end of the threaded handler seems like it is
exactly what you should do; and it should work.

Regards,

Hans

