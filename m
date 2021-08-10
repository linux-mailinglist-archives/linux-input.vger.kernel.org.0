Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2CBC73E584C
	for <lists+linux-input@lfdr.de>; Tue, 10 Aug 2021 12:27:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236555AbhHJK1w (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 10 Aug 2021 06:27:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239122AbhHJK0h (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 10 Aug 2021 06:26:37 -0400
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com [IPv6:2607:f8b0:4864:20::b2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EF7BC0613D3
        for <linux-input@vger.kernel.org>; Tue, 10 Aug 2021 03:25:53 -0700 (PDT)
Received: by mail-yb1-xb2a.google.com with SMTP id l3so2795242ybt.7
        for <linux-input@vger.kernel.org>; Tue, 10 Aug 2021 03:25:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rioGUfPVNrrqvDbMnj50WwCJzNwWWBieIAsixVwfbCg=;
        b=U8gW9IpDqvrszvfWN/ypnllFzcfCM+dOIQ8e1crZNbcVCSvXWRW/+kYf2WUaXyyYOa
         CkU1gydalcE/D4yXX5dxwlvhOgm2Ot+JBe7oQfnW/TYjvuZ7xpxbrxaSz8rtGdJ1NXr6
         jl+7NPcYbKl+BDyvJ0xhdHnjsBliRoK9dqzrpmBOvBZYPqyg/Vq/4PKmxDU/hIgAR861
         uSNShfrCBebfG22TgewWiEMWoaVmoLLNxT4tQS78dySenrdz3XFfA7BanKgEFb4Il3sB
         xEyYgplOHsZeR0AtbflP7I71fBX1foluO5CIoW9DrA2OIC63SWxXJsuOFA3JfkEB8ceK
         VAvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rioGUfPVNrrqvDbMnj50WwCJzNwWWBieIAsixVwfbCg=;
        b=BY7AP30wBlt8+gRLiVj2biSnB2pKut2qowMr1eBvq8EPwFr+bXAZ1fdZg6oA14xBgw
         uXz3h5PZDuExWXfPZ9kgcxCWMjdj6FsooTO4++56rg/TTcnINxis51xPm4QHACoKC2Ga
         hSvdQbloOM9aIKDt+RXuV1qTsPmmXQuJaKdVsxJyhtdqRkqOgAkb1x7yoQYtKrl+ogIc
         mC5FphCq/3H7jBvsMNRxq0h06O8GfFhcDIO+cftMED89310wIGQSxW4wrpkjVD2O+n0M
         Nq827xRLm7jr7+6UJG1ZCoJBt4sexHsm9DWULByLWjyzxI9lGSChFCmdwLzY/1tir3/H
         8YUw==
X-Gm-Message-State: AOAM531Gl5jQIxBuCviCFKDbka+dWqq6OA8KkSgnc5+cqAK2ZFU9Ynkd
        ec5feaGmcIJ5QJOT8nmYnaVsfaKUy8/4Jjvz5ho=
X-Google-Smtp-Source: ABdhPJzlUevz5bY+JLzxxZlCuxsgxIfGv3nLjyag0p0P4XRtd+p22D4BETHFAF+eoaM5v7UtWy76x3ogEORYnKjCzSc=
X-Received: by 2002:a25:d290:: with SMTP id j138mr39511212ybg.151.1628591152743;
 Tue, 10 Aug 2021 03:25:52 -0700 (PDT)
MIME-Version: 1.0
References: <CAKXUXMx6dByO03f3dX0X5zjvQp0j2AhJBg0vQFDmhZUhtKxRxw@mail.gmail.com>
In-Reply-To: <CAKXUXMx6dByO03f3dX0X5zjvQp0j2AhJBg0vQFDmhZUhtKxRxw@mail.gmail.com>
From:   Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date:   Tue, 10 Aug 2021 12:25:41 +0200
Message-ID: <CAKXUXMyM7MRJVT8sLFBiMcV9UMgxYzb9+x9owr_6ZWv8JFUyKA@mail.gmail.com>
Subject: Re: Kconfig issue in commit c49c33637802 ("HID: support for
 initialization of some Thrustmaster wheels")
To:     Dario Pagani <dario.pagani.146@gmail.com>,
        Kim Kuparinen <kimi.h.kuparinen@gmail.com>,
        Jiri Kosina <jkosina@suse.cz>
Cc:     linux-input@vger.kernel.org,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Aug 10, 2021 at 7:04 AM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
>
> Dear Dario, dear Kim, dear Jiri,
>
> In commit c49c33637802 ("HID: support for initialization of some
> Thrustmaster wheels"), you have added in ./drivers/hid/Makefile:
>
> obj-$(CONFIG_HID_TMINIT)       += hid-tminit.o
>
> and drivers/hid/hid-quirks.c:
>
> +#if IS_ENABLED(CONFIG_HID_TMINIT)
> +       { HID_USB_DEVICE(USB_VENDOR_ID_THRUSTMASTER, 0xb65d) },
> +#endif
>
> However, there is no config HID_TMINIT defined in Kconfig, nor a file
> hid-tminit.c.
>
> So, this above is all dead code.
>
> Is this just some unintended leftover from refactoring, or are we
> missing a config and the hid-tminit file?
>
> I am happy to provide a patch, once it is what was intended here.
>
> E.g., just drop the line in the Makefile and add the HID_USB_DEVICE
> declaration to the CONFIG_HID_THRUSTMASTER ifdef block---if that
> works?
>

On Tue, Aug 10, 2021 at 7:34 AM Kim Kuparinen
<kimi.h.kuparinen@gmail.com> wrote:
>
> hid-tminit.c was renamed to hid-thrustmaster.c, so seems like a refactoring artefact. The changes you suggested sound like what was intended, though I haven't personally tested them yet.
>

Kim, Dario, I have created the patch and sent it out on the
linux-input mailing list; see here:

https://lore.kernel.org/linux-input/20210810102148.9764-1-lukas.bulwahn@gmail.com/

You might just apply and test it.

Lukas
