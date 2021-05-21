Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42C7738BBA3
	for <lists+linux-input@lfdr.de>; Fri, 21 May 2021 03:36:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236956AbhEUBhl (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 20 May 2021 21:37:41 -0400
Received: from mail-ot1-f51.google.com ([209.85.210.51]:46065 "EHLO
        mail-ot1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236767AbhEUBhk (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 20 May 2021 21:37:40 -0400
Received: by mail-ot1-f51.google.com with SMTP id t10-20020a05683022eab0290304ed8bc759so16614020otc.12;
        Thu, 20 May 2021 18:36:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ET1FSInmi9xWe6G3649W8hSLkl02LpJjSYxXmmaIbsg=;
        b=PWdaHL9Fpl3KuU0sHfj66axILqlsr1rl28gReSnE+Xau2qfAujOjeBKllqkTAOgBfx
         +TkWvTEx+ET13cvvBLGojiOrl8Z0iqbrA1TQsPo1Hkvgahzu7FLwtbSHkz7FbXDbXzem
         sJBjdgCX+s9CwkN764l4YNKqXH0fDwGFUgivEAtRw10fcrzyDP+ZyBjt0WOPDhi7p/+U
         j7UZw+o+g5t5DCjU78083CTCKX3waX8P/qFBTPL+nURRa4NYScSvl/P7nR452AQKIjxJ
         uLw2wXfjDNYNdSTLcbKIXjBnmCJCENZbU5qpKiswnhq8q2KwrlzubuG1an6lgUPO//xp
         6Clg==
X-Gm-Message-State: AOAM530Zc663KiPNmoivbLizcTOITQyFuMaFRvl9rC2vvMbQ9Daum3xa
        2/srSDAkGw43MtEwBiUKrw==
X-Google-Smtp-Source: ABdhPJwf6HtOpo1GD+1h2f2qQ2grSAw426WIcg+cZz8R77ZcBEjj4AxNJ2lkRUXhXpnBcx++hkbJfw==
X-Received: by 2002:a9d:62d2:: with SMTP id z18mr6152926otk.78.1621560977453;
        Thu, 20 May 2021 18:36:17 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id s85sm913372oos.4.2021.05.20.18.36.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 May 2021 18:36:16 -0700 (PDT)
Received: (nullmailer pid 2453887 invoked by uid 1000);
        Fri, 21 May 2021 01:36:16 -0000
Date:   Thu, 20 May 2021 20:36:16 -0500
From:   Rob Herring <robh@kernel.org>
To:     Oleksij Rempel <o.rempel@pengutronix.de>
Cc:     linux-input@vger.kernel.org,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        kernel@pengutronix.de, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        David Jander <david@protonic.nl>, linux-kernel@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 4/5] dt-bindings: touchscreen: resistive-adc-touch:
 add support for z1 and z2 channels
Message-ID: <20210521013616.GA2453857@robh.at.kernel.org>
References: <20210519094221.27792-1-o.rempel@pengutronix.de>
 <20210519094221.27792-5-o.rempel@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210519094221.27792-5-o.rempel@pengutronix.de>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, 19 May 2021 11:42:20 +0200, Oleksij Rempel wrote:
> For pressure calculation based on plates resistance we need some additional
> properties:
> - z1 and z2 channels with additional measurements between plates
> - actual resistance of the touchscreen. Currently we use only
>   X-resistance.
> 
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> ---
>  .../input/touchscreen/resistive-adc-touch.yaml   | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
