Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 55F40692090
	for <lists+linux-input@lfdr.de>; Fri, 10 Feb 2023 15:12:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231910AbjBJOMp (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 10 Feb 2023 09:12:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231656AbjBJOMp (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 10 Feb 2023 09:12:45 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2739C2195A
        for <linux-input@vger.kernel.org>; Fri, 10 Feb 2023 06:11:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1676038299;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=YoBs3vIDWvzQKvR/oTtsO0zOrYgmC2p612zkdiN8nZI=;
        b=eeYcyMuns//uMleHmbpe1u+Uz3AuXDJGFoA3GjAph46Ause93rvHLOC3dWILx8bI/pFo8L
        6gbYKdrecRoUyo76DOWkAQ2CZzhV9bOWnSnFEe1e8Culdz7jrIo6EQMxU3kdx92bcu4+GV
        M4+F5B8/GKxnpTCgXjaUyMihygxBek4=
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com
 [209.85.219.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-338-jeNUn2OOOJuNdF7FNn2lmQ-1; Fri, 10 Feb 2023 09:11:38 -0500
X-MC-Unique: jeNUn2OOOJuNdF7FNn2lmQ-1
Received: by mail-yb1-f200.google.com with SMTP id q133-20020a25d98b000000b0089ab1a9f0fdso4991617ybg.1
        for <linux-input@vger.kernel.org>; Fri, 10 Feb 2023 06:11:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YoBs3vIDWvzQKvR/oTtsO0zOrYgmC2p612zkdiN8nZI=;
        b=fD7AtCgLYBcpmkON4dm0BdXm7zDwt+Wss3ldWy+rE1BjPvbKx4bfK065SYAZYK3/jy
         fps9PAjuK2Os2Srff3/M3fKKN7D5kmJWaVPB0i6Pxsl1omGY6kaB2PIvk7DmfuozLW8r
         4r1koE1WNw4sN+MQsguh077J0rEZGB38Kc+/5T/wOUeWiBZCyPeX2zlEx276MLaZhdB9
         8DvTDBV9ZsoafRAJXi+hJnxE90FsrKLxbbAjtf1DaUpCmijBAe/9dc9s9ZzOeS79HA98
         fdNkKeLfPq58HGIpsg1omSGVFtaOzMOL4SW6SYgDIFdiiJIqLNv8h2UHyLlv8VtC+vUg
         d62Q==
X-Gm-Message-State: AO0yUKWZ3Q2dYJmdytDiplYAd/Ujj+hMiwkKjbvqd3T77GL3OBj7uzKH
        eSDXr8MoJiWX8iztl1PUxrP10Y5rni+UqZeaRkoJQNx8Nx+f3pN6tir3vFa7HIBN3Fkwfgm4PMe
        LUsLXDCXjvvxuCAmMupmXUcvdx4VDabQXD/bOfnQ=
X-Received: by 2002:a25:abee:0:b0:7e8:ee11:9717 with SMTP id v101-20020a25abee000000b007e8ee119717mr2097767ybi.495.1676038297771;
        Fri, 10 Feb 2023 06:11:37 -0800 (PST)
X-Google-Smtp-Source: AK7set97Zh//MtW7TNLPI8dlq3k+OjCqIRogXFhJt0v99VmllmE5FlWZ7GIsIhHXou5s5pN4AzV2Zzus5SSziM/r4zQ=
X-Received: by 2002:a25:abee:0:b0:7e8:ee11:9717 with SMTP id
 v101-20020a25abee000000b007e8ee119717mr2097763ybi.495.1676038297528; Fri, 10
 Feb 2023 06:11:37 -0800 (PST)
MIME-Version: 1.0
References: <20230125-hid-unregister-leds-v3-0-0a52ac225e00@diag.uniroma1.it>
 <20230125-hid-unregister-leds-v3-1-0a52ac225e00@diag.uniroma1.it> <20230210132017.2497-1-hdanton@sina.com>
In-Reply-To: <20230210132017.2497-1-hdanton@sina.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Fri, 10 Feb 2023 15:11:26 +0100
Message-ID: <CAO-hwJJKCvbdjuG4wER6sHozoLA4F2OTUUpHORtj6KM0q-avzA@mail.gmail.com>
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

On Fri, Feb 10, 2023 at 2:24 PM Hillf Danton <hdanton@sina.com> wrote:
>
> On Thu, 09 Feb 2023 23:58:55 +0000 Pietro Borrello <borrello@diag.uniroma1.it>
> > Use spinlocks to deal with workers introducing a wrapper
> > bigben_schedule_work(), and several spinlock checks.
> > Otherwise, bigben_set_led() may schedule bigben->worker after the
> > structure has been freed, causing a use-after-free.
> >
> > Fixes: 4eb1b01de5b9 ("HID: hid-bigbenff: fix race condition for scheduled work during removal")
>
> Given the flag added in 4eb1b01de5b9 and the spinlock added in this
> patchset, devm_led_classdev_register() looks to not work for you.

Actually, looking at the code now, it is clear that we need that lock.
The current code is happily changing the struct bigben_device from
multiple contexts, and pulls that without any barrier in the work
struct which should produce some interesting results :)

And we can probably abuse that lock to prevent scheduling a new work
as it is done in hid-playstation.c

I'll comment in the patch which parts need to be changed, because it
is true that this patch is definitely not mergeable as such and will
need another revision.

>
> How about replacing the advanced devm_ method with the traditional plain
> pair of led_classdev_un/register(), with the flag mentioned cut off but
> without bothering to add another lock?
>

As mentioned above, the lock is needed anyway, and will probably need
to be added in a separate patch.
Reverting to a non devm version of the led class would complexify the
driver for the error paths, and is probably not the best move IMO.

Cheers,
Benjamin

