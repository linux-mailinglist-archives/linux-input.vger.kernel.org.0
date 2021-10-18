Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0156432832
	for <lists+linux-input@lfdr.de>; Mon, 18 Oct 2021 22:09:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233688AbhJRULs (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 18 Oct 2021 16:11:48 -0400
Received: from mail-oo1-f50.google.com ([209.85.161.50]:35583 "EHLO
        mail-oo1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233764AbhJRULr (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 18 Oct 2021 16:11:47 -0400
Received: by mail-oo1-f50.google.com with SMTP id s2-20020a4ac102000000b002b722c09046so326485oop.2;
        Mon, 18 Oct 2021 13:09:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=HpbD4I6fH5DGNqeKdVlFgnRPhvrv4A9lAHY9VBCcICc=;
        b=lRup7wHSmiWO0WTGi/DUoPtHGhBxOgcUNtS5vDa+qSI0319fESzg7vQcTAKz1GRirC
         gDYWAlmvAmk/WYQCBX4lxV8iseLJ2R2IrWG97VplKy7fw/WotLxjmBfZJ4oV7dEQ3RXm
         UVRcFylyTqNNTIAO+WBMvNpqRrfwtp2o4R8PNequOYUDIcYs6p7V9MiRgjqzNVyebQdR
         992V7iBaKhKk9IMmEu7OTZRQETZ/q4Lu34fuQHvNQBfGDU0dB9EbP/wEUhiBbxy+tNxi
         WzwOQcRl9CsNj22Ju3tROPUAMxIKW9EtoJw36YdVA8vbtGlwWi7gpWWlVgSQZ6Kf2+oP
         oUQQ==
X-Gm-Message-State: AOAM532K5/6035IKMKMymny1FkxJA9lDXs9Y2/0StnhqjpKdPPxX4J/M
        bX2m1QyQb/TyMPlFkes3FQ==
X-Google-Smtp-Source: ABdhPJwGIyPBfWe6lWFU5AO2rnY2lhI3kZFSJxfCJ6PpZnGugw0b1TxVKe1DRBwJXlbLlJR9d7Ubow==
X-Received: by 2002:a4a:e75a:: with SMTP id n26mr1468648oov.1.1634587775939;
        Mon, 18 Oct 2021 13:09:35 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id q12sm3153957oth.79.2021.10.18.13.09.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Oct 2021 13:09:35 -0700 (PDT)
Received: (nullmailer pid 2870690 invoked by uid 1000);
        Mon, 18 Oct 2021 20:09:34 -0000
Date:   Mon, 18 Oct 2021 15:09:34 -0500
From:   Rob Herring <robh@kernel.org>
To:     David Heidelberg <david@ixit.cz>
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        Dmitry Osipenko <digetx@gmail.com>,
        ~okias/devicetree@lists.sr.ht, linux-kernel@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v2] dt-bindings: input: elan,ekth3000: Convert txt
 bindings to yaml
Message-ID: <YW3Ufkxt4VPt5Mdw@robh.at.kernel.org>
References: <20211009183016.65218-1-david@ixit.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211009183016.65218-1-david@ixit.cz>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, 09 Oct 2021 20:30:16 +0200, David Heidelberg wrote:
> Convert Elan touchpad documentation to the YAML syntax.
> 
> Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
> v2
> - add additional space
> - correct uint8 -> uint32
> - change maintainer, original maintainer email doesn't exist
> 
>  .../bindings/input/elan,ekth3000.yaml         | 81 +++++++++++++++++++
>  .../devicetree/bindings/input/elan_i2c.txt    | 44 ----------
>  2 files changed, 81 insertions(+), 44 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/input/elan,ekth3000.yaml
>  delete mode 100644 Documentation/devicetree/bindings/input/elan_i2c.txt
> 

Applied, thanks!
