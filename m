Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DBBF16E8C7B
	for <lists+linux-input@lfdr.de>; Thu, 20 Apr 2023 10:14:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233967AbjDTIOW (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 20 Apr 2023 04:14:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234367AbjDTIOU (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 20 Apr 2023 04:14:20 -0400
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com [IPv6:2607:f8b0:4864:20::d31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2959744A8
        for <linux-input@vger.kernel.org>; Thu, 20 Apr 2023 01:14:17 -0700 (PDT)
Received: by mail-io1-xd31.google.com with SMTP id ca18e2360f4ac-760f4dcfdf4so74382839f.2
        for <linux-input@vger.kernel.org>; Thu, 20 Apr 2023 01:14:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1681978456; x=1684570456;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UOFwzNtaLVqFygjM/4R82fQk6PYg4HBP91sBbADRHBE=;
        b=QMV1HGlUtrqezIoaFWYrhiEcZSV1zoOEmKQj9YRK+yiYxTbKEGq0TLbTKNUg1e3SU3
         6wQWswDJWdrVU5XUJG6LpgFz36S7QDXbLSCymHzpiVKDba4uCOAdcM6b/rGtfjDHL1S3
         Gs4Tx48+hhBn/6GJ3YNsmaXXQvuserf8/emlI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681978456; x=1684570456;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UOFwzNtaLVqFygjM/4R82fQk6PYg4HBP91sBbADRHBE=;
        b=H3+6rRss289qRHfx293TqB4Gr0Yz2wuF+/liLqKJn4l7+JJHpJ2nhwtvZS2KYeySGk
         6qnz+ZgZPee9S0KORUlMKKGo+20DAMUgpIGx9c3z1ogDTFcuU6C2YVe1m+3w258+ai3m
         yQpAGk/4B0wl38NHbdmriXLKfDAYMS2COuVlnuyZfJHO/vpZQa3gfELwSihXCU9sR8e0
         XgVNPW+QRl/Hoa2rcLbf2CgoDiQU9FMP/bYxo7LA7pKRK1Ji8P517yWkmPx/QWFBhqMG
         OmDK8s/fMa5Q8SxbdvLXj+FAoqMhM16iB9J33rIf7/tLw1Bxc51HhmUMn2Ki5Qc6oC/4
         fVkg==
X-Gm-Message-State: AAQBX9dX5oQEeeMOZB3JBBOyYiWLS/kgrvzdmsdyyWqd2FFIDrjxPPhE
        w0aK6s3f9bi/WtCzykknVMfgnlP6PzDpPMBswdI=
X-Google-Smtp-Source: AKy350bN0qbXRZ2F7i5DfxUxlnu/GiITKAhRw4bWGOOOddQ1XIBPhaJC1azrW2S3t9qcPQ+UfjohLA==
X-Received: by 2002:a05:6602:21cc:b0:762:f8d4:705 with SMTP id c12-20020a05660221cc00b00762f8d40705mr902820ioc.12.1681978456207;
        Thu, 20 Apr 2023 01:14:16 -0700 (PDT)
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com. [209.85.166.179])
        by smtp.gmail.com with ESMTPSA id a16-20020a6b6610000000b00760ad468988sm303125ioc.24.2023.04.20.01.14.14
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Apr 2023 01:14:14 -0700 (PDT)
Received: by mail-il1-f179.google.com with SMTP id e9e14a558f8ab-329627dabfbso6541325ab.0
        for <linux-input@vger.kernel.org>; Thu, 20 Apr 2023 01:14:14 -0700 (PDT)
X-Received: by 2002:a02:852a:0:b0:40f:7c3d:2b12 with SMTP id
 g39-20020a02852a000000b0040f7c3d2b12mr275549jai.0.1681978454242; Thu, 20 Apr
 2023 01:14:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230418124953.3170028-1-fshao@chromium.org> <20230418124953.3170028-2-fshao@chromium.org>
 <ZD8z57MBvcfExJx8@nixie71> <CAC=S1ngBt9DmBobMkQXWhqE1UUxFv2U6iFd42nT=1N7r8+pFUg@mail.gmail.com>
 <CAD=FV=U_i26a8uJYmqYf6PUgmTUgmEB5L2DkVga0zDX_iDcGQg@mail.gmail.com>
 <ZEAGTiGyvynGA9P1@nixie71> <CAD=FV=UB393Z1zhK54Apgr-iRcvgiK0t36jt6-t5-5zz3m8OZQ@mail.gmail.com>
In-Reply-To: <CAD=FV=UB393Z1zhK54Apgr-iRcvgiK0t36jt6-t5-5zz3m8OZQ@mail.gmail.com>
From:   Fei Shao <fshao@chromium.org>
Date:   Thu, 20 Apr 2023 16:13:37 +0800
X-Gmail-Original-Message-ID: <CAC=S1nj8VTXOovvianPWDYnsrbek0APD76SBNquFObaw8Vg4BQ@mail.gmail.com>
Message-ID: <CAC=S1nj8VTXOovvianPWDYnsrbek0APD76SBNquFObaw8Vg4BQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: input: goodix: Add powered-in-suspend property
To:     Doug Anderson <dianders@chromium.org>
Cc:     Jeff LaBundy <jeff@labundy.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-mediatek <linux-mediatek@lists.infradead.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On Wed, Apr 19, 2023 at 11:41=E2=80=AFPM Doug Anderson <dianders@chromium.o=
rg> wrote:
>
> Hi,
>
> On Wed, Apr 19, 2023 at 8:18=E2=80=AFAM Jeff LaBundy <jeff@labundy.com> w=
rote:
> >
> > Hi Doug and Fei,
> >
> > Thank you for the informative discussion; I can empathize with the pain
> > these issues bring.
> >
> > On Wed, Apr 19, 2023 at 07:38:13AM -0700, Doug Anderson wrote:
> > > Hi,
> > >
> > > On Wed, Apr 19, 2023 at 3:44=E2=80=AFAM Fei Shao <fshao@chromium.org>=
 wrote:
> > > >
> > > > Hi Jeff,
> > > >
> > > > On Wed, Apr 19, 2023 at 8:21=E2=80=AFAM Jeff LaBundy <jeff@labundy.=
com> wrote:
> > > > >
> > > > > Hi Fei,
> > > > >
> > > > > On Tue, Apr 18, 2023 at 08:49:51PM +0800, Fei Shao wrote:
> > > > > > We observed that on Chromebook device Steelix, if Goodix GT7375=
P
> > > > > > touchscreen is powered in suspend (because, for example, it con=
nects to
> > > > > > an always-on regulator) and with the reset GPIO asserted, it wi=
ll
> > > > > > introduce about 14mW power leakage.
> > > > > >
> > > > > > This property is used to indicate that the touchscreen is power=
ed in
> > > > > > suspend. If it's set, the driver will stop asserting the reset =
GPIO in
> > > > > > power-down, and it will do it in power-up instead to ensure tha=
t the
> > > > > > state is always reset after resuming.
> > > > > >
> > > > > > Signed-off-by: Fei Shao <fshao@chromium.org>
> > > > > > ---
> > > > >
> > > > > This is an interesting problem; were you able to root-cause why t=
he silicon
> > > > > exhibits this behavior? Simply asserting reset should not cause i=
t to draw
> > > > > additional power, let alone 14 mW. This almost sounds like a back=
-powering
> > > > > problem during suspend.
> > > > >
> > > > There was a fix for this behavior before so I didn't dig into it on
> > > > the silicon side.
> > > > I can ask internally and see if we can have Goodix to confirm this =
is
> > > > a known HW erratum.
> > >
> > > Certainly it doesn't hurt to check, but it's not really that shocking
> > > to me that asserting reset could cause a power draw on some hardware.
> > > Reset puts hardware into a default state and that's not necessarily
> > > low power. I guess ideally hardware would act like it's "off" when
> > > reset is asserted and then then init to the default state on the edge
> > > as reset was deasserted, but I not all hardware is designed in an
> > > ideal way.
> >
> > While that is true in theory, I have never, ever seen that to be the ca=
se
> > when there is not some other underlying problem.
> >
> > What I have seen, however, is that asserting reset actually causes the =
GPIO
> > to sink current from some other supply and through the IC. I loosely su=
spect
> > that if you probe the IC's rails and digital I/O during the failure con=
dition,
> > you may find one of them resting at some mid-rail voltage or diode drop=
. It
> > seems you have a similar suspicion.
> >

I reached out to our EE with your thoughts.
He said that he understands the concern, but this doesn't apply in our
schematics because there's only one supply.
Also he simulated a few scenarios that could explain the
back-powering, but none of them is possible without having the
problematic circuit/rsense layout from within the IC itself.

> > In that case, it may mean that some other supply in the system should a=
ctually
> > be kept on, or that supplies are being brought down out of order. In wh=
ich
> > case, the solution should actually be a patch to the affected platform(=
s) dts
> > and not the mainline driver.
>
> I agree that it's a bandaid, but I'm not hopeful that a better
> solution will be found.
>
> Specifically, I'd expect a current leak in the system when you turn a
> supply off and then assert a GPIO high. That's when the device can
> start backpowering itself from a GPIO. In this case, it's the
> opposite. We're keeping the supply on and asserting the (active low)
> reset GPIO to cause the higher power draw. In another design it was
> confirmed that the power draw went away when we were able to turn the
> regulator off (but still keep the active low reset GPIO asserted).
> We've also confirmed that power is good if we keep the supply on and
> _don't_ assert the reset GPIO. Both of these two experiments provide
> some evidence that the system is configured properly and we're not
> backpowering something.
>
> I guess I should revise the above, though. I could believe that there
> is a current leak but on the touchscreen controller board itself,
> which is a black box to us. I have certainly been involved in products
> in the past where the default state of the system at reset caused a
> minor current leak (I remember an EE telling me that as soon as
> software started running I should quickly change the direction of a
> GPIO) and it wouldn't shock me if the touchscreen controller board had
> a problem like this. If there is a problem like this on the
> touchscreen controller board there's not much we can do to workaround
> it.
>
> Unfortunately, if the problem ends up needing a hardware change to fix
> more correctly (which I suspect it does), our hands are tied a bit.
> This is not prototype hardware but is final hardware.
>
> I guess one further note is that, at least on the project I was
> involved in that had a similar problem, folks in China did a bunch of
> analysis on this and went as far as adding an extra regulator to the
> main board schematic to "fix" it. Had the issue just been something
> where we were misconfiguing GPIOs or leaving a regulator in the wrong
> state then they (probably) would have identified it rather than
> spinning the board.

Thank you Doug for providing the details and explanation, and sorry
that I also missed your original reply...
I only considered the ideal scenarios for the always_on usage but not
the cases you brought up. The concerns make sense to me.

I'm still awaiting the response from Goodix, but +1 that if it turns
out to be a GT7375P hw issue, we're not able to do much about that
except relying on the driver workaround.
One more note I want to add is that the first attempt of the fix was
added ~2yrs ago, so it's not an one-off on a particular platform, plus
`sc7180-trogdor-homestar` and `mt8186-corsola-steelix` are two
different designs come from two different teams, but they ended up
with the same symptom.
With that said, I think we have more confidence to say it's a
component misbehavior, and we just fell into the edge case that was
not covered or considered by its design.

Regards,
Fei

>
> -Doug
