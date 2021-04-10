Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B1C235ABAC
	for <lists+linux-input@lfdr.de>; Sat, 10 Apr 2021 09:31:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229632AbhDJHb4 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 10 Apr 2021 03:31:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229472AbhDJHbz (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 10 Apr 2021 03:31:55 -0400
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9C60C061762
        for <linux-input@vger.kernel.org>; Sat, 10 Apr 2021 00:31:41 -0700 (PDT)
Received: by mail-pf1-x42a.google.com with SMTP id o123so5720759pfb.4
        for <linux-input@vger.kernel.org>; Sat, 10 Apr 2021 00:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=YphBRjirDLTOmEiqxXg2Y+XPh3qsokd2UYSBgtq14ig=;
        b=n1EgM7K+FE2XteTN+8TBi0EqOEQgy4MTGKv4ZwAh7Zwm+Qg8bXa/EDn8nS3qlfjgkm
         RukW65kmJwmIQmtCzyKCDmMViDmcdHskhfgB8f9ENHC1Ylv4WhgUCgtJ7aAS6lbrViAM
         XEP3My4+7IAi1nhwWshf5SZGY/RqC4RUE9C/YFrxaiVMGQp7v0qShOw10itbIKVVIEw0
         SQgTnozxFmBNFyY2pm/WdDFlQP20oXzD3B7/g2ydw3COJUIb+wRd7yPI+aiBLOW7/XSV
         wqDyijL7uXPGjJ0/TZn/RIbvUB/LmbRzf9phCbmwNgq5xcTARvEZOnxuU/55co6yAEkq
         wk5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=YphBRjirDLTOmEiqxXg2Y+XPh3qsokd2UYSBgtq14ig=;
        b=saGP9jUwRlzEsLVS2ECuvul8OUAqw6WRXObeO7GNLdlqrC+zPrXJC9QaNdjGBFOV8N
         Vx2H0tbi9wVV5AvrtE8cWM/40WvqweStLMDcpDfHnbOCV+B/KwnFkJsx3JxTZMME12/g
         VTe0niCe2UXXYvZZjKMOvyVK5NKE6VlGsyWyUmD6XGtIIT0wKIR9hoC55nVCjgVAkO/F
         K6+dnQWQ/v4fgkfMhc5/wKFYCsOrCRxO+saQNzAoeXpvSh4c72G1xF4sAqdah0PNklxu
         k36RteFzbOMqtfw7PKre26dCowvPOj8Czdfa5p7gOgt4/AhJTNHYkNc1vJs6U0gmNTg4
         Vt9A==
X-Gm-Message-State: AOAM531qrkEVaKfguVJCMa2fv+K9/Ln2Jzz0MRN3VWAhHu2ExPofZkT8
        VSOL5lfdyL6OLEqkXNboRhk=
X-Google-Smtp-Source: ABdhPJzbT/XPJiBhUgDdhDQYzQ5U0rHPnMrKM4PHMxbeUcos1W477a3QRwlDR8neosjkJ8TD2FtYFQ==
X-Received: by 2002:a63:3752:: with SMTP id g18mr16453292pgn.388.1618039901221;
        Sat, 10 Apr 2021 00:31:41 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:c9de:23b9:54df:4a55])
        by smtp.gmail.com with ESMTPSA id g28sm3939458pfr.120.2021.04.10.00.31.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Apr 2021 00:31:40 -0700 (PDT)
Date:   Sat, 10 Apr 2021 00:31:38 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Ferruh Yigit <fery@cypress.com>,
        Javier Martinez Canillas <javier@dowhile0.org>,
        Henrik Rydberg <rydberg@bitmath.org>,
        linux-input@vger.kernel.org
Subject: Re: [PATCH 4/8 v3] Input: cyttsp - Error message on boot mode exit
 error
Message-ID: <YHFUWvBqhARiuQEV@google.com>
References: <20210408131153.3446138-1-linus.walleij@linaro.org>
 <20210408131153.3446138-5-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210408131153.3446138-5-linus.walleij@linaro.org>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Apr 08, 2021 at 03:11:49PM +0200, Linus Walleij wrote:
> Provide a proper error message when attempting to exit
> boot loader mode and failing, which is something that
> happened to me.
> 
> Reviewed-by: Javier Martinez Canillas <javier@dowhile0.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Applied, thank you.

-- 
Dmitry
