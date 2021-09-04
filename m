Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E7585400A0D
	for <lists+linux-input@lfdr.de>; Sat,  4 Sep 2021 08:39:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231737AbhIDG0t (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 4 Sep 2021 02:26:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229998AbhIDG0q (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sat, 4 Sep 2021 02:26:46 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 909B1C061575;
        Fri,  3 Sep 2021 23:25:45 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id g13-20020a17090a3c8d00b00196286963b9so901570pjc.3;
        Fri, 03 Sep 2021 23:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=OTxssIBO4HcTdYh1ifmYTiUdfzzEfxdqNdMMgG76Y/o=;
        b=PAXHbmu8JjXjOHotNBRYyaOnXaLrk1dX1mvIUyxSZC5/iuNiGkiV+ygQBrs87vqzRu
         n7GudcUSRBvy/S+X/CeMuLFAR38ry5vRcqKF1rvcEMXjNIiSllCL979pjvCUBTTwlU3f
         oiUC2ejK6grsbV5hzhoYl4S13s4IKcHEmMjqL2YDpqqcW+aojz6/1DHfT4xlPA4Y/y8N
         SbT+YccBtsKnK1vrY81rbZecSW2Mgz8Oa/6rfsdFNsfO+FOt1ozuc+SYc8QE9UDzLhNx
         LkaJh9gPpPrD9XPbnX3uIPZXfE1YpuKAKN9eak4Raf9u07J4QGkrWA9aJQlSGgYkpGuh
         /tRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=OTxssIBO4HcTdYh1ifmYTiUdfzzEfxdqNdMMgG76Y/o=;
        b=gtMdiyHIcvagUL3IyAfy5sDcH2tZ+s0H0+iG1HGrIUBRCpcgXihEkhAcr5SB5KGjOg
         2zuWIh0eN94Abit9ztl3iPQWTW91OV0SzMRkSm+gkExuQfiHY5+tND8Ze+DTMm9eREVh
         ap7ABZXwXhhIbqyllsEgePUsO9/NblIXCsVoJTU5lYUlVk2Kvz4aeNfqV3iKzt0MZFof
         hKxCBzINTNSM0DKt0ZxXn58KWYe7C1kSmOtenUy/uLXxVVXq72NI241Fu4VuPCeMWU64
         ODTsRlf/YhZ306+IYM/zqEER2VuN7+fTq48HHkORAOmqHTvU4+V6bl1zsnmQgTpUcXI8
         nRgA==
X-Gm-Message-State: AOAM5329cUD/CaH8/e6j/rZu77D8TVO37pGpZrKGj3qZYYO4qVeFjH3i
        QrZuBNIpyj+zYHk9Dx3CMK1M1Bqq2sI=
X-Google-Smtp-Source: ABdhPJw4QFZ/PIDE5FeZUvknQyjC/oU3Dh3BgQuiVEXrdjP37HPkG4WO/sFGu1YU7vi5HHLs53PXxg==
X-Received: by 2002:a17:902:c410:b0:138:b4be:289b with SMTP id k16-20020a170902c41000b00138b4be289bmr2201048plk.13.1630736744957;
        Fri, 03 Sep 2021 23:25:44 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:44a5:4d4e:ed46:daa])
        by smtp.gmail.com with ESMTPSA id n14sm1194117pjm.5.2021.09.03.23.25.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Sep 2021 23:25:43 -0700 (PDT)
Date:   Fri, 3 Sep 2021 23:25:41 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Colin King <colin.king@canonical.com>
Cc:     linux-input@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: keyboard: Fix spelling mistake in Kconfig
 "useable" -> "usable"
Message-ID: <YTMRZY8UIBVt5+4z@google.com>
References: <20210705100230.7583-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210705100230.7583-1-colin.king@canonical.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Jul 05, 2021 at 11:02:30AM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> There is a spellign mistake in the Kconfig text. Fix it.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied, thank you.

-- 
Dmitry
