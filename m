Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 450349B20F
	for <lists+linux-input@lfdr.de>; Fri, 23 Aug 2019 16:33:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2395325AbfHWOdG (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 23 Aug 2019 10:33:06 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42508 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2391432AbfHWOdF (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 23 Aug 2019 10:33:05 -0400
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 022C35AFD9
        for <linux-input@vger.kernel.org>; Fri, 23 Aug 2019 14:33:05 +0000 (UTC)
Received: by mail-qk1-f200.google.com with SMTP id o4so9150163qkg.11
        for <linux-input@vger.kernel.org>; Fri, 23 Aug 2019 07:33:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WAme3bkkJ+z3Qaa0evl+EyyRu31KuZX6C53UkTEC/Gg=;
        b=YSOS5gd1KqqGHhbYQWv3zRd80fw/kiScKoIYyirAIBYXawQhVaRWea6vIvaJUdYmED
         HeWZoPivnRZSXJxaDTflSlR/PfHAG0ks+uxtk4P4cx22ch9SX9JJVQw1wfhEJv+DD0oc
         iEsryoWaeCHV1FOT44XGfn30VBe3enCri+y5d3DaBVY8ikp1Ca1dJPCZNmAEK90aI7w9
         a+shHG1yb4PHmndeXxFanejYA9ppkRNQd6TIa22rxdKy/gBKqqCHQrtH3y6X5E37gygY
         L2dwG1oGn2sfIcTQ7S1MVr+vmJdtq+sq3aMS9FjrsNA/19/bBe2GdfPd5AC2PK6ut1pN
         OPJw==
X-Gm-Message-State: APjAAAW8KHVivjOsD1DuHU6HNlfa3DZs92DxGFk15ClpUgNf3GeZytFf
        eobB4W2GF5U9OLz1ad9I350Wb/AViF+K7yAHq7V9R3vp0Q8h9TihuuJGKEOXwKpWH1NYbB8ngbL
        AcU1cDuSo8wAURYn9oaTUlYt2df9r9OOZtW/VkBs=
X-Received: by 2002:a05:620a:1310:: with SMTP id o16mr4043631qkj.27.1566570784301;
        Fri, 23 Aug 2019 07:33:04 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwbykObo+3+44r4UuZMZ22BwKoZcxnQ/KoH9p6VN5hL1eBq5fByxj5ezCmvyxv/EU/tPrTWvsrSL9dqfWDF76o=
X-Received: by 2002:a05:620a:1310:: with SMTP id o16mr4043607qkj.27.1566570784058;
 Fri, 23 Aug 2019 07:33:04 -0700 (PDT)
MIME-Version: 1.0
References: <20190822201849.28924-1-pedro@pedrovanzella.com>
 <CAO-hwJKQcTpmk8cVf-YmKu2awXv_53=qfpy2yfmy2rgMu_DEug@mail.gmail.com> <e6014a01-1094-9ec7-9b37-2abdf70e305f@pedrovanzella.com>
In-Reply-To: <e6014a01-1094-9ec7-9b37-2abdf70e305f@pedrovanzella.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Fri, 23 Aug 2019 16:32:52 +0200
Message-ID: <CAO-hwJ+=dAyFnUfiPSmiGpzYTj=9BPDdeKQOY7UoCOvwQ5CH7Q@mail.gmail.com>
Subject: Re: [Resubmit] Read battery voltage from Logitech Gaming mice
To:     Pedro Vanzella <pedro@pedrovanzella.com>,
        Bastien Nocera <hadess@hadess.net>
Cc:     "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        =?UTF-8?Q?Filipe_La=C3=ADns?= <lains@archlinux.org>,
        Jiri Kosina <jikos@kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Aug 23, 2019 at 4:22 PM Pedro Vanzella <pedro@pedrovanzella.com> wrote:
>
> Hi Benjamin,
>
> On 8/23/19 4:25 AM, Benjamin Tissoires wrote:
> > Hi Pedro,
> >
> > On Thu, Aug 22, 2019 at 10:19 PM Pedro Vanzella <pedro@pedrovanzella.com> wrote:
> >>
> >> Resumitting this after having rebased it against the latest changes.
> >
> > thanks for resubmitting. Sorry I wasn't able to provide feedback on
> > the last revision
> >
>
> No worries, I know how these things are.
>
> >>
> >> The gaming line of Logitech devices doesn't use the old hidpp20
> >> feature for battery level reporting. Instead, they report the
> >> current voltage of the battery, in millivolts.
> >>
> >> This patch set handles this case by adding a quirk to the
> >> devices we know to have this new feature, in both wired
> >> and wireless mode.
> >
> > So the quirk is in the end a bad idea after all. I had some chats with
> > Filipe that made me realize this.
>
> I actually resubmitted by Filipe's request, since the patches weren't
> applying cleanly anymore. The idea was to apply these patches and in the
> future refactor the code to use the feature discovery routines.
>
> > Re-reading our previous exchanges also made me understood why I wasn't
> > happy with the initial submission: for every request the code was
> > checking both features 0x1000 and 0x1001 when we can remember this
> > once and for all during hidpp_initialize_battery().
>
> Yeah I wasn't too happy about this either, but since there was nothing
> prohibiting some device to have both features enabled, I thought this
> wasn't too horrible.

I honestly don't think we will find one device that has both features
enabled. It doesn't make sense as the "new" feature allows for fine
tuning in the software, which would be moot if you also enable the
percentage.

>
> >
> > So I think we should remove the useless quirk in the end (bad idea
> > from me, I concede), and instead during hidpp_initialize_battery() set
> > the correct HIDPP_CAPABILITY_*.
> > Not entirely sure if we should try to call 0x1000, or 0x1001 or if we
> > should rely on the 0x0001 feature to know which feature is available,
> > but this should be implementation detail.
>
> I like the idea of calling 0x0001 once on device boot much better. I
> think we could easily just fetch the location for the features we know
> about and want to deal with once only. This also makes sure we support
> every single device that supports this feature, so that is a huge plus.
>
> In fact, I think we should _not_ call 0x0001 on battery init, but only
> call battery init _after_ we called 0x0001 and discovered either 0x1000
> or 0x1001 (or the solar battery feature, or any other one that might
> crop up in the feature).

ack for that

>
> >
> >>
> >> This version of the patch set is better split, as well as adding the
> >> quirk to make sure we don't needlessly probe every device connected.
> >
> > It is for sure easy to review, but doesn't make much sense in the end.
> > I think we should squash all the patches together as you are just
> > adding one feature in the driver, and it is a little bit disturbing to
> > first add the quirk that has no use, then set up the structs when they
> > are not used, and so on, so forth.
>
> You're right. My first instinct was to send a single patch. As much as I
> tested this, I always feel like breaking the patch up post-facto will
> break a git bisect in the future and everyone will hate me :P

as long as the patches are compiling and are not breaking, git bisect
will not be a problem. However, we might end up with the last one,
which is not very explicit in what it does as it just enables the
features implemented previously.

>
> So we (you, me and Filipe) should probably come up with an action plan
> here. The way I see it there are two issues here: one is adding this
> feature, and the other is refactoring to use feature discovery for all
> features. There are advantages and disadvantages to doing one or another
> first and we might want to discuss that.
>
> By merging this first (probably after I resubmit it as a single squashed
> patch) we get to test it a bit better and have a usable feature sooner.
> Plenty of people have been requesting this and there is plenty of stuff
> that can be built on top of it, but only once this is actually merged I
> think.
>
> On the other hand, by first refactoring the rest of the code to use
> 0x0001 we avoid some rework on this patch. It should be minor, as most
> functions here do all the heavy lifting after the initial feature
> discovery, and are thus mostly independent from how that is done.
>
> I'm happy either way, so just let me know what you guys decide.

I think we should merge your v3 squashed series with a slight
autodetection during battery init, like the method you used in the v1.
This would remove the quirk, but keep the straightforward commands
when addressing battery data.

Relying on 0x0001 should be done separately and can come in in a later
patch IMO (unless you plan to work on it, in which case you can send
both at once).

The problem I have with quirks, and that I explained to Filipe on IRC
is that this is kernel ABI. Even if there is a very low chance we have
someone using this, re-using the same drv_data bit in the future might
break someone's device.

>
> If you guys (or anyone else reading this on the public list, really) has
> any input - naming things being notoriosly hard, I'm actually happy with
> nitpicking - I'd appreciate it. On that note, come to think of it, I'm
> not 100% sure reporting the voltage in milivolts is the standard way. I
> looked through the docs, but found no solid guideline. It was either
> that or a float, so I think I made the right call here, but still.

I am not sure either. Adding Bastien as he has a lot more experience in upower.

But I am under the impression that the kernel part is more "try to
deal with whatever the hardware provides, and deal with it in user
space".
