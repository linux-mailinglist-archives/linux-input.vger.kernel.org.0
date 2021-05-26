Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E75839237A
	for <lists+linux-input@lfdr.de>; Thu, 27 May 2021 01:57:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234172AbhEZX72 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 26 May 2021 19:59:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232270AbhEZX71 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 26 May 2021 19:59:27 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2442C061574
        for <linux-input@vger.kernel.org>; Wed, 26 May 2021 16:57:55 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id g24so1702322pji.4
        for <linux-input@vger.kernel.org>; Wed, 26 May 2021 16:57:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=OVPpvjEOC9VMO2jtSAI9/Z21VdZ80NdjWnjfgpeEhxs=;
        b=Qtly+GcV438WS01vgXzzl3IQZNwDtdZ+xGu0mdxpbFU7VnwXXU22/3FRym+YsEDMpu
         rnWsjAP3opsvbL8i/PXiUMNyOKSxz2H6x3/3jOcyBsmwRYt4jgSoMtkln7TscuQ6rZel
         vg6Yq9bcuPq95Opp/hGMuGp7J6RRF7w95OPHYgEyatC3cqGvL1BHZF+EtN6xDd0nnkb3
         ogsHnBwD1c+ueElk1CBq6MiGJu+0v9TUazAitoE4oKo1hOV2RqMapX68gf/aghHDAUOJ
         7Sbqaw4Fpzmyy8DIuW6TN/F9nGlaarPjSh9Bs50o4Wk+QudQ3qwG38Uc5dYYe7adedHm
         kc5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=OVPpvjEOC9VMO2jtSAI9/Z21VdZ80NdjWnjfgpeEhxs=;
        b=kfLd0FttjxD6M+C20UoyT1nIKj65qIzeU9mZViruFYwlNLqL+iwWDmYpioQ0FpGRTp
         kRdG94mfj+xcGcEv4hd+jK2OHuqIqYUcGdjRFV915IH29BxvdCmLfP8mZKTxeFkLjuo6
         4l2x/3fPgRsOewXSkmyoTxDXWeWFyMmhUDAM2ZxGUHId//H96FUtMYfLEa/AS0NdOMmq
         G0uoFuWKej/rGyOrQa4nl25+0AGtrAZ1iBYi1in8x1IYVCDzZFcYcpbty7/H+KtD/KCP
         yQx4ANw8+18Emd8Dwu73YL8gNZ2ZzWtAW4CiE+N1M4p/KKgeY2kNRFkN1kuOtllGUSF9
         RBHA==
X-Gm-Message-State: AOAM533ArM0dPlOdqKwym4m4yCAK+MUEgJSIwZuPqM11fqas3lL+WmlT
        04yolVdp6fGNWbxYAmSK6zc=
X-Google-Smtp-Source: ABdhPJwnxvdnEZuE6iGrt1/C+lmE5hJkzmdEywp1S176SDVLO1m2rnA3+Kus4zhhpKf20R/VCXp2/A==
X-Received: by 2002:a17:902:d4cd:b029:f5:4ec0:d593 with SMTP id o13-20020a170902d4cdb02900f54ec0d593mr632375plg.19.1622073475366;
        Wed, 26 May 2021 16:57:55 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:2eca:168c:3933:43bc])
        by smtp.gmail.com with ESMTPSA id x187sm269119pfc.104.2021.05.26.16.57.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 May 2021 16:57:54 -0700 (PDT)
Date:   Wed, 26 May 2021 16:57:52 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Javier Martinez Canillas <javier@dowhile0.org>,
        Henrik Rydberg <rydberg@bitmath.org>,
        linux-input@vger.kernel.org
Subject: Re: [PATCH 3/3 v6] Input: cyttsp - Obtain regulators
Message-ID: <YK7ggK9drlrq0F88@google.com>
References: <20210526230352.1433537-1-linus.walleij@linaro.org>
 <20210526230352.1433537-3-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210526230352.1433537-3-linus.walleij@linaro.org>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, May 27, 2021 at 01:03:52AM +0200, Linus Walleij wrote:
> The CYTTSP TMA340 chips have two supplies: VCPIN and
> VDD for analog and digital voltage respectively.
> Add some minimal code to obtain and enable these
> regulators if need be.
> 
> Reviewed-by: Javier Martinez Canillas <javier@dowhile0.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Applied, thank you.

-- 
Dmitry
