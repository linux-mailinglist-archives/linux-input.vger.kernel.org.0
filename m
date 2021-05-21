Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BFE7738CBCD
	for <lists+linux-input@lfdr.de>; Fri, 21 May 2021 19:17:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230216AbhEURSe (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 21 May 2021 13:18:34 -0400
Received: from mail-ot1-f44.google.com ([209.85.210.44]:38604 "EHLO
        mail-ot1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230194AbhEURSd (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 21 May 2021 13:18:33 -0400
Received: by mail-ot1-f44.google.com with SMTP id i14-20020a9d624e0000b029033683c71999so7493259otk.5;
        Fri, 21 May 2021 10:17:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=gWRJRfF5WrMUuECU4YlIjOs9P+KdJ4LyClxNyp4ruw0=;
        b=Mpab85FW3FKJE7xl1LCGFeRS4V++NOAKifP16fz8Ah/OaZAEuIZ8wfgtga3LOwPr9I
         sf4wsaiVYlZyBj3rPNePh4dlZQt10Vcq7Km4czVrOtDDEU3ZdPisfIe5u3P4kT359+oc
         pgC1E42Jg3QitG7hyQ7M9IBrNItBQXRi5EkZSLJHLk9b4P9dvLWyBe2smtFgveHzMAFp
         U/7NBQ2FUwV5r9WOfdRa0SaOEpp4tqzSBD1NqgHKw8AISH1IkMx12JIZrUyCOD5ISipy
         5Np6+V3PNMQSqzJ6/OiDrlJIttR4MJB78EavijGJ2H1UXH/HKo/Ud4dIA80G/IrGtOlz
         kfCA==
X-Gm-Message-State: AOAM531xL4ZGD/k9RGTne2QK/SuyKEDfupYy3DJ9u2iB5ZYFvrGY9/kA
        EhK0ceDpHdzU7OmJJdpukGKV3459Sg==
X-Google-Smtp-Source: ABdhPJzfn2v0kjIRcoekHdll+etbLCHQTJj/xt9xYjIBklx0tvQZNE9QXGRqRYAk1Suqfi9s/oWz2A==
X-Received: by 2002:a9d:bc3:: with SMTP id 61mr9036884oth.7.1621617430251;
        Fri, 21 May 2021 10:17:10 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id u14sm1253947oif.41.2021.05.21.10.17.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 May 2021 10:17:09 -0700 (PDT)
Received: (nullmailer pid 30750 invoked by uid 1000);
        Fri, 21 May 2021 17:17:08 -0000
Date:   Fri, 21 May 2021 12:17:08 -0500
From:   Rob Herring <robh@kernel.org>
To:     Oleksij Rempel <o.rempel@pengutronix.de>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        kernel@pengutronix.de, linux-kernel@vger.kernel.org,
        linux-input@vger.kernel.org, David Jander <david@protonic.nl>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v5 3/8] dt-bindings: input: touchscreen: goodix: chnage
 node name to pass validation
Message-ID: <20210521171708.GA16279@robh.at.kernel.org>
References: <20210521044525.7397-1-o.rempel@pengutronix.de>
 <20210521044525.7397-4-o.rempel@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210521044525.7397-4-o.rempel@pengutronix.de>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, May 21, 2021 at 06:45:20AM +0200, Oleksij Rempel wrote:
> Change node name from gt928 -> touchscreen to pass dt_binding_check.

Well, at least you were consistent on the subject. :)

> 
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> ---
>  Documentation/devicetree/bindings/input/touchscreen/goodix.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Acked-by: Rob Herring <robh@kernel.org>
