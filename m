Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4C15617581C
	for <lists+linux-input@lfdr.de>; Mon,  2 Mar 2020 11:16:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727060AbgCBKQo (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 2 Mar 2020 05:16:44 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:50822 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726889AbgCBKQo (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 2 Mar 2020 05:16:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1583144203;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=IXo+jOnMJnVg0BdBfAq0eKhEwbhNb8AEFiily5Isa3s=;
        b=Lz48/6MrklQ1TgrAYgUnMvL5H84FnwqamDiw5QpMRvpI+KhLtT1OYWTXsdQKZb4YrC553c
        pjGPssl6LbEcGWewxswEoLeP2tbCoQn2oasM5FaaNaSExMpoWniYULBixvqkNzdj+wCSl+
        W1q7crQ1fFotjylPUNKyInhDV5VEHTs=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-150-T9deRxbiNvWbtVUNCymq5g-1; Mon, 02 Mar 2020 05:16:41 -0500
X-MC-Unique: T9deRxbiNvWbtVUNCymq5g-1
Received: by mail-qk1-f198.google.com with SMTP id 206so8450167qkd.21
        for <linux-input@vger.kernel.org>; Mon, 02 Mar 2020 02:16:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IXo+jOnMJnVg0BdBfAq0eKhEwbhNb8AEFiily5Isa3s=;
        b=kY4fU3jmhv+zfLbeaxd2nrpWdr0oxPnrdLNiVbdBoJSwM1N/t3fTccvphdb3cqvs+r
         j9rpIsx9SVqUTiA8mpDtsQGb9Hru+1+xxWxDYm0qiaxPIAwMrDfyClFIXGZlu7XaJmK1
         r4NhbBrhuPc4AXXjqwFwI7Gs7Z+4GF6pyQ35RaY00cEfijw27Ba/fIzQOPu9A8pn/PjD
         tCjbs9Ux/SorFFgmpE+NAiQdRQz4RmxyZnptkVPZjUAZKZWwG0mW7W8b82BhQm6UTDis
         EZ8mT3STu7lnEAJKWRpZQBUWC5z+vFajK/zEHKBiHBktwdWUhJ96nZNKbdLOjTJXIIdp
         Jbhw==
X-Gm-Message-State: ANhLgQ0VdKOp+YXT4j1bQQ8aUzqbT4XEg3qVQeRLCqWGahN7j9IPe9ml
        Vd0GfifZw4F1p8RczhbzM8mxQHMwgjZE+BODGYcvsFSBAwypZaXsWHeaczCImUHelhcuMuU5+Xp
        js1M/PFpm3QHMaxGjyKN4LL1GLyr+pNQ4gaOtHZY=
X-Received: by 2002:a05:620a:1517:: with SMTP id i23mr7903641qkk.459.1583144201401;
        Mon, 02 Mar 2020 02:16:41 -0800 (PST)
X-Google-Smtp-Source: ADFU+vvciVC+XX0L/bTNhtxk+6Nmcqb4gcKNRf+REB1cVh+9NmujV8iEZpeEbQ7bkpaxLzOlPc2RTSKI9C/8YAO1yK4=
X-Received: by 2002:a05:620a:1517:: with SMTP id i23mr7903622qkk.459.1583144201197;
 Mon, 02 Mar 2020 02:16:41 -0800 (PST)
MIME-Version: 1.0
References: <20200229173007.61838-1-tanure@linux.com>
In-Reply-To: <20200229173007.61838-1-tanure@linux.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Mon, 2 Mar 2020 11:16:30 +0100
Message-ID: <CAO-hwJJDv=LnOQDbgWwg2sOccM9Tt-h=082Coi0aYdwG-CG-Kg@mail.gmail.com>
Subject: Re: [PATCH] HID: hyperv: NULL check before some freeing functions is
 not needed.
To:     Lucas Tanure <tanure@linux.com>
Cc:     "K. Y. Srinivasan" <kys@microsoft.com>,
        Haiyang Zhang <haiyangz@microsoft.com>,
        Stephen Hemminger <sthemmin@microsoft.com>,
        Sasha Levin <sashal@kernel.org>,
        Jiri Kosina <jikos@kernel.org>, linux-hyperv@vger.kernel.org,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, Feb 29, 2020 at 6:30 PM Lucas Tanure <tanure@linux.com> wrote:
>
> Fix below warnings reported by coccicheck:
> drivers/hid/hid-hyperv.c:197:2-7: WARNING: NULL check before some freeing functions is not needed.
> drivers/hid/hid-hyperv.c:211:2-7: WARNING: NULL check before some freeing functions is not needed.
>
> Signed-off-by: Lucas Tanure <tanure@linux.com>
> ---

Acked-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>

Sasha, do you prefer taking this through your tree or through the HID
one. I don't think we have much scheduled for hyperv, so it's up to
you.

Cheers,
Benjamin

>  drivers/hid/hid-hyperv.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/hid/hid-hyperv.c b/drivers/hid/hid-hyperv.c
> index dddfca555df9..0b6ee1dee625 100644
> --- a/drivers/hid/hid-hyperv.c
> +++ b/drivers/hid/hid-hyperv.c
> @@ -193,8 +193,7 @@ static void mousevsc_on_receive_device_info(struct mousevsc_dev *input_device,
>                 goto cleanup;
>
>         /* The pointer is not NULL when we resume from hibernation */
> -       if (input_device->hid_desc != NULL)
> -               kfree(input_device->hid_desc);
> +       kfree(input_device->hid_desc);
>         input_device->hid_desc = kmemdup(desc, desc->bLength, GFP_ATOMIC);
>
>         if (!input_device->hid_desc)
> @@ -207,8 +206,7 @@ static void mousevsc_on_receive_device_info(struct mousevsc_dev *input_device,
>         }
>
>         /* The pointer is not NULL when we resume from hibernation */
> -       if (input_device->report_desc != NULL)
> -               kfree(input_device->report_desc);
> +       kfree(input_device->report_desc);
>         input_device->report_desc = kzalloc(input_device->report_desc_size,
>                                           GFP_ATOMIC);
>
> --
> 2.25.1
>

