Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D602A63FA2B
	for <lists+linux-input@lfdr.de>; Thu,  1 Dec 2022 23:00:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229773AbiLAV77 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 1 Dec 2022 16:59:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230142AbiLAV7s (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 1 Dec 2022 16:59:48 -0500
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com [IPv6:2607:f8b0:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D465FC3FF6
        for <linux-input@vger.kernel.org>; Thu,  1 Dec 2022 13:59:47 -0800 (PST)
Received: by mail-oi1-x22b.google.com with SMTP id l127so3500218oia.8
        for <linux-input@vger.kernel.org>; Thu, 01 Dec 2022 13:59:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I9Xi/joxQSGINEA67+uWXjPuZCiVq9sTeu7++r7s3QA=;
        b=DDMMjR1pmqKFeckJYHJNJ9SHdocp9wkk/9J4VvqLeajp+l6Ai90bBhpGaq6ZaHZ4uo
         JNzAcJujvfg/pGt19aRm6DhJpNqISsudItpQYoL4msOGY2+5uZWv9uTq85HlCmMyGSuk
         5Tq/NitLCt2XdgYD2Ogk8D9d7rFPr4e5S3TbUX6L8wscSrc6HRTcL8sG79CCH2qX/JpP
         7o7NstqMDfzdcYSVuXC8Xh2WzcBVDASPbkeBA8SmymSd/Sbs0hJKzIm777CiPMQT5ff+
         M39X4rB1g3PX6QOPvBEw7n0Rc1qu+Pu0EUxtalDXm9ifCTGi66W/TI1lCUKAF22KVEq0
         XVvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I9Xi/joxQSGINEA67+uWXjPuZCiVq9sTeu7++r7s3QA=;
        b=mOQZiJOo1QS3izY1y68kaJLi29jXuq7LjWQexNJaqWI6VTS6Tm1+NpqGWk+0HSzqrN
         q8onvFbwjqHvguGkL2pA6lX3Y4Ow18eJReGRvKftwfioJlS8/oHRK1QC/yuUTGCJCutr
         xuokSCNghkbm8BdDPDnwPl5oaXmEIJEEISy+TwsA+DKtPpgxXyX+RqXEezbPLzq3gN6f
         kX8mTfAt8GdSoHtXTkkNq8t/SnseBdFb1DxOG+vOV/P1nVcgO1tfnVyRz0qSFlMpKsQf
         XcGYytAdaCcCC4YsKDWl4Nje0/qD04VTVej9ewMQVGppeSkVwadp29aaieOThIAnPyDZ
         TaVA==
X-Gm-Message-State: ANoB5pm9p0B1FjembRPFnfj9698IXFrvUUaoUQzKtCNbDJvnH6IxmqZd
        rKODx7lhy7YpvoyXcj9oQ/Uw7vf6OU9aCHXpgzE=
X-Google-Smtp-Source: AA0mqf4NEtQP5UNBJfKujVdFTlPg6jIn4ck6rjm8o7yh3PjVC/4HgRE6lo5UlZHUP5yjYuLMIzGwsKpMk7uQp4Nkn4w=
X-Received: by 2002:a05:6808:688:b0:354:e358:ad2c with SMTP id
 k8-20020a056808068800b00354e358ad2cmr24682329oig.130.1669931987178; Thu, 01
 Dec 2022 13:59:47 -0800 (PST)
MIME-Version: 1.0
References: <20221019151832.44522-1-jason.gerecke@wacom.com>
 <CAO-hwJLnuvfic+8vw6OzM0NV66eL40-QEVvXj97dxVimbF7PDA@mail.gmail.com>
 <CANRwn3SDwUKZ_o_O2Mua8LjVQbkMxBUmU1hOhODGNY0kpekonQ@mail.gmail.com> <CANRwn3Q4=rO_uqF3SJVRfmUpqoxiHD=m_HMPSLEVqxXnypkAjw@mail.gmail.com>
In-Reply-To: <CANRwn3Q4=rO_uqF3SJVRfmUpqoxiHD=m_HMPSLEVqxXnypkAjw@mail.gmail.com>
From:   Jason Gerecke <killertofu@gmail.com>
Date:   Thu, 1 Dec 2022 13:59:36 -0800
Message-ID: <CANRwn3QZfeu4Oonw2-bFHzDajxDJRD6+G5HXr1WJ7bJuXddf2Q@mail.gmail.com>
Subject: Re: [PATCH] HID: Recognize "Digitizer" as a valid input application
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-input@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
        Ping Cheng <pinglinux@gmail.com>,
        Aaron Armstrong Skomra <skomra@gmail.com>,
        Joshua Dickens <joshua@joshua-dickens.com>,
        Jason Gerecke <jason.gerecke@wacom.com>,
        Ping Cheng <ping.cheng@wacom.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

> On Thu, Oct 20, 2022 at 7:48 AM Jason Gerecke <killertofu@gmail.com> wrot=
e:
> >
> > On Wed, Oct 19, 2022 at 8:40 AM Benjamin Tissoires
> > <benjamin.tissoires@redhat.com> wrote:
> > >
> > > On Wed, Oct 19, 2022 at 5:18 PM Gerecke, Jason <killertofu@gmail.com>=
 wrote:
> > > >
> > > > From: Jason Gerecke <jason.gerecke@wacom.com>
> > > >
> > > > "Digitizer" is a generic usage that may be used by various devices =
but
> > > > which is particularly used by non-display pen tablets. This patch a=
dds the
> > > > usage to the list of values matched by the IS_INPUT_APPLICATION() m=
acro
> > > > that determines if an input device should be allocated or not.
> > > >
> > > > Signed-off-by: Jason Gerecke <jason.gerecke@wacom.com>
> > > > Reviewed-by: Ping Cheng <ping.cheng@wacom.com>
> > > > ---
> > > >  include/linux/hid.h | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/include/linux/hid.h b/include/linux/hid.h
> > > > index 4363a63b9775..07803e144d98 100644
> > > > --- a/include/linux/hid.h
> > > > +++ b/include/linux/hid.h
> > > > @@ -883,7 +883,7 @@ static inline bool hid_is_usb(struct hid_device=
 *hdev)
> > > >  /* We ignore a few input applications that are not widely used */
> > > >  #define IS_INPUT_APPLICATION(a) \
> > > >                 (((a >=3D HID_UP_GENDESK) && (a <=3D HID_GD_MULTIAX=
IS)) \
> > > > -               || ((a >=3D HID_DG_PEN) && (a <=3D HID_DG_WHITEBOAR=
D)) \
> > >
> > > FWIW, this has always been problematic, and I am pretty  sure this is
> > > breaking existing devices.
> > >
> > > Have you been running the hid-tools testsuite to see if there were an=
y
> > > regressions?
> > >
> > > Cheers,
> > > Benjamin
> > >
> >
> > I was slightly worried that this usage might have been explicitly
> > excluded for some compatibility reason, but I didn't see anything in
> > the commit history that said that. I also had a hard time convincing
> > myself that allocating an input device for a weird device where it is
> > unnecessary would cause too much trouble.
> >
> > I didn't see any regressions when running the hid-tools testsuite. The
> > output from the 5.15.74 kernel with / without the patch applied is
> > almost identical (there are numerous test failures in test_tablet.py
> > even in the unpatched case; maybe I should re-run with Linus's latest
> > master instead?)
> >
> > Jason
> >
>
> (Apologies for this doubled message, Benjamin -- I didn't "reply all"
> on my previous attempt...)
>
> I re-ran the tests with the Linus's latest 6.1-rc2 and have good
> results with / without the patch there. The test_tablet.py failures I
> previously saw no longer occur, so seem to be specific to stable.
> There are still two tests that fail regardless of if the patch is
> applied or not, but the patch doesn't seem to introduce any new
> failures of its own.
>
> Jason

Still waiting to hear back about this. Are positive results from the
hid-tools tests sufficient, or is there additional work that should be
done for this patch?

Jason
---
Now instead of four in the eights place /
you=E2=80=99ve got three, =E2=80=98Cause you added one  /
(That is to say, eight) to the two,     /
But you can=E2=80=99t take seven from three,    /
So you look at the sixty-fours....
