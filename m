Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4543378270E
	for <lists+linux-input@lfdr.de>; Mon, 21 Aug 2023 12:28:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234693AbjHUK2U (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 21 Aug 2023 06:28:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234690AbjHUK2U (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 21 Aug 2023 06:28:20 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12FA1D8
        for <linux-input@vger.kernel.org>; Mon, 21 Aug 2023 03:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1692613657;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=5iwxNvZXLdMagMwR8LwiF4FeXyC8tzHGZDrS/U2JBBQ=;
        b=UJ9M50Y/3Mc+JYgtZHhqSDezhP1Cd/F2v14zuJ9m9yemRYLsDHBPb01H8SVbWdTjvl64NZ
        9W7UM46dIsRpOt/Y4tR3a1iGdZ+b215GOyIN8EYb/khznNFnDG8Aj5K3kvQZQaXFAB0RMV
        HeHUfYnikr+N1uvAEYWSgAMMFAEitl4=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-371-CXOV2pvlNMeCfsFNW3aLOA-1; Mon, 21 Aug 2023 06:27:35 -0400
X-MC-Unique: CXOV2pvlNMeCfsFNW3aLOA-1
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-51bef8bb689so5586479a12.1
        for <linux-input@vger.kernel.org>; Mon, 21 Aug 2023 03:27:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692613654; x=1693218454;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5iwxNvZXLdMagMwR8LwiF4FeXyC8tzHGZDrS/U2JBBQ=;
        b=MtArQK4aHQ4W5GrvIGyvxHHT5k7k8MK7a+x4+eOFXxOOcKdDuIhZ+IMbQQdKuaXcx0
         ppI7WR/em+T+XtIhvrBLZIE33ZiwMb7i4NVS6KWU6R33Bn4uRKZfjFwlJyAQIYRH/2Sy
         c80IU8Ow6soBoW+mGYI0IVtobjF5pYt+4eRaAxwCMSiZinYGBe2BoKxkaIR9qvjUz8NY
         2YvhXNaMHiQ0yI1beAC+xD1leDGL7Ju49yVpoPzEAry1h1qmn0LaWYhmJnzKwmqJf6a6
         y6QaHPAf12SEtqCo6h0DB4a7yVekvHm75jvmpNKyrAeb0Hnx9SXQobuEQUo74mU/beK+
         YQJQ==
X-Gm-Message-State: AOJu0YyyPQSWwuMwakmcv9t/KQiaK321VEjRPiFk5jYXQzlKM4eCoscx
        aH4iZWMKcfsQx9K85hhwRu8aa05zxcYX9BT0OIiM0rLfZBwTV+9dycHAfy1urHVYX1TTJOykAfW
        b3ueJrq7PyycK2CpFCRNu/g0ejGRKxE7AvNi9Q2KHeDy/BRFGIA==
X-Received: by 2002:a05:6402:34cf:b0:51d:b184:efd with SMTP id w15-20020a05640234cf00b0051db1840efdmr6341970edc.20.1692613654179;
        Mon, 21 Aug 2023 03:27:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHWjC+NN//7uMpaxhKqnZSI37jqUDWzGh1yHBBr1JHL7SGqZelpjZUe6q5ldlay9WSUElP/IU8uFo/wcaRWgiE=
X-Received: by 2002:a05:6402:34cf:b0:51d:b184:efd with SMTP id
 w15-20020a05640234cf00b0051db1840efdmr6341961edc.20.1692613653935; Mon, 21
 Aug 2023 03:27:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230703185222.50554-1-andriy.shevchenko@linux.intel.com>
 <ZMK60UphgVuj4Z+L@smile.fi.intel.com> <ZMydcGv8Dvu3Hje1@smile.fi.intel.com>
 <nycvar.YFH.7.76.2308071319140.14207@cbobk.fhfr.pm> <ZND/8wd67YbGs8d5@smile.fi.intel.com>
 <nycvar.YFH.7.76.2308141128260.14207@cbobk.fhfr.pm> <ZOMcHQc8Em/s6C+y@smile.fi.intel.com>
 <ez2oewpi3yeaiejrvbe433ude75pgm3k3s5sh5gnn7pvnzm7b4@ajuopfgwocft>
 <ZOMvpmoWLCgcAyJR@smile.fi.intel.com> <ZOMv4VB0bZpupNlN@smile.fi.intel.com> <CAO-hwJ+Pa0yMV5taEc9+RXEWJzkotpyj4gz2qftyLV4G73F-mg@mail.gmail.com>
In-Reply-To: <CAO-hwJ+Pa0yMV5taEc9+RXEWJzkotpyj4gz2qftyLV4G73F-mg@mail.gmail.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Mon, 21 Aug 2023 12:27:22 +0200
Message-ID: <CAO-hwJ+EaFJEmuBYKRLmy-=xtOu96L=c5=zM=hS=0Ju_zGV=oA@mail.gmail.com>
Subject: Re: [PATCH v1 00/12] HID: cp2112: Cleanups and refactorings
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Benjamin Tissoires <bentiss@kernel.org>,
        Jiri Kosina <jikos@kernel.org>, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Aug 21, 2023 at 12:19=E2=80=AFPM Benjamin Tissoires
<benjamin.tissoires@redhat.com> wrote:
>
> On Mon, Aug 21, 2023 at 11:35=E2=80=AFAM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> >
> > On Mon, Aug 21, 2023 at 12:34:30PM +0300, Andy Shevchenko wrote:
> > > On Mon, Aug 21, 2023 at 10:51:04AM +0200, Benjamin Tissoires wrote:
> > > > On Aug 21 2023, Andy Shevchenko wrote:
> >
> > ...
> >
> > > > Long story short, I'm not able to test it right now (and I got quit=
e
> > > > some backlog as you can imagine). IIRC the code was fine, so I thin=
k we
> > > > can just take the series as is, and work on the quirks (if any) lat=
er.
> > >
> > > Thank you!
> > >
> > > The thing that might be broken is interrupts handling. If that works,
> > > I'm pretty confident with the rest.
> >
> > I.o.w. first 5 patches to test is already 98% of guarantee that everyth=
ing
> > is fine.
>
> Actually I applied you series locally, and applied Danny's patches on
> top, and I could run your series in qemu with the cp2112 as USB
> passthrough.
>
> Everything is working fine, so I can take this one just now.

I've pushed the series to for-6.6/cp2112, but for some reasons, b4
doesn't seem to believe the series is the one you submitted.

Would you mind double checking on your side if everything is good?

https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git/log/?h=3Dfor-6.=
6/cp2112

Cheers,
Benjamin

>
> Cheers,
> Benjamin
>
> >
> > --
> > With Best Regards,
> > Andy Shevchenko
> >
> >

