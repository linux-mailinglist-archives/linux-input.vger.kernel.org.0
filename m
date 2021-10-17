Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 625104306EF
	for <lists+linux-input@lfdr.de>; Sun, 17 Oct 2021 07:27:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244973AbhJQF3F (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 17 Oct 2021 01:29:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244977AbhJQF3C (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 17 Oct 2021 01:29:02 -0400
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0BD4C061768
        for <linux-input@vger.kernel.org>; Sat, 16 Oct 2021 22:26:52 -0700 (PDT)
Received: by mail-pg1-x536.google.com with SMTP id m21so12656317pgu.13
        for <linux-input@vger.kernel.org>; Sat, 16 Oct 2021 22:26:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=UupfLRk+BIlDAMe1gKdoA0IwoVtlDMmnAtK5ed9hof4=;
        b=hmqE881fvNcQNc1lfANknkdLqsodYpM+q0SKYqhu5hVabUL06Tq+N1u8tjY3FcShMa
         iAQfMIiEp+FLPctS5r3B1kd4zlFD1hCSEcqbpjl/9FEhnX3sWkGfJcTHHDmX0pn9PjQC
         RavLfV7wMuWme0RCGbqoj4EpxyUOQ/jS8qzDg7sSwFvHG2GMJVf5woZKM9vLthJdLQOW
         YH/C7SYF2StWM3zB+d4SXpjVxiYRCPMd8+gVCo6gwt+8fM14KHgUF1ILdKkgtuM2e5c1
         q5sOiC9ilGiWZNMOboUuX3W/9H3+hxsKyKA38BciFRKBPbRNwgXfXXiQEGBEzZXMyUoX
         /hcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=UupfLRk+BIlDAMe1gKdoA0IwoVtlDMmnAtK5ed9hof4=;
        b=o3/fnETUmkdCH8D4wM/6Nob2G1+nbHKRB/rozHRUkA+CB4/NZCTM3nLRcC0bGJX60Z
         rV22rbly6HjZbIB/Q3Lzzl0tcUYrBCUd12Gsvj5CGPy6xhZ3JHX0uYBDEjz0CPIvgZWQ
         Vgs4uFcJhKzwKbBEmLMpeZfEw9mrE61nLEnK2fWNt1sibPepqVpHuUtNXMd9MI0wGq76
         RVNdqTcODOx4TkuWT+UpB6YLBRPL8WlsZr6avyIKjt9C24Qo7x2gpWFcD2jXnT8QQOi8
         C3GY0Yqw7jdn0uIKlOt2TU3VV/GvLxmidD8+TFZ/be2woEx5/j1P+qtM40tuEgR7SS6L
         yh0w==
X-Gm-Message-State: AOAM533ZXn+jP16gTVrcmLPSG294ROfp0rO/7kBg+F/vo2O3R8KGC785
        vigKLTfNjUC0SDexcLX4xzlMlxcZgCQ=
X-Google-Smtp-Source: ABdhPJzWeDNSW/nlPRBF7RoJwWI+mI6dM9KpcWLkfcG9lISco/7rJ42BVGQHCx7waJ5JPotiWs+CDQ==
X-Received: by 2002:a63:554f:: with SMTP id f15mr16861636pgm.90.1634448412395;
        Sat, 16 Oct 2021 22:26:52 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:e49a:151f:b7d7:af9a])
        by smtp.gmail.com with ESMTPSA id bb12sm5243768pjb.0.2021.10.16.22.26.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Oct 2021 22:26:51 -0700 (PDT)
Date:   Sat, 16 Oct 2021 22:26:49 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Marek Vasut <marex@denx.de>
Cc:     linux-input@vger.kernel.org, ch@denx.de,
        Joe Hung <joe_hung@ilitek.com>, Luca Hsu <luca_hsu@ilitek.com>
Subject: Re: [PATCH v3 3/3] Input: ili210x - add ili251x firmware update
 support
Message-ID: <YWu0GWttNy9FWrfo@google.com>
References: <20210831202506.181927-1-marex@denx.de>
 <20210831202506.181927-3-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210831202506.181927-3-marex@denx.de>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Aug 31, 2021 at 10:25:06PM +0200, Marek Vasut wrote:
> +
> +	/* DF end address is the last address in the firmware blob */
> +	*df_end = fw_addr + fw_len;
> +	*buf = fw_buf;
> +	release_firmware(fw);
> +	return 0;
> +err_big:
> +	kfree(fw_buf);
> +err_alloc:
> +	release_firmware(fw);
> +	return error;

I do not quite like that we have to release firmware in both success
and error paths, so I moved the call to request_ihex_firmware() to the
caller of this function and release it before checking the result of
loading the firmware to buffer, and applied.

Thank you.

-- 
Dmitry
