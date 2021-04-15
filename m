Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E867F360FFC
	for <lists+linux-input@lfdr.de>; Thu, 15 Apr 2021 18:19:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232913AbhDOQTp (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 15 Apr 2021 12:19:45 -0400
Received: from mail-oi1-f176.google.com ([209.85.167.176]:45696 "EHLO
        mail-oi1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231137AbhDOQTo (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 15 Apr 2021 12:19:44 -0400
Received: by mail-oi1-f176.google.com with SMTP id d12so24804076oiw.12;
        Thu, 15 Apr 2021 09:19:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=GXye7ilx4veJ07ZVeVmgMNULd7IMBz/+McBaXjxXerM=;
        b=gcVJOyS49YY+ctlBFmsV9XBy7XQc7CsvlDm3qY3cvv4R9Ib9A6k60UXJ65K/JD3ySs
         6tI0UeJ6YTV6Od06JnOtK4r7hh9NPOVhwjNgSDUGgGij3l0oZBktXsncGK5ki/Vdoazc
         r/SM8cq/sJp5fNO/n+h5/u/iF/++9eb/gsD6a2PclW0mfh3XR0wNREG7bJTiDwfuforT
         CPUTP5MdEceWaMiY0DHAdaix+Abbpt7WzsogzyoXJ9z88k6kiVYZuvO2qFemdXzhIWE2
         TOY8JzcwfyM3kyY267SRyWbQQbncRtv8492xqHaDzJcv1eQFqqtyn12JGOtufnoi6vTO
         VHxA==
X-Gm-Message-State: AOAM532X4PxFWwSh6HaSigSzqCLx5DN+3A68dIB0FpsvwiBLRQFEnrS3
        +ez1iJijrMd5LhpKTKU+tXfCeZ3+Yw==
X-Google-Smtp-Source: ABdhPJyeQLL2y0QA+dbez5K0gutVcFqswv7Wdzq3KQXbUiV+OGfji1iLQUUKLSZTSsW1GKMZTCB+Ng==
X-Received: by 2002:aca:fd81:: with SMTP id b123mr3062898oii.7.1618503560848;
        Thu, 15 Apr 2021 09:19:20 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id t19sm765773otm.40.2021.04.15.09.19.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Apr 2021 09:19:18 -0700 (PDT)
Received: (nullmailer pid 1506918 invoked by uid 1000);
        Thu, 15 Apr 2021 16:19:17 -0000
Date:   Thu, 15 Apr 2021 11:19:17 -0500
From:   Rob Herring <robh@kernel.org>
To:     Ikjoon Jang <ikjn@chromium.org>
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Guenter Roeck <groeck@chromium.org>,
        Lee Jones <lee.jones@linaro.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Benson Leung <bleung@chromium.org>, devicetree@vger.kernel.org,
        Nicolas Boichat <drinkcat@chromium.org>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Dmitry Torokhov <dtor@chromium.org>
Subject: Re: [PATCH v5 1/2] mfd: google,cros-ec: add DT bindings for a
 baseboard's switch device
Message-ID: <20210415161917.GA1506870@robh.at.kernel.org>
References: <20210415032958.740233-1-ikjn@chromium.org>
 <20210415032958.740233-2-ikjn@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210415032958.740233-2-ikjn@chromium.org>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, 15 Apr 2021 11:29:57 +0800, Ikjoon Jang wrote:
> This is for ChromeOS tablets which have a 'cros_cbas' switch device
> in the "Whiskers" base board. This device can be instantiated only by
> device tree on ARM platforms. ChromeOS EC doesn't provide a way to
> probe the device.
> 
> Signed-off-by: Ikjoon Jang <ikjn@chromium.org>
> 
> ---
> 
> Changes in v5:
>  - Add missing blank lines and change the description property's position.
>  - Add a note to description: "this device cannot be detected at runtime."
> 
> Changes in v4:
> Define cros-cbase bindings inside google,cros-ec.yaml instead of
> a separated binding document.
> 
>  .../bindings/mfd/google,cros-ec.yaml          | 20 +++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
