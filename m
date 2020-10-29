Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 106CB29F64F
	for <lists+linux-input@lfdr.de>; Thu, 29 Oct 2020 21:41:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726774AbgJ2Uk5 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 29 Oct 2020 16:40:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726433AbgJ2Uj6 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 29 Oct 2020 16:39:58 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 701A7C0613D4;
        Thu, 29 Oct 2020 13:39:58 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id r3so1876506plo.1;
        Thu, 29 Oct 2020 13:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Qza0cPoNkKkGQyNWtuK+CRDxX+8zfCFrUl9etKIHHv4=;
        b=SJMb3ATUoiI76sq3Zy1US2nzEasMzhlVTPZ9rNONeQEcgcF/6VMzPZDsc6VDzvxmnC
         6d82XowrSd1Pdj5ElR6bqoUqi1800qw9/TNJXV71ESXzEsXjTrHw6ZELGyYJtMKkczin
         kfYXa1Tk+5oq2ljLj2WouZPe2f08l7oAIoZxIWj+r0QRfBxaR17YololMzNEbbQmJto9
         1xLX1AaXdf1wk5ZuhVDTFXa2iNLcfbN2+58V1b2IgbYro6NZBWxZuVwi7zzxWw7Y0yl1
         PbFywyHEtDjoUXN+ey4NUilweBFbdG9D6JLY6USnDbvrNWmgkYTc4lA5V1jhIsoLvHra
         1Yig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Qza0cPoNkKkGQyNWtuK+CRDxX+8zfCFrUl9etKIHHv4=;
        b=q2Z3x5QfjXjKg0PmWHji1HrRav+4N3U7oBFa9F5H6bWO6rBz/Tl+nSDDI0uYvp19/J
         BgPsunTo5zYcN+JNd/qbXH/xMSv7k9L+82BPfZmtBu9Eq2ZOnQ9835gZZDHWVTj8u7YS
         ysnemYZ3ITRVyRxsnvHq7SADq28YiC+2Nb9mQLOD2jj6TeSnG/socJEfH3aOXlFxedsb
         ML4+UiCMThxezJ9LgF/Hl6/FTehg90KV9huHevaG9RJyVWwxvn5Qw3rtSZEVQ1Bibcwx
         aBKa644wJOzY8JHlnoKhhknaFc1ztQ90bn9UQxigS01PrByPk0o9S3fRI2wVIbx+HlfN
         qHqw==
X-Gm-Message-State: AOAM531eLl5Dz2XxPvBuRrXhWxmBHpYN2Sm5cp0+i3GkFd3k+0fl3UQX
        xsRi8tFxo2y5gcbwBwNzPHev1HCK1Jc=
X-Google-Smtp-Source: ABdhPJxYIEtXQdGMdYp+f8yo8kRJh7jEYbAdYl+H++5HYN1V6wdkSks41W3ywvsDv2ZjtPQmgwsfQw==
X-Received: by 2002:a17:902:6bc7:b029:d5:f149:f2e0 with SMTP id m7-20020a1709026bc7b02900d5f149f2e0mr5670400plt.34.1604003997946;
        Thu, 29 Oct 2020 13:39:57 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id nk13sm686537pjb.1.2020.10.29.13.39.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2020 13:39:57 -0700 (PDT)
Date:   Thu, 29 Oct 2020 13:39:54 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Chris Ye <lzye@google.com>
Cc:     Alexandru Ardelean <alexandru.ardelean@analog.com>,
        Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
        trivial@kernel.org, linux-input@vger.kernel.org,
        linzhao.ye@gmail.com
Subject: Re: [PATCH] Add devices for HID_QUIRK_INCREMENT_USAGE_ON_DUPLICATE
Message-ID: <20201029203954.GF2547185@dtor-ws>
References: <20201029194714.1613308-1-lzye@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201029194714.1613308-1-lzye@google.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Chris,

