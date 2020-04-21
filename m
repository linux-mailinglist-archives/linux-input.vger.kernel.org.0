Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9A4A1B1DCB
	for <lists+linux-input@lfdr.de>; Tue, 21 Apr 2020 06:56:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726021AbgDUE47 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 21 Apr 2020 00:56:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725992AbgDUE47 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 21 Apr 2020 00:56:59 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF92EC061A0F;
        Mon, 20 Apr 2020 21:56:58 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id n24so4803273plp.13;
        Mon, 20 Apr 2020 21:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=/kZQBZrT7d+NZ7hXhFjqvc0yPUpSInT9Q68O6DIDCdE=;
        b=I0wA5N5rgHL+QS3JC/e8E9bDZFN/3qd4hMle1jsvTBxkIiwSzozu+78n6FTeGXtrhB
         lC3DadWUjWrFS9w3p7+30CmgG7oDR5d8f8CS/hOcTVG2Ghn8geYcKtimk121BI3u2/vk
         LGy6PICsN7xHo/6dad9UdPt7TePMAUQsXtpcZJqwJHZn0RUEiHeCL4YXzgJv7G5dMWPD
         Mw2lUMo3B7LEBONMW8nzbX2e1MABimYIHJAOGIaB9lCelMLCIjtBeybOWbsDnSZxTQSj
         wqhYir3DDRK3AkRKlGxbViNhs+qaKGbKzpU77R6LmUjCkM4YgF2K54F9BTXsfuy/J/J7
         jn9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=/kZQBZrT7d+NZ7hXhFjqvc0yPUpSInT9Q68O6DIDCdE=;
        b=XRN7KVO79J/dnJj8Uz6EMXw+MZy9+dwQpaq/KBxLFwFx4ML+MmV07RE/G0ZSACeS/a
         BBuAf96ogBHpPaiDoO/jhlIdsRWJLP9edl8IeEb8CteCjjPuWUWQcEUYPmGDK8oOoEEW
         gh/uFKK7fLT8J08/sobibdwOQvI+l6wFpCiMlCJvbgahKChVROX9w7iuItru6gwpZUHx
         uQ6GcNjLa1W3PDdWRThbp4osOyo7vfhKvAnsYxrRYRg0RTzTl8AaBiE4sdgc44pL0C7a
         NosV9YGbfuH4CZPVpupImCHGV7WUOjYBSBobj3cZeppoCnr/C5g2PLkHy2YX/w2sv4iY
         N3xQ==
X-Gm-Message-State: AGi0PubhXioPriCleZdlCPsQmv69QJpy0nAqXKYpOjuF3wYM2dALBQ5w
        wvBKcvtv2f4ImT96MLlLUXAerzZjrEGKtg==
X-Google-Smtp-Source: APiQypJ8l1ZFE+2LscthXeCV9bRn2vId8DTmm8NGy5NgWvtedGfnryVUDbV7XfSU7mmHY5HKj81ZIA==
X-Received: by 2002:a17:90a:2347:: with SMTP id f65mr3219502pje.165.1587445017642;
        Mon, 20 Apr 2020 21:56:57 -0700 (PDT)
Received: from ?IPv6:2604:4080:1012:8d30:9eb6:d0ff:fe8b:175f? ([2604:4080:1012:8d30:9eb6:d0ff:fe8b:175f])
        by smtp.gmail.com with ESMTPSA id h9sm1163323pfo.129.2020.04.20.21.56.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Apr 2020 21:56:57 -0700 (PDT)
Subject: Re: [PATCH] Input: xpad - Update xboxone fw2015 init packet
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        LuK1337 <priv.luk@gmail.com>, Mark Furneaux <mark@furneaux.ca>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Richard Fontana <rfontana@redhat.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Allison Randal <allison@lohutok.net>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200419041651.GD166864@dtor-ws>
 <20200419074624.9955-1-priv.luk@gmail.com> <20200419180136.GK166864@dtor-ws>
From:   Cameron Gutman <aicommander@gmail.com>
Message-ID: <436c79ed-ca21-c075-e2da-0934da5000a2@gmail.com>
Date:   Mon, 20 Apr 2020 21:56:56 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200419180136.GK166864@dtor-ws>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 4/19/20 11:01 AM, Dmitry Torokhov wrote:
> On Sun, Apr 19, 2020 at 09:46:23AM +0200, LuK1337 wrote:
>> From: Łukasz Patron <priv.luk@gmail.com>
>>
>> Appending { 0x05, 0x20, 0x02, 0x0f, 0x06 } to
>> xboxone_fw2015_init fixes an issue where the
>> controller is somewhat stuck in bluetooth
>> mode until you plug it into Windows PC.
>>
>> Signed-off-by: Łukasz Patron <priv.luk@gmail.com>
> 
> Thank you Łukasz. Could you please tell me what device(s) have you
> observed the issue with? I am a bit worried if this may interfere with
> other devices that currently work fine with the driver. Cameron, Mark,
> do you have any concerns here?
> 

Yes, I gave it a try here, and it looks like there's definitely some
breakages for non-updated controllers. It breaks the Covert Forces
edition Xbox One controller (0x045e, 0x02dd) and also another non-upgraded
Xbox One S controller of the same model as the affected controller
(0x045e, 0x02ea, firmware 3.1.1221.0).

On the plus side, it _does_ seem to fix the issue.

>> ---
>>  drivers/input/joystick/xpad.c | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
>> index 6b40a1c68f9f..894fa81f717a 100644
>> --- a/drivers/input/joystick/xpad.c
>> +++ b/drivers/input/joystick/xpad.c
>> @@ -455,7 +455,8 @@ struct xboxone_init_packet {
>>   * or later firmware installed (or present from the factory).
>>   */
>>  static const u8 xboxone_fw2015_init[] = {
>> -	0x05, 0x20, 0x00, 0x01, 0x00
>> +	0x05, 0x20, 0x00, 0x01, 0x00,
>> +	0x05, 0x20, 0x02, 0x0f, 0x06
>>  };

One thing that strikes me as odd about this init packet is that it looks
like 2 packets strung together. Most of the other init packets have 0x20
as their second byte, and there's even something resembling a sequence
number in the third byte (0x02). Maybe these are supposed to be separate
init packets?

Hopefully we can find some init sequence that at least the One S controller
can tolerate on all known firmware versions. If not, the firmware rev is
available to us in bcdDevice, but I'd only like to use an explicit version
check as a last resort.

>>  /*
>> -- 
>> 2.26.0
>>
> 
> Thanks.
> 

Regards,
Cameron
