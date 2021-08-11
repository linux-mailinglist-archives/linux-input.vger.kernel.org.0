Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 988943E9749
	for <lists+linux-input@lfdr.de>; Wed, 11 Aug 2021 20:06:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229648AbhHKSHI (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 11 Aug 2021 14:07:08 -0400
Received: from mail-pj1-f49.google.com ([209.85.216.49]:55096 "EHLO
        mail-pj1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229554AbhHKSHI (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 11 Aug 2021 14:07:08 -0400
Received: by mail-pj1-f49.google.com with SMTP id a8so4768194pjk.4;
        Wed, 11 Aug 2021 11:06:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=InCwnR51mhYB4E8EhP6qF+LsmExS4gwygQKBIG26mbo=;
        b=nODUsSfKtgil7vhy70E1Q6vL2LoBSe0BzjU4CVmuTwQBaKxV5Pfr/Nd/JRrbELUpw8
         JbZXEEV54QGe5i/Zsly0hIGpDd1iQ4WpbpvFXRt9gnXXRILFMbz3+8jVEWBqLhony7Wz
         6wlrZNQ5aG9Bf6ylEpMBPeO9mJNn9O95OGvxoWi1XQMPy7EX8v4jEuEaDZbH3XT5xhsI
         GYa48tDurjbxchIUAFrOse/GK71R14huFxPVzKLMcznOrt3KM7RMoYtnSXG+faZTTYiP
         4ALRziYZj/MMkLFce/o35uIzxMocVAzoRdomb883y6k3rmEnODCr80DVEFjEXUFzzZUs
         i8vw==
X-Gm-Message-State: AOAM533ZTne+gU/TCNANXP1HJWR0M2w9FMGa8NsYfvFkKlMDgfLXe0iN
        XXi+TheV4UZfhKbcorc2Rw==
X-Google-Smtp-Source: ABdhPJwXJr904DXPTsvI2aiOug1y9C/rDbsboiLSAATej1MPvjezsVzOC6RW3PaQAmyRKXFBD5vVNQ==
X-Received: by 2002:a17:90a:1957:: with SMTP id 23mr11810179pjh.147.1628705204296;
        Wed, 11 Aug 2021 11:06:44 -0700 (PDT)
Received: from robh.at.kernel.org ([208.184.162.215])
        by smtp.gmail.com with ESMTPSA id c11sm102252pji.24.2021.08.11.11.06.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Aug 2021 11:06:43 -0700 (PDT)
Received: (nullmailer pid 7687 invoked by uid 1000);
        Wed, 11 Aug 2021 18:06:39 -0000
Date:   Wed, 11 Aug 2021 12:06:39 -0600
From:   Rob Herring <robh@kernel.org>
To:     Alistair Francis <alistair@alistair23.me>
Cc:     kernel@pengutronix.de, pinglinux@gmail.com, robh+dt@kernel.org,
        junkpainting@gmail.com, linux-input@vger.kernel.org,
        ping.cheng@wacom.com, dmitry.torokhov@gmail.com,
        alistair23@gmail.com, tatsunosuke.tobita@wacom.com,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-imx@nxp.com
Subject: Re: [PATCH v8 2/9] dt-bindings: touchscreen: Initial commit of
 wacom,i2c
Message-ID: <YRQRr2ieRyqYDIC5@robh.at.kernel.org>
References: <20210803084902.336-1-alistair@alistair23.me>
 <20210803084902.336-2-alistair@alistair23.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210803084902.336-2-alistair@alistair23.me>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, 03 Aug 2021 18:48:55 +1000, Alistair Francis wrote:
> Signed-off-by: Alistair Francis <alistair@alistair23.me>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: devicetree@vger.kernel.org
> ---
>  .../input/touchscreen/wacom,generic.yaml      | 48 +++++++++++++++++++
>  1 file changed, 48 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/input/touchscreen/wacom,generic.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
