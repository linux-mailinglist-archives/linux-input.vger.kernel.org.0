Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71DF232250D
	for <lists+linux-input@lfdr.de>; Tue, 23 Feb 2021 06:08:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230434AbhBWFI0 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 23 Feb 2021 00:08:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230417AbhBWFIZ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 23 Feb 2021 00:08:25 -0500
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B907C061574;
        Mon, 22 Feb 2021 21:07:45 -0800 (PST)
Received: by mail-pl1-x629.google.com with SMTP id p5so4250996plo.4;
        Mon, 22 Feb 2021 21:07:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=dAkQUG7Z9NTO7eCrWZ3ts0tI7vRJSQ9EpDPOXxmBG6I=;
        b=EXs38H2lr1bu3uXmDZ/jToS+XJPhFd62xLdVPTu8hJsQjyJ99PY7YItBY7nCXOg+uR
         PD+ZgVOj+yVFPBznHwaK+FVTtrRBm9oUQumh/ZB0PTExIfRD17PFgo2zP1W1YT/TvTLN
         QGx70SrVu/si4EePOd8XgnCHfpXLb9tp+K6rMU/TOh4a80N1yKSBUEXsP76dSM1wrioL
         awYoE7gWsJYyLCIAcybyyx+SuRZpj3BLzB4kkRMY5QS2dSrNcvtZOKNKVhWW8HPnHayi
         idWJOmBuqlZzyrxRfXRafzvutueJNriI9YQvPjHPvNZTA7EAOR32Iy4Ft9CauCeOqzZ5
         74vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=dAkQUG7Z9NTO7eCrWZ3ts0tI7vRJSQ9EpDPOXxmBG6I=;
        b=Uy5y7axEAVWclii6LFIn/xrn3cRdzqOs5OCu8N4TTQ73Mi1Sc1JrwKZC1My2rGx4gn
         /h1uCTEkuQjDo2/yZ9uucMfNyeEI+/aZ2vcSgDxdz+rB0geVERc/r6dOgFaq8Bnhgw62
         7huxNFV0E3YajD+hgMWxaPZP1Y11DjLvj4zQQCmWC5/shooJaSQCQgawh42myy/tEUL2
         vCpueFy9vLssw6NOnA7JC8TrHv70GRPx2K4ZdpucmuSMFxMm8prRMD5w4rmiHPpVDZCf
         CWKpsUE+Iw5T16u8Xy/APuBUUmgIA27sCfWrbKB6D6wAd6J2NAnGucqELmZ4YGvFSMvp
         4PLw==
X-Gm-Message-State: AOAM5328pHdV+ebJd0Cb8V01k09L5PySouhFmuYVXGxBo89CGxvcAPNo
        Od+6oPWnWosg9gOGyi0FUoM=
X-Google-Smtp-Source: ABdhPJz4FkkeIbSeyIV/5naXadDKYw+R/vDAr/qiPlb27jBJdq32r9+9SjUS7OEK6mBBHgrBjQUpeQ==
X-Received: by 2002:a17:90b:1650:: with SMTP id il16mr26072559pjb.97.1614056864418;
        Mon, 22 Feb 2021 21:07:44 -0800 (PST)
Received: from google.com ([2620:15c:202:201:bc19:4f46:855:edfc])
        by smtp.gmail.com with ESMTPSA id u15sm11540638pfk.128.2021.02.22.21.07.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Feb 2021 21:07:43 -0800 (PST)
Date:   Mon, 22 Feb 2021 21:07:40 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Philip Chen <philipchen@chromium.org>
Cc:     LKML <linux-kernel@vger.kernel.org>, swboyd@chromium.org,
        dianders@chromium.org, Benson Leung <bleung@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Guenter Roeck <groeck@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        Simon Glass <sjg@chromium.org>, devicetree@vger.kernel.org,
        linux-input@vger.kernel.org
Subject: Re: [PATCH v7 1/2] dt-bindings: input: cros-ec-keyb: Add a new
 property
Message-ID: <YDSNnGBWcKdSi7Rq@google.com>
References: <20210115122412.v7.1.I025fb861cd5fa0ef5286b7dce514728e9df7ae74@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210115122412.v7.1.I025fb861cd5fa0ef5286b7dce514728e9df7ae74@changeid>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Jan 15, 2021 at 12:24:29PM -0800, Philip Chen wrote:
> Add a new property `function-row-physmap` to the
> device tree for the custom keyboard top row design.
> 
> The property describes the rows/columns of the top row keys
> from left to right.
> 
> Signed-off-by: Philip Chen <philipchen@chromium.org>

Applied, thank you.

-- 
Dmitry
