Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C73141148BF
	for <lists+linux-input@lfdr.de>; Thu,  5 Dec 2019 22:39:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729859AbfLEVip (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 5 Dec 2019 16:38:45 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:35775 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729396AbfLEVio (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 5 Dec 2019 16:38:44 -0500
Received: by mail-oi1-f194.google.com with SMTP id k196so4226280oib.2;
        Thu, 05 Dec 2019 13:38:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=dJIsJIZ1CcDs5tf/N9HDCXbd0dM3ocarHkyOi8KtbOc=;
        b=JdrGqXvErrTx0AsT63Mkjm28s/Ltxiux2Ch7iOjXQEmdpT15ytf4cVFW66Q3HNXUWR
         h1ofhh+44sxUiKqi6+QQDqnlwzlWoG/J4bkwau3FU8dnog9i3vMLI/dXoiQuJTXKDzJr
         WCbrIrmYqEdw90SspPq5bMausP3uBoUnB/9ERq6XA1trWJAhhNXjmzjtXbJ1ICB4tgjD
         ZkQ9oO9sTQ/5zYwdjIUfz3+cdC2YL+irhz7tMBBrHGSVxEFEw3Cqf+xDSmq5Ir/FzUIJ
         y+doAv6LWe3kEtHpGFEKyB5mz9J37WTxYU2vft7Bx/VxqmsgR5xQTA9QgZDp5Zw2qyLh
         9piw==
X-Gm-Message-State: APjAAAXn20PGsKmES0GfGgekDyKEfbCbPFvnNX1Nk9FNMkBm5nTOeZZ5
        H4EUjmJJQi7drpoHwopLKQ==
X-Google-Smtp-Source: APXvYqwpR8kaUmjsip9VWWGkBYEkefnS7OA/lXukl9Y3gYx3Yk04faeDqqyraMRt51JbwE49ukSJOQ==
X-Received: by 2002:a05:6808:1c5:: with SMTP id x5mr2657591oic.57.1575581923543;
        Thu, 05 Dec 2019 13:38:43 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id w8sm2298446ote.80.2019.12.05.13.38.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2019 13:38:42 -0800 (PST)
Date:   Thu, 5 Dec 2019 15:38:42 -0600
From:   Rob Herring <robh@kernel.org>
To:     Marco Felsch <m.felsch@pengutronix.de>
Cc:     support.opensource@diasemi.com, stwiss.opensource@diasemi.com,
        dmitry.torokhov@gmail.com, Adam.Thomson.Opensource@diasemi.com,
        devicetree@vger.kernel.org, kernel@pengutronix.de,
        linux-input@vger.kernel.org
Subject: Re: [PATCH v2 3/3] dt-bindings: Input: da9062 - fix
 dlg,disable-key-power description
Message-ID: <20191205213842.GA5354@bogus>
References: <20191127132304.22924-1-m.felsch@pengutronix.de>
 <20191127132304.22924-4-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191127132304.22924-4-m.felsch@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Nov 27, 2019 at 02:23:04PM +0100, Marco Felsch wrote:
> There was a bug within the driver since commit f889beaaab1c ("Input:
> da9063 - report KEY_POWER instead of KEY_SLEEP during power
> key-press"). Since we fixed the bug the KEY_POWER will be reported
> always so we need to adapt the dt-bindings too. Make the description
> more precise while on it.
> 
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> ---
> v2:
> - change description according Dmitry's suggestion.
> 
>  Documentation/devicetree/bindings/input/da9062-onkey.txt | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/input/da9062-onkey.txt b/Documentation/devicetree/bindings/input/da9062-onkey.txt
> index 0005b2bdcdd7..9f895454179d 100644
> --- a/Documentation/devicetree/bindings/input/da9062-onkey.txt
> +++ b/Documentation/devicetree/bindings/input/da9062-onkey.txt
> @@ -15,9 +15,8 @@ Required properties:
>  
>  Optional properties:
>  
> -- dlg,disable-key-power : Disable power-down using a long key-press. If this
> -    entry exists the OnKey driver will remove support for the KEY_POWER key
> -    press when triggered using a long press of the OnKey.
> +- dlg,disable-key-power : If this property is present, the host will not be
> +    issuing shutdown command over I2C in response to a long key-press.

This seems odd. Typically a long key press is used when the system is 
locked up and would have to be a h/w mechanism. 

Also, the new wording sounds like s/w policy, not h/w configuration. 
What the OS does in response to KEY_POWER doesn't belong in DT.

>  
>  - dlg,key-opmode : Set the nONKEY behaviour. This value is initial set by the
>      otp values. See nONKEY_PIN register description for more information.
> -- 
> 2.20.1
> 
