Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 12804B4171
	for <lists+linux-input@lfdr.de>; Mon, 16 Sep 2019 21:56:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732775AbfIPT41 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 16 Sep 2019 15:56:27 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:38490 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728008AbfIPT41 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 16 Sep 2019 15:56:27 -0400
Received: by mail-pg1-f193.google.com with SMTP id x10so594010pgi.5;
        Mon, 16 Sep 2019 12:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=kQEsiVEiaXpNZY5fpwE1Qp/W2i/qX19rknZb5cNLoUE=;
        b=R8MWGpA3R6UCrCY//+ZpStP0kWamJwfCPeq+CjS/WCzsXm+T2SRbaYzGPt1G542q9R
         JDgmLxObE6B4jy7Ba1uePWVSg/04V55oQ5jOrsTMaMfwbp18EnctFKTY1QvwDN0iqFBr
         6QL4TBt8npzWCVUOhikFrmO8GiB1KGGLYVpGjAleIF0xRZGUY1FOP13fDzjytoxLReHP
         cSdWoqBdfseSuepJkni5/BIU+wEhVyc03KGX5f7+BQduhoIsndZp18enHUx6s5zCO2EP
         zH+WQ10olOBnKZhbobebANSptpJEIoqCzFf5AYGN8aRt1nuDd/VO1xl/ct+63C35WoFh
         +Rbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=kQEsiVEiaXpNZY5fpwE1Qp/W2i/qX19rknZb5cNLoUE=;
        b=BMjPTVNVBvGDWdiwhjoinIIFUl45ke7lwWlpL4i0iTRj5n0G4HI+qXZ513U7YEm7Hm
         gp11oT9QLvVDvuQtoCXm0oocmr5c8eAKI4sEC+RjxdWAfeD38jNAXSFCIGqeqVU7XXwD
         gi+skBoGO6eMh++/s+3mJdRgfJAN0UwXwf2FTpY3Vsc2e+bxbj2qeOuCPzVw5ydRwjZq
         htWbabYYJ5cLHADWECP6mvkPQE/EWUVwqemODLwsDev30uheosEhrWWLRyDISFoRrtQb
         NYwmq6mvAEv+Ko5fOS3voxGcsDxJqQSLa/AJXxOkMourHWSd9FSPO9En5D85wK4WkcTx
         USfA==
X-Gm-Message-State: APjAAAVnbSvH4T7/qo0S3BhJ0ZFBCsYuFyzdzQ8QULYKEfUx64zD1ubi
        tjVru1AprtY9IHaHwIv+vZY=
X-Google-Smtp-Source: APXvYqyZadiMOZO0SQhlqa/0QHBq1hwCpu2R621P+rCAFkU0p6eP3OlHDbI9Nv8JXHQX6zs/5tqgCw==
X-Received: by 2002:aa7:8481:: with SMTP id u1mr89620pfn.3.1568663786144;
        Mon, 16 Sep 2019 12:56:26 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id x68sm8266463pfd.183.2019.09.16.12.56.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Sep 2019 12:56:25 -0700 (PDT)
Date:   Mon, 16 Sep 2019 12:56:23 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Marco Felsch <m.felsch@pengutronix.de>
Cc:     support.opensource@diasemi.com, stwiss.opensource@diasemi.com,
        robh+dt@kernel.org, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH 3/4] dt-bindings: Input: da9062 - fix
 dlg,disable-key-power description
Message-ID: <20190916195623.GF237523@dtor-ws>
References: <20190916140358.30036-1-m.felsch@pengutronix.de>
 <20190916140358.30036-4-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190916140358.30036-4-m.felsch@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Sep 16, 2019 at 04:03:57PM +0200, Marco Felsch wrote:
> There was a bug within the driver since commit f889beaaab1c ("Input:
> da9063 - report KEY_POWER instead of KEY_SLEEP during power
> key-press"). Since we fixed the bug the KEY_POWER will be reported
> always so we need to adapt the dt-bindings too. Make the description
> more precise while on it.
> 
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> ---
>  Documentation/devicetree/bindings/input/da9062-onkey.txt | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/input/da9062-onkey.txt b/Documentation/devicetree/bindings/input/da9062-onkey.txt
> index d1792452ceff..648b1930df1b 100644
> --- a/Documentation/devicetree/bindings/input/da9062-onkey.txt
> +++ b/Documentation/devicetree/bindings/input/da9062-onkey.txt
> @@ -15,9 +15,9 @@ Required properties:
>  
>  Optional properties:
>  
> -- dlg,disable-key-power : Disable power-down using a long key-press. If this
> -    entry exists the OnKey driver will remove support for the KEY_POWER key
> -    press when triggered using a long press of the OnKey.
> +- dlg,disable-key-power : Disable host triggered hard shutdown using a long
> +    key-press. If this property isn't present the host will send an i2c shutdown
> +    command on a long key-press.

Can we say what happens when property is present instead? I.e. "If this
property is present, the host will not be issuing shutdown command over
I2C in response to a long key-press"?

Thanks.

-- 
Dmitry
