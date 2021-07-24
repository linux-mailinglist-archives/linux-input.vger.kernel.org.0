Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 08D5F3D4410
	for <lists+linux-input@lfdr.de>; Sat, 24 Jul 2021 02:48:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233403AbhGXAHa (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 23 Jul 2021 20:07:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233337AbhGXAHa (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 23 Jul 2021 20:07:30 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7768C061575;
        Fri, 23 Jul 2021 17:48:02 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id b6so4515699pji.4;
        Fri, 23 Jul 2021 17:48:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=WnqV+yGigyMx7I5XoWrwlAvugHFLOvj6ETM1TTcC0wY=;
        b=vO0loE/IAApeIJSzqgRsnxy4E7T9YZWRAFiNFoMmqZPylS+rbfP0bI/yhi9Pqzk4VU
         P8tKQEj/Ub5KN6G4JRVMuTgA3tncGDIJuCEPPZ5zNwK/xBTrFrnD7egMa/wd62p7gMfd
         5WnLQfXUfgauoH5bjk5sGoKhovC2M0h/0Tu9uJDCVXWVTGW3tf9A7M2zhkBYY//GhzPc
         rrk7bW/Ih5U9gIh/Yud8yjzcsWFdj6wFLyuL8kr+KxHbK55+TMY4W4Y1moHvvgLIRl6Z
         UtY4llYMnmqhKlhmj5leUaYVKNzJ9nMsFkp4PlzEse36xR8xsEVDQ4QH892VXObBB/g8
         RBag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=WnqV+yGigyMx7I5XoWrwlAvugHFLOvj6ETM1TTcC0wY=;
        b=GpJKk0RVH/C1+y8WugIMV2uVXySPSss0TI8P1oFuHv6te7SlECiKx0k6vC3xB9xomc
         aOFGJTF/Ye3GLVGI+cFuRnmm6WjeL0MeF/Sax9MG3Hor5DXCK6Jye/cuolfbGW/Uun/U
         S8gT4zxbhFbTbjJc6vgNCjvKNwZeJaKfPpIQ9qGM/EA3IU86KSWGNtme64TRI4C6DFeJ
         UWOpG+KVOgthsDjlOX1EW+iMdiV6fM4m/1K5/TLv2JN84YTGArafTx4hvhVIlH58KzD+
         gZJA4C4wE1ho8t3VDMTEjY5Np+I7YPb2RcMYi1V7t+4QAFqNty5u7XD8AHtSqH/Lc4x9
         oKXQ==
X-Gm-Message-State: AOAM533hFEjIc2Yb7SM3ZT71qrFRBXsBmaE11wg/xxkYLuw2OoAtVyxn
        UCGqyOLAcslEeOsm33RE7qBorqi4spc=
X-Google-Smtp-Source: ABdhPJw6IrDL9GThLFu84w7ZcThK0+Roq0IoAdkia1CRACEnE3K0cY2YdpuViedadM4nl/XCHzH1rg==
X-Received: by 2002:a17:90a:aa92:: with SMTP id l18mr664241pjq.20.1627087682056;
        Fri, 23 Jul 2021 17:48:02 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:55b1:90d5:6a79:755f])
        by smtp.gmail.com with ESMTPSA id n123sm39352217pga.69.2021.07.23.17.48.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jul 2021 17:48:01 -0700 (PDT)
Date:   Fri, 23 Jul 2021 17:47:58 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Marek Vasut <marex@denx.de>
Cc:     devicetree@vger.kernel.org, Michael Welling <mwelling@ieee.org>,
        Rob Herring <robh+dt@kernel.org>, kernel@dh-electronics.com,
        linux-input@vger.kernel.org
Subject: Re: [PATCH v3] dt-bindings: input: tsc2005: Convert to YAML schema
Message-ID: <YPtjPkOwwU7Xe1dC@google.com>
References: <20210620210708.100147-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210620210708.100147-1-marex@denx.de>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, Jun 20, 2021 at 11:07:08PM +0200, Marek Vasut wrote:
> Convert the TI TSC2004/TSC2005 DT bindings to YAML schema.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Cc: Michael Welling <mwelling@ieee.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: kernel@dh-electronics.com
> Cc: linux-input@vger.kernel.org
> To: devicetree@vger.kernel.org

Applied, thank you.

-- 
Dmitry
