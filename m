Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 11B3A139CEF
	for <lists+linux-input@lfdr.de>; Mon, 13 Jan 2020 23:52:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728998AbgAMWwj (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 13 Jan 2020 17:52:39 -0500
Received: from mail-ot1-f68.google.com ([209.85.210.68]:44693 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728833AbgAMWwj (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 13 Jan 2020 17:52:39 -0500
Received: by mail-ot1-f68.google.com with SMTP id h9so10612533otj.11
        for <linux-input@vger.kernel.org>; Mon, 13 Jan 2020 14:52:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=J+zBhW/gDhabcv8JezsZDbLiOV+72tFZs2kFt+zjTFs=;
        b=g+Eq+HD/QNbwhFDK1tFwzdWmax3K07rdR++wNDBgKjoSueQV+AaFTcYMe476A3Vo/6
         2wtQ8y293IUUo5yJphRJn57wqUB2BhL6QkMQoRYEGTy1zTknOLnjT0I8m9tOM2eydMLI
         NRuq7hldk4zG2N0FJB5osynKi42ql9pA/LVlzUDLf08x5vX6q8TxaOiBbo+16Wio5kA3
         A2UZ7ex8E++rRo6Y8GVZCvBtdpJ02HLetarHEat6Gd1Voof6KzN2sWNAxYQJsXa+mpWB
         TUqvfbEyMFUwpnQSR6Fbtj5blxIxYfkshpEFdlRGgGKVp0y6tlu/Y8y3x/FFD8h0wqPh
         GNqQ==
X-Gm-Message-State: APjAAAUA31x35PA4Bz04kbtoyKpUUvgdAaQwhwSXKkKmcYrg1E5RXiwX
        Do7vNWX3I+H9FVX110Ysl+yDpLI=
X-Google-Smtp-Source: APXvYqzPLz+Gz8ghuTv9UuKUouiSUzC8Mq8AD2qzQpcPvS+MUDkOEQsZxkadmW3gvGmVQICg3a7x2w==
X-Received: by 2002:a9d:1c95:: with SMTP id l21mr14567603ota.271.1578955958296;
        Mon, 13 Jan 2020 14:52:38 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id e65sm4696765otb.62.2020.01.13.14.52.37
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2020 14:52:37 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 2219cf
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Mon, 13 Jan 2020 16:52:36 -0600
Date:   Mon, 13 Jan 2020 16:52:36 -0600
From:   Rob Herring <robh@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Jonathan Cameron <jic23@kernel.org>, linux-iio@vger.kernel.org,
        Hartmut Knaack <knaack.h@gmx.de>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
        linux-input@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Minkyu Kang <mk7.kang@samsung.com>,
        =?utf-8?B?UGF3ZcWC?= Chmiel <pawel.mikolaj.chmiel@gmail.com>,
        Jonathan Bakker <xc-racer2@live.ca>,
        Oskar Andero <oskar.andero@gmail.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2 v4] iio: light: Add DT bindings for GP2AP002
Message-ID: <20200113225236.GA17926@bogus>
References: <20200112111341.21388-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200112111341.21388-1-linus.walleij@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, 12 Jan 2020 12:13:40 +0100, Linus Walleij wrote:
> This adds device tree bindings for the GP2AP002 light
> and proximity sensor.
> 
> As with other early proximity sensors (~2010) the light
> sensor and proximity sensors were combined into a single
> component.
> 
> Cc: Stephan Gerhold <stephan@gerhold.net>
> Cc: Minkyu Kang <mk7.kang@samsung.com>
> Cc: Paweł Chmiel <pawel.mikolaj.chmiel@gmail.com>
> Cc: Jonathan Bakker <xc-racer2@live.ca>
> Cc: Oskar Andero <oskar.andero@gmail.com>
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v3->v4:
> - Resend with the changes in the main patch.
> ChangeLog v1->v3:
> - Drop the maxitems on the supplies, it is already 1
> - Drop quotes around "alsout"
> - Limit the sharp hysteresis to 8 bits as it should be
> - Use /bits/ 8 in the example so it is correct
> ---
>  .../bindings/iio/light/sharp,gp2ap002.yaml    | 85 +++++++++++++++++++
>  1 file changed, 85 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/light/sharp,gp2ap002.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
