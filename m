Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 27E1C122E37
	for <lists+linux-input@lfdr.de>; Tue, 17 Dec 2019 15:12:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728669AbfLQOMC (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 17 Dec 2019 09:12:02 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:34460 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728575AbfLQOMC (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 17 Dec 2019 09:12:02 -0500
Received: by mail-ot1-f66.google.com with SMTP id a15so919899otf.1;
        Tue, 17 Dec 2019 06:12:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=7rqOZSsecbL2UhtBa4fx6RNVQTfn4hGMuYHOIPPf+Vg=;
        b=fb0I30PDXz6XyrKKiCrSrS98AXGcnwj5kzborhjfcEF+JuCbdA8rGVCuECur1w938L
         7yY4XX2uHmQm7ZpokrWq9SeMyO/bhgErbE3YPh9F5npHtoSbNdr9RftaShI0kEdgXvW8
         PHpN3PUKJKBHip5gdBgkjNNAKmeMWZBHBWQfgJ9t3IwlDcqa1rAZMmIVL+LMGcCVWxoj
         yeql20Xqrh6hjk6p6kPVGoGmWuA/TfvEY34qIK+U0XnBSqqj0Wne6yeg/dVPFoZ/3o/e
         yTP0JmjzdiOvfKYCoIc4KpuUBWWGxYRUlG17FfXQmEo7qkfwklX0dLvKxQ0LQ1dglimG
         s5mA==
X-Gm-Message-State: APjAAAVpystEA5NA7jOx/1z7WepZBseHhc+RL3E30d4q3jQxSSOrwXMk
        S2SyNtDN/ijJPK0m9Rr7gQ==
X-Google-Smtp-Source: APXvYqzpVlXg5lD8QaRZoYczlzBvb9EV2OaM1vk2lbqIALkgqhWBspcL5MF3P9ytTEuLdP0Xt2oy1Q==
X-Received: by 2002:a9d:1d02:: with SMTP id m2mr35624006otm.45.1576591921370;
        Tue, 17 Dec 2019 06:12:01 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id v25sm8050659otk.51.2019.12.17.06.12.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2019 06:12:00 -0800 (PST)
Date:   Tue, 17 Dec 2019 08:11:59 -0600
From:   Rob Herring <robh@kernel.org>
To:     Brian Masney <masneyb@onstation.org>
Cc:     sboyd@kernel.org, dmitry.torokhov@gmail.com, robh+dt@kernel.org,
        mark.rutland@arm.com, agross@kernel.org,
        bjorn.andersson@linaro.org, mturquette@baylibre.com,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: Re: [PATCH 2/7] dt-bindings: Input: drop msm-vibrator in favor of
 clk-vibrator
Message-ID: <20191217141159.GA21795@bogus>
References: <20191205002503.13088-1-masneyb@onstation.org>
 <20191205002503.13088-3-masneyb@onstation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191205002503.13088-3-masneyb@onstation.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed,  4 Dec 2019 19:24:58 -0500, Brian Masney wrote:
> Let's drop the msm-vibrator bindings so that the more generic
> clk-vibrator can be used instead. No one is currently using these
> bindings so this won't affect any users.
> 
> Signed-off-by: Brian Masney <masneyb@onstation.org>
> ---
>  .../bindings/input/msm-vibrator.txt           | 36 -------------------
>  1 file changed, 36 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/input/msm-vibrator.txt
> 

Acked-by: Rob Herring <robh@kernel.org>
