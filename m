Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6CDF3F1A2
	for <lists+linux-input@lfdr.de>; Tue, 30 Apr 2019 09:49:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726416AbfD3Ht2 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 30 Apr 2019 03:49:28 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:33019 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725554AbfD3Ht2 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 30 Apr 2019 03:49:28 -0400
Received: by mail-pl1-f196.google.com with SMTP id y3so5499919plp.0;
        Tue, 30 Apr 2019 00:49:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=NN5VE4KFrKUI333QPlAlsydKJrC/1siwOw6/mcPCc2E=;
        b=hvnwh9CahfvYJQ6y8mSV2Ix3GDOuhlFc7Xib9+E2gPG/x6JBU2B7fYfe5Q9Y3WttKg
         dWPbLtGC3icPtuk+ytdzJpZWmjKbH5ngqX4N/TR5qgGyHeMFp3jGmpr3ud+UcNvXmhz9
         +dpPtfjn49o1BYmhLLUvj/uKkvHz2+Xqw+dxqF3zxJGDcwHc3vdlz9UQVyBNU6L/rCoC
         pIedFoNTH0NL3K1dmLKWzM/J09U9LkrKoPGquuWbwVzHY06i39Bt3VVZ5XRwChyyc5aj
         pIdtK+D3JXy8Lw8zkq1xRTlLHHLTRBfCBQ2SVbyPk9puUSbr4EaIdvGkPfP91YWTSjpO
         ZK/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=NN5VE4KFrKUI333QPlAlsydKJrC/1siwOw6/mcPCc2E=;
        b=ltonsiwDqzxRgfqMOQNGm1sCAuREa8Ak8+btCoiWKyiaX4o2m3cDZrHlohmqGsqEze
         dw1c9DQw1E0tlhDwEw/oFL96N7+Lc/u1/HG3c9/EypHAwByAfvlEyTFy+iLMwEq3Mm6Q
         j41AEx5dL5VV8fYu0WD0+otQ4nQ/AKmCuGdTlIrITsFPqO4u0UcNrydbW2xFFp2NkdF0
         68kTI3vXFZwoJ6vflXiVOGi1tY5/xW7CjuJK9GeGPfMGyB0bVFpjL+CRuJY/028nSm0E
         EQmALh+4vzZY6Qow++UdpWymfIFPFYPUzNOvBQcRShKvARcdvvzMcxmI3ieKJfGHYeII
         G0Tw==
X-Gm-Message-State: APjAAAUnpNwh9y2zxxYjmJG8xX4aF3qrKbfysBzW8Bek4uspYCSshwvB
        VqL4hyF0tPnfijofgPJzBU33PYTf
X-Google-Smtp-Source: APXvYqxqW6aoCcJK6HENXH8rmOZMgfU89+vEMVDFXgRYSZK31Z8fmWAuQ5gYybd1ZzujaH54rUqaEQ==
X-Received: by 2002:a17:902:ba89:: with SMTP id k9mr27111464pls.96.1556610567332;
        Tue, 30 Apr 2019 00:49:27 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id y2sm3983188pfy.123.2019.04.30.00.49.26
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 Apr 2019 00:49:26 -0700 (PDT)
Date:   Tue, 30 Apr 2019 00:49:24 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Jeff LaBundy <jeff@labundy.com>
Cc:     devicetree@vger.kernel.org, linux-input@vger.kernel.org,
        rydberg@bitmath.org, robh+dt@kernel.org, mark.rutland@arm.com
Subject: Re: [PATCH v10 1/2] dt-bindings: input: touchscreen: iqs5xx: Add
 bindings
Message-ID: <20190430074924.GB148015@dtor-ws>
References: <1556540652-7616-1-git-send-email-jeff@labundy.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1556540652-7616-1-git-send-email-jeff@labundy.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Jeff,

On Mon, Apr 29, 2019 at 07:24:11AM -0500, Jeff LaBundy wrote:
> This patch adds binding documentation for the Azoteq IQS550/572/525
> family of trackpad/touchscreen controllers.
> 
> Signed-off-by: Jeff LaBundy <jeff@labundy.com>
> ---
> Changes in v10:
>   - None
> 
> Changes in v9:
>   - Corrected the polarity of the reset GPIO in the example node to match that
>     of the device's active-low NRST pin
>   - Removed previous Reviewed-by trailer as this file has since changed

Applied with minor formatting changes. I restored Rob's reviewed-by
since he was happy with the binding.

Thanks.

-- 
Dmitry
