Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F21C1302FF0
	for <lists+linux-input@lfdr.de>; Tue, 26 Jan 2021 00:17:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732692AbhAYXQ2 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 25 Jan 2021 18:16:28 -0500
Received: from mail-oi1-f176.google.com ([209.85.167.176]:36838 "EHLO
        mail-oi1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732105AbhAYXQY (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 25 Jan 2021 18:16:24 -0500
Received: by mail-oi1-f176.google.com with SMTP id d18so7298832oic.3;
        Mon, 25 Jan 2021 15:16:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Y8SknRKxss8n7RfRK+E579gYfvmeVKOv/GKQ9rXhrh0=;
        b=Urah7uwSgd2PA2c2r+A7cpSLD0LQIm86eUVvfBQHN9MmjExOPikbtEJCy36khYd+RO
         Qb5a/Z7RBGrNbHMNg5rXz0NWwxLMxGo1ZfBV7LCkAjBSUJQSS63zEJxoFoR7PpcpY0Fn
         V1oNA1eoE3vOHWeOCdojpKx2NHZgJxmpvA72k9ljIZeMQ1fksmkjLx5kP8x6/K0782lw
         uURwe46gPq4qsFdCo3K/z4p1/ugKOzhbR/8zTv4ifAgmpmV9dWTvgCAGDeI9oDUfx9cb
         mBCPcjnfRhmzv21pDUHBOGjuBIm1Z0EsErzFdC+ynXtyLts4aEFrPh0vGKBktS6S9hqO
         tdsg==
X-Gm-Message-State: AOAM531BNcUHikuEcEdNWOQt8fNRQcywOAvSJE7+dJsWt8Xdi3IveYaa
        8BgUiDmASBvue2f90kV8vA==
X-Google-Smtp-Source: ABdhPJwIBZW25e9WtD04Zr3vYWJmXgdb7ZxllQ0ztfFBEaWagU0lR/CU0LZeiVeyq6iwXSBtBIlsdA==
X-Received: by 2002:aca:cc03:: with SMTP id c3mr1451686oig.137.1611616543400;
        Mon, 25 Jan 2021 15:15:43 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id b188sm3799998oif.49.2021.01.25.15.15.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jan 2021 15:15:42 -0800 (PST)
Received: (nullmailer pid 1223567 invoked by uid 1000);
        Mon, 25 Jan 2021 23:15:40 -0000
Date:   Mon, 25 Jan 2021 17:15:40 -0600
From:   Rob Herring <robh@kernel.org>
To:     Philip Chen <philipchen@chromium.org>
Cc:     devicetree@vger.kernel.org, Guenter Roeck <groeck@chromium.org>,
        swboyd@chromium.org, linux-input@vger.kernel.org,
        dianders@chromium.org, Simon Glass <sjg@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        Benson Leung <bleung@chromium.org>, dmitry.torokhov@gmail.com,
        LKML <linux-kernel@vger.kernel.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>
Subject: Re: [PATCH v7 1/2] dt-bindings: input: cros-ec-keyb: Add a new
 property
Message-ID: <20210125231540.GA1223505@robh.at.kernel.org>
References: <20210115122412.v7.1.I025fb861cd5fa0ef5286b7dce514728e9df7ae74@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210115122412.v7.1.I025fb861cd5fa0ef5286b7dce514728e9df7ae74@changeid>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, 15 Jan 2021 12:24:29 -0800, Philip Chen wrote:
> Add a new property `function-row-physmap` to the
> device tree for the custom keyboard top row design.
> 
> The property describes the rows/columns of the top row keys
> from left to right.
> 
> Signed-off-by: Philip Chen <philipchen@chromium.org>
> ---
> 
> Changes in v7:
> - Use MATRIX_KEY macro to describe `function-row-physmap`
> 
> Changes in v6:
> - remove $ref and add `function-row-physmap` to the example
> 
> Changes in v5:
> - add minItems and maxItems for `function-row-physmap`
> 
> Changes in v2:
> - add `function-row-physmap` instead of `google,custom-keyb-top-row`
> 
>  .../bindings/input/google,cros-ec-keyb.yaml   | 24 +++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
