Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83CC237F874
	for <lists+linux-input@lfdr.de>; Thu, 13 May 2021 15:16:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233293AbhEMNRD (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 13 May 2021 09:17:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32418 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232733AbhEMNRB (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 13 May 2021 09:17:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1620911746;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=qsfYYVuA4z4/qDu23wSBRsngQvHS7+tVBTsrP7EpQa4=;
        b=ZSS0Ow0yVIj/8djFDi37KJEZxlXFxH8bgoFVsPn4vJ7s9q1eknKlpRcl7jnOJ+9iQ+XvJh
        zj0+ZqlvlsImzJR6/+aPAEWTXVwaJXARh6RILXozv3qzgfA5x01mnnewA7EY7+XHeNsrgM
        KRFvlGjFYEzjcV+xYHGj1+bwEYrblk4=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-352-zA4FPfgbO5S2gcOBcE8zvQ-1; Thu, 13 May 2021 09:15:41 -0400
X-MC-Unique: zA4FPfgbO5S2gcOBcE8zvQ-1
Received: by mail-qv1-f69.google.com with SMTP id d11-20020a0cdb0b0000b02901c0da4391d5so21386784qvk.12
        for <linux-input@vger.kernel.org>; Thu, 13 May 2021 06:15:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=qsfYYVuA4z4/qDu23wSBRsngQvHS7+tVBTsrP7EpQa4=;
        b=Vnh9Ic3NbyFudR86u80oZiKEmHaNH9ZDw971I05UBDkWgnuXjUvUQK3Ixv3vcHhEyV
         TkMn98JgycEbQK1wKgPKf+tec81zvER0IiV2F/EwGi6XDIKorYjUC+9Jaxd6HDSc8+Ma
         AgYYoYcnwfHxPAr9RNL4vhCE/ysYrxt1KcXOc+bsWotLeVKmBSkc8cOXzczzaQNIDTzV
         5LZ8Dqn/qsSg+pRq1ZhBfZDITJ6PX7vx17Gdljp5lgdVRhGpLYi5cSItkjTNVz6/rFV/
         9OzuRO+Kkp02Fu88V+28bkqSfXRZPGX3fUdVoP2Fg44XJ0/gEzRAADa1aD1Ob7epRdZg
         WkGw==
X-Gm-Message-State: AOAM532+oaeZwEa/xl0gY8cWtvSftttaGgCSVp+YPlRqMxY/nEF8FdRn
        tpW8guE5xN3NuQx5GviU/c3xZByxGw0rfLnejuxNDX9MWaiMcp8vX9qxxVN1dMG1qAvNIPwZjbu
        lq+12k87neb7Np8/psFVVQMw=
X-Received: by 2002:a05:622a:341:: with SMTP id r1mr9994080qtw.307.1620911741378;
        Thu, 13 May 2021 06:15:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzwEjyY3u1J/G6+Cm8z9/t8ewZ6vW2TOaD0qCa1us8rfNgrCbblKdYRP+6ulsrYSiTB+uVbAA==
X-Received: by 2002:a05:622a:341:: with SMTP id r1mr9994062qtw.307.1620911741198;
        Thu, 13 May 2021 06:15:41 -0700 (PDT)
Received: from localhost.localdomain (075-142-250-213.res.spectrum.com. [75.142.250.213])
        by smtp.gmail.com with ESMTPSA id l10sm2519572qtn.28.2021.05.13.06.15.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 May 2021 06:15:40 -0700 (PDT)
Subject: Re: [PATCH v4] HID: ft260: improve error handling of
 ft260_hid_feature_report_get()
To:     Jiri Kosina <jikos@kernel.org>,
        Michael Zaidman <michael.zaidman@gmail.com>
Cc:     benjamin.tissoires@redhat.com, linux-i2c@vger.kernel.org,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210511101208.16401-1-michael.zaidman@gmail.com>
 <nycvar.YFH.7.76.2105131308260.28378@cbobk.fhfr.pm>
From:   Tom Rix <trix@redhat.com>
Message-ID: <8c48cdcc-ee47-3352-4023-db24b7a94759@redhat.com>
Date:   Thu, 13 May 2021 06:15:38 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <nycvar.YFH.7.76.2105131308260.28378@cbobk.fhfr.pm>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


On 5/13/21 4:09 AM, Jiri Kosina wrote:
> On Tue, 11 May 2021, Michael Zaidman wrote:
>
>> Fixes: 6a82582d9fa4 ("HID: ft260: add usb hid to i2c host bridge driver")
>>
>> The ft260_hid_feature_report_get() checks if the return size matches
>> the requested size. But the function can also fail with at least -ENOMEM.
>> Add the < 0 checks.
>>
>> In ft260_hid_feature_report_get(), do not do the memcpy to the caller's
>> buffer if there is an error.
>>
>> ---
>> v4   Fixed commit message
>> ---
>> v3   Simplify and optimize the changes
>> ---
>> v2:  add unlikely()'s for error conditions
>> ---
>>
>> Signed-off-by: Tom Rix <trix@redhat.com>
>> Signed-off-by: Michael Zaidman <michael.zaidman@gmail.com>
> Who should be the author of the git commit?

Go with the latest patch's author, Micheal.

Tom

>
> Thanks,
>

