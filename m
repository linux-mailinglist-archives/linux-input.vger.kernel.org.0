Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7D0E7B53A8
	for <lists+linux-input@lfdr.de>; Tue, 17 Sep 2019 19:08:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730791AbfIQRHs (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 17 Sep 2019 13:07:48 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:35233 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727398AbfIQRHr (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 17 Sep 2019 13:07:47 -0400
Received: by mail-pf1-f196.google.com with SMTP id 205so2538541pfw.2;
        Tue, 17 Sep 2019 10:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=XD9SG7vl2EiQGBElZCh6migVsB7ZbmqK8Jqpp/W1o1E=;
        b=Fgj4HFMrk4+/1bxzotMmyTQxQh9GnXWldcLojvTQLgU20RQWS1E97VldVjqkGfTR9v
         ica5pzgZROEpXGqWLI8yP79aRZvFPnF1WocANtRt9zAfl8sVzzOCJNC9/pE76Ho3ARwp
         pvDdkt+mJH1K67vNdgZGHR6FVhkeVARXAEWa5P0wLzpTRBkI5gnYUspQqRAe0RkqQLF0
         rBA8Nk1Pdq/pdg/2zuJPvzmay+h7RU8NyJMclp18gcjnIepoMGIWPtKReKsz5LLwscXq
         5+oh+y0WqkHoDLlg5Zv2GireMaMuiRjR7oGy3j8Usxr/JVUNeBRBxqfD5HEZpwtHZqgO
         0ZsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=XD9SG7vl2EiQGBElZCh6migVsB7ZbmqK8Jqpp/W1o1E=;
        b=gwe5XjaS/a7cNVbY1HfpU4f8YOn3ZoiDCXAjwUCGGVwOMmLtos0vKWOv3q8Hb93YwX
         ZQ4aM6g3y53uHI7MUQSsZk2cHbm+9qvQuPMbSbHX+Y4CsRaNRe02Q3SB00YDLDSy0zjo
         Kg9shXBeiLkM3RtkJAM3pyVSJN0kHJu3ZVN58I4Q9Yorh31tXcNgD1SAEJ5oBYcyKMEz
         wpv4VhupkU1adesnwigmtHTRyufRmGQsNbNH06VLTJhDRWBE7zOvc9EBEbSa8jQgcpkG
         PeOhabgavttGljllXslB4ATrPe95/dt2BwTPKD81vHJWnaNx84PtLVbiuQxvl7YZ3NO9
         MxGw==
X-Gm-Message-State: APjAAAWoCYr7PpNRRp6TOGVWQDjgciJJuJezFyxL2idjTpuijpVgvrKZ
        xoIIefJLX9OO7FVUKmiOrUQ=
X-Google-Smtp-Source: APXvYqwChsTq10x+bKhqoisADNSRJjZXGxzbJzRhd+Soory6OdJUnJeLh6d59QvZF353vIiBtbRnoQ==
X-Received: by 2002:a17:90a:ca05:: with SMTP id x5mr5933815pjt.66.1568740066689;
        Tue, 17 Sep 2019 10:07:46 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id z2sm5337314pfq.58.2019.09.17.10.07.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Sep 2019 10:07:45 -0700 (PDT)
Date:   Tue, 17 Sep 2019 10:07:43 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Marco Felsch <m.felsch@pengutronix.de>
Cc:     robh+dt@kernel.org, andriy.shevchenko@linux.intel.com,
        bparrot@ti.com, andy.shevchenko@gmail.com,
        simon.budig@kernelconcepts.de, hdegoede@redhat.com, fcooper@ti.com,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        kernel@pengutronix.de
Subject: Re: [PATCH 2/6] dt-bindings: Input: edt-ft5x06 - add disable
 wakeup-source documentation
Message-ID: <20190917170743.GO237523@dtor-ws>
References: <20190917155808.27818-1-m.felsch@pengutronix.de>
 <20190917155808.27818-3-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190917155808.27818-3-m.felsch@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Sep 17, 2019 at 05:58:04PM +0200, Marco Felsch wrote:
> The default driver behaviour is to enable the wakeup-source everytime.
> There are hardware designs which have a dedicated gpio to act as wakeup
> device. So it must be allowed to disable the wakeup-source capability.
> 
> This patch adds the binding documentation to disable the wakeup-source
> capability.
> 
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> ---
>  .../devicetree/bindings/input/touchscreen/edt-ft5x06.txt      | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.txt b/Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.txt
> index 870b8c5cce9b..4d6524fe3cf4 100644
> --- a/Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.txt
> +++ b/Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.txt
> @@ -35,6 +35,10 @@ Optional properties:
>   - pinctrl-0:   a phandle pointing to the pin settings for the
>                  control gpios
>  
> + - edt,disable-wakeup-source: If left the device will act as wakeup-source
> +			      (for legacy compatibility). Add the property
> +			      so the device won't act as wakeup-source.

I think this is too ugly and I consider it being a bug in the driver
that it enables wakeup unconditionally.

Let's just update DTS in tree for devices that actually want it (I am
curious how many that do not declare "wakeup-source" have it working and
actually want it) and key the dirver behavior off the standard property.
Until we start seeing this controller in devices that actually have DTS
in hardware device tree I think it is better to use standard property.

Thanks.

-- 
Dmitry
