Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99C883047FE
	for <lists+linux-input@lfdr.de>; Tue, 26 Jan 2021 20:16:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727257AbhAZFxi (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 26 Jan 2021 00:53:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25779 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726056AbhAYJPY (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 25 Jan 2021 04:15:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1611565981;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=z6HAUaL66VmRs9IXdRIQEq0vq86CNUbZkJ41gCNQKso=;
        b=TLVB0uoIalq1oHKyl7ueOKGwyqNHjmRDBi2Cf0HO3UMxLf8TJTtCZ9JyalViMAjgErbrxm
        igIccrUKeFbyXFIVg6/TXAbyo1Rykn1KfGnxW5+aSv5tfvYqiXyds3fzdmyoFgxHiF3kZx
        gUeuVZhojYTa0r3ZM9k8vx0KM45z/og=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-236-niLrJ0QsNWSwTC1iyIevwQ-1; Mon, 25 Jan 2021 04:06:08 -0500
X-MC-Unique: niLrJ0QsNWSwTC1iyIevwQ-1
Received: by mail-pg1-f199.google.com with SMTP id t17so7596336pgu.1
        for <linux-input@vger.kernel.org>; Mon, 25 Jan 2021 01:06:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=z6HAUaL66VmRs9IXdRIQEq0vq86CNUbZkJ41gCNQKso=;
        b=qx0BPpKw5beFIUAigOmgLMpt20+cBXP6b8wB39xqikYtoozetvgUIRqJEmSU28YdgA
         CvxRAS6KtnNaoa8caL9dXvfSs7TInQj1trADDlGXSOk6JYQUHAdCDaeKysgTiplEZUW8
         K7lYBsvqqrQdVAtF8DCuLU9pNIE3yIuxiqh7qdwUADA60vhv2SEevs2PZsnk82GK9u4U
         kNiBXiIxvPlNEHNp5WT0wwwzfVjZAZ5HQkQGINYdy5xImlmwqJf6mc3zsp2bCxrfOyG8
         /PhsROyFx9UeUDEsxzUeOAM0VrP91pabl4TK1YNcdP961UpVE8GjBKgpRVjQUQP8qN9n
         5Efw==
X-Gm-Message-State: AOAM531gFzkqehdHKZugkSd61yY/C2h3q4XhsJGEJYZbbbPuPIUe9mSX
        wfSDEfWu+lCC0IDpESehlgyrYXTyzFiCweyv7X88qMOmxWRJyjSljMJAYWvFaojXvphohPzrUfL
        Zz18JPl67rWChYNJj1Cu62CLHCfBoL6rbXKKVozk=
X-Received: by 2002:a17:90b:78f:: with SMTP id l15mr13878509pjz.234.1611565567590;
        Mon, 25 Jan 2021 01:06:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxvl7W3nwIIt2lEJSZJBAoNTkifQKmHHI82LoAwhySwgpFDjajl1Eeq9X5qOXQrhX2tEdpdxhTWqnfTqqtjWI0=
X-Received: by 2002:a17:90b:78f:: with SMTP id l15mr13878490pjz.234.1611565567402;
 Mon, 25 Jan 2021 01:06:07 -0800 (PST)
MIME-Version: 1.0
References: <20210118134523.178605-1-kai.heng.feng@canonical.com>
In-Reply-To: <20210118134523.178605-1-kai.heng.feng@canonical.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Mon, 25 Jan 2021 10:05:56 +0100
Message-ID: <CAO-hwJKjNXO_uy4YvqeTk+mFM=6b25YDN0XexyN4fNpxmHm8=Q@mail.gmail.com>
Subject: Re: [PATCH] HID: multitouch: Apply MT_QUIRK_CONFIDENCE quirk for
 multi-input devices
To:     Kai-Heng Feng <kai.heng.feng@canonical.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Jan 18, 2021 at 2:45 PM Kai-Heng Feng
<kai.heng.feng@canonical.com> wrote:
>
> Palm ejection stops working on some Elan and Synaptics touchpad after
> commit 40d5bb87377a ("HID: multitouch: enable multi-input as a quirk for
> some devices").
>
> The commit changes the mt_class from MT_CLS_WIN_8 to
> MT_CLS_WIN_8_FORCE_MULTI_INPUT, so MT_QUIRK_CONFIDENCE isn't applied
> anymore.
>
> So also apply the quirk since MT_CLS_WIN_8_FORCE_MULTI_INPUT is
> essentially MT_CLS_WIN_8.
>
> Fixes: 40d5bb87377a ("HID: multitouch: enable multi-input as a quirk for some devices")
> Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
> ---

Thanks for the patch, and for the hid-tools MR.

I have now added the "Cc: stable@vger.kernel.org" tag and pushed to
for-5.11/upstream-fixes.

Cheers,
Benjamin

>  drivers/hid/hid-multitouch.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
> index 0743ef51d3b2..8429ebe7097e 100644
> --- a/drivers/hid/hid-multitouch.c
> +++ b/drivers/hid/hid-multitouch.c
> @@ -758,7 +758,8 @@ static int mt_touch_input_mapping(struct hid_device *hdev, struct hid_input *hi,
>                         MT_STORE_FIELD(inrange_state);
>                         return 1;
>                 case HID_DG_CONFIDENCE:
> -                       if (cls->name == MT_CLS_WIN_8 &&
> +                       if ((cls->name == MT_CLS_WIN_8 ||
> +                            cls->name == MT_CLS_WIN_8_FORCE_MULTI_INPUT) &&
>                                 (field->application == HID_DG_TOUCHPAD ||
>                                  field->application == HID_DG_TOUCHSCREEN))
>                                 app->quirks |= MT_QUIRK_CONFIDENCE;
> --
> 2.29.2
>

