Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D08842AC7F3
	for <lists+linux-input@lfdr.de>; Mon,  9 Nov 2020 23:02:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729879AbgKIWC6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 9 Nov 2020 17:02:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729599AbgKIWC6 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 9 Nov 2020 17:02:58 -0500
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94598C0613CF;
        Mon,  9 Nov 2020 14:02:58 -0800 (PST)
Received: by mail-pg1-x542.google.com with SMTP id h6so8327658pgk.4;
        Mon, 09 Nov 2020 14:02:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=D22ajkJebWMrdJiUwj+MehNW7vEO42K43ZsjhVa+LDw=;
        b=Aca3MokPugo6o3WbmBN/02DvOuTsFJFnEYEum6NB+f+wW7MDdIGbIAbXtwEapEHGkv
         dJEMgNJLigfGx5E9eDvjYM/8lMilWEX/zYKrdZWJ1dGFuIJ+OnFiDFtYN+zjuSQE9tNd
         QwcjYHtfCnUC24nK8lV2YtwXfz9OznbKitCLPES3PwoNzyvxdt0Lp7GQOhTl6xWco4Gi
         PiIQBIM7rsXIgeLCQPkhtMKJu7MmeOTnr6mBmCA6YgYuOboh3XhIl/4DEcrMdeCT9KCW
         +1Symcn/xr1cuO9ZF+l+Qf3nAoynWJmo9EtEd0ZiUdIe3cl+asTt+ZLdmY6n9rR/8N/B
         27/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=D22ajkJebWMrdJiUwj+MehNW7vEO42K43ZsjhVa+LDw=;
        b=mvRowhgXjdDK4J0WCgJyqKOKaTnyKmIlVdgmMre1hn/UzzNO7hwoljtehX5LKdHo5q
         O7BtVUBOgrLyEgf7uPmvTvjxRs1fbTwwbbYNi+IhxyEnSI1TGF04hE1y9du5zPobHA91
         ugHD+MbhNE5aVEc1AO1RBiwnKyrjT2gAOdTTdZHATiOghoHpgYUrj5Vg2VroOczksBLK
         mGl2pX7ZFFsKPWQFRPYn3Tg3GlGiR3yUzIcTAzchhW3XP6/fchlr9hxMpCXqvb93hXMO
         9Npud46HPquj0C3A/uJWyUIRhe9zs0MQLs/1/24aJDRtNvFrNeej41Bq4loHzVsCMNGX
         e1Eg==
X-Gm-Message-State: AOAM5336wB0rBRLYmaX+PEZNrre+cwc50y/SK/T910BwP2eL/z+gNqx/
        WW3X5MpokmyDfgklk8RgkHMpqYlPY18=
X-Google-Smtp-Source: ABdhPJw272XD8i7+m+Qki7dHA7d+UjmuquxQyB8HgQqAYE1RZWalFKme4LT+yyFulxsgD07sHyf/aQ==
X-Received: by 2002:a62:e70e:0:b029:18b:913e:9d1d with SMTP id s14-20020a62e70e0000b029018b913e9d1dmr15570161pfh.47.1604959378113;
        Mon, 09 Nov 2020 14:02:58 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id a11sm12183398pfn.125.2020.11.09.14.02.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2020 14:02:57 -0800 (PST)
Date:   Mon, 9 Nov 2020 14:02:54 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     linux-kernel@vger.kernel.org, Trilok Soni <tsoni@codeaurora.org>,
        linux-input@vger.kernel.org
Subject: Re: [PATCH 20/20] input: keyboard: pmic8xxx-keypad: Fix kernel-doc
 formatting
Message-ID: <20201109220254.GU1003057@dtor-ws>
References: <20201104162427.2984742-1-lee.jones@linaro.org>
 <20201104162427.2984742-21-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201104162427.2984742-21-lee.jones@linaro.org>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Nov 04, 2020 at 04:24:27PM +0000, Lee Jones wrote:
> Fixes the following W=1 kernel build warning(s):
> 
>  drivers/input/keyboard/pmic8xxx-keypad.c:106: warning: Function parameter or member 'num_rows' not described in 'pmic8xxx_kp'
>  drivers/input/keyboard/pmic8xxx-keypad.c:106: warning: Function parameter or member 'num_cols' not described in 'pmic8xxx_kp'
>  drivers/input/keyboard/pmic8xxx-keypad.c:106: warning: Function parameter or member 'input' not described in 'pmic8xxx_kp'
>  drivers/input/keyboard/pmic8xxx-keypad.c:106: warning: Function parameter or member 'regmap' not described in 'pmic8xxx_kp'
>  drivers/input/keyboard/pmic8xxx-keypad.c:106: warning: Function parameter or member 'key_sense_irq' not described in 'pmic8xxx_kp'
>  drivers/input/keyboard/pmic8xxx-keypad.c:106: warning: Function parameter or member 'key_stuck_irq' not described in 'pmic8xxx_kp'
>  drivers/input/keyboard/pmic8xxx-keypad.c:106: warning: Function parameter or member 'keycodes' not described in 'pmic8xxx_kp'
>  drivers/input/keyboard/pmic8xxx-keypad.c:106: warning: Function parameter or member 'dev' not described in 'pmic8xxx_kp'
>  drivers/input/keyboard/pmic8xxx-keypad.c:106: warning: Function parameter or member 'keystate' not described in 'pmic8xxx_kp'
>  drivers/input/keyboard/pmic8xxx-keypad.c:106: warning: Function parameter or member 'stuckstate' not described in 'pmic8xxx_kp'
>  drivers/input/keyboard/pmic8xxx-keypad.c:106: warning: Function parameter or member 'ctrl_reg' not described in 'pmic8xxx_kp'
> 
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Cc: Trilok Soni <tsoni@codeaurora.org>
> Cc: linux-input@vger.kernel.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>

Applied, thank you.

-- 
Dmitry
