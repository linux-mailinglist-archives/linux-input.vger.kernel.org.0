Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15AC43153DC
	for <lists+linux-input@lfdr.de>; Tue,  9 Feb 2021 17:29:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232799AbhBIQ21 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 9 Feb 2021 11:28:27 -0500
Received: from mail-ot1-f42.google.com ([209.85.210.42]:34434 "EHLO
        mail-ot1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232734AbhBIQ2X (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 9 Feb 2021 11:28:23 -0500
Received: by mail-ot1-f42.google.com with SMTP id y11so18007086otq.1;
        Tue, 09 Feb 2021 08:28:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=UodN8N0KEmkVOzAXsaVPTgwgUKhoicSJW55JyTKa2yg=;
        b=IkHkOSW+7mAAp9cvLO3odPqvCUJNWXasVRXKx8f7+zy67yxeEqxzf91xmtM3QoELnD
         t4n5du0up8EduBaAuRI9qRZLtXiCsIfUh3Td4n3PzsJMDXckZxUqg8FwtUXL77glpEx3
         5SNVhhvOkZ5PA27999COQmPKsPPrwKJ+41KWVBkI/B6F7/7EgpCB0/KWrNJXZjqOzpBR
         q0zuxZxg++dUAZyauznSWRLbMpCLag3TswqCARJ1V4c6OMXUJUtqvr2U/sEEr/zDt9f+
         vgIPUoNA64d5PG2Hu/UkvfULkXVveH2WvlETMul08PTnHyNueZWa2ZgqUihJD0QOsTcS
         Bw+A==
X-Gm-Message-State: AOAM5301bnML8dGl0mjjlgSWkODZsFB/HP91xMO9whxf/Evb/5rO3bhr
        yzyc5rquBE/2xfEryYiB49aH49SQfA==
X-Google-Smtp-Source: ABdhPJx6CQgk5G3OaF4PIWn8bv1hx9BSlryHL/fTLq8ZCIAkUKhxCBkruikfD2R2aDTed1wxKrmvpg==
X-Received: by 2002:a9d:2c43:: with SMTP id f61mr16027017otb.329.1612888062628;
        Tue, 09 Feb 2021 08:27:42 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id e72sm43981ote.26.2021.02.09.08.27.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Feb 2021 08:27:41 -0800 (PST)
Received: (nullmailer pid 3882272 invoked by uid 1000);
        Tue, 09 Feb 2021 16:27:40 -0000
Date:   Tue, 9 Feb 2021 10:27:40 -0600
From:   Rob Herring <robh@kernel.org>
To:     Jeff LaBundy <jeff@labundy.com>
Cc:     dmitry.torokhov@gmail.com, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2 3/5] dt-bindings: input: touchscreen: Move helper
 bindings to core
Message-ID: <20210209162740.GA3874323@robh.at.kernel.org>
References: <1611459776-23265-1-git-send-email-jeff@labundy.com>
 <1611459776-23265-4-git-send-email-jeff@labundy.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1611459776-23265-4-git-send-email-jeff@labundy.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, Jan 23, 2021 at 09:42:54PM -0600, Jeff LaBundy wrote:
> With the helper functions moving to /drivers/input/ following the
> discussion in [1], touchscreen.yaml and touchscreen.txt are moved
> one level up as well to maintain a consistent directory structure.
> 
> No changes are made to either file except to update the $id field
> in touchscreen.yaml to reflect the new path. The handful of .yaml
> bindings that reference the original relative path are updated as
> well.
> 
> Last but not least, the handful of .txt bindings that included an
> absolute path to touchscreen.txt are updated too.
> 
> [1] https://patchwork.kernel.org/patch/11924029/
> 
> Signed-off-by: Jeff LaBundy <jeff@labundy.com>
> ---
> Changes in v2:
>  - Added this patch to the series
> 
>  .../devicetree/bindings/input/elan_i2c.txt         |  2 +-
>  .../devicetree/bindings/input/touchscreen.txt      |  1 +
>  .../devicetree/bindings/input/touchscreen.yaml     | 83 ++++++++++++++++++++++
>  .../bindings/input/touchscreen/ads7846.txt         |  2 +-
>  .../bindings/input/touchscreen/bu21013.txt         |  2 +-
>  .../input/touchscreen/cypress,cy8ctma140.yaml      |  2 +-
>  .../bindings/input/touchscreen/edt-ft5x06.yaml     |  2 +-
>  .../bindings/input/touchscreen/eeti,exc3000.yaml   |  2 +-
>  .../input/touchscreen/elan,elants_i2c.yaml         |  2 +-
>  .../bindings/input/touchscreen/goodix.yaml         |  2 +-
>  .../bindings/input/touchscreen/iqs5xx.txt          |  2 +-
>  .../bindings/input/touchscreen/mms114.txt          |  2 +-
>  .../bindings/input/touchscreen/touchscreen.txt     |  1 -
>  .../bindings/input/touchscreen/touchscreen.yaml    | 83 ----------------------
>  14 files changed, 94 insertions(+), 94 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/input/touchscreen.txt
>  create mode 100644 Documentation/devicetree/bindings/input/touchscreen.yaml
>  delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/touchscreen.txt
>  delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/touchscreen.yaml

No, I prefer the current structure. It's easier to find similar types of 
h/w as-is. In fact, if you wanted to move keyboards/keypads to their own 
subdir, I'd welcome that.

Rob
