Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CCEEE268521
	for <lists+linux-input@lfdr.de>; Mon, 14 Sep 2020 08:51:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726042AbgINGvZ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 14 Sep 2020 02:51:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726039AbgINGvX (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 14 Sep 2020 02:51:23 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7AD9C06174A;
        Sun, 13 Sep 2020 23:51:23 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id a9so4965721pjg.1;
        Sun, 13 Sep 2020 23:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=p2zmhweX1z0dNfm8y+V4dmpOWaiz24f2OWgMEDZh9Uw=;
        b=JA5RE3JQFRWUgky8bJ++/ylRWzlPa795/PoQp/GRAeY4zRe6dd/gikgApfrvM77ZP9
         VE+8eQaBsHwiNNkVKrfLpxJqobDFgUdczaEsEEMyie174TMmKaeMekVJ3QsL0dr9neut
         qstvoZZTvLr/82mboW3vQB0YExvKiE8OCEtQKartUtpYc/kSB6XOl1tKvEn6rjLjqS/j
         5wVKOAmv04YnXbH5ssOLxESOEY1fkldO3p7bZcYSCAufq8b1WNQSGE7Mgvjka09TPH5T
         t2T4SVlSENRfvz73UrzVwzErY9qQej+LL/MhvNyVlmzH5ewVH6Gwx30Pw6keYPtxm94T
         GElw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=p2zmhweX1z0dNfm8y+V4dmpOWaiz24f2OWgMEDZh9Uw=;
        b=oJIpYQS4D/DieiCesjelq+SbY0ZYq/1P+LAvN0TGI/lRDQ5fGcah1Flf+Uuq/snroo
         +ophZGuUaZ4O+Wc1BXF9hnIYYCNH1f+xqiguAK9uUP9K/uOEkSc7b8A0ixdpY6amfCh7
         FAEiC1qfB5N4+pDt53osWIrNXE1DvYJnIYTX+evCd/9V36TjUsAXXZYJ3+QqWAfMTlO4
         8ilCfUyMVugw66649c3MZfdNm7OxDfDiFsHmy+63L+EPsiVocXc90mOfx7LJZgxqIOP8
         ejP6z68Gvv3WJsea3/z2dI42nKbYoRV5zFolvrDfNUssOLLmC0ZIU7WcfcXlc4AEBYez
         DGLg==
X-Gm-Message-State: AOAM532cpxoqfQdC7ZqLr/aJ+NQj9L3Q2NHxrm9Ygrp613/bZYw31eJP
        3cC6jTJNqykP0PvXlTiWdx82jXMHSIA=
X-Google-Smtp-Source: ABdhPJwWQWUWdJOIsiYLs+DGdeyQF4Qu/H4TexwkwBK7MatQTCrW9RF8gSna/yxW0MIsFq4stO8QnA==
X-Received: by 2002:a17:90b:317:: with SMTP id ay23mr12523401pjb.68.1600066282946;
        Sun, 13 Sep 2020 23:51:22 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id x5sm7437688pgf.65.2020.09.13.23.51.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2020 23:51:22 -0700 (PDT)
Date:   Sun, 13 Sep 2020 23:51:20 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/4] Input: ep93xx_keypad - Fix handling of
 platform_get_irq() error
Message-ID: <20200914065120.GR1665100@dtor-ws>
References: <20200828145744.3636-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200828145744.3636-1-krzk@kernel.org>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Krzysztof,

On Fri, Aug 28, 2020 at 04:57:41PM +0200, Krzysztof Kozlowski wrote:
> platform_get_irq() returns -ERRNO on error.  In such case comparison
> to 0 would pass the check.

platform_get_irq() is a bit of a mess. Historically we allowed defining
interrupt resource with r->start == 0 and for such cases non-OF non-ACPI
code will return 0 from platform_get_irq() to indicate that IRQ is not
assigned.

We either need to stop doing this in platform_get_irq(), or the
conditions in this patch and followups should be "irq <= 0" and we need
to make sure we do not accidentally return 0 from probe ...

Thanks.

-- 
Dmitry
