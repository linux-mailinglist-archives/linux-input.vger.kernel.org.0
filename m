Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E53A0345332
	for <lists+linux-input@lfdr.de>; Tue, 23 Mar 2021 00:48:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230284AbhCVXrs (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 22 Mar 2021 19:47:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230358AbhCVXrO (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 22 Mar 2021 19:47:14 -0400
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D054C061574;
        Mon, 22 Mar 2021 16:47:14 -0700 (PDT)
Received: by mail-pg1-x530.google.com with SMTP id 32so3762788pgm.1;
        Mon, 22 Mar 2021 16:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=O9mLTLdBEDsQMdnsalb1AdbazQz+m1v771vX6Ovl4PE=;
        b=FMpsNryOiCGkE8Fhy0DDXF9oRleG3jRLaLWQxxG4IyEmVAFD8ChoNTWaB5zOrsRJnB
         QekqxGQyo/XObo8UPEiw7vBRHbo2QWzE0ghHxW9SmmIeFonefS99ONbUiiP5csQZCPU+
         9yPan/KIpiCxvhI7EiJMei6I4+Ts1vsi8zBkdR9E0+pv8HnXBnD3B/Wol4Bk/h5wAlQx
         +zr5QDuLxTUX34QDUNP4HdVEb4FdejRhKZ/5F4R3K5l+ijL4+32mtJKUBrX56qPEA/9Z
         5COx68TseEBqoh0+8rATeYPkzCTrK8N0LlyAp1QR1J3ZwpLCCOWaUzYYwgbQ8iSeU/gb
         krIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=O9mLTLdBEDsQMdnsalb1AdbazQz+m1v771vX6Ovl4PE=;
        b=SONeqjLaiD9eQAuuxB7zyW3iLHALiT4iLvSyX5Xh+kxYbPcFF0zVmW5Q6tMYodYfkh
         gYRFqAjPsFHKnoAs4u+TitnyY2cvYztj67puqQl5ocwOEpnnGKjUa7a2ygevL9PR3u1v
         TtZBRDNWodHP4ME26ddPKHROgBAv+G43JSJM1jmpg5q7HYBqongyZYD0SjvOb7xnpxJY
         F1ebDPpp9FlVDVgszbvxuP1ltT+gO9Rq6EikEOMfZjwDy00Onz4hxXZZefeQOuvtXcdN
         6MpZ6rSsjmUUpvqDJfam8Twv/bmHiDx1Q09Db6TadVbZakHeZBczQXgdYjEJyNZCXSOu
         waRA==
X-Gm-Message-State: AOAM532RkkcJCtI6HEdd6px/k+r8NnQkVPYqmX9x5VNQvQa4/j8JcqHt
        70hlCbtSUSoSZGADjfG7Ebo=
X-Google-Smtp-Source: ABdhPJxUEnvzZ48V8c/3W7irJ19wpN6PwHWsIVayc9zRVXNUMdcZCb8tAUyEtb73RvgTmT6OkVQg0g==
X-Received: by 2002:a17:902:b908:b029:e6:3e0a:b3cc with SMTP id bf8-20020a170902b908b02900e63e0ab3ccmr2186714plb.68.1616456833611;
        Mon, 22 Mar 2021 16:47:13 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:499f:7361:582b:fd05])
        by smtp.gmail.com with ESMTPSA id 14sm3587570pfl.1.2021.03.22.16.47.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Mar 2021 16:47:12 -0700 (PDT)
Date:   Mon, 22 Mar 2021 16:47:10 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Jeff LaBundy <jeff@labundy.com>
Cc:     robh+dt@kernel.org, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v3 3/4] dt-bindings: input: Add bindings for Azoteq
 IQS626A
Message-ID: <YFksfpxKHK1ZbMD4@google.com>
References: <20210301234928.4298-1-jeff@labundy.com>
 <20210301234928.4298-4-jeff@labundy.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210301234928.4298-4-jeff@labundy.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Mar 01, 2021 at 05:49:27PM -0600, Jeff LaBundy wrote:
> This patch adds device tree bindings for the Azoteq IQS626A
> capacitive touch controller.
> 
> Signed-off-by: Jeff LaBundy <jeff@labundy.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

Applied, thank you.

-- 
Dmitry
