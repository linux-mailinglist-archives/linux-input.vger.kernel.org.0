Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D2EAE46863
	for <lists+linux-input@lfdr.de>; Fri, 14 Jun 2019 21:55:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725908AbfFNTzJ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 14 Jun 2019 15:55:09 -0400
Received: from mail-qt1-f196.google.com ([209.85.160.196]:46847 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725802AbfFNTzJ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 14 Jun 2019 15:55:09 -0400
Received: by mail-qt1-f196.google.com with SMTP id h21so3842032qtn.13;
        Fri, 14 Jun 2019 12:55:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=akHMIxh6dxCfNK/0c9d39yOZVOFH2g28MUJs9dZQgbw=;
        b=fXi4BgDVcZAxAfVGsOQTg102JFAmq5aZFVTSt4mSkfBF4noKlcOFKLfTR2okE/7rLO
         PR/d+MBVsDqwcLHP6LwKxcn3CPLeZx95KYYIJh39CCv4X4mH+k7hHgxazhECM8ptdH5p
         hx8KipSW1ZtynehVOQyO0MnWcTOHE6R1GrvQ7AHWy7K6hd/eZVVfkWQvzr7x8L5VJBUt
         MR8qYMKL3V2I6iGDZKvQ2RxGiSkSeHWgDT+uAr39sEWHSvKDg624coAGOjHcwFDV3hOi
         jnSKLT3VGkLISscSSVlc0FTJJx2rTq+K7n1vSKeATEnCUgYgyqLNUjNKdv5bhPe3tEdt
         1jfw==
X-Gm-Message-State: APjAAAXee6IFwg3eaOex0431+AL5FlbbCRWqusDcLM1aOtpHF32YN7l5
        nfL/3SI5RtKiAcdrDCWLvA==
X-Google-Smtp-Source: APXvYqzNpO38tXdK79rW7JG4/r+xkUi7AXo2xpsL6rw04gxOHgXK61ekZBqgFHti/XVP2TI6BAwZBA==
X-Received: by 2002:ac8:41d1:: with SMTP id o17mr8186535qtm.17.1560542108474;
        Fri, 14 Jun 2019 12:55:08 -0700 (PDT)
Received: from localhost ([64.188.179.243])
        by smtp.gmail.com with ESMTPSA id q56sm2799636qtq.64.2019.06.14.12.55.07
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 14 Jun 2019 12:55:07 -0700 (PDT)
Date:   Fri, 14 Jun 2019 13:55:07 -0600
From:   Rob Herring <robh@kernel.org>
To:     Leif Middelschulte <leif.middelschulte@klsmartin.com>
Cc:     dmitry.torokhov@gmail.com, devicetree@vger.kernel.org,
        linux-input@vger.kernel.org, mark.rutland@arm.com
Subject: Re: [PATCH 03/10] dt-bindings: input: touchscreen: stmpe: add
 resolution support
Message-ID: <20190614195507.GA27083@bogus>
References: <20190527160736.30569-1-leif.middelschulte@klsmartin.com>
 <20190527160736.30569-4-leif.middelschulte@klsmartin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190527160736.30569-4-leif.middelschulte@klsmartin.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, May 27, 2019 at 06:07:29PM +0200, Leif Middelschulte wrote:
> This documents the support for specifying the screen size in milimeter
> and its impact on resolution calculation.
> 
> Signed-off-by: Leif Middelschulte <leif.middelschulte@klsmartin.com>
> ---
>  Documentation/devicetree/bindings/input/touchscreen/stmpe.txt | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/input/touchscreen/stmpe.txt b/Documentation/devicetree/bindings/input/touchscreen/stmpe.txt
> index 04962e2e1ad0..d20dc5a7d8ad 100644
> --- a/Documentation/devicetree/bindings/input/touchscreen/stmpe.txt
> +++ b/Documentation/devicetree/bindings/input/touchscreen/stmpe.txt
> @@ -39,6 +39,10 @@ Optional properties:
>  				The given window also affects the value range (limits) set
>  				within the input subsystem which, in turn, affects
>  				the input resolution calculation on both axes.
> +- touchscreen-x-mm	: horizontal length in mm of the touchscreen. It affects
> +				the input resolution calculation on the horizontal axis.
> +- touchscreen-y-mm	: vertical length in mm of the touchscreen. It affects
> +				the input resolution calculation on the vertical axis.

No need to define this again. Just reference the common definition. If 
you have any additional constraints, then add them.

Rob
