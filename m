Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC15630214B
	for <lists+linux-input@lfdr.de>; Mon, 25 Jan 2021 05:42:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727103AbhAYEmc (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 24 Jan 2021 23:42:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727075AbhAYEmb (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 24 Jan 2021 23:42:31 -0500
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04520C061574
        for <linux-input@vger.kernel.org>; Sun, 24 Jan 2021 20:41:51 -0800 (PST)
Received: by mail-pj1-x102d.google.com with SMTP id l18so1690471pji.3
        for <linux-input@vger.kernel.org>; Sun, 24 Jan 2021 20:41:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=AsKQhwwoBT5OxyGLdv8SWkldRl33+o8q6XVwz9MPPoA=;
        b=Zk8riNpHnt2SLLPiknJ8auLA6l54Ie81opaSJKi5TOz+Bp8bbUSGBLmX8erL45wvPY
         6bBJjkY3CvJ4XT/MJxREWKf+zs142aKPiGb+xs+Qoumsc1EzbfFvcovz38i+ReFMaxoR
         6/b1gRtY5PrDGOf8U4PM5Lc16BZ6wxBOOBvBnRMu42AZ1JWoT6NNlPQx44bT/2iH8wpP
         0M9/CMt30vJ3oQ4jMrof4UcEuivl9XHAMDX7GBYg5ipRo5Un9mEtzweBVWdwpyvKsnTc
         OUutzIXcK5sawwhBAiJXJ1DQ1R8mpyH+TYrWbBSGVFySqqjBhiRM1CowlpWxX0SEk6uQ
         Yu8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=AsKQhwwoBT5OxyGLdv8SWkldRl33+o8q6XVwz9MPPoA=;
        b=ZHtnRvAsUBEezNTWp05ioE5L1v8kF0gcUT3OJB3CR/veZfmnGg+Htd2UFmSlljrZHH
         TZeJlw2wT03TXsaZOQJM1qauReeI8/ahEcv+E/tp+vFU+txzpciaMGEGyXRKM6/fuMZ9
         99tK8OicQ+3vNTTfIzw4DF9ldGH87pB63GoBhsiFCTEXOLFpH1Ufp9HpRu7Ang9QEfgS
         Mu/v2iiGBaiEr67CGVRPzI0lXkdqlyfVsTYs5cTWvH7Ov2LA23CMGgDJYTdTLxncxkF/
         82727/+9WFlzd0qtUloQIvmtMRQGPHYGcrigz3v7ioFPFosuZVq/UPPN2zCOPEZ9Ox//
         TqKA==
X-Gm-Message-State: AOAM533pE9KNhDzdUoq+x1LoCvkc+tjZ6Ko/x0nxYLKijI0b7SgMROxV
        M1dA+lfCQgpiN2ZYA65oOVE=
X-Google-Smtp-Source: ABdhPJzUOErw3sdHPu92p2Uxm74FZCiSWljPrLXMKt/oN8dZ77cfmFXJybRzF5EplKR0jlRwUyR7YA==
X-Received: by 2002:a17:90b:94c:: with SMTP id dw12mr4374330pjb.77.1611549710540;
        Sun, 24 Jan 2021 20:41:50 -0800 (PST)
Received: from google.com ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id c5sm15320922pgt.73.2021.01.24.20.41.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Jan 2021 20:41:49 -0800 (PST)
Date:   Sun, 24 Jan 2021 20:41:47 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Jeff LaBundy <jeff@labundy.com>
Cc:     linux-input@vger.kernel.org
Subject: Re: [PATCH 08/10] input: iqs5xx: Allow more time for ATI to complete
Message-ID: <YA5MC4h640nr3MgZ@google.com>
References: <1611002626-5889-1-git-send-email-jeff@labundy.com>
 <1611002626-5889-9-git-send-email-jeff@labundy.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1611002626-5889-9-git-send-email-jeff@labundy.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Jan 18, 2021 at 02:43:44PM -0600, Jeff LaBundy wrote:
> After the device is initialized, it runs ATI (calibration) during
> which it cannot readily respond to I2C communication. To keep the
> open and close callbacks from writing to the device too soon, the
> driver waits 100 ms before returning from probe.
> 
> The vendor reports that ATI may actually take up to 250 ms to run
> (including margin), so increase the delay accordingly. Update the
> comments to clarify the reason for the delay as well.
> 
> Signed-off-by: Jeff LaBundy <jeff@labundy.com>

Applied, thank you.

-- 
Dmitry
