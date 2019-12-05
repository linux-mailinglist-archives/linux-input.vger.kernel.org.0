Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 69F95114894
	for <lists+linux-input@lfdr.de>; Thu,  5 Dec 2019 22:18:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729417AbfLEVS1 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 5 Dec 2019 16:18:27 -0500
Received: from mail-oi1-f193.google.com ([209.85.167.193]:38440 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729187AbfLEVS1 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 5 Dec 2019 16:18:27 -0500
Received: by mail-oi1-f193.google.com with SMTP id b8so4155192oiy.5;
        Thu, 05 Dec 2019 13:18:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=tYgif7GN7P8l8jkg0Ttk3f4KFtSCCunH/d/+lt3YZBE=;
        b=NnNSvRp88yKz/5eFNMZ9NJXtgff9PEMB18tlVs/9ywui/FlIKhUzuv5m6PZMw5HPgY
         jbJC/t60mB2Hs2ZqhOoxV77x/g0NjX6BD5EBNr3kFUHqToD3W/KLLcfvVO3Am81nidP+
         WkNRni8XtnotAYtGhRe4S0JKfw9ZyuFWKvLOBB1JKjUPGUxx0QNJI1ZmVGKBgJldAzKy
         HwmZtZ8U9qNNfLe5+VRHLJ7RP3XtMqMpQt5om69LIegjd6nmDhe1bQoQwqa+QZ/vrveh
         gSaSmtRjMFRPwABEBiOqanyhS90/eVmEGGzN/pJ99U0NHLnRPneHiL5TPmuWVP+/uC+l
         KMJg==
X-Gm-Message-State: APjAAAUPtfbK1Zpkr4ODr/Pe7rjwme4kpBBoZloqS2UqFXDvZeh8Dg9I
        uQxWO6zsb2dnGEI3HgbvAg==
X-Google-Smtp-Source: APXvYqweNBLCxwVfgeo/tR1YLJcKfbD00QUF51wJndvJ1OdTcLeJ2jhIe/MBjZzZ7dGJfg4LCORjlA==
X-Received: by 2002:aca:510d:: with SMTP id f13mr9554494oib.107.1575580706133;
        Thu, 05 Dec 2019 13:18:26 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id m19sm3782999otn.47.2019.12.05.13.18.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2019 13:18:25 -0800 (PST)
Date:   Thu, 5 Dec 2019 15:18:25 -0600
From:   Rob Herring <robh@kernel.org>
To:     Lucas Stach <l.stach@pengutronix.de>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Nick Dyer <nick@shmanahar.org>, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, kernel@pengutronix.de,
        patchwork-lst@pengutronix.de
Subject: Re: [PATCH v2] Input: atmel_mxt_ts - allow specification of config
 name
Message-ID: <20191205211825.GA1201@bogus>
References: <20191127125456.9672-1-l.stach@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191127125456.9672-1-l.stach@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Nov 27, 2019 at 01:54:56PM +0100, Lucas Stach wrote:
> From: Nick Dyer <nick@shmanahar.org>
> 
> Signed-off-by: Nick Dyer <nick@shmanahar.org>
> ---
> v2: Switch to linux instead of atmel as vendor prefix.
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> ---
>  Documentation/devicetree/bindings/input/atmel,maxtouch.txt | 3 +++
>  drivers/input/touchscreen/atmel_mxt_ts.c                   | 6 +++++-
>  2 files changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/input/atmel,maxtouch.txt b/Documentation/devicetree/bindings/input/atmel,maxtouch.txt
> index c88919480d37..0764c7af045c 100644
> --- a/Documentation/devicetree/bindings/input/atmel,maxtouch.txt
> +++ b/Documentation/devicetree/bindings/input/atmel,maxtouch.txt
> @@ -31,6 +31,9 @@ Optional properties for main touchpad device:
>  
>  - reset-gpios: GPIO specifier for the touchscreen's reset pin (active low)
>  
> +- linux,cfg-name: Provide name of configuration file in OBP_RAW format. This
> +    will be downloaded from the firmware loader on probe to the device.
> +

We have a somewhat standard 'firmware-name' property for this purpose 
already. Use that.

Rob
