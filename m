Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CDBD251D34C
	for <lists+linux-input@lfdr.de>; Fri,  6 May 2022 10:23:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344632AbiEFI1V (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 6 May 2022 04:27:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244354AbiEFI1S (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 6 May 2022 04:27:18 -0400
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [170.10.133.74])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 8D2AA68F8A
        for <linux-input@vger.kernel.org>; Fri,  6 May 2022 01:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1651825415;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=+x/gS8SqiqySVsLrvoGQwcksIrUnrIKc9aZpapwP+CA=;
        b=Ma9vOHnBOnKyaGttZyHRKXAQ/9YROiZjdUlmTod+7TLBtQoPLDPA6y3xpJWVQhwHrnpdks
        6ZvVeLehuQPyOUgZhtcwLfXJ5o+sPo9Vw63IYSorYZrX1AtEpHsqF+z7av+e00ba0g12RP
        y9kscEjkK5LJ56L0JkPfgz7UpbF5WU8=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-580-NmCJ5gzoNEOIxGrr_WSAjg-1; Fri, 06 May 2022 04:23:34 -0400
X-MC-Unique: NmCJ5gzoNEOIxGrr_WSAjg-1
Received: by mail-pj1-f70.google.com with SMTP id t15-20020a17090a3b4f00b001d67e27715dso5902296pjf.0
        for <linux-input@vger.kernel.org>; Fri, 06 May 2022 01:23:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+x/gS8SqiqySVsLrvoGQwcksIrUnrIKc9aZpapwP+CA=;
        b=E5487UxlIVGy+VyqGVY5U2Dloy/hwm17GM9DkjFvIx6PbDvEKZUhG74TYinpbpxSqb
         obd3rLxv42OhbSJcHTRPxUcfDrJJyD3zDb0FTueS9FUfyUroPXHhNNPTdKixIMtwLHyZ
         AwUCbhhKs/h1Xej85PdS3ZcIh5tyrG8+KJMretaMECcr6ccM06R1RvmjzPiuojliDS8W
         iePQJCDs7yCzxvyEmzqytZYflA8KlleWnZb0bJhYsNb8JjvSWTUJR/hYKC6eH4wlDOjF
         RnS1LFCjYEo3xntwUzsCWIVkyMF/UyPScLq6qj6VMpM6hTQ1C/z9BMthlWBzqvsxcbxH
         HZgA==
X-Gm-Message-State: AOAM533Frolj1mwOMCt7N10I6ABcpVyDdR/m3ZsA4qsre5aelLq1NJzg
        Lt6NTVLrDn46j7DuzXZ8DqqoWpQ0QjSyE8r+tGI9mNkbiH3SVx/72fwNVJR4YwMpZYiE/KOisc/
        HEwXfSB6STGlAzdnc7KNFsIx+9hTqwnl3AMHClr0=
X-Received: by 2002:a17:902:e2d4:b0:15e:e9f1:4d3e with SMTP id l20-20020a170902e2d400b0015ee9f14d3emr2229772plc.73.1651825413367;
        Fri, 06 May 2022 01:23:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzbIlH/6XtmfluueabPPMQOJGPz4R6Ii4laK7xxNjXeGsxJQiZ0SyPkg8a8IfUcpqTtNuKm3LbepNZRjwjAb5U=
X-Received: by 2002:a17:902:e2d4:b0:15e:e9f1:4d3e with SMTP id
 l20-20020a170902e2d400b0015ee9f14d3emr2229753plc.73.1651825413087; Fri, 06
 May 2022 01:23:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220427224526.35657-1-vi@endrift.com> <CAO-hwJKLr0z98bpt7QnvVWp2QzqDq6jCW+Lj0CgWW0vhYZuNLg@mail.gmail.com>
 <YnQBkd5V3lmC9cGr@google.com> <CAEc3jaA=nYGSZP2i0g-F_3uhx71t1Ut4PCotNokFPj-Ru1OH_w@mail.gmail.com>
In-Reply-To: <CAEc3jaA=nYGSZP2i0g-F_3uhx71t1Ut4PCotNokFPj-Ru1OH_w@mail.gmail.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Fri, 6 May 2022 10:23:22 +0200
Message-ID: <CAO-hwJKoOKeRGzGZ57-c6oCPAmrYUL6d3a_HZyhZ7EO-nGb31w@mail.gmail.com>
Subject: Re: [PATCH 1/6] HID: hid-playstation: Allow removal of touchpad
To:     Roderick Colenbrander <thunderbird2k@gmail.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Vicki Pfau <vi@endrift.com>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>,
        Jiri Kosina <jikos@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, May 6, 2022 at 8:59 AM Roderick Colenbrander
<thunderbird2k@gmail.com> wrote:
>
> On Thu, May 5, 2022 at 12:47 PM Dmitry Torokhov
> <dmitry.torokhov@gmail.com> wrote:
> >
> > On Thu, May 05, 2022 at 10:50:24AM +0200, Benjamin Tissoires wrote:
> > > Hi Vicki,
> > >
> > > On Thu, Apr 28, 2022 at 12:52 AM Vicki Pfau <vi@endrift.com> wrote:
> > > >
> > > > This allows the touchpad input_dev to be removed and have the driver remain
> > > > functional without its presence. This will be used to allow the touchpad to
> > > > be disabled, e.g. by a module parameter.
> > >
> > > Thanks for the contribution.
> > > I'd like to hear from Roderick, but I have a general comment here:
> > > We had Wii and Steam controllers following this logic. Now we are
> > > adding Sony PS ones... That seems like a lot of duplication, and I
> > > wonder if we should not have something more generic.
> >
>
> Using this to hook into the thread with Benjamin. It didn't make it to
> the list (due to HTML I guess) and replying from work email messes
> things up (Outlook...).
>
> There is definitely a need for some type of hidraw / evdev interop.
> What it should be I'm not fully sure. I think it needs to be some
> explicit request or something from user space.
>
> In case of the Dualsense it is a very complicated device and many
> features work through HID including many audio and other features,
> which I hope to support at some point. I feel the need for the driver
> to be able to 'snoop' what is going through hidraw. The extra node
> hack allowed for that, though ideally if a hid driver could get some
> callbacks without having to go through all this extra setup code,
> would be great.

FWIW, as you probably all know by now, I am implementing eBPF at the
HID level, and one of the use cases is to be able to have a HID
firewall.

The main reason for it right now IMO is that we allow uacess for Steam
on the PS controllers, but that also means that anybody can try to
initiate a firmware update by talking to the correct endpoints. And
even if we trust steam to do that properly or not doing it at all, we
do not trust others.

And this firewall might help you in some cases:

>
> For me the use cases for snooping include:
> - Keep sysfs nodes in sync e.g. LED nodes with whatever a hidraw user
> is setting.

BPF might help here, because we can directly snoop on HID reports. We
need to add hooks to sync the LED state, but that is doable.
A pure kernel implementation would work too though.

> - Error handling in case of a crashing hidraw client. E.g. a hidraw
> client may enable rumble. If the application crashes, we probably want
> the kernel driver to disable rumbling.

This is going to happen sooner than you think. With the systemd pull
request I mentioned in the other thread, we are going to have the
ability to revoke hidraw accesses when the client is not in foreground
or if there is a fast user switching.
Resetting to a known working state is hard if we don't know the
context, so we'll probably need some kind of helper in that situation.

> - Handling of audio features (speaker, microphone, headphone jack
> settings, ...). One day we will provide a proper audio driver over
> HID. Many of the control features work over the same HID output report
> as used for rumble, LEDs etcetera.

Definitely firewall related, possibly with on the fly modifications of
the reports.
However, there is a chance we see SDL or Steam saying "I'm going to
implement the driver on the userspace, so I can have it
cross-platform", and it's going to be hairy :(

> - When no users (hidraw / evdev) are connected, potentially enable
> some of the power management features (e.g. disable touchpad / sensors
> at the hardware level)

Shouldn't be too hard to do without bpf, and by just adding the
correct callback if any. We should already get a notification at the
HID core level when there are no users (hid_hw_open/close IIRC), so
maybe we just need a hook into the driver if there is not one already.

Cheers,
Benjamin

>
> There are probably some others as well.
>
> Thanks,
> Roderick
>

