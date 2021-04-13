Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 95D6E35E415
	for <lists+linux-input@lfdr.de>; Tue, 13 Apr 2021 18:36:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345660AbhDMQgl (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 13 Apr 2021 12:36:41 -0400
Received: from mail-oi1-f176.google.com ([209.85.167.176]:40770 "EHLO
        mail-oi1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345371AbhDMQgk (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 13 Apr 2021 12:36:40 -0400
Received: by mail-oi1-f176.google.com with SMTP id u16so286642oiu.7;
        Tue, 13 Apr 2021 09:36:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=Su+smkv+Ue5t563FZXIHYLjuhV5cHzGEDiXfivp9QAk=;
        b=Rmvvjbd2soR0Iu3/3oBgEZsEiuBqWJRLTEEVJkU2PhaybNrHddlVwBAX5MSib19v3w
         6ry4r8DtJdrQTpWrEyPYlTo/GVti+euK10EjKGNZIB5I6Rm1xVRQ/LefrKICb50zLQwM
         grNtpxWfz7hCwpIYuflULCO9pPO+6scVgELpZk8EKn3MDm/V7Pe/b5NtSc/xwFyQQ2+U
         2SIazObPSQGBbzxFEbd752zEYE6IclKaLKeeiQ0wWPe9cacRxoZCihOFNscMMjJ5muPg
         0eKgyM1iub6fAcW9CgN7KK/b6HX3B2xZiKZT8uRPfY0+KAG67AHsq6mCyY1zuBKqcG/+
         PQjg==
X-Gm-Message-State: AOAM530c8+T8KjONXIJPS5rys6zHu7XXSD+neKm1LXK3x3mWgX9EF8eu
        j72J4atvw2V25A/9m4zpBw==
X-Google-Smtp-Source: ABdhPJyUkQidP41T7W71kLGQaTKNSiCw6vq26O4+vOFl9Siq1PhaG+cA01QgG7+kJsvUJZpfLzoPpg==
X-Received: by 2002:aca:3788:: with SMTP id e130mr571269oia.45.1618331775925;
        Tue, 13 Apr 2021 09:36:15 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id r136sm2973190oor.28.2021.04.13.09.36.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Apr 2021 09:36:14 -0700 (PDT)
Received: (nullmailer pid 1797270 invoked by uid 1000);
        Tue, 13 Apr 2021 16:36:13 -0000
Date:   Tue, 13 Apr 2021 11:36:13 -0500
From:   Rob Herring <robh@kernel.org>
To:     Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc:     devicetree@vger.kernel.org, linux-input@vger.kernel.org,
        Henrik Rydberg <rydberg@bitmath.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 2/3] dt-bindings: touchscreen: Add HY46XX bindings
Message-ID: <20210413163613.GA1797136@robh.at.kernel.org>
References: <CAL_JsqK6Bm==DaCMD3PruZoFO9iv0Te_KBVPnb9ZU0L8yDYF5Q@mail.gmail.com>
 <20210413144446.2277817-1-giulio.benetti@benettiengineering.com>
 <20210413144446.2277817-3-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210413144446.2277817-3-giulio.benetti@benettiengineering.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, 13 Apr 2021 16:44:45 +0200, Giulio Benetti wrote:
> This adds device tree bindings for the Hycon HY46XX touchscreen series.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
> V1->V2:
> As suggested by Rob Herring:
> * fixed $id: address
> * added "hycon," in front of every custom property
> * changed all possible property to boolean type
> * removed proximity-sensor-switch property since it's not handled in driver
> V2->V3:
> As suggested by Jonathan Neuschäfer:
> * fixed some typo
> * fixed description indentation
> * improved boolean properties descriptions
> * improved hycon,report-speed description
> V3->V4:
> * fixed binding compatible string in example as suggested by Jonathan Neuschäfer
> V4->V5:
> As suggested by Rob Herring:
> * drop hycon- prefix from compatible
> * use Hertz unit suffix for hycon,report-speed instead of u32
> * set hycon,report-speed minimum to 1Hz, 0Hz make controller to do nothing
> * change hycon,power-noise-enable property name to hycon,noise-filter-enable
> * improve hycon,filter-data property description
> * use generic touchscreen node name in example
> V5->V6:
> * changed report-speed property name into report-speed-hz according to
> Rob Herring's suggestion
> ---
>  .../input/touchscreen/hycon,hy46xx.yaml       | 119 ++++++++++++++++++
>  MAINTAINERS                                   |   6 +
>  2 files changed, 125 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/input/touchscreen/hycon,hy46xx.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
