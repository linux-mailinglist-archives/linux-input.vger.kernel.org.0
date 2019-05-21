Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DA8F2255DD
	for <lists+linux-input@lfdr.de>; Tue, 21 May 2019 18:42:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728933AbfEUQm7 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 21 May 2019 12:42:59 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:36394 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728784AbfEUQm6 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 21 May 2019 12:42:58 -0400
Received: by mail-pl1-f195.google.com with SMTP id d21so8714345plr.3
        for <linux-input@vger.kernel.org>; Tue, 21 May 2019 09:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=WtZw+fdpaZbjOuInBI+L534tlDp+rXop9p/+kf7XV9Y=;
        b=hFNtdVKEgvRPdSC5PDgOq8ZO64S/5OEgXmRLL+urCT25WMrrztgtN7uEjQhFZ0x1q9
         472j6PCFOpSu9GCbELpRPLoXI8edMyQZO9oXOOQOa+9qDynglftR9FIBF2samkT3ZMRl
         sHNelQEizfXadKEq6bQQCkKPxdxLXYjIq0ztKCNXaEOYZ0aDxKy95VjgvSjCPhavUKDZ
         +PovVhwCZCVANcIkrWpNQS53G5pOdvhUXu1EEYb/M9G+qQAg75c48u5RSg3Lz8TP6JSQ
         N9oToM2QuyrevbIkGevB/nzQC9E5I4kcBx49z+Zp5GdyivvaLDDlAX5AJ9+4j/bVAoKG
         ueeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=WtZw+fdpaZbjOuInBI+L534tlDp+rXop9p/+kf7XV9Y=;
        b=Z/ebgSfvawV57ucWwyDpsAwmaWl9TwQv0yZ8WFakzq4PNBPR+73nZCeWZaFQNtkQSI
         0QIKEwYLwdgL2GoT+j0H5h/0HyWLDv8wMorf/NqaNwiQmVwhI0MdioM4WSxGYzf1qTa+
         6Lr71l7XpxHfpimps38wqEvCHUWqHO5ub6BtqUtvPs0Ne/ET7ojOQLQg0IpxZL7IEyBC
         ClsZ8vaZGVGxJi9v5PmOdAMUqgl0sWPNq4Z26qfaOKloZfiViH34bxqPm4sRPry2tir7
         PfkFAR3402vkUBXgKZSnai6rr+r1QY+83FueyMXqb5NuN15jPdPrMP0M7sLeoddlAv3C
         FnzA==
X-Gm-Message-State: APjAAAWYVb+FNFFZU3OJmgWLpap3riJ+PcRGDRB6qu57QeGPzRaaEmsU
        zksxlUfaC+Gpir7MUg5c6ePCig==
X-Google-Smtp-Source: APXvYqz6hkQggncGw2amqhWyINM+2IIHUlaiyyx3bhaLSiib6GgTf9AkL4kdRJODyIfrRQHDBRKiyw==
X-Received: by 2002:a17:902:20ca:: with SMTP id v10mr44805389plg.296.1558456977499;
        Tue, 21 May 2019 09:42:57 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id t78sm46216148pfa.154.2019.05.21.09.42.56
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 May 2019 09:42:56 -0700 (PDT)
Date:   Tue, 21 May 2019 09:43:24 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Cc:     dmitry.torokhov@gmail.com, jikos@kernel.org,
        benjamin.tissoires@redhat.com, lee.jones@linaro.org,
        robh+dt@kernel.org, mark.rutland@arm.com, agross@kernel.org,
        david.brown@linaro.org, hdegoede@redhat.com,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/2] HID: quirks: Refactor ELAN 400 and 401 handling
Message-ID: <20190521164324.GA2085@tuxbook-pro>
References: <20190423160543.9922-1-jeffrey.l.hugo@gmail.com>
 <20190423160605.9970-1-jeffrey.l.hugo@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190423160605.9970-1-jeffrey.l.hugo@gmail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue 23 Apr 09:06 PDT 2019, Jeffrey Hugo wrote:

> There needs to be coordination between hid-quirks and the elan_i2c driver
> about which devices are handled by what drivers.  Currently, both use
> whitelists, which results in valid devices being unhandled by default,
> when they should not be rejected by hid-quirks.  This is quickly becoming
> an issue.
> 
> Since elan_i2c has a maintained whitelist of what devices it will handle,
> use that to implement a blacklist in hid-quirks so that only the devices
> that need to be handled by elan_i2c get rejected by hid-quirks, and
> everything else is handled by default.  The downside is the whitelist and
> blacklist need to be kept in sync.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Jiri, the two patches in this series doesn't have a build time
dependency, so if you take this one through your tree I'll take 2/2
through arm-soc.

Regards,
Bjorn

