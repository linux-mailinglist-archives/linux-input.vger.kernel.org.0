Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16714331989
	for <lists+linux-input@lfdr.de>; Mon,  8 Mar 2021 22:47:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230327AbhCHVrM (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 8 Mar 2021 16:47:12 -0500
Received: from mail-io1-f46.google.com ([209.85.166.46]:36715 "EHLO
        mail-io1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230242AbhCHVqo (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 8 Mar 2021 16:46:44 -0500
Received: by mail-io1-f46.google.com with SMTP id n14so11678366iog.3;
        Mon, 08 Mar 2021 13:46:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=DXrmivq0GIkj5yRSyvc/DDkb3SdD9/pbmd3EobTM7gA=;
        b=sYLNowb50YKfNFWHa4hTMIqcaCAQMDyOwU1JyLA7Vxkdj63c4LEvkpR4gyin8ryA9D
         OWf9FUTj1wCjb25W7Wq7MX1mkOqwSEBHr73c8NKCEjFi6rd91cCJK6SmQcFhB1xSa2FV
         UzncOuUrZrDdtZWMV6VX01r2+9Py08h8MNKex5iIg+fTocC786UaHV0r/tYgDv0rZ8a7
         UfnaXR/DIB5nBJGTK6c2678YcEFIn1GceOW3iVYgeOYka6RCTTb7krudN7JbX/Z50r+X
         ksqx6ko0sRC7qqIDRTknLCMmVRNd26GS0+3RoLAhLUp+TqWxn0o8BDojP/XALSjJQqpT
         KQ3Q==
X-Gm-Message-State: AOAM532Y6JaGKL+0GAM9xYhJzxxdLYfZOOfrCt6l3xmIgPDvfbfklI/j
        q5e89XquV5GblByCgLJj/QYWWSGU8Q==
X-Google-Smtp-Source: ABdhPJxnm15RBP8/mjkZVd5PRGzUOpyOzYQWZd7V0ySuxkIQlG9Hzkq97UhYeePktJU0RyaAfMr8xQ==
X-Received: by 2002:a5d:8c8f:: with SMTP id g15mr19865373ion.162.1615240003455;
        Mon, 08 Mar 2021 13:46:43 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id m5sm6760241ilq.65.2021.03.08.13.46.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Mar 2021 13:46:42 -0800 (PST)
Received: (nullmailer pid 3010139 invoked by uid 1000);
        Mon, 08 Mar 2021 21:46:41 -0000
Date:   Mon, 8 Mar 2021 14:46:41 -0700
From:   Rob Herring <robh@kernel.org>
To:     Jeff LaBundy <jeff@labundy.com>
Cc:     dmitry.torokhov@gmail.com, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 9/9] dt-bindings: input: iqs5xx: Convert to YAML
Message-ID: <20210308214641.GA3007007@robh.at.kernel.org>
References: <20210305041236.3489-1-jeff@labundy.com>
 <20210305041236.3489-10-jeff@labundy.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210305041236.3489-10-jeff@labundy.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Mar 04, 2021 at 10:12:36PM -0600, Jeff LaBundy wrote:
> This patch converts the legacy text-based binding document to YAML
> format. Extraneous details and touchscreen properties that weren't
> actually supported have been dropped.
> 
> The reset GPIO has since been made optional in the driver; this is
> now reflected here as well.
> 
> Signed-off-by: Jeff LaBundy <jeff@labundy.com>
> ---
>  .../bindings/input/touchscreen/iqs5xx.txt     | 80 -------------------
>  .../bindings/input/touchscreen/iqs5xx.yaml    | 75 +++++++++++++++++

azoteq,iqs5xx.yaml for the filename (and $id).

With that,

Reviewed-by: Rob Herring <robh@kernel.org>
