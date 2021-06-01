Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 874623970D1
	for <lists+linux-input@lfdr.de>; Tue,  1 Jun 2021 12:01:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231792AbhFAKDC (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 1 Jun 2021 06:03:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231295AbhFAKDC (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 1 Jun 2021 06:03:02 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB8DEC061574
        for <linux-input@vger.kernel.org>; Tue,  1 Jun 2021 03:01:19 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id x38so20845201lfa.10
        for <linux-input@vger.kernel.org>; Tue, 01 Jun 2021 03:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0LPdqfY5UxuP13pdo5l5+tdJaciBMttPQRiDpCqSbw4=;
        b=bFcRMfW3cF5FE2a+4yPnwXF6OT/PRyUu4T/SkZk9LOmkLM068sxIUx8/7W75UuVJSe
         XgXDBngCYhzfC/z6NyjyR09FaQeresjuA4J+yvKL2z2blQeoF+Kq+ojB5aL4FmEn6t+I
         wpPqSsP66owyPitk9W8c58DVAkaH8gO0aPNfuHVXTO//gIHKVwV2mZ1t3MkAYWZI4/xH
         BOoH9Kz2iUumwwDCYixQ+WqMvOm9HUr0+wouNnTDKxtBwoXe5k0ufToY2tJbGnoDlLuf
         DX+VVXzvvRGk93eSRVfNR+HtYGXDR21IC4PyCtpscmRURVlHBkLPqb4bsAgiMu+qlR2y
         83nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0LPdqfY5UxuP13pdo5l5+tdJaciBMttPQRiDpCqSbw4=;
        b=Wt38o1FSPZfGeL45m9hxgrEkFr/yQNckQcHyMj9ow/OxmQLu0o6F2cMdF9Qqh31jZb
         00ERkO2zyZH0WWOxyc8zxYojiVxC8ns2wX67AZGRev5rpWuFOwODFQQHUHu7IOC09cFK
         JW8oRISkQJ+/PtsQFgb8zpIBudBEOAcUuwaHwJjkFhG2NaJYhW2TsWbgIlNtuBixHsoU
         ZDRdR3VHZaphE5SqaUJVLPTRhnagMQ4lMy4C2I3ACWJnDiSSWVIVEUPfETPB6WZ1ZI1v
         O6VwJDe63kK/2NSd9V2mwwtSH1LozqqiIKSiFj3QeDHEXneq/9dZb+4P2WgAZ0lw+/Y/
         ymjw==
X-Gm-Message-State: AOAM533iz08POeBNSvCp7KGCyxAKhPLI04pqnXVL5PC3Pp1gqUyGFRTX
        L6/0G7L4swDk9bO7pmtB9BUtn+jY9rSOBKhDtplWvw==
X-Google-Smtp-Source: ABdhPJxsC8nHM+jX2D1eZH8XWwfaR5Ia3VXOP7gAJ5fk2uc5czbdzEdIviZycaZeITkoEkT36xqkK8X1uE3aA3PwiY8=
X-Received: by 2002:a19:c753:: with SMTP id x80mr3622886lff.586.1622541677992;
 Tue, 01 Jun 2021 03:01:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210531052307.1433979-1-dmitry.torokhov@gmail.com>
In-Reply-To: <20210531052307.1433979-1-dmitry.torokhov@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 1 Jun 2021 12:01:07 +0200
Message-ID: <CACRpkdaq5gd3cAfR8oUHRzUkGHcN4wqQjURs0y_7omJUhY7Riw@mail.gmail.com>
Subject: Re: [PATCH 1/2] Input: cyttsp - change maintainer
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Linux Input <linux-input@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, May 31, 2021 at 7:23 AM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:

> Ferruh's email has been bouncing for quite some time ans Linus has agreed
> to look over the driver.
>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
