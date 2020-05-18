Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46E651D6EC1
	for <lists+linux-input@lfdr.de>; Mon, 18 May 2020 04:23:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726680AbgERCXD (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 17 May 2020 22:23:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726675AbgERCXC (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 17 May 2020 22:23:02 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD36EC061A0C;
        Sun, 17 May 2020 19:23:02 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id t40so4289305pjb.3;
        Sun, 17 May 2020 19:23:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=vjmCWeV4pkTNiLloM/uMdjvnY6JHjdLEXKWtsW4hZb8=;
        b=SDS460nEAvRUM8R/qoiQAevNXGbO/7Zwhiaejnll0DxPYjuzQSaO1QVp9sUkUi3oG8
         gipeUho2gquo8K8iiKrIvylMSNr1pwaQ9zud4/XEmLKJfeDm3Hl0v37Q6OjEsuCUvIqg
         DhMtvQxGLmVjx1hClkxoSS1tYuQKIyikfbAkvwIv80d7NPESGt1vtGr0gxOehJc8VX5R
         uCFKkZCeoRz+a2HFRhbDv0Zh3HlcLKqNajAAnR1TQZIKpEi1AFUf9h+d9MdgOs4n6beE
         qT+7h1/PrD6E1vZZ9Gb7BXhnaSdAiyovMf9dvmMAlA0azL24t6sGdjW1PVNfwNEMoXN9
         MgZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=vjmCWeV4pkTNiLloM/uMdjvnY6JHjdLEXKWtsW4hZb8=;
        b=frpMHhiiVRlG3yB+2Wha3zgVZAsD+sZw3irT6y1jvasIyvpJ/92PPRBavVfX1ow/0B
         t8PDqAV+PcVZ2OAH5/ckxj1SVkd/TpBc1rwcrrACQ1WrGhCTLP9k71sx+dTx0SbxE11R
         ccaPycc1yFQi3nMikNIEwz7wrFR4jvMOu52YbpnqiQsLmLnqy6hSxD4qwmFESV8ML1SG
         LSWxxlCs2kUiyoGRIymd2BUbbJt1Eh21/GwNjgaQ3mcVGLRHQmFQpZUk7aJG95JuSb1c
         qGtqNZUhWk8kTgd7FRH1kGuNhCGCRok4UhXIru/OykkiG/9502oRau+R3slFs1egRpGM
         Hc8w==
X-Gm-Message-State: AOAM530Hdfu/M8aJH6cSUd6XyEWt+AyhgPEJbTpDvC5zH2P58PpH98Uc
        M7b2gau6rCchYWRXmooCSzZD3/3j
X-Google-Smtp-Source: ABdhPJwnC72gFKOelZqZ2uvRBCdh52qLdHX6vnsZDuLd7vDWOzno7HYLJNYKXqATB1+oqp43rt7Gww==
X-Received: by 2002:a17:902:b405:: with SMTP id x5mr4511320plr.31.1589768582192;
        Sun, 17 May 2020 19:23:02 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3c2a:73a9:c2cf:7f45])
        by smtp.gmail.com with ESMTPSA id ay15sm7068791pjb.18.2020.05.17.19.23.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2020 19:23:01 -0700 (PDT)
Date:   Sun, 17 May 2020 19:22:59 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Jeff LaBundy <jeff@labundy.com>
Cc:     robh+dt@kernel.org, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: input: Add bindings for Azoteq
 IQS269A
Message-ID: <20200518022259.GJ89269@dtor-ws>
References: <1588352982-5117-1-git-send-email-jeff@labundy.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1588352982-5117-1-git-send-email-jeff@labundy.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, May 01, 2020 at 12:09:41PM -0500, Jeff LaBundy wrote:
> This patch adds device tree bindings for the Azoteq IQS269A
> capacitive touch controller.
> 
> Signed-off-by: Jeff LaBundy <jeff@labundy.com>

Applied, thank you.

-- 
Dmitry
