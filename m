Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 00F763021A0
	for <lists+linux-input@lfdr.de>; Mon, 25 Jan 2021 06:21:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726231AbhAYFVk (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 25 Jan 2021 00:21:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725821AbhAYFVi (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 25 Jan 2021 00:21:38 -0500
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 383E7C061573;
        Sun, 24 Jan 2021 21:20:58 -0800 (PST)
Received: by mail-pj1-x102d.google.com with SMTP id l18so1750374pji.3;
        Sun, 24 Jan 2021 21:20:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=Dds/WUdH9PnyQJIl6DvWk3y0e5c+VljMiMqdDLW00eo=;
        b=aUbpK8mE9FdDCtnG3Wp9dOLFJQatc42v4dnZuSe5ywgLs15fD3JjZJBG7YCRiH9BzJ
         tavgdxfEWMP3nJDfIwkAnml3MRco42FXX3GStJkbURsCA7Wc1xAzfL2nZbxc3Dl/0OnR
         PPRWJ21N/wtenBqYyHPlu2jYWm++0xttx4mK3RR9qtXLWHVK/wN8VpM3qW0znmce8ilY
         J/QqAdmXSMzDkwacS1yjggWPWguohByHbCOz9gVIPVPVqH9xtCQorDKWv1kwd8LsNOn5
         zILCy8RE24C22/PnXnOAhIxPE0XiasA6oOnK0WnfHOtUKxuxwKsHtiStfTCL6JJ1VnSc
         YxJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=Dds/WUdH9PnyQJIl6DvWk3y0e5c+VljMiMqdDLW00eo=;
        b=BU0nCea92oGJq09Itl4uj5aTZlrRJoTBS1w5R6fgB73eJbyzCpFp4Cs2X3Lff9SYCo
         yIsfl811BL9LRJqY5WDfT8NNMD6so9sA6fsk5X6Qp+1+bJSyqByZRh+pMvsObXU6QUbw
         HlhwGtjomCKFv2ArQti2DHVIrQClvfBF2iz6Dkbb3zEWP7V6cYq9HT7+/9/LlMdqFsHD
         1enDJqnOa22Oy1JX8yqCtjL7WWGh1sgZSD8zz8BR/p4nqlQw+bHy7T8oZo/Gzd0uTsMF
         Rdk1x61uXIjsLCvhZn9u7G2+3dWd/FV+hf6WLfyEVqMjUNXCFc79eIWe9vbq5uWUOSIe
         kXSQ==
X-Gm-Message-State: AOAM531cqFhA0YHEjF1xQYXSvAS3nFwWRCeNBcjSZWbBIVftN5i32XYa
        xbB7l40YAbkVnR15M5DS8Ww4ogecs9k=
X-Google-Smtp-Source: ABdhPJzdUoh5B6dMgRhGEhLrOl14C38iw8g4rBvfTcmwcgxwtNxlDqwC+tNX1D3wLLKV1Y/PP2FSjw==
X-Received: by 2002:a17:90a:4088:: with SMTP id l8mr1571526pjg.106.1611552057777;
        Sun, 24 Jan 2021 21:20:57 -0800 (PST)
Received: from google.com ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id kr9sm17111965pjb.0.2021.01.24.21.20.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Jan 2021 21:20:56 -0800 (PST)
Date:   Sun, 24 Jan 2021 21:20:54 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        Johnny Chuang <johnny.chuang.emc@gmail.com>,
        linux-input@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9] Input: elants_i2c - support eKTF3624
Message-ID: <YA5VNtc7vetdNDHq@google.com>
References: <20210124195414.27333-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210124195414.27333-1-digetx@gmail.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, Jan 24, 2021 at 10:54:14PM +0300, Dmitry Osipenko wrote:
> From: Michał Mirosław <mirq-linux@rere.qmqm.pl>
> 
> Add ELAN KTF3624 touchscreen support to the elants_i2c driver.
> The eKTF3624 TS is found on a series of ASUS Transformer tablet devices,
> Nexus 7 tablet and etc. The firmware interface of eKTF3624 is nearly
> identical to eKTH3500, which is already supported by the driver.
> The minor differences of the firmware interface are now handled by
> the driver. The eKTF3624 support was tested on ASUS Transformer TF700T,
> TF300T and Nexus 7 tablets.
> 
> Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>

Applied, thank you.

-- 
Dmitry
