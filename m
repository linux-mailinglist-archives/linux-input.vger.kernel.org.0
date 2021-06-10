Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC5E93A30D3
	for <lists+linux-input@lfdr.de>; Thu, 10 Jun 2021 18:38:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230391AbhFJQky (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 10 Jun 2021 12:40:54 -0400
Received: from mail-ot1-f42.google.com ([209.85.210.42]:38679 "EHLO
        mail-ot1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229823AbhFJQky (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 10 Jun 2021 12:40:54 -0400
Received: by mail-ot1-f42.google.com with SMTP id j11-20020a9d738b0000b02903ea3c02ded8so302298otk.5;
        Thu, 10 Jun 2021 09:38:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ThsuhgjwQPY1nL0DC6AfRGD4QCrDv0Wb8QRuS1qgScc=;
        b=MbcVzL6956KJ6h3WCrJzWntC9sFBb7cqYmcywSKeCoXemdUoURf3ivIdom4XJNotUs
         t9dq14WLShXaO3kzzdKyBbybgUDfrQZoxz9fP66P7Wb7zewO99Qfdy31NFBL+6N0gdiV
         2suHeAo+ImGkfc9hA7Ks8fTb5OHve9MnQRRNvV+X07Hhdws4WmO+9B6IHQ9qvLsF7IVx
         pVmo+hgjECXUNSzoeogKDTptCNpr0P5gQqe/jopFRO9qYdV16rSmXD1rjbqMcLtrB1ab
         fOOHkP5jkzDgu57TtdVanCLAD7v4SwKRqm0YmV1RoTpPjj5fy19LYbZKDehV+hR7tJc0
         U32Q==
X-Gm-Message-State: AOAM532m6OZv1gGQSZirMwcR6PmReZSmWRlgDia7ThpEulWvYLNGbIlY
        /LzrM5q+qPOp6nIZSWs2HA==
X-Google-Smtp-Source: ABdhPJzx+hvlN/w4B0vDRWK2ePv0ZMiOVeLFHf3+Gx7ZGUnN8pfqLv5McDPcDbaldOvEE/AsVN1NFA==
X-Received: by 2002:a05:6830:99:: with SMTP id a25mr3193911oto.72.1623343129066;
        Thu, 10 Jun 2021 09:38:49 -0700 (PDT)
Received: from robh.at.kernel.org ([172.58.99.113])
        by smtp.gmail.com with ESMTPSA id f63sm711216otb.36.2021.06.10.09.38.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jun 2021 09:38:48 -0700 (PDT)
Received: (nullmailer pid 1937010 invoked by uid 1000);
        Thu, 10 Jun 2021 16:38:46 -0000
Date:   Thu, 10 Jun 2021 11:38:46 -0500
From:   Rob Herring <robh@kernel.org>
To:     Oleh Kravchenko <oleg@kaa.org.ua>
Cc:     Patchwork Bot <patchwork-bot@kernel.org>,
        Jiri Kosina <jikos@jikos.cz>,
        Device Tree mailing list <devicetree@vger.kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Subject: Re: [PATCH 1/2 v4] dt-bindings: Add vendor prefix and bindings for
 Qwiic Joystick
Message-ID: <20210610163846.GA1936976@robh.at.kernel.org>
References: <20210608223130.16830-1-oleg@kaa.org.ua>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210608223130.16830-1-oleg@kaa.org.ua>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, 09 Jun 2021 01:31:30 +0300, Oleh Kravchenko wrote:
> Add vendor prefix for SparkFun Electronics.
> Update trivial-devices.yaml with SparkFun Qwiic Joystick description.
> 
> Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>
> Cc: Device Tree mailing list <devicetree@vger.kernel.org>
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Cc: Jiri Kosina <jikos@jikos.cz>
> Cc: Patchwork Bot <patchwork-bot@kernel.org>
> Cc: Rob Herring <robh@kernel.org>
> Signed-off-by: Oleh Kravchenko <oleg@kaa.org.ua>
> ---
> 
> Changes for v4:
> - no updates.
> 
> Changes for v3:
> - update patch after code review.
> 
> Changes for v2:
> - update code after code review
> 
> 
>  Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  2 files changed, 4 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
