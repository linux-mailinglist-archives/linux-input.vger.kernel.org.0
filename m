Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46D8A343599
	for <lists+linux-input@lfdr.de>; Mon, 22 Mar 2021 00:03:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229955AbhCUXCm (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 21 Mar 2021 19:02:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230385AbhCUXCh (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 21 Mar 2021 19:02:37 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 385D6C061574;
        Sun, 21 Mar 2021 16:02:37 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id w8so7390899pjf.4;
        Sun, 21 Mar 2021 16:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Wt8++bptJVOSz9C4Ne0h46n+NrRwxPXNADEhwT2DHoo=;
        b=TFKXIk2+tSJx++PVmBpOGjSpR7wp2qTThVKHo4eS9zTruWODhroxXMFkvQylQzyyZU
         OglnC3FYJdAsyzYmUys8znayx9uXsQkXDjBTwkI3g580QB/JMicZHcXCjNZb/wwwDgx3
         ooe0w3ZD+476WslLWH6v0Q1fyihlc00xhnY6hiKBpYZgGSi8pA3UlKDdoq63SFacJC9s
         pW8P9UFHnjhOrgmFq36fZhm+m5HqE7a9cebvthUatzOLuTM2fv4vW7bNaGLkG9sC966f
         aVFx1/DnkWxIufEzRByigSqCtv+/VBc0jZlbrflSHvHxMCUv/BZsJxN26OfRzhbODHdb
         so3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Wt8++bptJVOSz9C4Ne0h46n+NrRwxPXNADEhwT2DHoo=;
        b=ebcFjfExe4eOI1VV5b4KByWxfETOyAcpoCFjGt30E4u6xTGu/mLuuc/zShtTs1YG+q
         0IN6h4ulIl4aCNZXV4I/bPEeLX/+HhGBBSSt2YE4iTkBvtWNabZPhZn7qWF3ypJ8+947
         Pb+S61/X4Wh4F+CMjHa3d90BmWyLBa8QchO2LaU/TrM1q5h40pxAXggDSgbA6rYEN5HH
         uZahxNV9ALn/KCjxTbNj0uPm+IgQh9P2eR2IUGIwwkf6fCLA8XLMYUvRA5T4DEO9ULs8
         tvgyJxg6AddHpmlXMjyjU7/LtIz8oOEtFN7lMcJgNix3eR45hWVI+2yEFgPvJcEnBVtY
         XrDg==
X-Gm-Message-State: AOAM530v7iNIE9Zu9VPlda65ys+5mbnRXKwxjY6SW4JshHNvvPOauudn
        ODu/7vaYrUwaekWtRxB9DHQ=
X-Google-Smtp-Source: ABdhPJxQg/IKszDWYZntvg6N1nogTA5ms5twvxpUYaHVofX/vuKnB7Jv1btt0i+qO6679jYQicKLhw==
X-Received: by 2002:a17:90b:794:: with SMTP id l20mr9944216pjz.207.1616367756731;
        Sun, 21 Mar 2021 16:02:36 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:85c2:9df1:533a:87e9])
        by smtp.gmail.com with ESMTPSA id i1sm11691234pfo.160.2021.03.21.16.02.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Mar 2021 16:02:35 -0700 (PDT)
Date:   Sun, 21 Mar 2021 16:02:33 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: docs - Update according to the latest API changes
Message-ID: <YFfQiccnYv3VMJOn@google.com>
References: <20210304090948.27014-1-heikki.krogerus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210304090948.27014-1-heikki.krogerus@linux.intel.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Mar 04, 2021 at 12:09:48PM +0300, Heikki Krogerus wrote:
> The old device property API is about to be removed, so
> explaing how to use complete software nodes instead.
> 
> Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

Applied, thank you.

-- 
Dmitry