> Suggested-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>
> Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
> ---
>  drivers/hid/hid-quirks.c            | 64 ++++++++++++++++++++++++-----
>  drivers/input/mouse/elan_i2c_core.c |  4 ++
>  2 files changed, 58 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
> index 77ffba48cc73..656485e08eb7 100644
> --- a/drivers/hid/hid-quirks.c
> +++ b/drivers/hid/hid-quirks.c
> @@ -987,17 +987,61 @@ bool hid_ignore(struct hid_device *hdev)
>  		break;
>  	case USB_VENDOR_ID_ELAN:
>  		/*
> -		 * Many Elan devices have a product id of 0x0401 and are handled
> -		 * by the elan_i2c input driver. But the ACPI HID ELAN0800 dev
> -		 * is not (and cannot be) handled by that driver ->
> -		 * Ignore all 0x0401 devs except for the ELAN0800 dev.
> +		 * Blacklist of everything that gets handled by the elan_i2c
> +		 * input driver.  This should be kept in sync with the whitelist
> +		 * that exists in that driver.  This avoids disabling valid
> +		 * touchpads and other ELAN devices.
>  		 */
> -		if (hdev->product == 0x0401 &&
> -		    strncmp(hdev->name, "ELAN0800", 8) != 0)
> -			return true;
> -		/* Same with product id 0x0400 */
> -		if (hdev->product == 0x0400 &&
> -		    strncmp(hdev->name, "QTEC0001", 8) != 0)
> +		if ((hdev->product == 0x0401 || hdev->product == 0x0400) &&
> +		   (strncmp(hdev->name, "ELAN0000", 8) == 0 ||
> +		    strncmp(hdev->name, "ELAN0100", 8) == 0 ||
> +		    strncmp(hdev->name, "ELAN0600", 8) == 0 ||
> +		    strncmp(hdev->name, "ELAN0601", 8) == 0 ||
> +		    strncmp(hdev->name, "ELAN0602", 8) == 0 ||
> +		    strncmp(hdev->name, "ELAN0603", 8) == 0 ||
> +		    strncmp(hdev->name, "ELAN0604", 8) == 0 ||
> +		    strncmp(hdev->name, "ELAN0605", 8) == 0 ||
> +		    strncmp(hdev->name, "ELAN0606", 8) == 0 ||
> +		    strncmp(hdev->name, "ELAN0607", 8) == 0 ||
> +		    strncmp(hdev->name, "ELAN0608", 8) == 0 ||
> +		    strncmp(hdev->name, "ELAN0609", 8) == 0 ||
> +		    strncmp(hdev->name, "ELAN060B", 8) == 0 ||
> +		    strncmp(hdev->name, "ELAN060C", 8) == 0 ||
> +		    strncmp(hdev->name, "ELAN060F", 8) == 0 ||
> +		    strncmp(hdev->name, "ELAN0610", 8) == 0 ||
> +		    strncmp(hdev->name, "ELAN0611", 8) == 0 ||
> +		    strncmp(hdev->name, "ELAN0612", 8) == 0 ||
> +		    strncmp(hdev->name, "ELAN0613", 8) == 0 ||
> +		    strncmp(hdev->name, "ELAN0614", 8) == 0 ||
> +		    strncmp(hdev->name, "ELAN0615", 8) == 0 ||
> +		    strncmp(hdev->name, "ELAN0616", 8) == 0 ||
> +		    strncmp(hdev->name, "ELAN0617", 8) == 0 ||
> +		    strncmp(hdev->name, "ELAN0618", 8) == 0 ||
> +		    strncmp(hdev->name, "ELAN0619", 8) == 0 ||
> +		    strncmp(hdev->name, "ELAN061A", 8) == 0 ||
> +		    strncmp(hdev->name, "ELAN061B", 8) == 0 ||
> +		    strncmp(hdev->name, "ELAN061C", 8) == 0 ||
> +		    strncmp(hdev->name, "ELAN061D", 8) == 0 ||
> +		    strncmp(hdev->name, "ELAN061E", 8) == 0 ||
> +		    strncmp(hdev->name, "ELAN061F", 8) == 0 ||
> +		    strncmp(hdev->name, "ELAN0620", 8) == 0 ||
> +		    strncmp(hdev->name, "ELAN0621", 8) == 0 ||
> +		    strncmp(hdev->name, "ELAN0622", 8) == 0 ||
> +		    strncmp(hdev->name, "ELAN0623", 8) == 0 ||
> +		    strncmp(hdev->name, "ELAN0624", 8) == 0 ||
> +		    strncmp(hdev->name, "ELAN0625", 8) == 0 ||
> +		    strncmp(hdev->name, "ELAN0626", 8) == 0 ||
> +		    strncmp(hdev->name, "ELAN0627", 8) == 0 ||
> +		    strncmp(hdev->name, "ELAN0628", 8) == 0 ||
> +		    strncmp(hdev->name, "ELAN0629", 8) == 0 ||
> +		    strncmp(hdev->name, "ELAN062A", 8) == 0 ||
> +		    strncmp(hdev->name, "ELAN062B", 8) == 0 ||
> +		    strncmp(hdev->name, "ELAN062C", 8) == 0 ||
> +		    strncmp(hdev->name, "ELAN062D", 8) == 0 ||
> +		    strncmp(hdev->name, "ELAN0631", 8) == 0 ||
> +		    strncmp(hdev->name, "ELAN0632", 8) == 0 ||
> +		    strncmp(hdev->name, "ELAN1000", 8) == 0 ||
> +		    strncmp(hdev->name, "elan,ekth3000", 13) == 0))
>  			return true;
>  		break;
>  	}
> diff --git a/drivers/input/mouse/elan_i2c_core.c b/drivers/input/mouse/elan_i2c_core.c
> index f9525d6f0bfe..3ded19528cd4 100644
> --- a/drivers/input/mouse/elan_i2c_core.c
> +++ b/drivers/input/mouse/elan_i2c_core.c
> @@ -1332,6 +1332,10 @@ static const struct i2c_device_id elan_id[] = {
>  };
>  MODULE_DEVICE_TABLE(i2c, elan_id);
>  
> +/*
> + * when these whtielists get updated, the corresponding blacklist in hid-quirks
> + * needs to be updated to match.
> + */
>  #ifdef CONFIG_ACPI
>  static const struct acpi_device_id elan_acpi_id[] = {
>  	{ "ELAN0000", 0 },
> -- 
> 2.17.1
> 
