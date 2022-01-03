Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 95468483424
	for <lists+linux-input@lfdr.de>; Mon,  3 Jan 2022 16:27:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230047AbiACP1H (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 3 Jan 2022 10:27:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38773 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231924AbiACP1H (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 3 Jan 2022 10:27:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1641223625;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=81dEUm3a0RnJb4874GfsOWAt3DIyhBnCB5DG7dDqSpA=;
        b=hG1O4HanUn1SEOLfncJO3OEZ6a/BsPsgSM+HzOoBf5fMBX3ZrfhOPLfluBY27jwMsBjAta
        y2MtlIITgG5pOgV/s9BwgFMET/iTOVcFQznSl3UZWO5HQ+qa+8U0UOjAloijyOfovBhaaf
        r08bSuCd9f79WE42ZIwnTGH8e00dGLs=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-356-ckMGJ2lWMWazfzrjKKDhnw-1; Mon, 03 Jan 2022 10:27:04 -0500
X-MC-Unique: ckMGJ2lWMWazfzrjKKDhnw-1
Received: by mail-pf1-f197.google.com with SMTP id h9-20020a628309000000b004ba70782342so16830664pfe.20
        for <linux-input@vger.kernel.org>; Mon, 03 Jan 2022 07:27:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=81dEUm3a0RnJb4874GfsOWAt3DIyhBnCB5DG7dDqSpA=;
        b=fT82FstJkx5Xiqag36Zpr5A91qXi1JNMy1RcZrjz5bmRBRm46KNK9rkoVcHLxK+Yw6
         4lDughBb1t2asMsVd9DUTtEBmAGntm+uAu3os8/eQvRt7OybyBFub0h7S5KflZzlYO+R
         3RzXaKalfQjEqEyM7rzDyX+jB2e6+8ETzI+U8B9sEly0r8w3TWC00n5+yV0H7qTugzU/
         8mi4sKH9SBXVjRtvxIfrVLj7+/hSWDrzaanhfuLshjdNQS7y2Id0ARGZHX7Yawl+kU6R
         KnTXLqCLYfnXN6oFRVoWVWv+oGWQqLoUh5ishptF024JBSqNzQ7f73vGRcy5XvaJtYMZ
         E1GA==
X-Gm-Message-State: AOAM5338Ia2w8HLx7p3xSuFv1E6axv5XK6oQMcDMAwy+takX9eHGsWqk
        FBnjXo+3T1vuQcMwPuWPZLfqL9L9O7aJBnAr2TsJMfJ3gs8Uy+QO88KFkBZGwkzKAZoa5AgGROw
        ksiDPw7CsoDvZJEVnvPbNQGO5aCqNUF0HMh79TYM=
X-Received: by 2002:a17:902:b197:b0:149:91bd:c359 with SMTP id s23-20020a170902b19700b0014991bdc359mr26743620plr.67.1641223623790;
        Mon, 03 Jan 2022 07:27:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyuZCTRHWoTREt8tUDphVI48ddFwsIuIW4gwFQHNasv+dzkJzcDMdh0MH5yrdE0qVFQUhdp0qwB9eKp6TWs+1c=
X-Received: by 2002:a17:902:b197:b0:149:91bd:c359 with SMTP id
 s23-20020a170902b19700b0014991bdc359mr26743605plr.67.1641223623530; Mon, 03
 Jan 2022 07:27:03 -0800 (PST)
MIME-Version: 1.0
References: <20211229231141.303919-1-dmanti@microsoft.com> <20211229231141.303919-4-dmanti@microsoft.com>
In-Reply-To: <20211229231141.303919-4-dmanti@microsoft.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Mon, 3 Jan 2022 16:26:52 +0100
Message-ID: <CAO-hwJ+Y28ZzXX--8aWAAc33UdmsjUyRxpkcQKAymNkZAn5oEA@mail.gmail.com>
Subject: Re: [PATCH v1 3/5] HID: add on_transport_error() field to struct hid_driver
To:     Dmitry Antipov <daantipov@gmail.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Felipe Balbi <balbi@kernel.org>,
        Dmitry Antipov <dmanti@microsoft.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Dec 30, 2021 at 12:11 AM Dmitry Antipov <daantipov@gmail.com> wrote:
>
> This new API allows a transport driver to notify the HID device driver
> about a transport layer error.

I do not see entirely the purpose of this new callback:

- when we receive the device initiated reset, this is a specific
device event, so it would make sense...
- but for things like HID_TRANSPORT_ERROR_TYPE_BUS_OUTPUT_TRANSFER, I
would expect the caller to return that error code instead of having an
async function called.

I think it might be simpler to add a more specific
.device_initiated_reset() callback instead of trying to be generic.

>
> Signed-off-by: Dmitry Antipov <dmanti@microsoft.com>
> ---
>  include/linux/hid.h | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>
> diff --git a/include/linux/hid.h b/include/linux/hid.h
> index 1f134c8f8972..97041c322a0f 100644
> --- a/include/linux/hid.h
> +++ b/include/linux/hid.h
> @@ -703,6 +703,20 @@ struct hid_usage_id {
>         __u32 usage_code;
>  };
>
> +enum hid_transport_error_type {
> +       HID_TRANSPORT_ERROR_TYPE_BUS_INPUT_TRANSFER_START = 0,
> +       HID_TRANSPORT_ERROR_TYPE_BUS_INPUT_TRANSFER_BODY,
> +       HID_TRANSPORT_ERROR_TYPE_BUS_INPUT_TRANSFER_HEADER,

Those 3 enums above are completely SPI specifics, but they are
declared in the generic hid.h header.
Also, if I am a driver, what am I supposed to do when I receive such an error?
Up till now, the most we did was to raise a warning to the user, and
paper over it. I am open to some smarter behavior, but I do not see
what a mouse driver is supposed to do with that kind of error.

> +       HID_TRANSPORT_ERROR_TYPE_BUS_OUTPUT_TRANSFER,

Seems like this would better handled as a return code than an async callback

> +       HID_TRANSPORT_ERROR_TYPE_DEVICE_INITIATED_RESET,

OK for this (but see my comment in the commit description)

> +       HID_TRANSPORT_ERROR_TYPE_HEADER_DATA,
> +       HID_TRANSPORT_ERROR_TYPE_INPUT_REPORT_DATA,
> +       HID_TRANSPORT_ERROR_TYPE_REPORT_TYPE,

Those look like SPI specifics

> +       HID_TRANSPORT_ERROR_TYPE_GET_FEATURE_RESPONSE,

Seems like this would be better handled as a return code than an async
callback (and it should already be the case because
hid_ll_raw_request() is synchronous and can fail if the HW complains).

> +       HID_TRANSPORT_ERROR_TYPE_REGULATOR_ENABLE,
> +       HID_TRANSPORT_ERROR_TYPE_REGULATOR_DISABLE

Again, what am I supposed to do with those 2 if they fail, besides
emitting a dev_err(), which the low level transport driver can do?


Cheers,
Benjamin

> +};
> +
>  /**
>   * struct hid_driver
>   * @name: driver name (e.g. "Footech_bar-wheel")
> @@ -726,6 +740,7 @@ struct hid_usage_id {
>   * @suspend: invoked on suspend (NULL means nop)
>   * @resume: invoked on resume if device was not reset (NULL means nop)
>   * @reset_resume: invoked on resume if device was reset (NULL means nop)
> + * @on_transport_error: invoked on error hit by transport driver
>   *
>   * probe should return -errno on error, or 0 on success. During probe,
>   * input will not be passed to raw_event unless hid_device_io_start is
> @@ -777,6 +792,10 @@ struct hid_driver {
>         void (*feature_mapping)(struct hid_device *hdev,
>                         struct hid_field *field,
>                         struct hid_usage *usage);
> +       void (*on_transport_error)(struct hid_device *hdev,
> +                       int err_type,
> +                       int err_code,
> +                       bool handled);
>  #ifdef CONFIG_PM
>         int (*suspend)(struct hid_device *hdev, pm_message_t message);
>         int (*resume)(struct hid_device *hdev);
> --
> 2.25.1
>

