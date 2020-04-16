Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 404831ABF33
	for <lists+linux-input@lfdr.de>; Thu, 16 Apr 2020 13:31:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2633207AbgDPLa7 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 16 Apr 2020 07:30:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2506178AbgDPLJH (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 16 Apr 2020 07:09:07 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C537C061A10
        for <linux-input@vger.kernel.org>; Thu, 16 Apr 2020 04:08:41 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id j3so6894712ljg.8
        for <linux-input@vger.kernel.org>; Thu, 16 Apr 2020 04:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=S7CeX1goNiTzCPux7yhtQx3G78bwWhEvP9iEt87hwXc=;
        b=qKxcdlQR1dTo+AB/xd6XeJOvWM5JtcmUcG0asrp4xQZZTFGvsNcxlAo4cAiDq2Ihh8
         X0k/1k/NuBHLCe/ZkTNPbWdmeukTv1kibYjJN12a4aQR7nf4rPHevnprS2CYjIysd2yo
         h/Nzh0SpL2/5qH4YhnlN+pAOGyGcFEU3y9eoIF16fKUVyUlj6hUEGv2bfwhNF27GIN1k
         4biIi3ltBB7CxbkwkPneMzkoo8jHswOZUvamC9jQ85kgGM5mEFb9dq5W08golrvXMVE3
         nxdG6yZnLXvmAsKyDstuD1ut4kOem/KVVBF32bAgeUHs+3ZJ+NkQqpulz5RxcOf70vkY
         54SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=S7CeX1goNiTzCPux7yhtQx3G78bwWhEvP9iEt87hwXc=;
        b=YRDuPeTLk3A49JEIN302JI61XdFBsHZRDJW+uCyqVQVF+3oyji8VpeJsbFureoZCrp
         qQxf2cp7XsZcy7x1hAx90jCiZ8VXYbdU7N9A3/CYsI5twWH4uK4mu2ExwI+az724PAA3
         /WFZ8TJMCXeO8V2w+wU60J6ZZBQt03gI2iQIUXYyAjDN7gANQqpzZIE0dXZKui2/IKpg
         vK/o0f/HaUfn1K6H5xu5JpmNIZx81LuOtH9ivCVkd6Ylzaqz9LgyD66oq/YJAuhgtJcb
         GweymnDlQ7TtwzouWB2oB/P0VQzLdTc1q6QVIxD7UNZ/KgxohGYI/7SC77/La1wiL4vg
         P3Zw==
X-Gm-Message-State: AGi0PuY28kGrJ8PWEJwceanZqAbRkjGopVZ/MKaYvMAqFj0ruBdIjIML
        0WEMya8wHoCjS1nJPm3NzF+YD/V24OGJWbePFAE7xg==
X-Google-Smtp-Source: APiQypJCs3GDOnmZgOUbr1CKEadpgsOSo5WsfLaAn86lNQu9ACAgMT5KinznWfgnuk9HrE4sBT+105fBLfjw+mUzLmc=
X-Received: by 2002:a2e:9ad9:: with SMTP id p25mr6268989ljj.39.1587035319801;
 Thu, 16 Apr 2020 04:08:39 -0700 (PDT)
MIME-Version: 1.0
References: <20200412213937.5287-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200412213937.5287-1-christophe.jaillet@wanadoo.fr>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 16 Apr 2020 13:08:28 +0200
Message-ID: <CACRpkdZMLec8gXSJo-SpNXa3bBne2gDCRT3M_BEz21EtMXUAMw@mail.gmail.com>
Subject: Re: [PATCH] Input: dlink-dir685-touchkeys: Fix a typo in driver name
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Linux Input <linux-input@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, Apr 12, 2020 at 11:39 PM Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:

> According to the file name and Kconfig, a 'k' is missing in this driver
> name. It should be "dlink-dir685-touchkeys".
>
> Fixes: 131b3de7016b ("Input: add D-Link DIR-685 touchkeys driver")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
