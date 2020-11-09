Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 008552AAF83
	for <lists+linux-input@lfdr.de>; Mon,  9 Nov 2020 03:31:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729101AbgKICbE (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 8 Nov 2020 21:31:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727979AbgKICbE (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 8 Nov 2020 21:31:04 -0500
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 891FEC0613CF;
        Sun,  8 Nov 2020 18:31:02 -0800 (PST)
Received: by mail-pg1-x541.google.com with SMTP id i13so935242pgm.9;
        Sun, 08 Nov 2020 18:31:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=ZUcO+t6guenRE6ErgfzsflRLhKkLcUXEbVNTk+sGJYg=;
        b=arzz6aXjsBkDNqdfo47QiXvhM/S+ae5RpwjSjK13+md3WsojNMm62zRGbgifVrc2vT
         JU0jXbf8iWmKperjZzA2AAlIdabNwICHKIIhJrffR5ZccVKRKxqSjBlsrV6wFbRmbCsJ
         IcbJTCrRiDPAYIq/RXw6i7Z0PLvL5i8gcIp9T+pSveFiw1J5k1fAOBPalU2DVCjqQFu4
         B1EwvHnUGTd6O0T6kpJ2yaexliOFx6VWaiuYFFR00alxhKwcHKcge3ck9hmioBCiQg4T
         c5AwaJS9gwrBVnF98x1ZR291EaU1ahVT4dP0FI3aQLsOzvvES/i8fULDyihc9lfDTQkb
         9NQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=ZUcO+t6guenRE6ErgfzsflRLhKkLcUXEbVNTk+sGJYg=;
        b=lt1K/4JJZNea6F93oip0Dpnxcr/J0cQut7aZkV+pRsf7/SV9zODTs2IXO2M3EZLpyk
         z+Aqe/dG/3Tmm/F2WQikkdEl0TB29ZtfcIAaI9YrkSgrFCepsEho2YANTKJyMvZD0Qtf
         pfLrvKaS4V9SSOKuhWaz5YlId4+ECFHPH454QshPRtEhJAJfsp217sSUuI2nJINtBd7D
         UZ/BjXypCCTJl5Bc6crCEn0IY7hUGZFl0FTafQIsOf5M3pIM2BUmLMXBhM605w+V8Qqn
         dZFs9mLSwXm4Pa2PF+LKEXpCt+DGRTYhUPMRTxyDbN+wmBYodU2ILdBFuR1q6AAYK7ZU
         9fUQ==
X-Gm-Message-State: AOAM532y7VeCpaXIZIC7Vb9YxeuWuGzzs/wvgN7c8QJU2ln8DdlKIBiB
        UEj9mVbjGYrPESvTR7kNCLk=
X-Google-Smtp-Source: ABdhPJzp1WK6iz0Osz2p2iWkSai1TcgOo8w3khHojc8RlZjN2kuOkYFOj7yMwxAso8KzMg4y/iCsdw==
X-Received: by 2002:a63:1d15:: with SMTP id d21mr11164361pgd.433.1604889062067;
        Sun, 08 Nov 2020 18:31:02 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id h16sm9331173pjz.10.2020.11.08.18.31.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2020 18:31:01 -0800 (PST)
Date:   Sun, 8 Nov 2020 18:30:58 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>
Cc:     linux-input@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/3] Input: ektf2127 - Add support for eKTF2132
 touchscreen
Message-ID: <20201109023058.GG1003057@dtor-ws>
References: <20201106112412.390724-1-j.neuschaefer@gmx.net>
 <20201106112412.390724-3-j.neuschaefer@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201106112412.390724-3-j.neuschaefer@gmx.net>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Nov 06, 2020 at 12:24:11PM +0100, Jonathan Neuschäfer wrote:
> The eKTF2132 is a touchscreen controller found, for example, in the Kobo
> Aura ebook reader. It is similar to the ektf2127, but it uses a different
> packet type to report touch events.
> 
> Signed-off-by: Jonathan Neuschäfer <j.neuschaefer@gmx.net>

Applied, thank you.

-- 
Dmitry
