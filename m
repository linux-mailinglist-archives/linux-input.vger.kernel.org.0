Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A55062A8465
	for <lists+linux-input@lfdr.de>; Thu,  5 Nov 2020 18:04:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726557AbgKERE5 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 5 Nov 2020 12:04:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727275AbgKERE5 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 5 Nov 2020 12:04:57 -0500
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com [IPv6:2607:f8b0:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C4DDC0613CF;
        Thu,  5 Nov 2020 09:04:57 -0800 (PST)
Received: by mail-ot1-x344.google.com with SMTP id y22so2065599oti.10;
        Thu, 05 Nov 2020 09:04:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=dKy8k+EyJ0gbJVRGrWqDzZ2Ve4IsbZKsmDjfaa9D/kQ=;
        b=mghP5FOYbc/JbtPBWUDqFWCJPkSHbMh8hpztIY0nCMuGvXyTae7xtJ/Vsdz0DGUXRo
         QUXUymbmUbtxmDMYwudiA81WIePYEVLXh4x4eQ1XeKyoJuxZmk5a92nLp5FsexjpmPEd
         nuwIR79ngAcl2cbgWCvdoRZpx+pXdCMzcAspURkLpfU1cXnmujVSbU53WAs2Bre+e1sR
         qGQNnIpjFxfbzsagFlgU0l+Sv0DVif/zNSSsPElEWjHcdETelPYVzuuzqQZT9hcNhbFg
         tOYnrV+lgA/+1iZ9nq/cgJfObIk7czR+ow4rhSn6hWt38KZ3iBnvQKVmNqX0c7yE+yw+
         q3OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=dKy8k+EyJ0gbJVRGrWqDzZ2Ve4IsbZKsmDjfaa9D/kQ=;
        b=KWh7xey5yDdP+E4cLaHyir2FyBZfsS/An9p6ijZVl5DJd1eJU7cXJHo1hMH4SkkZAg
         GZqMoeNCGEdEAt+fN+BR/04h5ox1vt+x8oLo+u5kxzz6/WzOfxmIEKXu7phasIQuRQQ5
         WutxI92OH67pfiCQlkbtfgY5fS+ljEAYu5jL2IjyLs7925DeffPZgz/EcNU4VdlPlnJD
         pdhQ1ixbzGvPrtkoTxLyhYaZRH1eqiX/55ACpitrAda/kMmJefL/ImimE/qGlNTh2SaM
         BqeFjHt96EBbUCbtf6sN5kwAsfffnkOeTwyNpzumLsXfjz3w4SE1ca2H2uRuPxjNbS45
         EY7A==
X-Gm-Message-State: AOAM532EXee5KWHQLLalxOMEKNwe+WCYAqQ/rbKLgxRZWePPU1C5RcLq
        rtzWed9GKFAWfZ9Su/g9e8q0tlgkERniGlEK
X-Google-Smtp-Source: ABdhPJwavEsohyaD5b3MNbTPeILFWShqfg+F2nvsjT6/BectCxOJXJ36I0M8VXY0boYaox1N8BotYw==
X-Received: by 2002:a9d:17c5:: with SMTP id j63mr2494963otj.9.1604595896065;
        Thu, 05 Nov 2020 09:04:56 -0800 (PST)
Received: from ?IPv6:2600:1700:4a30:eaf0::21? ([2600:1700:4a30:eaf0::21])
        by smtp.gmail.com with ESMTPSA id x190sm487300oia.35.2020.11.05.09.04.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2020 09:04:55 -0800 (PST)
Subject: Re: [PATCH v2] Input: Add devices for
 HID_QUIRK_INCREMENT_USAGE_ON_DUPLICATE
To:     Chris Ye <lzye@google.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-kernel@vger.kernel.org, trivial@kernel.org,
        linux-input@vger.kernel.org
References: <20201101193452.678628-1-lzye@google.com>
From:   Chris Ye <linzhao.ye@gmail.com>
Message-ID: <a0e0aeca-cf37-5611-47b2-1c4bdc931950@gmail.com>
Date:   Thu, 5 Nov 2020 09:04:53 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201101193452.678628-1-lzye@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Benjamin,

     Can you review this patch?  Previously the kernel increment the HID 
usage by default,  and now in 5.4 we have to declare it explicitly 
because of this HID_QUIRK_INCREMENT_USAGE_ON_DUPLICATE. It is breaking 
existing devices functioning, including a few devices we have Android 
test with.

Thanks!

Chris

On 11/1/20 11:34 AM, Chris Ye wrote:
> Kernel 5.4 introduces HID_QUIRK_INCREMENT_USAGE_ON_DUPLICATE, devices
> need to be set explicitly with this flag.
>
> Signed-off-by: Chris Ye <lzye@google.com>
> ---
>   drivers/hid/hid-ids.h    | 4 ++++
>   drivers/hid/hid-quirks.c | 4 ++++
>   2 files changed, 8 insertions(+)
>
> diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
> index 74be76e848bf..cf55dca494f3 100644
> --- a/drivers/hid/hid-ids.h
> +++ b/drivers/hid/hid-ids.h
> @@ -449,6 +449,10 @@
>   #define USB_VENDOR_ID_FRUCTEL	0x25B6
>   #define USB_DEVICE_ID_GAMETEL_MT_MODE	0x0002
>   
> +#define USB_VENDOR_ID_GAMEVICE	0x27F8
> +#define USB_DEVICE_ID_GAMEVICE_GV186	0x0BBE
> +#define USB_DEVICE_ID_GAMEVICE_KISHI	0x0BBF
> +
>   #define USB_VENDOR_ID_GAMERON		0x0810
>   #define USB_DEVICE_ID_GAMERON_DUAL_PSX_ADAPTOR	0x0001
>   #define USB_DEVICE_ID_GAMERON_DUAL_PCS_ADAPTOR	0x0002
> diff --git a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
> index 0440e2f6e8a3..36d94e3485e3 100644
> --- a/drivers/hid/hid-quirks.c
> +++ b/drivers/hid/hid-quirks.c
> @@ -84,6 +84,10 @@ static const struct hid_device_id hid_quirks[] = {
>   	{ HID_USB_DEVICE(USB_VENDOR_ID_FREESCALE, USB_DEVICE_ID_FREESCALE_MX28), HID_QUIRK_NOGET },
>   	{ HID_USB_DEVICE(USB_VENDOR_ID_FUTABA, USB_DEVICE_ID_LED_DISPLAY), HID_QUIRK_NO_INIT_REPORTS },
>   	{ HID_USB_DEVICE(USB_VENDOR_ID_GREENASIA, USB_DEVICE_ID_GREENASIA_DUAL_USB_JOYPAD), HID_QUIRK_MULTI_INPUT },
> +	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_GAMEVICE, USB_DEVICE_ID_GAMEVICE_GV186),
> +		HID_QUIRK_INCREMENT_USAGE_ON_DUPLICATE },
> +	{ HID_USB_DEVICE(USB_VENDOR_ID_GAMEVICE, USB_DEVICE_ID_GAMEVICE_KISHI),
> +		HID_QUIRK_INCREMENT_USAGE_ON_DUPLICATE },
>   	{ HID_USB_DEVICE(USB_VENDOR_ID_HAPP, USB_DEVICE_ID_UGCI_DRIVING), HID_QUIRK_BADPAD | HID_QUIRK_MULTI_INPUT },
>   	{ HID_USB_DEVICE(USB_VENDOR_ID_HAPP, USB_DEVICE_ID_UGCI_FIGHTING), HID_QUIRK_BADPAD | HID_QUIRK_MULTI_INPUT },
>   	{ HID_USB_DEVICE(USB_VENDOR_ID_HAPP, USB_DEVICE_ID_UGCI_FLYING), HID_QUIRK_BADPAD | HID_QUIRK_MULTI_INPUT },
