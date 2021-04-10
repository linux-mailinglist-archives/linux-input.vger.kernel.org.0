Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2071135AB54
	for <lists+linux-input@lfdr.de>; Sat, 10 Apr 2021 08:28:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234351AbhDJG3F (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 10 Apr 2021 02:29:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231933AbhDJG3D (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 10 Apr 2021 02:29:03 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95645C061762;
        Fri,  9 Apr 2021 23:28:49 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id mj7-20020a17090b3687b029014d162a65b6so6043568pjb.2;
        Fri, 09 Apr 2021 23:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=loC0B4YD8IW3+UrJDzkmpmiX6G452jTJ5CL5SMmmaxg=;
        b=oAJYpMTbReDKIAwFCQVa91fc+lkmNt4rde5Bq1N0vfzQZEpsw6vk5OsCTq118dc4sn
         T/5abUeSstgASSD7ag8xK17vQKLHJVugHBhV4pkahQD3jXe+HnQM7v21Ru9H43vx1SbC
         JGGvdaU/tAHlQh7SC6hcugodbG9/cLToO/jYR9cn800nB6DV12p0RhFAkzHXy2lSS3L0
         XM9AxteAAH475z44I90Rws0t2KQ5l5rCm9c+QgrIrod8nkpZafED+w55dbfTQqarNr0S
         BivB3ag1DhPBTca7C32DWajM4g8KIyadw7SNVMAs+x4OfGmuskto8ft21xH2nWZ/xulQ
         N/Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=loC0B4YD8IW3+UrJDzkmpmiX6G452jTJ5CL5SMmmaxg=;
        b=TpN0CeDbva5r0UdM0uUxGRXJEZIpilzZ2ibpcomQGQqdqCEwbe5hih1zlVT0kgz2ha
         S1Wku68pB1g1kEG9ao7AJMvpvP6lCIRUbB2H8UcWCqn/+WkyYDT0bEx6Qax/NuwqaJfg
         Xb9S/13BV9Beq8N02frABmk8O5KtDtU9lRj/V30hni4i5RV/xw6gk64XDFZFMTkDN3VT
         x4GVaSlT1k7IF175ZwsGSwZ7DIOXO57Uvc/HzaLSx33awU90SeK8ALbug3p91d9dvTrU
         Fb+qJe5t1QMZ+yvohxsNT4k/Cvq946IDn8uLVYUZhJjw9s1B+JhHg8bA4sdlrh3PGult
         rX+w==
X-Gm-Message-State: AOAM530AgRFLSJrGA71ZO9z/JCjWLYTuiX+QObK3A6BCdGAZrNpR10Qd
        Hsf0OmXWxESpKfVq+vDpfCW3Qtspqc8=
X-Google-Smtp-Source: ABdhPJyYuI/YdXpa5mshiB78m340fekMdLnTSp0ub+toykg1N2a7CMG/M/YbZ9+QbNcWND+65U9PSQ==
X-Received: by 2002:a17:902:6907:b029:ea:d1e8:b80b with SMTP id j7-20020a1709026907b02900ead1e8b80bmr20088plk.41.1618036128994;
        Fri, 09 Apr 2021 23:28:48 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:c9de:23b9:54df:4a55])
        by smtp.gmail.com with ESMTPSA id s8sm3885152pjg.29.2021.04.09.23.28.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Apr 2021 23:28:47 -0700 (PDT)
Date:   Fri, 9 Apr 2021 23:28:45 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: apbps2 - remove useless variable
Message-ID: <YHFFnSGtzmRz1Lv9@google.com>
References: <1617958859-64707-1-git-send-email-jiapeng.chong@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1617958859-64707-1-git-send-email-jiapeng.chong@linux.alibaba.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Apr 09, 2021 at 05:00:59PM +0800, Jiapeng Chong wrote:
> Fix the following gcc warning:
> 
> drivers/input/serio/apbps2.c:106:16: warning: variable ‘tmp’ set but not
> used [-Wunused-but-set-variable].
> 
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>

Applied, thank you.

-- 
Dmitry
