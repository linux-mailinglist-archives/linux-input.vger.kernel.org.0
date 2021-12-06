Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7F974690E5
	for <lists+linux-input@lfdr.de>; Mon,  6 Dec 2021 08:45:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238537AbhLFHsj (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 6 Dec 2021 02:48:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27039 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S238503AbhLFHsi (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 6 Dec 2021 02:48:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1638776709;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=0dKb0kOkklPwAp+HaAd/9ZIxbT61a1WHxt78m0N/Py0=;
        b=CQVR7lmV51m3TW01e/hJJlZzQomLPTsBAdKIwlN4qub4DF3nW1UMrc+f4CdBfA4a7TIyvh
        Y80XxOoig4lfKAsN/mKb7zSfNd604JV54M0RTq8wTTaKmMlQT7+Qy9h7SzMsErXF9zhOQU
        5wMXAQgcugTblNzzC4ZlOu1pjDjWYZ4=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-96-eYXe9GTiOwWwltelKAxHpw-1; Mon, 06 Dec 2021 02:45:08 -0500
X-MC-Unique: eYXe9GTiOwWwltelKAxHpw-1
Received: by mail-pg1-f198.google.com with SMTP id s8-20020a63af48000000b002e6c10ac245so6202638pgo.21
        for <linux-input@vger.kernel.org>; Sun, 05 Dec 2021 23:45:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0dKb0kOkklPwAp+HaAd/9ZIxbT61a1WHxt78m0N/Py0=;
        b=D4MoFAclNt6wNXtDUqAWQD5xlny8HBO6E1nlblSFX964rHzVGiW1u+tAbLhkWKF9Vr
         xcGW+XufKzoyGpmhDl0Xkb7P/SmHe2Abxkr7Y8swvWP+DmiyjOJN7B367f16pjD0DF+h
         whO6YEDq/JDcqQh3qtvroCnojGN4XXxhvlMsi9g3K2OVEYUABws0A8UDRI0jdgXUsMLq
         vjo/98TAQdnaPiCpj7z1JPVbilnQLacrG2OSh1vRYYsxd2Yl+o8izifJFght0ajOuwiz
         gCLRfrv45x4RLKTzvRXKdRK1si8mBEg+Rv9vzpgmONPHH1gsdC1fexYO8GqDns0XU4O6
         O4OA==
X-Gm-Message-State: AOAM530lH1pXvCZMyvsQpS5QS9FGpxAF/vY9DVeC3V1Pa3XRS9x+l0dD
        I9VAUPKhhYJ8fZma+FeQMS7P3BN17bUiInRnIpamQVRimsEEI+nHPo5mjQUS8+qx5tojLIW1xOO
        zoKT/9Db+hpdxoNPKaX4O3nLQscoi9htJYJnY04A=
X-Received: by 2002:a17:90b:1648:: with SMTP id il8mr34293726pjb.246.1638776707413;
        Sun, 05 Dec 2021 23:45:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzJoSPn8ntMUaQBKWCcmnF08/27uwMa/Y6ogSQsJsFjqRB4wjHAvDr/qkY3QTQPlwpjTlXweyOmbZHTkhBa9dA=
X-Received: by 2002:a17:90b:1648:: with SMTP id il8mr34293706pjb.246.1638776707237;
 Sun, 05 Dec 2021 23:45:07 -0800 (PST)
MIME-Version: 1.0
References: <20211203185928.821497-1-arnd@kernel.org>
In-Reply-To: <20211203185928.821497-1-arnd@kernel.org>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Mon, 6 Dec 2021 08:44:56 +0100
Message-ID: <CAO-hwJLsijqibqARiWP0tPnmSDnrPsxSXDsvkgTV0=R7kQ1oOQ@mail.gmail.com>
Subject: Re: [PATCH] HID: prodikeys: add USB_HID dependency
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Jiri Kosina <jikos@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        "Daniel J. Ogorchock" <djogorchock@gmail.com>,
        =?UTF-8?B?QmFybmFiw6FzIFDFkWN6ZQ==?= <pobrn@protonmail.com>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Arnd,

On Fri, Dec 3, 2021 at 8:07 PM Arnd Bergmann <arnd@kernel.org> wrote:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> Like with the other drivers that recently got fixed, this one
> fails to link if USB_HID is disabled or unreachable:
>
> ERROR: modpost: "usb_hid_driver" [drivers/hid/hid-prodikeys.ko] undefined!
>
> Fixes: f237d9028f84 ("HID: add USB_HID dependancy on some USB HID drivers")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---

Looks like you already been beaten to it by Greg:
https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git/commit/?h=for-5.16/upstream-fixes&id=30cb3c2ad24b66fb7639a6d1f4390c74d6e68f94

But thanks!

Cheers,
Benjamin

>  drivers/hid/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
> index 74ce789f8636..48d18559670f 100644
> --- a/drivers/hid/Kconfig
> +++ b/drivers/hid/Kconfig
> @@ -246,7 +246,7 @@ config HID_MACALLY
>
>  config HID_PRODIKEYS
>         tristate "Prodikeys PC-MIDI Keyboard support"
> -       depends on HID && SND
> +       depends on USB_HID && SND
>         select SND_RAWMIDI
>         help
>         Support for Prodikeys PC-MIDI Keyboard device support.
> --
> 2.29.2
>

