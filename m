Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB3B640B7BD
	for <lists+linux-input@lfdr.de>; Tue, 14 Sep 2021 21:16:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232853AbhINTRV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 14 Sep 2021 15:17:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232618AbhINTRU (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 14 Sep 2021 15:17:20 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24EFCC061762
        for <linux-input@vger.kernel.org>; Tue, 14 Sep 2021 12:16:03 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id c4so15188pls.6
        for <linux-input@vger.kernel.org>; Tue, 14 Sep 2021 12:16:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=WFOT59cCtymWMfL4SO8+d5Xi0mJUHh8WtafGla+6Fjk=;
        b=fFUtYwDyRmbrGZNDvI6UWZKiCmvMlSwziL8cwdTH2CeDOMkrl0eIUFq46MGgXn6YFH
         HGQLkqHGMV9AZNAeU0yYflwmP0+eTNGG+pVCkUkHxH2iZ4O8RO+Fkoal29xRSbFn6+rl
         0WNChNpZliAfyDd/ac/zMd4FTcuGjGgJJb+sBG071sH6ZtZpLWMfRfdtK5Uxs847Rjju
         Rv8IIaPAXGwVwd/qZaD1SvQ2SG6R1+lvIwkaeehJikFPSIL+FteKeRgluGaEMTMuPFRD
         PyF7GYPeIxp4iAccTJWhSsk8Yl6f+6bs0Bq7l4hnAnm6qNskanPWTkQQ16B+G6i/eg2e
         zykg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=WFOT59cCtymWMfL4SO8+d5Xi0mJUHh8WtafGla+6Fjk=;
        b=gzw72m2Q2F9qtbpNDasUnYeXzpEzDTYxtbY1CHZedetbi0EZ8bE8qNy0cDX3ixYQl8
         +ftegEl2UOc4ADUzmC31Lxuf0DnzV9Z6Wu/zheXf5L+5qty0H5ejZnFINiGLL2jWEyt6
         jwxokBuuDIL+ch1a/CrL6PRxKybIANI3Q3mBIXr475gJO+NPwP5lPOr02ZNExuzd89rv
         wwHHJL5vhTPLK6rfOnaNScvcFxaPKp86khSZBfvRhpxTj0FYnKDTapW/WxbjYU0HNuLV
         XYXfdJn3JN2fsftkuf+PFSYnu4rJBiRX+9RAZ+wSXdyq4EzvbrRnCH7CPXJhp2DBlguu
         5q+w==
X-Gm-Message-State: AOAM533lFpt8cCbHcMbVY3iCEhMP98JRNTynQfX9RMVu339KFvvy8GCp
        6swQuR5VrCUlg81X9cpiEg44pg==
X-Google-Smtp-Source: ABdhPJwXvhp6LRKLX8SxbopWpgdpnqaEzIdnzmExTZ7x8IVkYopo45xSAT9ofirlyG0sr+Upl2o09w==
X-Received: by 2002:a17:90a:420c:: with SMTP id o12mr3897532pjg.101.1631646962604;
        Tue, 14 Sep 2021 12:16:02 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net. [71.197.186.152])
        by smtp.gmail.com with ESMTPSA id d13sm11034666pfn.114.2021.09.14.12.16.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Sep 2021 12:16:01 -0700 (PDT)
From:   Kevin Hilman <khilman@baylibre.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Fabien Parent <fparent@baylibre.com>, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        Mattijs Korpershoek <mkorpershoek@baylibre.com>
Subject: Re: [PATCH RESEND v3 0/4] input: MT6358 PMIC button support
In-Reply-To: <20210816100013.100412-1-mkorpershoek@baylibre.com>
References: <20210816100013.100412-1-mkorpershoek@baylibre.com>
Date:   Tue, 14 Sep 2021 12:16:01 -0700
Message-ID: <7h4kan7ytq.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Dmitry,

Mattijs Korpershoek <mkorpershoek@baylibre.com> writes:

> The MediaTek MT6358 PMIC has support for two buttons: PWR and HOME.
>
> The interrupt logic is a little different than other PMICs from the
> same family:
> for MT6323 and MT6397, we have one interrupt source per button
> * for MT6358, we have two interrupts lines per button: the press and
> * release interrupts are distinct sources.
>
> Changes since original v2 at [1]:
> * added 4th patch with device tree enable
> * cover letter title prefixed with 'input'
>
> This has been tested with evtest on mt8183-pumpkin on 5.14-rc6

Any feedback on this series?

The related MFD patches were merged already, so there are no out-of-tree
dependencies.

Thanks,

Kevin
