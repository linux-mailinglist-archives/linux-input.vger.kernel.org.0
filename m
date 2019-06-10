Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DDEB33AF52
	for <lists+linux-input@lfdr.de>; Mon, 10 Jun 2019 09:09:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387706AbfFJHJ3 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 10 Jun 2019 03:09:29 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:52931 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387702AbfFJHJ2 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 10 Jun 2019 03:09:28 -0400
Received: by mail-wm1-f68.google.com with SMTP id s3so7347058wms.2
        for <linux-input@vger.kernel.org>; Mon, 10 Jun 2019 00:09:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=mi84Sitr43ze4MB/oSB4o3ogdOHfHP2IvZzxdqlciU4=;
        b=Z8hij7Gk7aQ2+q2wztNcqd1H8LFcDrbWcnrR7sObzOjH+5X85yDstAH5UFnVrtPk9W
         /Rh9DsXFx+6bsV2YHCXSJl3Y5VBfsjXpUXOwNzuGTRy5cEBZpKDTVgR80CIhYD4D3/XB
         arx3le3sqdyZNQw1SoOy6AUXafAR2Ku/6ige+vpqyo7ihh3Od4Jlg88PARvmm8l8v/TC
         6S3ORQhSNgZtWiWXvaw4oP0RCO//S1CIuc7QxP7cniKfe6i1z3AuFio3nChQbycoUaoJ
         ViJirRqrDdZG/YtoY9nRJHC5WZEiIwbrUjOhj+zrNjTaKnSqd6SfkXYGyMNU5FmzcOvI
         z8uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=mi84Sitr43ze4MB/oSB4o3ogdOHfHP2IvZzxdqlciU4=;
        b=tP+hxgq0RuuAl8LYfLhTwItnwih/498CDqfiGORhQFu4HV6aoHWl6jk2X8Q9WGNOzE
         dmQCXoRdVnhQkg7mGQmjVDpLacgkKwkh57JlxqD7MlTOsacHBX/Kcpgrca5GiBrDt4D4
         r7rxXaHgD9N9j8hNP9Xl3t3hO7RyTfuWp8Bg8o3G2eSVLwOi7lIA8o4m3KCKO5lVCUFE
         MFSVX82NRGFqsaU/GntdhQCx2j+V6Sb1WC8i9wHeL0tobv1/AYn0saLVfvSMv4anGisG
         E+jcdusj6LatEeAWuetTqPT1KDWOl7AjVs3z0ZWWNh+1VLqDLyxq6lx1o8RQH2Ni+uSg
         Gw1A==
X-Gm-Message-State: APjAAAWQgSLdHS1iUsE9KXMcwoWPLgQD4KSO9HtQEil5ojacAmCpazxj
        CRjWwmhMVUGpzkeYCqvIjkx2wzu0QgU=
X-Google-Smtp-Source: APXvYqxgRM8Nnvt/IJsXCrY1WOwyjz6m+vgop+OqDLZX0pKB4PEkJ/xLI3wz+2uFRZkYyfO6hETSQQ==
X-Received: by 2002:a1c:99ca:: with SMTP id b193mr11993762wme.31.1560150566802;
        Mon, 10 Jun 2019 00:09:26 -0700 (PDT)
Received: from [192.168.0.93] (88-112-122-53.elisa-laajakaista.fi. [88.112.122.53])
        by smtp.gmail.com with ESMTPSA id 67sm11796722wmd.38.2019.06.10.00.09.25
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Mon, 10 Jun 2019 00:09:26 -0700 (PDT)
Subject: Re: [PATCH] HID: uclogic: Add support for Ugee Rainbow CV720
To:     Wang Xuerui <git@xen0n.name>, linux-input@vger.kernel.org
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
References: <20190608092324.4623-1-git@xen0n.name>
From:   Nikolai Kondrashov <spbnick@gmail.com>
Message-ID: <4866e3ff-d2e2-95ba-5841-dc1be631c984@gmail.com>
Date:   Mon, 10 Jun 2019 10:09:24 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190608092324.4623-1-git@xen0n.name>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 6/8/19 12:23 PM, Wang Xuerui wrote:
> Add support for Ugee Rainbow CV720 to hid-uclogic.

Looks good to me.

Reviewed-By: Nikolai Kondrashov <spbnick@gmail.com>

On 6/8/19 12:23 PM, Wang Xuerui wrote:
> Add support for Ugee Rainbow CV720 to hid-uclogic.
> 
> Signed-off-by: Wang Xuerui <git@xen0n.name>
> ---
>   drivers/hid/hid-ids.h            | 1 +
>   drivers/hid/hid-uclogic-core.c   | 2 ++
>   drivers/hid/hid-uclogic-params.c | 2 ++
>   3 files changed, 5 insertions(+)
> 
> diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
> index 84e0c78d73cd..80edfb639306 100644
> --- a/drivers/hid/hid-ids.h
> +++ b/drivers/hid/hid-ids.h
> @@ -1153,6 +1153,7 @@
>   #define USB_DEVICE_ID_UGEE_XPPEN_TABLET_DECO01	0x0042
>   #define USB_DEVICE_ID_UGEE_TABLET_G5		0x0074
>   #define USB_DEVICE_ID_UGEE_TABLET_EX07S		0x0071
> +#define USB_DEVICE_ID_UGEE_TABLET_RAINBOW_CV720	0x0055
>   
>   #define USB_VENDOR_ID_UNITEC	0x227d
>   #define USB_DEVICE_ID_UNITEC_USB_TOUCH_0709	0x0709
> diff --git a/drivers/hid/hid-uclogic-core.c b/drivers/hid/hid-uclogic-core.c
> index 8fe02d81265d..490c1ddb350c 100644
> --- a/drivers/hid/hid-uclogic-core.c
> +++ b/drivers/hid/hid-uclogic-core.c
> @@ -387,6 +387,8 @@ static const struct hid_device_id uclogic_devices[] = {
>   				USB_DEVICE_ID_UGEE_TABLET_G5) },
>   	{ HID_USB_DEVICE(USB_VENDOR_ID_UGEE,
>   				USB_DEVICE_ID_UGEE_TABLET_EX07S) },
> +	{ HID_USB_DEVICE(USB_VENDOR_ID_UGEE,
> +				USB_DEVICE_ID_UGEE_TABLET_RAINBOW_CV720) },
>   	{ HID_USB_DEVICE(USB_VENDOR_ID_UGEE,
>   				USB_DEVICE_ID_UGEE_XPPEN_TABLET_G540) },
>   	{ HID_USB_DEVICE(USB_VENDOR_ID_UGEE,
> diff --git a/drivers/hid/hid-uclogic-params.c b/drivers/hid/hid-uclogic-params.c
> index 0187c9f8fc22..8e120dde31fa 100644
> --- a/drivers/hid/hid-uclogic-params.c
> +++ b/drivers/hid/hid-uclogic-params.c
> @@ -999,6 +999,8 @@ int uclogic_params_init(struct uclogic_params *params,
>   		     USB_DEVICE_ID_UGEE_XPPEN_TABLET_G540):
>   	case VID_PID(USB_VENDOR_ID_UGEE,
>   		     USB_DEVICE_ID_UGEE_XPPEN_TABLET_G640):
> +	case VID_PID(USB_VENDOR_ID_UGEE,
> +		     USB_DEVICE_ID_UGEE_TABLET_RAINBOW_CV720):
>   		/* If this is the pen interface */
>   		if (bInterfaceNumber == 1) {
>   			/* Probe v1 pen parameters */
> 

