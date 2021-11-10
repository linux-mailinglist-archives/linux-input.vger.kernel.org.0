Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A9C644BBAA
	for <lists+linux-input@lfdr.de>; Wed, 10 Nov 2021 07:28:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229900AbhKJGa4 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 10 Nov 2021 01:30:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229731AbhKJGa4 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 10 Nov 2021 01:30:56 -0500
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D312BC061764
        for <linux-input@vger.kernel.org>; Tue,  9 Nov 2021 22:28:08 -0800 (PST)
Received: by mail-pl1-x630.google.com with SMTP id v20so2152266plo.7
        for <linux-input@vger.kernel.org>; Tue, 09 Nov 2021 22:28:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=6b9OaRn5Own9y+DUZKsUdHtPmbD8Y7gMsHuE3FKS2/E=;
        b=aLv9Gkvb5mS9aV/KS5fJKF9YQ8xoenyZUQDBuQjNtiylK0qZxj+k+UQJEYmdbvwTti
         eP8vRTWV/W/gv/2d1lyOsXBrNLVVTf6RlGXvT1dFh7XhxSP4ftShmeCHhUF1suaD+yea
         7696JGHMx8oibA3tHsPN1R8qJ+fBeY0CnTlAm/Ksa6S0KJ9YvESngkvjWcPEx5yiCX+7
         QSAG77CV7f2KddI8F4kgvNM8JWVqmTHTd1fJLVhqAC8FosBPCixoRQQYVLzoydguK4ND
         eBIn+L3RWXgQoeYMSA9rhRztlk4vwFsAW2qDaNclpDNXMvhALUpi4Se3b/MHRKLckc6h
         b+8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=6b9OaRn5Own9y+DUZKsUdHtPmbD8Y7gMsHuE3FKS2/E=;
        b=kxPQ0L5YsWdlYvPP3oEyEqycX5+i/D1WmgFvR2pVZLvB84J2ZBT3cYJbAU8tQILl08
         kk25/1JFLQd1ra6W2fB6lTycZYx2RQItvv+oeVwpn25h1rmkVlM99ioKMtu9t9VcM+vM
         nODbtULUqayzR0XquEi1LsFIzIfox2Uf3XHmzq+tUTQdu0+UtURxpbGzwcsJtZMONTPG
         dTpJQA31FpD1yglX9zcNAE91mjR2U3H/07k8a2wN6/RSckaEqoTzksFN03YDRkM00Yg2
         pm1UR4MsKzZKIet0+CzL1t88kENa4rcmWRkK5H26ULG0yD/L3wkM8OinK/p2l/FACwdC
         xTTg==
X-Gm-Message-State: AOAM530VeuvAAkYPO9uIYauLpNZkqDbleHyRPbMKa0qTCnhteMfCmzEm
        9TNLxEL04rOswUYccpCCno8=
X-Google-Smtp-Source: ABdhPJywxIw0loK0W6gEjRu0ROCwy+ipHzaHrzvOOcO0/+8NARRnqiBQHYbDBh09couOq950TA3nLQ==
X-Received: by 2002:a17:90a:af97:: with SMTP id w23mr14054754pjq.128.1636525688293;
        Tue, 09 Nov 2021 22:28:08 -0800 (PST)
Received: from google.com ([2620:15c:202:201:b345:ee3a:151d:b1d1])
        by smtp.gmail.com with ESMTPSA id z8sm16574546pgc.53.2021.11.09.22.28.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Nov 2021 22:28:07 -0800 (PST)
Date:   Tue, 9 Nov 2021 22:28:05 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Marek Vasut <marex@denx.de>
Cc:     linux-input@vger.kernel.org, Joe Hung <joe_hung@ilitek.com>,
        Luca Hsu <luca_hsu@ilitek.com>
Subject: Re: [PATCH] Input: ili210x - Special case ili251x sample read out
Message-ID: <YYtmdRDEbY6W4piM@google.com>
References: <20211108005259.480545-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211108005259.480545-1-marex@denx.de>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Nov 08, 2021 at 01:52:59AM +0100, Marek Vasut wrote:
> The ili251x touch controller needs 5ms delay between sending I2C device
> address and register address, and, writing or reading register data.
> 
> According to downstream ili251x example code, this 5ms delay is not
> required when reading touch samples out of the controller. Implement
> such a special case.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Cc: Joe Hung <joe_hung@ilitek.com>
> Cc: Luca Hsu <luca_hsu@ilitek.com>

Applied, thank you.

-- 
Dmitry
