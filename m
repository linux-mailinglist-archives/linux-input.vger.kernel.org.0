Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ABB0458FF3D
	for <lists+linux-input@lfdr.de>; Thu, 11 Aug 2022 17:24:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234574AbiHKPYJ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 11 Aug 2022 11:24:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230133AbiHKPYI (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 11 Aug 2022 11:24:08 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 261AA92F46
        for <linux-input@vger.kernel.org>; Thu, 11 Aug 2022 08:24:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1660231445;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=1h3Y3RmJF3aa7mPyEan1bKo/SeXETlN162Suiv+//04=;
        b=HayQsLq7aEyaGIQRVz/55g02LocgnpwRIAKgEf+HSX7MO3tWF7yBuW/rhPrLr9+8CxPn9Y
        vauZkWJAGIFHUBgs8k5S8IclSW7NUq8ouehQfQaeycCfGoelXadJrQKx2sFp0TNmy9PBil
        841P+bnAtsX0c6xLXcXc7yV0rhSh/O8=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-386-fpaMqxQDN2K43poc8eo7mQ-1; Thu, 11 Aug 2022 11:24:04 -0400
X-MC-Unique: fpaMqxQDN2K43poc8eo7mQ-1
Received: by mail-pj1-f70.google.com with SMTP id r14-20020a17090a1bce00b001f53b234980so8784958pjr.5
        for <linux-input@vger.kernel.org>; Thu, 11 Aug 2022 08:24:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
        bh=1h3Y3RmJF3aa7mPyEan1bKo/SeXETlN162Suiv+//04=;
        b=3thsdbSu8fN1yS4w5PlfMT16EKrtuVuzpon2XgQNhDQ8QnjYVZtgAoAfo3Qm+dhzds
         rykpaP9hOkaOLJppCfEhvoDIprN99fMnQca7PB4SIagQc9vUFqoFNMuq0LKckECNm9HG
         mq17cJo2RLESIWHIU7mkvg7CAtywhl2HoFmPpD690ckW9omY9qgVECRUVXTH7jiwFsU/
         0rEsai09OTXiy5MKzmLoN0tSL2fte2tpmHGcgIBbtZM9g4bhr/4jRu9axjBlc7fCPuBy
         8JZVt1LvpYxmiODgkHQyCbh1N9EmiMVnHITz3luviRut+BjgxExgbHk23pc18hRJ9vpr
         vtuA==
X-Gm-Message-State: ACgBeo0GptyA172q789ql6mNX525w6vF4XdF1gGw6EVuMy7xLOwE8HBZ
        wiHbUJbyw+4q+vpzEViMPkOIrGkTDDHdiHkyT8V81DsORRv+E409hjbrQO+CyMBfYi276V3gVvn
        KBg/HNARMupK/dYkAO2JBsxWJfBN88ACIad5VeEc=
X-Received: by 2002:a63:e70f:0:b0:41c:ac9e:27aa with SMTP id b15-20020a63e70f000000b0041cac9e27aamr26240929pgi.489.1660231443732;
        Thu, 11 Aug 2022 08:24:03 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6xDlcoTxL3DHADFHK9h8Xh4vShOzgWZAlNazMjrDr1EngYc2KIR0v3BBaBT6g6mw9pZ5Iy443C10PlJwme4qU=
X-Received: by 2002:a63:e70f:0:b0:41c:ac9e:27aa with SMTP id
 b15-20020a63e70f000000b0041cac9e27aamr26240916pgi.489.1660231443414; Thu, 11
 Aug 2022 08:24:03 -0700 (PDT)
MIME-Version: 1.0
References: <9e16d503-2203-57ed-d6af-61fea0c3e10b@gmail.com>
 <nycvar.YFH.7.76.2207231339500.19850@cbobk.fhfr.pm> <20220724114849.GA32182@elementary>
 <20220725224841.GA75640@elementary> <3f2e0a49-38a8-417e-1bb0-9a9f28371240@gmail.com>
 <20220804182445.GA16569@elementary>
In-Reply-To: <20220804182445.GA16569@elementary>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Thu, 11 Aug 2022 17:23:52 +0200
Message-ID: <CAO-hwJ+hBipNJpeYaHRr2-rKXA5d79XT7zE2fo2oEKUKJtKJ0g@mail.gmail.com>
Subject: Re: PROBLEM: Regression likely in hid_uclogic driver breaks Huion
 Inspiroy H640 drawing tablet
To:     =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>
Cc:     Stefan Hansson <newbie13xd@gmail.com>,
        Jiri Kosina <jikos@kernel.org>,
        Ping Cheng <ping.cheng@wacom.com>,
        Peter Hutterer <peter.hutterer@who-t.net>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Aug 4, 2022 at 8:24 PM Jos=C3=A9 Exp=C3=B3sito <jose.exposito89@gma=
il.com> wrote:
>
> Hi again,
>
> On 2022-07-26 18:48, Jos=C3=A9 Exp=C3=B3sito wrote:
> > The first bad commit is 87562fcd1342 ("HID: input: remove the need for
> > HID_QUIRK_INVERT"):
> > https://lore.kernel.org/all/20220203143226.4023622-11-benjamin.tissoire=
s@redhat.com/
> > (CCing the folks whose email is in the patch tags)
> >
> > I reverted the patch on hid/for-next and, after fixing a tiny conflict,
> > I can confirm that the tablet works again as expected.
> >
> > I'd need to investigate a bit more over the weekend, but I think that
> > all HUION tablets with the latest firmware (internally, v2) are
> > affected.
>
> Indeed, it looks like v2 devices are affected. Similar reports:
>
>  - https://github.com/DIGImend/digimend-kernel-drivers/issues/626
>  - https://bugzilla.kernel.org/show_bug.cgi?id=3D216106
>
> Kindly sending this thread back to your inbox to see if we could fix
> this regression.

[sorry, I was out on vacation the past 2 weeks and this week was the
usual "urgent" thing I have to day for yesterday]

Ideally, I'd like to not revert that commit. It solves a bunch of
issues on many devices, so that's maybe not the way forward.

FWIW, it was quite painful to tweak and that was a solution that
matches the hid-multitouch devices I could find.

I tried to process your email when you described the succession of
events without much success.

Would you mind dumping a hid-record when exposing the bug?

Cheers,
Benjamin


>
> Best wishes,
> Jose
>
> > Those tablets do not set the inrange bit (UCLOGIC_PARAMS_PEN_INRANGE_NO=
NE).
> > The driver sets it and uses a timer to remove it.
> > See drivers/hid/hid-uclogic-core.c, function uclogic_raw_event_pen().
> > [...]
>

