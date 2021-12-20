Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0F6547AB0E
	for <lists+linux-input@lfdr.de>; Mon, 20 Dec 2021 15:11:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233483AbhLTOLE (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 20 Dec 2021 09:11:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49199 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230116AbhLTOLE (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 20 Dec 2021 09:11:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1640009463;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=7x3Yj+bf5SRda5v35eOr/TWOXggky5rJXTXtDeJkHCM=;
        b=A0eWpheiFKdYyAWcWYkLgHQMMtTQ4rRAY/9iM5wlte8NTZR5/Tc61s48RZymopaiSV4bva
        nbQWveRs0t7yQitKJMFlF6eOjPiIESrI+Cf/WGN2I8moWJor24dfLO629vHjAVrBGpqifV
        HDuAAWw0t7rbCytGuLUjf75ornTKDW0=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-647-pG5-iyHRM5mholACrtrQ2Q-1; Mon, 20 Dec 2021 09:11:02 -0500
X-MC-Unique: pG5-iyHRM5mholACrtrQ2Q-1
Received: by mail-pj1-f69.google.com with SMTP id y13-20020a17090a134d00b001b10368d9dcso6562346pjf.7
        for <linux-input@vger.kernel.org>; Mon, 20 Dec 2021 06:11:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7x3Yj+bf5SRda5v35eOr/TWOXggky5rJXTXtDeJkHCM=;
        b=lfDzH7AqfnNvfjFrY1e8pnvuz8kwUz3pb6m4Uqddne6zkuqpSJZJ8gzy9DsPkKSdm4
         eK9nfEWhp/ZXvGXDUn35g5ANrF/0rZC6xMQyZ68GCxuIYL1EQBpdxevNzypQbCR5NxMw
         oHFGiTXQGPiNs9wa0f5VP0ZN9UQKJpqM6HQD7shxKuWFoRRZ8aiSrDZCHFzGC9oxZ8g7
         eMJUT2stHpqVk5LEUTyPydNGYp1I/kLgbnnWfWE6RSkrkz9Ep3hLp1qWBCiXiF55FLBf
         qhSrLf6wUjidzzi53Eb8H4qkVsUImGBeIbwSwH5KxO4DSNpm98IpERVBx9HJ4AeiLtfk
         Djiw==
X-Gm-Message-State: AOAM5301g4264PQ8yrXJ68obS166XfkH+R7S2vqQVn2vv5j5xiFlg798
        P91EyRnUYriXEe9rKk2SG/3LBP5QhDV9hvIDf7j/0ucgAKDR2T9mAX/NdogZk+5Ul6ZWRf+iNzw
        POHxMlkStQ82ToIoxdlwsmA49revqg7SfzbBYlD8=
X-Received: by 2002:a17:903:1ca:b0:149:2125:9a13 with SMTP id e10-20020a17090301ca00b0014921259a13mr2497947plh.73.1640009461407;
        Mon, 20 Dec 2021 06:11:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyz7Lzpf8qTZb+BOpbafi/m/Rtvan0nbNH0abUqJMPCoVzsBuO8rydUJne9VUVWoV1WbMaft0UiVp9emZclYxk=
X-Received: by 2002:a17:903:1ca:b0:149:2125:9a13 with SMTP id
 e10-20020a17090301ca00b0014921259a13mr2497929plh.73.1640009461208; Mon, 20
 Dec 2021 06:11:01 -0800 (PST)
MIME-Version: 1.0
References: <20211215083605.117638-1-jiasheng@iscas.ac.cn>
In-Reply-To: <20211215083605.117638-1-jiasheng@iscas.ac.cn>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Mon, 20 Dec 2021 15:10:50 +0100
Message-ID: <CAO-hwJ+VZscrj9yGOkPruuUXXkg4NOPRnj36aa+-+5JvGxGk+w@mail.gmail.com>
Subject: Re: [PATCH] HID: potential dereference of null pointer
To:     Jiasheng Jiang <jiasheng@iscas.ac.cn>
Cc:     Jiri Kosina <jikos@kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Dec 15, 2021 at 9:36 AM Jiasheng Jiang <jiasheng@iscas.ac.cn> wrote:
>
> The return value of devm_kzalloc() needs to be checked.
> To avoid hdev->dev->driver_data to be null in case of the failure of
> alloc.
>
> Fixes: 14c9c014babe ("HID: add vivaldi HID driver")
> Signed-off-by: Jiasheng Jiang <jiasheng@iscas.ac.cn>
> ---

Thanks for the fix. I have now pushed it to hid.git, branch
for-5.16/upstream-fixes

Cheers,
Benjamin

>  drivers/hid/hid-vivaldi.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/hid/hid-vivaldi.c b/drivers/hid/hid-vivaldi.c
> index cd7ada48b1d9..72957a9f7117 100644
> --- a/drivers/hid/hid-vivaldi.c
> +++ b/drivers/hid/hid-vivaldi.c
> @@ -57,6 +57,9 @@ static int vivaldi_probe(struct hid_device *hdev,
>         int ret;
>
>         drvdata = devm_kzalloc(&hdev->dev, sizeof(*drvdata), GFP_KERNEL);
> +       if (!drvdata)
> +               return -ENOMEM;
> +
>         hid_set_drvdata(hdev, drvdata);
>
>         ret = hid_parse(hdev);
> --
> 2.25.1
>

