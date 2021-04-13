Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70B6C35E243
	for <lists+linux-input@lfdr.de>; Tue, 13 Apr 2021 17:07:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345564AbhDMPHj (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 13 Apr 2021 11:07:39 -0400
Received: from mail-ot1-f48.google.com ([209.85.210.48]:42590 "EHLO
        mail-ot1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238720AbhDMPHe (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 13 Apr 2021 11:07:34 -0400
Received: by mail-ot1-f48.google.com with SMTP id 101-20020a9d0d6e0000b02902816815ff62so10493791oti.9;
        Tue, 13 Apr 2021 08:07:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=XMxCuAt8yGV3bjHJ384HQjwpFcmXOkbWEeUKtOHG6x8=;
        b=e170ntUPhuw8nGMb8YysziGh+ouLY9TlLz1epkyDZebe1WWNPkKUCpqsVQFGbvBK++
         1FZFX3VCP+98JO9fSeEir13RQX5JFVmUEORgBbEmDu6M7DNAZoBN+/eRm+t2J7RbPdJc
         gV2RStei9LNyPFtOgi6R3ddBgabM++0Tjef5gA02mJXzjxz6EYhlKEQjGUFj3pAxudIP
         yC1mS0BYPPnJC9lWGT7zvPKL8CNAesdsHUC4N5SPDuHWRnz1TKw9h3NXmgADiCWXBZvd
         oxYMqG6UkvjkkgG/tPsXSHvupiFfeNe8Vp3AZIolTiGak3pku5av8FmRC1zzsFy0/y5J
         MS8A==
X-Gm-Message-State: AOAM531jlqHnAkma4hasq3oGP5/Duf33WbyyxVufGlwMSnJRqN917I3S
        GxCIpqTEuYqgBD6ILH+xovULoxo/9A==
X-Google-Smtp-Source: ABdhPJyKcxDc3UWZAMX83LBrzd/VCKV1nExf4mUHX0fy3poRtX3aaxgi+pJVXmIGi7FdEsoXjZvxYA==
X-Received: by 2002:a9d:d45:: with SMTP id 63mr28320565oti.238.1618326433127;
        Tue, 13 Apr 2021 08:07:13 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id n15sm2815754oos.1.2021.04.13.08.07.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Apr 2021 08:07:11 -0700 (PDT)
Received: (nullmailer pid 1683099 invoked by uid 1000);
        Tue, 13 Apr 2021 15:07:10 -0000
Date:   Tue, 13 Apr 2021 10:07:10 -0500
From:   Rob Herring <robh@kernel.org>
To:     Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc:     linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Henrik Rydberg <rydberg@bitmath.org>,
        devicetree@vger.kernel.org,
        Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 1/2] dt-bindings: touchscreen: Add HY46XX bindings
Message-ID: <20210413150710.GA1683048@robh.at.kernel.org>
References: <20210412144624.GA3868831@robh.at.kernel.org>
 <20210412152400.1587623-1-giulio.benetti@benettiengineering.com>
 <20210412152400.1587623-2-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210412152400.1587623-2-giulio.benetti@benettiengineering.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, 12 Apr 2021 17:23:59 +0200, Giulio Benetti wrote:
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
