Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9B5D315403
	for <lists+linux-input@lfdr.de>; Tue,  9 Feb 2021 17:37:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232869AbhBIQgN (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 9 Feb 2021 11:36:13 -0500
Received: from mail-oi1-f169.google.com ([209.85.167.169]:43918 "EHLO
        mail-oi1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232810AbhBIQfP (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 9 Feb 2021 11:35:15 -0500
Received: by mail-oi1-f169.google.com with SMTP id d20so20026085oiw.10;
        Tue, 09 Feb 2021 08:35:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=9t4LJXTSLtxd8IT7qmYmEfW7Vhn57zaKjlRVT6AkWcI=;
        b=Nw1y1+jhzWKhB3gIaRx4ozFHR5vl15p7Hijdz6ZpX+JHvZBZomREQufINq1ClJ4Kxx
         5oKE5PRxsEfWG+Y82yR2JQJ5AiAUSlLgC5gSaJTwuIHO/DB/zHfVOmThqp5flPYOyFC7
         1Itqw7bIRMtjEer78i2R17zhOVN24S8dNkfQsMiOHae3dIcmva1rwdafTddlYS0Pwwep
         GPk0XqXdoDSSaFkMyTVlcl/He/TFMf7THofDQXiLoWVcie5TA1/2NWp0XNns7EqA+CiB
         +Ere5BfKWOIyeXjYqBVkBpu+T3uw+LhqvBS8SnFng8GyKQWBOfng/e1s9VNleeIHAdrb
         fgOQ==
X-Gm-Message-State: AOAM5324uzScxAsvHia8STgVTIqP+i69SJL6YjL48qX7L63EG/Ftizdl
        KbIDvVMjNf1RXCEoEPgv9g==
X-Google-Smtp-Source: ABdhPJwfZkOdkhWpi2n7UayXXfGa53fjlVS+RYyKJ6pi8Te4tIRbsS0Mw7qauAsMT+JouVmWryIB1A==
X-Received: by 2002:aca:4856:: with SMTP id v83mr2935963oia.43.1612888475401;
        Tue, 09 Feb 2021 08:34:35 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id n189sm4193174oif.58.2021.02.09.08.34.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Feb 2021 08:34:33 -0800 (PST)
Received: (nullmailer pid 3893005 invoked by uid 1000);
        Tue, 09 Feb 2021 16:34:32 -0000
Date:   Tue, 9 Feb 2021 10:34:32 -0600
From:   Rob Herring <robh@kernel.org>
To:     Jeff LaBundy <jeff@labundy.com>
Cc:     dmitry.torokhov@gmail.com, devicetree@vger.kernel.org,
        linux-input@vger.kernel.org, robh+dt@kernel.org
Subject: Re: [PATCH v2 4/5] dt-bindings: input: Add bindings for Azoteq
 IQS626A
Message-ID: <20210209163432.GA3892603@robh.at.kernel.org>
References: <1611459776-23265-1-git-send-email-jeff@labundy.com>
 <1611459776-23265-5-git-send-email-jeff@labundy.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1611459776-23265-5-git-send-email-jeff@labundy.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, 23 Jan 2021 21:42:55 -0600, Jeff LaBundy wrote:
> This patch adds device tree bindings for the Azoteq IQS626A
> capacitive touch controller.
> 
> Signed-off-by: Jeff LaBundy <jeff@labundy.com>
> ---
> Changes in v2:
>  - Added missing $ref to touchscreen.yaml
> 
>  .../devicetree/bindings/input/iqs626a.yaml         | 843 +++++++++++++++++++++
>  1 file changed, 843 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/input/iqs626a.yaml
> 

Other than the file path:

Reviewed-by: Rob Herring <robh@kernel.org>
