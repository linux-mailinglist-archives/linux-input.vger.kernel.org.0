Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 702A2DCEA7
	for <lists+linux-input@lfdr.de>; Fri, 18 Oct 2019 20:48:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2634586AbfJRSsT (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 18 Oct 2019 14:48:19 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:33059 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2634584AbfJRSsT (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 18 Oct 2019 14:48:19 -0400
Received: by mail-pf1-f193.google.com with SMTP id q10so4433010pfl.0;
        Fri, 18 Oct 2019 11:48:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=GhekFAP9STOj7Nck5xlc736VlW5iBvMLqnVMOxCxKvk=;
        b=nq7ifkSWIToa5I6g+4rLSg8PHDlLTw6sVriPzMqwLyL1U5F8+028XAzlRa/udM37u2
         IhA0UyYp6F+7ywfOdfaNWxQCMTMOWuL8HtxDQEhuCxw2TfjeU/1gdW7t93bK+VDfAcTg
         pfo6iiwkuaTPalYjOaazTni3qU5XLRdsfiyDPqItneeA0bQXnbaHtFuw8iRGNjF39B4W
         lt5QbWDbHM+8WrHSoEaeDZEsnNjlqC5r2UARp1vfD9y8vj6/yXwpuuBlqOTTfDzBXDs9
         +FfX0SLtOMSWhq1Ah85J0QQWGmRg77zVUbZGDPG1IKY0ugY8WtqD7mvAONygnf9oMrZb
         NTTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=GhekFAP9STOj7Nck5xlc736VlW5iBvMLqnVMOxCxKvk=;
        b=WT39LAVeVDYkaZzBN+leNcOM+/EUZNhZgolBo1DTzveRAfusSAv2OT8cPilHv63O2Z
         fbt47K9vKtahZ3l4aOEKdfK744qoK5xVu33E6VQH2R0TTjKiWyfn38hISlHwl3ddj8j3
         p2h0vnN7W3k80WIYHJapHal7hsGOKSO1Y532yqbj/dufCmCdkHjdDxCfArV3wEwKFOb0
         RIZo8iwFObFDKHdjE53KZddYM9WhpVBI8kOqR8BgYIF8vFehRV8z4b4aBLjOZEAoFREL
         zIPDWxJ9MPu307WgzEh8fYvBQTKRgIzhkOlQ9kLdf1STA/6tAwpdGl87QSKlCXAqJqXA
         TOPQ==
X-Gm-Message-State: APjAAAWu32/xOh4fFSqMwpHLpJJF2UeOuneuBtIcBGc7Ja6xO9eKuwo+
        1lrl4qIbp61LlwFE/ftYc30=
X-Google-Smtp-Source: APXvYqwsgKLXB40xjU+zPd0jglpCieWEDSonZkG9+b++J833wiGysvtehr/Wkf0Gua652wYqwRTXxQ==
X-Received: by 2002:a63:1511:: with SMTP id v17mr11529604pgl.34.1571424498309;
        Fri, 18 Oct 2019 11:48:18 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id u5sm8212572pfl.25.2019.10.18.11.48.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2019 11:48:17 -0700 (PDT)
Date:   Fri, 18 Oct 2019 11:48:15 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-input@vger.kernel.org, alsa-devel@alsa-project.org
Subject: Re: [PATCH 29/46] Input: touchscreen: use wrapper for pxa2xx ac97
 registers
Message-ID: <20191018184815.GP35946@dtor-ws>
References: <20191018154052.1276506-1-arnd@arndb.de>
 <20191018154201.1276638-29-arnd@arndb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191018154201.1276638-29-arnd@arndb.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Oct 18, 2019 at 05:41:44PM +0200, Arnd Bergmann wrote:
> To avoid a dependency on the pxa platform header files with
> hardcoded registers, change the driver to call a wrapper
> in the pxa2xx-ac97-lib that encapsulates all the other
> ac97 stuff.

Not supper happy about adding module dependencies. Can we include
mach/regs-ac97.h from include/sound/pxa2xx-lib.h and use static inlines?
Someone needs to include mach/regs-ac97.h in the end...

Or there is something later in the series that needs it?

Thanks.

-- 
Dmitry
