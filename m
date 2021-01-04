Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC13C2E8F41
	for <lists+linux-input@lfdr.de>; Mon,  4 Jan 2021 02:46:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727708AbhADBp5 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 3 Jan 2021 20:45:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726026AbhADBp5 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 3 Jan 2021 20:45:57 -0500
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98F39C061793;
        Sun,  3 Jan 2021 17:45:16 -0800 (PST)
Received: by mail-pj1-x1032.google.com with SMTP id j13so9526167pjz.3;
        Sun, 03 Jan 2021 17:45:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=38WIGAygNiMWI2gJVMTHqxzKU9nzquPoYh9CNRPAsyA=;
        b=Fgd1EMnVgk2M4x903WVFUJCP8AoTrOdV2P53FIdkSgrYryA6OyiF7LaQEawi7Z43KY
         iB9W2v2Hbks0ha5odTccY2U/lYMLqoK2VdH+RiinvTb03tl/y4iUlxkw6QF2WvoYM10T
         vvqUDBOtOPOTa67pFODiUVF/bx3QiTggLijHdtS5cmP5v+ntXc89pJSAuZ01HoB809VS
         AIA8maAvOjk9irudUBGZA7wVcQwUEd9ILwenDtOu0B9NlhNQrhOZh2lEV6tbuh0m4z/9
         mLN5LjL1BXKbuiz6yIkL15euOpTQhvikNFYMC1PqP5VxWCOVBtj/63rtC0EI8uB6dW6b
         /oBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=38WIGAygNiMWI2gJVMTHqxzKU9nzquPoYh9CNRPAsyA=;
        b=G8hoCVBszDBNzon7m6KPFSV5vMk3w78ZoHjk5GQHQowLojwOyyFPynecbroeVG2nib
         0c5CUyFXpFMJy9MKejFRdYa+i5mEpy8CV4nnuBjeEd9ovpLb6QxLx/9A6/aVDP2NU4du
         iVZG6wGMDYTIvl77zH2R9SuvOyanuiKHqD+IkjleZBWua+Z+fd3D/aVEaXTAMlP7LiPk
         n2Pinx71QZ6v7bnW1yG3Z8vGaolkYjNMIeq4UdN8Qp8Lufu4mxKlK3G98wRKsQXa6uhr
         ow4zfUdrq6AGm/MXxhnF/GRKJalEKMPEdQ/M2Yi/9lWZ7mT2+JuLb8GhOhWxpBlzxRLi
         3xKg==
X-Gm-Message-State: AOAM533aP1J2ZHo7IdPAHIBpaHPkdiWscUtP++UNcA2GSZNXMSSbsWhJ
        5LqC7Dq0m2tTx9z/SSzz0M3+EPG21sA=
X-Google-Smtp-Source: ABdhPJz4aInHpsci1mbruF5WsMYKPPNvCEUKSB5GJcsGv1kJ7TVuFWN1UzGpp+/sTWT7cahQscMSQQ==
X-Received: by 2002:a17:902:82c8:b029:da:eead:94a0 with SMTP id u8-20020a17090282c8b02900daeead94a0mr48603183plz.42.1609724716150;
        Sun, 03 Jan 2021 17:45:16 -0800 (PST)
Received: from google.com ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id p3sm18829367pjg.53.2021.01.03.17.45.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Jan 2021 17:45:15 -0800 (PST)
Date:   Sun, 3 Jan 2021 17:45:13 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Andrej Valek <andrej.valek@siemens.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-input@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 2/3] Input: st1232 - do not read more bytes than needed
Message-ID: <X/JzKWMVkfskc4M+@google.com>
References: <20201229162601.2154566-1-geert+renesas@glider.be>
 <20201229162601.2154566-3-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201229162601.2154566-3-geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Dec 29, 2020 at 05:26:00PM +0100, Geert Uytterhoeven wrote:
> st1232_ts_read_data() already reads ts->read_buf_len bytes (8 or 20
> bytes) from the touchscreen controller.  This was fine when it was used
> to read touch point coordinates only, but is overkill for reading the
> touchscreen resolution, which just needs 3 bytes.
> 
> Optimize transfers by passing the wanted number of bytes.
> 
> Fixes: 3a54a215410b1650 ("Input: st1232 - add support resolution reading")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Applied, thank you.

-- 
Dmitry
