Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C98A1250EF5
	for <lists+linux-input@lfdr.de>; Tue, 25 Aug 2020 04:24:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726532AbgHYCYz (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 24 Aug 2020 22:24:55 -0400
Received: from mail-il1-f195.google.com ([209.85.166.195]:35734 "EHLO
        mail-il1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726365AbgHYCYz (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 24 Aug 2020 22:24:55 -0400
Received: by mail-il1-f195.google.com with SMTP id q14so9139705ilm.2;
        Mon, 24 Aug 2020 19:24:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=cnGNl3PoVaj60h5F2GDcq1Io9++p+vzr9OQfXOLKtr0=;
        b=BJA7EoRWlFR1IPigQuBkai6SVUEMcCyfz2JMY9EFdYtmheG1+bkF1QRr957an2/Fa9
         3rIIDioF8/B4pwF27TU1cw4fuFaDoSJqB5ShaKPaJTZb75XMdGxiiVvgWFInWIciCiRo
         74x3JKetF3yJWq/l06aOqqK0RezUSbp2KMbKMe9oobaEvfiOOg0Sus5MGuHiNvEiV6PO
         EKfdDO8ljs8Tu5vLvRjLROo/CxyVkJFti/GR3Gat/F+GZGwp6+h7diHlGjaceKN6kAPU
         ClM+AkZh91d74Wq780E/3fNhtUdcgl1I+GlKmX5+/z5pJo8CKdHFLvh+4omMfduueRTz
         QyXw==
X-Gm-Message-State: AOAM5300AG8VGzdnTKWHxqTJbHugBOpA+zpDyUseQxm8NX93fBDyBe9h
        qh6leAb7n5DmsVBEs/hzew==
X-Google-Smtp-Source: ABdhPJxxMXAYunE5D/8szs4hodew5EZxrd5G982SUEy99gWp7s5jgl8d0JotwLRtLgn9+B8qf5zINw==
X-Received: by 2002:a92:8556:: with SMTP id f83mr7326180ilh.135.1598322294415;
        Mon, 24 Aug 2020 19:24:54 -0700 (PDT)
Received: from xps15 ([64.188.179.249])
        by smtp.gmail.com with ESMTPSA id a11sm8200512ilh.74.2020.08.24.19.24.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2020 19:24:53 -0700 (PDT)
Received: (nullmailer pid 3814348 invoked by uid 1000);
        Tue, 25 Aug 2020 02:24:51 -0000
Date:   Mon, 24 Aug 2020 20:24:51 -0600
From:   Rob Herring <robh@kernel.org>
To:     Jeff LaBundy <jeff@labundy.com>
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, dmitry.torokhov@gmail.com
Subject: Re: [PATCH 3/6] dt-bindings: input: iqs269a: Add bindings for OTP
 variants
Message-ID: <20200825022451.GA3814295@bogus>
References: <1597612467-15093-1-git-send-email-jeff@labundy.com>
 <1597612467-15093-4-git-send-email-jeff@labundy.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1597612467-15093-4-git-send-email-jeff@labundy.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, 16 Aug 2020 16:14:24 -0500, Jeff LaBundy wrote:
> This patch adds bindings for the D0 order code of the device. This
> order code represents an OTP variant that enables a touch-and-hold
> function in place of slider 1.
> 
> Also included is the ability to specify the 00 order code (default
> option with no OTP customization) explicitly.
> 
> Signed-off-by: Jeff LaBundy <jeff@labundy.com>
> ---
>  .../devicetree/bindings/input/iqs269a.yaml         | 30 +++++++++++++++++++++-
>  1 file changed, 29 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
