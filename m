Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 59F1046736C
	for <lists+linux-input@lfdr.de>; Fri,  3 Dec 2021 09:44:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241471AbhLCIr2 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 3 Dec 2021 03:47:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43982 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1351255AbhLCIr1 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 3 Dec 2021 03:47:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1638521044;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=kQKC62SiyzMUIq2WlzVXmQSdeSvq0x+hSWpP/aWVWeA=;
        b=durAeIJNOl2e4B6wajhnooq2DaIQGIRyeFbKt3/eVNOpysVlQpVW2pwq+lhaPUWIvSAV7Y
        Wg9ie/45SIrbGmnTBt0fqaA70GE/pGv6HMd0cxSStM13g3z6BIk0juZc2gMLxWKfUUbeiJ
        QaPtqfB2/ne2o+dbDU+GI3FadvQ7oIU=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-221-XVA01xm8NqqQ4aRNhNT8Jw-1; Fri, 03 Dec 2021 03:44:02 -0500
X-MC-Unique: XVA01xm8NqqQ4aRNhNT8Jw-1
Received: by mail-pg1-f198.google.com with SMTP id 66-20020a630545000000b0032e4e898d24so1497753pgf.10
        for <linux-input@vger.kernel.org>; Fri, 03 Dec 2021 00:44:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kQKC62SiyzMUIq2WlzVXmQSdeSvq0x+hSWpP/aWVWeA=;
        b=Q7VSlT4fOh5HF6ELePxFtiGwARWv/KZBlE2uLyFQUHJ89PQPk2wCqnisI+BZG9fN+9
         pHf3caRuaFHq0dLq6iGiEDI1hVIpkJRbx1zz2oePrHJS1H/LLn/yjIt3mymTiYRckwY1
         ewv75efoQ7aHFeZR1Gf6NJS8NHoqAqobtYwwsCI5hs5/Ee4nHbfhsSL//W6KjXWRn2I/
         lxOOmpv6amPBfzt/MpHI37WpSHiLeX/kcz8EmS8ab8NQjMWdk/ydAxHFLEjqXedZgG9G
         1nCm/1AFzIRsxWqwjVPi1kIOOqTbIkuYl95GlV5G9ITuwE6JCcw3o8d49OZg9EibGZ10
         IQ0Q==
X-Gm-Message-State: AOAM532n/Lx6HrbOG7iioZOAuzCz2u+GRwPGdrOU67rG+cjF4MA7+R+d
        nPtD1bf8hB4iiaveX3OfJwIHnyElbBvEsaQlNixME6bJPgHjqjqqitlM2SzZ7sBY2TozUjkua59
        nxMrmta7WoAM0U1K4kt85Z5ppjl1ysP8t9wYDyVw=
X-Received: by 2002:a05:6a00:99e:b0:49f:f9e2:c116 with SMTP id u30-20020a056a00099e00b0049ff9e2c116mr17721044pfg.83.1638521041079;
        Fri, 03 Dec 2021 00:44:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxecVl2k4PpYVvCuSH5phQsI5QK8m/JUDUk7MIrh/zpKD0D5HNH8uC3RwWMAW6j3xcfjrGBNQ57pZ6KsZpB5TQ=
X-Received: by 2002:a05:6a00:99e:b0:49f:f9e2:c116 with SMTP id
 u30-20020a056a00099e00b0049ff9e2c116mr17721016pfg.83.1638521040718; Fri, 03
 Dec 2021 00:44:00 -0800 (PST)
MIME-Version: 1.0
References: <20211203075927.2829218-1-gregkh@linuxfoundation.org>
In-Reply-To: <20211203075927.2829218-1-gregkh@linuxfoundation.org>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Fri, 3 Dec 2021 09:43:49 +0100
Message-ID: <CAO-hwJK+ui4W0bSQMRdttghDbrG+LQ2FXpCy0LpBPb3hkCZsew@mail.gmail.com>
Subject: Re: [PATCH] HID: add USB_HID dependancy to hid-chicony
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Jiri Kosina <jikos@kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Dec 3, 2021 at 8:59 AM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> The chicony HID driver only controls USB devices, yet did not have a
> dependancy on USB_HID.  This causes build errors on some configurations
> like sparc when building due to new changes to the chicony driver.
>
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Cc: Jiri Kosina <jikos@kernel.org>
> Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Applied to for-5.16/upstream-fixes in hid.git

thanks

Cheers,
Benjamin

> ---
>  drivers/hid/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
> index 828c2995ec34..e9bc8efed5a1 100644
> --- a/drivers/hid/Kconfig
> +++ b/drivers/hid/Kconfig
> @@ -207,7 +207,7 @@ config HID_CHERRY
>
>  config HID_CHICONY
>         tristate "Chicony devices"
> -       depends on HID
> +       depends on USB_HID
>         default !EXPERT
>         help
>         Support for Chicony Tactical pad and special keys on Chicony keyboards.
> --
> 2.34.1
>

