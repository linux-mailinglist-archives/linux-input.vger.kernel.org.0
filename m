Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E11AB35ABBE
	for <lists+linux-input@lfdr.de>; Sat, 10 Apr 2021 09:45:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229632AbhDJHpR (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 10 Apr 2021 03:45:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229472AbhDJHpR (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 10 Apr 2021 03:45:17 -0400
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76886C061762;
        Sat, 10 Apr 2021 00:45:03 -0700 (PDT)
Received: by mail-pf1-x432.google.com with SMTP id s11so5748000pfm.1;
        Sat, 10 Apr 2021 00:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=A7qHo22TZRNMA+/mUNXvKEnpqrhKD9AcxA2RK7Q4jDs=;
        b=ioO1CLGoJZt6fN1zf6gB1J5iOtjwE0SAM1kRpuP/tv2z/5adcIbASuBMWneZRrKrnA
         dI7T++xQZzIuTNiqIZKlinTUtO9BQGwHTgrMCEIprbAAqolx6FrBr35ZlvZ2+RU0szcf
         SUEWGRNnx6kskE8V9Mnqr/2tGdhM1ByRwyvzgvfYll4+STSIkL28nJdxA8Mu/G1oD4g4
         IN0Zu2sIvxO6skhnwyhnxC7MxJzZYFL6ZrsmW3Tc3/Tks2kmIj6h5335ErMTMOX9XJOr
         OoE3FPbQHPxhKFNhQtCe8iaeDWUn4VW+CsibxhYA+dNYjM6ZrnZcgThukzK4+Nuhcoc7
         zqig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=A7qHo22TZRNMA+/mUNXvKEnpqrhKD9AcxA2RK7Q4jDs=;
        b=Js0QixGISCdl3FG2Q938N0ZeC6CBpeZ1HI0nG6ceMe7PeGVgGjUmjTmZosX0bjdIA4
         fMhzHtVQ76kIJJzMqnUDxubSkKn7BIbmtq+2nFt6MsfiN7TW+ARLynrvkTwf7Ds6YDlw
         NbuBuHjjUlN7m4pRpU9Jd4kN7t3gJdHnSHK6w15YueIBEVDEZ/qrUf6P3g1dPCNJrC1G
         cWBgMIRBRq3txTCwP4ERQNFi3lxBH7biISFwoPVdWKb7t3Kba8p2Tw0h+XJixb/4Ik4o
         UG1hl5yd14PtSXRcCme2F9C5DzKue3PaWVUz/+/waQ2mhiVUI/3sc6F+1xxef/V/bboR
         PpIA==
X-Gm-Message-State: AOAM531FvfFN3o8HoV+z0YTwDtUDQNVm9dlGSuUEcIcl17uwU5A6m81R
        1Erl1ORyhXsw07PnzLW/Ikk=
X-Google-Smtp-Source: ABdhPJy2XFwxIKY6QiwDX/lD2aMlTwQsKbN0QCBxUXAT2cixr1Ygh44sblWDI0DntGZ/3JK+Tvzzdw==
X-Received: by 2002:a63:5a55:: with SMTP id k21mr16664137pgm.312.1618040702656;
        Sat, 10 Apr 2021 00:45:02 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:c9de:23b9:54df:4a55])
        by smtp.gmail.com with ESMTPSA id z17sm4445858pjn.47.2021.04.10.00.45.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Apr 2021 00:45:01 -0700 (PDT)
Date:   Sat, 10 Apr 2021 00:44:59 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Ferruh Yigit <fery@cypress.com>,
        Javier Martinez Canillas <javier@dowhile0.org>,
        Henrik Rydberg <rydberg@bitmath.org>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/8 v3] Input: cyttsp - Convert bindings to YAML and
 extend
Message-ID: <YHFXe5lnxy8nUbxE@google.com>
References: <20210408131153.3446138-1-linus.walleij@linaro.org>
 <20210408131153.3446138-2-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210408131153.3446138-2-linus.walleij@linaro.org>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Linus,

On Thu, Apr 08, 2021 at 03:11:46PM +0200, Linus Walleij wrote:
> +
> +  interrupts:
> +    description: Interrupt to host, must be flagged as
> +      IRQ_TYPE_EDGE_FALLING.

I do not think this is such a great idea to mandate falling edge
interrupt. In fact, on devices that can support it I think level
interrupts would be better.

And I would prefer if we dropped IRQF_TRIGGER_FALLING from
devm_request_threaded_irq() in drivers/input/touchscreen/cyttsp_core.c
and rely on the platform to specify appropriate trigger.

Thanks.

-- 
Dmitry
