Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8C7B2D5215
	for <lists+linux-input@lfdr.de>; Thu, 10 Dec 2020 04:53:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731353AbgLJDwT (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 9 Dec 2020 22:52:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730914AbgLJDwN (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 9 Dec 2020 22:52:13 -0500
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E19B5C0613CF;
        Wed,  9 Dec 2020 19:51:32 -0800 (PST)
Received: by mail-pf1-x444.google.com with SMTP id 11so2777764pfu.4;
        Wed, 09 Dec 2020 19:51:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=NkZFOtXAKJllu/RE5pEn5oV7eXg/2eQV7WPjiMjVTjc=;
        b=lpVz3xy/43pZORCKo2HHtEXfLZ7rY1/SQ40xqG2oal37jmaWT9oHqbMDpVSnxltJce
         UBIGBeqfp4caj5jHGOS2IVBK6ZZJzoikVwAXiq/NBzA7TZVgr40Z+gez2uJbrRKtEfRA
         DoHslmod0hhkN0LLwjrXm3eWW5eKNqvZh14lj0wClbx4IUCxOKdjLe8OiGO45zaGcuEG
         fTxSbixKNslxH4aeL4V4bb6H4m+Ur/+o0GKszxIf6ZCdqjioAS2qcqG93BdG5Vt47V9o
         RZkHwyXPBVk12tUQqguNcJaVxutirN7Z8VqYNLJoR2u0Wf7XDX/d1ngI5XrVv+E193C5
         mdxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=NkZFOtXAKJllu/RE5pEn5oV7eXg/2eQV7WPjiMjVTjc=;
        b=HwcM9bpmOJKkXn8kjnGf2JPhHEL3QKXmoK6Qbj1yl5cx24q3wxyS7N3MnJb7QujGO6
         B66IEeY0ACkiB76S3wacwLPOhnA8hRG8HYbDV/fOaFs0V9nSKqHv8IebNR72lUEeHG0c
         PDU4OlY8tCl/m8vObKhaMvh4g3UU5DSRL0TiQ7wC92wZqNBR8PNLQvE4N7EGfrBU0Ldq
         lOjP5gHdHRAV2HoVrsFVhKsuJMZyXlzVus33tijzYt0Huto/H78AfObBdnkSPE/bGV8L
         lF9tZpNAwecBjAhYtfEakebz8EkkhWrXc8LXVUfQfXM7Iek+4Jy9idv9ECKFer9QEnFW
         szhw==
X-Gm-Message-State: AOAM530k+t0lIoMV+eHXO1JsIT8Y5Yk9C81Zpmf1EyWxtmmNeYqhl2aB
        BYqfDYKNGsJdQ6v/bzAv8iF1cLuvTlQ=
X-Google-Smtp-Source: ABdhPJzGhG7XUZUoytZAW6Y/H2vZ2o13pa8CYU5Cq3XOMYl+yrFVItzO1FQoR8Y1n85sQZ9RIkJ93w==
X-Received: by 2002:a17:90b:4b11:: with SMTP id lx17mr5396522pjb.154.1607572292528;
        Wed, 09 Dec 2020 19:51:32 -0800 (PST)
Received: from google.com ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id a22sm4226917pfa.215.2020.12.09.19.51.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Dec 2020 19:51:31 -0800 (PST)
Date:   Wed, 9 Dec 2020 19:51:29 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     linux-input@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 3/3] Input: tm2-touchkey - add vddio regulator
Message-ID: <X9GbQSrxQHQA3k9s@google.com>
References: <20201203131242.44397-1-stephan@gerhold.net>
 <20201203131242.44397-3-stephan@gerhold.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201203131242.44397-3-stephan@gerhold.net>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Dec 03, 2020 at 02:12:42PM +0100, Stephan Gerhold wrote:
> The Samsung touchkey controllers are often used with external pull-up
> for the interrupt line and the I2C lines, so we might need to enable
> a regulator to bring the lines into usable state. Otherwise, this might
> cause spurious interrupts and reading from I2C will fail.
> 
> Implement support for a "vddio-supply" that is enabled by the
> tm2-touchkey driver so that the regulator gets enabled when needed.
> 
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>

Applied, thank you.

-- 
Dmitry
