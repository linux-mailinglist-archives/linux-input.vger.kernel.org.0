Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7BC07CCCA6
	for <lists+linux-input@lfdr.de>; Sat,  5 Oct 2019 22:15:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729854AbfJEUPB (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 5 Oct 2019 16:15:01 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:25609 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1729664AbfJEUPA (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sat, 5 Oct 2019 16:15:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1570306498;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=74m7R2QCNiRN5XO1W/NvGcgKkkecv4UuoVhWV1iP+dQ=;
        b=VGMr/oM1SJMP+pc9U5Hyrf1L+E/QivH9w9vb/u8xzIkU2/ueHulu5Pg71rEX8lMXZpmxCx
        6+ig8WzHroHdd89ymjk2I0AFiOUb6XO9BnD2oJ5+ZvX8P42GUioVqy7DFtmj5ExBMNxHbg
        k33biBAJrOrOPQgL1iM40gWo6l9rnOc=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-339-NaJDQnTtPR2XUjAwm7HVTA-1; Sat, 05 Oct 2019 16:14:55 -0400
Received: by mail-ed1-f71.google.com with SMTP id l9so6335444edi.8
        for <linux-input@vger.kernel.org>; Sat, 05 Oct 2019 13:14:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=tDL81Jt6nq7ggiYD7GVJv4TfLui66vmNV5jvA1q5UxI=;
        b=TWjWLXWw56UzhKHNdg6vKycQnOAaHZaly0fMeCX7AUmIf+6BgdoZz4CM2CVPgPt/un
         8Er1/dLPTjxU9ntce8w1BGPe+Bk1VtC4F7z/efPXkx/9vPpP4PbIHGM8XbDgvg2Es80s
         qjagW25yvclpcKvCEnB85kSzjWk2B/bvGazcNEa6P/lNDEc5PhGAXx0+bcubiLk8u/TL
         rMAtJn6luhClMqBgSWoe1JL6EMSFYXHkaV18qrx13a3o3jaaK/fHpX88VXTnRNXBB78W
         Ne66dT0tQ2YdQ9IBb1nBZYsbeFa2bifOhy8MpG4DvEkowF290tc1VkjV+YKMJf+egH9F
         76MQ==
X-Gm-Message-State: APjAAAUdUMeI+apH7hvxfNE/Oshd567z/deGvyzG3wtOO99h+MW+iiTC
        aUV/cnRji4W1cj9wLS9m1L6UWSkTGae0B1dEDCj5ZDj93e+Fm42/RrZkZ3arJdTLN5gwwGebxEM
        ywvjENmy+vYJAIQwVNcUevnM=
X-Received: by 2002:a50:cd1a:: with SMTP id z26mr21461290edi.75.1570306493975;
        Sat, 05 Oct 2019 13:14:53 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwVWCrzdITY+i/ypf9AQx5ArY37dHswT/NrqAvrmx3g0SZ9rXFiUE3dKcN2ZWzo1xfXVJOhQg==
X-Received: by 2002:a50:cd1a:: with SMTP id z26mr21461273edi.75.1570306493729;
        Sat, 05 Oct 2019 13:14:53 -0700 (PDT)
Received: from shalem.localdomain (2001-1c00-0c14-2800-ec23-a060-24d5-2453.cable.dynamic.v6.ziggo.nl. [2001:1c00:c14:2800:ec23:a060:24d5:2453])
        by smtp.gmail.com with ESMTPSA id c22sm2245620edc.9.2019.10.05.13.14.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Oct 2019 13:14:52 -0700 (PDT)
Subject: Re: [PATCH 5.4 regression fix] Input: soc_button_array - partial
 revert of support for newer surface devices
To:     Maximilian Luz <luzmaximilian@gmail.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Andy Shevchenko <andy@infradead.org>
Cc:     linux-input@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20191005105551.353273-1-hdegoede@redhat.com>
 <222c364a-bc2b-5960-3fe4-7d1ce222e3e2@gmail.com>
 <96cea5be-d285-8323-1ab2-9c8e87993165@redhat.com>
 <65b265d2-f7a8-bcd7-e63f-f8efb7349324@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <ef31abf6-b3f2-f3aa-1536-3ecd5fc819e1@redhat.com>
Date:   Sat, 5 Oct 2019 22:14:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <65b265d2-f7a8-bcd7-e63f-f8efb7349324@gmail.com>
Content-Language: en-US
X-MC-Unique: NaJDQnTtPR2XUjAwm7HVTA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 05-10-2019 17:01, Maximilian Luz wrote:
> Hi, again
>=20
> On 10/5/19 3:20 PM, Hans de Goede wrote:
>> Ok, on x86 the GPIO drivers really should all be builtin because
>> various ACPI methods including device D0 / D3 (power-on/off) methods
>> may depend on them. So normally this should never happen.
>>
>> If this (-EPROBE_DEFER on surface devices) somehow still is happening
>> please let me know and we will figure something out.
>=20
> I have never personally experienced this, only received reports which
> indicated this and that the change (as well as manually reloading
> soc_button_array) fixed it. I will come back to you if I hear anything
> in regards to this again.
>=20
> I have now also tested your patch on the Surface Book 2. Does not cause
> any issues as far as I can tell.
>=20
> Tested-by: Maximilian Luz <luzmaximilian@gmail.com>
>=20
> And if that is needed/wanted
>=20
> Acked-by: Maximilian Luz <luzmaximilian@gmail.com>

Great, thank you.

Regards,

Hans

