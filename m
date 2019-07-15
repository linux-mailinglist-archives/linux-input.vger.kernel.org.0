Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E05D969CD6
	for <lists+linux-input@lfdr.de>; Mon, 15 Jul 2019 22:33:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731621AbfGOUdF (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 15 Jul 2019 16:33:05 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:34763 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731534AbfGOUdE (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 15 Jul 2019 16:33:04 -0400
Received: by mail-ed1-f66.google.com with SMTP id s49so16761122edb.1
        for <linux-input@vger.kernel.org>; Mon, 15 Jul 2019 13:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=H9sODSRYO4+8fOyREWTRkqYe+Ut+R8pS/BCCaEyKkIc=;
        b=gtlzwD8WCk7XuwFwUFRVgiB6d2+Q7jg2pAWDWR9l+TGl2ql+9/IyoFQwVqwHRBNkJG
         iiTiaSEnscy6C7GkkzuSTvLvxTccmjX0juGYMjfpJnOqGKDGNTORa4AkMkZYmwHbcjIL
         7wy94OlcD+DV1VC4XnUAheE7SNtPP223GQQsydHioJZyQu34un8xgSR6ec8cRBJnb+he
         nDKsbbeyVJaeUJtXK8T7LsMHZVv8J730Luh9t5a80BN7kYBlPcKPAXyxslXq5najfp/c
         HMp11F7/Etoc5X5ZfBBWOBbaU+RA46xRpsk0e7k3Mj11EMRDo4yccvlShcD5gfau+G2R
         wlQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=H9sODSRYO4+8fOyREWTRkqYe+Ut+R8pS/BCCaEyKkIc=;
        b=lHasNljkh1lHcWj9qTMNac460AzmkNLv3i0/KibGs3Y2dRCtCx1G2lRzc+yjmOm0ra
         PDCp2ju8Z7LCtGogi5FWOChUJA7A6Ru8iNZR0Oi80H/QVxBup4mCj7uQ0wn4a3LsFkKS
         +UCfrYkVZCKRPDplwhW39xP7noBeT+p0ssftkj9sdZkM8eGkXlwkXU1wzK/JTdx+fYqM
         S2wEgGRYhod54OYM/0e/pwJ1UEogxq6w2qX8kDLfDkcRgH/FPkvVVfjrDwDrqxPhR1A/
         as131/rOBQs+sdkFcw9JIW4U14gYUWZUBxD4RO3/kSJ6BM2/1tAkh2SMmPfNZDluofG2
         Wvsg==
X-Gm-Message-State: APjAAAUHCynrRZAQvlCbOCUqP37y1Vue0nbPZwbVORFq/90oMw3owqMP
        qXAzTAuw21OZSyMHJxahv7A=
X-Google-Smtp-Source: APXvYqxBfZ0oT7dOBo8hNFNiiCeExXea0ScLjENnWEgfIwZFegoR6+KaZw+NaNMGlyFZjOeUYSyu7w==
X-Received: by 2002:a17:906:474a:: with SMTP id j10mr22751628ejs.104.1563222782773;
        Mon, 15 Jul 2019 13:33:02 -0700 (PDT)
Received: from ?IPv6:2001:16b8:1cf0:f000:3cb4:a9bf:e9d9:963c? ([2001:16b8:1cf0:f000:3cb4:a9bf:e9d9:963c])
        by smtp.gmail.com with ESMTPSA id m32sm5499060edc.89.2019.07.15.13.33.01
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 15 Jul 2019 13:33:01 -0700 (PDT)
Subject: Re: Potentially different semantics of hidraw's write() between USB
 and Bluetooth transfer
To:     Roderick Colenbrander <thunderbird2k@gmail.com>
Cc:     linux-input <linux-input@vger.kernel.org>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
References: <2dc79196-8403-9c72-7495-6d27527933ad@gmail.com>
 <CAEc3jaDFmh=pSTPEBk3872-vcULc4T6TUnpctW3kQy3mXuHcZA@mail.gmail.com>
From:   Fabian Henneke <fabian.henneke@gmail.com>
Message-ID: <33e3b668-9b0e-410c-8174-5701abc714c4@gmail.com>
Date:   Mon, 15 Jul 2019 22:33:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <CAEc3jaDFmh=pSTPEBk3872-vcULc4T6TUnpctW3kQy3mXuHcZA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This is now hopefully fixed by https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth-next.git/commit/?id=0ed8a186eaff7c8e1eef8e3a5f03671920f66d58

On 10.07.19 20:01, Roderick Colenbrander wrote:
> Hi Fabian,
> 
> I would like to reply just in relation to the "Bluetooth path" as I'm
> not sure what the intended behaviour is for the "write" call is.
> 
> The Bluetooth path taken depends upon the userspace Bluetooth stack
> you use. Various Bluetooth stacks use "uhid" though some may take hidp
> as well or may even support both. I hope this helps you with your
> quest. I recall at least BlueZ supports uhid and Android uses it as
> well.
> 
> Thanks,
> Roderick
> 
> On Tue, Jul 9, 2019 at 3:32 AM Fabian Henneke <fabian.henneke@gmail.com> wrote:
>>
>> Hi,
>>
>> when testing hidraw's hid-example.c
>> (https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/samples/hidraw/hid-example.c)
>> with a Bluetooth HID device, I noticed that the write() call always
>> returns 0 on success, even though the entire buffer has been written and
>> received by the device.
>> Following the chain of calls triggered by the call to write(), I
>> identified hidp_send_message in /net/bluetooth/hidp/core.c:98
>> (https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/net/bluetooth/hidp/core.c#n98)
>> as the plausible origin of the return value. This function always
>> returns 0 on success, regardless of the value of its parameter size.
>>
>> Could you confirm whether this function is really the one used to handle
>> writes to Bluetooth HID devices? If so, is it intended behavior to have
>> write() return the number of bytes written for USB HID devices, but not
>> for Bluetooth HID devices?
