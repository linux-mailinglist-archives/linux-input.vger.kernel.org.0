Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C605A46848
	for <lists+linux-input@lfdr.de>; Fri, 14 Jun 2019 21:48:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725868AbfFNTsV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 14 Jun 2019 15:48:21 -0400
Received: from mail-qt1-f196.google.com ([209.85.160.196]:43869 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725802AbfFNTsV (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 14 Jun 2019 15:48:21 -0400
Received: by mail-qt1-f196.google.com with SMTP id z24so3833320qtj.10;
        Fri, 14 Jun 2019 12:48:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=DTGoqwiweSV6aeoF5XhZdEP/I2kRjVOKyDX4TOs6e8Q=;
        b=XFhzltiN6JAbI+sy0zoU+1OjY+PkjtRwoB7WWxlSek7mIdA8zYGTaC9qnMle/uC9oo
         AScdT+0vzHQ5qoDf3+OaVeicO3frOvH1ZcVCwvi0TePf/xx4+m2Mky3NMpLP6eZYBrEX
         iQSfZ0+GqCbrfQQW+wcgsa71AwBx+3YPY0GAJtJM0s9z1B4BoZ2rEx4xYrl4Zg5uwQm1
         /DRs85lJIh4AqUHuKwhbkUX1QHQhpWyr+ZrW1BHXmsz+CnFQI8bXTz4re64ZCCFZbl+Y
         5ttFl6Zbhae7zx8gGBUhIs3QhilJS2PcecZnlhe8gFVbzIMJ6w1XrCx/rk8AtlC+6GXk
         tWpw==
X-Gm-Message-State: APjAAAUjE0uR7oGZyE9u8qxIRLI6+QZ27QbIjMmLVgUSYx2At8Qn9qdb
        CFLHRPYiA6/zowRQwj+tvg==
X-Google-Smtp-Source: APXvYqxyumh5JC93QWAZwXi8bX94Ds4TbWmpcIrpYq7YqS0rxdhfLuMKOXx6WhiNp6ruOkDa/7R9sw==
X-Received: by 2002:ac8:2379:: with SMTP id b54mr22088712qtb.168.1560541699846;
        Fri, 14 Jun 2019 12:48:19 -0700 (PDT)
Received: from localhost ([64.188.179.243])
        by smtp.gmail.com with ESMTPSA id t29sm2564313qtt.42.2019.06.14.12.48.19
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 14 Jun 2019 12:48:19 -0700 (PDT)
Date:   Fri, 14 Jun 2019 13:48:18 -0600
From:   Rob Herring <robh@kernel.org>
To:     Leif Middelschulte <leif.middelschulte@klsmartin.com>
Cc:     dmitry.torokhov@gmail.com, devicetree@vger.kernel.org,
        linux-input@vger.kernel.org, mark.rutland@arm.com
Subject: Re: [PATCH 01/10] dt-bindings: input: touchscreen: stmpe: add touch
 window configuration
Message-ID: <20190614194818.GA22146@bogus>
References: <20190527160736.30569-1-leif.middelschulte@klsmartin.com>
 <20190527160736.30569-2-leif.middelschulte@klsmartin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190527160736.30569-2-leif.middelschulte@klsmartin.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, May 27, 2019 at 06:07:27PM +0200, Leif Middelschulte wrote:
> The STMPE811 is able to only monitor a subwindow of the
> entire screen. Touches outside of this window are neglected.
> This change adds the corresponding documentation.

Unless you are trying to just filter out the edge values which I think 
we already have properties for, wouldn't this be something the user 
may want to adjust/move at runtime?

> 
> Signed-off-by: Leif Middelschulte <leif.middelschulte@klsmartin.com>
> ---
>  .../devicetree/bindings/input/touchscreen/stmpe.txt      | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/input/touchscreen/stmpe.txt b/Documentation/devicetree/bindings/input/touchscreen/stmpe.txt
> index c549924603d2..04962e2e1ad0 100644
> --- a/Documentation/devicetree/bindings/input/touchscreen/stmpe.txt
> +++ b/Documentation/devicetree/bindings/input/touchscreen/stmpe.txt
> @@ -33,6 +33,13 @@ Optional properties:
>  - st,i-drive		: current limit value of the touchscreen drivers
>  				0 -> 20 mA (typical 35mA max)
>  				1 -> 50 mA (typical 80 mA max)
> +- st,window-tracking	: An u12 array that allows to pre-set a sub-window in the touchscreen.

u16?

> +				Any touch position that is outside the sub-window is discarded
> +				(top-right x, top-right y, bottom-left x, bottom-left y).
> +				The given window also affects the value range (limits) set
> +				within the input subsystem which, in turn, affects
> +				the input resolution calculation on both axes.
> +
>  
>  Optional properties common with MFD (deprecated):
>   - st,sample-time	: ADC conversion time in number of clock.
> @@ -101,6 +108,8 @@ stmpe811@41 {
>  		 * current limit value
>  		 */
>  		st,i-drive = <1>;
> +		/* enable entire window */
> +		st,window-tracking = /bits/ 16 <4095 4095 0 0>;
>  	};
>  	stmpe_adc {
>  		compatible = "st,stmpe-adc";
> -- 
> 2.21.0
> 