On Thu, Oct 29, 2020 at 12:47:14PM -0700, Chris Ye wrote:
> Kernel 5.4 introduces HID_QUIRK_INCREMENT_USAGE_ON_DUPLICATE, devices
> need to be set explicitly with this flag.
> 
> Signed-off-by: Chris Ye <lzye@google.com>

The format of the patches looks good now, but you want to make sure you
send your patches to the right folks:

dtor@dtor-ws:~/kernel/work $ ./scripts/get_maintainer.pl drivers/hid/hid-ids.h
Jiri Kosina <jikos@kernel.org> (maintainer:HID CORE LAYER)
Benjamin Tissoires <benjamin.tissoires@redhat.com> (maintainer:HID CORE LAYER)
linux-input@vger.kernel.org (open list:HID CORE LAYER)
linux-kernel@vger.kernel.org (open list)

Thanks.

> ---
>  drivers/hid/hid-ids.h    | 4 ++++
>  drivers/hid/hid-quirks.c | 4 ++++
>  2 files changed, 8 insertions(+)
> 
> diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
> index 74be76e848bf..cf55dca494f3 100644
> --- a/drivers/hid/hid-ids.h
> +++ b/drivers/hid/hid-ids.h
> @@ -449,6 +449,10 @@
>  #define USB_VENDOR_ID_FRUCTEL	0x25B6
>  #define USB_DEVICE_ID_GAMETEL_MT_MODE	0x0002
>  
> +#define USB_VENDOR_ID_GAMEVICE	0x27F8
> +#define USB_DEVICE_ID_GAMEVICE_GV186	0x0BBE
> +#define USB_DEVICE_ID_GAMEVICE_KISHI	0x0BBF
> +
>  #define USB_VENDOR_ID_GAMERON		0x0810
>  #define USB_DEVICE_ID_GAMERON_DUAL_PSX_ADAPTOR	0x0001
>  #define USB_DEVICE_ID_GAMERON_DUAL_PCS_ADAPTOR	0x0002
> diff --git a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
> index 0440e2f6e8a3..36d94e3485e3 100644
> --- a/drivers/hid/hid-quirks.c
> +++ b/drivers/hid/hid-quirks.c
> @@ -84,6 +84,10 @@ static const struct hid_device_id hid_quirks[] = {
>  	{ HID_USB_DEVICE(USB_VENDOR_ID_FREESCALE, USB_DEVICE_ID_FREESCALE_MX28), HID_QUIRK_NOGET },
>  	{ HID_USB_DEVICE(USB_VENDOR_ID_FUTABA, USB_DEVICE_ID_LED_DISPLAY), HID_QUIRK_NO_INIT_REPORTS },
>  	{ HID_USB_DEVICE(USB_VENDOR_ID_GREENASIA, USB_DEVICE_ID_GREENASIA_DUAL_USB_JOYPAD), HID_QUIRK_MULTI_INPUT },
> +	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_GAMEVICE, USB_DEVICE_ID_GAMEVICE_GV186),
> +		HID_QUIRK_INCREMENT_USAGE_ON_DUPLICATE },
> +	{ HID_USB_DEVICE(USB_VENDOR_ID_GAMEVICE, USB_DEVICE_ID_GAMEVICE_KISHI),
> +		HID_QUIRK_INCREMENT_USAGE_ON_DUPLICATE },
>  	{ HID_USB_DEVICE(USB_VENDOR_ID_HAPP, USB_DEVICE_ID_UGCI_DRIVING), HID_QUIRK_BADPAD | HID_QUIRK_MULTI_INPUT },
>  	{ HID_USB_DEVICE(USB_VENDOR_ID_HAPP, USB_DEVICE_ID_UGCI_FIGHTING), HID_QUIRK_BADPAD | HID_QUIRK_MULTI_INPUT },
>  	{ HID_USB_DEVICE(USB_VENDOR_ID_HAPP, USB_DEVICE_ID_UGCI_FLYING), HID_QUIRK_BADPAD | HID_QUIRK_MULTI_INPUT },
> -- 
> 2.29.1.341.ge80a0c044ae-goog
> 

-- 
Dmitry
