Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98C50250EEE
	for <lists+linux-input@lfdr.de>; Tue, 25 Aug 2020 04:22:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726365AbgHYCWZ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 24 Aug 2020 22:22:25 -0400
Received: from mail-il1-f196.google.com ([209.85.166.196]:44918 "EHLO
        mail-il1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725924AbgHYCWY (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 24 Aug 2020 22:22:24 -0400
Received: by mail-il1-f196.google.com with SMTP id j9so9104324ilc.11;
        Mon, 24 Aug 2020 19:22:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=CIR8FgtVwIwIJojLrVqQmsyXh3+BCp+jlIXsV+y3UMU=;
        b=FVxMDWS6BsN+BLdsAORcX58za8V05gs35IB6OauStsxB9Lzs+lK2RViWm2l9OBL8i9
         UQqKvEglhM7bAGaCP6I1NylJoIqzEs+uO6B/aDdR20D4JRu3rsgYf0lz/lBiz9zPWFzx
         rFdysx8ruhGWBMYe7+UfNJHIvxpX9TajsizB0R78hqaDvbArbXcvjD/p/1XM9BTwgPZ+
         URGTQJ/r78c+j8farHvSRd+ztsgM9doumo87MSF2WcgrlS1Kb5vzNdAOY6V+nGFIvt6T
         C1nrXWVQP+XX5jZc5ja+vk6oVSYakKWNZGsaW/mHPFEOyTd0o5tRVMxyn+Lc3vYwjT/p
         1+nA==
X-Gm-Message-State: AOAM533hsBm08t6Gn/P7y/5xZtqo6CsA2UW+5/PN3m457g+cVDROGvxr
        I3ph6Fdn9HcIX3HVDLjkyQ==
X-Google-Smtp-Source: ABdhPJw30e52qhPRcahxW03n9qc/Hi8sVTt/szlFVDZOvHWUyUWiK67DWQpyGwpEYKqhZGWMzg100g==
X-Received: by 2002:a92:c092:: with SMTP id h18mr7551621ile.178.1598322143565;
        Mon, 24 Aug 2020 19:22:23 -0700 (PDT)
Received: from xps15 ([64.188.179.249])
        by smtp.gmail.com with ESMTPSA id b74sm8598694ilb.64.2020.08.24.19.22.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2020 19:22:22 -0700 (PDT)
Received: (nullmailer pid 3810313 invoked by uid 1000);
        Tue, 25 Aug 2020 02:22:20 -0000
Date:   Mon, 24 Aug 2020 20:22:20 -0600
From:   Rob Herring <robh@kernel.org>
To:     Jeff LaBundy <jeff@labundy.com>
Cc:     devicetree@vger.kernel.org, dmitry.torokhov@gmail.com,
        linux-input@vger.kernel.org, robh+dt@kernel.org
Subject: Re: [PATCH 1/6] dt-bindings: input: iqs269a: Add bindings for slider
 gestures
Message-ID: <20200825022220.GA3810126@bogus>
References: <1597612467-15093-1-git-send-email-jeff@labundy.com>
 <1597612467-15093-2-git-send-email-jeff@labundy.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1597612467-15093-2-git-send-email-jeff@labundy.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, 16 Aug 2020 16:14:22 -0500, Jeff LaBundy wrote:
> This patch adds bindings for slider gestures that can be expressed
> by the device.
> 
> Signed-off-by: Jeff LaBundy <jeff@labundy.com>
> ---
>  .../devicetree/bindings/input/iqs269a.yaml         | 65 ++++++++++++++++++++++
>  1 file changed, 65 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
