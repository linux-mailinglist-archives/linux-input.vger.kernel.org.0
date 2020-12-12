Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB6742D8413
	for <lists+linux-input@lfdr.de>; Sat, 12 Dec 2020 04:02:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436618AbgLLDBv (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 11 Dec 2020 22:01:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728474AbgLLDBa (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 11 Dec 2020 22:01:30 -0500
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA1D0C0613CF;
        Fri, 11 Dec 2020 19:00:49 -0800 (PST)
Received: by mail-pj1-x1042.google.com with SMTP id f14so3174061pju.4;
        Fri, 11 Dec 2020 19:00:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=EyETR/94UFN4vLGwyjFXxDoZ8P7IFlP1n/X1J7JSHIQ=;
        b=KfbRbX5Y1ryuEBAA1au/mbr5T0X3TG/yrXKBln/waae14mWv3itBWQ2fr3CxHAo4Vi
         OBHrtzkMGXU/JsbX0rWtssRvXOq6f7zQuywItAkZYXuGgjF+gVtqvSfHeWM3bgJc4n8H
         T1L4waKHt2wBqUZ4N3kUr4qsr94x36xuJe8cj0oWVZgBzDngfeqRBoo02ylHhrKQfvJa
         AwOon6zcik3Cp1mNBAINxZvIFwZ1Ksf6i/ervziEtmV0Ig3uFI4cbqUTZW/ZYDM6dpvu
         /1UtNJqS35p/qyNf3oh2+sgJo+BvsPFJddjqOcvwISObWujSCbZeaQDwAfFV4PeZeLfe
         fdrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=EyETR/94UFN4vLGwyjFXxDoZ8P7IFlP1n/X1J7JSHIQ=;
        b=kLRH4+OKh6u4eEpQCw144jQZnXa5f7D7sUg5QPursIXeoMDKxfmb44MZRh80GfeqBZ
         qj1JoKKHiQmhsJlN1FX7FNxY8/k9338Tw9VNzDobc3nBOfIcRz4LU6R/84+JW54RFS8s
         iz8mopt/zgQJQrxdVuzggD0bOgQfFG6wxgHGejcBsoUI5FkS4K159sZMLITBFOCbZqTp
         2SrjWvHa3JgznbSD3vlF1pKAG5LnewtIZrgqEORqdNIUfVduzRl4E+jAVz1uRtYNzmwi
         moc6ZvgZlfaGGWWIyYV9NJwXg/blKVDrE4bPM6kHegRV97tzzJ0YsrMTLsOlHnV7Jjmz
         pkGw==
X-Gm-Message-State: AOAM531eyiZM6AEOX/BBb56eGMZEKorbMKZNzoXpubWIs56iuPCBeZhx
        PMKvnrIeGizh33X3lD6xYOQ=
X-Google-Smtp-Source: ABdhPJxXBcUbqRJ/JkyvB4nGN7CvMjW6YBUACZT/DujbcYZw2uEKTzBRAu7+IJNUbF0hA9WKh/SR9w==
X-Received: by 2002:a17:902:6b02:b029:da:c6c0:d650 with SMTP id o2-20020a1709026b02b02900dac6c0d650mr13686104plk.74.1607742049191;
        Fri, 11 Dec 2020 19:00:49 -0800 (PST)
Received: from google.com ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id n5sm12430335pgm.29.2020.12.11.19.00.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Dec 2020 19:00:48 -0800 (PST)
Date:   Fri, 11 Dec 2020 19:00:45 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Chunyan Zhang <zhang.lyra@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang7@gmail.com>,
        Chunyan Zhang <chunyan.zhang@unisoc.com>,
        Nemo Han <nemo.han@unisoc.com>
Subject: Re: [PATCH v2 2/3] dt-bindings: input: Convert sc27xx-vibra.txt to
 json-schema
Message-ID: <X9QyXYKJ7NkQcaie@google.com>
References: <20201117034949.47877-1-zhang.lyra@gmail.com>
 <20201117034949.47877-3-zhang.lyra@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201117034949.47877-3-zhang.lyra@gmail.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Nov 17, 2020 at 11:49:48AM +0800, Chunyan Zhang wrote:
> From: Chunyan Zhang <chunyan.zhang@unisoc.com>
> 
> Convert the sprd sc27xx vibrator binding to DT schema using json-schema.
> 
> Signed-off-by: Chunyan Zhang <chunyan.zhang@unisoc.com>

Applied, thank you.

-- 
Dmitry
