Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4324C68CA5C
	for <lists+linux-input@lfdr.de>; Tue,  7 Feb 2023 00:14:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229698AbjBFXOg (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 6 Feb 2023 18:14:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229826AbjBFXOf (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 6 Feb 2023 18:14:35 -0500
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAE083C2C;
        Mon,  6 Feb 2023 15:14:33 -0800 (PST)
Received: by mail-pl1-x62a.google.com with SMTP id be8so13845458plb.7;
        Mon, 06 Feb 2023 15:14:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WPeiolN5TtOZxJBSyBY1/BUm2msoPNJX+opBS614acE=;
        b=lU7G6ad+KppWcO8IyzV/ABInSNR04C7iCSM5SCr+U52Jicp+3schuiGecqLoYwrKxV
         7WXiH3gTzs4co6ByxH+Kk7LIK/5SKlEs3ZhPWpxgcBMs9RoL+ywdNXIFynXXIWJvCKov
         51avSgC1FSmcj0S9gIpQGDi52p2z5BgpZP0WgAp3HmgoBQklKjnClabXvYv4PW1w2iZk
         356zk9PWOmoQ1gtCKaswfUrejh5jLCexByd5L0OzSXh4iwCSvZrE5H8OUTg3h0rhysF1
         /YZy0NmxK9IKq1w7YiZTs12w8JaxXlryH0Xj4vCTVy2VMb80iKANcm6wPXNXKOA0GEQ5
         iEgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WPeiolN5TtOZxJBSyBY1/BUm2msoPNJX+opBS614acE=;
        b=g1IG/AqdGQ9ZxUklIdJb9yasdIEcT1t8UOJpWA/O+1PMlahnzCXSImsOIb0vSXrY0X
         u6wo6Bgqol/4bS5FF76RnBC6lkJ7d7VzLoKMQjp68GV8SQ1Cy53w5alje6O9TIClkIK8
         DwXfcAOTlbHdjpUVBdK9H+FlXTpFiVnkkyMHrJ/U7CYvuCt+0Ms7aA6+Up8WTeJoobZR
         /hnj6DGh0s13eGKfl6kv2KXgTZNHgxkH5VgEx27AVmp90yY/5d2kHLxf2LwfofSgV1mC
         eh+DAC9FTipJ31D1c8NOGElV9c33Wy+hKtk3OeIq190Furyckte487oyykrh9qs6+zNc
         I87w==
X-Gm-Message-State: AO0yUKXnRSth7qbDdcyHRdsiHwElrp2++PPW1WQdtENMi55+XawdF8Ry
        jE85TAl3asM3oOBNAN3DWlo=
X-Google-Smtp-Source: AK7set+J1i0/lOprTA7vLEivyG1SphGWO9nzgCvbkM4CCcdJGgyaqbPWsanDFF4LN4yNK3++n1VQIA==
X-Received: by 2002:a05:6a20:5498:b0:be:b49e:a634 with SMTP id i24-20020a056a20549800b000beb49ea634mr1176653pzk.23.1675725273185;
        Mon, 06 Feb 2023 15:14:33 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:991d:5689:64f0:6f3c])
        by smtp.gmail.com with ESMTPSA id m20-20020a056a00081400b0058da7e58008sm7706630pfk.36.2023.02.06.15.14.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Feb 2023 15:14:32 -0800 (PST)
Date:   Mon, 6 Feb 2023 15:14:29 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Danny Kaehn <kaehndan@gmail.com>
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        jikos@kernel.org, benjamin.tissoires@redhat.com,
        devicetree@vger.kernel.org, linux-input@vger.kernel.org,
        ethan.twardy@plexus.com
Subject: Re: [PATCH v4 2/4] HID: usbhid: Share USB device devicetree node
 with child HID device
Message-ID: <Y+GJ1SB6RNMZRBq/@google.com>
References: <20230206135016.6737-1-kaehndan@gmail.com>
 <20230206135016.6737-3-kaehndan@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230206135016.6737-3-kaehndan@gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Danny,

On Mon, Feb 06, 2023 at 07:50:14AM -0600, Danny Kaehn wrote:
> USB HID core now shares its devicetree of_node with its child HID device.
> Since there can only be one HID device on a USB interface, it is redundant
> to specify a hid node under the USB device (and further, binding this way
> isn't currently possible, as hid_driver does not support of_match_table).

Why do we do that only for OF? Can we use device_set_node() instead?

> 
> Signed-off-by: Danny Kaehn <kaehndan@gmail.com>
> ---
>  drivers/hid/usbhid/hid-core.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/hid/usbhid/hid-core.c b/drivers/hid/usbhid/hid-core.c
> index be4c731aaa65..b6c968af258f 100644
> --- a/drivers/hid/usbhid/hid-core.c
> +++ b/drivers/hid/usbhid/hid-core.c
> @@ -33,6 +33,7 @@
>  #include <linux/hiddev.h>
>  #include <linux/hid-debug.h>
>  #include <linux/hidraw.h>
> +#include <linux/device.h>
>  #include "usbhid.h"
>  
>  /*
> @@ -1369,6 +1370,7 @@ static int usbhid_probe(struct usb_interface *intf, const struct usb_device_id *
>  	hid->hiddev_report_event = hiddev_report_event;
>  #endif
>  	hid->dev.parent = &intf->dev;
> +	device_set_of_node_from_dev(&hid->dev, &intf->dev);
>  	hid->bus = BUS_USB;
>  	hid->vendor = le16_to_cpu(dev->descriptor.idVendor);
>  	hid->product = le16_to_cpu(dev->descriptor.idProduct);
> -- 
> 2.25.1
> 

Thanks.

-- 
Dmitry
