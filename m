Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78D1B3437C1
	for <lists+linux-input@lfdr.de>; Mon, 22 Mar 2021 05:04:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229455AbhCVEEJ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 22 Mar 2021 00:04:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229746AbhCVEDg (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 22 Mar 2021 00:03:36 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24906C061574;
        Sun, 21 Mar 2021 21:03:35 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id j6-20020a17090adc86b02900cbfe6f2c96so7817782pjv.1;
        Sun, 21 Mar 2021 21:03:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=2I8MbTPPgrskeem4d4TsmAXFts8cC7aq94JnfExb5QE=;
        b=boqswJJdF4tNHuflwUDm0udUf3xO6lr3ofVmSo6YqkTXoi+7FRH7VCzkvs+JcDadu6
         1XEB/NBQNXtmbAidv3iqsXclUXGvKdzHR5M8bW9wTeNChve9hZBm9idPwz1g4kAXUzz/
         XkRBJoylVMPHD5IgbH3QPORyt2d5VxkdCvGfrif+Sv7t43eyMKCDRQCqrvIUYbG5zG+h
         h6yGLrX5T9w1FL5ahLjGQXI0G91KQJ7AbxEjzamzHsKJw4dpFMPhwjpTFbyJdJuZGNrK
         OJZE29YHvuoLoFFIrRE9c4uwFx0+ZGoNTG5vJgqy/XWPqwLVHrLJ7Pzeb6aj5FoNwZcj
         Fwug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=2I8MbTPPgrskeem4d4TsmAXFts8cC7aq94JnfExb5QE=;
        b=mjdb5ILIm+IjWFimgl2y+diZWjWawpBBUhy4dR5XqVPYmiOMShvH6hYauvAIEXUpXy
         bHltYk1x4OcPd4s+FGxlNCZv4bTIGioH5CL/ha1KDXUuvogv05MW4FdrpGNJaqe8yr1V
         MPVw37W1JLKTJFsnnwLHXPt3CMd8KXEOuddxame7G9moZzblTRMkKFqakZ0itqme3I8v
         ipFzvi917qTGUFw0GgHzs/M8/HH67xer5CVxTvJGibfdnVoDd4kbWpdtaOrKYBrOIl3u
         Re1IVnU269R3Znd6CQTkPaGuaL7liVqn5UmsWDmBojjWXtO6zcdCzaLFKk/T3wMcTkDe
         XzEQ==
X-Gm-Message-State: AOAM532Ws4rpid/U8aJIIlC0qp452hT05tb6vXPcxbz+hv/k7l/GXmpJ
        UOx1GtuBykz0J3FwLNq//wNrJ0qc+48=
X-Google-Smtp-Source: ABdhPJwubdd8EvKm3FX2Q5rpt8upvL1tmVvGCT0r0gL7sC0u6Qn0V/5O25f5dztnKD3uVmQ8jvIkLg==
X-Received: by 2002:a17:90a:f010:: with SMTP id bt16mr11121694pjb.116.1616385814629;
        Sun, 21 Mar 2021 21:03:34 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:85c2:9df1:533a:87e9])
        by smtp.gmail.com with ESMTPSA id v35sm11010813pga.3.2021.03.21.21.03.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Mar 2021 21:03:33 -0700 (PDT)
Date:   Sun, 21 Mar 2021 21:03:31 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Jeff LaBundy <jeff@labundy.com>
Cc:     robh+dt@kernel.org, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2 4/9] Input: iqs5xx - remove superfluous revision
 validation
Message-ID: <YFgXE+MCkbLPB4rW@google.com>
References: <20210313191236.4366-1-jeff@labundy.com>
 <20210313191236.4366-5-jeff@labundy.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210313191236.4366-5-jeff@labundy.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, Mar 13, 2021 at 01:12:31PM -0600, Jeff LaBundy wrote:
> The vendor-assigned firmware project number is restricted to the
> generic project number (15); however the vendor may assign other
> project numbers to specific applications and customers.
> 
> These custom project numbers may be based on forwards-compatible
> firmware revision 1.x. However, the driver unnecessarily rejects
> anything older than firmware revision 2.0.
> 
> To support other applications, remove these unnecessarily strict
> checks and enter the bootloader only for truly incompatible A000
> devices.
> 
> Signed-off-by: Jeff LaBundy <jeff@labundy.com>

Applied, thank you.

-- 
Dmitry
