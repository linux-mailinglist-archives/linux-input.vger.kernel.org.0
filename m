Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0AC852D4B58
	for <lists+linux-input@lfdr.de>; Wed,  9 Dec 2020 21:13:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730664AbgLIUNV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 9 Dec 2020 15:13:21 -0500
Received: from mail-oi1-f195.google.com ([209.85.167.195]:35617 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729753AbgLIUNV (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 9 Dec 2020 15:13:21 -0500
Received: by mail-oi1-f195.google.com with SMTP id s2so3110104oij.2;
        Wed, 09 Dec 2020 12:13:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Ox2CZng1tZUgL0ZrBXL0V+yI79povfCvPDQE3h1EtMo=;
        b=nGz1Zd34ubINl+/kdeoMEDO8BiU2wZsUdlMRHTFTXK3MYO6Kw6niAtFU5K2H7E3Ssd
         5uCTGS1wyRE+Lf9xg+J2W4mecTrwSuN/bLT9c4jifgrmwdjNpCGT2wYlaQ68lhUUoOSM
         cLeoSvUcWg/diLIgUekJNB9bnLszQHgYEvZfvitSstdETS6u7y7ncjsx5BdvGmC5qAbB
         Y7tRT2xaPVKZmI1IXQVfZ3coOoEmWHKRfZcKDEOoSnYshnfXQUxA6WT8gJn8ptIbomYi
         wToIXFdeuhKK7jsnT45DLMjBL1NPt53+YAN0it5bjMSVhqRIW1MIYyOkZZ/u/G0SBIOa
         5xng==
X-Gm-Message-State: AOAM530Cgswbxmqn1GepkFOf152toirsKo0oQQfPOOex1Q6oW1TyP+Hr
        hDqg17IMba/lQAn6Th+M5w==
X-Google-Smtp-Source: ABdhPJzDHu5FdZ4saWrpXGhB64ttFVcgGXNvQ1Y23Ru/mNY6AZCBL3bdui5qA+FmpyNg2hWilrHY9w==
X-Received: by 2002:a05:6808:24d:: with SMTP id m13mr3126639oie.106.1607544760221;
        Wed, 09 Dec 2020 12:12:40 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id k3sm533139oor.19.2020.12.09.12.12.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Dec 2020 12:12:38 -0800 (PST)
Received: (nullmailer pid 863330 invoked by uid 1000);
        Wed, 09 Dec 2020 20:12:37 -0000
Date:   Wed, 9 Dec 2020 14:12:37 -0600
From:   Rob Herring <robh@kernel.org>
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: Input: tm2-touchkey - convert to yaml
Message-ID: <20201209201237.GA863279@robh.at.kernel.org>
References: <20201203131242.44397-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201203131242.44397-1-stephan@gerhold.net>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, 03 Dec 2020 14:12:40 +0100, Stephan Gerhold wrote:
> Convert the device tree bindings for tm2-touchkey to the YAML format.
> 
> While we're at it, clarify the descriptions a bit to make it clear that
> this driver can be used for many different MCUs that all implement
> a similar I2C protocol. Depending on the MCU the voltage requirements
> may be different, on some devices the controller uses 2.2V, 2.8V or
> even 3.3V for vcc-supply instead of 1.8V.
> 
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> ---
>  .../bindings/input/cypress,tm2-touchkey.txt   | 33 ---------
>  .../bindings/input/cypress,tm2-touchkey.yaml  | 68 +++++++++++++++++++
>  2 files changed, 68 insertions(+), 33 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/input/cypress,tm2-touchkey.txt
>  create mode 100644 Documentation/devicetree/bindings/input/cypress,tm2-touchkey.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
