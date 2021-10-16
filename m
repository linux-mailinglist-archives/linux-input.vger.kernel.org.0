Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E2AE42FFE7
	for <lists+linux-input@lfdr.de>; Sat, 16 Oct 2021 05:27:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239736AbhJPD3y (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 15 Oct 2021 23:29:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243566AbhJPD3x (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 15 Oct 2021 23:29:53 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF12FC061762
        for <linux-input@vger.kernel.org>; Fri, 15 Oct 2021 20:27:46 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id v20so7549786plo.7
        for <linux-input@vger.kernel.org>; Fri, 15 Oct 2021 20:27:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=0LaTmwiNCDVlR0J4qtHzyRrNpKH7oxM8vLE3sdb+1sk=;
        b=dNxwZpCmEBd/OVMWjXG8pvd3HNIK+orI5Qr/jlUI1r80sRosYPSUDfAa02GVW0dtTN
         rXr0Ak7NtPZy1N/yrb+Tenhm65hZh+FHGo8z5+22m76Q9OSCZIusXjVUlIwdrH1Tbkb7
         epQDlAdlb39RmjXCa/zRnLfBz10khYH4yBc4kKPZXKYnPERooWACocjpbyBdqThdoQ07
         TaLaB49R+K0zUehpPZJ+z4tgHSbB5eOcZW8GTMk0q7ZbA9XTtBLdK3guZyGO9w8tac3l
         i8CoAn+wUbYugV8oQZdRHIsH3TgdQY1QfdczE0NFyJqhMireGcIRNvvsAkNTkQg1lXlJ
         m3gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=0LaTmwiNCDVlR0J4qtHzyRrNpKH7oxM8vLE3sdb+1sk=;
        b=biusSPBLpiPDeUAsBklwyhDM/gJqaIqh2qo980BIKkuFJAQh6wQRI7JQ6HN1ait1E2
         WEZ7yaosllX9os0buQ8lPALCvY5TtpVIPZsyS7iZoGrZBHBg1hFBkzV1ge5UxvzLMqlz
         gzW1yKYRrV1U1CNDN+8XRFH0D/GoVg+SUsUMukSurdqftgmQWcEoEDxLZTqZJJmTLTPL
         7fWYN4QPEkuU8l0zV6/kNNh4du3sG5RilNKwwceIUbQil6QvAT8xxdxXzh0IF0bEaHXc
         TQDBGcBSaFHL2X8oV+ipr5GW/2lTE1f40Rnpi9XY5sPvnkvkwZhU3O29pa8QnsxefoEU
         tcWw==
X-Gm-Message-State: AOAM533/NE3J8vfYEs2d8J1lhkjvo7QONcwSRHAdZcpwHTEakCWTB0IL
        b/7lhkjNmnKHv9iQgpfaf0M=
X-Google-Smtp-Source: ABdhPJxMLgTwc0qjsvzJxnLPtLeSYtAuLpA6Xi65HHxSE4DzlK0T0taV9yyU3mvZDEFFiwzv8XLqlQ==
X-Received: by 2002:a17:90a:5108:: with SMTP id t8mr32294183pjh.201.1634354866123;
        Fri, 15 Oct 2021 20:27:46 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:6a02:4736:3b83:a269])
        by smtp.gmail.com with ESMTPSA id m12sm5932731pjv.29.2021.10.15.20.27.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Oct 2021 20:27:45 -0700 (PDT)
Date:   Fri, 15 Oct 2021 20:27:42 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     linux-input@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH 2/2] Input: tm2-touchkey - allow changing keycodes from
 userspace
Message-ID: <YWpGruYfmQljXnuY@google.com>
References: <20211013112305.41574-1-stephan@gerhold.net>
 <20211013112305.41574-2-stephan@gerhold.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211013112305.41574-2-stephan@gerhold.net>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Oct 13, 2021 at 01:23:05PM +0200, Stephan Gerhold wrote:
> At the moment the touch keys have key codes assigned from the device
> tree. In some cases, users might want to change the key code from
> userspace. There is existing functionality for this in the input core
> using the EVIOCSKEYCODE ioctl, which is integrated for example into udev.
> 
> Make it possible to use this functionality for tm2-touchkey by simply
> making the input core aware of the array that holds the keycodes.
> Similar code also exists in mcs_touchkey and mpr121_touchkey.
> 
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>

Applied, thank you.

-- 
Dmitry
