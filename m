Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 039E72D6FE6
	for <lists+linux-input@lfdr.de>; Fri, 11 Dec 2020 06:57:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2395288AbgLKF45 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 11 Dec 2020 00:56:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387579AbgLKF4n (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 11 Dec 2020 00:56:43 -0500
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56E2CC0613CF;
        Thu, 10 Dec 2020 21:56:03 -0800 (PST)
Received: by mail-pj1-x1044.google.com with SMTP id h7so1326515pjk.1;
        Thu, 10 Dec 2020 21:56:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=JP+OlX4QCRKEvekK9QO03D9Ia1suW4TL/USrqq3OnmI=;
        b=Q7+jBqXm/JKkZ27XFHty5hs101AHm3MV59rDcadmeAsPu+L/DsL4xkoqsy0Q+PcnCg
         iUxJLkKe2bbDxYx6fnpJebzKSWSTKxEAL5cFCyW2nw00rBFF2Br73gZNy8zQR5rDpkXZ
         QdK0bFJ8qg6tSash6VAxDHjZsFyumrSxW/ReIDOKpAxkqrrhPNaERPHVXLwBV6IkeiIs
         PZhOSw7Z7NeW3P+EDY8JU1uFQvxB8dHKVnK3ZW2wwbNibxHgwWwKkkOXryHrbnvl2Lo2
         yNjOnNxom4kyuWz8oZq1VjJ2xI0sv7vlCNz8tVle8njlMlqT8+ZwPkeEVzDFLQ8Xkj36
         1+VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=JP+OlX4QCRKEvekK9QO03D9Ia1suW4TL/USrqq3OnmI=;
        b=FGupSoW5amVvwyKjq2CcqNGnJKXvHT5BGiZ51Sr9p5oag59LHkud0036kngc32JJx7
         hRte+Fi9sDpQkPDwO8XBwlQllqIegPYHDjSwZB9yLuhTRH+iK+LBHGN94NO8Xjq4n4Np
         a1s4PwlEU9Yp67atYtwe8mErQ/9gCkgCq1E728USdqsw9Ijr5TDWPA7+umB/F69+ZY9j
         zFBy2cRXexZo0l3qSu7A2xb8HE5GtGdkDql868RrMhXQ1oLrx832r58LH2N5+2S516Rp
         83FGXkOgpTjpOysBsfernAmkl4GtaMR3hTxYtnovMmPypl91mCFQp9eBaQBUKt6vCPxz
         HCwg==
X-Gm-Message-State: AOAM531heI/MVVTH08D/WX7NAqgJsfjynpf27RKXnrUzbNYxbeO9bFqM
        xXAlhlyUEa8swtJCpKYu1LY=
X-Google-Smtp-Source: ABdhPJxdvHjyW1S6IJu4lKEm4wCrkvW18Is9Q5lv7Ud1JBPw7HJsExv0RfZ2fXsCJaCXIvmLK6wIrQ==
X-Received: by 2002:a17:90b:33d1:: with SMTP id lk17mr11864501pjb.174.1607666162740;
        Thu, 10 Dec 2020 21:56:02 -0800 (PST)
Received: from google.com ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id u12sm8079376pfn.88.2020.12.10.21.56.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Dec 2020 21:56:01 -0800 (PST)
Date:   Thu, 10 Dec 2020 21:55:58 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Sergiu Cuciurean <sergiu.cuciurean@analog.com>
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        michael.hennerich@analog.com
Subject: Re: [PATCH v2] input: touchscreen: ad7877: Use new structure for SPI
 transfer delays
Message-ID: <X9MJ7gu67h/rcCfP@google.com>
References: <20200227130619.28142-1-sergiu.cuciurean@analog.com>
 <20200228104508.15564-1-sergiu.cuciurean@analog.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200228104508.15564-1-sergiu.cuciurean@analog.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Feb 28, 2020 at 12:45:08PM +0200, Sergiu Cuciurean wrote:
> In a recent change to the SPI subsystem [1], a new `delay` struct was added
> to replace the `delay_usecs`. This change replaces the current
> `delay_usecs` with `delay` for this driver.
> 
> The `spi_transfer_delay_exec()` function [in the SPI framework] makes sure
> that both `delay_usecs` & `delay` are used (in this order to preserve
> backwards compatibility).
> 
> [1] commit bebcfd272df6 ("spi: introduce `delay` field for
> `spi_transfer` + spi_transfer_delay_exec()")
> 
> Signed-off-by: Sergiu Cuciurean <sergiu.cuciurean@analog.com>

Applied, thank you.

-- 
Dmitry
