Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58A14292DBF
	for <lists+linux-input@lfdr.de>; Mon, 19 Oct 2020 20:49:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730917AbgJSSta (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 19 Oct 2020 14:49:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52044 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730915AbgJSSta (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 19 Oct 2020 14:49:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1603133368;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=aikRecMjno+SH4aS4H+xMA1xt7wAVlYXO3z69lj41bc=;
        b=GZ5761XQ9gk7VS/P31mfOGyMxDlnDWSj6bmpjEJgLUh60DhGFiIob2vEKs4++r2XaKofR9
        mf/7alD4elA2axLJfg0WRW2p0eDTxGQ88mrG91w7ty/wwTjN3szS+NzfprqLzFFnRi55Eq
        FrrA1N7WQLtrdNCV/6eM1qwUu/gHGXw=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-393-pxekjBMCMQqagzgT0SlHVw-1; Mon, 19 Oct 2020 14:49:26 -0400
X-MC-Unique: pxekjBMCMQqagzgT0SlHVw-1
Received: by mail-ed1-f69.google.com with SMTP id ay19so120275edb.23
        for <linux-input@vger.kernel.org>; Mon, 19 Oct 2020 11:49:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=aikRecMjno+SH4aS4H+xMA1xt7wAVlYXO3z69lj41bc=;
        b=eQLUslCk4EJ1jFF7KGqi9uKG/+6MUwB6/2W9ltleCwk3ba3qsBIn95IDF+W//Mu3X4
         RgcYyEVilvDRyLOncozVeh5g5ao/ghDaCIctrN0jRfxuwih2+oOuE6cns+iVHeZ47mzk
         68Rztc3aBwYAH1We7DzAFrtoCIxP2XFTo5db+ksNJHq1tWdnJne520XahR5IetnxZEUv
         QsKj/xB9XiEYWVQdmlGUH7WisLwsUza80jtRaGlSAe9sWjUa8aQ40KI0b87BDgcjo2ix
         tS3BYGLuOQQSUgJrbyVWhC1D2GzgK/5oaS/9M706rOj5ikAkM7fnVenbdOV42QQCbQCP
         MFOw==
X-Gm-Message-State: AOAM530fcZFFKvkdU4bv8MQHJNnX2szGqD8VxOKtPXUZFZGLvjWU++Gr
        4HyPhgynp6uvmm/qfw4YSYnJYvAkPDcB8/8TcDGZUJOZb75PjCsvUYJ17S9UqEEoeCnYWfbTvPu
        mcWfy7TKl84+Db/AyhdyDApU=
X-Received: by 2002:a17:907:20b2:: with SMTP id pw18mr1244479ejb.159.1603133365653;
        Mon, 19 Oct 2020 11:49:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxFgO6tUPVwAfBARdrrNZ9ZbfU7aCt3jkTj4EsVGIk37NiZco1+nnFfwV+Wd6psIr45bbfttA==
X-Received: by 2002:a17:907:20b2:: with SMTP id pw18mr1244466ejb.159.1603133365418;
        Mon, 19 Oct 2020 11:49:25 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id v6sm1021770ejx.101.2020.10.19.11.49.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2020 11:49:24 -0700 (PDT)
Subject: Re: [PATCH 0/3] Lenovo lap and palm sensor support
To:     Mark Pearson <markpearson@lenovo.com>
Cc:     njoshi1@lenovo.com, dmitry.torokhov@gmail.com,
        platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org,
        jeff@labundy.com, anthony.wong@canonical.com, hadess@hadess.net
References: <markpearson@lenovo.com>
 <20201015135717.384610-1-markpearson@lenovo.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <c49d5d8a-4c20-f130-8218-1928beb3b565@redhat.com>
Date:   Mon, 19 Oct 2020 20:49:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201015135717.384610-1-markpearson@lenovo.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 10/15/20 3:57 PM, Mark Pearson wrote:
> This patch series is to add support for the Lenovo lap and palm sensors. 
> The original lap sensor implementation used a sysfs API but after
> consultation with the kernel maintainers we agreed on using the input
> subsystem instead.
> The first patch just adds the new defines needed.
> The second patch adds the implementation needed for the palm sensor.
> The third patch adds the implementation needed for the lap sensor. 
> 
> This means currently thinkpad_acpi.c has both the sysfs and input dev
> implementations. I will add a follow-on patch to remove the sysfs
> interface once I've confirmed this is OK with the few people who are
> using this in user space and given them some time to migrate to the
> input dev implementation.
> 
> Mark Pearson (3):
>   Adding event codes for Lenovo lap and palm sensors
>   Add support for Lenovo palm sensor.
>   Add support for Lenovo lap sensor

Not a full review, but one short remark, all your patch
subjects e.g. "Adding event codes for Lenovo lap and palm sensors"
are missing subsystem prefixes, if you do e.g.

git log include/uapi/linux/input-event-codes.h

You see subjects like "Input: allocate keycode for Fn + right shift",
etc. and for the the thinkpad_acpi.c code you get:
"platform/x86: thinkpad_acpi: Map Clipping tool hotkey to KEY_SELECTIVE_SCREENSHOT"

So your patch subjects should look something like this:

"Input: add event codes for lap and palmrest proximity switches"
(note I fixed more here then just the missing prefix)

"platform/x86: thinkpad_acpi: Add support for Lenovo palm sensor"
(note no . at the end)

"platform/x86: thinkpad_acpi: Add support for Lenovo lap sensor"

If you can send out a v2 with this fixed, that might help to
go Dmitry's attention for the first patch.

Regards,

Hans

