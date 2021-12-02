Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B6AD46689B
	for <lists+linux-input@lfdr.de>; Thu,  2 Dec 2021 17:48:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359686AbhLBQvW (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 2 Dec 2021 11:51:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20200 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1359624AbhLBQvV (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 2 Dec 2021 11:51:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1638463678;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=ykeJUEQSLS8rDie95cw3mZQtWn2NauSN5lC82eJY5xA=;
        b=UzRxD0FZKAtoKeQc7ahAdtoiRpXhECV3gVmqfQZn3eIkbjAiwRUYA6I6WhqwjSkCnDIIK0
        eWnIyT1POObaOHPVsOJti5mLC7ITl19rHJHpHCF3oAp0kIQsISV+46/iMaSKpE9/7Bk49s
        RHhwA+EX4vt1qrNuLOeuE/zZalY/H6c=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-471-cUMNDsdCMxOvkkbSdKaIew-1; Thu, 02 Dec 2021 11:47:57 -0500
X-MC-Unique: cUMNDsdCMxOvkkbSdKaIew-1
Received: by mail-pg1-f198.google.com with SMTP id m129-20020a632687000000b00324df4ad6c7so152073pgm.19
        for <linux-input@vger.kernel.org>; Thu, 02 Dec 2021 08:47:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ykeJUEQSLS8rDie95cw3mZQtWn2NauSN5lC82eJY5xA=;
        b=wY+wNs1CybhjSdKWHOrz72KTR8ttTVCm+uyPYiNcynP3IJLJLlqjoV1IRcoOGXtG7E
         A6hI9rqLlsHq9jpwLNcsw0IKgo2tHjHODuO9noZVuOC0E9LUPbVHu6iDz9uWimTijClO
         MWknBR4VphBMnWMM6fCJrgdLsKNGX6z/DH46b3lqMDMcvWUoFo7vwhvS8d9FXqraVj89
         7P6OTz9zbsT50nzEqIYNl0tl4ALhBw31OQ2SR2DK/h0TIP2Y9I2AR9dXCN7TMCNYr2U7
         x1enO27ayZK+GzTPbVuY9hwrGsM5nn8iwvyyjqBOpV2WoDhlBMCmyofF9jU6l5RazTKg
         E+aw==
X-Gm-Message-State: AOAM533DapzZ/d7UjIqL4o7pc5yNfOapjCx7GhpuCe7IPtInxCZJg1fk
        Ud4BRd4WEV/D8bCkqZrZQWxUnAscZd/rjfRQbbVJxMJ2zZtwAXXOtqeoqPK/BfwqAcRoTAaXD/9
        rlK751bI71KZ9sdO5bX7AwMfsuyhJyc7HmE6NCxs=
X-Received: by 2002:a17:902:8e87:b0:143:759c:6a2d with SMTP id bg7-20020a1709028e8700b00143759c6a2dmr16109202plb.59.1638463676189;
        Thu, 02 Dec 2021 08:47:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxwht9ink/ExlmlqPYvOtnB+nF1fANTwDkX3uod8vaV+RLom7iLxqhpl1koRSQZ/NzxRwmZCAk6/I7XNSFgAcs=
X-Received: by 2002:a17:902:8e87:b0:143:759c:6a2d with SMTP id
 bg7-20020a1709028e8700b00143759c6a2dmr16109177plb.59.1638463675960; Thu, 02
 Dec 2021 08:47:55 -0800 (PST)
MIME-Version: 1.0
References: <20211202114819.2511954-1-gregkh@linuxfoundation.org>
In-Reply-To: <20211202114819.2511954-1-gregkh@linuxfoundation.org>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Thu, 2 Dec 2021 17:47:45 +0100
Message-ID: <CAO-hwJJO2v+exB_ORoC7Y3xk8LaDBrSYPtqOnoCrZTDv=bZdzA@mail.gmail.com>
Subject: Re: [PATCH] HID: add USB_HID dependancy on some USB HID drivers
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Jiri Kosina <jikos@kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Dec 2, 2021 at 12:48 PM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> Some HID drivers are only for USB drivers, yet did not depend on
> CONFIG_USB_HID.  This was hidden by the fact that the USB functions were
> stubbed out in the past, but now that drivers are checking for USB
> devices properly, build errors can occur with some random
> configurations.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---

Now applied to hid.git branch for-5.16/upstream-fixes

Cheers,
Benjamin

>  drivers/hid/Kconfig | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
> index 9f5435b55949..828c2995ec34 100644
> --- a/drivers/hid/Kconfig
> +++ b/drivers/hid/Kconfig
> @@ -214,7 +214,7 @@ config HID_CHICONY
>
>  config HID_CORSAIR
>         tristate "Corsair devices"
> -       depends on HID && USB && LEDS_CLASS
> +       depends on USB_HID && LEDS_CLASS
>         help
>         Support for Corsair devices that are not fully compliant with the
>         HID standard.
> @@ -560,7 +560,7 @@ config HID_LENOVO
>
>  config HID_LOGITECH
>         tristate "Logitech devices"
> -       depends on HID
> +       depends on USB_HID
>         depends on LEDS_CLASS
>         default !EXPERT
>         help
> @@ -951,7 +951,7 @@ config HID_SAITEK
>
>  config HID_SAMSUNG
>         tristate "Samsung InfraRed remote control or keyboards"
> -       depends on HID
> +       depends on USB_HID
>         help
>         Support for Samsung InfraRed remote control or keyboards.
>
> --
> 2.34.1
>

