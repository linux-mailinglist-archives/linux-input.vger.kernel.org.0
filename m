Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7456599DB0
	for <lists+linux-input@lfdr.de>; Thu, 22 Aug 2019 19:44:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392843AbfHVRog (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 22 Aug 2019 13:44:36 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:38195 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392838AbfHVRoe (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 22 Aug 2019 13:44:34 -0400
Received: by mail-pl1-f194.google.com with SMTP id w11so3396773plp.5;
        Thu, 22 Aug 2019 10:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=LGzx0JdHyHSlWDvF7DFegBLhwVHhKaGEvlCrTMb46DE=;
        b=ElVE7TPATvVV6bPXr/3CsTovoUvcsn4QLnNLi6NgQhCLTgYRDbVSnbu2P6b1Y8NW0C
         c+09w1uspNRWwFvOW8rS7hoO99nBsZhhpo94s2mBOWbc9Qswj9uxf/ODBCa3H+iSpm6Z
         0pNCoijtuLkxInDZ7vVVyrrRBHHBXJo/ocChm+EaATBkMhd2fLXODl6pG4XBiXCicOp2
         bLN93J1MmPAcRSPaWdcGFb9tDdo8p9cbid7jSusiVFMS5rbX2+tWDNeXP3lw8OC/Wa3A
         1q00p90fLLZ26OceQHneIKHCQ4k1sK8/TorZVXC4RHwHgRf3+yo8m0c43/Hv8xLxSEhF
         G8tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=LGzx0JdHyHSlWDvF7DFegBLhwVHhKaGEvlCrTMb46DE=;
        b=QJeJmMEomGu4pHetwyffe2c6gj8FOshaz//p11ZG3Rz59i3rXzrSR1Ha8vXdwFb8dj
         p+Udo7sR9BMheXYQPdHUy+Ktu7V808S5Droj6wkxdhQ0Z10LfeEeuSr2D9jtygwZ5L5E
         UOXGaJci7+CIWm7nh+Jo9yWhOxH+sSKiAiepvlQbtPJffmkzfh6HTR9831G9qbrPvxRY
         0giU16Oek/g9xxLH/ApKE7+LukU3T2G/pIklN+yZhxjjCotAz/vwu426JFEJftrQ/IgV
         pEHClMUl/QPi4TyvozZBDt5lk6Thp6FHkj7TorW7iMjIjMZ7YwcPWFOpxoT41X2Kc7h1
         uaag==
X-Gm-Message-State: APjAAAVq5pQuvgp3QLjS21wqNZ0nhsvb2S5MsWWE64qGcHG/W2wK+qcR
        SHBRuBxjTFLp6THodpvPRItATjDB
X-Google-Smtp-Source: APXvYqyXYBuMBmZ3J4m09+Dflg3SI6as5BmcHm+5FGVjp4gnigCUkPpJBKSbP4WwLZuo7xwcLosB8Q==
X-Received: by 2002:a17:902:8a93:: with SMTP id p19mr19177plo.106.1566495873845;
        Thu, 22 Aug 2019 10:44:33 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id a26sm3949pff.174.2019.08.22.10.44.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2019 10:44:32 -0700 (PDT)
Date:   Thu, 22 Aug 2019 10:44:30 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Marco Felsch <m.felsch@pengutronix.de>
Cc:     Rob Herring <robh@kernel.org>, robh+dt@kernel.org,
        kernel@pengutronix.de, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 3/4] dt-bindings: input: ads7846: replace vendor-bindings
 by general ones
Message-ID: <20190822174430.GF76194@dtor-ws>
References: <20190327133927.1340-1-m.felsch@pengutronix.de>
 <20190327133927.1340-4-m.felsch@pengutronix.de>
 <5ca06167.1c69fb81.6e121.c248@mx.google.com>
 <20190821073613.nh5oyyvahb3i6nf6@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190821073613.nh5oyyvahb3i6nf6@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Aug 21, 2019 at 09:36:13AM +0200, Marco Felsch wrote:
> Hi Dmitry,
> 
> On 19-03-31 01:42, Rob Herring wrote:
> > On Wed, 27 Mar 2019 14:39:26 +0100, Marco Felsch wrote:
> > > Mark the vendor-bindings as deprecated and replace them by the general
> > > ones. All deprecated bindings are used as default and gets overwritten by
> > > the general ones if the user supplies both. This ensures the backward
> > > compatibility with old dt's.
> > > 
> > > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> > > ---
> > >  .../bindings/input/touchscreen/ads7846.txt    | 29 ++++++++++++++-----
> > >  1 file changed, 21 insertions(+), 8 deletions(-)
> > > 
> > 
> > Reviewed-by: Rob Herring <robh@kernel.org>
> 
> How about this patch?

It's been folded into the patch implementing the handling of the
bindings in the driver.

Thanks.

-- 
Dmitry
