Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3C638160128
	for <lists+linux-input@lfdr.de>; Sun, 16 Feb 2020 00:41:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726477AbgBOXlr (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 15 Feb 2020 18:41:47 -0500
Received: from mail-pj1-f67.google.com ([209.85.216.67]:50565 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726275AbgBOXlr (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 15 Feb 2020 18:41:47 -0500
Received: by mail-pj1-f67.google.com with SMTP id r67so5577944pjb.0;
        Sat, 15 Feb 2020 15:41:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=k8h/WbvyrPm1yFlznXkRKTf5oxTK9T7a5TL8DOtCHCo=;
        b=mc+dsjb1MofAqYvNAqFo966hT6+Z7APDGs6MPtwbLQXAi4+sfsyrU1Pn8ElnUqvC3s
         VxuOzQ1cEgtgngwyGgHm5itLOTc9zs9uMm6QAvh/vqFy4KjfMGp3/BdXPzqaCNu3Aker
         zo2AdqjtUbODV6bsT8L+kwerO3e+isJwdAB5l/PqI6Jm0wV+9txUS+0GwFSqVl10YYP9
         3DM43vcfLjW/QcctXuQLw1OPGqXAcVpjevXUE7m2mq4jDAYnHmwCjY8yurWBIz98rpdR
         aK9Bz9dFzeL+QAjWiiFA+8mKawGTUBfO/R83e3ZYsgWkkOo/NX3YrKzpYFmZ/ct/eW35
         4S7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=k8h/WbvyrPm1yFlznXkRKTf5oxTK9T7a5TL8DOtCHCo=;
        b=s2EuREOqyLIPaGGN9ya2Ubm2yvcFyAbB2EhzwXqU4+wC83CzxoilRjhXkIHc1u/fnK
         /IbVzW8o3FTesdbu236jx6IT4IIaGCrxvthgwVt45DS4ZMtEkRiRVvLsyG4rRWK0w8ia
         EmOAZo4f8ghoCJFGJkc3/qnNuYnihN0DtDAQ54dGViTXRuUOIk6tSB2OS5cLra2c1d3h
         9jfqnrkAINZ3MtGY68I8KjsoFX2e9QKpWZ/qCL0yYo+CcHW4T6TXOk3PNUrvyxu1vbyz
         ncED+F/FUXer+v7i3tPETqWx67SR+BeQbxmLmbZmxjH1tqGZ/v+y0f1dbIMUb2LI3obV
         3zEg==
X-Gm-Message-State: APjAAAX/4nFjkbwpbXPQ6pfVDgCPk8OsYgxrNVpGO9SRyjk8t9pODHGG
        Wx49UoC5eMcbe4HTdK4rk+kcaVuj
X-Google-Smtp-Source: APXvYqxWxivIyh6KzcZFGq4lk5I02UhJqkzYrICbCetJc9BptphXNCzs5clJl3I+HucPYKFDvPQRNA==
X-Received: by 2002:a17:902:7484:: with SMTP id h4mr9424253pll.206.1581810106172;
        Sat, 15 Feb 2020 15:41:46 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id b5sm11584391pfb.179.2020.02.15.15.41.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Feb 2020 15:41:45 -0800 (PST)
Date:   Sat, 15 Feb 2020 15:41:43 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Nick Reitemeyer <nick.reitemeyer@web.de>
Cc:     robh+dt@kernel.org, stephan@gerhold.net,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/3] dt-bindings: input: add Coreriver TC360 binding
Message-ID: <20200215234143.GJ183709@dtor-ws>
References: <20200121141525.3404-1-nick.reitemeyer@web.de>
 <20200121141525.3404-2-nick.reitemeyer@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200121141525.3404-2-nick.reitemeyer@web.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Jan 21, 2020 at 03:15:25PM +0100, Nick Reitemeyer wrote:
> Signed-off-by: Nick Reitemeyer <nick.reitemeyer@web.de>

Applied, thank you.

> ---
>  Documentation/devicetree/bindings/input/cypress,tm2-touchkey.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/input/cypress,tm2-touchkey.txt b/Documentation/devicetree/bindings/input/cypress,tm2-touchkey.txt
> index ef2ae729718f..921172f689b8 100644
> --- a/Documentation/devicetree/bindings/input/cypress,tm2-touchkey.txt
> +++ b/Documentation/devicetree/bindings/input/cypress,tm2-touchkey.txt
> @@ -5,6 +5,7 @@ Required properties:
>      * "cypress,tm2-touchkey" - for the touchkey found on the tm2 board
>      * "cypress,midas-touchkey" - for the touchkey found on midas boards
>      * "cypress,aries-touchkey" - for the touchkey found on aries boards
> +    * "coreriver,tc360-touchkey" - for the Coreriver TouchCore 360 touchkey
>  - reg: I2C address of the chip.
>  - interrupts: interrupt to which the chip is connected (see interrupt
>  	binding[0]).
> --
> 2.23.0
> 

-- 
Dmitry
