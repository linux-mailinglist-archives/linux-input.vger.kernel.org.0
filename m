Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 424CC32811A
	for <lists+linux-input@lfdr.de>; Mon,  1 Mar 2021 15:40:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236373AbhCAOkJ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 1 Mar 2021 09:40:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:25075 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236109AbhCAOkE (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 1 Mar 2021 09:40:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1614609517;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=tN0JoqBuTFws3QXTxQXFTe91qQ1qRs8yOegCJEJPLIM=;
        b=aZPsh2c+87mbVgDcIE8BhbV1cyo4h8BA4FurNN18rRlsYPeDkuxcKK0dH3eN1TE7vkskS3
        +vWFrlxoz9vS5+YfuqwwnAHsnWRKkhb6j8LOVHnoio1dNeu1XExcwL0pIBzVvOP5LOOAlX
        jYrrKUxn87U2hMH/eyxGfdkwrPNG/aU=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-170-YO7D1-cnOZSCz2ThbfQx_w-1; Mon, 01 Mar 2021 09:38:36 -0500
X-MC-Unique: YO7D1-cnOZSCz2ThbfQx_w-1
Received: by mail-pj1-f72.google.com with SMTP id w2so12866236pjk.4
        for <linux-input@vger.kernel.org>; Mon, 01 Mar 2021 06:38:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tN0JoqBuTFws3QXTxQXFTe91qQ1qRs8yOegCJEJPLIM=;
        b=KvrW0F+l6Q7ytXcmJQIf7o6d2wpT/UrvtMLp4qpMFa9v661hg91ADujtGFq6rYSKyu
         5HVwfziwp4ABXqFB7QmEVnSzNKjI0qgIeR+xQbA7/zUqUq/cZP1iLLn4NDuMcQkG4Qct
         1qrTn3ZD5O3gySMtJrFfSKByGeqbZIjkjZ53WC7bMsUtU656WZxXDxxSc+4Y61uNUm8l
         Ydi8ntkyjCTpciNR/SlEO2Mi7o3ZewFlcNZ6xWBRsQOvbm+DhOSEQxj7UfbE4viL+/zz
         UIwE+NQkq6ox2PIrGGEjxfQCs4d4dhLPV5XF5RurRvWMCvffTaHmH52NZBvyFZzKGo0r
         JRDA==
X-Gm-Message-State: AOAM532N15hrpX/Je0oevFuQ7hsYknCrZ53+GTBWIDvgWXoUPrPnWATh
        jk5P8KphTxgYHY7gSuNgq8kcLB1eaG7tUC7R644OiW37AP6BVhHQTVsvy6RtA7S9+FcPqYn2Nmu
        khNjMQ3RCYsrZjOUSSjlE1xL6euhofDQW7TLIjJU=
X-Received: by 2002:a17:90a:bb0c:: with SMTP id u12mr17938872pjr.234.1614609514931;
        Mon, 01 Mar 2021 06:38:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzGK6rtQxDI96aRba38Wa782xikLN30F9jqdHgPqp09r4zd107U4ws7V5mPzZDW6ZcAO36WzP0ctzOD39uOnUY=
X-Received: by 2002:a17:90a:bb0c:: with SMTP id u12mr17938853pjr.234.1614609514768;
 Mon, 01 Mar 2021 06:38:34 -0800 (PST)
MIME-Version: 1.0
References: <20210226193225.47129-1-andriy.shevchenko@linux.intel.com> <20210226193225.47129-4-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20210226193225.47129-4-andriy.shevchenko@linux.intel.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Mon, 1 Mar 2021 15:38:23 +0100
Message-ID: <CAO-hwJLWbsj4kDkn3TKdEW0mDv6XdafQEaheCCC0Nyq3=YaOYQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] HID: i2c-hid: acpi: Drop redundant ACPI_PTR()
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jiri Kosina <jikos@kernel.org>
Cc:     Douglas Anderson <dianders@chromium.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On Fri, Feb 26, 2021 at 8:34 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> The driver depends on ACPI, ACPI_PTR() resolution is always the same.
> Otherwise a compiler may produce a warning.
>
> That said, the rule of thumb either ugly ifdeffery with ACPI_PTR or
> none should be used in a driver.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Thanks a lot for the series. This indeed cleans things up.

For the series:
Acked-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>

Jiri, I wonder where we want to land this one. This is not strictly
bug fixes, but we could definitively sneak this one in 5.12-rc1.
Well, I should probably run the series on an acpi laptop here before
merging, but I'd like to know if delaying to 5.13 is OK or if we need
this in 5.12.

Cheers,
Benjamin

> ---
> v2: no changes
>  drivers/hid/i2c-hid/i2c-hid-acpi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/hid/i2c-hid/i2c-hid-acpi.c b/drivers/hid/i2c-hid/i2c-hid-acpi.c
> index a4810f199d59..a6f0257a26de 100644
> --- a/drivers/hid/i2c-hid/i2c-hid-acpi.c
> +++ b/drivers/hid/i2c-hid/i2c-hid-acpi.c
> @@ -126,7 +126,7 @@ static struct i2c_driver i2c_hid_acpi_driver = {
>                 .name   = "i2c_hid_acpi",
>                 .pm     = &i2c_hid_core_pm,
>                 .probe_type = PROBE_PREFER_ASYNCHRONOUS,
> -               .acpi_match_table = ACPI_PTR(i2c_hid_acpi_match),
> +               .acpi_match_table = i2c_hid_acpi_match,
>         },
>
>         .probe_new      = i2c_hid_acpi_probe,
> --
> 2.30.0
>

