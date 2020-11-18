Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7F432B7329
	for <lists+linux-input@lfdr.de>; Wed, 18 Nov 2020 01:34:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727391AbgKRAdc (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 17 Nov 2020 19:33:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725767AbgKRAdb (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 17 Nov 2020 19:33:31 -0500
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0922C0613CF;
        Tue, 17 Nov 2020 16:33:31 -0800 (PST)
Received: by mail-pl1-x641.google.com with SMTP id l11so47267plt.1;
        Tue, 17 Nov 2020 16:33:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=3YnzFhuriT1u2qd6o9Ro/pkfTVdzzLt9x8ZF1CF/qnA=;
        b=RbwMkj2q24avAvO2XuXCvO8epPCvLzPfZP/LcZ1gPnGBLQVrsk0LsiCIZw2cIZbBOW
         d5OrTpWePJKIr4vlpjf/fr8FLIiFMSqB5W6cSgR0jjD5ovsa1EGH7YBEE0k7ihwV0oDP
         jmAzLtgGMiW1hWj5lttPYZxSfNeoLH/QYgaPLIhQES9BoRprFrssQxqpyntYkOadzSht
         dvNBmN5zmaq9Uw6SIHdLxL8k8F6eNMNkzd0Jt15YY/h8nR5G4P41nhtPgMpIUvoWgMyO
         dBISMLQhnc2f7wtVTfHCb5j6S1vkaVJAEMYgwrv34XL95Vmf4wX+HOrnA9QYxhkgbv4H
         HcoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=3YnzFhuriT1u2qd6o9Ro/pkfTVdzzLt9x8ZF1CF/qnA=;
        b=RNpHEKCEnDUguGjhQZAetdFG7oGSvDPrl6ryrvtErPiSbZqtxWiwdCJfrl+FeqjQyz
         IcPds4ajDgjfoY0lpT4uykrlyAnzlzzMnd7R/Od8V6jRaEy7FzR1XjkNV5pu9K3+9VKd
         9uu4i2ryvMqie7jf5RBMpHRp3jsZXMEqWcxHsZii+0Tj4vZtLSThYw131Vo6b0cgFgE8
         yXLlkvOUvDz/hAhS1if4r1+HLVCpCav3eDb9N7VDLm+CZhaAuPi1FqfMDxaO1pvjfRsM
         G31QFp2LtjS793FblZESCFuXzcczsnwnrPZLhdAFSNehYPtgOwj39ARflXX0epw+FHki
         nGhw==
X-Gm-Message-State: AOAM532D5l2yCCcmr1xSb+pdGFgLpgZdLFP/FBPIzUEabMJmh/jMoKIX
        4F4XwUgEf0d4ratdoDH/hgA=
X-Google-Smtp-Source: ABdhPJyGZ+JLGwJCDJEd+EbRlOJ25ksG6eM+ifOdNHUswDpdJXjRlObDRc6txkig7tryqi9LaAv1IA==
X-Received: by 2002:a17:90a:5291:: with SMTP id w17mr1443869pjh.129.1605659611167;
        Tue, 17 Nov 2020 16:33:31 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id s6sm24016830pfh.9.2020.11.17.16.33.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2020 16:33:30 -0800 (PST)
Date:   Tue, 17 Nov 2020 16:33:28 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     linux-kernel@vger.kernel.org, dusonlin@emc.com.tw,
        KT Liao <kt.liao@emc.com.tw>, linux-input@vger.kernel.org
Subject: Re: [PATCH] input: mouse: elan_i2c_core: Move header inclusion inside
Message-ID: <20201118003328.GG2009714@dtor-ws>
References: <20201104162427.2984742-1-lee.jones@linaro.org>
 <20201104162427.2984742-7-lee.jones@linaro.org>
 <20201112104420.GG1997862@dell>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201112104420.GG1997862@dell>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Nov 12, 2020 at 10:44:20AM +0000, Lee Jones wrote:
> The same clause as its use.
> 
> Fixes the following W=1 kernel build warning(s):
> 
>  include/linux/input/elan-i2c-ids.h:26:36: warning: ‘elan_acpi_id’ defined but not used [-Wunused-const-variable=]
> 
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Cc: Henrik Rydberg <rydberg@bitmath.org>
> Cc: Jingle Wu <jingle.wu@emc.com.tw>
> Cc: dusonlin@emc.com.tw
> Cc: KT Liao <kt.liao@emc.com.tw>
> Cc: linux-input@vger.kernel.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>

Applied, thank you.

-- 
Dmitry
