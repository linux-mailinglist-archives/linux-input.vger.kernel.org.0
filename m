Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 231D13E8394
	for <lists+linux-input@lfdr.de>; Tue, 10 Aug 2021 21:22:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232473AbhHJTWi (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 10 Aug 2021 15:22:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232486AbhHJTW1 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 10 Aug 2021 15:22:27 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F8A6C06179C;
        Tue, 10 Aug 2021 12:22:04 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id k38-20020a05600c1ca6b029025af5e0f38bso2686157wms.5;
        Tue, 10 Aug 2021 12:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=D45mXNvkWA7/WYlp8AvRpQ5b9X4R62efHU/Fd8vCZP8=;
        b=Y8AwmA+2a2rRKypmCHevqvPsVlHD8NE4NJWmZeABaKDdDSugGDSphp/6vnH9pKwsRw
         pmFktyszj+SZZCjj3lCDo0nfx2n9VkWIbOO9//6zEDR70/orB4fFPEU+NjiVrh3AtJeP
         zKavK+4zLaNtLscmE+Tj+nUR5LiwR4EFzHjLBlnSfkIOv4RNmsBe/4BXBxzsI1edDine
         3C+gvFsKcrq33vWVdiB2ykz4hyIb47IHzUVpxS6ldDI8dOI2uSMZbhfN+YCJkwskzOsI
         0lOv8RKQZ9Fcr92E5wr1t45fxnrBl4F/x8fPRuAyEZDdvkfFk5APkiBNGXmrgNEUeXPR
         v/4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=D45mXNvkWA7/WYlp8AvRpQ5b9X4R62efHU/Fd8vCZP8=;
        b=EPISCmn2X3EDs8cTG3NmFE9wOS/fq6aVFx1QjPzpqyfstCXb4+/iSOa2FnpqgzaDpG
         44ufdCGKP+EMtHnmyh4wG+riFK5wgi2DbRNptelmzKDW0UmRh3PK2jfRJv6jI9NmDMnX
         v1nnC5aF8yaeRq0pjUW8zff5lHPz/UwQSINQN1fO/bhJ4YLJUA3lafrI5v0cWb2L4cLV
         PoJo3YJd7+BSUGqUYVAjrZYpdRl3hxLh4VFQ8OMtvku9NDqnSu3QuP515NgNqsJWqSJR
         /w/8phC9mN3voKlywYqcQY7UEDUFfnFd1Va17kEa/WSbnYkBOSdw3pxcJbj34NWfSnRC
         9eWw==
X-Gm-Message-State: AOAM533FBNfYbZFoSKASF252tj0fNNq/hxMFdngKN57ZTu7IqSbHZ/su
        5MYyB4amP/VaCxZYa53KVTF/HQ3RGYVmmqpivnA=
X-Google-Smtp-Source: ABdhPJykvn4AJeGs5caXBxsJtiV0pPBKkQfmiOwi/TrMj4Ct4nrAhb3d7UuHPWJy7V7cL7lL6nKWsKP9Mp0hcMfkA1w=
X-Received: by 2002:a05:600c:293:: with SMTP id 19mr23476439wmk.179.1628623323146;
 Tue, 10 Aug 2021 12:22:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210810102148.9764-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20210810102148.9764-1-lukas.bulwahn@gmail.com>
From:   Kim Kuparinen <kimi.h.kuparinen@gmail.com>
Date:   Tue, 10 Aug 2021 22:21:52 +0300
Message-ID: <CABD-7My1Nc=TEY=qwQo=G-XA718zRDetYF7KchQRVeTwPg60uA@mail.gmail.com>
Subject: Re: [PATCH] HID: thrustmaster: clean up Makefile and adapt quirks
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc:     Dario Pagani <dario.pagani.146@gmail.com>,
        Jiri Kosina <jkosina@suse.cz>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Works on my VM.

Kim

ti 10. elok. 2021 klo 13.21 Lukas Bulwahn (lukas.bulwahn@gmail.com) kirjoitti:
>
> Commit c49c33637802 ("HID: support for initialization of some Thrustmaster
> wheels") messed up the Makefile and quirks during the refactoring of this
> commit.
>
> Luckily, ./scripts/checkkconfigsymbols.py warns on non-existing configs:
>
> HID_TMINIT
> Referencing files: drivers/hid/Makefile, drivers/hid/hid-quirks.c
>
> Following the discussion (see Link), CONFIG_HID_THRUSTMASTER is the
> intended config for CONFIG_HID_TMINIT and the file hid-tminit.c was
> actually added as hid-thrustmaster.c.
>
> So, clean up Makefile and adapt quirks to that refactoring.
>
> Fixes: c49c33637802 ("HID: support for initialization of some Thrustmaster wheels")
> Link: https://lore.kernel.org/linux-input/CAKXUXMx6dByO03f3dX0X5zjvQp0j2AhJBg0vQFDmhZUhtKxRxw@mail.gmail.com/
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---
> Dario, Kim, please review, test and ack.
> Jiri, Benjamin, please pick this quick fix-up patch.
>
>  drivers/hid/Makefile     | 1 -
>  drivers/hid/hid-quirks.c | 2 --
>  2 files changed, 3 deletions(-)
>
> diff --git a/drivers/hid/Makefile b/drivers/hid/Makefile
> index 1ea1a7c0b20f..e29efcb1c040 100644
> --- a/drivers/hid/Makefile
> +++ b/drivers/hid/Makefile
> @@ -115,7 +115,6 @@ obj-$(CONFIG_HID_STEELSERIES)       += hid-steelseries.o
>  obj-$(CONFIG_HID_SUNPLUS)      += hid-sunplus.o
>  obj-$(CONFIG_HID_GREENASIA)    += hid-gaff.o
>  obj-$(CONFIG_HID_THRUSTMASTER) += hid-tmff.o hid-thrustmaster.o
> -obj-$(CONFIG_HID_TMINIT)       += hid-tminit.o
>  obj-$(CONFIG_HID_TIVO)         += hid-tivo.o
>  obj-$(CONFIG_HID_TOPSEED)      += hid-topseed.o
>  obj-$(CONFIG_HID_TWINHAN)      += hid-twinhan.o
> diff --git a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
> index 51b39bda9a9d..2e104682c22b 100644
> --- a/drivers/hid/hid-quirks.c
> +++ b/drivers/hid/hid-quirks.c
> @@ -662,8 +662,6 @@ static const struct hid_device_id hid_have_special_driver[] = {
>         { HID_USB_DEVICE(USB_VENDOR_ID_THRUSTMASTER, 0xb653) },
>         { HID_USB_DEVICE(USB_VENDOR_ID_THRUSTMASTER, 0xb654) },
>         { HID_USB_DEVICE(USB_VENDOR_ID_THRUSTMASTER, 0xb65a) },
> -#endif
> -#if IS_ENABLED(CONFIG_HID_TMINIT)
>         { HID_USB_DEVICE(USB_VENDOR_ID_THRUSTMASTER, 0xb65d) },
>  #endif
>  #if IS_ENABLED(CONFIG_HID_TIVO)
> --
> 2.17.1
>
