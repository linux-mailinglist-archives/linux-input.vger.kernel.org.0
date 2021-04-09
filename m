Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF41035A6D5
	for <lists+linux-input@lfdr.de>; Fri,  9 Apr 2021 21:18:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234917AbhDITSc (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 9 Apr 2021 15:18:32 -0400
Received: from mail-oo1-f54.google.com ([209.85.161.54]:37402 "EHLO
        mail-oo1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234692AbhDITSc (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 9 Apr 2021 15:18:32 -0400
Received: by mail-oo1-f54.google.com with SMTP id c12-20020a4ae24c0000b02901bad05f40e4so1576311oot.4;
        Fri, 09 Apr 2021 12:18:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=VjMcThsD8Y4lucSqD8pVZ5HlluzdLfGLCK2uslM1Uco=;
        b=mVfY1smdHvuV5Fq02prK3t5fRwPz8jsHtNgguhyMJiTqBciW3N7sqqXyeDMT0SFqlt
         ibffR6tIphboh0fiG1sG61o6bFsWOIvu8Q2tVBkUM2UZuVIyfFLvFpXewqIHgK2Hn2ED
         1FsI55ugHlkix4MMgRfyt+CxiKU8yMH5rNvVn2kw2LHmQVgwas9H0CKQ/c+4qrCQzPB7
         HcHpwL2vnIzRuQ8cxsvespEP/8Lazm6RHiiVjQ4YrjD0ZtmVFRMfth3MatHJweZyeKuM
         cV2hFH7RKkJXl/dyXRul25Z8VOmzkBYpQEH87DwYXcnn8R2/NPj363ReZ4/LXOikhFwR
         Qvaw==
X-Gm-Message-State: AOAM530RiAlZRY6eBk1KDMMEZfj2s1GO3mS8uxUc8t0h1B7rqcNTrcID
        bZPOtjHOd4zcGVhJMSckaLyAJFc0iQ==
X-Google-Smtp-Source: ABdhPJyr3K8jftBnvEpBuHbO10uNCWCEykVlTa/XhVzh+PqdZMxycKX3mVBP0ZCy82ldIx6lZZ0+Cg==
X-Received: by 2002:a05:6820:3c8:: with SMTP id s8mr13058135ooj.49.1617995898450;
        Fri, 09 Apr 2021 12:18:18 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id m10sm196488oig.7.2021.04.09.12.18.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Apr 2021 12:18:17 -0700 (PDT)
Received: (nullmailer pid 3988178 invoked by uid 1000);
        Fri, 09 Apr 2021 19:18:15 -0000
Date:   Fri, 9 Apr 2021 14:18:15 -0500
From:   Rob Herring <robh@kernel.org>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v3 1/8] dt-bindings: don't use ../dir for doc references
Message-ID: <20210409191815.GA3987907@robh.at.kernel.org>
References: <cover.1617972339.git.mchehab+huawei@kernel.org>
 <68d3a1244119d1f2829c375b0ef554cf348bc89f.1617972339.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <68d3a1244119d1f2829c375b0ef554cf348bc89f.1617972339.git.mchehab+huawei@kernel.org>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, 09 Apr 2021 14:47:45 +0200, Mauro Carvalho Chehab wrote:
> As documents have been renamed and moved around, their
> references will break, but this will be unnoticed, as the
> script which checks for it won't handle "../" references.
> 
> So, replace them by the full patch.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  .../input/touchscreen/resistive-adc-touch.txt    |  2 +-
>  .../devicetree/bindings/mfd/motorola-cpcap.txt   | 16 ++++++++--------
>  2 files changed, 9 insertions(+), 9 deletions(-)
> 

Applied, thanks!
