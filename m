Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A86D6124905
	for <lists+linux-input@lfdr.de>; Wed, 18 Dec 2019 15:05:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726856AbfLROFw (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 18 Dec 2019 09:05:52 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:46528 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726984AbfLROFv (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 18 Dec 2019 09:05:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1576677949;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=hKeKFdBiRsbTRVEMHRwLpZNizEHEkznl+vD7uDZN8A0=;
        b=BHBG5JnMZe91augEFu/Orh3AOkVYhdyxJp7Oo8JqPD4/lLbH5W6LQlCgXkz2hWVe806URa
        yQHjZbj/id8nbtdk3HT4vFA0otQ+ftTIsBHBsR6HNMhP/ZNV5PU/sCyHqgkZKXT+wa3G5f
        S5NLArFfBmfX0JsvMFI3aRCDfbjXybs=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-73-qFqoRiHnOM6r_fMHactMGg-1; Wed, 18 Dec 2019 09:05:48 -0500
X-MC-Unique: qFqoRiHnOM6r_fMHactMGg-1
Received: by mail-qv1-f71.google.com with SMTP id z9so1373152qvo.10
        for <linux-input@vger.kernel.org>; Wed, 18 Dec 2019 06:05:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hKeKFdBiRsbTRVEMHRwLpZNizEHEkznl+vD7uDZN8A0=;
        b=N9ct68ljq18zjOmItpxajc068obizB8jPCutftlBMZ6y40WAaCo2RXoc9h0qkGatQG
         74pydzTvT9pv+fJH3DeiWbIc29VZIunS1ixP/W3JF/zsKaoh7+9VWEMvs/sI6gTBXVXx
         y8T/HmDVg+wL/5kW7PXWl4wAp1kRp5ZKpmmSGSsYeI5Z8UdpNXKKbH8koOVUaBhb+2wT
         dsWoLZeUckqRQ7N3OZXkXOk8ifxXme7Xj6SmBZZpaeJgfc2s06AB9ugpNKhodffuCnpi
         rPp6krtYezitqSJq2w4q8eCLNxie83es+2PkZQRUAc1SvOg17AHRQq3CUAbpK7UQikO1
         yvZQ==
X-Gm-Message-State: APjAAAUl6y/09391oOqjrLSpfC5tTghXMv9ioX9XJ3tlRHAutMdpK3CV
        5jd93xNBnfULMujTH1ffuElsr5eutmXgpGTeH0gUVmv8J5WZvLldb8bIcMe4IcQt+nNBMlbatQ2
        e15Y0KegzpYWCSkTj43EDKy+7wsJS7CpxBDJ2BSs=
X-Received: by 2002:ae9:ef4b:: with SMTP id d72mr2603003qkg.27.1576677948192;
        Wed, 18 Dec 2019 06:05:48 -0800 (PST)
X-Google-Smtp-Source: APXvYqxKvdiV0BKf8uQoqA75j4nlqoe0xziRqEhs2pVb5VXGW7tV9Z+/BlLLKm7sIxOMOgkkobh52Km32jESxnU5rbA=
X-Received: by 2002:ae9:ef4b:: with SMTP id d72mr2602972qkg.27.1576677947946;
 Wed, 18 Dec 2019 06:05:47 -0800 (PST)
MIME-Version: 1.0
References: <CAO-hwJ+5Ch02fPQ+XF=A4iEcH81V5PrCdV2qGQDZ8HxnQAoEog@mail.gmail.com>
 <1576585687-10426-1-git-send-email-zhangpan26@huawei.com>
In-Reply-To: <1576585687-10426-1-git-send-email-zhangpan26@huawei.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Wed, 18 Dec 2019 15:05:36 +0100
Message-ID: <CAO-hwJLykG4zPquaHnJ0DL-Ce9CNre4Lpgg4naKp_EnDe7Wyzg@mail.gmail.com>
Subject: Re: Re: [PATCH v2] drivers/hid/hid-multitouch.c: fix a possible null
 pointer access.
To:     Pan Zhang <zhangpan26@huawei.com>
Cc:     hushiyuan@huawei.com, Jiri Kosina <jikos@kernel.org>,
        Henrik Rydberg <rydberg@bitmath.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On Tue, Dec 17, 2019 at 1:28 PM Pan Zhang <zhangpan26@huawei.com> wrote:
>
> On Tue, Dec 17, 2019 at 18:50 PM Benjamin Tissoires <benjamin.tissoires@redhat.com> wrote:
>
> >Can you add at the beginning of your commit message:
> >From: Pan Zhang <zhangpan26@huawei.com>
> >
> >This way we have the commit author that matches the signature, which is a requirement for the kernel.
>
> Firstly, thanks for your reviewing very much. I would fix my signature.
>
> >>  drivers/hid/hid-multitouch.c | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/hid/hid-multitouch.c
> >> b/drivers/hid/hid-multitouch.c index 3cfeb16..368de81 100644
> >> --- a/drivers/hid/hid-multitouch.c
> >> +++ b/drivers/hid/hid-multitouch.c
> >> @@ -1019,7 +1019,7 @@ static int mt_process_slot(struct mt_device *td, struct input_dev *input,
> >>                 tool = MT_TOOL_DIAL;
> >>         else if (unlikely(!confidence_state)) {
> >>                 tool = MT_TOOL_PALM;
> >> -               if (!active &&
> >> +               if (!active && mt
>
> >Ack on the principle, but this doesn't even compile. You are missing a `&&` at the end of the line.
> >
> >Can you send a v2 with the comments above? And we will queue the v2 for 5.5 I think.
>
> Sorry about that. I made a stupid mistake. This patch fixed it.

No worries, mistakes happen.

However, can you resend the patch to the LKML in a separate thread?
Also prefix the patch with "[PATCH v2]". It's easier for our tools to
handle patches when they are send on their own. Because here, I would
have to manually edit either the commit message removing the thread,
either take the first version and edit the patch. It's not so hard for
this kind of simple patches, but it's best to take good habits :)

Cheers,
Benjamin

>
> Signed-off-by: Pan Zhang <zhangpan26@huawei.com>
> ---
>  drivers/hid/hid-multitouch.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
> index 3cfeb16..368de81 100644
> --- a/drivers/hid/hid-multitouch.c
> +++ b/drivers/hid/hid-multitouch.c
> @@ -1019,7 +1019,7 @@ static int mt_process_slot(struct mt_device *td, struct input_dev *input,
>                 tool = MT_TOOL_DIAL;
>         else if (unlikely(!confidence_state)) {
>                 tool = MT_TOOL_PALM;
> -               if (!active &&
> +               if (!active && mt &&
>                     input_mt_is_active(&mt->slots[slotnum])) {
>                         /*
>                          * The non-confidence was reported for
> --
> 2.7.4
>

