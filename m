Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D606148AB7B
	for <lists+linux-input@lfdr.de>; Tue, 11 Jan 2022 11:34:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349312AbiAKKey (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 11 Jan 2022 05:34:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39889 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1349286AbiAKKeu (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 11 Jan 2022 05:34:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1641897289;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=37dXUpdzkIbiA2gBAZJxitixVVJbpdeFZbjZh9/Jmo4=;
        b=RZR61fBF5hs+Nxd9T7A7GLQmLHVsMzGZHrWe9cbRUEmUMJxMUlIda0uUm7XBHTwW/GkULy
        B+WAKNJncQX74g/HknbyBU1bWUaVACNH7JBsGGC4/t/M41/HFSGj9ug++SNsV1ZHy68umN
        X/AUP1HOuW0ztiWAtRIIpsp8mi9sDnI=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-314-lZbAMX5TM7ysxThwS6PmQA-1; Tue, 11 Jan 2022 05:34:48 -0500
X-MC-Unique: lZbAMX5TM7ysxThwS6PmQA-1
Received: by mail-ed1-f69.google.com with SMTP id ec25-20020a0564020d5900b003fc074c5d21so8517477edb.19
        for <linux-input@vger.kernel.org>; Tue, 11 Jan 2022 02:34:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=37dXUpdzkIbiA2gBAZJxitixVVJbpdeFZbjZh9/Jmo4=;
        b=u7LEI93MW/JYoerafjB3JrzMKm5d35/jje310cDk3wGS+BweC9U2Oc8emFcxVD9qYu
         5MnqsZ1ei5XALuco0Zu20J5KuF+mBm3gS5xM3RiKZyItJo3QTS8xEs9T8hcuH7EVgJsW
         3KlMBJrrLfktf1KjKBcJIv16GgvlTP3p7zqzk9CbsHYhyP3drc/OxDgGNm4VA5nLHByI
         WNQU0L3gAuKc9KyBeYbRtiBApiYwB3MTXBsEoYfQb6luhf01Mfo6+C32qYGdz20G0+Tp
         Y1SKsxVsPUUMsmQ4BTtC/eme1T9XLHg1wHpPvl3FFH52SiXduUz3h92TLA+dgN/6x+lB
         6XJg==
X-Gm-Message-State: AOAM531cqQ9qI1mSn7TlL5ukhvXqCkyv6B/POVzjgqTemwFk6PShdQ45
        OIN9i0QT9UzO9Dk3j/yDDXDVopeMPin9EN1X9Be0xSv560T9au8NSV3F0Q1O3BRV7wvQc+vN1fN
        GBjSg84fjp8RruErjtwmvUAU=
X-Received: by 2002:a50:ef11:: with SMTP id m17mr3604248eds.77.1641897287097;
        Tue, 11 Jan 2022 02:34:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxytfC/4zVyaFEZyJkFMGdlhFnoSEUk7DE69obyXqdBB41oob5wEcvL0/bGVUh6V84FVmzg0w==
X-Received: by 2002:a50:ef11:: with SMTP id m17mr3604237eds.77.1641897286890;
        Tue, 11 Jan 2022 02:34:46 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1? (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
        by smtp.gmail.com with ESMTPSA id 26sm3464078ejk.166.2022.01.11.02.34.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Jan 2022 02:34:46 -0800 (PST)
Message-ID: <42c83ec8-bbac-85e2-9ab5-87e59a679f95@redhat.com>
Date:   Tue, 11 Jan 2022 11:34:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: Touchpad stickiness on AMD laptops (was Dell Inspiron/XPS)
Content-Language: en-US
To:     Wolfram Sang <wsa@kernel.org>,
        Andrea Ippolito <andrea.ippo@gmail.com>,
        dmitry.torokhov@gmail.com, Alex Hung <alex.hung@canonical.com>,
        linux-i2c@vger.kernel.org, linux-input@vger.kernel.org,
        platform-driver-x86@vger.kernel.org,
        Benjamin Tissoires <btissoir@redhat.com>,
        Mario Limonciello <mario.limonciello@amd.com>
References: <CAGhUXvBw4rzCQrqttyyS=Psxmhppk79c6fDoxPbV91jE7fO_9A@mail.gmail.com>
 <CAGhUXvDNj2v3O==+wWWKPYVzej8Vq+WNiBtPwmYxSQ2dTuLb9Q@mail.gmail.com>
 <CAGhUXvC8eHfxEKzkGN06VvRU6Z0ko7MJ9hF6uXNq+PxRZSbEmQ@mail.gmail.com>
 <70cbe360-6385-2536-32bd-ae803517d2b2@redhat.com> <YdbrLz3tU4ohANDk@ninjato>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <YdbrLz3tU4ohANDk@ninjato>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Wolfram,

On 1/6/22 14:14, Wolfram Sang wrote:
> Hi Hans,
> 
> bumping this old thread because there might be some progress and it
> still affects quite some people.
> 
>> But I must be honest here, I don't see much progress being made
>> on this until someone with a significant amount of kernel / hw-enablement
>> experience gets it hands on one of these models. Either because some
> 
> So, I am quite optimistic that Andrea's issue is the same one which
> Miroslav Bendik dived into [1]. I will surely try to help with part of
> the PIIX I2C driver, but I lack the experience with the RMI4 driver. I
> wonder if you could have a look and maybe share your thoughts?
> 
> Thanks and all the best,
> 
>    Wolfram
> 
> [1] https://lore.kernel.org/r/CAPoEpV0ZSidL6aMXvB6LN1uS-3CUHS4ggT8RwFgmkzzCiYJ-XQ@mail.gmail.com

Benjamin Tissoires really is the export on the synaptics PS/2 -> switch to
smbus mode devices, he did all the initial hw-enablement for them.

Benjamin, see the email Wolfram linked above. It seems that on AMD
laptops we have synaptics intertouch devices connected to a plain
PIIX4 compatible I2C controller.

So we need to either add support for SMBUS host-notify to the
PIIX4 smbus driver (at least for AMD parts) or we need to support
OOB IRQ signalling in the rmi4 code, assuming there is an OOB IRQ
at all.

I've also added Mario Limonciello from AMD's client group to the Cc,

Mario, we can really use some help / insight from AMD here, both with
the problem to detect the IO addresses of the AMD PIIX4 compatible
smbus controller as well as with smbus host-notify support, see:

https://lore.kernel.org/r/CAPoEpV0ZSidL6aMXvB6LN1uS-3CUHS4ggT8RwFgmkzzCiYJ-XQ@mail.gmail.com

Regards,

Hans

