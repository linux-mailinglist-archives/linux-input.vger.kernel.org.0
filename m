Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CD91D125D9D
	for <lists+linux-input@lfdr.de>; Thu, 19 Dec 2019 10:25:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726690AbfLSJZ6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 19 Dec 2019 04:25:58 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:59443 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726656AbfLSJZ6 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 19 Dec 2019 04:25:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1576747557;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=eEDs8eQd8uRes+0IeLvhB5G56cOxhAMQ/9+Hmh2c7S0=;
        b=KmmJ8pQlubtlw+x8YasBO8qcDLqN4nlcW+0RNwiaJUmccEMG2MNMkhjIGx3D+dnLWWs9rU
        rQuwN+0+4VPZ38Unv1QWqwMZ6kj9Gt/JIQKNbp4qVqZ7vsf3SwiR9y7A0lJuCPwL8emRcQ
        CyQHpmhHVOCvu/OfuIEWrkFoq5Xe+Ho=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-118-hmo7FSMRPN2Qf0XHpSP-RA-1; Thu, 19 Dec 2019 04:25:55 -0500
X-MC-Unique: hmo7FSMRPN2Qf0XHpSP-RA-1
Received: by mail-qt1-f200.google.com with SMTP id e8so3284924qtg.9
        for <linux-input@vger.kernel.org>; Thu, 19 Dec 2019 01:25:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eEDs8eQd8uRes+0IeLvhB5G56cOxhAMQ/9+Hmh2c7S0=;
        b=Td5NJt5UDn1Po5G5W851y2bivBjZJ76yNhzLIGC2qnh6BuHsrQ2IqfEkf3Qr/0nPGz
         nXoM7/p0M6vPrhF/MrTVv/SSwfDatU/ESJgzHr+p89zQS2cez9yCWA37nNuuaJEnyByu
         nhNJNuzOF5CDCvVU6qALjzwyEdmipodKrC4h1nP45ssJuwB7MV2NCBs8r0ZkJ4ZXMsi+
         WQ7QXHHP4Xe1xIKkVYP2nNgAWGo8HyMIn4OnPPpP+WKiWPtZ29ATTn+Ui3kAcrppFeLk
         aN/tbj19geAM97/vvpLHiLIXbx1QcrQ3SnblxtTPm/KmO4iPm1ekYmmMuNYCetTJOWfD
         ggNQ==
X-Gm-Message-State: APjAAAXiMowdTNQ2FCJpPkr6PLv0FMWNBtn55/yKUNOBnUGWSlrQE+ri
        /SDSpLAji9y/RAG0jubZji/q9VfiHjcZx5lZ6DvSxcLsMixuw9ohJsHEMS9qHgn/6DudvK7bW8K
        SIShmdcNwoeaH1FCIweU0sX/A/011ODgeyvQEv+o=
X-Received: by 2002:ac8:478a:: with SMTP id k10mr1966962qtq.260.1576747555605;
        Thu, 19 Dec 2019 01:25:55 -0800 (PST)
X-Google-Smtp-Source: APXvYqyJYrXSGRz7JstDEcjgRqaZUSLIazJY+JiF8G18gr5bHMQWxIoMcAlFlkXz6/WAzi/yVn9xMmhtMDrndC9afAw=
X-Received: by 2002:ac8:478a:: with SMTP id k10mr1966949qtq.260.1576747555413;
 Thu, 19 Dec 2019 01:25:55 -0800 (PST)
MIME-Version: 1.0
References: <1576723530-31381-1-git-send-email-zhangpan26@huawei.com>
In-Reply-To: <1576723530-31381-1-git-send-email-zhangpan26@huawei.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Thu, 19 Dec 2019 10:25:44 +0100
Message-ID: <CAO-hwJJNhinhOHff=q4aGCFxzSGZ6bHtd0HJHRxNWV7jw2C8Fw@mail.gmail.com>
Subject: Re: [PATCH v2] drivers/hid/hid-multitouch.c: fix a possible null
 pointer access.
To:     Pan Zhang <zhangpan26@huawei.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Henrik Rydberg <rydberg@bitmath.org>, hushiyuan@huawei.com,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Dec 19, 2019 at 3:46 AM Pan Zhang <zhangpan26@huawei.com> wrote:
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

Thanks a lot for the quick respin.

Applied to for-5.5/upstream-fixes

Cheers,
Benjamin

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

