Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0A05A88060
	for <lists+linux-input@lfdr.de>; Fri,  9 Aug 2019 18:42:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726550AbfHIQmW (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 9 Aug 2019 12:42:22 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:35242 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726157AbfHIQmW (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 9 Aug 2019 12:42:22 -0400
Received: by mail-pf1-f196.google.com with SMTP id u14so46362565pfn.2;
        Fri, 09 Aug 2019 09:42:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=2c8aJD2aQ8wWGjYRmwxwggdilDjxqOXv1tMf+f8moeI=;
        b=uz9ycqqVATVhUSl35hZs8QxfXAJIUEyddKrU/3rp5hv9N+pbKHSvt1e3PTYndRMV4J
         v2pKhwC9uP6pnLjmvFoV0z6YeO8Ds3pLTWc2+P5TJiZk0/Te2cl3eW6pCatUGllKni1+
         NkZTuiilINLemMRXpI1aQVD3pzRXR4vCxVoVC70z5O+WuR3nV5GbLpabYy6h0Oy/HFlm
         BPrRLR4Uhj8Nk9Q6JLLwmVPJS/3l1+xhuKy/BVsTiEGBTLuhQiZ7GCuLMsbmzUfoc8vr
         oPvjMYTQBHoCmiTkRfpz3M1ZtruNOLfkhym8M6HEQ5m7kejiQAQ8LkM3cIVduYbn5wV5
         yweA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=2c8aJD2aQ8wWGjYRmwxwggdilDjxqOXv1tMf+f8moeI=;
        b=C6H7b7l0e/op2n7+F8g2U+/Kl11Jw988xSy2xaNWsKU4X2CcyM4eLeDmIWWtXqGXRD
         h+JKdgcdXx2T8g6K0dESxBVzHADH3DZ4JiFLrEUpRnKlXLJXUO8bGcXpmXI6QA/G8v7Q
         w9IdEKGhTqtqo+JGXRcj4xurIoiyLvG4wepsghoCKG74QionGWlbR7bZkuGwrv0zhBs8
         YXLejuEb0mE/5gEO97Sblevh9rir01wSA4G2WcXgneyi3C3GvIiMT90MnEIxOcZV8G2u
         cA/hVLNX4AEd9LoIPKkjKw9dND98EcGw2W4AhfOJV+oieXYvROYPCo/0DxMgiot+zUT3
         e3Yw==
X-Gm-Message-State: APjAAAUK4ged/4Dy7af3ycNk6G41asTouGuJHUwyj6gQ75pfxV5Xt9xI
        aKyowB/Yc328G7ZAAmKSxcovwdhX
X-Google-Smtp-Source: APXvYqziK7CRaPbTDFyemB4h38fjQ4QMhpXwy33SM0MvYFQGk5bFOnK4N+Vl3OQVVAQShh8SLVUVRQ==
X-Received: by 2002:a62:5883:: with SMTP id m125mr22274529pfb.248.1565368941610;
        Fri, 09 Aug 2019 09:42:21 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id h70sm93770998pgc.36.2019.08.09.09.42.18
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 09 Aug 2019 09:42:19 -0700 (PDT)
Date:   Fri, 9 Aug 2019 09:42:17 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Rob Herring <robh@kernel.org>
Cc:     Marco Felsch <m.felsch@pengutronix.de>, robh+dt@kernel.org,
        kernel@pengutronix.de, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 2/4] dt-bindings: input: ads7846: fix property description
Message-ID: <20190809164217.GK178933@dtor-ws>
References: <20190327133927.1340-1-m.felsch@pengutronix.de>
 <20190327133927.1340-3-m.felsch@pengutronix.de>
 <5ca06164.1c69fb81.39fb3.79f9@mx.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5ca06164.1c69fb81.39fb3.79f9@mx.google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, Mar 31, 2019 at 01:42:42AM -0500, Rob Herring wrote:
> On Wed, 27 Mar 2019 14:39:25 +0100, Marco Felsch wrote:
> > The ti,y-max is used for the maximum value of the Y axis.
> > 
> > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> > ---
> >  Documentation/devicetree/bindings/input/touchscreen/ads7846.txt | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> 


Applied, thank you.

-- 
Dmitry
