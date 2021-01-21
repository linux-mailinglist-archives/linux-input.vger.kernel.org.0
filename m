Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A3C32FEFBA
	for <lists+linux-input@lfdr.de>; Thu, 21 Jan 2021 17:03:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387525AbhAUQCt (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 21 Jan 2021 11:02:49 -0500
Received: from mail-oi1-f171.google.com ([209.85.167.171]:43185 "EHLO
        mail-oi1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387448AbhAUQCq (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 21 Jan 2021 11:02:46 -0500
Received: by mail-oi1-f171.google.com with SMTP id q25so2602522oij.10;
        Thu, 21 Jan 2021 08:02:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=cmep6JspATXIylAow9lAiAF/n8EW1TwVpkVN9kbuivw=;
        b=ezgCmqe+KHm5nYi4YDAjFCEPIxtbfmIDhsqMUgv2yYZJwdZlBaKlXPIOIdEQ+W596o
         3DV2wVfTrppZIx5vzcTu+o9jrGuxExjNWgKHs7eRQxMbtTJ4ckkar/wwKyi18VRU7M8a
         S3rtJjDXc9zL+PHd3dYNJib3WVIjqM4UVvvZD/lOIVEgJkP9vSJI/TyW7FrrLokp61fh
         BZHrQ9lCVKs1ACo+V82SZczy4+whskdSosNLbyevHOznV5NX2AVg5Sjim/zz7gfc4Upt
         BiFgzTx990WWImBDqGXjVMA+WL07n0aqci8A66wi2Y1NaC1XuVqYxcYS/D7IhpSsaUvE
         5YOw==
X-Gm-Message-State: AOAM532Qdgr8L6JiNfpOVmUKpLsGdUcYoCzCODifhqnztn7NF19/hbaR
        zGmhrL/qOFXiW4eiidJ6gCPvXCw5sg==
X-Google-Smtp-Source: ABdhPJwQuvyNnC8G3jMr15hUy4CMoEEljRSmzFihPPgZerPZt2dLRLvUAxW75wOWf6efyoCyWghTfg==
X-Received: by 2002:aca:5185:: with SMTP id f127mr201045oib.18.1611244925371;
        Thu, 21 Jan 2021 08:02:05 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id s66sm1024169ooa.37.2021.01.21.08.02.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Jan 2021 08:02:04 -0800 (PST)
Received: (nullmailer pid 2814850 invoked by uid 1000);
        Thu, 21 Jan 2021 16:01:58 -0000
From:   Rob Herring <robh@kernel.org>
To:     Vincent Knecht <vincent.knecht@mailoo.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Michael Srba <Michael.Srba@seznam.cz>,
        ~postmarketos/upstreaming@lists.sr.ht, linux-input@vger.kernel.org,
        Henrik Rydberg <rydberg@bitmath.org>,
        Rob Herring <robh+dt@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
In-Reply-To: <20210121113904.1272852-1-vincent.knecht@mailoo.org>
References: <20210121113904.1272852-1-vincent.knecht@mailoo.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: input/touchscreen: add bindings for msg26xx
Date:   Thu, 21 Jan 2021 10:01:58 -0600
Message-Id: <1611244918.552726.2814849.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, 21 Jan 2021 12:38:52 +0100, Vincent Knecht wrote:
> This adds dts bindings for the mstar msg26xx touchscreen.
> 
> Signed-off-by: Vincent Knecht <vincent.knecht@mailoo.org>
> ---
> Changed in v2:
> - changed M-Star to MStar in title line
> - changed reset gpio to active-low in example section
> ---
>  .../input/touchscreen/mstar,msg26xx.yaml      | 66 +++++++++++++++++++
>  1 file changed, 66 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/input/touchscreen/mstar,msg26xx.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/input/touchscreen/mstar,msg26xx.example.dt.yaml: touchscreen@26: 'touchscreen-size-x', 'touchscreen-size-y' do not match any of the regexes: 'pinctrl-[0-9]+'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/input/touchscreen/mstar,msg26xx.yaml

See https://patchwork.ozlabs.org/patch/1429752

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

