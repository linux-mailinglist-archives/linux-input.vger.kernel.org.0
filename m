Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02FD538CB8E
	for <lists+linux-input@lfdr.de>; Fri, 21 May 2021 19:08:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235107AbhEURJ6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 21 May 2021 13:09:58 -0400
Received: from mail-ot1-f42.google.com ([209.85.210.42]:44763 "EHLO
        mail-ot1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232635AbhEURJ4 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 21 May 2021 13:09:56 -0400
Received: by mail-ot1-f42.google.com with SMTP id r26-20020a056830121ab02902a5ff1c9b81so18633935otp.11;
        Fri, 21 May 2021 10:08:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=gv5FY4GNrqHPOt1jc/TntJsDohKJsY4vL+rkeXB1/Io=;
        b=BZQkXE70cJ4vNRg1tzYlYgrzPEmPWkDX8U/+xbwamCqpvhxurzYe9pid1xQuvsxos2
         Wc2JiqyhDDIJcot90Q65A7eIZKepB//TRtfqgIbT79h73O05QGz0/NGB8FYNjGZoraIw
         bj3Eq2/PT6RKFAb4NlzNczSqgY1bpi5LMm6BeD1djVT7OAYmIwuSytu/VgIJMT/o3lNB
         4dSSaOlFTkOzmjs53BSTP4yGpY77vHfNT2xMKEH97KhLEPUKMQGT9QwuI02FgghnyDhv
         izLa+ouEHIzRO/VD+Fizpcaq2MwLJvDElB5vHzCB3Fqt9fh++tZn+gMAuXOs8uoqxg/Y
         y1XA==
X-Gm-Message-State: AOAM533lnpEs/gpWbWlZYoC/6S6mVTiP9UWZRnGzJhtDaDQrulhsuuTB
        M6HU9loDfn//5pmoRrbnug==
X-Google-Smtp-Source: ABdhPJxJqO0prnxlhxWLxmLCFmZ8BDyH+Ovz4b4ynFpwpBhOf5B2tiUwcPa3famqJBaF9HJ4iZDEwg==
X-Received: by 2002:a9d:6016:: with SMTP id h22mr9003587otj.158.1621616912746;
        Fri, 21 May 2021 10:08:32 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id y44sm1308751ooi.0.2021.05.21.10.08.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 May 2021 10:08:31 -0700 (PDT)
Received: (nullmailer pid 15058 invoked by uid 1000);
        Fri, 21 May 2021 17:08:30 -0000
Date:   Fri, 21 May 2021 12:08:30 -0500
From:   Rob Herring <robh@kernel.org>
To:     Oleksij Rempel <o.rempel@pengutronix.de>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, David Jander <david@protonic.nl>,
        kernel@pengutronix.de
Subject: Re: [PATCH v5 1/8] dt-bindings: input: touchscreen: iqs626a: chnage
 node name to pass validation
Message-ID: <20210521170830.GA14903@robh.at.kernel.org>
References: <20210521044525.7397-1-o.rempel@pengutronix.de>
 <20210521044525.7397-2-o.rempel@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210521044525.7397-2-o.rempel@pengutronix.de>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, 21 May 2021 06:45:18 +0200, Oleksij Rempel wrote:
> Change node name from iqs626a -> touchscreen to pass dt_binding_check.
> 
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> ---
>  Documentation/devicetree/bindings/input/iqs626a.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
