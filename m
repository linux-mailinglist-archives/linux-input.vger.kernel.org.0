Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BED429AE22
	for <lists+linux-input@lfdr.de>; Fri, 23 Aug 2019 13:30:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387644AbfHWLaf (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 23 Aug 2019 07:30:35 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:40456 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731920AbfHWLaf (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 23 Aug 2019 07:30:35 -0400
Received: by mail-lj1-f194.google.com with SMTP id e27so8524434ljb.7
        for <linux-input@vger.kernel.org>; Fri, 23 Aug 2019 04:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=n2oV8aGDXYBwpeOJu/TypOz+stiC6mNN3ycHZh0Kn0k=;
        b=eW4Vjfs3G9Tl4+b2j5T/iW0ED0EL+cu1RMWikv/U/CgTyOolReXxhuMXyaKhMGBXH9
         KkjkDBa4hVRQniQ69vyo8TTeyumnnfMMz2RWpEh3ocPZbVWqeOfgGO8hcJLgH439I107
         BGQsFewbpEG5mQrSRAaI2k0wc+tgwTqt7rEt7qznzVrydthf2B3ScLfk3ZWtlbpB9pRL
         BK171HTvSJ0YJ9fUM6V7cLoMnnnGInx2UyNGIPRzwvtkIctbzy1CUqC0k07SH2fMDOFn
         2/MnFOVIaL4NTGSe/HEww5SucXvT6aqLIYLxuBvrrAOwDDFHpMBMCsJEJ4kmKb11krue
         6hnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=n2oV8aGDXYBwpeOJu/TypOz+stiC6mNN3ycHZh0Kn0k=;
        b=j+mjVLtfGd4P7PJ5F+Gu1BCNf+zFRaSO0k1STqP+LsbllmBFZgSOreho4GVmM2joCv
         cEsGpJEXcxV8E9J+vls+UsLvpunIh0OFUNypZZ28rUfyk6csBRD1b26gdokM2hk39zB/
         P+rg1iYN30wO/QdElw6F3m+T5GwFmuoncVgq0c1Yuwjedhg6mngU5IMembhSflbKgnzk
         0JgFc+u+4gGbeEcPKsdigZkBOG48uqRyv/S8VGndyZbib9TRxI96IjbLWrGlyX2Yq1JS
         m9vn6PQaQM3MMWXwDkB0Qwyf3GBq9QIQrDwRmF7Q79QXKSGnq8yZjOjCCBkJke/YG95J
         JfDg==
X-Gm-Message-State: APjAAAU9AwEmML69uQ7fPg89PQrOOJvTx3aD7RjGZPzMuGTH1AXSOqNV
        GkRU683AxR9F8CUMafagUt55kmGcEgs+n5VxT1FjAg==
X-Google-Smtp-Source: APXvYqzUv9Xg7GpAEDApY8oyIhZ29QEVEkbDkSwK6WO75eejvqh0J9DhqDObUV6G0QvS5flaO2CPV3gVKZ+4ivB1vjk=
X-Received: by 2002:a2e:80da:: with SMTP id r26mr2545097ljg.62.1566559833448;
 Fri, 23 Aug 2019 04:30:33 -0700 (PDT)
MIME-Version: 1.0
References: <20190810002039.95876-1-dmitry.torokhov@gmail.com>
 <CACRpkdZo9so+5UoT3QpFmL_8NZT1d1i7Yab202RNn8gDfnPK7A@mail.gmail.com> <20190821174257.GC76194@dtor-ws>
In-Reply-To: <20190821174257.GC76194@dtor-ws>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 23 Aug 2019 13:30:22 +0200
Message-ID: <CACRpkdaTK0pybDM6So-E=weE_+uz8TSr=38YNzNQdqjZvnnYXw@mail.gmail.com>
Subject: Re: [PATCH 00/11] Face lift for bu21013_ts driver
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Linux Input <linux-input@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Aug 21, 2019 at 7:43 PM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:

> The issue is this:
>
> static void bu21013_disable_chip(void *_ts)
> {
>         struct bu21013_ts *ts = ts;
>
> which shuts up gcc about the fact that 'ts' is uninitialized, it should
> have said "ts = _ts". I guess it is a lesson for me to not call the voi
> d pointer argument almost the same name as the structure, as it is easy
> to miss in the review. The compiler would not care in either case, but a
> human might have noticed.
>
> Can you please try making this change (and the same in power off
> handler)?

Yes this works! :)

Tested-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
