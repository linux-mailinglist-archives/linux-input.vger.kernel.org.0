Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D3CD1B893D
	for <lists+linux-input@lfdr.de>; Sat, 25 Apr 2020 22:07:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726220AbgDYUHB (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 25 Apr 2020 16:07:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726190AbgDYUHA (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 25 Apr 2020 16:07:00 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5ED95C09B04D;
        Sat, 25 Apr 2020 13:06:59 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id t9so5445107pjw.0;
        Sat, 25 Apr 2020 13:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=BTzPKchfa+HTrW2yOtikWwN8/pT9z90dekyVPCBoW58=;
        b=tzgPg3n5j4xvFDhHAYLjFZoxihcNt+okfBWx7VxUEqf2cHwX52TpJodI/F+zSzD0kT
         aoOu7i2HAfcOjD8b+2ZRzXhnbZfevunm5qT03G9uKbWCZfJeTCk++ycy5HZF/wn3OaC5
         QuAO5r19RC9HwoHXJZ1Y/O8mawozJIk1g5icsd/WoEQWxlCnXDaYGn9w2+H9Cbc61Mad
         iRK2kgj3/iJD8t3JktlF3f/syd7SHxNA1e2AzIhPUUkHhoEY9s3b6nVJHLSiJ6VxKgtB
         F/l/+HkZUcUAODaZ0xzm3VcZ1Cfo/z71cZQQklfcbVPBnQtGgCGTPvWagwFUSnFlySfN
         fglw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=BTzPKchfa+HTrW2yOtikWwN8/pT9z90dekyVPCBoW58=;
        b=X9a+9eiK5yH7nQeu/CyN8G3jNRGpDwez2IWNlTvNM8uYgiGAnWUw6ihjzEh2EjEXaD
         y1JnNMgEEdfCBy0BCl5/eBEWKYGH9zBhbeWydff5MNbEVfAL5936HCTR/dKaVXPFuZ5P
         P8kYhNRtWbk9njQJ4A8L04irP+elcrPiCVX05spi1jYiLf8ItuHm/b2zZVdoepClH8IM
         ubq0GFpGksPXRopG+JZiHtDPqTUTEhSc0pkclzK0JILXV7RVp6BnwZsQvHSNOmzKHq4H
         rdBFqofyjEk1MeF6+89o4tszkk/UrwZOUiiZbVoSn/nPSNJH2+GNUxHDRyuU9EwWH4vM
         RlIw==
X-Gm-Message-State: AGi0PubLfp/lYt5tCtDESKHqFUv3m4sa2DEPWKSnhczZRrFrnwcW9h3S
        jHJBFwtUkF5zd8N2npC81Bo=
X-Google-Smtp-Source: APiQypIjYkrTwFD+x+K6w8fSlTSSNgiyu96I581b7PeYbMAPdnAseQHToL1xi6J6Slp27+5sESYr1A==
X-Received: by 2002:a17:90a:d3ce:: with SMTP id d14mr13989627pjw.46.1587845218547;
        Sat, 25 Apr 2020 13:06:58 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3c2a:73a9:c2cf:7f45])
        by smtp.gmail.com with ESMTPSA id z23sm8680124pfr.136.2020.04.25.13.06.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2020 13:06:58 -0700 (PDT)
Date:   Sat, 25 Apr 2020 13:06:55 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     Andi Shyti <andi@etezian.org>, linux-input@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 2/2] dt-bindings: mms114: document melfas,mms345l binding
Message-ID: <20200425200655.GL125362@dtor-ws>
References: <20200423102431.2715-1-stephan@gerhold.net>
 <20200423102431.2715-2-stephan@gerhold.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200423102431.2715-2-stephan@gerhold.net>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Apr 23, 2020 at 12:24:31PM +0200, Stephan Gerhold wrote:
> The mms114 driver now supports MMS345L; document the
> melfas,mms345l binding that is used for it.
> 
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> Reviewed-by: Andi Shyti <andi@etezian.org>
> Acked-by: Rob Herring <robh@kernel.org>

Applied, thank you.

> ---
>  Documentation/devicetree/bindings/input/touchscreen/mms114.txt | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/input/touchscreen/mms114.txt b/Documentation/devicetree/bindings/input/touchscreen/mms114.txt
> index 2cd954051d29..707234cfd7e6 100644
> --- a/Documentation/devicetree/bindings/input/touchscreen/mms114.txt
> +++ b/Documentation/devicetree/bindings/input/touchscreen/mms114.txt
> @@ -1,9 +1,10 @@
> -* MELFAS MMS114/MMS152 touchscreen controller
> +* MELFAS MMS114/MMS152/MMS345L touchscreen controller
>  
>  Required properties:
>  - compatible: should be one of:
>  	- "melfas,mms114"
>  	- "melfas,mms152"
> +	- "melfas,mms345l"
>  - reg: I2C address of the chip
>  - interrupts: interrupt to which the chip is connected
>  - touchscreen-size-x: See [1]
> -- 
> 2.26.2
> 

-- 
Dmitry
