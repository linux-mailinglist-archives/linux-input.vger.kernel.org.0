Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5AD124A85FA
	for <lists+linux-input@lfdr.de>; Thu,  3 Feb 2022 15:17:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242051AbiBCOQ7 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 3 Feb 2022 09:16:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42287 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234727AbiBCOQ7 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 3 Feb 2022 09:16:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1643897818;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=9esUFsQ0EqpNJmVQV/p3LlASEe/bz2qMgKZNx2dDMYY=;
        b=FF+jsj5CnLJS3F3bC+5WUgY0Mb6CpQFS4RMfC0J3Tq5apsaVZjK+dC0xEsOwuWHze3FbFG
        3RoSIevYaJNWmop+i/XXWsr+edktLz3gEPT/sMAps8//n1+Y0Hfgayml6PZJdLAMyya6vO
        vK2H61bO+TUnJjGQ8ySxrEp87irqbQQ=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-299-ICEf06F0NzKnoszn5dL5og-1; Thu, 03 Feb 2022 09:16:57 -0500
X-MC-Unique: ICEf06F0NzKnoszn5dL5og-1
Received: by mail-pl1-f199.google.com with SMTP id a9-20020a170902710900b0014c8132e8b8so1273699pll.10
        for <linux-input@vger.kernel.org>; Thu, 03 Feb 2022 06:16:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9esUFsQ0EqpNJmVQV/p3LlASEe/bz2qMgKZNx2dDMYY=;
        b=IBsJ78DSxZhjaQjl2pNguGnyrR0LpAgzffALYugGE4kuAoKiLN0YMZ1qhjMZwA1lc3
         wB1iZqldbTBXMVmm/88NI+Q5rMaxBrYzNU7h2ixVivfpQGSEXKFALPvAslasK/T1h00V
         w2WigNLy7xkOhdFYhP8FFMNB0zHObpbyUOgsi5qdp4QEvb8LrUXQw58Kb91zHciQxKjV
         w2Eyll760/9rDMdlSZOWT5AZ5Ct5IRJY9icdL9i1XIRZ6/00e4D1EckB1KioisxK2ooJ
         bbWeqREqRp6mS68VMxECtARFZVokxAUwT3c3vNEs5nxOCRIrNW4VfeNlUt8RjRQI+OrY
         8ysA==
X-Gm-Message-State: AOAM533yxvjaCnajhTD9qo+4rjqEmgdJKhEQgSR7AgfWAXDb58qYbcnS
        g25sBXxsWnUcXcw3R+Q74SZAvxWqpDUnB+nsgzqmW+bM9NJqmI8CtQ1WtJWC/jEKCCjQc+JBHqO
        GReifIfQZ2qc3nIjO1RG4ZZvakr+P2eQCdIGUr70=
X-Received: by 2002:a63:fc0b:: with SMTP id j11mr6436190pgi.146.1643897816479;
        Thu, 03 Feb 2022 06:16:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzqw1ZFdcHPox8+/Kuak9eHhAQsDFBKmjWwyFfUHS7qWXF5R9y+Lnq3ZI1Wcn6EgGNKCoITKT+PaGnVIiUBc1A=
X-Received: by 2002:a63:fc0b:: with SMTP id j11mr6436163pgi.146.1643897816099;
 Thu, 03 Feb 2022 06:16:56 -0800 (PST)
MIME-Version: 1.0
References: <20220118072628.1617172-1-dmitry.torokhov@gmail.com> <20220118072628.1617172-3-dmitry.torokhov@gmail.com>
In-Reply-To: <20220118072628.1617172-3-dmitry.torokhov@gmail.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Thu, 3 Feb 2022 15:16:44 +0100
Message-ID: <CAO-hwJL2HKT-7n8ATO-HcY6FP5pHb2C2xgSvdbd7teL_jqL_+g@mail.gmail.com>
Subject: Re: [PATCH 02/12] HID: i2c-hid: fix GET/SET_REPORT for unnumbered reports
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Jiri Kosina <jikos@kernel.org>, Angela Czubak <acz@semihalf.com>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Jan 18, 2022 at 8:26 AM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> Internally kernel prepends all report buffers, for both numbered and
> unnumbered reports, with report ID, therefore to properly handle unnumbered
> reports we should

Nitpick but it seems that this sentence is not

:)

Cheers,
Benjamin

>
> For the same reason we should skip the first byte of the buffer when
> calling i2c_hid_set_or_send_report() which then will take care of properly
> formatting the transfer buffer based on its separate report ID argument
> along with report payload.
>
> Fixes: 9b5a9ae88573 ("HID: i2c-hid: implement ll_driver transport-layer callbacks")
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
>  drivers/hid/i2c-hid/i2c-hid-core.c | 32 ++++++++++++++++++++++--------
>  1 file changed, 24 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c b/drivers/hid/i2c-hid/i2c-hid-core.c
> index bd7b0eeca3ea..b383003ff676 100644
> --- a/drivers/hid/i2c-hid/i2c-hid-core.c
> +++ b/drivers/hid/i2c-hid/i2c-hid-core.c
> @@ -611,6 +611,17 @@ static int i2c_hid_get_raw_report(struct hid_device *hid,
>         if (report_type == HID_OUTPUT_REPORT)
>                 return -EINVAL;
>
> +       /*
> +        * In case of unnumbered reports the response from the device will
> +        * not have the report ID that the upper layers expect, so we need
> +        * to stash it the buffer ourselves and adjust the data size.
> +        */
> +       if (!report_number) {
> +               buf[0] = 0;
> +               buf++;
> +               count--;
> +       }
> +
>         /* +2 bytes to include the size of the reply in the query buffer */
>         ask_count = min(count + 2, (size_t)ihid->bufsize);
>
> @@ -632,6 +643,9 @@ static int i2c_hid_get_raw_report(struct hid_device *hid,
>         count = min(count, ret_count - 2);
>         memcpy(buf, ihid->rawbuf + 2, count);
>
> +       if (!report_number)
> +               count++;
> +
>         return count;
>  }
>
> @@ -648,17 +662,19 @@ static int i2c_hid_output_raw_report(struct hid_device *hid, __u8 *buf,
>
>         mutex_lock(&ihid->reset_lock);
>
> -       if (report_id) {
> -               buf++;
> -               count--;
> -       }
> -
> +       /*
> +        * Note that both numbered and unnumbered reports passed here
> +        * are supposed to have report ID stored in the 1st byte of the
> +        * buffer, so we strip it off unconditionally before passing payload
> +        * to i2c_hid_set_or_send_report which takes care of encoding
> +        * everything properly.
> +        */
>         ret = i2c_hid_set_or_send_report(client,
>                                 report_type == HID_FEATURE_REPORT ? 0x03 : 0x02,
> -                               report_id, buf, count, use_data);
> +                               report_id, buf + 1, count - 1, use_data);
>
> -       if (report_id && ret >= 0)
> -               ret++; /* add report_id to the number of transfered bytes */
> +       if (ret >= 0)
> +               ret++; /* add report_id to the number of transferred bytes */
>
>         mutex_unlock(&ihid->reset_lock);
>
> --
> 2.34.1.703.g22d0c6ccf7-goog
>

