Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C386F2BBF16
	for <lists+linux-input@lfdr.de>; Sat, 21 Nov 2020 13:59:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727689AbgKUM4u (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 21 Nov 2020 07:56:50 -0500
Received: from mail-qk1-f196.google.com ([209.85.222.196]:45580 "EHLO
        mail-qk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727668AbgKUM4t (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 21 Nov 2020 07:56:49 -0500
Received: by mail-qk1-f196.google.com with SMTP id q5so11695714qkc.12;
        Sat, 21 Nov 2020 04:56:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=ToElgtgxokI53Ol3P5lIooZ15Z39ALXjwMgyoo4gBOI=;
        b=la0bdU8k87RNC8aR3GUJLY41kxJD31M6iK9KEMVVC3GySneRUi4LSrkLewq/u2GRGm
         /x0EYXo/fO7EE4KW6rRwX/5xwmQbn3VVlqR3Fqq8hPSrZqLJpVX7/Ji4RbWPyuRd7c/E
         KmJxZjhvPIgY3rFaN6y8mWcMfE5oNPBxRhAPr5pC4meYr6atpHbX3jGcffC3JzGlTep6
         7EDuR3L9FXyyvwDEnnYzVCkJHBGGeOWa2L2EWxdv6FFodzte+hj3JsjJrrE0M89ha7Ir
         3E86kx8dHcrQ4X/E4x9z+S/eS9EszESDNly1ZBchUns+YdcUfQzbvuHKhhjeYRIYAAT8
         Fyxw==
X-Gm-Message-State: AOAM53393Mwvy1+tcLh8CjOE4ZP7EughqFRl/o4qNMN2K7Yg0b4n/wtB
        c8jXRawNzqR9TQCvHgkfnAAeOPXx7w==
X-Google-Smtp-Source: ABdhPJw32SlJwXbb7W/+4G1tBXyRjdh05lyhTKZMeQ50JvIOaSn6aZJvBhb1cBsGLAX7x/7v1FPLIw==
X-Received: by 2002:a37:a707:: with SMTP id q7mr1466240qke.5.1605963408068;
        Sat, 21 Nov 2020 04:56:48 -0800 (PST)
Received: from xps15 ([2607:fb90:5feb:6270:cdf7:680e:59f2:6ccd])
        by smtp.gmail.com with ESMTPSA id k4sm3903561qki.2.2020.11.21.04.56.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2020 04:56:47 -0800 (PST)
Received: (nullmailer pid 2083927 invoked by uid 1000);
        Sat, 21 Nov 2020 12:56:42 -0000
Date:   Sat, 21 Nov 2020 06:56:42 -0600
From:   Rob Herring <robh@kernel.org>
To:     Oleksij Rempel <o.rempel@pengutronix.de>
Cc:     devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Mark Brown <broonie@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-kernel@vger.kernel.org, kernel@pengutronix.de,
        linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Benjamin Gaignard <benjamin.gaignard@st.com>,
        David Jander <david@protonic.nl>
Subject: Re: [PATCH v1] dt-bindings: touchscreen: add
 touchscreen-read-duration-us and touchscreen-settling-time-us properties
Message-ID: <20201121125642.GA2083872@robh.at.kernel.org>
References: <20201112112048.12134-1-o.rempel@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201112112048.12134-1-o.rempel@pengutronix.de>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, 12 Nov 2020 12:20:48 +0100, Oleksij Rempel wrote:
> According to the TI application bulletin [1] we deal with two generic
> mechanisms which would affect the precision of provided input events:
> 
> |TOUCH SCREEN SETTLING TIME
> |
> |When the touch  panel is pressed or touched, there are
> |two mechanisms that will affect the voltage level at the contact point of
> |the touch panel. These two mechanisms will cause the voltage across the
> |touch panel to “ring” (oscillate), and then slowly settle (decay)
> |down to a stable DC value.
> |
> |The two mechanisms are:
> | 1) Mechanical bouncing caused by vibration of the top layer sheet  of
> |    the touch  panel  when  the  panel  is  pressed.
> |
> | 2) Electrical  ringing  due  to  parasitic  capacitance  between the top
> |    and bottom layer sheets of the touch panel and at the  input  of  ADS7843
> |    that  causes  the  voltage  to  “ring”(oscillate).
> 
> Since both of this mechanisms are board specific and reflect the
> mechanical, and electrical properties of end product, it is better to
> provide a generic properties to address them.
> 
> The touchscreen-read-duration-us property should address 1. mechanism.
> This effect can be triggered by device specific design. The duration ma be
> dependent on the use case of the end device. For example a touch where
> writing is required may have other timing requirements as the device
> where only "buttons" should be pressed.
> 
> The touchscreen-settling-time-us property should address 2. mechanism
> where the size and construction of touch screen plates affect the parasitic
> capacitance and time needed between enabling power supply for the
> plates, and actual usable voltage level to detect the position of touch event.
> 
> [1] https://www.ti.com/lit/an/sbaa036/sbaa036.pdf
> 
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> ---
>  .../bindings/input/touchscreen/touchscreen.yaml          | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
