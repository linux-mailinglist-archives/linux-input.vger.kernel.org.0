Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04D4831A9D3
	for <lists+linux-input@lfdr.de>; Sat, 13 Feb 2021 05:04:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229648AbhBMEDc (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 12 Feb 2021 23:03:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229570AbhBMEDb (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 12 Feb 2021 23:03:31 -0500
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D757C061574;
        Fri, 12 Feb 2021 20:02:50 -0800 (PST)
Received: by mail-lj1-x22b.google.com with SMTP id r23so1463493ljh.1;
        Fri, 12 Feb 2021 20:02:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=gP7IqI+KSRQ8YYDG8RyAx/kpPeOQvqa8JBkLTrClz0w=;
        b=Z9xhNYeJH7YTCKckNsXg2g0ZdR97Kj6kfEppFnqgL8n0VaQCG8WVrnPYn/dpAVMZqb
         DPFG+o7A0kUaOrH5HO1dNS5bNn9jKE0GlNaE3IlLNe8kWlWWKvtnvA4d4eIgB2ofESu/
         TdZmxZwABtfaOeRAgGDFlmXCwJQ4mnhAtha1bumNXOa2AXFmJ03scSo/MU7rFanB6xhg
         sXIbXdIIrBEwrn1VcgBR6kjq/xGGWW0OsjCq/k+I1a5yas4c/UscpAkrLYqaTArZr/xF
         yVRo97K+T1ePkWlLN7gqR128r9UtpJdcjohiQX6M+aGk9TWZ3XuuaysJqOzhJ38ZZxm9
         WjjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=gP7IqI+KSRQ8YYDG8RyAx/kpPeOQvqa8JBkLTrClz0w=;
        b=YfVTswtl+A6OJ0hCem6KNdaealx1MY0+EhRRGxllWdkp1YghtH03zjq8+hV4pnHNc+
         LFvi5EnsyihAny7hAVbPK9wlPg4zH1jbY5GMRPhUJ77dDAZrv6r14HFY2nRVSwWDaENy
         zULAy320oYFmQgn9TsitWpC3VtU+zTFrMbulkbiLwUut39xO70nmo9QzGqou2hf+nZ24
         Z8lZJdkSJgm2cZfXfhsyVTu3XoC5Y3kuY9mBSz4P2Coa6+gNlFKO0SQDfaCO+kFS/RZi
         U8ORIfieLb595mlc1miKMU+ER3ikc7aunpbBYOIdpweK3TxnLTyD+dKR8VkiTXnEUgLy
         ptFQ==
X-Gm-Message-State: AOAM533BDbwzbFDC1pxaz0TjpJ8Npuba1HXyfyziLGrjdeH9yE2bFrUq
        DuQFr5zzUthLlje1WvPNuP4=
X-Google-Smtp-Source: ABdhPJzAkBIKz5z8E3qmxrMKC0kqU66FARshfkHPvTdVc8a8jdkLvCi3h5m+xzURUtXhxRkCCpoXtg==
X-Received: by 2002:a2e:97c3:: with SMTP id m3mr3337412ljj.286.1613188968240;
        Fri, 12 Feb 2021 20:02:48 -0800 (PST)
Received: from [192.168.42.148] (pool-109-191-157-213.is74.ru. [109.191.157.213])
        by smtp.gmail.com with ESMTPSA id t1sm716034ljk.104.2021.02.12.20.02.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Feb 2021 20:02:47 -0800 (PST)
Message-ID: <8a2463a97af411e4167f3c4abc2d4be6447e51ac.camel@gmail.com>
Subject: Re: [PATCH] HID: sony: Support for DS4 clones that do not implement
 feature report 0x81
From:   Ivan Mironov <mironov.ivan@gmail.com>
To:     Jiri Kosina <jikos@kernel.org>
Cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Date:   Sat, 13 Feb 2021 09:02:45 +0500
In-Reply-To: <20210113173402.17030-1-mironov.ivan@gmail.com>
References: <20210113173402.17030-1-mironov.ivan@gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.3 (3.38.3-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Ignore this patch, I am working on a better one.

On Wed, 2021-01-13 at 22:34 +0500, Ivan Mironov wrote:
> There are clones of DualShock 4 that are very similar to the originals,
> except of 1) they do not support HID feature report 0x81 and 2) they do
> not have any USB Audio interfaces despite they physically have audio
> jack.
> 
> Such controllers are working fine with Linux when connected via
> Bluetooth, but not when connected via USB. Here is how failed USB
> connection attempt looks in log:
> 
> 	usb 1-5: New USB device found, idVendor=054c, idProduct=05c4, bcdDevice= 1.00
> 	usb 1-5: New USB device strings: Mfr=1, Product=2, SerialNumber=0
> 	usb 1-5: Product: Wireless Controller
> 	usb 1-5: Manufacturer: Sony Computer Entertainment
> 	sony 0003:054C:05C4.0007: failed to retrieve feature report 0x81 with the DualShock 4 MAC address
> 	sony 0003:054C:05C4.0007: hidraw6: USB HID v81.11 Gamepad [Sony Computer Entertainment Wireless Controller] on usb-0000:00:14.0-5/input0
> 	sony 0003:054C:05C4.0007: failed to claim input
> 
> This patch adds support of using feature report 0x12 as a fallback for
> Bluetooth MAC address retrieval. Feature report 0x12 also seems to be
> used by DS4Windows[1] for all DS4 controllers.
> 
> [1] https://github.com/Ryochan7/DS4Windows/blob/1b74a4440089f38a24ee2c2483c1d733a0692b8f/DS4Windows/HidLibrary/HidDevice.cs#L479
> 
> Signed-off-by: Ivan Mironov <mironov.ivan@gmail.com>
> ---
>  drivers/hid/hid-sony.c | 72 ++++++++++++++++++++++++++++++------------
>  1 file changed, 52 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/hid/hid-sony.c b/drivers/hid/hid-sony.c
> index e3a557dc9ffd..97df12180e45 100644
> --- a/drivers/hid/hid-sony.c
> +++ b/drivers/hid/hid-sony.c
> @@ -491,6 +491,7 @@ struct motion_output_report_02 {
>  
> 
>  #define DS4_FEATURE_REPORT_0x02_SIZE 37
>  #define DS4_FEATURE_REPORT_0x05_SIZE 41
> +#define DS4_FEATURE_REPORT_0x12_SIZE 16
>  #define DS4_FEATURE_REPORT_0x81_SIZE 7
>  #define DS4_FEATURE_REPORT_0xA3_SIZE 49
>  #define DS4_INPUT_REPORT_0x11_SIZE 78
> @@ -2593,6 +2594,53 @@ static int sony_get_bt_devaddr(struct sony_sc *sc)
>  	return 0;
>  }
>  
> 
> +static int sony_get_usb_ds4_devaddr(struct sony_sc *sc)
> +{
> +	u8 *buf = NULL;
> +	int ret;
> +
> +	buf = kmalloc(max(DS4_FEATURE_REPORT_0x12_SIZE, DS4_FEATURE_REPORT_0x81_SIZE), GFP_KERNEL);
> +	if (!buf)
> +		return -ENOMEM;
> +
> +	/*
> +	 * The MAC address of a DS4 controller connected via USB can be
> +	 * retrieved with feature report 0x81. The address begins at
> +	 * offset 1.
> +	 */
> +	ret = hid_hw_raw_request(sc->hdev, 0x81, buf,
> +			DS4_FEATURE_REPORT_0x81_SIZE, HID_FEATURE_REPORT,
> +			HID_REQ_GET_REPORT);
> +	if (ret == DS4_FEATURE_REPORT_0x81_SIZE) {
> +		memcpy(sc->mac_address, &buf[1], sizeof(sc->mac_address));
> +		goto out_free;
> +	}
> +	dbg_hid("%s: hid_hw_raw_request(..., 0x81, ...) returned %d\n", __func__, ret);
> +
> +	/*
> +	 * Some variants do not implement feature report 0x81 at all.
> +	 * Fortunately, feature report 0x12 also contains the MAC address of
> +	 * a controller.
> +	 */
> +	ret = hid_hw_raw_request(sc->hdev, 0x12, buf,
> +			DS4_FEATURE_REPORT_0x12_SIZE, HID_FEATURE_REPORT,
> +			HID_REQ_GET_REPORT);
> +	if (ret == DS4_FEATURE_REPORT_0x12_SIZE) {
> +		memcpy(sc->mac_address, &buf[1], sizeof(sc->mac_address));
> +		goto out_free;
> +	}
> +	dbg_hid("%s: hid_hw_raw_request(..., 0x12, ...) returned %d\n", __func__, ret);
> +
> +	hid_err(sc->hdev, "failed to retrieve feature reports 0x81 and 0x12 with the DualShock 4 MAC address\n");
> +	ret = ret < 0 ? ret : -EINVAL;
> +
> +out_free:
> +
> +	kfree(buf);
> +
> +	return ret;
> +}
> +
>  static int sony_check_add(struct sony_sc *sc)
>  {
>  	u8 *buf = NULL;
> @@ -2613,26 +2661,9 @@ static int sony_check_add(struct sony_sc *sc)
>  			return 0;
>  		}
>  	} else if (sc->quirks & (DUALSHOCK4_CONTROLLER_USB | DUALSHOCK4_DONGLE)) {
> -		buf = kmalloc(DS4_FEATURE_REPORT_0x81_SIZE, GFP_KERNEL);
> -		if (!buf)
> -			return -ENOMEM;
> -
> -		/*
> -		 * The MAC address of a DS4 controller connected via USB can be
> -		 * retrieved with feature report 0x81. The address begins at
> -		 * offset 1.
> -		 */
> -		ret = hid_hw_raw_request(sc->hdev, 0x81, buf,
> -				DS4_FEATURE_REPORT_0x81_SIZE, HID_FEATURE_REPORT,
> -				HID_REQ_GET_REPORT);
> -
> -		if (ret != DS4_FEATURE_REPORT_0x81_SIZE) {
> -			hid_err(sc->hdev, "failed to retrieve feature report 0x81 with the DualShock 4 MAC address\n");
> -			ret = ret < 0 ? ret : -EINVAL;
> -			goto out_free;
> -		}
> -
> -		memcpy(sc->mac_address, &buf[1], sizeof(sc->mac_address));
> +		ret = sony_get_usb_ds4_devaddr(sc);
> +		if (ret < 0)
> +			return ret;
>  
> 
>  		snprintf(sc->hdev->uniq, sizeof(sc->hdev->uniq),
>  			 "%pMR", sc->mac_address);
> @@ -2670,6 +2701,7 @@ static int sony_check_add(struct sony_sc *sc)
>  		return 0;
>  	}
>  
> 
> +	dbg_hid("%s: retrieved MAC address: %s\n", __func__, sc->hdev->uniq);
>  	ret = sony_check_add_dev_list(sc);
>  
> 
>  out_free:


