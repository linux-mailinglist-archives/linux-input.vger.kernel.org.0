Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2C510693F93
	for <lists+linux-input@lfdr.de>; Mon, 13 Feb 2023 09:26:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229921AbjBMI0s (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 13 Feb 2023 03:26:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229819AbjBMI0j (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 13 Feb 2023 03:26:39 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A82C74C10
        for <linux-input@vger.kernel.org>; Mon, 13 Feb 2023 00:25:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1676276750;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=9gi7Re7TtTLIPZ1kqzWErPFznYj8n2CCW2X3h3dGGYQ=;
        b=HgtAPPUThHZDqcQGHm7kPTWzWKQv+6PYk5QO7v9aQ01npy2E1quWI6Bf4/aoD9h1HZnYa4
        4OX8oofFhLj+5U/kdvcbSSUZhwDSmwTAKFCMf05KRXS5ZKVHmBoo2ubF534rm728U4VyGl
        9OPGl/wLV76y/8XpOTyVasf+wzs2/Ps=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-35-KgyfpQbuOVKa7fI8rc3UmQ-1; Mon, 13 Feb 2023 03:25:49 -0500
X-MC-Unique: KgyfpQbuOVKa7fI8rc3UmQ-1
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-52a8f97c8ccso118011227b3.6
        for <linux-input@vger.kernel.org>; Mon, 13 Feb 2023 00:25:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9gi7Re7TtTLIPZ1kqzWErPFznYj8n2CCW2X3h3dGGYQ=;
        b=XJDP5ffVRMvoVXOqa0ObSwPt53YWzwhSJY3tc7yr9i5iCk4GsyDZw7Q0DuO91aHIKc
         ZHH1OyQwCMfKa3bf/4RJSJhND8zmHnr8QwFJv1b1ejGKkyRQWJ3DP/IWa0MjgURaSQwv
         7QaNuruXsk3SsvdRXl4WOI9tCEWUnaHHPG2089Dwh+TxIJ+PZG1Uu4U6ZFtgHywU2CNg
         iRKkeDcS+Wkdz/JVNy85ROgVGv6MPwZnsMOVaNRctlYN2KnyXuUP6pndKyc6/7VQAD4D
         hcPiEpR1LTsJ5jNlynWTs2UPrdz/rWFo/+EvoYo4JL8v7PXYUPgPH6X8liU+tbqjBP9G
         Mttg==
X-Gm-Message-State: AO0yUKVlTfaTedMFkjMhu1Os1L6Dkt9Sz1pF5OEeuk5JCFLdxjx2M20c
        K12nie1lZ7Hlusrxk7E3+J1TQWr/P/ZqlpmIEAAVC7+yQP5GkwoCvkXydJwDEFIJOJQ+OADOONS
        bKsJjR5ZgvW+SXWRjG11JdGxeW2nvexyyLw90Wj0=
X-Received: by 2002:a81:bb46:0:b0:52f:ae6:c059 with SMTP id a6-20020a81bb46000000b0052f0ae6c059mr530411ywl.82.1676276748920;
        Mon, 13 Feb 2023 00:25:48 -0800 (PST)
X-Google-Smtp-Source: AK7set+LkTw+FjMHs4oGgC46LYALaldK+SRdjGJMarf6sOuuhPF8xQkqpeIj9ZY13bAzi8R5mG66f66yv41WrDJhheI=
X-Received: by 2002:a81:bb46:0:b0:52f:ae6:c059 with SMTP id
 a6-20020a81bb46000000b0052f0ae6c059mr530407ywl.82.1676276748680; Mon, 13 Feb
 2023 00:25:48 -0800 (PST)
MIME-Version: 1.0
References: <20230125-hid-unregister-leds-v3-0-0a52ac225e00@diag.uniroma1.it>
 <20230125-hid-unregister-leds-v3-1-0a52ac225e00@diag.uniroma1.it>
 <20230210132017.2497-1-hdanton@sina.com> <CAO-hwJJKCvbdjuG4wER6sHozoLA4F2OTUUpHORtj6KM0q-avzA@mail.gmail.com>
 <20230211020041.2613-1-hdanton@sina.com>
In-Reply-To: <20230211020041.2613-1-hdanton@sina.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Mon, 13 Feb 2023 09:25:37 +0100
Message-ID: <CAO-hwJ+bvOvm-7CcKwa_g+f4V4P8k9MKQN46DDckAgBgzNH_yg@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] HID: bigben: use spinlock to safely schedule workers
To:     Hillf Danton <hdanton@sina.com>
Cc:     Pietro Borrello <borrello@diag.uniroma1.it>,
        Jiri Kosina <jikos@kernel.org>, Hanno Zulla <kontakt@hanno.de>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, Feb 11, 2023 at 3:01 AM Hillf Danton <hdanton@sina.com> wrote:
>
> On Fri, 10 Feb 2023 15:11:26 +0100 Benjamin Tissoires <benjamin.tissoires@redhat.com>
> > On Fri, Feb 10, 2023 at 2:24 PM Hillf Danton <hdanton@sina.com> wrote:
> > > On Thu, 09 Feb 2023 23:58:55 +0000 Pietro Borrello <borrello@diag.uniroma1.it>
> > > > Use spinlocks to deal with workers introducing a wrapper
> > > > bigben_schedule_work(), and several spinlock checks.
> > > > Otherwise, bigben_set_led() may schedule bigben->worker after the
> > > > structure has been freed, causing a use-after-free.
> > > >
> > > > Fixes: 4eb1b01de5b9 ("HID: hid-bigbenff: fix race condition for scheduled work during removal")
> > >
> > > Given the flag added in 4eb1b01de5b9 and the spinlock added in this
> > > patchset, devm_led_classdev_register() looks to not work for you.
> >
> > Actually, looking at the code now, it is clear that we need that lock.
> > The current code is happily changing the struct bigben_device from
> > multiple contexts, and pulls that without any barrier in the work
> > struct which should produce some interesting results :)
> >
> > And we can probably abuse that lock to prevent scheduling a new work
> > as it is done in hid-playstation.c
> >
> > I'll comment in the patch which parts need to be changed, because it
> > is true that this patch is definitely not mergeable as such and will
> > need another revision.
> >
> > >
> > > How about replacing the advanced devm_ method with the traditional plain
> > > pair of led_classdev_un/register(), with the flag mentioned cut off but
> > > without bothering to add another lock?
> > >
> >
> > As mentioned above, the lock is needed anyway, and will probably need
> > to be added in a separate patch.
> > Reverting to a non devm version of the led class would complexify the
> > driver for the error paths, and is probably not the best move IMO.
>
> After this patch,
>
>         cpu 0                   cpu 2
>         ---                     ---
>         bigben_remove()
>         spin_lock_irqsave(&bigben->lock, flags);
>         bigben->removed = true;
>         spin_unlock_irqrestore(&bigben->lock, flags);
>
>                                 spin_lock_irqsave(&bigben->lock, flags);
>
> what makes it safe for cpu2 to acquire lock after the removed flag is true?

The remove flag is just a way to prevent any other workqueue from
starting. It doesn't mean that the struct bigben has been freed, so
acquiring a lock at that point is fine.
We then rely on 2 things:
- devm_class_led to be released before struct bigben, because it was
devm-allocated *after* the struct bigben was devm-allocated
- we prevent any new workqueue to start and we guarantee that any
running workqueue is terminated before leaving the .remove function.

Given that the ledclass is gracefully shutting down all of its
potential queues, we don't have any other possibility to have an
unsafe call AFAIU.

Cheers,
Benjamin

