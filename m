Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9371B2D31DF
	for <lists+linux-input@lfdr.de>; Tue,  8 Dec 2020 19:15:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730965AbgLHSOI (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 8 Dec 2020 13:14:08 -0500
Received: from mail-ot1-f67.google.com ([209.85.210.67]:33350 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730964AbgLHSOI (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 8 Dec 2020 13:14:08 -0500
Received: by mail-ot1-f67.google.com with SMTP id b18so16687193ots.0;
        Tue, 08 Dec 2020 10:13:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=wh9jnHQilX25aULdurAa38tQjEpUFH5bf92wn1kDkV8=;
        b=OwkN4dibKBgZpkzhbxAGCRyW/Xl2MS0W1rX51y5rt4ZW+L+RNE1QABRU+PR4ZJnOJM
         t36o5mO8CyDGdp9F5H4qGv24i2yM0AxuJsRjvbI4MLlxRo0K7X9MStJheOiBpgieisha
         SpEVVphTasH3JXzBu07pEGRBWi76lj9tRmX8crvhDv/c1SUHvXPYSMD+Cy5JWI93TR3/
         rqEb61YP5OL8Yb2vBbHAnP2qmq1+Z1HpXpMMhnWPw46UxJmv3O5gKyNeb10g/wvQMnU7
         jSC3VL2/eU3pBEO7mvf/7HyNZtRDL2K7N0P6aGID3yM7bNzuzw7vylbLFxCsierfLOND
         g6Ig==
X-Gm-Message-State: AOAM5331+F7zHlL256RU0jHC+kK/vG1RyBDLMHlg1LjiDlFduwz7/5rd
        HPkyWeGSfcPOI06oSYrwHKP6DcxGaA==
X-Google-Smtp-Source: ABdhPJwZ5y52wb+PR4oET30Dmr/zuMyrdN//jT7ed3cWNfcEWlJ0YwR/XNow1Rub7kvrkr99kH9H9A==
X-Received: by 2002:a9d:5f03:: with SMTP id f3mr17786964oti.91.1607451201547;
        Tue, 08 Dec 2020 10:13:21 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id y204sm2448491oiy.38.2020.12.08.10.13.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Dec 2020 10:13:19 -0800 (PST)
Received: (nullmailer pid 2814302 invoked by uid 1000);
        Tue, 08 Dec 2020 18:13:18 -0000
Date:   Tue, 8 Dec 2020 12:13:18 -0600
From:   Rob Herring <robh@kernel.org>
To:     Alexandru Ardelean <alexandru.ardelean@analog.com>
Cc:     dmitry.torokhov@gmail.com, linux-kernel@vger.kernel.org,
        robh+dt@kernel.org, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, lars@metafoo.de
Subject: Re: [PATCH v3 4/4] dt-bindings: add ADP5585/ADP5589 entries to
 trivial-devices
Message-ID: <20201208181318.GA2814147@robh.at.kernel.org>
References: <20201127111420.96500-1-alexandru.ardelean@analog.com>
 <20201127111420.96500-4-alexandru.ardelean@analog.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201127111420.96500-4-alexandru.ardelean@analog.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, 27 Nov 2020 13:14:20 +0200, Alexandru Ardelean wrote:
> This change adds the device-tree entries for the Analog Devices ADP5585 and
> ADP5589 devices to the trivial devices list.
> 
> Signed-off-by: Alexandru Ardelean <alexandru.ardelean@analog.com>
> ---
>  Documentation/devicetree/bindings/trivial-devices.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Applied, thanks!
