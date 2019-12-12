Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2909411D81A
	for <lists+linux-input@lfdr.de>; Thu, 12 Dec 2019 21:52:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730785AbfLLUvk (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 12 Dec 2019 15:51:40 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:57767 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1730749AbfLLUvk (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 12 Dec 2019 15:51:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1576183898;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=NRNh2YSKUTpyM0A83uY4bW24wuhcvt3Y7oYSZC50WKk=;
        b=Vir82WPWug3MK+V8n1GoqJ0v5xcngAq/50VbhUHyppQxy8zyVGvfy+Sjf8SnKDW+5Lfigs
        A9aLQbn0oZ9jAk3yck6qKsPGL51OAkoub2rOIxQ5G3omyBq38Bp359VotPACWb/tP9Q1ra
        l1F+orqNj2O3OquLOZsqraoOsqKo/mE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-95-0uUSEK8SNYu75MqipLayVw-1; Thu, 12 Dec 2019 15:51:36 -0500
X-MC-Unique: 0uUSEK8SNYu75MqipLayVw-1
Received: by mail-wr1-f71.google.com with SMTP id i9so1493061wru.1
        for <linux-input@vger.kernel.org>; Thu, 12 Dec 2019 12:51:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=NRNh2YSKUTpyM0A83uY4bW24wuhcvt3Y7oYSZC50WKk=;
        b=Q7PCGGNTYi+kvEV9VEpoFHcwBYnL5IGxp1AeuFHRStJFqR0moSwfpvisfGx4mssFgi
         f5blWWywXiDfXgfEPRc+rgeqjMb0QQ8O0LvheiyBZHILYRw/fmx0dQAXldTmgYRgoN94
         WVR5VoyABe2hax8lHpq4OxLLF/Zjn0KaQNAhXZ0SMujxoAGJDmg/I8qhz9NYqdeXMSQh
         3pEmcXljgh4sFXlPniQT3iL9aMyOhZBkFG2nLeEleIoF34cBCz+A4tYv7pNsEDkjNwPi
         tO3ftCxMOAfAl9kgWhGE2pxaBKsAVSXwS1hwqh1ZViJDUOa9KuSgs8MSjOW4OOFkjnPi
         pN/Q==
X-Gm-Message-State: APjAAAWjKQR2uUNpFQ6dTBdwqfvTaozh4pHjJ3pdvenWCIwp6l8Xd5H+
        xBpBUtP8ZOA9Xuo0N3iJhSz1lziqWjdxx4iMTWzAdCUmWd6pLFAZXnobYqcPfb1T6Q2eNGBjMLu
        CWTUNdilqIZgufOW+kAy/9R4=
X-Received: by 2002:a05:600c:2113:: with SMTP id u19mr8909685wml.157.1576183894583;
        Thu, 12 Dec 2019 12:51:34 -0800 (PST)
X-Google-Smtp-Source: APXvYqw4W1UB0LHh3/8RzCJZNJK5CtLR40B0iQZWSF88ELsb9/UKhEOOgg6gr6vU+h6fMFe3HP0QWg==
X-Received: by 2002:a05:600c:2113:: with SMTP id u19mr8909674wml.157.1576183894399;
        Thu, 12 Dec 2019 12:51:34 -0800 (PST)
Received: from shalem.localdomain (2001-1c00-0c0c-fe00-7e79-4dac-39d0-9c14.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:7e79:4dac:39d0:9c14])
        by smtp.gmail.com with ESMTPSA id f17sm7562451wmc.8.2019.12.12.12.51.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Dec 2019 12:51:33 -0800 (PST)
Subject: =?UTF-8?B?UmU6INCy0L7Qv9GA0L7RgSDQv9C+IHN1c3BlbmQvcmVzdW1lINCyIGdv?=
 =?UTF-8?Q?odix?=
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Dmitry Mastykin <mastichi@gmail.com>,
        Bastien Nocera <hadess@hadess.net>
Cc:     linux-input@vger.kernel.org
References: <CALieaefYFFBaFAo4E7hsESrxhN7N_tbWbeG_C6WHzwDpFiLqeQ@mail.gmail.com>
 <20191212192009.GB101194@dtor-ws>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <e2876e96-ba7d-47ff-44e0-6478b48c6fe3@redhat.com>
Date:   Thu, 12 Dec 2019 21:51:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191212192009.GB101194@dtor-ws>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 12-12-2019 20:20, Dmitry Torokhov wrote:
> Hi Dmitry,
> 
> On Thu, Dec 12, 2019 at 06:34:46PM +0300, Dmitry Mastykin wrote:
>> Здравствуйте, Дмитрий.
>> Простите, что отвлекаю, если что - не отвечайте и в лучшем случае
>> пошлите в mail-list)
>> У меня есть планшет с x86, вариантом Debian с ядром 4.15 и
>> контроллером тач-скрина gt928.
> 
> What is the model of the tablet?
> 
>> После suspend/resume не всегда, но очень часто тачскрин перестает
>> работать и постоянно выводит:
>> [ 3276.729412] Goodix-TS i2c-GDIX1002:00: I2C write end_cmd error
>> [ 3276.770153] Goodix-TS i2c-GDIX1002:00: I2C transfer error: -121
> 
> When this happens, are these messages appear constantly, or only in
> response to actual touch? Can you still interact with the device?
> 
> Could you please send the full dmesg so we know more about the device.
> 
> Hans, Bastien, have you seen such issues with Goodix occasionally
> misbehaving on resume?

We have reports of the touchscreen no longer working after suspend/resume
on some GPD pocket devices, but not combined with these errors.

Regards,

Hans


> 
>> По i2cget/i2cset контроллер успешно отвечает.
> 
> The fact that you can talk to the controller like that is interesting.
> Just to confirm, does it return sane data, or garbage?
> 
> Thanks.
> 

