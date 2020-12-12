Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 433292D8417
	for <lists+linux-input@lfdr.de>; Sat, 12 Dec 2020 04:04:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437974AbgLLDCX (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 11 Dec 2020 22:02:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728474AbgLLDBz (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 11 Dec 2020 22:01:55 -0500
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 310E2C0613D3;
        Fri, 11 Dec 2020 19:01:15 -0800 (PST)
Received: by mail-pf1-x442.google.com with SMTP id 11so8222808pfu.4;
        Fri, 11 Dec 2020 19:01:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=j8JTuqg014nuRqVqy03bRXg5BMp/iW9hqI1b+R/uz0E=;
        b=UHwCgvT/TIUhZTJEYsLpp1rna/+WduxOFEs5ijqECSMhAfosM02nhJ+NSkeJ16tHQJ
         54fN8tJeGKIvtbHioq4Iek1XCS60ty2eYoMZbifSZWw39GcZVvLTmjI4UHIBWS8nwXUZ
         Qyn6XD8TYuD3I57PYCQZn4pUm1cYxkjwRXgTVljyhshDekMGBNIIlEYrWS7/GMmvob1i
         2YGfTqNw1n1yLOHShIzgYbk4TEveEPzZKyzt5cFs5+VIMGR1vaQe/x6bNVC2nobHXR3K
         wBJzf3qoTPgqtIUMG90Yvw6W+rPCVtqNPhEMBUjlkZ7kH5nXmeFVPsobbMrM5u3EcG49
         RkOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=j8JTuqg014nuRqVqy03bRXg5BMp/iW9hqI1b+R/uz0E=;
        b=Oue58AU0WyuRsnCBq7gr8MDEHX/tZiAvDSOt+TNM2CmxJEi9rbssv5Fy4JiwOU5K/i
         k8qyGh23FZHMmGTQYFxEZbNUCcf2SwSArss1PZaetUdA/fRb3Y65+sPcNvDE2pH7NAN3
         j/YI10TuDMEk7woRF+Ee6Q3y3vse7FKI6YPKgyLxQQ0MTtmfm/51/Ix8PNoaT0o4eWpN
         U0GD9Dxnc/JvNoMi6zKAeWQZOuVOxsvzqf92synYcJp4e8F3Cs5o/7UAHhfyPxoZ1yEU
         vLeK+xeygQj9iODxj2ekldPlCcyhYpoUyUNxMQpTc5Kvh6fUxx0S8KOp8LwU4jY/DWjF
         bQjg==
X-Gm-Message-State: AOAM530R6xsoJuj6Yf1yYoIwe/80wJBj+mvWrDBLiX4+oaP6FbLUCdwe
        mMmmyF1vnpRnb5Khk/+/kkA=
X-Google-Smtp-Source: ABdhPJxDR2eN7nGl5N4kQctU4LDGfM4ZNqMkWTRPK++WF0AapJNMfpTxaTXDlGk2wQvKXyrHPTbqDg==
X-Received: by 2002:a63:db41:: with SMTP id x1mr14968579pgi.446.1607742074792;
        Fri, 11 Dec 2020 19:01:14 -0800 (PST)
Received: from google.com ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id w68sm8765884pff.162.2020.12.11.19.01.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Dec 2020 19:01:13 -0800 (PST)
Date:   Fri, 11 Dec 2020 19:01:11 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Chunyan Zhang <zhang.lyra@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang7@gmail.com>,
        Chunyan Zhang <chunyan.zhang@unisoc.com>,
        Nemo Han <nemo.han@unisoc.com>
Subject: Re: [PATCH v2 3/3] dt-bindings: input: Add compatible string for
 SC2721 and SC2730
Message-ID: <X9Qyd6A6cJcV9Y5A@google.com>
References: <20201117034949.47877-1-zhang.lyra@gmail.com>
 <20201117034949.47877-4-zhang.lyra@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201117034949.47877-4-zhang.lyra@gmail.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Nov 17, 2020 at 11:49:49AM +0800, Chunyan Zhang wrote:
> From: Chunyan Zhang <chunyan.zhang@unisoc.com>
> 
> Add new compatible strings to support sc2730 and sc2721 which are
> two varieties of SC27XX family.
> 
> Signed-off-by: Chunyan Zhang <chunyan.zhang@unisoc.com>

Applied, thank you.

-- 
Dmitry
