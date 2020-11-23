Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 228342C005D
	for <lists+linux-input@lfdr.de>; Mon, 23 Nov 2020 07:57:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728046AbgKWG4U (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 23 Nov 2020 01:56:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728042AbgKWG4T (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 23 Nov 2020 01:56:19 -0500
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49937C061A4C;
        Sun, 22 Nov 2020 22:56:18 -0800 (PST)
Received: by mail-pf1-x444.google.com with SMTP id v5so9978170pff.10;
        Sun, 22 Nov 2020 22:56:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=pbq+nYpl8jiTNqoBT8AbagUr6+PfVIH4CwvL5TWEn/4=;
        b=L9jBx4HupclUK1xmVnlHN7/g9d/ZWYPxZ1s4MIZ2BSdUfbeA0CyyvaeedlV5Wt+jTv
         nCLDX5d0Xz1iAF+V1cqiECZ+5BQlAmOCzzoCPIv/+QxNMMxrZc33ueDwI+YFQmJKC1ax
         oJAsMWlzuJsZM2Xkv4lpMz0fbxz++1A0xhnYm0UU66po+3Gys8Ur0qfi1S/6Hoq/rwDz
         QFVTUumtOI6v6risO0SkdINTIJOk/unbMi5TodiqNSUM4qbv/5TETcgjlzEwCXfFgOSd
         I28k/nhRivWFoZBbrm/Yuj3R1hid+14Ym3uzMoUNAt8YA4l5spHfo2YJjd6jtRWwt73k
         1eqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=pbq+nYpl8jiTNqoBT8AbagUr6+PfVIH4CwvL5TWEn/4=;
        b=QBiLa6odlR78/coARWis1QdPryXIzRxipz1vACD+G2o2KTmB1CDCId38bOQq+JlB97
         h68FIsNvt1KlVgjGcTndnqvTmVIjhpXheb64OQ25ju0jjUhCvV/AP8zyGpJF+y9pW8eh
         IX+QkSU7yHKtpNolftzpw83Q5fUWeckqzYx68Zio6/PFioBs/rbt7ur/thmCNF1IyuCf
         6wvSeumBbn9GRMPowCNsYKW1DaZDE3rMtoU8vFI0WyaEeDFKmcVmvuaQsqO+B8/MG8GX
         1cLtE99oIntb6amugUMNYvLaLJh2PmcMPSdwfUbkOhx6t0eL7uDWtr4USxd80dURjuC+
         foUw==
X-Gm-Message-State: AOAM530iq6NYtB7lsdaga92ncv5eSKBGoYBADaIGYCVqVuRzfAdr/eC9
        eoPYLNwFlVTO/2sRD+lapkvobzr2HxY=
X-Google-Smtp-Source: ABdhPJxzDYIesGXeiTMh8g2hWKrE2OqgbYqJV5qPFnSTrGehJNd96E8jkk76fkAdyqhgw52qarnWUw==
X-Received: by 2002:a17:90a:4d47:: with SMTP id l7mr23184318pjh.121.1606114577871;
        Sun, 22 Nov 2020 22:56:17 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id s30sm9436021pgl.39.2020.11.22.22.56.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2020 22:56:17 -0800 (PST)
Date:   Sun, 22 Nov 2020 22:56:14 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Andrej Valek <andrej.valek@siemens.com>
Cc:     robh@kernel.org, nick@shmanahar.org, hadess@hadess.net,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v4 3/4] Input: atmel_mxt_ts - add option to disable
 firmware loading
Message-ID: <20201123065614.GD2034289@dtor-ws>
References: <20201029170313.25529-1-andrej.valek@siemens.com>
 <20201110181550.23853-4-andrej.valek@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201110181550.23853-4-andrej.valek@siemens.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Andrej,

On Tue, Nov 10, 2020 at 07:15:49PM +0100, Andrej Valek wrote:
> Firmware file loadind for mXT336U controller takes too much time (~60s).
> There is no check that configuration is the same which is already present.
> This happens always during boot, which makes touchscreen unusable.
> 
> Add there an option to prevent firmware file loading, but keep it enabled
> by default.

Automatically updating firmware and config on driver probe was a
mistake, and I am planning on removing the code altogether and expect
userspace to determine if flashing is needed and request it explicitly,
so this option is not really needed.

Thanks.

-- 
Dmitry
