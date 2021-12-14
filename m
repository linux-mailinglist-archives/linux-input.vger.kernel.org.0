Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0BED047428E
	for <lists+linux-input@lfdr.de>; Tue, 14 Dec 2021 13:30:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231844AbhLNMaL (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 14 Dec 2021 07:30:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60507 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229867AbhLNMaL (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 14 Dec 2021 07:30:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1639485010;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=eTyFG3YsB7tsSM37catQ8Lu85xm2DMPfWO+OkIfmBBA=;
        b=I3q8W67chYcLkBoLRkk/iG2CcmfPBK8R7pSN8ILaY1pvRUp2gZZnA3bkQ1v3nTNYz3ufhW
        ksFT+kPdpODqZSZ7nNs22+u6Y0AUe7wdkxgM9lDOkmgZbcLgoJEiACZHWW5hehd9nXaxkI
        bnvtwMI5VnZP3nZHNRqsk8eKKib5rBc=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-318-zCMmdimJO1uENAjNQDjIxw-1; Tue, 14 Dec 2021 07:30:09 -0500
X-MC-Unique: zCMmdimJO1uENAjNQDjIxw-1
Received: by mail-pf1-f199.google.com with SMTP id a23-20020a62bd17000000b004a3f6892612so11733537pff.22
        for <linux-input@vger.kernel.org>; Tue, 14 Dec 2021 04:30:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eTyFG3YsB7tsSM37catQ8Lu85xm2DMPfWO+OkIfmBBA=;
        b=iBazXe2eh4NJ/04atDYp+YVTRHRq5jGnTym0y/90rk1Jqh5EPhVjBjXy3tBVJ6bAwu
         2lTafCgwpaJMjrXki8tOlhvFvSywZdUbWPhZ70sr/losqUDPy0Jfg/8qDDGhoo9EiqhU
         WuRTmLMB8lT7pU3eAtl3IdSItyRQcLP6OnfghydkPfYYxh6RUp97PtNd0XE4w4xF2YbT
         7kOy6R7n7B+ECm3Z80ryp/ppJs5AmAw192uHxasoS/r1UVWSnWt9pi5iaRMjD9GdPtE+
         lVYQZ/HVCZJMJoXRu5IGQroMSM2MB+KVeqLyDwU8nLRshiRARyfdTJHi0dRaP6d8xCGM
         Jmsw==
X-Gm-Message-State: AOAM530W6ltnjYr6OBkhjYghMyNbkeRRCrSQXo8Tj/3Ydsok2RE2u6Ka
        kTpkSrybld2uO7QJR6DvbWq/zQS/xynNHZ9h3BnQ7sNlN+NqqRvtgAcg2da2XWKdqR14eHMTP9N
        HNC6lU97sh+SZ5QPOgbRcOjGsVwQq/B8XLtM2+1I=
X-Received: by 2002:a17:902:6acb:b0:142:76c3:d35f with SMTP id i11-20020a1709026acb00b0014276c3d35fmr5472920plt.89.1639485008524;
        Tue, 14 Dec 2021 04:30:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx6mDUnSBRe9EuywU5VMlaoigZvD5cthorjYWy2TS8h5Ou6Ps7fBokraV9xsXSIWnH5IKI0i8VhUTjngJhNgWo=
X-Received: by 2002:a17:902:6acb:b0:142:76c3:d35f with SMTP id
 i11-20020a1709026acb00b0014276c3d35fmr5472887plt.89.1639485008236; Tue, 14
 Dec 2021 04:30:08 -0800 (PST)
MIME-Version: 1.0
References: <20211109082610.131341-1-chi.minghao@zte.com.cn>
In-Reply-To: <20211109082610.131341-1-chi.minghao@zte.com.cn>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Tue, 14 Dec 2021 13:29:57 +0100
Message-ID: <CAO-hwJL5wqfF48FFyGXFyLcuRJ0czJJjt9g=7jfdcSCumACfcQ@mail.gmail.com>
Subject: Re: [PATCH] drivers:hid: use swap() to make code cleaner
To:     cgel.zte@gmail.com
Cc:     Jiri Kosina <jikos@kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        chiminghao <chi.minghao@zte.com.cn>,
        Zeal Robot <zealci@zte.com.cn>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On Tue, Nov 9, 2021 at 9:26 AM <cgel.zte@gmail.com> wrote:
>
> From: chiminghao <chi.minghao@zte.com.cn>
>
> Fix the following coccicheck REVIEW:
> Use swap() instead of reimplementing it.
>
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: chiminghao <chi.minghao@zte.com.cn>
> ---

Amended the commit title to match what we do generally in the HID tree
and applied to for-5.17/thrustmaster.

Thanks for the patch!

Cheers,
Benjamin

>  drivers/hid/hid-tmff.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/hid/hid-tmff.c b/drivers/hid/hid-tmff.c
> index 90acef304536..4040cd98dafe 100644
> --- a/drivers/hid/hid-tmff.c
> +++ b/drivers/hid/hid-tmff.c
> @@ -78,7 +78,6 @@ static int tmff_play(struct input_dev *dev, void *data,
>         struct hid_field *ff_field = tmff->ff_field;
>         int x, y;
>         int left, right;        /* Rumbling */
> -       int motor_swap;
>
>         switch (effect->type) {
>         case FF_CONSTANT:
> @@ -104,11 +103,8 @@ static int tmff_play(struct input_dev *dev, void *data,
>                                         ff_field->logical_maximum);
>
>                 /* 2-in-1 strong motor is left */
> -               if (hid->product == THRUSTMASTER_DEVICE_ID_2_IN_1_DT) {
> -                       motor_swap = left;
> -                       left = right;
> -                       right = motor_swap;
> -               }
> +               if (hid->product == THRUSTMASTER_DEVICE_ID_2_IN_1_DT)
> +                       swap(left, right);
>
>                 dbg_hid("(left,right)=(%08x, %08x)\n", left, right);
>                 ff_field->value[0] = left;
> --
> 2.25.1
>

