Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CBF84122932
	for <lists+linux-input@lfdr.de>; Tue, 17 Dec 2019 11:50:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727238AbfLQKuI (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 17 Dec 2019 05:50:08 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:45849 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726655AbfLQKuI (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 17 Dec 2019 05:50:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1576579807;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Rt3wBXjdkOLTAGZAw3Tafg9k0wX1EERiUeh4YXdvZFw=;
        b=KfivxuS+43UGy2hhZ/CzqEHCj3M9iEKj8c5Fk0pKxCDBXL9LlLO+jWQrbWyGFPxOItXNUF
        9SpFzoj8V91wlFwNN7ohJrmtwiLeabf7hMxVfm0QmjDrf6L4njLULwASn0tKOGlApJRQCV
        QMoTzpetSVvfv/eOY7eRTBF8b047nCQ=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-63-GzaEEVvANGWFMp4lCWG_iQ-1; Tue, 17 Dec 2019 05:50:06 -0500
X-MC-Unique: GzaEEVvANGWFMp4lCWG_iQ-1
Received: by mail-qt1-f198.google.com with SMTP id x8so6652008qtq.14
        for <linux-input@vger.kernel.org>; Tue, 17 Dec 2019 02:50:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Rt3wBXjdkOLTAGZAw3Tafg9k0wX1EERiUeh4YXdvZFw=;
        b=SGrgGO6RJRke51hqld4jttVWHjKF1XjZPUsWJu8PexnexMXL12WLzcVZ0/EQssLJkV
         Ow+FUyj7F5a0zI5qVAtAfX5jJl7pTFQoOfA5hfFqa+siN8HMOVirPvGz/9XcXH4+aaDX
         Y8QaktUSUZ/yEfeTwmzdIU6VXxRPXd31Vl+W9WiB7NL7kepj2dBe+rlj01zD5R6WqRHT
         w8A8S/53Hv5vQVc7THhfN94Uz1z+61wV6zvkXUQCZCi/Jk8BF1qOkB8iY3HU5hmYjVOc
         LAZn3HbWAKj4yF+fEYEB1rlUNCD+1KQqAppmFsJAzTx9Isw0uV1lR0e4G3/O5ml8WqjN
         lp7g==
X-Gm-Message-State: APjAAAVTho3c2+NvhLJalkjxN//vFtsZoVPQL7pgEITzPSgbF9KmvRGY
        6dMd25bFA3ySd8zajEkHVSfKaTu40PJtPMHGsGE+lNTpHnEZykdp1Evva8YYznkU7+vGe2Uq7Qc
        Jl9roPPGsiMuTSi5habIS7/cj84pRgoI7LVR/7SQ=
X-Received: by 2002:ad4:46ce:: with SMTP id g14mr3904988qvw.67.1576579805655;
        Tue, 17 Dec 2019 02:50:05 -0800 (PST)
X-Google-Smtp-Source: APXvYqw/VLutc07+0j4Bx9/r9IYnqLdnpclrVJSO4VZrNxQqBV6UHMzCpcyo2Ftqj81CkaG3aSoCQu3p0VvOw1+5D9I=
X-Received: by 2002:ad4:46ce:: with SMTP id g14mr3904970qvw.67.1576579805418;
 Tue, 17 Dec 2019 02:50:05 -0800 (PST)
MIME-Version: 1.0
References: <1576551722-16966-1-git-send-email-zhangpan26@huawei.com>
In-Reply-To: <1576551722-16966-1-git-send-email-zhangpan26@huawei.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Tue, 17 Dec 2019 11:49:54 +0100
Message-ID: <CAO-hwJ+5Ch02fPQ+XF=A4iEcH81V5PrCdV2qGQDZ8HxnQAoEog@mail.gmail.com>
Subject: Re: [PATCH] drivers/hid/hid-multitouch.c: fix a possible null pointer access.
To:     z00417012 <zhangpan26@huawei.com>
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

On Tue, Dec 17, 2019 at 4:17 AM z00417012 <zhangpan26@huawei.com> wrote:

Can you add at the beginning of your commit message:
From: Pan Zhang <zhangpan26@huawei.com>

This way we have the commit author that matches the signature, which
is a requirement for the kernel.

>
> 1002     if ((quirks & MT_QUIRK_IGNORE_DUPLICATES) && mt) {
> 1003         struct input_mt_slot *i_slot = &mt->slots[slotnum];
> 1004
> 1005         if (input_mt_is_active(i_slot) &&
> 1006             input_mt_is_used(mt, i_slot))
> 1007             return -EAGAIN;
> 1008     }
>
> We previously assumed 'mt' could be null (see line 1002).
>
> The following situation is similar, so add a judgement.
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
> +               if (!active && mt

Ack on the principle, but this doesn't even compile. You are missing a
`&&` at the end of the line.

Can you send a v2 with the comments above? And we will queue the v2
for 5.5 I think.

Cheers,
Benjamin

>                     input_mt_is_active(&mt->slots[slotnum])) {
>                         /*
>                          * The non-confidence was reported for
> --
> 2.7.4
>

