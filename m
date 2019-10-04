Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 21063CB920
	for <lists+linux-input@lfdr.de>; Fri,  4 Oct 2019 13:30:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725775AbfJDLap (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 4 Oct 2019 07:30:45 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41600 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727254AbfJDLan (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 4 Oct 2019 07:30:43 -0400
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id B35DD90B0A
        for <linux-input@vger.kernel.org>; Fri,  4 Oct 2019 11:30:42 +0000 (UTC)
Received: by mail-qk1-f200.google.com with SMTP id o133so6006596qke.4
        for <linux-input@vger.kernel.org>; Fri, 04 Oct 2019 04:30:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YwMS/qxpXgivNoIwaLdCz/PCQ/UTGFAe0MuGXkZY1II=;
        b=SO6G8BqTI5geQWh46YM0viq6nNPJr0oTFsaTSrtAiZqiPKOC1xz4Mgu0qxpeLdvMWW
         oybd8thCz35NqOpX77bGUzK+whI/9IdhMyT5BOnhcIkDac+2saQY9sw5rFvYb9WUM7Oy
         Qq9X0Lf+6CsmDTxwQg6tuFarh3D39p8AoFcz/+Duws09hOLiUDsdQYxk7z4dv/UUniYS
         njqZAZGhTSgPjAgOl4HpSSoiarhIlPlBXyqRJVUec+UC1QwP+xYUSzjiNHiVaBEOuFlx
         kNXdQqKJBDXNukP/BGAKNXqPI/81wvY1GKvm2536WSAxZAv5li+oj2xJYTeFh3prtLpu
         Speg==
X-Gm-Message-State: APjAAAU9jcSUF0LWSkX3kDA+uqtTU5edkF1spGKGGATaOxmROUbhaaRE
        5Vq6lUYPAwQqIFZe3pZWYfKSTQjLDFSbDvE7iG/u1yImbJ1d5+lIw0UE7VOq+aLMIQAGUMK3aCW
        QablSIMi36Ie5Iq/4tl7Tz8z5gIJrSpPIya/T7wU=
X-Received: by 2002:a37:4c4d:: with SMTP id z74mr9166765qka.459.1570188641900;
        Fri, 04 Oct 2019 04:30:41 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzWXNZ+Y5Tm4D+I14DvsyzwEj5izsH7L4rxJ2hXV91wBm52aL02c9NJx0pSs8KON4IQHLgIFJAJc9BCtIwkRuo=
X-Received: by 2002:a37:4c4d:: with SMTP id z74mr9166753qka.459.1570188641655;
 Fri, 04 Oct 2019 04:30:41 -0700 (PDT)
MIME-Version: 1.0
References: <20191004073715.6075-1-hdegoede@redhat.com>
In-Reply-To: <20191004073715.6075-1-hdegoede@redhat.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Fri, 4 Oct 2019 07:30:30 -0400
Message-ID: <CAO-hwJ+kGmQSJZTO=PHKO6kTpwV6GwkbCkCMTtYV4=LabkUTNQ@mail.gmail.com>
Subject: Re: [PATCH] HID: logitech: Add depends on LEDS_CLASS to Logitech
 Kconfig entry
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        kbuild test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Hans,

On Fri, Oct 4, 2019 at 3:37 AM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Commit 97b741aba918 ("HID: lg-g15: Add keyboard and LCD backlight control")
> makes the hid-lg15 kernel module, which gets configured through config
> HID_LOGITECH depends on symbols from the led class. Add a depends on
> LEDS_CLASS to HID_LOGITECH to avoid undefined reference errors on the
> led class symbols.
>
> Fixes: 97b741aba918 ("HID: lg-g15: Add keyboard and LCD backlight control")
> Reported-by: kbuild test robot <lkp@intel.com>
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/hid/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
> index 1ecb5124421c..494a39e74939 100644
> --- a/drivers/hid/Kconfig
> +++ b/drivers/hid/Kconfig
> @@ -525,6 +525,7 @@ config HID_LENOVO
>  config HID_LOGITECH
>         tristate "Logitech devices"
>         depends on HID
> +       depends on LEDS_CLASS

My CI failed with this patch. It seems this creates a loop in the
dependencies and I can not create the config file. Also, it seems
weird to have a depends on LEDS_CLASS when you surely wants to enable
it. How about using SELECT instead?

Cheers,
Benjamin

>         default !EXPERT
>         ---help---
>         Support for Logitech devices that are not fully compliant with HID standard.
> --
> 2.23.0
>
