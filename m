Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60EA73F565C
	for <lists+linux-input@lfdr.de>; Tue, 24 Aug 2021 05:02:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234439AbhHXDCq (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 23 Aug 2021 23:02:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234785AbhHXDBz (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 23 Aug 2021 23:01:55 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11534C0617AD
        for <linux-input@vger.kernel.org>; Mon, 23 Aug 2021 20:01:06 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id w19-20020a17090aaf9300b00191e6d10a19so845706pjq.1
        for <linux-input@vger.kernel.org>; Mon, 23 Aug 2021 20:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=TpG2C/kTpX//F2miD5d/GHYF7TDY1xK3/TUlOMxRjGk=;
        b=EKuFH0fI9CerzqGCgehqbp4QGN5xQ9rR8p8kg9Q35QXQRIWEJEacI+SYARkmnHPSUw
         11NXDLb7Cti2vFLiGo3gPdgFZgoulpeVjYKE6owQ2wAFdV7wr7LLQQfocM5BR5VysNb5
         LLwXR9tVP/UrjeMh+HPL9Yspo9Xb3DcVNN/ubvqZI9AkHCeeBNFiMwN5Q55FgKobGt22
         IXcQpI1BTj1WehCpHeitGMRYqsOqQvSzynyHOY3Rh6idQzKvAQKGLnSh7xQXi7mlstCa
         OoB7X8D/C1CvEdlZB/f3IxYf5y6PH88NRTl1k4OXscGcmW04qGZfawlv2rqd8NDZV3Hf
         5J0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=TpG2C/kTpX//F2miD5d/GHYF7TDY1xK3/TUlOMxRjGk=;
        b=OjIF4aYr3unm2wht3fxqpaa2fIA7ipEIiIfF5EkXQK3ctXbNqOmruH2a4RPUqMOwRi
         2k2hPmBPq3ZemRai6Ft5XxE076dXLXL3iRmVx+/EfWNmSmYGaWh5tN0X6UbCBLK+HKBv
         mDjOIrPDAnZXo98oK9S5iKkuTnTNuCaXxCX8qbtebQcViigB/pt3b6cljVnxq1vkxrAz
         J4an7feueS8BHZzlK/NQVTcRlOOWVXIfP1IjzV1O+/t+WIAwNigM2ez+4BT/7Ddl2vRF
         rChE92i3GCw0CQ4RE+zL9CyxqoYV3n069zHJVLZwa+0SWtcE/BwWs3+UDUB1zX0BhARE
         QzJA==
X-Gm-Message-State: AOAM531/rp9+lBoKJ89ALVrB3BlcgTXFS4vzGcDK9jylHFjjgpP4cyi+
        +UI2mLRGT5YOFzM5hfHUFkKIMQ==
X-Google-Smtp-Source: ABdhPJyfyflcQvmdxe6+Ho8zP4jQiEKjDXw3D+8njaCvhvBwYbGhbuesOmAm3f/o/UGmnQy8jhjuMQ==
X-Received: by 2002:a17:902:b601:b029:12b:d9a:894f with SMTP id b1-20020a170902b601b029012b0d9a894fmr31544547pls.63.1629774065643;
        Mon, 23 Aug 2021 20:01:05 -0700 (PDT)
Received: from dragon (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id y13sm17822792pfq.147.2021.08.23.20.01.03
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Aug 2021 20:01:05 -0700 (PDT)
Date:   Tue, 24 Aug 2021 11:00:59 +0800
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Luca Weiss <luca@z3ntu.xyz>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Matteo Croce <mcroce@microsoft.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Petr Mladek <pmladek@suse.com>,
        "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
        linux-arm-msm@vger.kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] Warm reset support for pm8941-pwrkey
Message-ID: <20210824030058.GC22595@dragon>
References: <20210714095850.27185-1-shawn.guo@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210714095850.27185-1-shawn.guo@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Jul 14, 2021 at 05:58:47PM +0800, Shawn Guo wrote:
> It adds warm reset support for pm8941-pwrkey driver.
> 
> Changes for v2:
> - Export symbol 'reboot_mode' to fix the build error with pm8941-pwrkey
>   being module.  (Thanks Luca Weiss for reporting)
> 
> Shawn Guo (2):
>   reboot: Export symbol 'reboot_mode'
>   Input: pm8941-pwrkey - Respect reboot_mode for warm reset
> 
>  drivers/input/misc/pm8941-pwrkey.c | 6 +++++-
>  kernel/reboot.c                    | 1 +
>  2 files changed, 6 insertions(+), 1 deletion(-)

Hi Dmitry,

Any comments on these patches?

Shawn
