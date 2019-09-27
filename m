Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 78DD6C02DB
	for <lists+linux-input@lfdr.de>; Fri, 27 Sep 2019 12:05:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727133AbfI0KEU (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 27 Sep 2019 06:04:20 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:50019 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726988AbfI0KEU (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 27 Sep 2019 06:04:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1569578659;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=yr1qbbjmCmVWV/qKG3BFNpAVMN2lXkfBYcR3fqycFRA=;
        b=JHfPdpDpvscxXxtDD//uHZf2wLebusqf5tjx23UNJ7mmActTiL8uZ87feTIHWqHDOc59wN
        u1ISRCFlLfZb+t/TOWmKYW/58AiU2DiKVyK4dF8duIvRRGdwAXEIE1vbGsYTJPMJMwyjri
        DHKS9bm3rvaZyTxeECZDtiHaN/CZBJI=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-169-YOOth2n2M36QKnly5lzLBA-1; Fri, 27 Sep 2019 06:04:16 -0400
Received: by mail-qt1-f199.google.com with SMTP id n4so5194808qtp.19
        for <linux-input@vger.kernel.org>; Fri, 27 Sep 2019 03:04:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=X0RxdG+xzTY6hppirsAZIE83xPEk0t3BjDbFciB2Sa4=;
        b=iuR5eTSsyDAHfSteYrE/Cs4dioUi1njIaT1+UYuElXXB5Nr4wXZBVPJqW2+16LLLYG
         s8+0Om6UGbI465aWDRhxGEGzkZfT2LT8mpLpQ7mRQitqZplLXFnPs7Ym9Xrj3cUAU3AO
         Q/cVKZBZ+lnYwvJdP8lfNxxRwy7f+eXVQvpOpxcaJ83KxZQTf33mRMUf9qrI9efHqOE/
         nD9bvglhU/uCpqX8DCcUC/DrKSw4Fek3l0tHckt+HqfPTdM5pF95vIH8b7QflfeQs0Ga
         +RYGHYkElR+yp5XwWHXq/v7ZlHaLDr50T0iJ8A7lVViwx8ZH9+MxI5wlrdfh6cX5KaYU
         DdKQ==
X-Gm-Message-State: APjAAAX6eiH6Sn3VEEktXh4O9Ylsy97xj38kCEaesofJ/+dWRCEYiL78
        sqwPBhU6RH4nyjS14a3hJyI09N5pXG8PFMAXJXJsVKWauMQUX/vDuZ/REWmky91a+TWBlNvH13z
        nkBtGMQJoIAzTCgOsEcekkW7GMSdV1r/QAUCh/zQ=
X-Received: by 2002:a37:a147:: with SMTP id k68mr3643564qke.169.1569578655687;
        Fri, 27 Sep 2019 03:04:15 -0700 (PDT)
X-Google-Smtp-Source: APXvYqygBRP9Pf1w27R4vGLTLB2f3Li9BSkOnzV6Y2bFEcYng23lnngm0cVH6hH+IR1910Txe1zUoKpLhO3vOfuBmjE=
X-Received: by 2002:a37:a147:: with SMTP id k68mr3643545qke.169.1569578655419;
 Fri, 27 Sep 2019 03:04:15 -0700 (PDT)
MIME-Version: 1.0
References: <20190922115054.10880-1-colin.king@canonical.com>
 <nycvar.YFH.7.76.1909231303180.1459@cbobk.fhfr.pm> <20190925114741.GD27389@kadam>
In-Reply-To: <20190925114741.GD27389@kadam>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Fri, 27 Sep 2019 12:04:04 +0200
Message-ID: <CAO-hwJKpqGBi+9CRn08sNcn+ggQtnefuMgG98bXtW1UiGqneQA@mail.gmail.com>
Subject: Re: [PATCH] HID: core: clean up indentation issue
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Colin King <colin.king@canonical.com>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        kernel-janitors@vger.kernel.org,
        lkml <linux-kernel@vger.kernel.org>
X-MC-Unique: YOOth2n2M36QKnly5lzLBA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Sep 25, 2019 at 1:48 PM Dan Carpenter <dan.carpenter@oracle.com> wr=
ote:
>
> On Mon, Sep 23, 2019 at 01:04:13PM +0200, Jiri Kosina wrote:
> > On Sun, 22 Sep 2019, Colin King wrote:
> >
> > > From: Colin Ian King <colin.king@canonical.com>
> > >
> > > There is an if statement that is indented by one extra space,
> > > fix this by removing the extraneous space.
> > >
> > > Signed-off-by: Colin Ian King <colin.king@canonical.com>
> > > ---
> > >  drivers/hid/hid-core.c | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
> > > index 3eaee2c37931..9469c382a182 100644
> > > --- a/drivers/hid/hid-core.c
> > > +++ b/drivers/hid/hid-core.c
> > > @@ -2329,10 +2329,10 @@ int hid_add_device(struct hid_device *hdev)
> > >     /*
> > >      * Check for the mandatory transport channel.
> > >      */
> > > -    if (!hdev->ll_driver->raw_request) {
> > > +   if (!hdev->ll_driver->raw_request) {
> > >             hid_err(hdev, "transport driver missing .raw_request()\n"=
);
> > >             return -EINVAL;
> > > -    }
> > > +   }
> >
> > Let's not pollute git blame and wait for an ocasion when we need to tou=
ch
> > the code for some more valid reason.
>
> Just use `git blame -w`.
>
> This probably came from a Smatch warning.  Smatch warns very seldom
> warns about style issues, but in this case the indenting is legitimately
> bad.

Well, I tend to agree with Jiri here. Yes, you can use a particular
flag in a tool to 'solve' the git blame/history issue, but this is
putting the workload on the user, while tthe code is fine, in this
case. Why do we need to pollute the history of a file for no good
reasons?

Cheers,
Benjamin

