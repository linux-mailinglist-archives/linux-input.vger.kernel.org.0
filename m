Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7377541F9A3
	for <lists+linux-input@lfdr.de>; Sat,  2 Oct 2021 06:21:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230059AbhJBEWv (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 2 Oct 2021 00:22:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229520AbhJBEWv (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sat, 2 Oct 2021 00:22:51 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F0C2C061775
        for <linux-input@vger.kernel.org>; Fri,  1 Oct 2021 21:21:06 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id oj16so4601590pjb.1
        for <linux-input@vger.kernel.org>; Fri, 01 Oct 2021 21:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=jXlLrTxcHP/Xa2KowKreJQxd+KXg6whz8IYxbrLHciM=;
        b=nnFr/wpRtdg5P2b499RpGplQb/r7ubSB6xsmJhUWBOqYvJ0Fa4j0xm5wmMHxtMEc6/
         R3UOJDmdHIcQxFLVcHEo9LwAqeZ2IXfqTXn0Lw8H7EleJX1aT7xwdO9WSJUssax4tBBb
         C7PgzgLVuZkeCsRrwvPlSr4CXF4rjUTPZzmisr5bdsIMqxzSGWmQ9ZNtPuc0iWV4f0Y1
         0D07AaD6Rm2iQIA2VTAD7+tcO8s1W5ies6yz+AmRU4lrrunDsX+M0HOXnmn+ZQOElDLK
         /vJexdHaz/vImHtIv3LQnH3ZzWabya9r63+oUu4XIpavSfplo4pGHBmHkfcuvdSwB/HD
         x/aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=jXlLrTxcHP/Xa2KowKreJQxd+KXg6whz8IYxbrLHciM=;
        b=VkNPRr2plmGPHKK8XuXBkK5bS+QlOF/+BaQ+C9OIQgZpyFQ3UQqiyowkqmBe7s/NGK
         GhJrx8A+LZ6heq196UwJifLpAe6tem3/9iG9uLeHiawRI1cUWNwzSgOKgPaPtmuKf4WS
         9avpGJ3e4wUysEm7E/OXuwVwzBezeW3bBNjoievLMhjmir1aMFgSoN7sSuzRMD9SJjJT
         dlgfyhtaGrmXdpDKXd91dmGK/rq21u548QlhU0qnkJ27PeRlwgjpLnoadPIGnqy0jTQR
         vhhlhW9tPQAy215jqH3yJJG8u/XgvAtO4c2xkRrcbL/R753nKag/6kPzBetTyhlekQmW
         Wziw==
X-Gm-Message-State: AOAM532Tvl/kXcK1pfAuIYga/Pmp1INXhpIgHosy8wDdGHWp/8R25/qa
        3YajjjuJos1WGGuv9bsAhhc=
X-Google-Smtp-Source: ABdhPJyPZr9xUPb7skQY18ZhfOLMHTJE5AF2AU6EIQur5AzNe7XdrZH2DaN+YG7VsXwJIullm/gxYQ==
X-Received: by 2002:a17:90a:f013:: with SMTP id bt19mr24406131pjb.98.1633148465577;
        Fri, 01 Oct 2021 21:21:05 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:435b:42e1:fe0a:1117])
        by smtp.gmail.com with ESMTPSA id o12sm7297233pgn.33.2021.10.01.21.21.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Oct 2021 21:21:04 -0700 (PDT)
Date:   Fri, 1 Oct 2021 21:21:02 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Mark Brown <broonie@kernel.org>
Cc:     linux-input@vger.kernel.org
Subject: Re: [PATCH] input: ariel-pwrbutton: Add SPI device ID table
Message-ID: <YVfeLkehn5wHCwQ1@google.com>
References: <20210927134104.38648-1-broonie@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210927134104.38648-1-broonie@kernel.org>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Sep 27, 2021 at 02:41:04PM +0100, Mark Brown wrote:
> Currently autoloading for SPI devices does not use the DT ID table, it uses
> SPI modalises. Supporting OF modalises is going to be difficult if not
> impractical, an attempt was made but has been reverted, so ensure that
> module autoloading works for this driver by adding a SPI device ID table.
> 
> Fixes: 96c8395e2166 ("spi: Revert modalias changes")
> Signed-off-by: Mark Brown <broonie@kernel.org>

Applied, thank you.

-- 
Dmitry
