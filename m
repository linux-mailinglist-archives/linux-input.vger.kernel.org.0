Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EBCCF446860
	for <lists+linux-input@lfdr.de>; Fri,  5 Nov 2021 19:30:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231878AbhKEScm (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 5 Nov 2021 14:32:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40940 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229504AbhKEScl (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 5 Nov 2021 14:32:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1636137001;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=q0ibc6O3PYfeNoUD8Hno1Eg7DzvFjxEzh6a4kwFLGOE=;
        b=JYluSkAMoTyv7/1zoWH9t3r2DEB6v+4LGUVK0VQd3zKUmNEONsxHmnKpq37UIzEHJ9emmn
        PlZLmRkKAC0lxI9/mQDvJzscnDU/AxgAVg3bp0HnImbYWhRCEzgpGqq0yPoeQhZPU1sUAx
        8obBYDc37F4Nrf1r+9E8w17JE2Lziug=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-210-I22zqwuVNPmsaUAXPcxfCw-1; Fri, 05 Nov 2021 14:30:00 -0400
X-MC-Unique: I22zqwuVNPmsaUAXPcxfCw-1
Received: by mail-pf1-f199.google.com with SMTP id t62-20020a625f41000000b004807e0ed462so6225680pfb.22
        for <linux-input@vger.kernel.org>; Fri, 05 Nov 2021 11:29:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=q0ibc6O3PYfeNoUD8Hno1Eg7DzvFjxEzh6a4kwFLGOE=;
        b=Nr6R1ALuFSrAU4OLsC57cVO4XSgTmncUbnvbPgj+F/eCeR41OJTjekazxdjTV/OPVG
         Hv5sOTWjbirUxi9lioUn64eu7JtvlveQQ4DiUSQyiiEp5MHCyjSqF/V7n3cwpwOHSQGg
         +5C1j1KVCgPq4tERsos+v32FHsoFqZEwI9C0FHI84QI0Ba8cAvDC2Td6rg/r9ZK0Os4I
         K1QxjVGX3C8+YnuA5yL+/5VVCgDWQ4hYOsYmvwgYEsgEfohyH4eIAXQRV11T/iUmIRHT
         WNi7/NxAjfff6AEBhY2dUHXcI5HEQU66H9yr58JD/7LVaTTAPs3RuHsw+JWradyv5NwG
         I+Hw==
X-Gm-Message-State: AOAM5319fvz+pXB8tFsHynmwfVfCviT1MscaEYWOEaQ4HuCPn2tQqRsN
        8Wc3it3zKMXHIBZraFy7KLYIr46BESQLmazz9JPkJLSHWIcdMxDetPj/BxDnhRT+q/esu+kiJ6E
        Ws9IjPRH7P7EHiBBS+No6o5A9CBEKZwxD9tz1fas=
X-Received: by 2002:a17:902:aa84:b0:142:36cb:2a47 with SMTP id d4-20020a170902aa8400b0014236cb2a47mr11145133plr.89.1636136999067;
        Fri, 05 Nov 2021 11:29:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyPXPuim2CHer0bDcCHkohpwv2IwRwJ+RNXARPLcRSEeV3dEOlycJbdPWX/R942R7MJhYZgvAPwlZwgcTiRZqE=
X-Received: by 2002:a17:902:aa84:b0:142:36cb:2a47 with SMTP id
 d4-20020a170902aa8400b0014236cb2a47mr11145109plr.89.1636136998822; Fri, 05
 Nov 2021 11:29:58 -0700 (PDT)
MIME-Version: 1.0
References: <1636013269-3433050-1-git-send-email-jiasheng@iscas.ac.cn>
In-Reply-To: <1636013269-3433050-1-git-send-email-jiasheng@iscas.ac.cn>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Fri, 5 Nov 2021 19:29:47 +0100
Message-ID: <CAO-hwJLX8N1rBXguaj9nN9jyqz8txaMtMkAge4GSch++uFbtoA@mail.gmail.com>
Subject: Re: [PATCH] HID: ite: Add parse before start
To:     Jiasheng Jiang <jiasheng@iscas.ac.cn>
Cc:     Jiri Kosina <jikos@kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Jiasheng,

On Thu, Nov 4, 2021 at 9:08 AM Jiasheng Jiang <jiasheng@iscas.ac.cn> wrote:
>
> It might be better to add  hid_parse() before
> wacom_parse_and_register() to ask for the report descriptor.

seems like a copy/paste error when working on 2 different drivers.

>
> Fixes: 3c785a0 ("HID: ite: Replace ABS_MISC 120/121 events with touchpad on/off keypresses")
> Signed-off-by: Jiasheng Jiang <jiasheng@iscas.ac.cn>
> ---
>  drivers/hid/hid-ite.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/hid/hid-ite.c b/drivers/hid/hid-ite.c
> index 14fc068..3c56f75 100644
> --- a/drivers/hid/hid-ite.c
> +++ b/drivers/hid/hid-ite.c
> @@ -100,6 +100,10 @@ static int ite_probe(struct hid_device *hdev, const struct hid_device_id *id)
>         if (ret)
>                 return ret;
>
> +       ret = hid_parse(hdev);

hid_parse() is an inline definition of hid_open_report() which is
called just above.
So here you are asking to call the same code twice, which is suboptimal.

Cheers,
Benjamin

> +       if (ret)
> +               return ret;
> +
>         return hid_hw_start(hdev, HID_CONNECT_DEFAULT);
>  }
>
> --
> 2.7.4
>

