Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30DE546D6CB
	for <lists+linux-input@lfdr.de>; Wed,  8 Dec 2021 16:19:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235887AbhLHPXK (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 8 Dec 2021 10:23:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33927 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235879AbhLHPXK (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 8 Dec 2021 10:23:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1638976778;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=mBq1iNWuKAbDrZ8J23xOdNqfh1OrTD+2svsf/GF1r6U=;
        b=QJYfcYY2ubHYFgcLiAN4MRgtIacngXFAmdhWG5mHIZGCJBJSoKn5oKSaw2e2vkQQ9C8l3s
        2v9Gv3eByu4td9toMnYMV1PqYQgSFVmsv3QWDfOX9mX3B3+Ek9sS3tnPsTnfSXWpwmrx7o
        87t7oMCo/6TfC2f961hlT9oxIzq8fjc=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-591-_A1dcb0ZN4S40It-hKwUfA-1; Wed, 08 Dec 2021 10:19:36 -0500
X-MC-Unique: _A1dcb0ZN4S40It-hKwUfA-1
Received: by mail-pf1-f197.google.com with SMTP id b26-20020aa7951a000000b004a815eb3a3aso1730328pfp.16
        for <linux-input@vger.kernel.org>; Wed, 08 Dec 2021 07:19:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mBq1iNWuKAbDrZ8J23xOdNqfh1OrTD+2svsf/GF1r6U=;
        b=CEUadPyN0MYxKjVbLBYdS0RCeU0SVVWwdDHTN6FrfDPebtO6iyg0ZyCVYMalYvq56m
         hrxkroaC5InxVEOSmk6+lBIfbiLZ+ZpvTof3c5Fa6IvAr5iZMJo6b9RFffpJp0RzCZPp
         0SHSdVsl/+05W/GRISZOJl6G/A7I51PY6F4K61Cdh9IR7xdvY+o0Ow3yW1mm958j46GV
         atZmT7R6vrNPfZ/KEMiUhif4IT3ueLmPQ6epPSlGX35MaxAn2ZAqrkUTkuPfw+uitqcl
         nDDT5bR+1QwOwlXfbGtljlOw9Rtvq3m8nzxlcC3DzvVwgLTM/8jk1gKFm/JCkELSaIn5
         mn/g==
X-Gm-Message-State: AOAM533n8nGtFvm8gWY92/W92B2XH8rcKKyS9+Ndgn0cffX3Bws0Q0tS
        C9RnJLpL6nL2XJwRqEP1qdy9SRuUwfSNGxJTSYlZf72G8JMhrdLF9FSPl0vU6XLwd4h0y5fLgY1
        si337Thq2ZCh2dkcd4Wx0Jb0ns3k5bq1661m2kLA=
X-Received: by 2002:a17:90b:1185:: with SMTP id gk5mr7910561pjb.113.1638976775681;
        Wed, 08 Dec 2021 07:19:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwklgyiSO6Zvc5u9rR6zXqW094LW7vRS1FrHYnDwUZd466ZCWZfjkhr+OZulvTLLRJpkV6JmzebqkIaq9LDa/8=
X-Received: by 2002:a17:90b:1185:: with SMTP id gk5mr7910531pjb.113.1638976775444;
 Wed, 08 Dec 2021 07:19:35 -0800 (PST)
MIME-Version: 1.0
References: <20211201164301.44653-1-tero.kristo@linux.intel.com> <20211201164301.44653-5-tero.kristo@linux.intel.com>
In-Reply-To: <20211201164301.44653-5-tero.kristo@linux.intel.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Wed, 8 Dec 2021 16:19:24 +0100
Message-ID: <CAO-hwJKikRFfqXfEG-oU8Hg6v78b9928XKEdh-Uti97Jsy=Z0g@mail.gmail.com>
Subject: Re: [RFCv3 4/7] HID: input: Make hidinput_find_field() static
To:     Tero Kristo <tero.kristo@linux.intel.com>
Cc:     "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Jiri Kosina <jikos@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        lkml <linux-kernel@vger.kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Peter Hutterer <peter.hutterer@who-t.net>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Dec 1, 2021 at 5:43 PM Tero Kristo <tero.kristo@linux.intel.com> wrote:
>
> From: Mika Westerberg <mika.westerberg@linux.intel.com>
>
> This function is not called outside of hid-input.c so we can make it
> static.
>
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Reviewed-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>

Cheers,
Benjamin

> ---
>  drivers/hid/hid-input.c | 4 ++--
>  include/linux/hid.h     | 1 -
>  2 files changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/hid/hid-input.c b/drivers/hid/hid-input.c
> index b428ee9b4d9b..f6332d269d49 100644
> --- a/drivers/hid/hid-input.c
> +++ b/drivers/hid/hid-input.c
> @@ -1477,7 +1477,8 @@ void hidinput_report_event(struct hid_device *hid, struct hid_report *report)
>  }
>  EXPORT_SYMBOL_GPL(hidinput_report_event);
>
> -int hidinput_find_field(struct hid_device *hid, unsigned int type, unsigned int code, struct hid_field **field)
> +static int hidinput_find_field(struct hid_device *hid, unsigned int type,
> +                              unsigned int code, struct hid_field **field)
>  {
>         struct hid_report *report;
>         int i, j;
> @@ -1492,7 +1493,6 @@ int hidinput_find_field(struct hid_device *hid, unsigned int type, unsigned int
>         }
>         return -1;
>  }
> -EXPORT_SYMBOL_GPL(hidinput_find_field);
>
>  struct hid_field *hidinput_get_led_field(struct hid_device *hid)
>  {
> diff --git a/include/linux/hid.h b/include/linux/hid.h
> index 96eaca0d5322..3f1fd4fcf1a9 100644
> --- a/include/linux/hid.h
> +++ b/include/linux/hid.h
> @@ -636,7 +636,6 @@ extern void hidinput_disconnect(struct hid_device *);
>
>  int hid_set_field(struct hid_field *, unsigned, __s32);
>  int hid_input_report(struct hid_device *, int type, u8 *, u32, int);
> -int hidinput_find_field(struct hid_device *hid, unsigned int type, unsigned int code, struct hid_field **field);
>  struct hid_field *hidinput_get_led_field(struct hid_device *hid);
>  unsigned int hidinput_count_leds(struct hid_device *hid);
>  __s32 hidinput_calc_abs_res(const struct hid_field *field, __u16 code);
> --
> 2.25.1
>

