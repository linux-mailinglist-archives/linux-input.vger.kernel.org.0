Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 71B89509C0C
	for <lists+linux-input@lfdr.de>; Thu, 21 Apr 2022 11:22:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358332AbiDUJXa (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 21 Apr 2022 05:23:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1386135AbiDUJWb (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 21 Apr 2022 05:22:31 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id A3F3A25E88
        for <linux-input@vger.kernel.org>; Thu, 21 Apr 2022 02:19:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1650532780;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=/TJk/xKo1kq7ak8BVp62xin2thZhlKy1dRvBxYp9me0=;
        b=bUlXDuJHJX0ntwFP7JK6AI1DKDe4lD8KvKKDbt4la9vIssYEw97NoSSl6Ho2pEvUZ3m7PQ
        lHaKAzCnDgcjU6+BQ8uqJmgGcTLqBZMu10HaF9JJfWBh6iCeFnKRazsBYj+0dX8vZLAyHL
        vVHFE0lKLnEtqVwgDDUhGEkKPjM8ajw=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-517-_giDfOulNTWlj5zDc-W4jw-1; Thu, 21 Apr 2022 05:19:39 -0400
X-MC-Unique: _giDfOulNTWlj5zDc-W4jw-1
Received: by mail-pf1-f199.google.com with SMTP id w2-20020a62c702000000b0050671138e13so2718034pfg.9
        for <linux-input@vger.kernel.org>; Thu, 21 Apr 2022 02:19:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/TJk/xKo1kq7ak8BVp62xin2thZhlKy1dRvBxYp9me0=;
        b=FMXFsEmIcAddvtescAdEXJuiV8Gq6mrAcSWLNFP5XsditIXlxgT2f2zPhQkAKTmP7G
         yrkrgHTjuGoUJ3fiWECVoFxGSmZLLaehmg/DLNz30Kqt43AXsr8hWUTMS/LtU/Q8NWTS
         8tZkagi1pqq5qP5ZxNk9KZK8UDxDqY7Rb2IRr6//eMBVc9b5GMjw5MrA6mTGYUal/4eo
         Vm9P+yuIFQUrLLvAyluO9rB6nDgA5U2jP5ABQRAu/b2grrEPPJ+QOTiZh+ME7l6n0bQi
         02oV+3HIAiaGIZasszWEkcmm8GhDpAfk8F8eKAU6QX6zfqaMyf+SU8hOVsV9Laie5vb1
         M6pA==
X-Gm-Message-State: AOAM5321UWO0w+1BizEJ90kUZucEWzDgh3XsHgMjmbPk1xd8U1kbyon1
        Bd3lSi95iyMvQ1kDanpZcPc5ggo/7H5oJhD1wTcxC4Kk2a7DDIGymRp/N+Wm8eXkujtIHoAgAMC
        E33gweL+GM9ZZUWv7RO7DO/g1dtQHdQP8tU7CCeY=
X-Received: by 2002:a17:903:1251:b0:156:9d8e:1077 with SMTP id u17-20020a170903125100b001569d8e1077mr24534539plh.116.1650532778071;
        Thu, 21 Apr 2022 02:19:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwtFk0lzPyhaWtpqdHbSOYTsMX/Y11SPzuLozuWeHnn2yu/8zpYueh1jNMDia2LBoWH+T9MFJPKptLXX3Tv9z4=
X-Received: by 2002:a17:903:1251:b0:156:9d8e:1077 with SMTP id
 u17-20020a170903125100b001569d8e1077mr24534531plh.116.1650532777848; Thu, 21
 Apr 2022 02:19:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220416073721.3954-1-linmq006@gmail.com>
In-Reply-To: <20220416073721.3954-1-linmq006@gmail.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Thu, 21 Apr 2022 11:19:27 +0200
Message-ID: <CAO-hwJJyrPUdOm6JuzbE4Hi4pYi6hZDhf8zkJoczeOwj5jeaaA@mail.gmail.com>
Subject: Re: [PATCH] HID: elan: Fix potential double free in elan_input_configured
To:     Miaoqian Lin <linmq006@gmail.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Dinghao Liu <dinghao.liu@zju.edu.cn>,
        Alexandrov Stansilav <neko@nya.ai>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, Apr 16, 2022 at 9:37 AM Miaoqian Lin <linmq006@gmail.com> wrote:
>
> 'input' is a managed resource allocated with devm_input_allocate_device(),
> so there is no need to call input_free_device() explicitly or
> there will be a double free.
>
> According to the doc of devm_input_allocate_device():
>  * Managed input devices do not need to be explicitly unregistered or
>  * freed as it will be done automatically when owner device unbinds from
>  * its driver (or binding fails).
>
> Fixes: b7429ea53d6c ("HID: elan: Fix memleak in elan_input_configured")
> Fixes: 9a6a4193d65b ("HID: Add driver for USB ELAN Touchpad")
> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>

Acked-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>

Thanks for the patch!

Cheers,
Benjamin

> ---
>  drivers/hid/hid-elan.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/drivers/hid/hid-elan.c b/drivers/hid/hid-elan.c
> index 3091355d48df..8e4a5528e25d 100644
> --- a/drivers/hid/hid-elan.c
> +++ b/drivers/hid/hid-elan.c
> @@ -188,7 +188,6 @@ static int elan_input_configured(struct hid_device *hdev, struct hid_input *hi)
>         ret = input_mt_init_slots(input, ELAN_MAX_FINGERS, INPUT_MT_POINTER);
>         if (ret) {
>                 hid_err(hdev, "Failed to init elan MT slots: %d\n", ret);
> -               input_free_device(input);
>                 return ret;
>         }
>
> @@ -200,7 +199,6 @@ static int elan_input_configured(struct hid_device *hdev, struct hid_input *hi)
>                 hid_err(hdev, "Failed to register elan input device: %d\n",
>                         ret);
>                 input_mt_destroy_slots(input);
> -               input_free_device(input);
>                 return ret;
>         }
>
> --
> 2.17.1
>

