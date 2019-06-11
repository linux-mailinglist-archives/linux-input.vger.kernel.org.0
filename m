Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8E4EC3C951
	for <lists+linux-input@lfdr.de>; Tue, 11 Jun 2019 12:48:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727709AbfFKKsV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 11 Jun 2019 06:48:21 -0400
Received: from mail-qk1-f196.google.com ([209.85.222.196]:41120 "EHLO
        mail-qk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727295AbfFKKsV (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 11 Jun 2019 06:48:21 -0400
Received: by mail-qk1-f196.google.com with SMTP id c11so7291470qkk.8
        for <linux-input@vger.kernel.org>; Tue, 11 Jun 2019 03:48:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DRCwbC43b8I/kW8dfdjp5o7aL26cGS0PPjZPEn74b+o=;
        b=PQGvI+ZN8R78iSSqCC9lR6Z1LdVf50TBsTuVy+pbeU/T253MESqXhMmnn6JDLH8YhU
         3X/x6HRHvSNcM+x0+1+0WA+jDiZs9/IlxNOee3Rq4HlBkux1DyF99Erk8L8VvTq5mua8
         vfjZGvjBhiVi74jcStPVPsKgo0q+Mcx7MFufDSsN4PBJb+nA+2+Wzdcy9NmkXHXCjwac
         m17FiLiSqqz3hmeSkF3kb66D6eUG1cJtuCTpa3Z/zlnupknJfiCaC3pwb17zXypqJguT
         dSniQz3iiqp1Ksy9gYIlSLnedlg2sOi783Kn/clJiM6ExrFJ2rEvee5OaHfK82bwGlUH
         MDpw==
X-Gm-Message-State: APjAAAWTxta2QpvsQggVbV/ln1EqVdU7S0YGhZxcAuNy2jL3ahDrbF59
        /obk9Im17TDkrfnBsaoD+QQee01xF9abouOzcg/qFQ==
X-Google-Smtp-Source: APXvYqy/IzAdxwn2OQKKaBdRM9ltVhzXM8al+4wQK97WeEXh27E1i5y+HzDhxM5f6rsIk6EKPCWgqFec84r4T3B1PJU=
X-Received: by 2002:a37:8847:: with SMTP id k68mr59858881qkd.278.1560250100550;
 Tue, 11 Jun 2019 03:48:20 -0700 (PDT)
MIME-Version: 1.0
References: <20190525140908.2804-1-yuehaibing@huawei.com> <50800f5e-867d-ded9-235c-b9c2db1c41ef@huawei.com>
In-Reply-To: <50800f5e-867d-ded9-235c-b9c2db1c41ef@huawei.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Tue, 11 Jun 2019 12:48:09 +0200
Message-ID: <CAO-hwJJYWGjp=gNs7X5fsg0tf18hpVA0cn63LxAme+LQnp+wrQ@mail.gmail.com>
Subject: Re: [PATCH -next] HID: logitech-dj: fix return value of logi_dj_recv_query_hidpp_devices
To:     Yuehaibing <yuehaibing@huawei.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Hans de Goede <hdegoede@redhat.com>, jkosina@suse.cz,
        lkml <linux-kernel@vger.kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Jun 11, 2019 at 5:01 AM Yuehaibing <yuehaibing@huawei.com> wrote:
>
> Hi all,
>
> Friendly ping...

Applied to for-5.3/logitech

Thanks!

Cheers,
Benjamin

>
> On 2019/5/25 22:09, YueHaibing wrote:
> > We should return 'retval' as the correct return value
> > instead of always zero.
> >
> > Fixes: 74808f9115ce ("HID: logitech-dj: add support for non unifying receivers")
> > Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> > ---
> >  drivers/hid/hid-logitech-dj.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/hid/hid-logitech-dj.c b/drivers/hid/hid-logitech-dj.c
> > index 41baa4dbbfcc..7f8db602eec0 100644
> > --- a/drivers/hid/hid-logitech-dj.c
> > +++ b/drivers/hid/hid-logitech-dj.c
> > @@ -1133,7 +1133,7 @@ static int logi_dj_recv_query_hidpp_devices(struct dj_receiver_dev *djrcv_dev)
> >                                   HID_REQ_SET_REPORT);
> >
> >       kfree(hidpp_report);
> > -     return 0;
> > +     return retval;
> >  }
> >
> >  static int logi_dj_recv_query_paired_devices(struct dj_receiver_dev *djrcv_dev)
> >
>
