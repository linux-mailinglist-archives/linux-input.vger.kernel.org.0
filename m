Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57C0D467369
	for <lists+linux-input@lfdr.de>; Fri,  3 Dec 2021 09:43:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1379286AbhLCIrM (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 3 Dec 2021 03:47:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:47025 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1351154AbhLCIrM (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 3 Dec 2021 03:47:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1638521028;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=/hpwpxBnaAPBldrHMcFLzJ3CG0I2vTzGn8SmGcK1JUo=;
        b=F3Kq3IFfeMY6AyNPoKEyyKxaU42jdXQZjVBtdCEKAQqP/WbUxbmkqXs64eOk6qqavdWn2a
        mCLR5TBKaFH2tQrAzNwz17GJN3dJUtAAQOQ7UebXK9Rg//GRQJcGoyHdaQejEUUGr9riYL
        pFnmr+UkiEUg1lF8HEAzEeEMZCmPuPQ=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-371-szis0qPUOs6PwmEBsc_JzA-1; Fri, 03 Dec 2021 03:43:47 -0500
X-MC-Unique: szis0qPUOs6PwmEBsc_JzA-1
Received: by mail-pj1-f69.google.com with SMTP id b11-20020a17090acc0b00b001a9179dc89fso3620157pju.6
        for <linux-input@vger.kernel.org>; Fri, 03 Dec 2021 00:43:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/hpwpxBnaAPBldrHMcFLzJ3CG0I2vTzGn8SmGcK1JUo=;
        b=nI0x1g+AufdIOm+8IRL4YoJh4yQ8Dm11lrF/L8hwQ0Eg+oHDFOnJ5nud/1gkz5n8Bo
         TJtOv32upQ1qGd4eOPPtsh/ThBJk3Da0FGO+hzwFOvdTuc/R0nobrQ9isChdPs5lmAVb
         zTiwV934rNTyNswCgGBkoV9CXW6g/XSNRJJrzQdWfDuq/X3M58FoHc/5uNgbFcjnxa1j
         7PY3+XASDORIAkVQM0f0kOTnvgyfUHD6eZfj60IRhe7LzbdDSqnrKrhzd9K0y4jsIjm/
         n16U2EljxClgoSXIJLYyDENfqj6swGkylCmSLqwGO5Jj2AyINFf1mm3TsPFS6+oYFrPg
         hcQw==
X-Gm-Message-State: AOAM530H0HfgPFW9Hf09vm5hPOp0ZK7oHsEsvtzCFCd1Raf5ITqVR7yt
        NJEMX7lowl+PTIPBMLN11zWfgFs1QowAnLVyhJIPoTSRfvKwGUbdv2C6ppWqQDPMmF9MYZ3Dc3d
        3NOJB6Iyxtrsjev+CAytyPYcNQMtbiI51MmWHWdU=
X-Received: by 2002:a62:e309:0:b0:4a2:e288:6203 with SMTP id g9-20020a62e309000000b004a2e2886203mr18123358pfh.13.1638521026042;
        Fri, 03 Dec 2021 00:43:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx7w688pX5Ry8VjsSaWD3UDeLbX/v4UGRtcJC8BksKM+oNeFaFNqWFzYm+Q9JYa/CUX6jEUxBa6snE0BmyplE8=
X-Received: by 2002:a62:e309:0:b0:4a2:e288:6203 with SMTP id
 g9-20020a62e309000000b004a2e2886203mr18123338pfh.13.1638521025748; Fri, 03
 Dec 2021 00:43:45 -0800 (PST)
MIME-Version: 1.0
References: <20211203081231.2856936-1-gregkh@linuxfoundation.org>
In-Reply-To: <20211203081231.2856936-1-gregkh@linuxfoundation.org>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Fri, 3 Dec 2021 09:43:34 +0100
Message-ID: <CAO-hwJ+kEOczMoD7_QomTC2xqxodVUG=t_V7Ad4vdR2N6hr9Qw@mail.gmail.com>
Subject: Re: [PATCH] HID: add USB_HID dependancy to hid-prodikeys
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Jiri Kosina <jikos@kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Dec 3, 2021 at 9:12 AM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> The prodikeys HID driver only controls USB devices, yet did not have a
> dependancy on USB_HID.  This causes build errors on some configurations
> like nios2 when building due to new changes to the prodikeys driver.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Cc: Jiri Kosina <jikos@kernel.org>
> Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---

Applied to for-5.16/upstream-fixes in hid.git

thanks

Cheers,
Benjamin

>  drivers/hid/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
> index e9bc8efed5a1..a7c78ac96270 100644
> --- a/drivers/hid/Kconfig
> +++ b/drivers/hid/Kconfig
> @@ -245,7 +245,7 @@ config HID_MACALLY
>
>  config HID_PRODIKEYS
>         tristate "Prodikeys PC-MIDI Keyboard support"
> -       depends on HID && SND
> +       depends on USB_HID && SND
>         select SND_RAWMIDI
>         help
>         Support for Prodikeys PC-MIDI Keyboard device support.
> --
> 2.34.1
>

