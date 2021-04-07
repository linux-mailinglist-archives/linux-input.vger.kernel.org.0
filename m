Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E86B1356DA0
	for <lists+linux-input@lfdr.de>; Wed,  7 Apr 2021 15:43:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236387AbhDGNnJ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 7 Apr 2021 09:43:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40678 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234126AbhDGNnI (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 7 Apr 2021 09:43:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1617802976;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=4JykgxwBpXHxPgpf4Ep9lgCb1Iwtb1yo1Z+KVdCJiIU=;
        b=K6BgQUkNzvTrsiyo13WX6hamyjRD8mCnAuR5f6QKX7Bc0qc/fqL7zHWsz4e/1jam/EdfYv
        +m1Ma3WKDeiuPxob5qppBT/J6LF5OKMXEdMnsSYmZCZmLaug2Etv3tLVO9ZB5JY/6CwzSg
        RLGek62QSR2pTtxXPu2U3ShcXaMRkUY=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-154-UorCkXsuMnywvxkoFxclxA-1; Wed, 07 Apr 2021 09:42:54 -0400
X-MC-Unique: UorCkXsuMnywvxkoFxclxA-1
Received: by mail-ej1-f71.google.com with SMTP id d6so6896171ejd.15
        for <linux-input@vger.kernel.org>; Wed, 07 Apr 2021 06:42:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=4JykgxwBpXHxPgpf4Ep9lgCb1Iwtb1yo1Z+KVdCJiIU=;
        b=ljVsEwWnC5/AhyLmOCcevdLJ0pZLMgRN/hiRblCTVt5c0IP3p71Z7T5RXzW2TIhjVb
         Jx0wnDT7K4eR20srMLfQ6UrY3Hl6P+7bZrewrJQv3PRT8YJGW4qVd1xNBqCaRo/5bUAk
         evD0go5B6tzWktJIuJYipyQ1Tq2bjY/PBk24r7dsKk/h3fCc+JuX/hRUf9In1qdumNri
         7XoCBwTVKa+NexsWnObkeTZ3Fehn1Xr5JNkSqc40aMVwRbnXj1V+K8svVA2TWG8A5npM
         PZezao43yeGJGaWyHUEeLlGIaDWW0r7wBeVhCyrNLYSGftpJuxztytddrPs2Hubd9TtI
         Ykmw==
X-Gm-Message-State: AOAM532m5MXGnkL2IXwfNLQTPLQZYPyOuQ5A/jH9/ouBuWp4W/HolKaG
        JS9UAyVg4oJRIjAjMvspDJt29wU6xTJoIC534yer+Lam09dnx7+w7ntNQYMc9J4k7HsdYqEsp+G
        nmJybEunonHsmWacOn8lDjB4=
X-Received: by 2002:aa7:c1cc:: with SMTP id d12mr4642389edp.136.1617802972981;
        Wed, 07 Apr 2021 06:42:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwLWHOUjBVnbfbOvCrxRWY652+XA/iPZSKM+JJm7fNQ1uS8HH/a8rXcym4TKklzJMxhpnH+OQ==
X-Received: by 2002:aa7:c1cc:: with SMTP id d12mr4642380edp.136.1617802972863;
        Wed, 07 Apr 2021 06:42:52 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id a9sm2426599eda.13.2021.04.07.06.42.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Apr 2021 06:42:52 -0700 (PDT)
Subject: Re: [PATCH v2 resend 0/9] HID: lenovo: LED fixes and Thinkpad X1
 Tablet kbd support
To:     Jiri Kosina <jikos@kernel.org>
Cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Alexander Kobel <a-kobel@a-kobel.de>,
        Pavel Machek <pavel@ucw.cz>,
        =?UTF-8?Q?Marek_Beh=c3=ban?= <kabel@kernel.org>,
        linux-input@vger.kernel.org, linux-leds@vger.kernel.org
References: <20210404080432.4322-1-hdegoede@redhat.com>
 <nycvar.YFH.7.76.2104071250530.18270@cbobk.fhfr.pm>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <33820898-6610-df44-2cc8-6d06d489a7ea@redhat.com>
Date:   Wed, 7 Apr 2021 15:42:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <nycvar.YFH.7.76.2104071250530.18270@cbobk.fhfr.pm>
Content-Type: text/plain; charset=iso-8859-15
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 4/7/21 2:56 PM, Jiri Kosina wrote:
> On Sun, 4 Apr 2021, Hans de Goede wrote:
> 
>> Hi Jiri,
>>
>> This seems to have fallen through the cracks, again (IIRC this is the
>> second resend) can you please pick this series up?
>>
>> Patches 1 - 7 have:
>> Reviewed-by: Marek Behún <kabel@kernel.org>
>>
>> Patches 1, 4, 5, 7 have:
>> Acked-by: Pavel Machek <pavel@ucw.cz>
>>
>> With the ack from Pavel (the LED subsys maintainer) indicating that
>> there are no problems with the LED classdev API usage in these patches.
>>
>> Patches 8 - 9 are new in v2 of this series, these add support for the
>> Thinkpad X1 Tablet Thin keyboard. They have been tested by me on a
>> Thinkpad 10 ultra keyboard dock (so that that does not regress) and
>> by Alexander Kobel on a Thinkpad X1 Tablet Thin keyboard.
> 
> Now in for-5.13/lenovo,

Great, thank you.

> sorry for the delay

No problem.

Regards,

Hans

