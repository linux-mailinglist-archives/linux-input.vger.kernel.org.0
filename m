Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D209F48A052
	for <lists+linux-input@lfdr.de>; Mon, 10 Jan 2022 20:43:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241122AbiAJTnW (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 10 Jan 2022 14:43:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243901AbiAJTnV (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 10 Jan 2022 14:43:21 -0500
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60AE3C06173F
        for <linux-input@vger.kernel.org>; Mon, 10 Jan 2022 11:43:21 -0800 (PST)
Received: by mail-yb1-xb30.google.com with SMTP id d7so8061466ybo.5
        for <linux-input@vger.kernel.org>; Mon, 10 Jan 2022 11:43:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Q6GIsVHGycnihTR184e+rpJjR6hG9DKaUq/mUMDfAuU=;
        b=wEmz+MVCRiTzzlWzwBU+N4Wb8igM77Rq2sBFeGJNAi+oUXip3DmO64Po/T9kTkHYLs
         1dYIggcwJnLZE1nMy/ZvA7eeaVhIvKQtH3xw4CDRl1Wpc3LU7ARhi9TMye3ME88GTEni
         rdgGj+krSKiFlrrqWVV4oboEuO+4yw38JtCT89Qy0ybWgKAUWgquF9YzX3HAacrTWk5q
         fxpYgL50Qw7cDv/lrOtBxNRnU3mFXG9P6+7npcZbX83CyWD5aahGuxatrNCMgoqoSt+K
         cfymmSVAJQYWq3ONXdQUYYVT+wpu7M/H0VjRN+HfP0n7gygTYwSgGGG552y8NEAZgq6E
         zLDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Q6GIsVHGycnihTR184e+rpJjR6hG9DKaUq/mUMDfAuU=;
        b=8PRwRhtMjEr1zVCt96Obj+jOa9XE6Sdl72Usf4ZjV18dHPxFMHIBeTPvlAxzUFmSJJ
         91jjsdt71y0UnhhOTQ9J6m3iYfdsDQma99B4D2R9zMJYSUznySyN3pJ3L1Cvo8J7to8d
         RHG+BHWnryHhZ6NTFtYNZbpYF/sh9hPNJR62jP9ez68I4/KGo0/Uund2lXJixfGJZQ42
         0I7CVckXDMn08p3us1au9NIt8M45QuWidmBk4n7hHgUpwNttzjHda6LNQLSN+E8VGaBc
         8UZbsFTLhKptOm5S93820P+pfLsNaL+oTz1acTwBKaAVgCzEw9mqepe0qhsBLzBCb81j
         QaOQ==
X-Gm-Message-State: AOAM532rTvU99OVJz3icQPzno9tAVxdbCgb8aysa4bFhtwFqnWNpUtvv
        5WYzqk/aInIse2Zh+d7mPK4ffHk2jKJZFO8mbiLikA==
X-Google-Smtp-Source: ABdhPJwzcC6oJ7Q5d4ljeChMyDdTW4T4K+pcA3GTSGgVapDstsdgv1u0Pbjv+lexq2ToePk+PrLNF1bYmnp1vbnoOeY=
X-Received: by 2002:a25:ae64:: with SMTP id g36mr1441186ybe.748.1641843800625;
 Mon, 10 Jan 2022 11:43:20 -0800 (PST)
MIME-Version: 1.0
References: <20211221191743.1893185-1-acz@semihalf.com> <20211221191743.1893185-6-acz@semihalf.com>
 <Ydi4HRZs079kA/OU@google.com>
In-Reply-To: <Ydi4HRZs079kA/OU@google.com>
From:   Angela Czubak <acz@semihalf.com>
Date:   Mon, 10 Jan 2022 20:43:08 +0100
Message-ID: <CAB4aORWUh1cVujyDBHfOqK9rcgixf8c8M47r8RaV_X=1hR6QhA@mail.gmail.com>
Subject: Re: [PATCH 05/18] HID: introduce hid_get_feature
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, upstream@semihalf.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Jan 7, 2022 at 11:01 PM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> On Tue, Dec 21, 2021 at 07:17:30PM +0000, Angela Czubak wrote:
> > Move mt_get_feature from hid-multitouch to hid-core as it is a generic
> > function that can be used by other drivers as well.
> >
> > Signed-off-by: Angela Czubak <acz@semihalf.com>
> > ---
> >  drivers/hid/hid-core.c       | 39 ++++++++++++++++++++++++++++++++++++
> >  drivers/hid/hid-multitouch.c | 38 +++--------------------------------
> >  include/linux/hid.h          |  1 +
> >  3 files changed, 43 insertions(+), 35 deletions(-)
> >
> > diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
> > index dbed2524fd47..c11cb7324157 100644
> > --- a/drivers/hid/hid-core.c
> > +++ b/drivers/hid/hid-core.c
> > @@ -1796,6 +1796,45 @@ int hid_report_raw_event(struct hid_device *hid, int type, u8 *data, u32 size,
> >  }
> >  EXPORT_SYMBOL_GPL(hid_report_raw_event);
> >
> > +/**
> > + * hid_get_feature - retrieve feature report from device
> > + *
> > + * @hdev: hid device
> > + * @report: hid report to retrieve
> > + */
> > +void hid_get_feature(struct hid_device *hdev, struct hid_report *report)
>
> If this is a generic API I believe it should return success/error code
> so that users can decide what to do.
>
Does it mean I should also modify hid-multitouch.c so that the return
value is actually checked? Currently it seems to ignore any failures.
> Thanks.

>
> --
> Dmitry
