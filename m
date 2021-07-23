Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4819B3D4267
	for <lists+linux-input@lfdr.de>; Fri, 23 Jul 2021 23:49:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231940AbhGWVI1 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 23 Jul 2021 17:08:27 -0400
Received: from mail-io1-f48.google.com ([209.85.166.48]:36366 "EHLO
        mail-io1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231724AbhGWVI1 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 23 Jul 2021 17:08:27 -0400
Received: by mail-io1-f48.google.com with SMTP id f11so4247745ioj.3;
        Fri, 23 Jul 2021 14:48:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=GEHnR8wnZdVWKsoL7aIm5Zq5iQrmgflNJ+/CdIL9oX0=;
        b=kUQB+EqEGeJjWctxQtn8KoyGZ06CIiY8dNzrscQQsLPu0p4whapQBUk4voxAW7a1JH
         Uwe6vKQwcKBMkAm8mzbHG5sWlN7gcyNQ27Ui3dj2JjqXZbockGtjhumaPS8aJBcf3NCS
         n9LJeTc1PtXnevjLGGaozL9XUmrRnbkUlbKGqFArx3UT8ajxB5KEiQgxOl8Cg4Kj/vk2
         Q0doWI6sOo4HrLYLLyAzqC9n6ZbHWNb5BRgmhg+2ua3PHJRFJ5+MNToVVRVLnqehBAsJ
         bLibdFJ2ampM9oj1bYtgtz5M7AzpFMBy7/R6Bh3UIqulOClWxbd4VFFFd70Dt9qPxG1B
         nd6A==
X-Gm-Message-State: AOAM531LFNm4FD020kXdN1n67rLgJHPF+yrjuKr1eWGEuNZ++3rnMCuI
        lYRVanjTJowv6zoUyaVt6Q==
X-Google-Smtp-Source: ABdhPJzuVZ1dNIeAQVwYqHc4x9p/qBWaDfx0fJeDGxNUB1qanlOeacDoC3UAFMIfsCd+dp6cd22ANw==
X-Received: by 2002:a05:6638:3452:: with SMTP id q18mr5847852jav.111.1627076938750;
        Fri, 23 Jul 2021 14:48:58 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id r8sm19003488iov.39.2021.07.23.14.48.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jul 2021 14:48:58 -0700 (PDT)
Received: (nullmailer pid 2650952 invoked by uid 1000);
        Fri, 23 Jul 2021 21:48:54 -0000
Date:   Fri, 23 Jul 2021 15:48:54 -0600
From:   Rob Herring <robh@kernel.org>
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     devicetree@vger.kernel.org,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        linux-sunxi@googlegroups.com,
        Frank Rowand <frowand.list@gmail.com>,
        linux-arm-kernel@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, linux-input@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH 16/54] dt-bindings: input: Convert ChipOne ICN8318
 binding to a schema
Message-ID: <20210723214854.GA2650907@robh.at.kernel.org>
References: <20210721140424.725744-1-maxime@cerno.tech>
 <20210721140424.725744-17-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210721140424.725744-17-maxime@cerno.tech>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, 21 Jul 2021 16:03:46 +0200, Maxime Ripard wrote:
> The ChipOne ICN8318 Touchscreen Controller is supported by Linux thanks
> to its device tree binding.
> 
> Now that we have the DT validation in place, let's convert the device
> tree bindings for that driver over to a YAML schema.
> 
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Cc: Hans de Goede <hdegoede@redhat.com>
> Cc: linux-input@vger.kernel.org
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  .../input/touchscreen/chipone,icn8318.yaml    | 62 +++++++++++++++++++
>  .../input/touchscreen/chipone_icn8318.txt     | 44 -------------
>  2 files changed, 62 insertions(+), 44 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/input/touchscreen/chipone,icn8318.yaml
>  delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/chipone_icn8318.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
