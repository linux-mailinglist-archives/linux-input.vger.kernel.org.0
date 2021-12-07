Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD2DF46B86C
	for <lists+linux-input@lfdr.de>; Tue,  7 Dec 2021 11:07:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234093AbhLGKKh (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 7 Dec 2021 05:10:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29616 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233954AbhLGKKh (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 7 Dec 2021 05:10:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1638871626;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=g5cxoOGjq9/E6NG8Fl68igBfTvJ0A+RYvfCE9iD4rhA=;
        b=il89dFNYMKqtMgZgGMcfPgn4U5m6VQjuVI+43yJ2WSFxyyecc1jpJWKY9BNNQ3oWaUojmR
        3j2sIMglIvWUkiuhfmO/EtZxvnd66/MOmD2/WWVT6NfSBbbjh5tg4YiJekvph4CWPFja8U
        TP+jCXB3r/WsfDTXlcRFYRqZd1QTvQM=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-589-KbEtvzdGP2OFBBCKxXvjYQ-1; Tue, 07 Dec 2021 05:07:05 -0500
X-MC-Unique: KbEtvzdGP2OFBBCKxXvjYQ-1
Received: by mail-ed1-f69.google.com with SMTP id m17-20020aa7d351000000b003e7c0bc8523so11006997edr.1
        for <linux-input@vger.kernel.org>; Tue, 07 Dec 2021 02:07:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=g5cxoOGjq9/E6NG8Fl68igBfTvJ0A+RYvfCE9iD4rhA=;
        b=dleGz0wWW3Oaux4N9WHLyux/Kbkq4KSD/7m4pUn4pAbPuzjRkN2kDnY56CPvEBLWVM
         czJKqzUpk+7fCenYunb6Le2OIuN6J7DOK2Y/5ojWTjthk364Gr9fUttvV2irb7zd3RHj
         ZU9U9kX9H/h4bH0pGaxz9Zyv9yudqHyZjDIrgxDebCvCZBbJE/JZYwW23Jo36FBYaYYj
         GHCwyO8Meily9vX11B59b6kCV6CZdaCZskpsm7NADvm/vIo4Hn1h92PzYgMq5mNihV4C
         MHCbSs5iU5ALyAamTjtdaTcdqm5Lxb3lIvmZMj4ijIBnK2Bg4xtzw0IrDB5JiX1BHFx6
         gHrw==
X-Gm-Message-State: AOAM531zdy8wXcIZgPVvH/GujpZNFnNgEJek/Kq9wk2xxqm0x30WfdZP
        C8mmvxM4ND4hET1hYr5h5QruK/oanczxYQAzcsGO1BObMwJnFJmPivlhImiT2zfPAsMeA75PgkG
        OhU+MRXQnRAUu9MotDgBQBCU=
X-Received: by 2002:a17:907:7094:: with SMTP id yj20mr51797430ejb.265.1638871624555;
        Tue, 07 Dec 2021 02:07:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzB3ItxP8+xgxlGraaPtQUUiqaZTHZxV2s2bOvo603ccpIFjFlLaG3FSlMpJly8G/UiZl7Fqg==
X-Received: by 2002:a17:907:7094:: with SMTP id yj20mr51797393ejb.265.1638871624170;
        Tue, 07 Dec 2021 02:07:04 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1054:9d19:e0f0:8214? (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id e26sm10081417edr.82.2021.12.07.02.07.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Dec 2021 02:07:03 -0800 (PST)
Message-ID: <90d371ae-550c-c2ee-a475-93d29f8c06d0@redhat.com>
Date:   Tue, 7 Dec 2021 11:07:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 2/4] Input: goodix - Improve gpiod_get() error logging
Content-Language: en-US
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Bastien Nocera <hadess@hadess.net>, linux-input@vger.kernel.org
References: <20211206164747.197309-1-hdegoede@redhat.com>
 <20211206164747.197309-3-hdegoede@redhat.com> <Ya8Nzkh+VwcQCUIi@google.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Ya8Nzkh+VwcQCUIi@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Dmitry,

On 12/7/21 08:31, Dmitry Torokhov wrote:
> Hi Hans,
> 
> On Mon, Dec 06, 2021 at 05:47:45PM +0100, Hans de Goede wrote:
>> goodix_get_gpio_config() errors are fatal (abort probe()) so log them
>> at KERN_ERR level rather then as debug messages.
>>
>> This change uses dev_err_probe() to automatically suppress the errors
>> in case of -EPROBE_DEFER.
> 
> I really believe that dev_err_probe() is wrong API as the providers
> should be setting the reason for deferred probe failures.
> 
> Could you simply swap dev_dbg() for dev_err()?

Done for v2, which I'm sending out right away.

Note I've dropped the first patch for v2 since you said you
applied this.

Regards,

Hans


p.s.

Any chance you could also take a look at this 2 patch patch-series,
this has been pending for a while now:

https://lore.kernel.org/linux-input/20211122220637.11386-1-hdegoede@redhat.com/T/#t

