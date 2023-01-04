Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4D0D865CB2F
	for <lists+linux-input@lfdr.de>; Wed,  4 Jan 2023 02:01:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230247AbjADBB4 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 3 Jan 2023 20:01:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238473AbjADBBv (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 3 Jan 2023 20:01:51 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29460246
        for <linux-input@vger.kernel.org>; Tue,  3 Jan 2023 17:01:50 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id m6so37908958lfj.11
        for <linux-input@vger.kernel.org>; Tue, 03 Jan 2023 17:01:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KGe4YvKZZ4ZxsVmVvi0qKn2W4LH/Ni+k5ddo/BPd/1o=;
        b=Vddyj073klqVZrHwI8AStlpKO+/Go4Szp77C9MKJfTaSwlmj+6fFdicrVKqxF7O0Sz
         vW/LZYS1vQA258t3Eya2N3P7VP+fYOT1eJUazoC5qVD+yIg1uDkdAxx/aTmD1tni42NW
         iQ3t8GZpevTDxBg4CB3ITsru2SC5U3chOVe0k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KGe4YvKZZ4ZxsVmVvi0qKn2W4LH/Ni+k5ddo/BPd/1o=;
        b=GQVF8eDIF/MQxxT8UWAZdCgelyx29Lq7b3VrJ5+N7mH8Qf1DWrKJtUQOXf4O91o591
         BPBa8C5KJgAM9kCSRbP7wWbM7XPU8nd9/IMkw/nedZNjt0qhb78vKl3u4ENIWqvQfyqG
         QJmWLT8kSGQY2GwClPWQj3ioPs+7Y5SFfZVa05sI/7t+ByOCwRakT3SPLhs0fLOCylf6
         FLca9CfWYM6aVtAsOPYN6+0EoKGRB2rmdp4zIH/PmvCgDXgmPEwfBA4xRbkgqf48+EXs
         1Sv/hro1kLwa1duKZTsRH8uk4fGkFcTfInXlCSVyKNNXFv5dz0JNGFDgbkw26kUM+3ar
         V/6Q==
X-Gm-Message-State: AFqh2kqNp1oc+nIi3Dr1FQivr5EhAg6+eMf1Cfiv1pxzBLux6bnGHaSG
        4efLtYanH7lcXnvi/JbfUaqiP++9v5R8xhXo1D0CWQ==
X-Google-Smtp-Source: AMrXdXuWRY2niy6149wSZ+S1IUdQVU4xhwpHmBl/RU41mwyZgIO7H5E8zB9meloVteu9KgrM/pF/VCQsqScjrbwNxj8=
X-Received: by 2002:a05:6512:34d3:b0:4cb:c78:1895 with SMTP id
 w19-20020a05651234d300b004cb0c781895mr1111534lfr.83.1672794108504; Tue, 03
 Jan 2023 17:01:48 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 4 Jan 2023 10:01:47 +0900
MIME-Version: 1.0
In-Reply-To: <20230102181842.718010-17-jic23@kernel.org>
References: <20230102181842.718010-1-jic23@kernel.org> <20230102181842.718010-17-jic23@kernel.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Wed, 4 Jan 2023 10:01:47 +0900
Message-ID: <CAE-0n52+LGhO2nv-s4Q1+STVxN6S5V9rJJuHDJhBH3kyqhY0EA@mail.gmail.com>
Subject: Re: [PATCH 16/69] Input: pm8941-pwrkey - switch to
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

Quoting Jonathan Cameron (2023-01-02 10:17:49)
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
