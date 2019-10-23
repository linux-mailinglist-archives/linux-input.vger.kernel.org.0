Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 937E5E2063
	for <lists+linux-input@lfdr.de>; Wed, 23 Oct 2019 18:19:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404734AbfJWQSx (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 23 Oct 2019 12:18:53 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:27123 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S2404623AbfJWQSx (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 23 Oct 2019 12:18:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1571847532;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=42dR9KjvWxTtpNo0xdhv7ZprPq7NaqJV9H6bwrJzSyY=;
        b=E6etj9fDLjxv5bZ0iRh4vp0B+KmbGc/sOrZQ38nLrdMizVlzkJf/kmZT58ZD3ni8BA4wY7
        xIKQGTGYroZa1nab2xZmEqVG+abCt+Qv0jcdjhePY9GJNBOmwoXmQcQTJhupBYpFaR3xcb
        4zQrfdLDo0wRo+iE1FyMNxbKxyKmric=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-209-Unwoi710OE2xg5kOEkiKSQ-1; Wed, 23 Oct 2019 12:18:50 -0400
Received: by mail-wm1-f71.google.com with SMTP id g67so7550207wmg.4
        for <linux-input@vger.kernel.org>; Wed, 23 Oct 2019 09:18:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=tOBGfSTF1KhMQpx4CgtoYn86qXiufMDfXR3BQXzAiZU=;
        b=Eg4/bCjIlz/K5TV6i/9DFYC78QwTH7XUN1OWQIRz9tfi83Fq7yWTRd7TkdG/OjOBl+
         a9nzmHKI3Wahg4Vq/M0GEzgeQWR1gNmMAtGj3pRYzG7xR+70lDSx0zica+KsKB2fu7BB
         hHtJkUZG2x5bE6IbX32FybKMQSiALyOX31/0zzaLu+dgymiORfMMsqsmdzGWW32kNh4d
         chLg8kFjH/xJqhjp5oZg/B9R4TkQldRkq51NySRvNisWHwI/ftdJjLwccUlbWLdMpB9G
         k2tGFz2A61sp7inJU1ti2ap52djDYR+SwVZ4sw8pYxbsm/FCB387DNqIca2h8EELGDxx
         Bg0A==
X-Gm-Message-State: APjAAAVa/xyOhcOxn+6nz23mZPbU3zEdDK0Jz9fY1ZDh+th+1TDD8Z+y
        UqJeDDCUxNj+rtYU0RC+VXrckZiExkxvfWFJy8y/k2IPiu/nTixA7hygTIjKklDnPq/JbegQgnl
        qocnWDLyoxqj2DYKpiuEqETk=
X-Received: by 2002:a7b:c5c9:: with SMTP id n9mr752674wmk.28.1571847529564;
        Wed, 23 Oct 2019 09:18:49 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwYz1HPlsDwZXRMQfmrsug6VYnNhIgU6zeDVTcRhDmNybUK9nIvatCeNxKFr3IjmW++iM0D8A==
X-Received: by 2002:a7b:c5c9:: with SMTP id n9mr752660wmk.28.1571847529404;
        Wed, 23 Oct 2019 09:18:49 -0700 (PDT)
Received: from shalem.localdomain (2001-1c00-0c14-2800-ec23-a060-24d5-2453.cable.dynamic.v6.ziggo.nl. [2001:1c00:c14:2800:ec23:a060:24d5:2453])
        by smtp.gmail.com with ESMTPSA id x12sm12712262wru.93.2019.10.23.09.18.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Oct 2019 09:18:48 -0700 (PDT)
Subject: Re: [PATCH] Add touchscreen platform data for the Schneider SCT101CTM
 tablet
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Daniel Gorbea Ainz <danielgorbea@hotmail.com>,
        "dvhart@infradead.org" <dvhart@infradead.org>,
        "andy@infradead.org" <andy@infradead.org>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <VI1PR10MB2574F4636A90613136ACF4BED86B0@VI1PR10MB2574.EURPRD10.PROD.OUTLOOK.COM>
 <05eec4e5-927c-fdd6-037b-71520e149d5b@redhat.com>
 <CAHp75VeoUCxLt9YFPBpS3d8zOpXb7B4UbpPaiNLWAv0tm4zPHA@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <d18ca285-9a45-286f-3f61-c02059b2f9a6@redhat.com>
Date:   Wed, 23 Oct 2019 18:18:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <CAHp75VeoUCxLt9YFPBpS3d8zOpXb7B4UbpPaiNLWAv0tm4zPHA@mail.gmail.com>
Content-Language: en-US
X-MC-Unique: Unwoi710OE2xg5kOEkiKSQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 23-10-2019 18:15, Andy Shevchenko wrote:
> On Wed, Oct 23, 2019 at 7:08 PM Hans de Goede <hdegoede@redhat.com> wrote=
:
>> On 23-10-2019 17:23, Daniel Gorbea Ainz wrote:
>>> Add touchscreen platform data for the Schneider SCT101CTM tablet
>>>
>>> Signed-off-by: Daniel Gorbea <danielgorbea@hotmail.com>
>>
>> Patch looks good to me:
>>
>> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
>>
>> Daniel, I received your patch just fine, shall I resend
>> it to the list for you ?
>=20
> What list? Everything seems okay to me.
> I don't see it in patchwork, though.

Right, Daniel replied that vger@kernel.org did not like his email/patch
so it makes sense that patchwork has not picked it up.

Regards,

Hans

