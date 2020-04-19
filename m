Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3FD191AF6CF
	for <lists+linux-input@lfdr.de>; Sun, 19 Apr 2020 06:27:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725923AbgDSE1l (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 19 Apr 2020 00:27:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725769AbgDSE1l (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 19 Apr 2020 00:27:41 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3B3FC061A0C;
        Sat, 18 Apr 2020 21:27:39 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id ng8so3061895pjb.2;
        Sat, 18 Apr 2020 21:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Fg1nBtscd0EnZj9z4stneXu5of0TAOGY9Mx+yinyRuE=;
        b=So01w+pyjdVuDseUrJoqO/RyaAGna8aMbnWUPoms5gVndykw/c9fM9r1CuCNvNTqkm
         vrEJXbyKIgKvjLCdfOWMYt/M0RdS43r7slg7gZbe+jEJaEXUgJ/4asHFmJ5BfLjCCJQA
         8bfWx1oGF3aP8qaJiJDibREG9fJi5xIzifYvCaojDok874hovG1iaO0jSv5ak9CDtN5E
         zHTJKYksKSmLA8jBgWFw6I/BAsdIStskSKQhcteeUQntpnrouvx8YPcM6t+3mRwz6RAU
         PyITf2Pc9os/+rYCimh4Ha9JUr1dFVQ91RvzQ+BSGTc6Cph/GVR5VDOM0FSkKOjKJNCd
         G5DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Fg1nBtscd0EnZj9z4stneXu5of0TAOGY9Mx+yinyRuE=;
        b=ALXXlCQJoH5VxPMT0MI5koLiW5/RLUWFB8Uq2A+f+oQhdukdhpemXakTpSSvJkrf6e
         EJtVl+majF9XNSCKfIIUopwxBfq78gz8HgZTL4zR7X6wtOTDL2E3j0hxWd/3SjuIh4r3
         7dQiGRIbOD7SzypzpM0RmJtF7msobtGqbz0X2iM2RF7cAsLbcJjAmtFvEDYRTeKIgRWN
         GepypVqnFoEPZK+cgXKKtB8ygCt7wiGdlpBXmcBEigxvYV/T+9JOrIvAvOIRWif7FfPr
         1N5pq7ODzpDBo2bRFgTkfaPW0rUfIX2S5x60MoAfgL23T5BJebOrU6hdkwcfOXxUb+uY
         LEvA==
X-Gm-Message-State: AGi0PuYWMXznGv55ZHIpz8Uw+YZeT/uryYp6I/uE3mM3+vo2d8+SD+bE
        oNlDVQw7d7yGmSyeb2K9vzM=
X-Google-Smtp-Source: APiQypJ9w3xNbZHSC3ODse153GoeR6LMQDsn7t07Y0RrPNaHqBp05xk71/n+yRhtIMaCPVvHNCBVOQ==
X-Received: by 2002:a17:90a:a402:: with SMTP id y2mr1198940pjp.55.1587270459105;
        Sat, 18 Apr 2020 21:27:39 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3c2a:73a9:c2cf:7f45])
        by smtp.gmail.com with ESMTPSA id y26sm5004925pfn.185.2020.04.18.21.27.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Apr 2020 21:27:38 -0700 (PDT)
Date:   Sat, 18 Apr 2020 21:27:36 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     tglx@linutronix.de, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] Input: Fix a typo in a module name in Kconfig
Message-ID: <20200419042736.GI166864@dtor-ws>
References: <20200412095711.9107-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200412095711.9107-1-christophe.jaillet@wanadoo.fr>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, Apr 12, 2020 at 11:57:11AM +0200, Christophe JAILLET wrote:
> A 'y' is missing in spear-keyboard.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied, thank you.

> ---
>  drivers/input/keyboard/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/input/keyboard/Kconfig b/drivers/input/keyboard/Kconfig
> index 28de965a08d5..793ecbbda32c 100644
> --- a/drivers/input/keyboard/Kconfig
> +++ b/drivers/input/keyboard/Kconfig
> @@ -701,7 +701,7 @@ config KEYBOARD_SPEAR
>  	  Say Y here if you want to use the SPEAR keyboard.
>  
>  	  To compile this driver as a module, choose M here: the
> -	  module will be called spear-keboard.
> +	  module will be called spear-keyboard.
>  
>  config KEYBOARD_TC3589X
>  	tristate "TC3589X Keypad support"
> -- 
> 2.20.1
> 

-- 
Dmitry
