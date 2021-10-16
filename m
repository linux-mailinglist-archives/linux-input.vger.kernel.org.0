Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3EC3430069
	for <lists+linux-input@lfdr.de>; Sat, 16 Oct 2021 07:26:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230349AbhJPF27 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 16 Oct 2021 01:28:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230261AbhJPF26 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 16 Oct 2021 01:28:58 -0400
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 789B0C061570;
        Fri, 15 Oct 2021 22:26:51 -0700 (PDT)
Received: by mail-pl1-x634.google.com with SMTP id v20so7670125plo.7;
        Fri, 15 Oct 2021 22:26:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=vL20q6MI4uIa5jL4lCEU0zzyyrlExue0RuCCFMmvnBY=;
        b=N7YPb1eJ4ZByCzkVdOUKSNzAhY4IQFyCM0JskLT4dva54fmRQ1Uvnjw5ksIyqjYxLG
         VvYdJsO3u810fWOE+2Urt6sZE3ivewVHpqbbI94UqCgyU3qvjt0j7wzOXUB0Eqbs8pn2
         SkxHxATo2HND1szD6oPNWXlmfq9Z3AHiD7np2ARvFL3ZSHNuTHfpcruepa9xVCtsc6h7
         BnoC8UyQf180bbliDxvhXGUdSyFDwgT715ctKYoUgC59dvtljhcZdYo5a9JpGP7/wCl9
         hTlwqwzqpPizCEnV2szedYZOwUrduonttQvDRf3ZmvNx1hmwvXaskxUL9Hkdmblx592g
         XqXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=vL20q6MI4uIa5jL4lCEU0zzyyrlExue0RuCCFMmvnBY=;
        b=YB7X9zEUtBInyIKFGsyxNbycYmmrjMybsaMew4f5pxI0bi4VY2TuxNIUJoD+XnIHQg
         ARaLDrZk2s+1IKQ+8VFi1NgsNQu9r33JNuV4tTBAKx3SbiqI2z1F4j7P+f6IeK5KsnxB
         blcoN599nk3bn9GZAmQN/2O0wkZDx6PHhU4WT+uaSwIS4SaAOZIo3hrwv2LA0nWRqs3w
         mxkcBuqgD+zBW8chwgnQAeugf6ig2B8+h4KqKhLXi8f56L41SSGp7GSG902nDtgYuQuP
         UR2o90mRSxrAvAevqfDVbLdyCBw1040/K0Fsrke3z0CRoMK71vpqHN/0V6EqRkL8DGNR
         zWZg==
X-Gm-Message-State: AOAM531bLdGmUQiGWvTS5AhgXHaiiy+y2IyWL5RuP+1fY9ijtsVAQSpe
        nVya2Ab/gSLqpi3msxk0Jb5Hc2Zg3u4=
X-Google-Smtp-Source: ABdhPJyaQ1rJY8UqxahwVhJ1WLq6LOFFeoTcTIad0Z2FeO40ApL3YFtlCLaQAGY8ehNi7fKMNI10og==
X-Received: by 2002:a17:90b:1e0e:: with SMTP id pg14mr17917982pjb.15.1634362010664;
        Fri, 15 Oct 2021 22:26:50 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:6a02:4736:3b83:a269])
        by smtp.gmail.com with ESMTPSA id h23sm6455646pfn.109.2021.10.15.22.26.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Oct 2021 22:26:49 -0700 (PDT)
Date:   Fri, 15 Oct 2021 22:26:47 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Michael Cullen <michael@michaelcullen.name>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: xpad - Add support for another USB ID of Nacon
 GC-100
Message-ID: <YWpil1CFXObyY6fy@google.com>
References: <20211015192051.5196-1-michael@michaelcullen.name>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211015192051.5196-1-michael@michaelcullen.name>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Oct 15, 2021 at 09:20:51PM +0200, Michael Cullen wrote:
> The Nacon GX100XF is already mapped, but it seems there is a Nacon
> GC-100 (identified as NC5136Wht PCGC-100WHITE though I believe other
> colours exist) with a different USB ID when in XInput mode.
> 
> Signed-off-by: Michael Cullen <michael@michaelcullen.name>

Applied, thank you.

-- 
Dmitry
