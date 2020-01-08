Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5513D1348B7
	for <lists+linux-input@lfdr.de>; Wed,  8 Jan 2020 17:59:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729577AbgAHQ7y (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 8 Jan 2020 11:59:54 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:40619 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729566AbgAHQ7y (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 8 Jan 2020 11:59:54 -0500
Received: by mail-oi1-f194.google.com with SMTP id c77so3238872oib.7
        for <linux-input@vger.kernel.org>; Wed, 08 Jan 2020 08:59:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=d2GY+NVVosTDVmvibNwMNQRy5RHqvmx65T16ZeJgxvo=;
        b=PVFYjupQmYrLsJ3qPVOgeKfXjUB8+4EKGKH7bZMVgWRWa05tzuIb7ZMtSHBRwmyemu
         AY7qBigY15fiTKkS+HyM9oYx4dCJLgVnsCGCpTXLVpBDbuvqulyhZJQsKGpJXb0tJsxb
         TrlaezUcxF7GdArTOdt2Si32Ntwob+pADgWMvHk06Tgz49SWUhfDcp24OR/2DVTsJd8L
         3N+KehIeozUU83w78zY2JCAFaoE/tAJJM05Tkb2cRusYdBHErQIYpMg6sC+7W9KR8qjp
         tez5fWO7H3xiBe22vX6/C7uwxlurqO7E1Au5eSgyozOiXDypQB42qzfqj0hIqIRToC78
         Y1aA==
X-Gm-Message-State: APjAAAWeh4IaOdeA5SDaXqqfClBk2IPmlV5L4EfX9dqQ4nhWJ7xMCNnc
        1WusfFfUn+clPezJwt7h5CfwGH0=
X-Google-Smtp-Source: APXvYqxwG6GDC04q29GgptvLiQnFU4C90P2Bw25neBm609FUqwdma7uzfqZyJ+KfwXXBUQB9c/1j6A==
X-Received: by 2002:aca:c68f:: with SMTP id w137mr3940542oif.179.1578502793119;
        Wed, 08 Jan 2020 08:59:53 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id f4sm1245217oij.25.2020.01.08.08.59.51
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2020 08:59:51 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 220333
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Wed, 08 Jan 2020 10:59:51 -0600
Date:   Wed, 8 Jan 2020 10:59:51 -0600
From:   Rob Herring <robh@kernel.org>
To:     Artur Rojek <contact@artur-rojek.eu>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Paul Cercueil <paul@crapouillou.net>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Artur Rojek <contact@artur-rojek.eu>
Subject: Re: [PATCH 2/5] dt-bindings: iio/adc: Add touchscreen idx for JZ47xx
 SoC ADC
Message-ID: <20200108165951.GA10221@bogus>
References: <20200105001639.142061-1-contact@artur-rojek.eu>
 <20200105001639.142061-2-contact@artur-rojek.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200105001639.142061-2-contact@artur-rojek.eu>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun,  5 Jan 2020 01:16:36 +0100, Artur Rojek wrote:
> Introduce support for touchscreen channels found in JZ47xx SoCs.
> 
> Signed-off-by: Artur Rojek <contact@artur-rojek.eu>
> Tested-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  include/dt-bindings/iio/adc/ingenic,adc.h | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
