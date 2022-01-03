Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24D8D48340E
	for <lists+linux-input@lfdr.de>; Mon,  3 Jan 2022 16:18:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233832AbiACPSR (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 3 Jan 2022 10:18:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56988 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233784AbiACPSQ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 3 Jan 2022 10:18:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1641223095;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=CEIMkt17C9IOinl1frvk+DMKevevfz2MEhIKZVeeB5Q=;
        b=C51SDqo/POkDYUBGDn6ntZdktf2c/00LqRvITo29e5tCE/mCUGC9dS+vSRtnv0fQSwLaWx
        Gqa5FvRjnfQHBgh1osjT5CRsubj7m+MJzUB2VCXKOZO2QcPScviR+0KsCljcs0T4KObalQ
        FJjgkHHXzEhCHhtKZkhuFRggqftG39Q=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-659-CkpOvaiZMtWgYW437xW3Sw-1; Mon, 03 Jan 2022 10:18:14 -0500
X-MC-Unique: CkpOvaiZMtWgYW437xW3Sw-1
Received: by mail-pf1-f197.google.com with SMTP id x128-20020a628686000000b004ba53b6ec72so16839847pfd.9
        for <linux-input@vger.kernel.org>; Mon, 03 Jan 2022 07:18:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CEIMkt17C9IOinl1frvk+DMKevevfz2MEhIKZVeeB5Q=;
        b=qLkCp6nhJ4kibneootZ9lO/J3GR6cjrka7czaVWsqZCe4GQGfqSpFq42ggfo6dnBhD
         IB/OYXRFOvA5IRi8yVjNloTjs66vngYFSuHg4yJUfGCSvOLc/r1dByOvFFTT1rJH5L3v
         TRlonrr8haH7RE7r+LasOzjS5AoJELlC2VwP3Jsqm17leJnyKzPJ5xgJecrTT28hW4ce
         KUWWToj84oIkQRx8hTUJq+NrU+zQVgiMezF7iywxtttobHrqRz9wu+qxq+jW6a9yUb6j
         JZDZBxXY99WDsntLKXcDZJkDQLFdGKvCrsghqj6Pt2fJbG6PAcXPJq1jlClgMfRGdrDL
         6zLQ==
X-Gm-Message-State: AOAM532M9KbQs6sKj6Gqi2AODL12jlO0R4FC8Abcjg1xDnuvn7cUyKjW
        N3nW/E0Lpg3H+0dxNXk5xyOx979YGsJTR6rq3P6JHL4oKX76IFtoFenQbT3r5BOdyiH4m6Wmfo3
        i0YKfQIA+VTPm8arSKOCe2WXDzFPTY8s1j+PrNhQ=
X-Received: by 2002:a17:903:1ca:b0:149:2125:9a13 with SMTP id e10-20020a17090301ca00b0014921259a13mr46029689plh.73.1641223093488;
        Mon, 03 Jan 2022 07:18:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzwmP1P83sMFaplwPG+6FcFmOfqvQixBMXlIdePQH4tX/va2UoTPh5k86u1prM2S2EKo7cR29U4TkBkJ1yseDg=
X-Received: by 2002:a17:903:1ca:b0:149:2125:9a13 with SMTP id
 e10-20020a17090301ca00b0014921259a13mr46029674plh.73.1641223093286; Mon, 03
 Jan 2022 07:18:13 -0800 (PST)
MIME-Version: 1.0
References: <20211229231141.303919-1-dmanti@microsoft.com> <20211229231141.303919-2-dmanti@microsoft.com>
In-Reply-To: <20211229231141.303919-2-dmanti@microsoft.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Mon, 3 Jan 2022 16:18:02 +0100
Message-ID: <CAO-hwJKjJofPQo9vAF9XghceuHUTdsy4U=w4LF6anS9ioTnE-g@mail.gmail.com>
Subject: Re: [PATCH v1 1/5] HID: Add BUS_SPI support when printing out device
 info in hid_connect()
To:     Dmitry Antipov <daantipov@gmail.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Felipe Balbi <balbi@kernel.org>,
        Dmitry Antipov <dmanti@microsoft.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Dec 30, 2021 at 12:11 AM Dmitry Antipov <daantipov@gmail.com> wrote:
>
> If connecting a hid_device with bus field indicating BUS_SPI print out
> "SPI" in the debug print.
>
> Signed-off-by: Dmitry Antipov <dmanti@microsoft.com>
> ---

Reviewed-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>

Cheers,
Benjamin

>  drivers/hid/hid-core.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
> index dbed2524fd47..65350ad985fe 100644
> --- a/drivers/hid/hid-core.c
> +++ b/drivers/hid/hid-core.c
> @@ -2005,6 +2005,9 @@ int hid_connect(struct hid_device *hdev, unsigned int connect_mask)
>         case BUS_I2C:
>                 bus = "I2C";
>                 break;
> +       case BUS_SPI:
> +               bus = "SPI";
> +               break;
>         case BUS_VIRTUAL:
>                 bus = "VIRTUAL";
>                 break;
> --
> 2.25.1
>

