Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 37CD713648F
	for <lists+linux-input@lfdr.de>; Fri, 10 Jan 2020 02:07:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730432AbgAJBHI (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 9 Jan 2020 20:07:08 -0500
Received: from mail-pf1-f193.google.com ([209.85.210.193]:44974 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730361AbgAJBHI (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 9 Jan 2020 20:07:08 -0500
Received: by mail-pf1-f193.google.com with SMTP id 195so253872pfw.11;
        Thu, 09 Jan 2020 17:07:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=M+cJhL6utbUMjjVLIhxuXAYebXL50BL58A60RAiYjlc=;
        b=vdN5vRutchUfrM/Dg7vRFvx7WfOOlbDCBfYwq/oLc4Zdd8npXhOU0egH+cMRdr8zRM
         h+V7HR4S5J63WwvJGnc0euIBDgPMTcO8asmbU7BumMEFY1qYGZayZy7CwFbDOPRfeBpD
         Sd4EpTdyc/OCWscAtkgSwjP1aiElsALONsu4NOAp6i8DfvCatNRkyALQq0u1Qpix3h03
         +6c8vVyhu0QTQ1NVoTjIFnXxvOPutebnkKX4vNBTEMkB/RBltqebDrW1UAFmL8OjsM7f
         tegblbvS3Z198ocLvsfMoMVefuIcbytpf4yLpIBxPPAZ7NRSP1tbDxwY9NnYAJnzTmRL
         dQ4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=M+cJhL6utbUMjjVLIhxuXAYebXL50BL58A60RAiYjlc=;
        b=p10z1lcArbc6JDZMiiWKkxh3IffAlI+12EyPbgdTxl2Zota5q3OcocqnCPCLzZ2VQG
         VP2uv6DauUm/FZu6SrA1dkjKuej7Eld4l4M2VwlPyj0y9xPLXXZki8xx0lgjjU7Sle7S
         a63ATcLLcY4Q3vvdKHSHJmzQXvLtfXsOkOeoOABI/ISwGAptHlF0h0xHYrw++58IscXu
         MVqi0fDHs8a6p9g9hphPSVLhsfS0ihuVUDIsL1SWZhUeHfuGhTmyFqM34ylLv9QgNdZc
         hX+DkN2sDJEK4VJc3/M2UPXwI1tWEC+vt6pkmCXeZJFRkme8YvnZTimh8H2LYgRbsHOZ
         o2DQ==
X-Gm-Message-State: APjAAAVrpV37Jd4GUXRGeMgPj7GbRNOyzu59O1fpw4uAYyCExowkhmc+
        1Ne6FrlOY6DZ8amwQ7FYjQ8=
X-Google-Smtp-Source: APXvYqzO9fqThNyq3zO6n07buOatEd/53VA19Ju6z6UvlfI1iqdcc5J5XCCCSErdKEjL+tAMmDicsQ==
X-Received: by 2002:aa7:87cf:: with SMTP id i15mr864934pfo.114.1578618427671;
        Thu, 09 Jan 2020 17:07:07 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id j14sm164489pgs.57.2020.01.09.17.07.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2020 17:07:07 -0800 (PST)
Date:   Thu, 9 Jan 2020 17:07:05 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Marco Felsch <m.felsch@pengutronix.de>
Cc:     robh+dt@kernel.org, andriy.shevchenko@linux.intel.com,
        bparrot@ti.com, andy.shevchenko@gmail.com,
        simon.budig@kernelconcepts.de, hdegoede@redhat.com, fcooper@ti.com,
        mripard@kernel.org, alexandre.belloni@bootlin.com,
        shawnguo@kernel.org, devicetree@vger.kernel.org,
        kernel@pengutronix.de, linux-input@vger.kernel.org,
        Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 3/6] dt-bindings: Input: edt-ft5x06 - document
 wakeup-source capability
Message-ID: <20200110010705.GM8314@dtor-ws>
References: <20200108111050.19001-1-m.felsch@pengutronix.de>
 <20200108111050.19001-4-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200108111050.19001-4-m.felsch@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Jan 08, 2020 at 12:10:47PM +0100, Marco Felsch wrote:
> The current driver behaviour was to enable the wakeup-source everytime.
> After discussion [1] we decided to change that behaviour so the device
> will act as wakeup-source only if the "wakeup-source" dt-property is
> present.
> 
> The patch adds the binding documentation to enable the wakeup-source
> capability.
> 
> [1] https://patchwork.kernel.org/patch/11149037/
> 
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> Tested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

Applied, thank you.

> ---
> v2:
> - make use of common dt-property wakeup-source
> - adapt commit message
> ---
>  .../devicetree/bindings/input/touchscreen/edt-ft5x06.txt        | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.txt b/Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.txt
> index 0f6950073d6f..0e57315e9cbd 100644
> --- a/Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.txt
> +++ b/Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.txt
> @@ -36,6 +36,8 @@ Optional properties:
>   - pinctrl-0:   a phandle pointing to the pin settings for the
>                  control gpios
>  
> + - wakeup-source: If present the device will act as wakeup-source
> +
>   - threshold:   allows setting the "click"-threshold in the range
>                  from 0 to 80.
>  
> -- 
> 2.20.1
> 

-- 
Dmitry
