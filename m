Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E81A03FBE0D
	for <lists+linux-input@lfdr.de>; Mon, 30 Aug 2021 23:22:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237307AbhH3VX3 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 30 Aug 2021 17:23:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230025AbhH3VX3 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 30 Aug 2021 17:23:29 -0400
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F579C061575;
        Mon, 30 Aug 2021 14:22:35 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id q21so9328649plq.3;
        Mon, 30 Aug 2021 14:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Gx+f4gzusOR2tKDAjP+xRdZLA8qcZC7Zt4eF0MKqKkE=;
        b=kSFwC6ghrMGuitpn0a8H2GVELVDGijuc5FFwWEaRdUGP7/BdPnxM5ROqRN4U/LxOhN
         PPuEyeyQ+nEv6NHcrrxQbCHzVCiTtFYWOSqIZticf4p0otUb+TD7srPGdQcxnpE/GOom
         4UtMwfupQ04OQq4CAukW8grcmsNIEeQ3TRv7bm/6yN6BSWcKBGfKqewBA9d6cUmMXJdm
         Y3guRAILw6Vyggnk6alt3aNyvv8BNC/hkh7Kd/8ADnDFQijgSgji9w6ywK1KOl607p3i
         jRvtCDwR0d6lEBC5ZrrJ/WsqBcdmeOYQcq7Diiub9UZC7Zrw8fhLkHkTAXnDiLZvQBrr
         hHvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Gx+f4gzusOR2tKDAjP+xRdZLA8qcZC7Zt4eF0MKqKkE=;
        b=ntmogueqS2uYC0Pw6qZnC1ee9n+QeL4xbyRMrJACN/a0l1QCFEBZg+ZNeESboKk8eP
         hTrwtZAgJoVF2irKu0SEQfyuepFe/4N6chUYC1ryjdpMGJiZHW9rigJ3OivW4IgatSS0
         4kva85W/WDh1brja4AjxMsjYoK8szmpl2AXXgksX62n4RMceetRS8QnHaBydbBZLzgDh
         /QnziYdjtBMJ4EuhmUJ+cWN/9moPNjbqblBk+cYVslWom/bB50++v7fldJkS3HdyWFTa
         20ZCETr4vXxu/bwc1eYtBaGh8cQ97Pb+O+tv9Ct4X27MpHBTc7fpbPqCHiqA1CV2rPvi
         frNQ==
X-Gm-Message-State: AOAM531HQ2I2PBWXPNhbNZEl9wcYBiGQjKDoHj6G3RDnBTkGAC6fYYll
        OOBIXxfTaVpUJ2X+fWdSnokpt7Forco=
X-Google-Smtp-Source: ABdhPJyHyA632gLgZPODsAAy+mqta2nstfTR1ytg9szYz7gZ7lFT/QHuZ9+oomn8TCRoe5BsEf/5tQ==
X-Received: by 2002:a17:90a:5b0f:: with SMTP id o15mr1174799pji.97.1630358554604;
        Mon, 30 Aug 2021 14:22:34 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:771a:afc8:2e96:23dd])
        by smtp.gmail.com with ESMTPSA id v6sm8417193pfu.0.2021.08.30.14.22.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Aug 2021 14:22:33 -0700 (PDT)
Date:   Mon, 30 Aug 2021 14:22:31 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc:     linux-input@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] input: remove dead CSR Prima2 PWRC driver
Message-ID: <YS1MFw+WTXk/6o2A@google.com>
References: <20210817072842.8640-1-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210817072842.8640-1-lukas.bulwahn@gmail.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Aug 17, 2021 at 09:28:42AM +0200, Lukas Bulwahn wrote:
> Commit f3a732843acc ("ARM: remove sirf prima2/atlas platforms") removes
> the config ARCH_SIRF in ./arch/arm/mach-prima2/Kconfig.
> 
> Hence, since then, the corresponding CSR Prima2 PWRC Driver is dead code.
> Remove this dead driver.
> 
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>

Applied, thank you.

-- 
Dmitry
