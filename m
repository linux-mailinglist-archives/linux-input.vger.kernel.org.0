Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C1524342B7
	for <lists+linux-input@lfdr.de>; Wed, 20 Oct 2021 03:05:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229677AbhJTBH3 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 19 Oct 2021 21:07:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229627AbhJTBH3 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 19 Oct 2021 21:07:29 -0400
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F4C6C06161C;
        Tue, 19 Oct 2021 18:05:14 -0700 (PDT)
Received: by mail-pg1-x534.google.com with SMTP id f5so20976157pgc.12;
        Tue, 19 Oct 2021 18:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=T81hkJHhMz+wkKewVUF+HeXT4ns0Z4dC13ZWJZywvbU=;
        b=ZD0YktpHFjFId5w8jHqtQ0sz2z4dDqByCQMxLQVGLWVM8XYlbvOHJFj5qDGi83Cggx
         zi/xfZQfN6SK+UsO/4ugJBbpwKtK1ygn0Hb4HL/h064v3sq10Yo/LoHTp5Cmww4PjY4O
         1xXlQhIlwfgwllurZCKi4jb6eAKVFqW2Bjahy/fpbj46bOQEz6ookhjw3WoDrFPyVGnW
         G4Sp5e3VX7lIeADeT7grhxYRq0SMH7vZ6BbWUJXx6L+hv8MWmchhY7WPYvYYgk2cNcDt
         QUkC4I74vomVP8erKkNnmaEsShgNZ3w3h3eJ1RKhQm+l1kmCGdHj2A7azgaYXfu2aW9X
         TK1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=T81hkJHhMz+wkKewVUF+HeXT4ns0Z4dC13ZWJZywvbU=;
        b=vfq2M9beWZh6xtliDSBIDa84qoLWbmrBAG4+pxU+wBTwCc0BdtUxA3S62VikA4wUOu
         oaKeD0UqCASWYKGbABReLVge66awOdDxKcK1Bx+EYZ+gNYhxLM2y52pvlNUohIYBxHiB
         l7TgJu1AVuDo0KnU9IJcy544n0jyWDBTGQip7TGovjdc4cNAgkofR04RmCedizD6Nd45
         mqIddDL6Q/AWaG06/L6EufnBIRnB4KqYhu2rHwXiobUFWZ7mWitdFftcHnmDXqUpat/Z
         8JXdCs8wWiiqVCSkW4IXsgsqZ96/RCaijMMs3ypJePCfc7XQgA0cKKvh8bxH/Z9Yf8ch
         KTOg==
X-Gm-Message-State: AOAM531xsGtqgn3AsdVHj7LsLQx27dE3E8sKTdIlVBRqpdGUDKhG/OUe
        6vWXUnM/QvZFShJGGZ7neQI=
X-Google-Smtp-Source: ABdhPJxINtd7V8rptDFtp3UDLR4rLljFNVYHyR5eb0ZxMq4SEUO9+dhWeWInjlQrF2GWP8/HiArDFA==
X-Received: by 2002:a63:7e05:: with SMTP id z5mr31372321pgc.354.1634691913570;
        Tue, 19 Oct 2021 18:05:13 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:4814:8c29:ba96:983d])
        by smtp.gmail.com with ESMTPSA id z126sm384062pgz.55.2021.10.19.18.05.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 18:05:12 -0700 (PDT)
Date:   Tue, 19 Oct 2021 18:05:09 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Alistair Francis <alistair23@gmail.com>
Cc:     Ping Cheng <pinglinux@gmail.com>,
        Alistair Francis <alistair@alistair23.me>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        dl-linux-imx <linux-imx@nxp.com>, Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input <linux-input@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v11 1/4] HID: wacom_sys: Add support for flipping the
 data values
Message-ID: <YW9rRUsxPHTjeOGT@google.com>
References: <20211009114313.17967-1-alistair@alistair23.me>
 <CAF8JNh+OUzvAHA9tBrH2d_WxWPXRgiunhGO5KV4-fqVG+tUOyQ@mail.gmail.com>
 <YW4kgnI0DQHj4sw4@google.com>
 <CAKmqyKMrb=Uz0+-ycj0HkAKJYdRU11Dc+24+KJw_j3MHT=2+yw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKmqyKMrb=Uz0+-ycj0HkAKJYdRU11Dc+24+KJw_j3MHT=2+yw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Oct 20, 2021 at 09:33:13AM +1000, Alistair Francis wrote:
> On Tue, Oct 19, 2021 at 11:51 AM Dmitry Torokhov
> <dmitry.torokhov@gmail.com> wrote:
> >
> > We already have touchscreen-inverted-x/y defined in
> > Documentation/devicetree/bindings/input/touchscreen/touchscreen.yaml,
> > why are they not sufficient?
> 
> The touchscreen-* properties aren't applied to HID devices though, at
> least not that I can tell.

No, they are not currently, but that does not mean we need to establish
a new set of properties (property names) for HID case.

Thanks.

-- 
Dmitry
