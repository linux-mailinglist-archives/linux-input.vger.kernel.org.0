Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 01F9E46870
	for <lists+linux-input@lfdr.de>; Fri, 14 Jun 2019 21:59:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726094AbfFNT7D (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 14 Jun 2019 15:59:03 -0400
Received: from mail-qk1-f193.google.com ([209.85.222.193]:33556 "EHLO
        mail-qk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725802AbfFNT7C (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 14 Jun 2019 15:59:02 -0400
Received: by mail-qk1-f193.google.com with SMTP id r6so2506931qkc.0;
        Fri, 14 Jun 2019 12:59:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=IcWQ3nUu6wDRqVLHzhh+VTAVjRsVzEs3WULUbQdSftE=;
        b=gVpMqUfhg+l+E3FlZVrNsv90/tzJU30DSlPnBjjn8ZAQeu7yt/VSbk75eXPbq5Gcdw
         PWs1bvkSmix0o9Iga7WWhROCMBmSagg+QBCFoII7RAMt1yWl1MP65G9yxgOD6Rck7hB1
         Zihgp5TOOAKi0Ylk64DrA84FNbQJqJr05EpyIWa5eCutAiJCUnGTBAuFaW3X9/kq2m29
         3pO1JQ3l4lNQZkS5wiTDmAmeVMByteTgaPiBR47viX3IIGrOy8NbI0TsqGUEqVOiE75+
         qmXtZl0xfxKvT/A3bcKg5faZNwJf1fnsafxypS8bg8/P1xPMEJddZ2kVh4KjsFi5NNC+
         QSAw==
X-Gm-Message-State: APjAAAW4YNvMZc9wBjK9F3MxMIFls26sYPo83acdrakh7fEIVyL8XWhk
        SJzGr+5qxdMqCwZAI+Z1pA==
X-Google-Smtp-Source: APXvYqyk8IwZQr0mZ1bMoaexPygoPzGBZsm9VSpkhzYAu5lt4tEHYQkRVCIGsRQtJGcj5wWV/i5dPg==
X-Received: by 2002:ae9:ec14:: with SMTP id h20mr76892548qkg.254.1560542341748;
        Fri, 14 Jun 2019 12:59:01 -0700 (PDT)
Received: from localhost ([64.188.179.243])
        by smtp.gmail.com with ESMTPSA id a16sm1572801qtj.9.2019.06.14.12.59.00
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 14 Jun 2019 12:59:01 -0700 (PDT)
Date:   Fri, 14 Jun 2019 13:58:59 -0600
From:   Rob Herring <robh@kernel.org>
To:     Leif Middelschulte <leif.middelschulte@klsmartin.com>
Cc:     dmitry.torokhov@gmail.com, devicetree@vger.kernel.org,
        linux-input@vger.kernel.org, mark.rutland@arm.com
Subject: Re: [PATCH 09/10] dt-bindings: input: touchscreen: stmpe: add
 tracking index
Message-ID: <20190614195859.GA6351@bogus>
References: <20190527160736.30569-1-leif.middelschulte@klsmartin.com>
 <20190527161938.31871-1-leif.middelschulte@klsmartin.com>
 <20190527161938.31871-5-leif.middelschulte@klsmartin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190527161938.31871-5-leif.middelschulte@klsmartin.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, May 27, 2019 at 06:19:37PM +0200, Leif Middelschulte wrote:
> The tracking index is a "minimum" distance two touch
> points need to have in order for the second to be valid.
> This adds the corresponding binding property documentation.
> 
> Signed-off-by: Leif Middelschulte <leif.middelschulte@klsmartin.com>
> ---
>  .../bindings/input/touchscreen/stmpe.txt          | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/input/touchscreen/stmpe.txt b/Documentation/devicetree/bindings/input/touchscreen/stmpe.txt
> index 09d2d4f288cc..8696af35a7b8 100644
> --- a/Documentation/devicetree/bindings/input/touchscreen/stmpe.txt
> +++ b/Documentation/devicetree/bindings/input/touchscreen/stmpe.txt
> @@ -42,6 +42,21 @@ Optional properties:
>  				The given window also affects the value range (limits) set
>  				within the input subsystem which, in turn, affects
>  				the input resolution calculation on both axes.
> +- st,tracking-index	: Minimal distance between the current touch position and the previous
> +				touch position. If the distance is shorter than the tracking
> +				index, it is discarded. The tracking is calculated by summation
> +				of the horizontal and vertical movement.
> +				If pressure reporting is enabled (X/Y/Z), an increase in pressure
> +				override the movement tracking and report the new data set, even
> +				if X/Y is within the previous tracking index.
> +				0 -> disabled
> +				1 -> 4
> +				4 -> 8
> +				3 -> 16
> +				4 -> 32
> +				5 -> 64
> +				6 -> 92
> +				7 -> 127

This is what touchscreen-fuzz-x/y is for.

>  - touchscreen-inverted-x: X axis is inverted (boolean)
>  - touchscreen-inverted-y: Y axis is inverted (boolean)
>  - touchscreen-swapped-x-y: X and Y axis are swapped (boolean)
> -- 
> 2.21.0
> 
