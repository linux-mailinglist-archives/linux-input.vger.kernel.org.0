Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 529ED5AF33
	for <lists+linux-input@lfdr.de>; Sun, 30 Jun 2019 09:19:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726667AbfF3HTD (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 30 Jun 2019 03:19:03 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:40177 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725959AbfF3HTD (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 30 Jun 2019 03:19:03 -0400
Received: by mail-pf1-f194.google.com with SMTP id p184so4997089pfp.7;
        Sun, 30 Jun 2019 00:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=lqmewgLdox3q6xeJleJbddpt+EE2+zPuCoLU7Opy5NU=;
        b=efWyaDxla4encwtVoRQlQMgzCCy1yi9jsLij1Mj7K2vjKBK6SiQXu1lY3DhcfakNjx
         XI2MXwwdeNce4iLXPk9TD3vhIOknXMbUWiMd3dkncW2LDID6UFwrwfnKYMjybMiVPkI8
         JGqCzfEYkvUG7OXgnjphZ0KMNmhGBTVudIB5NPMdIyiq8Co6Eu43vIdVYD3zSYoRu/2w
         cdo+SPbBYixsF9i7cs+hnQ3JJvkc8MwB9BtI2plvpG4J62o1UjS2rlK4p2NV+sBSbtV5
         hQMtUA1qE0Kfu/L846Df0zH129iNWzhQQLoYdCjqS38EA4wlJ5UDN7ZK574gvageYbcG
         4CUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=lqmewgLdox3q6xeJleJbddpt+EE2+zPuCoLU7Opy5NU=;
        b=g6lhQGr6FTlIXhcAWUZ8MFftUjGoNXK29CcY7J479nAuwRmqX4VIZv8dzm5hgJy1n7
         v9rq/UYe75f/5n8m8MiKf7+hA0AoejIQRDnXSZtGIvudmr/5PN+ClEEFhN/B3qRiekoU
         V1h+cf16jIpxPSs2l8v9SxQWCy+crYhYaqecqPiNTGjHE1HHGh7JAcwUgwIktWXdH0yO
         tahsIiXIGnnv8C+EsaYhojH85eEZdD9FhXaPMd/wqIoIicyBfvVJaBYreOk6VjlScONU
         T6sbYqAacr7Ag12m/UqHD6GP3xBTSzvdYgKj3DIWPSyKYuV2nt8/LEihsMQyp+ZEHEx4
         sPlw==
X-Gm-Message-State: APjAAAWKlK/yPGIhA+RIDPcx5TY8KLzKTtV+pyQy2Xm0IHeIIk6iZNtJ
        YswbN8hvKE5AFzsOfdAzPts=
X-Google-Smtp-Source: APXvYqxq1FfZolN72MUIb2gYPB+AVLb5ynmNoJoQGYQapzNp7erPqeCrhwH73WodcdxI5ce42NeFoA==
X-Received: by 2002:a17:90a:ff17:: with SMTP id ce23mr561811pjb.47.1561879142087;
        Sun, 30 Jun 2019 00:19:02 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id s20sm6386360pfe.169.2019.06.30.00.19.01
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sun, 30 Jun 2019 00:19:01 -0700 (PDT)
Date:   Sun, 30 Jun 2019 00:18:59 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Cc:     benjamin.tissoires@redhat.com, jikos@kernel.org,
        hdegoede@redhat.com, bjorn.andersson@linaro.org, agross@kernel.org,
        lee.jones@linaro.org, xnox@ubuntu.com, robh+dt@kernel.org,
        mark.rutland@arm.com, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 2/5] HID: quirks: Refactor ELAN 400 and 401 handling
Message-ID: <20190630071859.GD91171@dtor-ws>
References: <20190621144854.38568-1-jeffrey.l.hugo@gmail.com>
 <20190621145312.38688-1-jeffrey.l.hugo@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190621145312.38688-1-jeffrey.l.hugo@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Jun 21, 2019 at 07:53:12AM -0700, Jeffrey Hugo wrote:
> There needs to be coordination between hid-quirks and the elan_i2c driver
> about which devices are handled by what drivers.  Currently, both use
> whitelists, which results in valid devices being unhandled by default,
> when they should not be rejected by hid-quirks.  This is quickly becoming
> an issue.
> 
> Since elan_i2c has a maintained whitelist of what devices it will handle,
> which is now in a header file that hid-quirks can access, use that to
> implement a blacklist in hid-quirks so that only the devices that need to
> be handled by elan_i2c get rejected by hid-quirks, and everything else is
> handled by default.
> 
> Suggested-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>
> Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
> Acked-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>

Applied, thank you.

> ---
>  drivers/hid/hid-quirks.c | 22 +++++++++++-----------
>  1 file changed, 11 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
> index e5ca6fe2ca57..48ed4caf0ebc 100644
> --- a/drivers/hid/hid-quirks.c
> +++ b/drivers/hid/hid-quirks.c
> @@ -16,6 +16,7 @@
>  #include <linux/export.h>
>  #include <linux/slab.h>
>  #include <linux/mutex.h>
> +#include <linux/input/elan-i2c-ids.h>
>  
>  #include "hid-ids.h"
>  
> @@ -914,6 +915,8 @@ static const struct hid_device_id hid_mouse_ignore_list[] = {
>  
>  bool hid_ignore(struct hid_device *hdev)
>  {
> +	int i;
> +
>  	if (hdev->quirks & HID_QUIRK_NO_IGNORE)
>  		return false;
>  	if (hdev->quirks & HID_QUIRK_IGNORE)
> @@ -978,18 +981,15 @@ bool hid_ignore(struct hid_device *hdev)
>  		break;
>  	case USB_VENDOR_ID_ELAN:
>  		/*
> -		 * Many Elan devices have a product id of 0x0401 and are handled
> -		 * by the elan_i2c input driver. But the ACPI HID ELAN0800 dev
> -		 * is not (and cannot be) handled by that driver ->
> -		 * Ignore all 0x0401 devs except for the ELAN0800 dev.
> +		 * Blacklist of everything that gets handled by the elan_i2c
> +		 * input driver.  This avoids disabling valid touchpads and
> +		 * other ELAN devices.
>  		 */
> -		if (hdev->product == 0x0401 &&
> -		    strncmp(hdev->name, "ELAN0800", 8) != 0)
> -			return true;
> -		/* Same with product id 0x0400 */
> -		if (hdev->product == 0x0400 &&
> -		    strncmp(hdev->name, "QTEC0001", 8) != 0)
> -			return true;
> +		if ((hdev->product == 0x0401 || hdev->product == 0x0400))
> +			for (i = 0; strlen(elan_acpi_id[i].id); ++i)
> +				if (!strncmp(hdev->name, elan_acpi_id[i].id,
> +					     strlen(elan_acpi_id[i].id)))
> +					return true;
>  		break;
>  	}
>  
> -- 
> 2.17.1
> 

-- 
Dmitry
