Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57F62430F6E
	for <lists+linux-input@lfdr.de>; Mon, 18 Oct 2021 07:04:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229533AbhJRFGX (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 18 Oct 2021 01:06:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229482AbhJRFGX (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 18 Oct 2021 01:06:23 -0400
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F0EEC06161C;
        Sun, 17 Oct 2021 22:04:12 -0700 (PDT)
Received: by mail-pg1-x530.google.com with SMTP id c4so7789499pgv.11;
        Sun, 17 Oct 2021 22:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=bz5DkzU/zPkXBBculWiG69oBbwTdQ1Zg0M1tEfS7s7c=;
        b=K0exXwmZ3dLvXYMy5bJ6AWXcVeMaINRbUujbBTW2rWfJqnU0P0ZBQU19kf74vvdfJh
         WrV82v7oI6hlMcjlaqScRfk8EY3KyCVZLIPETS3ZPmXEMmJb+kmWXL4hXnNiwkxqYt4y
         ZrEF10qn43rZt9R8xVD+bmjN5kcBRI8REVQCqHjDk9GyRt/3Y87sLciKZ8CrjMMy3RQt
         m5fydMScJbB0saUZ6jjnXsVI9+hkxX3vhwR5nX44LvdXax/ZjRYNMGstCDxrSTfYuWKm
         xDe8cShD78dwu59D5cq9nHSptbF229Czrhl+gt7VaXl4uG91t6Zsg2r+sArvn1/wgWNm
         qDCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=bz5DkzU/zPkXBBculWiG69oBbwTdQ1Zg0M1tEfS7s7c=;
        b=dGKDt5qNrLd6Kli4LJ6LSbM9A17bG7GYzAyHS0ok1VusPjGFGhY/PYOPq5BMmCjOg3
         BZUuIa/upYNq64AXSJUy09cqT5W73M6URveBwHL/60DzTUSE7JF8R6MwbWehBUpmUekW
         FwWeLGE/xe+5V/6LHLarxNeMzmyCY2RT7tKQEeJPNN1xjavnEFJwX8YplGXa86X9fzER
         l9QjW1ukw6pQRB4jBVfs6azR2CflZcVUFx2l3XBy8tXFPsOAgRfbO+McaeoJn7AngdzB
         T0yzlOgn6dPZz+FrNCLc+ZN1aUjfh+BzG/XWv491svWRTJA47JZVqgqovqXIL7ougBiK
         6bJw==
X-Gm-Message-State: AOAM530VcrfmGdFTrrNJBpGJ7OmaQMNkqloenUQ/1+YVMzwuzEQl2uTr
        CSyPIs1cfrK5ckCYM+Ug52E=
X-Google-Smtp-Source: ABdhPJw60VKyl4OpYtF+oq6w3oLxpktHXaXsRsPWk2a8MnF9glZkF8oSqgieX525wtI5nVS1BwKycQ==
X-Received: by 2002:a63:b11:: with SMTP id 17mr21552928pgl.51.1634533451845;
        Sun, 17 Oct 2021 22:04:11 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:7649:ee4:7a4f:e362])
        by smtp.gmail.com with ESMTPSA id z5sm1543534pge.2.2021.10.17.22.04.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Oct 2021 22:04:11 -0700 (PDT)
Date:   Sun, 17 Oct 2021 22:04:08 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     changlianzhi <changlianzhi@uniontech.com>
Cc:     linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org,
        jirislaby@kernel.org, andriy.shevchenko@linux.intel.com,
        linux-input@vger.kernel.org, 282827961@qq.com
Subject: Re: [PATCH v2 10/18] input&tty: Fix the keyboard led light display
 problem
Message-ID: <YW0ASOPjFT8diKQq@google.com>
References: <616cd589.1c69fb81.f43e6.d620SMTPIN_ADDED_BROKEN@mx.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <616cd589.1c69fb81.f43e6.d620SMTPIN_ADDED_BROKEN@mx.google.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On Mon, Oct 18, 2021 at 10:01:34AM +0800, changlianzhi wrote:
> Switching from the desktop environment to the tty environment,
> the state of the keyboard led lights and the state of the keyboard
> lock are inconsistent. This is because the attribute kb->kbdmode
> of the tty bound in the desktop environment (xorg) is set to
> VC_OFF, which causes the ledstate and kb->ledflagstate
> values of the bound tty to always be 0, which causes the switch
> from the desktop When to the tty environment, the LED light
> status is inconsistent with the keyboard lock status.
> 
> Signed-off-by: lianzhi chang <changlianzhi@uniontech.com>
> ---
> v2 10/18:
> (1) Move the definition of ledstate to the input module
> (/drivers/input/input.c),
> and set or get its value through the input_update_ledstate(Replace the
> update_value_ledstate function defined in the last patch, and optimize
> the code according to the proposal) and input_get_ledstate functions.
> (2) To update the ledstate reference in keyboard.c, you must first get
> the value through input_get_ledstate.
> (3)Some macro definitions have been added to input.c.
> 
> drivers/input/input.c | 46 ++++++++++++++++++++++++++++++++++++++-

As I mentioned, I do not see a reason for your patch to touch input
core, please keep the modifications contained within
drivers/tty/vt/keyboard.c

> drivers/tty/vt/keyboard.c | 19 ++++++++++++++--
> include/linux/input.h | 3 +++
> 3 files changed, 65 insertions(+), 3 deletions(-)
> 

Thanks.

-- 
Dmitry
