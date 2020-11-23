Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B34D2BFFDA
	for <lists+linux-input@lfdr.de>; Mon, 23 Nov 2020 07:19:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727989AbgKWGP6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 23 Nov 2020 01:15:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725275AbgKWGP6 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 23 Nov 2020 01:15:58 -0500
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 764DAC0613CF;
        Sun, 22 Nov 2020 22:15:58 -0800 (PST)
Received: by mail-pf1-x443.google.com with SMTP id c66so13942027pfa.4;
        Sun, 22 Nov 2020 22:15:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=UFIIpfjjkPR20mDGHiuOo88/6f0kLs/K3QWcbqNsuJo=;
        b=KfnRNmepoyr9R1xv7PwItdu5GfRjOIjEFIhBVR0CVILQzh9l4Qzc9v9fp+xgK1ThyU
         GZplPhSy56htkfkOWx6VvwslOgSkDq5yDgN/Z4yUUwKjdlCKeyvRE++fyvgXNdTvr9ct
         xuweHQKJtRMlqGLvV66xr+FvkD379KHXdIJiWPWa3Wr0FnH3F5iEcp2Sl/j8cNUKewH/
         D6IJ9o/Q/imzXalMarRv8IhJBaerbs6vcbtJP8l0b4GQub0nizi8p7zOtAcI6UJ0+3e8
         pb3A3CYC+AJsE/FTHzYYhmJSJ3jqtwZTV3nHgjJJdg8FeT26kZT0EaovG0kG/+1oj9H8
         wJXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=UFIIpfjjkPR20mDGHiuOo88/6f0kLs/K3QWcbqNsuJo=;
        b=HWCaIxBkHVT5BZ0sP6427BavIUnqhkJx1nNv2YXJZD5FjE/i/eL1nnHeL3Q0W5LKNJ
         F9/ZlAWDqnNvI9I+C2DQGzgJhLCjYlyvugHDSI+/WWn7ZEmeDUbi0DEr/yJN5uvc7KzN
         dJX273xl5tt2Fr19PnGmyr9/fWmo8hvk6ryu46UOkV28IuiooAO1QEVkUBjoP28O2z7j
         fU6omRN8KM2IfrslEHUd/hX7Giunf6FPY7odu5lL92GgVcEoRQ6QJE+KaKPC9GVCQ7KE
         Akm5pmkzRbZwkyH1UU2ipcLeMMD28Gk//bQnu6SaYhWsirCG0RE4Hl3v3zrztAKPYR8B
         d4lg==
X-Gm-Message-State: AOAM531V8aIqFEP84pIZXGBuRcQyUmCQEU0oVBEI67+IqHarj852OTrE
        zeVrt557eqxP3jKLdUiOjD4=
X-Google-Smtp-Source: ABdhPJxbUo6zrXUfMLNgV8CJFu40xfTXCSyMcZn2vUhjsmjyzdv+AbgHU/AcDsdmozr/P72z3eyfnw==
X-Received: by 2002:a62:3047:0:b029:197:6ca1:24de with SMTP id w68-20020a6230470000b02901976ca124demr22998117pfw.8.1606112158018;
        Sun, 22 Nov 2020 22:15:58 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id s21sm9245517pgk.52.2020.11.22.22.15.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2020 22:15:57 -0800 (PST)
Date:   Sun, 22 Nov 2020 22:15:55 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org
Subject: Re: [PATCH 037/141] Input: pcspkr - Fix fall-through warnings for
 Clang
Message-ID: <20201123061555.GW2034289@dtor-ws>
References: <cover.1605896059.git.gustavoars@kernel.org>
 <4b659e3e65f2fa3c8bb7ed153e2016c3fb395bbc.1605896059.git.gustavoars@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4b659e3e65f2fa3c8bb7ed153e2016c3fb395bbc.1605896059.git.gustavoars@kernel.org>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Nov 20, 2020 at 12:30:02PM -0600, Gustavo A. R. Silva wrote:
> In preparation to enable -Wimplicit-fallthrough for Clang, fix a warning
> by explicitly adding a break statement instead of just letting the code
> fall through to the next case.
> 
> Link: https://github.com/KSPP/linux/issues/115
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Applied, thank you.

-- 
Dmitry
