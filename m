Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C432E3AA2C5
	for <lists+linux-input@lfdr.de>; Wed, 16 Jun 2021 19:59:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231374AbhFPSBm (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 16 Jun 2021 14:01:42 -0400
Received: from mail-il1-f170.google.com ([209.85.166.170]:44752 "EHLO
        mail-il1-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231132AbhFPSBm (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 16 Jun 2021 14:01:42 -0400
Received: by mail-il1-f170.google.com with SMTP id i17so3074804ilj.11;
        Wed, 16 Jun 2021 10:59:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=j9SmZxPSI2qUfWBcun3ygFdWzUnGyDuFt5UnogfIBwE=;
        b=gBCfxGhxDzaTp1j3tpYssIJNfe1zm+lp7z6kkNJJ/qC6/Zspm9wcSXChPzqeJ0jqnw
         IcDxjGY2pIzjhhzgIsDCO5BGj3m61R9N4TSsvXbxpeIjXYwD8E8igtTGjUa6zrAwjRPx
         cm/jhdNxGJ3zaK4EJb3QNC76uT4bqkgMmHwbZ4lnfque79n2u/mp2SdnlsMxqCNg+qqY
         LVbThDL0GhjqKOGO+vmiUe0/APpAyZHR0RyajEUyv7D3fKWNf63s/8ZScNtbcjl21Zww
         SEciz5Mu5fnfAOjqThNSAReTJcpvy3OZQ0eqSLFnb0Hyi0Y6PBFgzdB9KWjH5kx6o4UH
         LIAA==
X-Gm-Message-State: AOAM531ES3GXn4SAH/Xx0VV6C75PDYpCFQTR9yeJqrDDw3hTbZjnHCwe
        9INezeyDvQjXP9ALUaRRXg==
X-Google-Smtp-Source: ABdhPJyvs049QViHsiiDRXycQt85Q1vCcx2xRfD8GKvhUHQzV+YRljkf9/kctzPqq53psMMyJ7c30Q==
X-Received: by 2002:a05:6e02:1be1:: with SMTP id y1mr643472ilv.204.1623866374432;
        Wed, 16 Jun 2021 10:59:34 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id r8sm1476111ile.25.2021.06.16.10.59.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jun 2021 10:59:33 -0700 (PDT)
Received: (nullmailer pid 3620651 invoked by uid 1000);
        Wed, 16 Jun 2021 17:59:30 -0000
Date:   Wed, 16 Jun 2021 11:59:30 -0600
From:   Rob Herring <robh@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Martin Kepplinger <martink@posteo.de>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org, Bastian Hecht <hechtb@gmail.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: input: touchscreen: st1232: Convert to
 json-schema
Message-ID: <20210616175930.GA3620599@robh.at.kernel.org>
References: <fbba650cff07780c28ad6dd8dbef5cc1451b7762.1623418065.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fbba650cff07780c28ad6dd8dbef5cc1451b7762.1623418065.git.geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, 11 Jun 2021 15:30:05 +0200, Geert Uytterhoeven wrote:
> Convert the Sitronix st1232/st1633 touchscreen controller Device Tree
> binding documentation to json-schema.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  .../input/touchscreen/sitronix,st1232.yaml    | 50 +++++++++++++++++++
>  .../input/touchscreen/sitronix-st1232.txt     | 28 -----------
>  2 files changed, 50 insertions(+), 28 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/input/touchscreen/sitronix,st1232.yaml
>  delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/sitronix-st1232.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
