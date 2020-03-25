Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2BB27192ABE
	for <lists+linux-input@lfdr.de>; Wed, 25 Mar 2020 15:06:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726086AbgCYOGA (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 25 Mar 2020 10:06:00 -0400
Received: from us-smtp-delivery-74.mimecast.com ([216.205.24.74]:44823 "EHLO
        us-smtp-delivery-74.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726074AbgCYOGA (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 25 Mar 2020 10:06:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1585145159;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=CfxMcpLD7jCp142zt0/3ZTXyWkUuQbWYLuxhoYqF4Pw=;
        b=ZaQVzNxVqEmuXCliihxyGl/Fr/6CNQFFCR47AHpGUTdDup3tVyeOWa51s2/luqWQLT4XAs
        3HUS8huncCW4JzkjUFD9j6F0vjpsGibS+qAVGicl7aNVemaTYmtfwczoW2oc5XaFvWDm2q
        hY/zoR5YwEamPLnNtDM4ULrjGoG9X6A=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-365-w1NTc1FRNc6yl5DJtOHwkw-1; Wed, 25 Mar 2020 10:05:57 -0400
X-MC-Unique: w1NTc1FRNc6yl5DJtOHwkw-1
Received: by mail-wr1-f70.google.com with SMTP id y1so1198853wrn.10
        for <linux-input@vger.kernel.org>; Wed, 25 Mar 2020 07:05:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=CfxMcpLD7jCp142zt0/3ZTXyWkUuQbWYLuxhoYqF4Pw=;
        b=IHaOQT/BKsF0rAYrxwTIKd4iiRpx3i/DpYraBoTYQGm0BQfZqM5a6zfmvv8ZmqFSGl
         FP7SbofCEGPt2mGWiQ93xSptc+zdqRGe4h23ZHgmt4Cwn9sF6oLVLUcEqlfo/4dIOCI8
         0sPCMqXZp6U//tIsONf+SfZVIkz2GUQtJ8641yt2QRMfd/L0jYZA3pY73JqS+1YJOVZ8
         a8INCIINt9c/vQqP4Y/oMNmUTSfGNciIYqFqz2+Q3QxnREfsQcm21raAQXGyqrBzJejX
         6xV0f9EbIZB7El3it00dtXd7HWmvxUnWvY42DrY7Rrm7PU8jHKvw2fJkYN/rAsW9wv0R
         jyjQ==
X-Gm-Message-State: ANhLgQ2ZGR4EF4hV0gx5MUMPkyahd3J0dB7kqTEGXlsLNhpubykDI0bb
        ba0Y3BYDNJLpnyHW6VQCB7jFJ8na3uummW2wSqW2qYNa7fqaiJa+5YbIbfc4icaHcsiTu4UJ2gS
        RbE3fpDphauEjkVESmj1fgOk=
X-Received: by 2002:a1c:6a1a:: with SMTP id f26mr3650234wmc.55.1585145154163;
        Wed, 25 Mar 2020 07:05:54 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vvGeYO/HtZkE2/aR8dAD6wdyeTVD0ES8axn5RN7/3GLQzHGmke7aQx8pAOemrPVWIUi2NJEcw==
X-Received: by 2002:a1c:6a1a:: with SMTP id f26mr3650216wmc.55.1585145153975;
        Wed, 25 Mar 2020 07:05:53 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-fc7e-fd47-85c1-1ab3.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:fc7e:fd47:85c1:1ab3])
        by smtp.gmail.com with ESMTPSA id z12sm35493148wrt.27.2020.03.25.07.05.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2020 07:05:53 -0700 (PDT)
Subject: Re: [PATCH] Input: goodix - Fix compilation when ACPI support is
 disabled
To:     Bastien Nocera <hadess@hadess.net>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, kbuild test robot <lkp@intel.com>
References: <20200325103348.108792-1-hdegoede@redhat.com>
 <9f4df3fdc54448728582ea35f4d3a08411f6aba5.camel@hadess.net>
 <6611fe58-8e3d-d443-9dd1-6ed9086fa752@redhat.com>
 <1db6a35732a2c191ff56043f1ae357d8ae1b5b10.camel@hadess.net>
 <5aca9fe9-3751-f0f6-9851-5d9a0c048388@redhat.com>
 <be555dbf9c8508c5b8d9ed561384c66d76326241.camel@hadess.net>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <3ed2db45-0fd6-694e-023d-427cb8854f81@redhat.com>
Date:   Wed, 25 Mar 2020 15:05:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <be555dbf9c8508c5b8d9ed561384c66d76326241.camel@hadess.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 3/25/20 3:02 PM, Bastien Nocera wrote:
> On Wed, 2020-03-25 at 14:55 +0100, Hans de Goede wrote:
>> We could do something like that, but TBH I'm not a fan of that
>>
>> adding extra wrappers makes it harder to see what the code is
>>
>> actually doing.
>>
>>
>>
>> I understand your dislike for the extra braces I added and
>>
>> I'm fine with fixing that by adding __maybe_unused to the
>>
>> variable declarations at the top. I don't really see what
>>
>> the problem with the #ifdef-s is given how clean they are,
>>
>> with the braces thing fixed by using __maybe_unused things
>>
>> would look like e.g. this:
> 
> It's not only the fact that there's extra #ifdef's, it's that the
> ifdef's need to be just "that". It's not "#ifdef FOO", it's "#if
> defined CONFIG_X86 && defined CONFIG_ACPI".

If that is the problem I would prefer adding:

/* Our special handling for GPIO accesses through ACPI is x86 specific */
#if defined CONFIG_X86 && defined CONFIG_ACPI
#define ACPI_GPIO_SUPPORT
#endif

And use:

#ifdef ACPI_GPIO_SUPPORT

Elsewhere.

Would that work for you?

Regards,

Hans

