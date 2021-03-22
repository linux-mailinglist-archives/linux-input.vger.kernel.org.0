Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 137B03437BA
	for <lists+linux-input@lfdr.de>; Mon, 22 Mar 2021 05:03:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229854AbhCVEDD (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 22 Mar 2021 00:03:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229760AbhCVECm (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 22 Mar 2021 00:02:42 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C429C061574;
        Sun, 21 Mar 2021 21:02:42 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id k23-20020a17090a5917b02901043e35ad4aso9689289pji.3;
        Sun, 21 Mar 2021 21:02:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=c70hBrvuJRnMEDdoyjD8MSJzqgxTpl4gZIKm/L8XEiw=;
        b=WGPrwrGq9S9zovZ1ACzFPfgvsM8JGYNLoFKU/5VNLBG02u3yThL4wlpnOEyUt86utg
         MBDNv/FwMrjI+itG/cmMatdtUESb2xrE0KJvgqaK8Q2vac2mFj5FUyrna+Ik55aHkoQb
         5Rbd6fRO73YtSduOHJay6TJPSoT9GhsS5bJvx4/tun5gGOkJsbXDN6xujaoJiwHGcwQg
         9e0NuBESiP/mCs2y+WuypGou25fLsa4EjeTvM1VTlsNfcrB0INDCvRIYA8fljWymxLfI
         f+pbZPcQ9+J0SNGslS6WtKBlU3iw4L0MmG7+4bEJ3Y47T2/PxkhmUCrU87uijxbhF/4K
         FX/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=c70hBrvuJRnMEDdoyjD8MSJzqgxTpl4gZIKm/L8XEiw=;
        b=iFwyJI/M5h8g6D3Q00wegF65kVdAvg2gcrMtd+WG2kHoJgT2gruWrVDPwKN6L8Gyu4
         QkNMXP54lD8H2+1npge0h2XrYoHAQVT2leXCYCACxvz/PM1oUDcoMreIJf7f5BzsipTT
         +8mPU1cvEvZdKu6Eod7H0NXAxDGDEvGRVXSewZohG1bQNJtN0zZJLGdWQyNVpzZD0CJw
         GtYTRIDuJHc1hXb+1jsnlxcJlvE9yL5rqRPuT38cQdIcR1EGihYLWcl9Y2bBDaGzOkMO
         6TJ2pWAMWuLLUZdNGH4NTi0wLInsk5fvywO5meVoo9pi3vxwjQsiEbTkm8HxdZJIGJmR
         776Q==
X-Gm-Message-State: AOAM5326hXXFaTJNFCWPaaMMx4yjk1qx5/3Oh8nPxup4Jc2867sOspv6
        lUfZswHcmpYEDUMFPmjd6cZfNsCwMsc=
X-Google-Smtp-Source: ABdhPJzOcgBXbiqxcEji3yfyjPhDSFYL1u0hk7OGe+EwWSVvD82RvDuG6nsJ8eRmmD55DYhrap6syA==
X-Received: by 2002:a17:90a:7bce:: with SMTP id d14mr11427087pjl.139.1616385762097;
        Sun, 21 Mar 2021 21:02:42 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:85c2:9df1:533a:87e9])
        by smtp.gmail.com with ESMTPSA id v7sm11852493pfv.93.2021.03.21.21.02.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Mar 2021 21:02:40 -0700 (PDT)
Date:   Sun, 21 Mar 2021 21:02:38 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Jeff LaBundy <jeff@labundy.com>
Cc:     robh+dt@kernel.org, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2 3/9] Input: iqs5xx - expose firmware revision to user
 space
Message-ID: <YFgW3vwBTrVJWoJG@google.com>
References: <20210313191236.4366-1-jeff@labundy.com>
 <20210313191236.4366-4-jeff@labundy.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210313191236.4366-4-jeff@labundy.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, Mar 13, 2021 at 01:12:30PM -0600, Jeff LaBundy wrote:
> Add the read-only 'fw_info' attribute which reports information
> about the device's firmware in the following format:
> 
> a.b.c.d:e.f
> 
> Where:
> 
> a = Product number (e.g. 40 for IQS550)
> b = Project number (e.g. 15)
> c = Firmware revision (major)
> d = Firmware revision (minor)
> e = Customer-assigned exported file version (major)
> f = Customer-assigned exported file version (minor)
> 
> As part of the corresponding rework to uses of 'bl_status', the
> IQS5XX_BL_STATUS_RESET definition is dropped with 0 used in its
> place instead.
> 
> Signed-off-by: Jeff LaBundy <jeff@labundy.com>

Applied, thank you.

-- 
Dmitry
