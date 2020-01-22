Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5B724144B85
	for <lists+linux-input@lfdr.de>; Wed, 22 Jan 2020 06:57:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725836AbgAVF5K (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 22 Jan 2020 00:57:10 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:35967 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725796AbgAVF5J (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 22 Jan 2020 00:57:09 -0500
Received: by mail-pg1-f194.google.com with SMTP id k3so2872684pgc.3;
        Tue, 21 Jan 2020 21:57:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=7lz8QDCK+adReavpCqjYdLG3ej8deDQg9uk+KtG0Ghs=;
        b=iPDYK4I1iNLSsOvGa8JcN1j0z+wUsun8dgZ/ZmoOc2bRQtwc8xZzfHG8CJt6Vh24Wa
         /dzFoCtKgqxmuNUFZqLDsvRbJnM/mxXS3CxI0N7XZI49zcxuDRiBwj1oKzFyQuTdUbkV
         0BoDXUR8trVrs5CRoLi7ru37+SPbBNbRFW5oxyPUSSd+bs2mg89TKm/OReoE4+R9ZvSH
         URDFasc3DRgC9hZOgY6DBoLJfzPhaVB6QGxKzweoShu9hgBK5yVWLwF7pO9yagp2Iti5
         6Wq8XPr3K7K9n8UmwtEPFmPCnHZ48meuQU0PHG02Vkc0xbU8OpYdmjmVqLkXySaBMZx5
         nvNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=7lz8QDCK+adReavpCqjYdLG3ej8deDQg9uk+KtG0Ghs=;
        b=EdSRuYoF5u08X7KBz5Fi2ifGqx9TLCs1t6iJrOHxw3fPHSrW9WoFJ4POB65/ByoWQ0
         ayr82tDRFmx4wVlyutz+Gzxf25Mx+h6NyHyGNDy6Kk0hJ7yuKO+HdQPBHufPPVFrSaSH
         vaOHkGIkvrR6urp9N84bPD94DGH4SJ9BnylBAErcS3WdQTkxNS8AndAydh5GlgmMfXrf
         qoVU6sv0srI6SdNQTKSEPYP6rH2c8LTL70/bgoHyYhgjuilb2QE8czSjVeIIHHR/G4Xx
         M1nbOoe9ENzneuI7+v7W5HAidYzLfZ6kAw0C/zHvyQoUReWM0cDYDXM80umedvGHfr7n
         edYw==
X-Gm-Message-State: APjAAAUMgkVqWCCfh/aXG9gOHQY82THvYdp0mh+/F/42sFN64w4sM9CX
        5WK7m40abai8xmKAA0oYMgQ=
X-Google-Smtp-Source: APXvYqxBwlbIYvMKS8qqbZPOygBixGBUbdiN4i6TVDv/KNDOweI9oUOYKvPJSYDOv4rLoPXOf4R2cQ==
X-Received: by 2002:a63:4006:: with SMTP id n6mr9165683pga.139.1579672629032;
        Tue, 21 Jan 2020 21:57:09 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id p24sm44839589pff.69.2020.01.21.21.57.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2020 21:57:08 -0800 (PST)
Date:   Tue, 21 Jan 2020 21:57:06 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Marco Felsch <m.felsch@pengutronix.de>, robh+dt@kernel.org
Cc:     support.opensource@diasemi.com, stwiss.opensource@diasemi.com,
        Adam.Thomson.Opensource@diasemi.com, devicetree@vger.kernel.org,
        kernel@pengutronix.de, linux-input@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: Input: da9062 - add key-opmode
 documentation
Message-ID: <20200122055706.GB110084@dtor-ws>
References: <20191127132304.22924-1-m.felsch@pengutronix.de>
 <20191127132304.22924-2-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191127132304.22924-2-m.felsch@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Nov 27, 2019 at 02:23:02PM +0100, Marco Felsch wrote:
> The onkey behaviour can be changed by programming the NONKEY_PIN
> bitfield. Since the driver supports the reconfiguration we need to add
> the documentation here.
> 
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> ---
> v2:
> - add da9061/3 references
> - adapt binding description to be more general
> 
>  .../devicetree/bindings/input/da9062-onkey.txt         | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/input/da9062-onkey.txt b/Documentation/devicetree/bindings/input/da9062-onkey.txt
> index 5f9fbc68e58a..0005b2bdcdd7 100644
> --- a/Documentation/devicetree/bindings/input/da9062-onkey.txt
> +++ b/Documentation/devicetree/bindings/input/da9062-onkey.txt
> @@ -19,6 +19,16 @@ Optional properties:
>      entry exists the OnKey driver will remove support for the KEY_POWER key
>      press when triggered using a long press of the OnKey.
>  
> +- dlg,key-opmode : Set the nONKEY behaviour. This value is initial set by the
> +    otp values. 

Did you mean to say "nONKEY behavior is normally specified in OTP
settings; this property allows modifying it".

Rob, do you have any comments?

> See nONKEY_PIN register description for more information.
> +    Valid value range: 0x0..0x3
> +
> +References:
> +
> +[1] https://www.dialog-semiconductor.com/sites/default/files/da9061_datasheet_3v6.pdf
> +[2] https://www.dialog-semiconductor.com/sites/default/files/da9062_datasheet_3v6.pdf
> +[3] https://www.dialog-semiconductor.com/sites/default/files/da9063_datasheet_2v2.pdf
> +
>  Example: DA9063
>  
>  	pmic0: da9063@58 {
> -- 
> 2.20.1
> 

-- 
Dmitry
