Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80D4A2D520E
	for <lists+linux-input@lfdr.de>; Thu, 10 Dec 2020 04:53:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731096AbgLJDvK (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 9 Dec 2020 22:51:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730852AbgLJDvC (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 9 Dec 2020 22:51:02 -0500
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97EE6C0613CF;
        Wed,  9 Dec 2020 19:50:22 -0800 (PST)
Received: by mail-pf1-x444.google.com with SMTP id 11so2775686pfu.4;
        Wed, 09 Dec 2020 19:50:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=jVuwaB/s0WyObI7xy/VL3MvAWV5Qoq+TBG8A9nEY/B0=;
        b=MqLLE/qcr+5q1o9VeVM90m+cX5HK7e4nHkK3HmeN+GvYwN9Fs8vW7wXKkq7kgZpJgl
         yh+5epxy+vWkNwMsoomQCYuplPYqXC4JvIUhm3vPbmtbYpwJ120cl25G4xh9gHzHf7xX
         zcVhVHW2SECI50VMN8VdzDWVzOY8GfUpgw97aBXFrrn2ARQLuLFLkmb2u36rpDhAiMI0
         G0ZV/Wh9BZIjkyHJdWE4gvqpaKlj23mJgZ3g4Ki7y3G3LwncRmRIYQ926KERFjsZ/Wl1
         beCCGAxONhlyg0VdcSYidlqfZ4HHTsVo48BwcrsDjDhIpz1GFPsSK1c1VdunOA3y1V7Y
         Kvyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=jVuwaB/s0WyObI7xy/VL3MvAWV5Qoq+TBG8A9nEY/B0=;
        b=niVw00qlHVrve/7gp4/HBM7lvvlYCes49whbRW5sanNFNCls/EN5bV5Q4PPkU4mkC9
         4Z262oK4HcFS3YHIMPbhKDluGtZ6RWwDVadT+ElT47PoUJlkxLC+kLrKXOAyq34PIwez
         IFXBnrWcUf0XQFmMPU04RUhKrMEG4hGapi0LZ8q7AByUTBUUyshnPeRPXygWDIzdgCyt
         FoHQ0CTudYbzDVnFtfkr8mMe4TB4sD4Y807GjB6E20SzQlWDb3xtnv7tq6uS/lTFbE+E
         F0vaFrJ8QWPRoPbO2Pn8pXuXrdnNReVsa7zuMsq/tsn251fk/r8q2fHr7TdHulj/ie00
         CnYw==
X-Gm-Message-State: AOAM531rV0JGw1YiqpRMMOGEoGKLAKFmUR2NzZNx7Dwv1CzieOeRUbl9
        wdQJm6FraQnBbrOMJm1RTXc=
X-Google-Smtp-Source: ABdhPJxJDO06m7nwb5gObwW7L8n1xs/QgH7wPNtqCOXh3oivOz2L+iaSJCCeUNmo3JJUYo1Xy8X5zA==
X-Received: by 2002:a63:4b1f:: with SMTP id y31mr4966817pga.29.1607572221944;
        Wed, 09 Dec 2020 19:50:21 -0800 (PST)
Received: from google.com ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id w70sm4351943pfd.65.2020.12.09.19.50.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Dec 2020 19:50:21 -0800 (PST)
Date:   Wed, 9 Dec 2020 19:50:18 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     linux-input@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/3] dt-bindings: Input: tm2-touchkey - convert to yaml
Message-ID: <X9Ga+nmmyA13BMf6@google.com>
References: <20201203131242.44397-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201203131242.44397-1-stephan@gerhold.net>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Dec 03, 2020 at 02:12:40PM +0100, Stephan Gerhold wrote:
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

Applied, thank you.

-- 
Dmitry
