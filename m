Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F89F43E9F3
	for <lists+linux-input@lfdr.de>; Thu, 28 Oct 2021 23:05:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230484AbhJ1VII (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 28 Oct 2021 17:08:08 -0400
Received: from mail-oo1-f43.google.com ([209.85.161.43]:45824 "EHLO
        mail-oo1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230404AbhJ1VIH (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 28 Oct 2021 17:08:07 -0400
Received: by mail-oo1-f43.google.com with SMTP id o26-20020a4abe9a000000b002b74bffdef0so2585618oop.12;
        Thu, 28 Oct 2021 14:05:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=JHySk+SkYhgYJQAqNXe5gaa90ruTg2s4WjfHJuWIpfM=;
        b=oRgaTyn52iinIgyBIqZ4ozYVCqXQpBlftq6xVk8TcBa1buMj9m8JTwDt+IVLUZQeOJ
         Bci+BRUcY0lqTq26y+dhuLib0fPVyNNw87ntqgJ4H/nOVSeBT788gUgPhO/SW2Cg5gCc
         NARS3t36sM3uz2A829oe6FM6yiaHze++LZk80+w+pgV6fc/jqhJQUTSMuFdtRPeqeMLF
         KmZvp75FEj0PasBdGq0//ikwa/+X/ZyqRa2QYhHQwzi/nh925dUFuMc66ZV905W8M3/g
         FC97oiVkd1IAjYTEBAz1mIb/jrkqnIkU1fKQgu9708G4qc498wwHvC6gJarvI1nKLsnl
         gPXw==
X-Gm-Message-State: AOAM532FMT60tfMyqtTf26pyb44Qv6RSSx/gkWgWidHjHf/Y2HMgZuYL
        D/zZ/nnMyyGvt8ApkXyiYBmJN3y94A==
X-Google-Smtp-Source: ABdhPJzD9IMrmrZBC3YukNwiR3mYzbAcneZDE1J1pg/mAl8fjZ1qHRBXz/82qHgg99ZOehT9EjfwgA==
X-Received: by 2002:a4a:e597:: with SMTP id o23mr4847998oov.96.1635455139883;
        Thu, 28 Oct 2021 14:05:39 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id r5sm1259145oov.48.2021.10.28.14.05.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Oct 2021 14:05:39 -0700 (PDT)
Received: (nullmailer pid 584656 invoked by uid 1000);
        Thu, 28 Oct 2021 21:05:38 -0000
Date:   Thu, 28 Oct 2021 16:05:38 -0500
From:   Rob Herring <robh@kernel.org>
To:     David Heidelberg <david@ixit.cz>
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-input@vger.kernel.org, ~okias/devicetree@lists.sr.ht,
        Rob Herring <robh+dt@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH v2] dt-bindings: input: microchip,cap11xx: Convert txt
 bindings to yaml
Message-ID: <YXsQotuqRjgMvEQE@robh.at.kernel.org>
References: <20211019234816.32060-1-david@ixit.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211019234816.32060-1-david@ixit.cz>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, 20 Oct 2021 01:48:16 +0200, David Heidelberg wrote:
> Convert binding for the Microchip CAP11xx series HW to the YAML syntax.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
> v2:
>  - changed mail to robh (original author seems to be not actively
>    maintaining the driver since 2015)
>  - common.yaml path fixed
>  - $ref input.yaml added
> 
>  .../devicetree/bindings/input/cap11xx.txt     |  78 ---------
>  .../bindings/input/microchip,cap11xx.yaml     | 148 ++++++++++++++++++
>  2 files changed, 148 insertions(+), 78 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/input/cap11xx.txt
>  create mode 100644 Documentation/devicetree/bindings/input/microchip,cap11xx.yaml
> 

Applied, thanks!
