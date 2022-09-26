Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 389785EB412
	for <lists+linux-input@lfdr.de>; Tue, 27 Sep 2022 00:02:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231400AbiIZWCw (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 26 Sep 2022 18:02:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231284AbiIZWCX (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 26 Sep 2022 18:02:23 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7ACFFE9CC4
        for <linux-input@vger.kernel.org>; Mon, 26 Sep 2022 15:02:13 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id q35-20020a17090a752600b002038d8a68fbso13893507pjk.0
        for <linux-input@vger.kernel.org>; Mon, 26 Sep 2022 15:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=qj/rlMAzv9fMg5FuS4NiEjLu9sI/usrFEsXRahlge0E=;
        b=GBEigg8BnMS+VYk23Q4ZmTb+E5BWgrOqvEWvUreJpETHfR+XdKseHhYdNc4tsltgMz
         s4v2Lr+ZvgSCioJ3z3JN8PT+akqP+R7AZyonY8FjkZO3t6QBeEGL8fOaQ1M21Ak00s8z
         u5AsvSSsGir2Pd2/F/wXJ446swZYDBiAdnTFQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=qj/rlMAzv9fMg5FuS4NiEjLu9sI/usrFEsXRahlge0E=;
        b=I85YvBwl5HdMLQ/nYEENvWmcTQVOs2iI2w1ztMM+nzJKpASsBQImJ05Skt42fF4kjL
         mbXeqnQWE+aoSJ9WgJdqEmeDl2wkEFa63clo2kaQcUskvhjb1stxNUy6DkLxGAuxpvHj
         vR9Qdyj4Yr2zlUAIBaqn117bAdYajFIGBkgb4uc39YdGNi9ka/6Uc3cnLQT35XAjCuAT
         qgSwd6IrYofbkVdkhevuFcn6ebRxK8IliWZUak5nqUQV/QrkzhvK0aTANb++pPjrxNGc
         uRpZHk5cdxrK5xVYu/d94J7kb5oVQPqzd/JJvLHvzIT8Aj+A2zg68CLSTwqj5/4jG8lc
         OK9w==
X-Gm-Message-State: ACrzQf2uqGxoltgJLtg0GgN/37YBFH4KaawOMgVuMjxPvsfA9MHh87hu
        Vpmoi2Jy9ehJrJ2/aUcaUXtB4A==
X-Google-Smtp-Source: AMsMyM70ikX80wxOPu3LibTpDGV3/8vxdXB9poqRgI/Xx03fmcB9OAAaI/KVZo8cuHBGqhMQ+MvSJw==
X-Received: by 2002:a17:90b:1d8b:b0:203:246e:4323 with SMTP id pf11-20020a17090b1d8b00b00203246e4323mr923040pjb.192.1664229732910;
        Mon, 26 Sep 2022 15:02:12 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id m10-20020a170902db0a00b00176c89243fcsm11794460plx.179.2022.09.26.15.02.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Sep 2022 15:02:12 -0700 (PDT)
Date:   Mon, 26 Sep 2022 15:02:11 -0700
From:   Kees Cook <keescook@chromium.org>
To:     "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org
Subject: Re: [PATCH][next] Input: applespi - replace zero-length array with
 DECLARE_FLEX_ARRAY() helper
Message-ID: <202209261502.60C97A49@keescook>
References: <YzIeJeqU73G+UI8g@work>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YzIeJeqU73G+UI8g@work>
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Sep 26, 2022 at 04:48:21PM -0500, Gustavo A. R. Silva wrote:
> Zero-length arrays are deprecated and we are moving towards adopting
> C99 flexible-array members, instead. So, replace zero-length arrays
> declarations in anonymous union with the new DECLARE_FLEX_ARRAY()
> helper macro.
> 
> This helper allows for flexible-array members in unions.
> 
> Link: https://github.com/KSPP/linux/issues/193
> Link: https://github.com/KSPP/linux/issues/219
> Link: https://gcc.gnu.org/onlinedocs/gcc/Zero-Length.html
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
