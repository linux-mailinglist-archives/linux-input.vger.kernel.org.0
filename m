Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DBAD238BB9F
	for <lists+linux-input@lfdr.de>; Fri, 21 May 2021 03:35:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236908AbhEUBg5 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 20 May 2021 21:36:57 -0400
Received: from mail-oi1-f179.google.com ([209.85.167.179]:41952 "EHLO
        mail-oi1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236767AbhEUBg5 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 20 May 2021 21:36:57 -0400
Received: by mail-oi1-f179.google.com with SMTP id c3so18225537oic.8;
        Thu, 20 May 2021 18:35:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=l+aMVtDC3SxgA2A3Wt6ZM74CKXmCQpG3diZOoQvDKaA=;
        b=NDRBhhvp4kBtttXfSzqZokgVQq5ccDaaTSaEXZEKEUStlgdgwntIWUCzpeaVm3AEgn
         z0Yw4vM5aj4nxVP5jWXD+SyTG5rBjF0Sbcnr93Lktxgq2HA4qk7NacvzN8WLwPAxrJr3
         8OjEqYbWOfYSnmrdY+8d+sIL89FasPWnN6X773U07HMuTkTPl66wp4eeNvlpQ/CAdZpV
         RyDDtlHkIgI5fNUxN0lGyQtX0r9BT1urqgp6OGi0p9hTsl3GvtDPwIzkiLCku3JTlEVa
         0iK9UK+NPpQAfwBCZtTv5o/X09DgCAbFvCtDjbm9fmq4C/TyUQBw1pSCKqV/ckfI5VEX
         iSEA==
X-Gm-Message-State: AOAM533LEcOi4NaPL30x/0+z2dn4oc8/Wns4Tsp3nobD8ykMnFMhTkEO
        lvjm8kVSrMZEnEaZNsktNg==
X-Google-Smtp-Source: ABdhPJxzzKZWp1RdZPzryKFvk40gOZnwxet5OlSDuvRgzdtZU6KnaCUp9YPiOFExxv+4L4kLTxb8Kw==
X-Received: by 2002:aca:1819:: with SMTP id h25mr257977oih.168.1621560933588;
        Thu, 20 May 2021 18:35:33 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id q5sm633804oia.31.2021.05.20.18.35.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 May 2021 18:35:33 -0700 (PDT)
Received: (nullmailer pid 2452472 invoked by uid 1000);
        Fri, 21 May 2021 01:35:31 -0000
Date:   Thu, 20 May 2021 20:35:31 -0500
From:   Rob Herring <robh@kernel.org>
To:     Oleksij Rempel <o.rempel@pengutronix.de>
Cc:     Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        kernel@pengutronix.de, linux-input@vger.kernel.org,
        David Jander <david@protonic.nl>,
        Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v4 3/5] dt-bindings: touchscreen: add
 touchscreen-x/y-plate-ohms property
Message-ID: <20210521013531.GA2452443@robh.at.kernel.org>
References: <20210519094221.27792-1-o.rempel@pengutronix.de>
 <20210519094221.27792-4-o.rempel@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210519094221.27792-4-o.rempel@pengutronix.de>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, 19 May 2021 11:42:19 +0200, Oleksij Rempel wrote:
> Te calculate the pressure on a restrictive touchscreen we need need to
> know resistance at least of X plate. Some calculations need to use both
> X and Y values.
> So, add generic properties which can be used by all drivers
> 
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> ---
>  .../devicetree/bindings/input/touchscreen/touchscreen.yaml  | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
