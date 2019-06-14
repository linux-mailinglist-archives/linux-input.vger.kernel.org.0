Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8BD9B46867
	for <lists+linux-input@lfdr.de>; Fri, 14 Jun 2019 21:55:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725808AbfFNTz5 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 14 Jun 2019 15:55:57 -0400
Received: from mail-qt1-f196.google.com ([209.85.160.196]:39661 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725802AbfFNTz5 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 14 Jun 2019 15:55:57 -0400
Received: by mail-qt1-f196.google.com with SMTP id i34so3886248qta.6;
        Fri, 14 Jun 2019 12:55:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=X3VD4dXHg/naZxJ/7HbFX8rXeE3t64aHwAuHutsyuek=;
        b=b8Ka7MYDNPL9sjsM62TjkwRpiKaIF28AybDWQ1P7U//CJQ3FGNCXGxzWypUiS5ULdw
         op7r8YjvGEJWC5rvDVNaInE0f3bq8UMWWvsBbNvgzISdXjGd8A6dSowfg4brKDDpbV81
         kAUcC5Y0dMG1YWHBNicrczHz5/1qMDRFgQb0ViBjuT2IAxmxv8ZQDIoHx+F77gMWldqQ
         +oPdtumsgXzUc7+cbZ6980kEPb55Uaue45ZQKmMXOJCQhHOymYCjinraGckl7iuAgfKe
         X2GrfEEzL7MeOIwmbqF1YkHb5SInzTdDSb9tPUzCf3s2plKBiUu9+Ntnp2tSd9llE2ky
         lt5A==
X-Gm-Message-State: APjAAAXKSkzDrIQhnM/F7bJj5QC0Ilgz2T/dCOArzQEaAvlklWWTTUOT
        MgR7z1cOKQ4TGhJe9tMluA==
X-Google-Smtp-Source: APXvYqz510QPXIY0VeAha06LU0jf4aNer3612Y9WvtBavW/tnCnm3KubvB5SOBToZnSNzgK95sETfg==
X-Received: by 2002:a0c:92ab:: with SMTP id b40mr9715529qvb.129.1560542155908;
        Fri, 14 Jun 2019 12:55:55 -0700 (PDT)
Received: from localhost ([64.188.179.243])
        by smtp.gmail.com with ESMTPSA id s35sm2357131qth.79.2019.06.14.12.55.54
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 14 Jun 2019 12:55:55 -0700 (PDT)
Date:   Fri, 14 Jun 2019 13:55:52 -0600
From:   Rob Herring <robh@kernel.org>
To:     Leif Middelschulte <leif.middelschulte@klsmartin.com>
Cc:     dmitry.torokhov@gmail.com, devicetree@vger.kernel.org,
        linux-input@vger.kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com,
        Leif Middelschulte <leif.middelschulte@klsmartin.com>
Subject: Re: [PATCH 05/10] dt-bindings: input: touchscreen: stmpe: add XY mode
Message-ID: <20190614195552.GA5316@bogus>
References: <20190527160736.30569-1-leif.middelschulte@klsmartin.com>
 <20190527161938.31871-1-leif.middelschulte@klsmartin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190527161938.31871-1-leif.middelschulte@klsmartin.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, 27 May 2019 18:19:33 +0200, Leif Middelschulte wrote:
> This change documents the support of another input data
> acquisition mode (XY). This mode is mostly relevant in
> the context of/combination with the tracking index.
> 
> Signed-off-by: Leif Middelschulte <leif.middelschulte@klsmartin.com>
> ---
>  Documentation/devicetree/bindings/input/touchscreen/stmpe.txt | 3 +++
>  1 file changed, 3 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
