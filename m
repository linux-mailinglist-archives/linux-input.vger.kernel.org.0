Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD440454ED4
	for <lists+linux-input@lfdr.de>; Wed, 17 Nov 2021 21:56:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239326AbhKQU7g (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 17 Nov 2021 15:59:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239102AbhKQU7f (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 17 Nov 2021 15:59:35 -0500
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com [IPv6:2607:f8b0:4864:20::d33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 900CEC061570
        for <linux-input@vger.kernel.org>; Wed, 17 Nov 2021 12:56:36 -0800 (PST)
Received: by mail-io1-xd33.google.com with SMTP id p23so5083132iod.7
        for <linux-input@vger.kernel.org>; Wed, 17 Nov 2021 12:56:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GrJlquQSFqb7ld9Q1DR8e4oNe3prEb84z5HAh4ed2AM=;
        b=afsCAKBCIKIWX+vyZFbo/xeVsnQkBNdGAnYp5lte88IGZuNV1unaZOpAeDtT+h0+Ej
         Tq3pI2l1Pe+Hgk3/TKgpj3VlGYqS2WMGNugnCJXykWAKETOQrPFvP1Fhd5M02xckbaNe
         ym0nvf2IhGcGdrO251KeqW+vtjto4q1Rvc8fA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GrJlquQSFqb7ld9Q1DR8e4oNe3prEb84z5HAh4ed2AM=;
        b=G3C/VpOknSTbL2RbCF7h3dTXHVkrL6C0ZKACsO3mqweEBm+Z1VsuR4B4UCS/S42VtC
         eIk886LPWC1bpF/izaqR9fsk7H3hQly2xAoE51R9JT9tcWv22tSCZos+OwRfVR5qk5T2
         eGs/4HOwIyQboSskuTIRCjBoyENsvNBxCW2szLh1LPmBlSqsbLreSEQPknTSvLowEo6f
         hfAAx/qq8WqQ0n2MFHjLpwm0sodGQy7+ZIOTPukKLkXiOa47iBt352w9mh3TApudLmL0
         zKLc51gXtRL3IHV5YGEOPWZpvxCHnb/vVhbHuATQO7PSj5gyRdqKkgcU69F5UkjLac+J
         T7LA==
X-Gm-Message-State: AOAM533uAa7JpGeltHr8LgXf6SE+y3J/+kzKCR14U3elio2NHs2jWi3Z
        YloVDe4OdgBgnwSwNo/MYAqPfBUl6WpRKQ==
X-Google-Smtp-Source: ABdhPJzMnWJfCvcLEwjFYq++NRxrYK8A5p5BUvIKUX6oGzenBzi7UB2kSUkhpO6p8AgDfymXA/ZDlQ==
X-Received: by 2002:a5e:c10d:: with SMTP id v13mr13239453iol.115.1637182595805;
        Wed, 17 Nov 2021 12:56:35 -0800 (PST)
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com. [209.85.166.181])
        by smtp.gmail.com with ESMTPSA id w21sm416835iov.6.2021.11.17.12.56.34
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Nov 2021 12:56:34 -0800 (PST)
Received: by mail-il1-f181.google.com with SMTP id x9so4164530ilu.6
        for <linux-input@vger.kernel.org>; Wed, 17 Nov 2021 12:56:34 -0800 (PST)
X-Received: by 2002:a05:6e02:18ce:: with SMTP id s14mr11662640ilu.142.1637182593782;
 Wed, 17 Nov 2021 12:56:33 -0800 (PST)
MIME-Version: 1.0
References: <20211103234018.4009771-1-briannorris@chromium.org>
 <20211103164002.1.I09b516eff75ead160a6582dd557e7e7e900c9e8e@changeid>
 <CAD=FV=XOda7vwUPY+WpGLzMwwrbrhQ9RqBQw4LhPwD6Sqhf7vw@mail.gmail.com>
 <CA+ASDXMvZCjn+X98JccyJiLQ0ggq-t-HqnM5SKYMbiQFqZDhGQ@mail.gmail.com> <YZVqbZpAPHOBG6bL@google.com>
In-Reply-To: <YZVqbZpAPHOBG6bL@google.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 17 Nov 2021 12:56:21 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Wx581Oq9Jg=bqtWtWU1nrtUUo5YJG2zaf1tDEJ88J5Dg@mail.gmail.com>
Message-ID: <CAD=FV=Wx581Oq9Jg=bqtWtWU1nrtUUo5YJG2zaf1tDEJ88J5Dg@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/input_helper: Add new input-handling helper
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Brian Norris <briannorris@chromium.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        David Airlie <airlied@linux.ie>,
        linux-rockchip@lists.infradead.org,
        "Kristian H . Kristensen" <hoegsberg@google.com>,
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On Wed, Nov 17, 2021 at 12:47 PM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> On Wed, Nov 17, 2021 at 10:38:58AM -0800, Brian Norris wrote:
> > On Fri, Nov 12, 2021 at 4:52 PM Doug Anderson <dianders@chromium.org> wrote:
> >
> > (Snip other comments; they seem reasonable, and I'll factor them into
> > the next version)
> >
> > > I guess one random thought I had is whether there would be an
> > > appropriate place to put this that _wasn't_ in DRM. I still wonder
> > > whether we'll ever try to upstream something like the cpufreq boost
> > > driver that we're carrying around and using in Chrome OS. If so, it
> > > would want to use these same helpers and it'd be pretty awkward for it
> > > to have to reach into DRM. ...any chance we could just land these
> > > helpers somewhere more generic?
> >
> > Yeah, I was torn on what to do here as well. I'd rather land something
> > than nothing, and when reading past conversations, it sounded like
> > Dmitry didn't want this kind of thing in drivers/input/ [1]. I'd love
> > to be wrong here though.
>
> I simply feel that input_handler is already a very simple abstraction
> and trying to specialize it to simplify users further is not productive.

I guess, if nothing else, it would be nice to avoid the tables that
we'd have to copy between DRM and cpufreq: the set of input devices
that are likely a sign that the user is interacting with the device.
It always seemed weird to copy that from place to place and if there's
ever a new input device to add it would be annoying to have to update
it everywhere.

It would be nice to avoid some of the other boilerplate code here
connecting things together when all we need is a callback, but I agree
that if those were copied it wouldn't be the end of the world.

-Doug
