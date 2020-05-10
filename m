Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E7FC11CC6FF
	for <lists+linux-input@lfdr.de>; Sun, 10 May 2020 07:25:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725810AbgEJFZd (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 10 May 2020 01:25:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725786AbgEJFZd (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 10 May 2020 01:25:33 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CB93C061A0C
        for <linux-input@vger.kernel.org>; Sat,  9 May 2020 22:25:33 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id y6so6171266pjc.4
        for <linux-input@vger.kernel.org>; Sat, 09 May 2020 22:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=RaoWl9SwPAPcYQTjdaPxrnLzJ/T4pZWtkjLmj4TKpHc=;
        b=pF/EVzTjVcGucdGogWgh8aIf8a5705wH0iv10z5We6XpkSKYJHpCipzMfMBZG/p1r6
         L0DpLpU9He5wzLeaYW7dtCtpHnFuW/sndYfJVqL2d3a2HogJym0XpYHt0uJFIOlEKDyO
         kZYk4m28+EqLtrxjCJyxP1fJGruextIR+5UX0eVb0XxRRxsmXb0MqBYEsb3N6bpfAhms
         +QZLqRVNRlTVIuzne9OVD0ELv3fwwvHkbYqS3oWmiTEW9r4ke4zm344ry5bjRcuVS99p
         irg0sg44pzQXSpzKNX3nIxsRYQFKQHEYjNnBO6P5E3wVrHVT5kxfS2WhvHERlfmMDxKh
         s0VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=RaoWl9SwPAPcYQTjdaPxrnLzJ/T4pZWtkjLmj4TKpHc=;
        b=e+rf8sdjHmukPJoQDvZSCpQfJziMdpZPPWNmC1SypUDIKan1XI9qOIti7uYbVYoNBr
         LlO91H3wx24O7ad5r0eCzvOILo6ZhggfJZUGGm/DhP9cyB3rNWlklsubXBNbWDU0PxLt
         8+KSnq5kR430mls++89g6vbchSoVLBAwdN/OGWHHxzycg9amK2xhtnJAeIijbqkvGNfD
         R4xucePAfxYweko/ZnLBkEuKcG+kgcCmrKrQoACFWMayxrc6ONF+x2BNt/iqzoBHBOx2
         6irN+OfB+XT1Ax/5eNNegLSqzZkwg4Yo8S0CTghYnTQ+e9iPkM0L0kgMKTTwQvlDZq2v
         u0rw==
X-Gm-Message-State: AGi0PubAzkdH66NioBc2+DTL/cY+TkUukFNRE80e7p9Jrd0fdyK1iVW7
        khODDsDlxZ0mdjf3rF/9rg0oxQuV
X-Google-Smtp-Source: APiQypJKtpPWTBc0hiYaRX8/Nc6OsFF0FZKT5xylFfLVoAG2tezry9DJ6WlAzKL7Z+fqLFKMM0v7gA==
X-Received: by 2002:a17:90a:bc8b:: with SMTP id x11mr13985743pjr.220.1589088332399;
        Sat, 09 May 2020 22:25:32 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3c2a:73a9:c2cf:7f45])
        by smtp.gmail.com with ESMTPSA id a142sm5973371pfa.6.2020.05.09.22.25.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2020 22:25:31 -0700 (PDT)
Date:   Sat, 9 May 2020 22:25:29 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-input@vger.kernel.org, Henrik Rydberg <rydberg@bitmath.org>
Subject: Re: [PATCH 2/2 v6] Input: cy8ctma140 - add driver
Message-ID: <20200510052529.GR89269@dtor-ws>
References: <20200506123435.187432-1-linus.walleij@linaro.org>
 <20200506123435.187432-2-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200506123435.187432-2-linus.walleij@linaro.org>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Linus,

On Wed, May 06, 2020 at 02:34:35PM +0200, Linus Walleij wrote:
> +static const struct of_device_id cy8ctma140_of_match[] = {
> +	{
> +		.compatible = "cypress,cy8ctma140",
> +	},
> +};

This is missing the sentinel entry, I added it and applied.

Thank you.

-- 
Dmitry
