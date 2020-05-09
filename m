Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF4301CC3EA
	for <lists+linux-input@lfdr.de>; Sat,  9 May 2020 21:06:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728187AbgEITGG (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 9 May 2020 15:06:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727938AbgEITGG (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 9 May 2020 15:06:06 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BD02C061A0C
        for <linux-input@vger.kernel.org>; Sat,  9 May 2020 12:06:06 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id t16so2139121plo.7
        for <linux-input@vger.kernel.org>; Sat, 09 May 2020 12:06:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=xicB3QzNzpjW7nLXAwqx2zq6ZfNKQD5ajt3IfZNfQ+o=;
        b=tv/ivlTz+i6qykHlbrC0R6Cr7MRskDotK21+fxkc5ALpKdvb8WucrC0eL9FuDWV9mE
         rFRIJBx1ik0/hsJ+ndxWECBd1tGxaUXqQkeOgL3Ecdv+L6K8F7u+jrtH8tp6zShyrZFr
         d2MZhswg9CMnll+l627IVvjbCB0tnHx0fIwcdIBgjNwJ0z18rWXdmb6mHw+AflIhQXqQ
         XV+2bTx5A6le0YxIg699NqCuTTChw16VpfSBM90IyxhFc5wjFNrnzOq/WnirEj3f23NT
         Ql3D6gPKbVCbAqmoJIhV8juZG/7IRvhR4h7ueS28ZiroRbMkchIkKFMx3JgQIuOC4j4Q
         Qu/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=xicB3QzNzpjW7nLXAwqx2zq6ZfNKQD5ajt3IfZNfQ+o=;
        b=kbuC73Zq9UrEa6rMj5b+3q6ZnDXqev2tMqjiOAdQ7pWZ4xem05K4xT5whURnDvva3u
         AzORm7SRG3nBvcGm5txvHm2bxvgCG+kCbQeHor1SV8TtcAW4N5o95CcHxxh5EOAA0h2F
         I2U1EF/WAu+n6XM+mtAU/MTEWady/VHiXtMnv5xJfMOnjV8zrzCRvlVM90yr7V6z5/VQ
         5eL+Kx/LYQVHFs+gqUvIKypiNYQg6dUL0i/wM5b92zlE+fIkjkBGK6oK1WTRyoJ/QQKa
         I8hVOHxuU+dtVO0Lg312efkHRM8FqilAtIVmTsrc6yF+r8drClVEqQVAS0/4vHmy4msV
         JEjg==
X-Gm-Message-State: AGi0PuaUUW/7R++kjmfyPTZfKTvZS2ljITIzIok2caX11X0Ar8Z0UmK1
        05B7VHwWGlM7GmGWNz5uUYI=
X-Google-Smtp-Source: APiQypK3yP/+H5NKDweE96/+kQu7d6VKzgBC2XUGNDakVAtw7/fcaroR9MGKcFuZA53+9xr9v0KKVQ==
X-Received: by 2002:a17:90b:3717:: with SMTP id mg23mr13310072pjb.129.1589051165584;
        Sat, 09 May 2020 12:06:05 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3c2a:73a9:c2cf:7f45])
        by smtp.gmail.com with ESMTPSA id a21sm5094384pfk.39.2020.05.09.12.06.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2020 12:06:05 -0700 (PDT)
Date:   Sat, 9 May 2020 12:06:03 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Marco Felsch <m.felsch@pengutronix.de>
Cc:     andriy.shevchenko@linux.intel.com, hdegoede@redhat.com,
        LW@KARO-electronics.de, linux-input@vger.kernel.org,
        kernel@pengutronix.de
Subject: Re: [PATCH 2/4] Input: edt-ft5x06 - move parameter restore into
 helper
Message-ID: <20200509190603.GO89269@dtor-ws>
References: <20200227112819.16754-1-m.felsch@pengutronix.de>
 <20200227112819.16754-3-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200227112819.16754-3-m.felsch@pengutronix.de>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Feb 27, 2020 at 12:28:17PM +0100, Marco Felsch wrote:
> We need to restore the parameters if we switch between the
> factory/work mode and during the resume process if we switched off the
> power-supply. Therefore refactor edt_ft5x06_work_mode() and move the
> "restore the parameters" into a helper routine so we can reuse it later.
> 
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>

Applied, thank you.

-- 
Dmitry
