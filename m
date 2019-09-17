Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CD48FB45FB
	for <lists+linux-input@lfdr.de>; Tue, 17 Sep 2019 05:25:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388043AbfIQDZs (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 16 Sep 2019 23:25:48 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:42578 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728579AbfIQDZs (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 16 Sep 2019 23:25:48 -0400
Received: by mail-pf1-f193.google.com with SMTP id q12so1253077pff.9
        for <linux-input@vger.kernel.org>; Mon, 16 Sep 2019 20:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=bynq05EtnYjuqVrx5kL4vpthOdIT9edOz4e+17XbESQ=;
        b=ltg8Uo1UlS/XRww/Tpgdu9k/5flcy0Y826jL2Bl0eJV9c4SjMCxGCfqGKEGN65iaxf
         WM7ehM6KqnGo+PDxsLBS05/quqJ/0ZtiePVoCut3rzgLZVUKVzNa5Bs3fr1yaONUXjSB
         iFE2T4nIYM3C/K+xZz5WXbU3mZb5DStiTkwgNjVdhFWnMMLPWSTTA2zGtEQalMjF5H94
         vDzPO+4t62LN4YNizYKnn1ktUr/GhNVSe7uyJUYEFkHgO7zWA+x133rTkTMFgekKdy3P
         qBt11sbSydcaH3j4f07NuqyFM55VHTJkKD03Vop6NCf9i+K6YdWM0JJaCQzAb9NjlXab
         jgqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=bynq05EtnYjuqVrx5kL4vpthOdIT9edOz4e+17XbESQ=;
        b=qsZvbevrsv3q9M+6kA6m8cyxL1hT9VD5P70Bl4d7XCnUHn+ZEA5Ru/1pPdNCkKUyhX
         HoatG+3Cga1yQ2ouHBvK4l68bJPgpO9YZcTpjvsWUQiMnPl+uNpYVVGDhY2CtOr6awip
         FqoxZYBW8X7Ec0WccQ5cOGXmMhl5tuKBE6HsxQQlQ8Mky+7MCHmeD2SV0Gm8Ol8+Zs8W
         j7p0uLs4IXlq/wDuoLdgvqZAHG8oVlzMgJKWgqhnwZ7zf+ffkecwPwJiebTmV6Vev74n
         c4YlSi2A/KDwE/uLE2gBs6z7uE3ril4MaL3RDYLbKuZ2uSidBYNJy2AnSdv6J6JOyAfa
         emFA==
X-Gm-Message-State: APjAAAUtD27kLatU9kGq95T64Xk0RpbFSHr2iKB6TceeOYj9S42DCoYn
        uGUFog/hl22Q+oPiKbKqnzQ=
X-Google-Smtp-Source: APXvYqy7T5pAR3CCO3ngc6swYM0Cxjr7Xku/h4Yk9O/cSE/ZcvBzg+pU/41YdXB19LZWeaHsmbTeUw==
X-Received: by 2002:a17:90a:e292:: with SMTP id d18mr2736472pjz.100.1568690747524;
        Mon, 16 Sep 2019 20:25:47 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id c128sm651168pfc.166.2019.09.16.20.25.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Sep 2019 20:25:46 -0700 (PDT)
Date:   Mon, 16 Sep 2019 20:25:44 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Lucas Stach <l.stach@pengutronix.de>
Cc:     kernel@pengutronix.de, patchwork-lst@pengutronix.de,
        Nick Dyer <nick@shmanahar.org>,
        Chris Healy <cphealy@gmail.com>, linux-input@vger.kernel.org
Subject: Re: [PATCH 1/3] Input: synaptics-rmi4 - fix video buffer size
Message-ID: <20190917032544.GK237523@dtor-ws>
References: <20190726140208.5758-1-l.stach@pengutronix.de>
 <d584597e04a4749e3e9e4b4f55eecfa791ea40b8.camel@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d584597e04a4749e3e9e4b4f55eecfa791ea40b8.camel@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Lucas,

On Thu, Sep 05, 2019 at 10:52:28AM +0200, Lucas Stach wrote:
> Hi Dmitry,
> 
> can you please take a look at those patches? At least the first 2 fix
> some kernel crashing bugs, so I wouldn't like to see them being delayed
> for too long.

I seem to have lost the series. Could you please resent it?

Thanks.

-- 
Dmitry
