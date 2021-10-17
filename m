Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CCA9243066B
	for <lists+linux-input@lfdr.de>; Sun, 17 Oct 2021 06:18:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243282AbhJQEUN (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 17 Oct 2021 00:20:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232062AbhJQEUN (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 17 Oct 2021 00:20:13 -0400
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F16DC061765;
        Sat, 16 Oct 2021 21:18:04 -0700 (PDT)
Received: by mail-pg1-x535.google.com with SMTP id 75so12613440pga.3;
        Sat, 16 Oct 2021 21:18:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=pNTEPoxSipCzyiFrHWfIiV7S+q8QV5KVesiJEk3KJWQ=;
        b=ZtWR+Wyx+qGoCLZoFF7DKu42Uv8iEtRKkcFE5bMCvotz0WWC32awCPTjsYYfBfeb5D
         yxQN80FZbnL6EjVE85skwEvScGJjv1sP77QyMrvVYhScICDciZ109IaiqbVvQBg6ga41
         1yOScGVDEY0Q88atlooo3OfxwqDy6IUOymV8EhaAALwH+SsyYh6n2xzOy4a5Npw6b8W9
         BlaMpDRsi2ybriNozESeOblL+B1CJz/UsmdaqcNdobmk5AVRdatUJzR/MGC+Wv8JIq4I
         QLZL+/FC5qdxFNcfao1tPz0hGXz5OYWeD/Ok5RvBHYVYgqdxptxuYybKaFz+ePmNyLd5
         x7Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=pNTEPoxSipCzyiFrHWfIiV7S+q8QV5KVesiJEk3KJWQ=;
        b=UpdnFTKTsFlcDvDJsFD/d3oQ7yYmX6tzvlw0E3AiJzdunTjEyrDXaVHr9olLN/Deum
         IL0kO4LwbDxz90Pw4i/zcNm44tbgy+AcsrZepF7REr7YOMM1m4DqevioNqzY5dgdl+nz
         r5bddyA+uRGi+x8X6ujcJfFAtIB0Ka2izvxcz25xKW+ZLJYUtYsvS+92/eMw8Om3X/SY
         sC3QEeYsb3jP/TlnQOkSqPgVhTYUEAvaqMTsQ8d2j1R50MjNJ+xcVzUm4Oy4BqfkM6lW
         lmDlwMuHcEBwAyNCSrVAixtyolHclSuYkNSKtyoVdL04JK07f5vxkyzDLUDhtLed2az/
         t3qA==
X-Gm-Message-State: AOAM532LFPctUI52AfW/f/PH3DTOmmnZta4EK76KdoG4BcMYSoUUoO5H
        pdz/+GvAK4fOUFTP7zei+Zo=
X-Google-Smtp-Source: ABdhPJyAiF2+7zIB4TYyrbGSAK1aWMg3JP4QD9AHritIO+yqhtdGJJaOLDQViUdmOC8C5Tgk2POx/w==
X-Received: by 2002:a63:b218:: with SMTP id x24mr9784896pge.29.1634444283607;
        Sat, 16 Oct 2021 21:18:03 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:e49a:151f:b7d7:af9a])
        by smtp.gmail.com with ESMTPSA id a27sm9067510pfl.20.2021.10.16.21.18.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Oct 2021 21:18:02 -0700 (PDT)
Date:   Sat, 16 Oct 2021 21:17:59 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject: Re: [PATCH] input: max77693-haptic: drop unneeded MODULE_ALIAS
Message-ID: <YWuj946M/d4DUvo3@google.com>
References: <20210916170514.137977-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210916170514.137977-1-krzysztof.kozlowski@canonical.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Sep 16, 2021 at 07:05:14PM +0200, Krzysztof Kozlowski wrote:
> The MODULE_DEVICE_TABLE already creates proper alias for platform
> driver.  Having another MODULE_ALIAS causes the alias to be duplicated.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

Applied, thank you.

-- 
Dmitry
