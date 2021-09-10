Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 90947406676
	for <lists+linux-input@lfdr.de>; Fri, 10 Sep 2021 06:26:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229778AbhIJE1l (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 10 Sep 2021 00:27:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229746AbhIJE1k (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 10 Sep 2021 00:27:40 -0400
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86688C061574
        for <linux-input@vger.kernel.org>; Thu,  9 Sep 2021 21:26:30 -0700 (PDT)
Received: by mail-pl1-x62b.google.com with SMTP id w6so352609pll.3
        for <linux-input@vger.kernel.org>; Thu, 09 Sep 2021 21:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=SDPXXQ+epRj0UCHWgUhGBoScqOzy1zYuyGrF/yDUmlA=;
        b=EVwsPV4n9QY3MssfkrRrxpmEuv6nlqpqH5ku/C1DDOz3Q0kIFHYXiAi6oTkUQ1pxRc
         3Wo7X5sTLVTfS7RIwAivE6tD1MK4SB1JHQcIl2qzzAZTv2tndO7lmpw4vwdlnOaBjb1A
         enYOe+e7OCRzddqRKGqYIL++dSATgdW8/ymzFGwgZe9V/Y6C4HKBuenPLx8PCgkHBfNm
         AXYO4EwOi/ZSKr9dbDHcIz/8KzvbhffLQ16vPAvWM4y06eMUD2gOdqpKMdW+smtGKUYb
         2PgBrd4zPijCCWEwAYu73jDYeNsSZw7uHX7PHdAs8XbdxMMBXA78ynxHExMSfoq/mbvz
         DbGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=SDPXXQ+epRj0UCHWgUhGBoScqOzy1zYuyGrF/yDUmlA=;
        b=zKs7o2O8aUURW9xywJhn2q4/qbQxIvxtrEDS5kHidRyUpPzl2YMs5GvQl/5y2Sir+Z
         NAiK/RZhzRf5SMowMtDPSNtA+kM+PZDr5frKmEwLFgrU+bOAP+DolvEMG6z4cfwec06C
         Yr+4K4edmlgKOSikG1QWp4qoibqkxUfXV6NH5Tpcr3PKHLNH9viPDWSxqMHPany9QtKo
         v1YdQ7//rUM8Hi9zDyCPJikDgxSSnR7/0ZRHgm3ckYtYTDaf/7KOViuOlwLw6zHQ7UFC
         o4pEpzXLRKUDLTbLR8NCapZ8cbauZz/9bpMEdgauqm6EDJYqOZblYsrczfMjLtdj5R2g
         FlkQ==
X-Gm-Message-State: AOAM531akezfHNsCEhaxlBOH6U54ctAGiWlNxJsR00eq7NoXQYKUXWEN
        XZ5Y6/l6amPlaNwGkM7baMs=
X-Google-Smtp-Source: ABdhPJyuTdmLHEreRW6FRfVWf4TXXR8eZUVIo17zinYNAav7hSZdCWGOrvpPEO7Ve+XJn/xO75TjYg==
X-Received: by 2002:a17:90b:4f4b:: with SMTP id pj11mr7466806pjb.170.1631247984129;
        Thu, 09 Sep 2021 21:26:24 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:acdc:1d22:e20a:2796])
        by smtp.gmail.com with ESMTPSA id g11sm3926979pgn.41.2021.09.09.21.26.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Sep 2021 21:26:22 -0700 (PDT)
Date:   Thu, 9 Sep 2021 21:26:20 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Daniel Mack <daniel@zonque.org>
Cc:     linux-input@vger.kernel.org, m.felsch@pengutronix.de
Subject: Re: [PATCH v5 1/3] Input: ads7846: Add short-hand for spi->dev in
 probe() function
Message-ID: <YTrebMsLTqFIB3ma@google.com>
References: <20210907200726.2034962-1-daniel@zonque.org>
 <20210907200726.2034962-2-daniel@zonque.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210907200726.2034962-2-daniel@zonque.org>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Sep 07, 2021 at 10:07:24PM +0200, Daniel Mack wrote:
> This will make the code a bit more terse.
> No functional change intended.
> 
> Signed-off-by: Daniel Mack <daniel@zonque.org>
> Reviewed-by: Marco Felsch <m.felsch@pengutronix.de>

Applied, thank you.

-- 
Dmitry
