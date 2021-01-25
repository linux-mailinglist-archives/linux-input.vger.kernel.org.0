Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 360C6302112
	for <lists+linux-input@lfdr.de>; Mon, 25 Jan 2021 05:23:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726660AbhAYEWr (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 24 Jan 2021 23:22:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726652AbhAYEWo (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 24 Jan 2021 23:22:44 -0500
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C851C061573
        for <linux-input@vger.kernel.org>; Sun, 24 Jan 2021 20:22:04 -0800 (PST)
Received: by mail-pl1-x636.google.com with SMTP id d4so6814766plh.5
        for <linux-input@vger.kernel.org>; Sun, 24 Jan 2021 20:22:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=JOySmHYjCD1EwYfAm25VPIVOVoOBxukzoH/naX9Vt8I=;
        b=R/iOhkOZ46hqI2YLgClrMbvq+17pGCPHiFMAXS/2JjB2xuA2sZshdndMhNwj6GzwvE
         5VCy57JXGkoS0JQ32VBYzhvrpVRlCIpbu/GQpBjcl5PqJwwQo9y7RvaAdt2NcFA7FZtE
         o2CYOFbcxnrTBFFpqHPxRJpBapOa0bDLSfSJUp7WN96Dh/NrGGdDNHGy+IsTXsyLcuRq
         Bioh35NwMyDAmwzfimzXePO98UUKHCyLblkjAsmAFsFauvxxUeEDP/OmYqcaDH2IqeNc
         FfjFNYUinGaxRKcxTM/GmSGL10ZiNXvRSvkr2PAvFHMpjmqFuIReZvsf2uAnaG6G0fBA
         DoKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=JOySmHYjCD1EwYfAm25VPIVOVoOBxukzoH/naX9Vt8I=;
        b=LXjnC5we+dTuSuv6EccZIwjFIhlSyADJDjyXVV4lEynLW7Bj++OFOe5KBl119PLgkm
         pjsqiB5zeay2H4zpfF40tGISX8JYPRiNZ7rjPmuf1lMI37ilog6Ao2pZTFsmcNMCN/AH
         4UaFktI0Y1ItuUY1gcank+Ubv7T+UmQYvYEjVn3vQH2v9wIqkIbbK/qJhOJz9XVRwrwf
         Ugr3qgsGXT9T+AQg17gdBItDnIp2HfSUN4Vq5SWku33kIDzxiLwNY38h+hiPdHo4PQNL
         vb55CaqXjihu3OO6PtXQv093X2xbTzmgMSz06fjHM5CTst4RdoYx2Vbnr4QBhRAGRjCB
         8sxA==
X-Gm-Message-State: AOAM532h11fpVc/iTbQOI8YR+YwnGG8bT7oeblOP4m5lnMfkY6P6kz0s
        ayCvnd7Rh4y1f11OWWPgxJuMsc9Wido=
X-Google-Smtp-Source: ABdhPJxg9ot9Wz0dOfyABq6gRXNVnrfnAdeAXNE8x6iY0XCHlshdXD0l04lsfulmEPQzdrpjZLW/4A==
X-Received: by 2002:a17:90a:9302:: with SMTP id p2mr2598474pjo.213.1611548524081;
        Sun, 24 Jan 2021 20:22:04 -0800 (PST)
Received: from google.com ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id j16sm16906426pjj.18.2021.01.24.20.22.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Jan 2021 20:22:03 -0800 (PST)
Date:   Sun, 24 Jan 2021 20:22:01 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Jeff LaBundy <jeff@labundy.com>
Cc:     linux-input@vger.kernel.org
Subject: Re: [PATCH 04/10] input: iqs5xx: Expose firmware revision to user
 space
Message-ID: <YA5HaeHha1fTXARp@google.com>
References: <1611002626-5889-1-git-send-email-jeff@labundy.com>
 <1611002626-5889-5-git-send-email-jeff@labundy.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1611002626-5889-5-git-send-email-jeff@labundy.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Jeff,

On Mon, Jan 18, 2021 at 02:43:40PM -0600, Jeff LaBundy wrote:
> The device's firmware accommodates a revision field that customers
> can assign when firmware is exported from the vendor's development
> tool. Having the ability to read this field from user space can be
> useful during development.
> 
> As such, promote the fw_file attribute from W/O to R/W. Writing to
> the attribute pushes firmware to the device as normal, but reading
> from it will now return the customer-assigned revision field as an
> unsigned integer (e.g. 256 = 1.0, 257 = 1.1 and so on).

No, let's not overload this attribute and instead create a dedicated
fw_version or similar read-only attribute to expose active firmware
version to userspace.

Thanks.

-- 
Dmitry
