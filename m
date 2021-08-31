Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A07733FCF5A
	for <lists+linux-input@lfdr.de>; Tue, 31 Aug 2021 23:54:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238832AbhHaVz3 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 31 Aug 2021 17:55:29 -0400
Received: from mail-ot1-f52.google.com ([209.85.210.52]:37863 "EHLO
        mail-ot1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239498AbhHaVzX (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 31 Aug 2021 17:55:23 -0400
Received: by mail-ot1-f52.google.com with SMTP id i3-20020a056830210300b0051af5666070so1031377otc.4;
        Tue, 31 Aug 2021 14:54:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=jDa4J/9Iso8BAY19kTwzliXbM11r3W2hAim2XtLSYUM=;
        b=DDQwDwK9Zx/IEp6UrrGyL/gSs7lSrbVGEx8PuJXbD06tpNwc/fsW99ePQ9hVVmsWpS
         60oxQ2trHk9RvLWaRewoS7fxyhh9mOZOzjTjXfrjp7YoWe0D+QJpvI8ZIUhFHWY3uqoQ
         pkrvRefS7+HurF0Ym/oEJvufPOhgC3JA8PMx85LhIOtSrAdksUzWjIGbZEmbbuSw5+lA
         9vtp06Eoj3D438fE2T94i+9qvJdt7r7JFxBA/3wlEJYHHHit1vhzM8/DhjFXOm5gNGW2
         RKvhH9d6Vhn5alKTwY+1U2mx8T7U5PN16Yc4yq1yUQoTB0b5DWtgvayRZhW+2JH9y6WD
         mvTg==
X-Gm-Message-State: AOAM530ENZb4HisrATB6nlH9UppRjEJomRnJmMqjXj9vircQHrUeGKWr
        //fUABn4UVmRpDCkEfq8Wg==
X-Google-Smtp-Source: ABdhPJyXpKQQuBRQ0F/izfjc97+0wEDpby5kR3nVWrb6JGg4oww0TI1CM9Mov4iS4vFLYJ0sT9nIUQ==
X-Received: by 2002:a9d:6e91:: with SMTP id a17mr24946060otr.372.1630446867646;
        Tue, 31 Aug 2021 14:54:27 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id b11sm3817099ooi.0.2021.08.31.14.54.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Aug 2021 14:54:27 -0700 (PDT)
Received: (nullmailer pid 710732 invoked by uid 1000);
        Tue, 31 Aug 2021 21:54:26 -0000
Date:   Tue, 31 Aug 2021 16:54:26 -0500
From:   Rob Herring <robh@kernel.org>
To:     Alistair Francis <alistair@alistair23.me>
Cc:     alistair23@gmail.com, linux-input@vger.kernel.org,
        dmitry.torokhov@gmail.com, devicetree@vger.kernel.org,
        robh+dt@kernel.org, pinglinux@gmail.com, linux-imx@nxp.com,
        ping.cheng@wacom.com, linux-kernel@vger.kernel.org,
        junkpainting@gmail.com, kernel@pengutronix.de,
        tatsunosuke.tobita@wacom.com
Subject: Re: [PATCH v10 10/12] Input: wacom_i2c - Allow flipping the values
 from the DT
Message-ID: <YS6lEgg4hvnLLXQu@robh.at.kernel.org>
References: <20210829091925.190-1-alistair@alistair23.me>
 <20210829091925.190-12-alistair@alistair23.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210829091925.190-12-alistair@alistair23.me>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, 29 Aug 2021 19:19:23 +1000, Alistair Francis wrote:
> Allow the device tree properties to flip the tilx, position or distance
> values.
> 
> This is required for the stylus to work correctly on the reMarkable 2.
> 
> Signed-off-by: Alistair Francis <alistair@alistair23.me>
> ---
>  .../input/touchscreen/wacom,generic.yaml      | 20 +++++++++++
>  drivers/input/touchscreen/wacom_i2c.c         | 34 +++++++++++++++++++
>  2 files changed, 54 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
