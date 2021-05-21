Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F3BD38CB90
	for <lists+linux-input@lfdr.de>; Fri, 21 May 2021 19:09:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232635AbhEURK1 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 21 May 2021 13:10:27 -0400
Received: from mail-ot1-f42.google.com ([209.85.210.42]:44817 "EHLO
        mail-ot1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229532AbhEURK0 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 21 May 2021 13:10:26 -0400
Received: by mail-ot1-f42.google.com with SMTP id r26-20020a056830121ab02902a5ff1c9b81so18635162otp.11;
        Fri, 21 May 2021 10:09:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=mRJIYEvwSU5XAcjia2ddVCeXSmZI9BsiVAypzVL9ZFA=;
        b=UOlBzbV0wwDLQho9mcRhihvJOhF79wqqz5cITEFzpRRrMzMUYFeB5x9n4os/raXkSS
         /vTgGLze163CIZpWa3A+uhFFEH9TJWq41mVtGWFdg0tg4X1mhGpB7xRUmfIAb5PELRDz
         G9nI/p8j7kG+3L5cPs5Lb10kjosGnd87zZi2YNPdGsJaC9cYDjYz752f6wbGgXAV2cuC
         ZaQu+xsvvWNhlb2TFRaGcFCU4+7zD0aoyX5+0hetFYVOMGWHm1E2O2i/u/nZfFU4eu1G
         HR2NqwtftvofluUlYlDdfEssLebHLZh8dReT/eFSOifZnI454hrQCLOKyFSspq3E+x66
         mYRw==
X-Gm-Message-State: AOAM5310nv8W3m4+x+3xgnMuK4wYaChraz7XH1M75GDzrUKasz3jxWJd
        xsBz5DGRMnZctU+7si+K/g==
X-Google-Smtp-Source: ABdhPJwtUqDJ5/VPbVrfbwlUlQpmxXYNu9jVAKElMnrMCOF86tGp34DKHQz9r0BHtRENHveKE6zO2A==
X-Received: by 2002:a9d:7410:: with SMTP id n16mr9138150otk.262.1621616942123;
        Fri, 21 May 2021 10:09:02 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id e21sm1256965oie.32.2021.05.21.10.09.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 May 2021 10:09:01 -0700 (PDT)
Received: (nullmailer pid 16080 invoked by uid 1000);
        Fri, 21 May 2021 17:09:00 -0000
Date:   Fri, 21 May 2021 12:09:00 -0500
From:   Rob Herring <robh@kernel.org>
To:     Oleksij Rempel <o.rempel@pengutronix.de>
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        linux-kernel@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        kernel@pengutronix.de, David Jander <david@protonic.nl>
Subject: Re: [PATCH v5 2/8] dt-bindings: input: touchscreen: edt-ft5x06:
 chnage node name to pass validation
Message-ID: <20210521170900.GA16008@robh.at.kernel.org>
References: <20210521044525.7397-1-o.rempel@pengutronix.de>
 <20210521044525.7397-3-o.rempel@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210521044525.7397-3-o.rempel@pengutronix.de>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, 21 May 2021 06:45:19 +0200, Oleksij Rempel wrote:
> Change node name from edt-ft5x06 -> touchscreen to pass dt_binding_check.
> 
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> ---
>  .../devicetree/bindings/input/touchscreen/edt-ft5x06.yaml       | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
