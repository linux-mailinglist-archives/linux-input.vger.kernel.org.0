Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED3032D70AF
	for <lists+linux-input@lfdr.de>; Fri, 11 Dec 2020 08:13:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436741AbgLKHMu (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 11 Dec 2020 02:12:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2436733AbgLKHMf (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 11 Dec 2020 02:12:35 -0500
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94C5CC0613D6;
        Thu, 10 Dec 2020 23:11:55 -0800 (PST)
Received: by mail-pj1-x1044.google.com with SMTP id f14so1755597pju.4;
        Thu, 10 Dec 2020 23:11:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=efLbYUeekGKex6uq04Br8z1ZKcX96OKU455zVROIQk8=;
        b=Gd6W0AFQXx21+YqhwUPjyzDs97zajJeOLfAwl7SgLkVHB8EjI0gwn2+wle3JG/dV2U
         xSoKNMXem2pK1ZQP8miHDtlrDpQwA6z9e7n8Mrj6LquV7NONcHLGRnvGmWiF5HV2OCm+
         qeXrQrjkd7GNS2McTDr+l/hwYGrMHCbAl8NcIrKRdUoVXnN4qDeN5SMzFpFP4QAwZc55
         3+2yJKzmLxerMtJ8FmSdNZmKqjuKC3aD1CZSjemXJtbyobcY45go6EHaNy4Iuw3XZd7S
         V5j9BUSe2nYh8T0oF5gAnUwvlg/1WIrkcdH1zv+lGRRuA75YrUD0ZdDexjR9YSm6T+iC
         OZcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=efLbYUeekGKex6uq04Br8z1ZKcX96OKU455zVROIQk8=;
        b=S9xKerQG7EnBTRpzGqe4N9M8esYqyNfq7nX4m48rRYKf1CyyVIZnVnt7fqBftSJslb
         w0UONgY6XKGg5CCNT4pai//a34vgS4d8Bf/tNhPT3rB+xmMNTsLCjbAWgwflN2TFS6jx
         Z+87G2kaRSO//iNry6ARDOha7hKW8romK1HnfHmaMAFGhIHBvj2mXDBN0CtVJX4SLpP5
         +6xqP+6pDKQ8Wt5cYufryPWW8G/91bnC1iHr9tqcIu7cz5FXrdDakfnJj3RaGe8ofIIP
         sRQiCls57VNTqM7WCj3om3VcyyjpnC4OCq2srpUBjqfXCGo6wjWeVxhGjrV5F+t+sqwp
         0p3g==
X-Gm-Message-State: AOAM533hTr1yhy2kGj0ZEOcasW2MX7/xYdmol3auCLdjU+DctpBsWZH/
        yb/XXxwv8YzQoH7t/Hm+KZq/t6TT7T4=
X-Google-Smtp-Source: ABdhPJxubw74bxkf5NglFwgXDGmn6ERWmEza5R8PSLLCE9wRuzmku/7pmYGFawC5AHX0hXgen47uCA==
X-Received: by 2002:a17:90b:3741:: with SMTP id ne1mr11836053pjb.119.1607670715196;
        Thu, 10 Dec 2020 23:11:55 -0800 (PST)
Received: from google.com ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id y21sm9576271pfr.90.2020.12.10.23.11.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Dec 2020 23:11:54 -0800 (PST)
Date:   Thu, 10 Dec 2020 23:11:52 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Cc:     Dmitry Osipenko <digetx@gmail.com>,
        Johnny Chuang <johnny.chuang.emc@gmail.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND v8 1/4] input: elants: document some registers and
 values
Message-ID: <X9MbuB3pvwJCJwQu@google.com>
References: <cover.1607669375.git.mirq-linux@rere.qmqm.pl>
 <728fff020bc92be10d84cc2a7ea8af6fd99af96c.1607669375.git.mirq-linux@rere.qmqm.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <728fff020bc92be10d84cc2a7ea8af6fd99af96c.1607669375.git.mirq-linux@rere.qmqm.pl>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Dec 11, 2020 at 07:53:56AM +0100, Michał Mirosław wrote:
> Add information found in downstream kernels, to make the code less
> magic.
> 
> Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
> Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
> Tested-by: Dmitry Osipenko <digetx@gmail.com>

Applied, thank you.

-- 
Dmitry
