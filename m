Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 168176F333
	for <lists+linux-input@lfdr.de>; Sun, 21 Jul 2019 14:28:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726247AbfGUM2C (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 21 Jul 2019 08:28:02 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:32788 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726188AbfGUM2C (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 21 Jul 2019 08:28:02 -0400
Received: by mail-lf1-f68.google.com with SMTP id x3so24728719lfc.0;
        Sun, 21 Jul 2019 05:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=B1cKEhyhimzgju0bCuAVL3nF3xEt7T8VCFfT02PNXdE=;
        b=ihZXwvoibzT1jMBqW65D0MxzA8TjCgeGPuz4PzcvTKVhNaHmrdbx/vOC8w0wNGK5wO
         hU8kIzMjliGoQYd7CMq/cGAHtAxL+VJyOlAC92fIfl8AmKgzyfEV803ZygrT1TLg/F1X
         dlSZhjR+soloIBQSTpg6Pm5r/7LqWx7DdhJjMt+YcVNw1cG3ra9d8XcHVi0UXeZlGip6
         4+4O0rR+vvPiBjvHNrx2etQt4BseTWuTQp9Yr4NzmVbLxFi0HuXTrsMTxhp6NxZveEWI
         aZWpKeP4Y6fXFBMQRy4NpdDpKuBg1e4jn0VB8qoKff2jBVop+Pnkw5tmy4wCxsG+ldfR
         FMkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=B1cKEhyhimzgju0bCuAVL3nF3xEt7T8VCFfT02PNXdE=;
        b=gspv/ECqaR6lkcDhyogpxmXeCERDV/OhKbYEI+6wj25h8WVsVBJ0on5SA3L+ldLo6Y
         ubPse/qDPSOjc4WkNde+LnF/CEboLw91kIwnj/fC5lL+91qeRwGINp4QZ2R59xUUgU25
         DMjH3eahZF6eSLVNehaj0BqZglJS6eJWdFFUurGdqBAqAblMgT5YfoSG0gkhrwo2YCOW
         On7trqTZHckQN31XYxLgAQcVyVkCSJwjrofNsPK0h6ot1jmRULJ7iEwFL0bDoPkkvne2
         s9ZNtx+4F9Gx4XYfOZQlsRFRnKKO0BSAB1S7apfPK9X2CpsuPV5molOrTUddHFeWi8J8
         boKQ==
X-Gm-Message-State: APjAAAU8KxI8fnr3epRKUSKF4+EJ7YhPRopS2bTg/Dg5jJsxS0gyKLHJ
        bmPvmihGYoPUPw4IRhBBOGA=
X-Google-Smtp-Source: APXvYqyXNbVUzmUbJGURfMkvPSMWhbC6ChBacKHX8FJ8dcG5/WOFc/Kg09AqX2hFKyh/lMKz+WGt+g==
X-Received: by 2002:ac2:4c84:: with SMTP id d4mr29129724lfl.1.1563712079264;
        Sun, 21 Jul 2019 05:27:59 -0700 (PDT)
Received: from localhost ([188.170.223.67])
        by smtp.gmail.com with ESMTPSA id w1sm5634104lfe.50.2019.07.21.05.27.58
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 21 Jul 2019 05:27:58 -0700 (PDT)
Date:   Sun, 21 Jul 2019 15:27:54 +0300
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Ronald =?iso-8859-1?Q?Tschal=E4r?= <ronald@innovation.ch>
Cc:     Federico Lorenzi <federico@travelground.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        kbuild test robot <lkp@intel.com>
Subject: Re: [PATCH v2] Input: applespi: fix warnings detected by sparse
Message-ID: <20190721122754.GA757@penguin>
References: <20190721081040.26197-1-ronald@innovation.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190721081040.26197-1-ronald@innovation.ch>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, Jul 21, 2019 at 01:10:40AM -0700, Ronald Tschalär wrote:
> Reported-by: kbuild test robot <lkp@intel.com>
> Signed-off-by: Ronald Tschalär <ronald@innovation.ch>

Applied, thank you.

> ---
> Changes in v2:
>   replaced min_t/max_t with plain min/max since both arguments are now
>   int's and don't need further casting
> 
>  drivers/input/keyboard/applespi.c | 18 +++++++++++-------
>  1 file changed, 11 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/input/keyboard/applespi.c b/drivers/input/keyboard/applespi.c
> index d5defdefbc34..cd140a92e731 100644
> --- a/drivers/input/keyboard/applespi.c
> +++ b/drivers/input/keyboard/applespi.c
> @@ -998,10 +998,14 @@ static inline int le16_to_int(__le16 x)
>  static void applespi_debug_update_dimensions(struct applespi_data *applespi,
>  					     const struct tp_finger *f)
>  {
> -	applespi->tp_dim_min_x = min_t(int, applespi->tp_dim_min_x, f->abs_x);
> -	applespi->tp_dim_max_x = max_t(int, applespi->tp_dim_max_x, f->abs_x);
> -	applespi->tp_dim_min_y = min_t(int, applespi->tp_dim_min_y, f->abs_y);
> -	applespi->tp_dim_max_y = max_t(int, applespi->tp_dim_max_y, f->abs_y);
> +	applespi->tp_dim_min_x = min(applespi->tp_dim_min_x,
> +				     le16_to_int(f->abs_x));
> +	applespi->tp_dim_max_x = max(applespi->tp_dim_max_x,
> +				     le16_to_int(f->abs_x));
> +	applespi->tp_dim_min_y = min(applespi->tp_dim_min_y,
> +				     le16_to_int(f->abs_y));
> +	applespi->tp_dim_max_y = max(applespi->tp_dim_max_y,
> +				     le16_to_int(f->abs_y));
>  }
>  
>  static int applespi_tp_dim_open(struct inode *inode, struct file *file)
> @@ -1653,8 +1657,8 @@ static void applespi_save_bl_level(struct applespi_data *applespi,
>  	efi_attr = EFI_VARIABLE_NON_VOLATILE | EFI_VARIABLE_BOOTSERVICE_ACCESS |
>  		   EFI_VARIABLE_RUNTIME_ACCESS;
>  
> -	sts = efivar_entry_set_safe(EFI_BL_LEVEL_NAME, efi_guid, efi_attr, true,
> -				    efi_data_len, &efi_data);
> +	sts = efivar_entry_set_safe((efi_char16_t *)EFI_BL_LEVEL_NAME, efi_guid,
> +				    efi_attr, true, efi_data_len, &efi_data);
>  	if (sts)
>  		dev_warn(&applespi->spi->dev,
>  			 "Error saving backlight level to EFI vars: %d\n", sts);
> @@ -2027,7 +2031,7 @@ static const struct acpi_device_id applespi_acpi_match[] = {
>  };
>  MODULE_DEVICE_TABLE(acpi, applespi_acpi_match);
>  
> -const struct dev_pm_ops applespi_pm_ops = {
> +static const struct dev_pm_ops applespi_pm_ops = {
>  	SET_SYSTEM_SLEEP_PM_OPS(applespi_suspend, applespi_resume)
>  	.poweroff_late	= applespi_poweroff_late,
>  };
> -- 
> 2.21.0
> 

-- 
Dmitry
