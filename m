Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D30A860D0EE
	for <lists+linux-input@lfdr.de>; Tue, 25 Oct 2022 17:44:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232596AbiJYPoI (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 25 Oct 2022 11:44:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232376AbiJYPoH (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 25 Oct 2022 11:44:07 -0400
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com [IPv6:2607:f8b0:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA2C910827B
        for <linux-input@vger.kernel.org>; Tue, 25 Oct 2022 08:44:06 -0700 (PDT)
Received: by mail-ot1-x331.google.com with SMTP id m5-20020a9d73c5000000b0066738ce4f12so814780otk.12
        for <linux-input@vger.kernel.org>; Tue, 25 Oct 2022 08:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4nnIKkJXN94BjbLhc8APSqFB+IjzDeRWQrOv2ve11GA=;
        b=hVGaRCbT+DwL0NriiW2lKLG5aGGkUMOvr18NNW8oeHvjZg1c8HVvqKvl1W7QwViswa
         mxWgqy5qfM8TLCwm4u+7CJb+JHCUYgN49XM/YQXi8GcxJEnb2LCrfghkt7PMhTv1R05e
         ivp7TMYfeDoqIqA1wRDG3kcZ1HpgbO8EVM5uC1rv1XThp5UCzfAlocywY8DdLkbCul3M
         Zbas/eqV2SqW36+rM4tVeai6YlrTvOX0Y/vNCAKuJOHqamTlxsmrS7y0kFc6Wi9Rl4n7
         iBDgHj7I7CfUCkXQR2HrzEO91OHDJ17sj/w8Emw9N9e1dvhl3QeY0t0IQJp5bcXu/Rwh
         Elqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4nnIKkJXN94BjbLhc8APSqFB+IjzDeRWQrOv2ve11GA=;
        b=ZKceaLJvocykUfHWP85WZYAxvz34h+uVjID8LP4jdrLaL7FMYhqxW5wfxc7VeiLyH1
         7Hrl1P4tddTe2wdDHuPMFggM4STYFv+5+yWR2F59JW3T3xWtoiSYjgQStfaEJ8FzCUCa
         uxhvVniW6eZGQgDPuFmf2Fxr+eV7808rRFsls/yPx50k6v6lQoDXGx5arzs4bP/UH1G7
         scooQU3D7/8wW+ihBsfXHMoiLSF4VW/0DwyO/ufMd1h4y8+ad65+FBApPDA28JlXS6HN
         KS4x5I84/0j6bI7G+0Sou5+91WVj617hRa7+18SPggZCTf1LZFAEUBb+ddRDE7N7CZ+T
         krfw==
X-Gm-Message-State: ACrzQf0/8rHHY13npVjsbuxcdqwekCE5WEMdUT2SrBC7+LVVHhRJlsyo
        ptM5ty8I+iw0hD3SLalCMDdmLk/irfEUn3Ewgz8=
X-Google-Smtp-Source: AMsMyM5vx9UZ5tsDsejzqIOu+wPEQir2QveKt9+5xOmqbynYw53xG34pmGFAkYbiJeY/ce6x4d5B+nOKrX4aqXIXO5g=
X-Received: by 2002:a05:6830:4114:b0:661:a008:3777 with SMTP id
 w20-20020a056830411400b00661a0083777mr19884312ott.200.1666712646050; Tue, 25
 Oct 2022 08:44:06 -0700 (PDT)
MIME-Version: 1.0
References: <20221019151832.44522-1-jason.gerecke@wacom.com>
 <CAO-hwJLnuvfic+8vw6OzM0NV66eL40-QEVvXj97dxVimbF7PDA@mail.gmail.com> <CANRwn3SDwUKZ_o_O2Mua8LjVQbkMxBUmU1hOhODGNY0kpekonQ@mail.gmail.com>
In-Reply-To: <CANRwn3SDwUKZ_o_O2Mua8LjVQbkMxBUmU1hOhODGNY0kpekonQ@mail.gmail.com>
From:   Jason Gerecke <killertofu@gmail.com>
Date:   Tue, 25 Oct 2022 08:43:54 -0700
Message-ID: <CANRwn3Q4=rO_uqF3SJVRfmUpqoxiHD=m_HMPSLEVqxXnypkAjw@mail.gmail.com>
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

Jason
---
Now instead of four in the eights place /
you=E2=80=99ve got three, =E2=80=98Cause you added one  /
(That is to say, eight) to the two,     /
But you can=E2=80=99t take seven from three,    /
So you look at the sixty-fours....


On Thu, Oct 20, 2022 at 7:48 AM Jason Gerecke <killertofu@gmail.com> wrote:
>
> On Wed, Oct 19, 2022 at 8:40 AM Benjamin Tissoires
> <benjamin.tissoires@redhat.com> wrote:
> >
> > On Wed, Oct 19, 2022 at 5:18 PM Gerecke, Jason <killertofu@gmail.com> w=
rote:
> > >
> > > From: Jason Gerecke <jason.gerecke@wacom.com>
> > >
> > > "Digitizer" is a generic usage that may be used by various devices bu=
t
> > > which is particularly used by non-display pen tablets. This patch add=
s the
> > > usage to the list of values matched by the IS_INPUT_APPLICATION() mac=
ro
> > > that determines if an input device should be allocated or not.
> > >
> > > Signed-off-by: Jason Gerecke <jason.gerecke@wacom.com>
> > > Reviewed-by: Ping Cheng <ping.cheng@wacom.com>
> > > ---
> > >  include/linux/hid.h | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/include/linux/hid.h b/include/linux/hid.h
> > > index 4363a63b9775..07803e144d98 100644
> > > --- a/include/linux/hid.h
> > > +++ b/include/linux/hid.h
> > > @@ -883,7 +883,7 @@ static inline bool hid_is_usb(struct hid_device *=
hdev)
> > >  /* We ignore a few input applications that are not widely used */
> > >  #define IS_INPUT_APPLICATION(a) \
> > >                 (((a >=3D HID_UP_GENDESK) && (a <=3D HID_GD_MULTIAXIS=
)) \
> > > -               || ((a >=3D HID_DG_PEN) && (a <=3D HID_DG_WHITEBOARD)=
) \
> >
> > FWIW, this has always been problematic, and I am pretty  sure this is
> > breaking existing devices.
> >
> > Have you been running the hid-tools testsuite to see if there were any
> > regressions?
> >
> > Cheers,
> > Benjamin
> >
>
> I was slightly worried that this usage might have been explicitly
> excluded for some compatibility reason, but I didn't see anything in
> the commit history that said that. I also had a hard time convincing
> myself that allocating an input device for a weird device where it is
> unnecessary would cause too much trouble.
>
> I didn't see any regressions when running the hid-tools testsuite. The
> output from the 5.15.74 kernel with / without the patch applied is
> almost identical (there are numerous test failures in test_tablet.py
> even in the unpatched case; maybe I should re-run with Linus's latest
> master instead?)
>
> Jason
>

(Apologies for this doubled message, Benjamin -- I didn't "reply all"
on my previous attempt...)

I re-ran the tests with the Linus's latest 6.1-rc2 and have good
results with / without the patch there. The test_tablet.py failures I
previously saw no longer occur, so seem to be specific to stable.
There are still two tests that fail regardless of if the patch is
applied or not, but the patch doesn't seem to introduce any new
failures of its own.

Jason
