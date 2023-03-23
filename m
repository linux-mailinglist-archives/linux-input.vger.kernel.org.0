Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 83EE16C6C3A
	for <lists+linux-input@lfdr.de>; Thu, 23 Mar 2023 16:24:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232117AbjCWPYr (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 23 Mar 2023 11:24:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232029AbjCWPYq (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 23 Mar 2023 11:24:46 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 780631B574
        for <linux-input@vger.kernel.org>; Thu, 23 Mar 2023 08:24:45 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id r11so4150335wrr.12
        for <linux-input@vger.kernel.org>; Thu, 23 Mar 2023 08:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679585084;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=esQmEaP76SDEyGl7zqjjaeoUbrLJ2LkNFzcvJ0FZOvE=;
        b=PNlk4HxU9foesDO5bVo+fXlLN792sbSfOZHXY+8XsLvxViJfErPURbtzShBDuRYrXV
         BTwGskKwYxAu/oM0qaHo54eWtPfgk4d2hHS3f2dsx6Wmr3YBodb0LZ82FpdwxEMUBOtf
         bkXAQHttvUYbLpMw11q72U0PNbyIhMbLP39o4rh/lHDBiytLKABg9CMBl2wstaJpwMRK
         K8LZ8heuA/Ck8Gh7a7gxqP5be2q4xdqdICn6jMSNLZQh+ZDDvZ0ZKZ7Q8CPxzYYADacL
         N1mr0JWa7Q//Ee5uBkQsZbdYUr9XWGeoIGIkH71Fj/LYs1JcqNJ4qTcMLJOwJHckn2Tn
         Kexw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679585084;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=esQmEaP76SDEyGl7zqjjaeoUbrLJ2LkNFzcvJ0FZOvE=;
        b=pwTLob+J4wzZuIjwnQmNSSQDH6wm+0OX/J0ahJBmACLhwIMg04YZ7q8zkM3SNbu8rf
         xF2FWiGuk4BYOFRihnCbSxe5hXO89JIl/vuxEdeBLCYzyLti5S5SKxPeSaF7DYGVswQb
         WoTrjQbrUVP0G3bH+QLL3G8ljrS15I4vlh2GUNDOLr6MCP2YsHjw/eJ1sBsp2GwbZdga
         IJ9NYedw0XDQYuLpB3KejtMNy6igt8Id39Bh7ygAGdpLH0xz9z/9SE/Ja0MK6EjGVaOu
         zIQwlt905nJ9AlIzKCJbfGgaTpdYO+7e/dfqk32h/q/7NEjj0b9R8AqCP63KPKiBS6UV
         yGsQ==
X-Gm-Message-State: AAQBX9eMPQz7zGYFv4R46qh+9zKwHunj0AkG6ekaR3B2S1vexgiCky6a
        EoB2YtO8VpnHNqjWKQAic+baoQAmtNR0QXO8+dlZoatG2XI=
X-Google-Smtp-Source: AKy350a62It/WQ2MgaScsKgCOWeaB8O8KHzUHPRlVDfGQ5u7zgNwXgABccaPf6VaQxWr4SMKZzW+0Rz1PldKBS4D9ew=
X-Received: by 2002:a5d:494c:0:b0:2d6:e7b3:74cb with SMTP id
 r12-20020a5d494c000000b002d6e7b374cbmr812762wrs.7.1679585083829; Thu, 23 Mar
 2023 08:24:43 -0700 (PDT)
MIME-Version: 1.0
References: <CANRwn3QZfeu4Oonw2-bFHzDajxDJRD6+G5HXr1WJ7bJuXddf2Q@mail.gmail.com>
 <20221203114318.10103-1-jose.exposito89@gmail.com> <CANRwn3S=6S+mtzL5eFUP=z6K0m=1LO3gyvS4eWHugB8n_3NBhw@mail.gmail.com>
In-Reply-To: <CANRwn3S=6S+mtzL5eFUP=z6K0m=1LO3gyvS4eWHugB8n_3NBhw@mail.gmail.com>
From:   Jason Gerecke <killertofu@gmail.com>
Date:   Thu, 23 Mar 2023 08:24:32 -0700
Message-ID: <CANRwn3RzXZnLzfhX3EGjL+aFJwxxhyS53ZYNHfYyW-0=JdYFvQ@mail.gmail.com>
Subject: Re: [PATCH] HID: Recognize "Digitizer" as a valid input application
To:     benjamin.tissoires@redhat.com, linux-input@vger.kernel.org
Cc:     jason.gerecke@wacom.com, jikos@kernel.org,
        joshua@joshua-dickens.com, ping.cheng@wacom.com,
        pinglinux@gmail.com, skomra@gmail.com,
        =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Following up on this since it has been a while since the last attempt.
I'm still hoping to get this patch merged if possible :)

The patch still applies cleanly against the for-6.4/core branch and
the hid-tools test suite still runs without any (new*) test failures
when the patch is applied. Please let me know if there's anything I
could / should do to continue moving this forward.


*There are four failures in test_sony.py, but they occur on the
for-6.4/core branch regardless of if the patch is applied or not.

Jason
---
Now instead of four in the eights place /
you=E2=80=99ve got three, =E2=80=98Cause you added one  /
(That is to say, eight) to the two,     /
But you can=E2=80=99t take seven from three,    /
So you look at the sixty-fours....


On Thu, Dec 15, 2022 at 8:11=E2=80=AFAM Jason Gerecke <killertofu@gmail.com=
> wrote:
>
> Thanks for the response, Jose.
>
> Unfortunately this isn't an issue that we can fix in the Wacom driver
> since it affects devices that don't use the Wacom driver. While we
> could theoretically adopt affected VID:PIDs into the Wacom driver on a
> case-by-case basis, there would be a large time lag between us
> adopting a device and users running the required kernel. This should
> really be something that is fixed in the hid-generic driver, even if
> it means some pain trying to ensure we don't break things in the
> process... I'm still hoping to hear something back from Benjamin about
> my hid-tools test results or if additional testing is needed.
>
> Jason
> ---
> Now instead of four in the eights place /
> you=E2=80=99ve got three, =E2=80=98Cause you added one  /
> (That is to say, eight) to the two,     /
> But you can=E2=80=99t take seven from three,    /
> So you look at the sixty-fours....
>
> On Sat, Dec 3, 2022 at 3:43 AM Jos=C3=A9 Exp=C3=B3sito <jose.exposito89@g=
mail.com> wrote:
> >
> > Hi Jason,
> >
> > > Still waiting to hear back about this. Are positive results from the
> > > hid-tools tests sufficient, or is there additional work that should b=
e
> > > done for this patch?
> >
> > A while ago a similar patch was sent [1] and it was in a similar status
> > to your patch for a while, so I decided to fix the issue in the UCLogic
> > driver [2].
> >
> > I can not tell you if this patch needs additional work, but you might b=
e
> > interested in fixing it in the Wacom driver, where it'd be easier for y=
ou
> > to test that no regressions are introduced.
> >
> > I hope this helps a bit,
> > Jose
> >
> > [1] https://lore.kernel.org/linux-input/20220804151832.30373-1-openglfr=
eak@googlemail.com/
> > [2] https://lore.kernel.org/linux-input/d08049f2-443b-f769-cfde-629cdfb=
96fc0@alexyzhang.dev/T/
