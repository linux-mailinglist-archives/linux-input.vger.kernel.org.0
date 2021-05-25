Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9CB5E38F8FB
	for <lists+linux-input@lfdr.de>; Tue, 25 May 2021 05:46:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230366AbhEYDro (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 24 May 2021 23:47:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230048AbhEYDrn (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 24 May 2021 23:47:43 -0400
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7048C061574;
        Mon, 24 May 2021 20:46:14 -0700 (PDT)
Received: by mail-pg1-x52c.google.com with SMTP id 27so20349962pgy.3;
        Mon, 24 May 2021 20:46:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=y9wnl7d6pRDoIXMa5h4mXaUllCK4xoz1xJ5yVUVeTMM=;
        b=uW6YjY7ix8PwtpYIBkWmFCI6HB+CTUM4qg3JvQymoQKupk0Cmhj9x/vpiwo5ytDFzW
         nv9dgt2LIWXc4yFxNyBDzLJgssuYdm4UlKH8tNLAJuJTQXggJDjKVnvapmm8mbSo2uxr
         gJkDK02aP+CAjBw07cfOP7qY0Q9wTCvJzkXO/CQrf9H+MA1PDG+CyxljKqH4Czp0rC/7
         WhXjLWt5Ijr2VTLegaxsTcnv4Ft1cb3gLxXXLhulzj7R6QzbFqtQcz2FYh0VSnh9NScE
         ogQbCFZG6OGgRktk3whm6KkUzLGFKOsIsYvRegKJe4KgL1N2kqTN66zcBgpT56jbeEY7
         6pXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=y9wnl7d6pRDoIXMa5h4mXaUllCK4xoz1xJ5yVUVeTMM=;
        b=PPI+A8nLyb3kWXgcKuG8G+RdJ+Yw/Kog7FHWRzj6Rk0nA+WypKg6oDJPA/6tZSB8OW
         Hr71fNRXy5PQuARjjb5LmgAQMoOuB9YfivTNRhqUTjLC3xd/kMgjowxIG86akZNgjbuT
         N3RZh7fSVN+Hj5wpeHgJxK+3j/m3Mie9OCXmmyO/F2vuxzrFFjAwMz/4wJZ2hP5N9SQF
         aSMdM18iZYe7559f0bT/9V47vq6QnZ4XERhkNLAihiQrk2SXystemfbAig21giMm958E
         vvpbxlTjqtCf2JstIm7aQiSeJwKddjuSa9l/npBGmV8Oo8WmN+OAt87UsE49UwthDd2e
         Dmhw==
X-Gm-Message-State: AOAM532EfCt2uGt0I8DvwMvr+jlsQdh91qkfuMNbYHpoyOQXBqVt4fa3
        2IeOJalstmyneEQ1guVi2MQ=
X-Google-Smtp-Source: ABdhPJzhWauyvU55ldRmF1oSSm19HFo9knnG0RpC6i8VKjQYeGX6pQJya7VOMbOohRzMHL1MAsuTCw==
X-Received: by 2002:aa7:8d46:0:b029:2de:75aa:1964 with SMTP id s6-20020aa78d460000b02902de75aa1964mr28282121pfe.61.1621914374201;
        Mon, 24 May 2021 20:46:14 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:870d:a395:9098:674])
        by smtp.gmail.com with ESMTPSA id o14sm2140358pfd.1.2021.05.24.20.46.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 May 2021 20:46:13 -0700 (PDT)
Date:   Mon, 24 May 2021 20:46:10 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Rob Herring <robh@kernel.org>
Cc:     Oleksij Rempel <o.rempel@pengutronix.de>,
        devicetree@vger.kernel.org,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        David Jander <david@protonic.nl>,
        Rob Herring <robh+dt@kernel.org>, kernel@pengutronix.de
Subject: Re: [PATCH v5 4/8] dt-bindings: touchscreen: validate nodename
Message-ID: <YKxzAgVrNjNdHnoJ@google.com>
References: <20210521044525.7397-1-o.rempel@pengutronix.de>
 <20210521044525.7397-5-o.rempel@pengutronix.de>
 <20210521171823.GA33003@robh.at.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210521171823.GA33003@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, May 21, 2021 at 12:18:23PM -0500, Rob Herring wrote:
> On Fri, 21 May 2021 06:45:21 +0200, Oleksij Rempel wrote:
> > Validate touchscreen nodes. Make sure it is named touchscreen*.
> > 
> > Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> > ---
> >  .../devicetree/bindings/input/touchscreen/touchscreen.yaml     | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> 
> Acked-by: Rob Herring <robh@kernel.org>

These bindings are used for devices other than touchscreens (touchpads
and other touch controllers that are not touchscreens), so forcing them
to be named "touchscreen*" is wrong. In fact, I'd like to allow using
"touch-*" property names as aliases for "touchscreen-*" properties.

Thanks.

-- 
Dmitry
