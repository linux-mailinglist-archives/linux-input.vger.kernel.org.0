Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6162DDC7DB
	for <lists+linux-input@lfdr.de>; Fri, 18 Oct 2019 16:54:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2634233AbfJROyZ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 18 Oct 2019 10:54:25 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39590 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2634260AbfJROyZ (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 18 Oct 2019 10:54:25 -0400
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 56CB44E925
        for <linux-input@vger.kernel.org>; Fri, 18 Oct 2019 14:54:24 +0000 (UTC)
Received: by mail-qt1-f199.google.com with SMTP id h10so6113438qtq.11
        for <linux-input@vger.kernel.org>; Fri, 18 Oct 2019 07:54:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qcaI7zIpK9SuPKQNV9gKeRsG/9O1qHYAgHXML14no4g=;
        b=EgKWDoDGwXG/+7gFNVH2oJEJy7aFuXnHBxAzeXfxTU+H9FWUG01HGk5iZulKKMLiwc
         Jj6GczBaDMm4hk7J7t0Ls7bMaHAlRY1EulgZswze8rKaQh4WiBLNYMOMTuWjkwlSzBw7
         6hBtajUrM0NBZ/dICMsGStzGqlE3rviEaajjM0XJFG4II0kbUbw0VqbKUbPGDl9n4wpD
         vD4YpmOx8B5wnW+zrotkwj9qg9nKQOL/UovzHWRRnGHOHMFbCg0Q8fBWCYEgoD+h5sP8
         1KkUNQcs4jsyTU37TOYBoEklhi1B8nrQcQFiMnZcKeXA659DodbslVMOrr1xkr4LZ/lL
         B3rg==
X-Gm-Message-State: APjAAAW7F8GYSNTMtQdXZu3KvcsVIWPw/Jg5PPSFwxhzFGEv3VXeoTIg
        9S0qAWwosbEWsKlQH7KaYuQXp13K9VYCQ7hBx03EwGohEtFZR75H2fYFmttQNm18Aulu11J/0GB
        z4oVSfLlnPYjSjPKfubL/NQwmkwoVZSUWWa7PLjY=
X-Received: by 2002:ac8:550d:: with SMTP id j13mr7513027qtq.260.1571410463638;
        Fri, 18 Oct 2019 07:54:23 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy3ELLoeoYcLXuRgtoXts+oXqWSLPdN2EXhotCIFdfniMF+ZbWjpVl3dXCWV80Dea2w0Fe54Xcz4dDyaDb+co8=
X-Received: by 2002:ac8:550d:: with SMTP id j13mr7513016qtq.260.1571410463450;
 Fri, 18 Oct 2019 07:54:23 -0700 (PDT)
MIME-Version: 1.0
References: <20191007185626.247959-1-hdegoede@redhat.com>
In-Reply-To: <20191007185626.247959-1-hdegoede@redhat.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Fri, 18 Oct 2019 16:54:12 +0200
Message-ID: <CAO-hwJLeSLQSyi7yV1ch4vXOSfL-SS9-3iZf0fzP-EhNW=Qf8A@mail.gmail.com>
Subject: Re: [PATCH] HID: i2c-hid: add Trekstor Primebook C11B to descriptor override
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        "3.8+" <stable@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Oct 7, 2019 at 8:56 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> The Primebook C11B uses the SIPODEV SP1064 touchpad. There are 2 versions
> of this 2-in-1 and the touchpad in the older version does not supply
> descriptors, so it has to be added to the override list.
>
> Cc: stable@vger.kernel.org
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---

Thanks!

Applied to for-5.4/upstream-fixes

Cheers,
Benjamin

>  drivers/hid/i2c-hid/i2c-hid-dmi-quirks.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>
> diff --git a/drivers/hid/i2c-hid/i2c-hid-dmi-quirks.c b/drivers/hid/i2c-hid/i2c-hid-dmi-quirks.c
> index 75078c83be1a..d31ea82b84c1 100644
> --- a/drivers/hid/i2c-hid/i2c-hid-dmi-quirks.c
> +++ b/drivers/hid/i2c-hid/i2c-hid-dmi-quirks.c
> @@ -322,6 +322,25 @@ static const struct dmi_system_id i2c_hid_dmi_desc_override_table[] = {
>                 },
>                 .driver_data = (void *)&sipodev_desc
>         },
> +       {
> +               /*
> +                * There are at least 2 Primebook C11B versions, the older
> +                * version has a product-name of "Primebook C11B", and a
> +                * bios version / release / firmware revision of:
> +                * V2.1.2 / 05/03/2018 / 18.2
> +                * The new version has "PRIMEBOOK C11B" as product-name and a
> +                * bios version / release / firmware revision of:
> +                * CFALKSW05_BIOS_V1.1.2 / 11/19/2018 / 19.2
> +                * Only the older version needs this quirk, note the newer
> +                * version will not match as it has a different product-name.
> +                */
> +               .ident = "Trekstor Primebook C11B",
> +               .matches = {
> +                       DMI_EXACT_MATCH(DMI_SYS_VENDOR, "TREKSTOR"),
> +                       DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Primebook C11B"),
> +               },
> +               .driver_data = (void *)&sipodev_desc
> +       },
>         {
>                 .ident = "Direkt-Tek DTLAPY116-2",
>                 .matches = {
> --
> 2.23.0
>
