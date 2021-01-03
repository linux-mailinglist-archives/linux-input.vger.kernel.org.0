Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A90F22E8EB9
	for <lists+linux-input@lfdr.de>; Sun,  3 Jan 2021 23:54:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727706AbhACWyB (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 3 Jan 2021 17:54:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726019AbhACWyA (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 3 Jan 2021 17:54:00 -0500
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86849C061573;
        Sun,  3 Jan 2021 14:53:20 -0800 (PST)
Received: by mail-pf1-x431.google.com with SMTP id 11so15209337pfu.4;
        Sun, 03 Jan 2021 14:53:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ymeEgVIsGAnwle6DLFWvtFFHTPVZNvHeXxoZmrm44x8=;
        b=rcEJCe81EbFlYaSiglWQSLNHt2LlNVF1mwt9660PB9wFBsVCxZq0MCbeEoxmKQWthL
         +FqYZXrsSmxwWZpmx84qaZIMXHFNU3iMH6yLrwdgUSI8mc68JWv2kg0Pwl1MZgm10RyK
         DmXjbj25zBsEylofPfSNGVqLOcGKJJsFD437ndyu9yLtzNCw8dP1XlteNwpEgCOIU+n4
         JtOENE8iAfnMree8utP/Re2+lfvxf233PggsZ8ZUg93kM4swrE+aovacswbI+E96k3MQ
         pn+h1SWYTE2H0r1Q5uaZf7yfRSmOYwl++XE63iEnXxhU6En3WhiI+LIKR0AvOL2T8gQj
         2nhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ymeEgVIsGAnwle6DLFWvtFFHTPVZNvHeXxoZmrm44x8=;
        b=HbrxDo72XXmAzhN4v+Pez6fUM9ZKkOQrqwd74OgV6x2FIDj7wROa8E/ftq8nxzMI/6
         xIM8mMmNK63yAi9zeGidPSI0RDdi6h1iYEQ0w9iA/XRE6YYLI6x4L/wCisdIz7TFb8QY
         QrXEYOWjVapDTPW/cLUMix1o8v6cVPBr7siYU/pNbKqL5la6768dPDrW+II/0xYH7jSi
         FUVHvzSoHyaF0ZXSiYAlJ3HsYwRu75XR0FZ4QwI0tZARmlbfarRyyefB7COUFIZbt1ZX
         d7mMim9uVManQ0d1UXgVF0WhrkIqgpnhE+NkY206jzEuqKXBhMpQYdrhTQA38VwRU1qw
         sP+w==
X-Gm-Message-State: AOAM531xJhwL8/qm4bKLb1mwS2Mm+4ZAMGzOXt+B6nAb35cA5c7vQtO7
        RuFsFqqX+sayPG7AfUFjpn8=
X-Google-Smtp-Source: ABdhPJx8CST0aV44lPiSNPVt+WY38H5JA3mMSjebNOdFPApwYTF7Dr4ro2GJhjDBYYoka5c+hV1dnA==
X-Received: by 2002:a63:cf06:: with SMTP id j6mr26997123pgg.195.1609714400056;
        Sun, 03 Jan 2021 14:53:20 -0800 (PST)
Received: from google.com ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id z10sm54689877pfr.204.2021.01.03.14.53.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Jan 2021 14:53:19 -0800 (PST)
Date:   Sun, 3 Jan 2021 14:53:17 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Samuel Holland <samuel@sholland.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sunxi@googlegroups.com, Ondrej Jirman <megous@megous.com>
Subject: Re: [PATCH] input: sun4i-lradc-keys -  Add wakup support
Message-ID: <X/JK3ffFV3s5BigQ@google.com>
References: <20210103105446.33923-1-samuel@sholland.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210103105446.33923-1-samuel@sholland.org>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Samuel,

On Sun, Jan 03, 2021 at 04:54:46AM -0600, Samuel Holland wrote:
> From: Ondrej Jirman <megous@megous.com>
> 
> Allow the driver to wake up the system on key press. Since using the
> LRADC as a wakeup source requires keeping on an additional power domain,
> disable the wakeup source by default.

Why isn't this controlled via DT property? wakeup-source?

Thanks.

-- 
Dmitry
