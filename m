Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 286FF48340F
	for <lists+linux-input@lfdr.de>; Mon,  3 Jan 2022 16:18:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233684AbiACPSu (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 3 Jan 2022 10:18:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53396 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229995AbiACPSu (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 3 Jan 2022 10:18:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1641223129;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=gqwTf8jzNjYud0eMSNGyqfiD9ig8Pw+4DLbAFlQik+0=;
        b=SQifXGH7lh3JwidA1NHsrD2WMki50iO63wHNcuKCfNwztWw7RDI1R+rd++IZDcyONqQgo0
        QjeEg+nbj4EXdff/FxfHY0oCnMAP6S+z8fqBz5JULYeVc7o4KB8pzua+bwCABhZytuW508
        UN0L5vPt5JiHvrpDJt/N78I+T6Q9794=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-125-5Wg2UY-uMHe6AzFDQvlFag-1; Mon, 03 Jan 2022 10:18:48 -0500
X-MC-Unique: 5Wg2UY-uMHe6AzFDQvlFag-1
Received: by mail-pl1-f197.google.com with SMTP id d14-20020a170903230e00b001491f21adf2so3928029plh.8
        for <linux-input@vger.kernel.org>; Mon, 03 Jan 2022 07:18:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gqwTf8jzNjYud0eMSNGyqfiD9ig8Pw+4DLbAFlQik+0=;
        b=A2h3kA04mSn4Zrzpzd6tphdVQv8D7W36j9xY4vmafibvUbhaSOggp3P7q2yKoE7qCa
         p9H7lBerJaV0Rn0U80wukoqtsmbvqIQF0+/KEMqbqQfRfaXhjvoOlVgOa/W4oYdynlFc
         Z7SOBKrdHMAWudGlsYM9bVqGNiXR4uhgf/OyBfumSRtvyUV3gZdYk4S4OG7eNHheLvJs
         6VwDnwEoKKrtmlyQJTiG82/kX7THm7X1slR7Upw5unbAhB3ob9+lp3hS32/hUVuFB5WI
         5/70rLFYCVvO1cZf556JkFuH+7zFzQJU6pwyiuk6MLnn3PbZ8ponVgkLpozrHz+WwlX9
         eOeQ==
X-Gm-Message-State: AOAM530swD4fpWtNsroBJCtjOa7WFkrnmCYjBrItSlTXxdtsrxj8b2Rj
        wgz4toRGBmIFT8LJP6MPPXef5dCnWQbBa3GmRoftwb83cJuWr552QLoFFIz6SXiE2UqFlSnINph
        wWOychHnIw2h0aDKDaGtuTwF6lzprb2moyC1NEX0=
X-Received: by 2002:a17:902:860c:b0:149:1017:25f0 with SMTP id f12-20020a170902860c00b00149101725f0mr45152298plo.116.1641223127615;
        Mon, 03 Jan 2022 07:18:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJznHuswtDG6VEuhyFyp1dpKNXaUxJXuGHqmXbA4GLeLBZJGwLLY8n/WAZY4RhLsiC86dB3Dt2aZwPtY2UTITfQ=
X-Received: by 2002:a17:902:860c:b0:149:1017:25f0 with SMTP id
 f12-20020a170902860c00b00149101725f0mr45152285plo.116.1641223127416; Mon, 03
 Jan 2022 07:18:47 -0800 (PST)
MIME-Version: 1.0
References: <20211229231141.303919-1-dmanti@microsoft.com> <20211229231141.303919-3-dmanti@microsoft.com>
In-Reply-To: <20211229231141.303919-3-dmanti@microsoft.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Mon, 3 Jan 2022 16:18:36 +0100
Message-ID: <CAO-hwJ+87+M_CqfwESm5x2PQatW_1mw-kF+N1yvdGdUim2=Q8A@mail.gmail.com>
Subject: Re: [PATCH v1 2/5] HID: define HID_SPI_DEVICE macro in hid.h
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
> Macro sets the bus field to BUS_SPI and uses arguments to set vendor
> product fields.
>
> Signed-off-by: Dmitry Antipov <dmanti@microsoft.com>
> ---

Reviewed-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>

Cheers,
Benjamin

>  include/linux/hid.h | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/include/linux/hid.h b/include/linux/hid.h
> index f453be385bd4..1f134c8f8972 100644
> --- a/include/linux/hid.h
> +++ b/include/linux/hid.h
> @@ -684,6 +684,8 @@ struct hid_descriptor {
>         .bus = BUS_BLUETOOTH, .vendor = (ven), .product = (prod)
>  #define HID_I2C_DEVICE(ven, prod)                              \
>         .bus = BUS_I2C, .vendor = (ven), .product = (prod)
> +#define HID_SPI_DEVICE(ven, prod)                              \
> +       .bus = BUS_SPI, .vendor = (ven), .product = (prod)
>
>  #define HID_REPORT_ID(rep) \
>         .report_type = (rep)
> --
> 2.25.1
>

