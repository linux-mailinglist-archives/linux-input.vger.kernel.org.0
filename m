Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5BAE97AAD77
	for <lists+linux-input@lfdr.de>; Fri, 22 Sep 2023 11:08:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232905AbjIVJIt (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 22 Sep 2023 05:08:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232904AbjIVJIb (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 22 Sep 2023 05:08:31 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97AECCCF;
        Fri, 22 Sep 2023 02:08:22 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20F77C433C7;
        Fri, 22 Sep 2023 09:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695373702;
        bh=DneDTrMzqOYk2VqM6PWF9OdSV3o85kLkm4Bf5AanMMM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=K/bKC4EQSxuAx5IqqW3uzO9p47l/92Lgt/76oGEITKDOwIy5m6rDvIEpm5wRAoHBV
         ADtzZ5HdLw5GOA4YP27WQWQ4jRfP+3Qe6qEVIvirI/pZqbyowlNIyL4DZt+Xl0ekb0
         ihdZNVN54M/iXbAJK1OObmJEzGB1tT9UTuiELQu/jaCPt5l3wNt4MVrd8Q7qEJC1Nr
         nLNVk7YCoRA+fHaitIqWnnNNji+HjpANpwoPpJhQ8NNbkiVIrGK7vjMDMaJUgHNOCf
         gdxBizBLz+l90ePmO7+sO2WFa77ugxGdDVQz6h/LDlaNv9pSsjLCqT+OpdGUhJETvY
         joieJNy8SjwsA==
Received: from johan by xi.lan with local (Exim 4.96)
        (envelope-from <johan@kernel.org>)
        id 1qjc9T-00054G-2n;
        Fri, 22 Sep 2023 11:08:43 +0200
Date:   Fri, 22 Sep 2023 11:08:43 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Doug Anderson <dianders@chromium.org>
Cc:     Johan Hovold <johan+linaro@kernel.org>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Maxime Ripard <mripard@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        LinusW <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH] HID: i2c-hid: fix handling of unpopulated devices
Message-ID: <ZQ1Zm6ec9NuBvqpl@hovoldconsulting.com>
References: <20230918125851.310-1-johan+linaro@kernel.org>
 <CAD=FV=Wfwvp-SbGrdO5VJcjG42njkApJPB7wnY-YYa1_-O0JWQ@mail.gmail.com>
 <ZQlIveJVdvyV2Ygy@hovoldconsulting.com>
 <CAD=FV=XBG7auVVyHn5uvahSZZxp5qBfp4+A9NwFqahdN6XrbZA@mail.gmail.com>
 <ZQqemN8P2VKgxhsV@hovoldconsulting.com>
 <CAD=FV=XK87TZuPy+d2r2g5QhowmghE-m9pGHe9-X7jnXAw9z1g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD=FV=XK87TZuPy+d2r2g5QhowmghE-m9pGHe9-X7jnXAw9z1g@mail.gmail.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Sep 20, 2023 at 08:41:12AM -0700, Doug Anderson wrote:
> On Wed, Sep 20, 2023 at 12:26 AM Johan Hovold <johan@kernel.org> wrote:
> > On Tue, Sep 19, 2023 at 11:15:46AM -0700, Doug Anderson wrote:
> > > On Tue, Sep 19, 2023 at 12:07 AM Johan Hovold <johan@kernel.org> wrote:

> > As I alluded to in the commit message, you probably want to be able to
> > support second-source touchscreen panel followers as well at some point
> > and then deferring checking whether device is populated until the panel
> > is powered on is not going to work.
> 
> Yeah, I've been pondering this too. I _think_ it would work OK-ish if
> both devices probed and then only one of the two would actually make
> the sub-HID devices. So you'd actually see both devices succeed at
> probing but only one of them would actually be functional. It's a bit
> ugly, though. :(  Maybe marginally better would be if we could figure
> out how to have the device which fails to get its interrupt later
> unbind itself, if that's possible...
> 
> The only other thought I had would be to have the parent i2c bus
> understand that it had children that were panel followers, which it
> should be able to do by seeing the "panel" attribute in their device
> tree. Then the i2c bus could itself register as a panel follower and
> could wait to probe its children until they were powered on. This
> could happen in the i2c core so we didn't have to add code like this
> to all i2c bus drivers. ...and, if necessary, we could add this to
> other busses like SPI. It feels a little awkward but could work.

There may be other device on the bus that have nothing to do with
panels, but I guess you mean that this would only apply to a subset of
the children. In any case, this feels like a hack and layering
violation.

> > I skimmed the thread were you added this, but I'm not sure I saw any
> > reason for why powering on the panel follower temporarily during probe
> > would not work?
> 
> My first instinct says we can't do this, but let's think about it...
> 
> In general the "panel follower" API is designed to give all the
> decision making about when to power things on and off to the panel
> driver, which is controlled by DRM.
> 
> The reason for this is from experience I had when dealing with the
> Samsung ATNA33XC20 panel that's on "sc7180-trogdor-homestar". The TCON
> on that panel tended to die if you didn't sequence it just right.
> Specifically, if you were sending pixels to the panel and then stopped
> then you absolutely needed to power the panel off and on again. Folks
> I talked to even claimed that the panel was working "to spec" since,
> in the "Power Sequencing" section of the eDP spec it clearly shows
> that you _must_ turn the panel off and on again after you stop giving
> it bits. ...this is despite the fact that no other panel I've worked
> with cares. ;-)
> 
> On homestar, since we didn't have the "panel follower" API, we ended
> up adding cost to the hardware and putting the panel and touchscreens
> on different power rails. However, I wanted to make sure that if we
> ran into a similar situation in the future (or maybe if we were trying
> to make hardware work that we didn't have control over) that we could
> solve it.
> 
> The other reason for giving full control to the panel driver is just
> how userspace usually works. Right now userspace tends to power off
> panels if they're not used (like if a lid is closed on a laptop) but
> doesn't necessarily power off the touchscreen. Thus if the touchscreen
> has the ability to keep things powered on then we'd never get to a low
> power state.

Don't you need to keep the touchscreen powered to support wakeup events
(e.g. when not closing the lid)?

And if you close the lid with wakeup disabled, you should still be able
to power down the touchscreen as part of suspend, right?

> The above all explains why panel followers like the touchscreen
> shouldn't be able to keep power on. However, you are specifically
> suggesting that we just turn the power on temporarily during probe. As
> I think about that, it might be possible? I guess you'd have to
> temporarily block DRM from changing the state of the panel while the
> touchscreen is probing. Then if the panel was off then you'd turn it
> on briefly, do your probe, and then turn it off again. If the panel
> was on then by blocking DRM you'd ensure that it stayed on. I'm not
> sure how palatable that would be or if there are any other tricky
> parts I'm not thinking about.

As this would allow actually probing the touchscreen during probe(), as
the driver model expects, this seems like a better approach then
deferring probe and registration if it's at all doable.

> > > Thinking that way, is there any reason you can't just move the
> > > i2c_hid_init_irq() into __do_i2c_hid_core_initial_power_up()? You
> > > could replace the call to enable_irq() with it and then remove the
> > > `IRQF_NO_AUTOEN` flag? I think that would also solve the issue if you
> > > wanted to use a 2nd source + the panel follower concept? Both devices
> > > would probe, but only one of them would actually grab the interrupt
> > > and only one of them would actually create real HID devices. We might
> > > need to do some work to keep from trying again at every poweron of the
> > > panel, but it would probably be workable? I think this would also be a
> > > smaller change...
> >
> > That was my first idea as well, but conceptually it is more correct to
> > request resources at probe time and not at some later point when you can
> > no longer fail probe.
> >
> > You'd also need to handle the fact that the interrupt may never have
> > been requested when remove() is called, which adds unnecessary
> > complexity.
> 
> I don't think it's a lot of complexity, is it? Just an extra "if" statement...

Well you'd need keep track of whether the interrupt has been requested
or not (and manage serialisation) yourself for a start.

But the main reason is still that requesting resources belongs in
probe() and should not be deferred to some later random time where you
cannot inform driver core of failures (e.g. for probe deferral if the
interrupt controller is not yet available).

Johan
