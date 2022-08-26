Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BC6475A2B53
	for <lists+linux-input@lfdr.de>; Fri, 26 Aug 2022 17:32:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245437AbiHZPb6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 26 Aug 2022 11:31:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343496AbiHZPbs (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 26 Aug 2022 11:31:48 -0400
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com [IPv6:2607:f8b0:4864:20::f2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACE2D3C152
        for <linux-input@vger.kernel.org>; Fri, 26 Aug 2022 08:31:44 -0700 (PDT)
Received: by mail-qv1-xf2e.google.com with SMTP id kh8so1335411qvb.1
        for <linux-input@vger.kernel.org>; Fri, 26 Aug 2022 08:31:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=vE0qb25GpAV8ydbdJyTZW4/LPEkk2+Cf8NHVKl3qysw=;
        b=PjLTvg2GGeMO+E7JS/LzwvyDUpCSp5yy7rB1ZTayurGsfESjBxmgFSyYHvhz5d9rsP
         XQAjFVIH/Qud/GyufvpzYFyz8sQarUOtMu1OrAvcFka0UrpEtFeSj+rWT+xb91uwuA8B
         iK4tcrnjODaeL+DUIPOAwM5xbf5FWKoyxuSrrwGynUo3EeC3ikTwceMyiLjO+vfxjyPh
         EaRQoCBGzeCXtzKn35q2b7QLGSfedqM/hCOV00MpjyvjpVlUVPTeGOvDfuoiGKGiZ07O
         1YPbSbKJ79h1lu6bkRYFaQ3vcPqISpW3ieVhjS9VSyFa+YBJzQNrg6IZ0MyU2nG9HxD+
         cphA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=vE0qb25GpAV8ydbdJyTZW4/LPEkk2+Cf8NHVKl3qysw=;
        b=Os1VVzoKoOmxPFnIuBv7OeHkWacO9U0Ik8/lkdiJYUmnhCf+Ew9nEit4ctjM1H3W25
         CUxteEQeuwlqf2hojH5tdcNf9BdXeRCTgc65Vs67mv3KeLLcr0lpKEcWZeDiyj7WAvX/
         Ww7scpnWgTXzE64DgRr0R14pxLebmMD+TY2mhzQSMXz2f/Knw+BluWK0RQbhAkhPEdeP
         SeXMv6zABQC+U2VLytuzUlig5RsRs1mTSWijGgP5x/7JelMZzOlcfCeUdFtBVJ5EdKfJ
         7hxqnRTmqNP5iSdSpP4MDhH3Ofl89OYiZFcrN2ndlDb0AM9wUlPP4Hb1mQ+w/jnbY9m2
         HGFg==
X-Gm-Message-State: ACgBeo1wBfdAttltWKlU/c7IZVn+sSiuxuw6AoOcoad1kQUzpWwqoJPT
        DxDrlQamfZdCD1QnmGwIL+8=
X-Google-Smtp-Source: AA6agR5ZJp9d3x7S0Nso1NeSiVs5HaUb+4qDoV8EqtPFjNCo4YF05HRhZj/7Zj3Vi0LXxgehxZNuRw==
X-Received: by 2002:a0c:e50b:0:b0:496:a94f:31f1 with SMTP id l11-20020a0ce50b000000b00496a94f31f1mr116153qvm.41.1661527903467;
        Fri, 26 Aug 2022 08:31:43 -0700 (PDT)
Received: from [192.168.0.27] ([204.237.50.72])
        by smtp.gmail.com with ESMTPSA id m9-20020a05620a24c900b006af0ce13499sm2192534qkn.115.2022.08.26.08.31.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Aug 2022 08:31:42 -0700 (PDT)
Message-ID: <9992a158-7de6-4d68-134b-3b54a18fb82c@gmail.com>
Date:   Fri, 26 Aug 2022 11:31:40 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] HID: logitech-hidpp: Enable HID++ for all the Logitech
 Bluetooth devices
Content-Language: en-US
To:     Bastien Nocera <hadess@hadess.net>,
        Nestor Lopez Casado <nlopezcasad@logitech.com>
Cc:     =?UTF-8?Q?Filipe_La=c3=adns?= <lains@riseup.net>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org
References: <4542beb149883ab5dfdcfd7f6bb4b516e5c1bcdb.camel@hadess.net>
 <CAE7qMrrj+rBzoAFf2FezqexgWNo+iSAd6b5NZwKFQ1C1zD_Qaw@mail.gmail.com>
 <f285873c4cf0a0747db996bbca7e7d9234ce77fb.camel@gmail.com>
 <d3824bda564871c7759fd3b1ebad16b3d9affe1e.camel@hadess.net>
From:   "Peter F. Patel-Schneider" <pfpschneider@gmail.com>
In-Reply-To: <d3824bda564871c7759fd3b1ebad16b3d9affe1e.camel@hadess.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The bad interaction caused by the bug goes like this.

The driver tries to get the battery information and finds out that the HID++ 
2.0 device has the Unified Battery feature (0x1004) at index 0x08.  It sends a 
command to the device to report the capabilities its Unified Battery feature 
supports using

#define CMD_UNIFIED_BATTERY_GET_CAPABILITIES            0x00

for the command and software identifier nibbles in byte 4 of the message, 
which ends up being

11 FF 0800 00000000000000000000000000000000

This is a non-conforming message because the software identifier nibble (the 
low-order nibble of byte 4) is 0x0.

The device does not respond with an error indicating that the message is 
non-conforming but instead treats the message as conformant and responds with 
the capabilities of its Unified Battery feature

11 FF 0800 0F030000000000000000000000000000

copying the device number, feature index, function, and software identifier, 
as required.  The rest of the response indicates that the feature on the 
device supports all four qualitative battery levels, is rechargeable, and also 
reports battery levels in percentages.

Devices with this feature also emit notification messages when their batteries 
change level.  Notification messages are distinguished from response messages 
by having a 0x0 software identification nibble.  So this response is read by 
other software that is listening to the raw HID messages from the device and 
interpreted as an event notification.

In this case the feature has an event notification with function 0x0 that is 
emitted when status of the device's battery is changed.  The fifth byte of 
these notification messages is the percentage of battery energy available.  So 
the software concludes that the device's battery has 15% of its energy remaining.


If the driver is changed to

#define CMD_UNIFIED_BATTERY_GET_CAPABILITIES            0x01

then the command sent would be

11 FF 0801 00000000000000000000000000000000

which is conforming, and the response would be

11 FF 0801 0F030000000000000000000000000000

which is not the same as any event notification message.



Other bad interactions are also possible, including the the driver 
misinterpreting an event notification as a response to a message that it sent 
to the device.


peter



On 8/26/22 10:35, Bastien Nocera wrote:
> On Thu, 2022-08-25 at 16:47 -0400, Peter F. Patel-Schneider wrote:
>> This patch will cause more use of a part of the driver that
>> constructs
>> messages that do not conform to the HID++ 2.0 specification.  This
>> makes now a good time to fix the parts of the driver that construct
>> non-conforming messages.  More information follows.
> This would cause problems, but not any worse than adding the product
> IDs individually, which is what we're trying to avoid.
>
>> This results in non-conforming messages being sent to devices.  As
>> devices are obligated to return this nibble intact they produce non-
>> conforming responses as well.  (Their other option would be to reject
>> the messages.) This confuses other software that correctly uses this
>> nibble to distinguish between device response messages and device
>> event
>> messages.
> I don't understand how this...
>
>> In particular, the response to the unified battery command to get the
>> capabilities comes back with a 0x00 function byte which is
>> indistinguishable from a spontaneous notification message from the
>> device for a battery status event.  Other software trying to
>> communicate with the device (e.g., Solaar) sees a unified battery
>> status notification and will generally end up with incorrect
>> information about the device.  I suspect that this is actually
>> happening and is the cause of the Solaar bug report
>> https://github.com/pwr-Solaar/Solaar/issues/1718
> ...could cause this. Can you explain what the messages would look like
> in both cases, and how they could be misinterpreted as a 15 vs. 85
> percent battery level?
>
>> There is also the possibility that the driver confuses a notification
>> from the device as the response to a command that it sent.  When this
>> happens it would be likely that the actual response would be treated
>> as
>> a notification.
>>
>>
>> The fix is to modify all the CMD definitions in the code to have 1 in
>> their low-order nibble.
> All in all, I don't see those bugs as blocking the integration of the
> patch discussed above, I see it as a way to expose those bugs and
> possibly a way to make them more urgent.
>
> Filipe, were those problems known/already reported?
>
> Cheers


I reported https://bugzilla.kernel.org/show_bug.cgi?id=215699 which is a 
different problem with the same cause, albeit in a different constant in the 
driver.


peter



