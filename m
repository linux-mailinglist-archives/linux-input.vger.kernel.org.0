Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C992B65CB30
	for <lists+linux-input@lfdr.de>; Wed,  4 Jan 2023 02:02:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234269AbjADBCI (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 3 Jan 2023 20:02:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234072AbjADBCH (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 3 Jan 2023 20:02:07 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1856110FFF
        for <linux-input@vger.kernel.org>; Tue,  3 Jan 2023 17:02:05 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id cf42so48268810lfb.1
        for <linux-input@vger.kernel.org>; Tue, 03 Jan 2023 17:02:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3vmkglzy7yL7XHknabyfhnIqFNAE7PW7Npd3LxsWHpg=;
        b=alAXwZ04McilC9dLV/TOeJk6M0biaK3HBgiYCKadyPvFYKe5TJjEFzPhDPS6dYLUtz
         /pptrALg64iD/CKbr+XHYlVJSYJGeE9o74Ru5i5ik0sAj9Ti0JC23ts5iCjk3YiTLq7I
         +1s0DDEaH25skH4he5akq99RRZA3hs6jb/2l4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3vmkglzy7yL7XHknabyfhnIqFNAE7PW7Npd3LxsWHpg=;
        b=soXW/KLFO4Ja3sg3t12dj+W7bXBNXFAoHtUZR/6P0erta8kf7/0ypS2hXEFe9rddnO
         BjxmpZ3jgldsn2pjPpwfPUS+CaCzP2OmmChjrlrypvMQjdIxhy5zFBV2klKvpNqmjg3L
         Po9WIkpxoAJluGHHGPUco1WR1oopyXOAd+wEo0saT8YebN2ZSmv2/2kSV6r8OKFuuxA8
         GY2V60Q2wIyiWZf+IClGLLwCy+74LmNR8DUIQcKA8yZeYzZe0WjBGlv9qFahy40GkgTy
         3CHPJW+bNuLrWHk/TTZNFfVVZvmOgf8ITyjR1Oh4CFEMqtBYKIGe2qAmugtfIdn/7uGk
         /9NQ==
X-Gm-Message-State: AFqh2kpTpo1NDParVCQMjYL/lNhb1cUntTGuq7whzaEeCbR+u1GfLypO
        ayDvxf4KDDmjLZqkCWEvDfDR8trqIwV1JKm6hU605w==
X-Google-Smtp-Source: AMrXdXtMPlRwMbMa5hc4rWMSesriWiR6G/L91zwEH3qoQK6vpZw0+8r7KOywSGAN6ZqNpWzMmDnysrJPE3F/UdYGbyw=
X-Received: by 2002:a19:c20d:0:b0:4b5:7374:90a9 with SMTP id
 l13-20020a19c20d000000b004b5737490a9mr1671889lfc.145.1672794123424; Tue, 03
 Jan 2023 17:02:03 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 4 Jan 2023 10:02:02 +0900
MIME-Version: 1.0
In-Reply-To: <20230102181842.718010-19-jic23@kernel.org>
References: <20230102181842.718010-1-jic23@kernel.org> <20230102181842.718010-19-jic23@kernel.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Wed, 4 Jan 2023 10:02:02 +0900
Message-ID: <CAE-0n51bE_jVj_o9sFi30KtY=7mO+ZhhxU_2pMnsykj5kj-K+w@mail.gmail.com>
Subject: Re: [PATCH 18/69] Input: pmic8xxx-pwrkey - switch to
 DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr()
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jonathan Cameron <jic23@kernel.org>,
        linux-input@vger.kernel.org
Cc:     Jonathan Cameron <Jonathan.Cameron@huawei.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Quoting Jonathan Cameron (2023-01-02 10:17:51)
> From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
>
> SIMPLE_DEV_PM_OPS() is deprecated as it requires explicit protection
> against unused function warnings.  The new combination of pm_sleep_ptr()
> and DEFINE_SIMPLE_DEV_PM_OPS() allows the compiler to see the functions,
> thus suppressing the warning, but still allowing the unused code to be
> removed. Thus also drop the __maybe_unused markings.
>
> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Cc: Stephen Boyd <swboyd@chromium.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
