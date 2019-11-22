Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 57106107AE8
	for <lists+linux-input@lfdr.de>; Fri, 22 Nov 2019 23:52:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726962AbfKVWwl (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 22 Nov 2019 17:52:41 -0500
Received: from mail-pj1-f66.google.com ([209.85.216.66]:35929 "EHLO
        mail-pj1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726568AbfKVWwl (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 22 Nov 2019 17:52:41 -0500
Received: by mail-pj1-f66.google.com with SMTP id cq11so3676436pjb.3;
        Fri, 22 Nov 2019 14:52:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=KqM5iPDN4K5n0vOL0Et0dfmAMXqLC1jgBto0uNn5I+I=;
        b=nT4RzoWffNirIVHD+k3AoR3jPcigWNI8cs69VTmyyfPAqllko0D0LB1T4WsU2gp7u7
         yjibnWfSS38p0mXjGy6+3/+Wz2rnl6mSzQJ5l/bNDVYfcSTl1L0c35KUjqUHcSQKK/s4
         oKyrP7i804n34UCDWcLUY6P0Mr4La2OQ8/Rrh/oBGHJYCkCnQ9pR6KElTuc4R0sTotYN
         KjSO/TI0S0XXE6P1ePFkbF+f1SHgU03+SZMlIzBTiYCBZCbDb2gDlECBEWne+rikQ+Fw
         vka0iASMAwwEY2QtqEHgvLiKdN2vtlZsUK3+2hMv737dzQctR6DnAxbl+qWShvI6766p
         kjCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=KqM5iPDN4K5n0vOL0Et0dfmAMXqLC1jgBto0uNn5I+I=;
        b=mCgDDCzG0MVM1sMmY4qlmGg7g3vzthQlsN6OTych7vvRJNG/1U0oc6WZaES8QVA6dg
         Mitaw/QzuktfXusWE68wCm1my/UHfbs1cO6nhvb45ur8/MEVlRx9nBBK0oJadFSpGI6p
         1uA1wdFPBRVWypHAxqM4vrVlQjSLDzHBNiFALKcOmUb4OpZZpK5yibkPNs67mYBfPHSa
         nJNYpZjI4NnN3bE4H1OzxxHa5uE7h21cNzU7g5wQOO3bUvrl694Qx+I13RjYrN6Bay5U
         YoJmasNIVbeGRKESjKhtZJQ604OFGQUaTrSKdwBDtzH8FNs+RG9REtkKO7njmnRPNwpN
         Akzw==
X-Gm-Message-State: APjAAAWvX4vHCt9UgdvVTumhupTmx7kCTAhnPpHozu7gbP2JdjFw0+7E
        7H8Xq3HDo2mA7w8GNGekAAk=
X-Google-Smtp-Source: APXvYqzHGYsvlvIlKOWXxmXQ/n+f31h6kTXpNYONm7vKFFte1cBdWGHOA7EXIpRz9LHIbJelFVRaWg==
X-Received: by 2002:a17:902:8bc9:: with SMTP id r9mr15683900plo.319.1574463158932;
        Fri, 22 Nov 2019 14:52:38 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id u18sm8228877pfn.183.2019.11.22.14.52.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2019 14:52:38 -0800 (PST)
Date:   Fri, 22 Nov 2019 14:52:36 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject: Re: [PATCH v2] input: Fix Kconfig indentation
Message-ID: <20191122225236.GF248138@dtor-ws>
References: <1574306373-29581-1-git-send-email-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1574306373-29581-1-git-send-email-krzk@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Nov 21, 2019 at 04:19:33AM +0100, Krzysztof Kozlowski wrote:
> Adjust indentation from spaces to tab (+optional two spaces) as in
> coding style with command like:
> 	$ sed -e 's/^        /\t/' -i */Kconfig
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> 

Applied, thank you.

> ---
> 
> Changes since v1:
> 1. Fix also 7-space and tab+1 space indentation issues.
> ---
>  drivers/input/keyboard/Kconfig    | 16 ++++++++--------
>  drivers/input/mouse/Kconfig       | 16 ++++++++--------
>  drivers/input/tablet/Kconfig      | 20 ++++++++++----------
>  drivers/input/touchscreen/Kconfig |  2 +-
>  4 files changed, 27 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/input/keyboard/Kconfig b/drivers/input/keyboard/Kconfig
> index 1ddfc2413035..36067ed1160d 100644
> --- a/drivers/input/keyboard/Kconfig
> +++ b/drivers/input/keyboard/Kconfig
> @@ -167,14 +167,14 @@ config KEYBOARD_QT1050
>  	  the module will be called qt1050
>  
>  config KEYBOARD_QT1070
> -       tristate "Atmel AT42QT1070 Touch Sensor Chip"
> -       depends on I2C
> -       help
> -         Say Y here if you want to use Atmel AT42QT1070 QTouch
> -         Sensor chip as input device.
> -
> -         To compile this driver as a module, choose M here:
> -         the module will be called qt1070
> +	tristate "Atmel AT42QT1070 Touch Sensor Chip"
> +	depends on I2C
> +	help
> +	 Say Y here if you want to use Atmel AT42QT1070 QTouch
> +	 Sensor chip as input device.
> +
> +	 To compile this driver as a module, choose M here:
> +	 the module will be called qt1070
>  
>  config KEYBOARD_QT2160
>  	tristate "Atmel AT42QT2160 Touch Sensor Chip"
> diff --git a/drivers/input/mouse/Kconfig b/drivers/input/mouse/Kconfig
> index bf738d3b7fe4..6e1ff481c977 100644
> --- a/drivers/input/mouse/Kconfig
> +++ b/drivers/input/mouse/Kconfig
> @@ -92,14 +92,14 @@ config MOUSE_PS2_SYNAPTICS_SMBUS
>  	  If unsure, say Y.
>  
>  config MOUSE_PS2_CYPRESS
> -       bool "Cypress PS/2 mouse protocol extension" if EXPERT
> -       default y
> -       depends on MOUSE_PS2
> -       help
> -         Say Y here if you have a Cypress PS/2 Trackpad connected to
> -         your system.
> -
> -         If unsure, say Y.
> +	bool "Cypress PS/2 mouse protocol extension" if EXPERT
> +	default y
> +	depends on MOUSE_PS2
> +	help
> +	 Say Y here if you have a Cypress PS/2 Trackpad connected to
> +	 your system.
> +
> +	 If unsure, say Y.
>  
>  config MOUSE_PS2_LIFEBOOK
>  	bool "Fujitsu Lifebook PS/2 mouse protocol extension" if EXPERT
> diff --git a/drivers/input/tablet/Kconfig b/drivers/input/tablet/Kconfig
> index e4c0d9a055b9..51c339182017 100644
> --- a/drivers/input/tablet/Kconfig
> +++ b/drivers/input/tablet/Kconfig
> @@ -39,16 +39,16 @@ config TABLET_USB_AIPTEK
>  	  module will be called aiptek.
>  
>  config TABLET_USB_GTCO
> -        tristate "GTCO CalComp/InterWrite USB Support"
> -        depends on USB && INPUT
> -        help
> -          Say Y here if you want to use the USB version of the GTCO
> -          CalComp/InterWrite Tablet.  Make sure to say Y to "Mouse support"
> -          (CONFIG_INPUT_MOUSEDEV) and/or "Event interface support"
> -          (CONFIG_INPUT_EVDEV) as well.
> -
> -          To compile this driver as a module, choose M here: the
> -          module will be called gtco.
> +	tristate "GTCO CalComp/InterWrite USB Support"
> +	depends on USB && INPUT
> +	help
> +	  Say Y here if you want to use the USB version of the GTCO
> +	  CalComp/InterWrite Tablet.  Make sure to say Y to "Mouse support"
> +	  (CONFIG_INPUT_MOUSEDEV) and/or "Event interface support"
> +	  (CONFIG_INPUT_EVDEV) as well.
> +
> +	  To compile this driver as a module, choose M here: the
> +	  module will be called gtco.
>  
>  config TABLET_USB_HANWANG
>  	tristate "Hanwang Art Master III tablet support (USB)"
> diff --git a/drivers/input/touchscreen/Kconfig b/drivers/input/touchscreen/Kconfig
> index 40bfc551ce30..c071f7c407b6 100644
> --- a/drivers/input/touchscreen/Kconfig
> +++ b/drivers/input/touchscreen/Kconfig
> @@ -633,7 +633,7 @@ config TOUCHSCREEN_HP600
>  	depends on SH_HP6XX && SH_ADC
>  	help
>  	  Say Y here if you have a HP Jornada 620/660/680/690 and want to
> -          support the built-in touchscreen.
> +	  support the built-in touchscreen.
>  
>  	  To compile this driver as a module, choose M here: the
>  	  module will be called hp680_ts_input.
> -- 
> 2.7.4
> 

-- 
Dmitry
