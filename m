Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A31CA2FC7C2
	for <lists+linux-input@lfdr.de>; Wed, 20 Jan 2021 03:27:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729314AbhATCYl (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 19 Jan 2021 21:24:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730769AbhATCYb (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 19 Jan 2021 21:24:31 -0500
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC4BBC0613C1;
        Tue, 19 Jan 2021 18:23:51 -0800 (PST)
Received: by mail-pl1-x631.google.com with SMTP id be12so11675715plb.4;
        Tue, 19 Jan 2021 18:23:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=xmb/QGSszCboohUtICM5WMzWhCbKBKBMNNZfMQrtTEw=;
        b=KHizKBsTWR0vu0sZYpJFMTTI2nV802unlbr7YwSoJAd01GQBJ9AuBwM4mQBCjHlQE8
         y1E+oglEPPbUkBBPleq3GyojbjCFYT9YxMbIYGVUkWsOTiLi6XHyZCRV/HcbHEjTcp9x
         m+vuikisq+j/fsEE3lboEADYeeU5KoytIj4+Eez3qwLUDdKoo7AWTkzfgFUqeQ0QLOo7
         kywuK/Q7K2+Qn33WlSMH9gQk8XFr4/e/yVAp6boLtQhp6kCqW9ELUJv7oSOHJRB/oHaM
         zgN2j0INSg+ODGVZDu0XGDWxhye518znTbBESDSLh4+808fNPuLzWOG1AMg1zymOTSvC
         uSJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=xmb/QGSszCboohUtICM5WMzWhCbKBKBMNNZfMQrtTEw=;
        b=LW5v0hpSfznWv42y4wKOQ7IlNWPofuI0cZHU0qSrj3OWSnWUA7lFnLTvDCZQAdK/Bd
         f8EV4uIYO089YX8QuJwF0vxr1+fNHcPqDv+Sc/2HbYm0VNIBIsUCZaworJduhyDSbJNZ
         7CawpFhDD5xLS2AyGUZu2b+szPUuSE9BLD1XL7BoEMcY02ay9BedsYNO/NRLZMa5GqvP
         96jelxn3PJNkXpim+kRMFGE7jYqHDdNMmNOytF6qJSX7JvNFaJCG16aGHf+rh7baczbg
         CrCWpmyVp2v0iZqJg38EzuAtxo54A5MzRVANpqJtcn3UlWir4Vm5g38Yc/78hVpxnek2
         zeDg==
X-Gm-Message-State: AOAM530ZrJxFmXL2lTEX2kSuJu9kftUATwEFzwnDJvGQAC8jEK5DDCKQ
        gtkTRLii/jBmr3p6Djfy/Mg=
X-Google-Smtp-Source: ABdhPJzMeEwi5uckhFp2vbcMPklFF83b3iHDCur6cilHgj+nzivjlKKCxmqLOtlZ0sOIcidridwkDQ==
X-Received: by 2002:a17:90a:414d:: with SMTP id m13mr2952460pjg.229.1611109431254;
        Tue, 19 Jan 2021 18:23:51 -0800 (PST)
Received: from google.com ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id d22sm256009pjv.11.2021.01.19.18.23.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Jan 2021 18:23:50 -0800 (PST)
Date:   Tue, 19 Jan 2021 18:23:47 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     linux-kernel@vger.kernel.org,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Stefan Riedmueller <s.riedmueller@phytec.de>,
        Luotao Fu <l.fu@pengutronix.de>, linux-input@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 5/5] input: touchscreen: stmpe-ts: Add description for
 'prop' struct member
Message-ID: <YAeUM+x1fCPiQ0aX@google.com>
References: <20210114152323.2382283-1-lee.jones@linaro.org>
 <20210114152323.2382283-6-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210114152323.2382283-6-lee.jones@linaro.org>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Jan 14, 2021 at 03:23:23PM +0000, Lee Jones wrote:
> Fixes the following W=1 kernel build warning(s):
> 
>  drivers/input/touchscreen/stmpe-ts.c:82: warning: Function parameter or member 'prop' not described in 'stmpe_touch'
> 
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Alexandre Torgue <alexandre.torgue@st.com>
> Cc: Stefan Riedmueller <s.riedmueller@phytec.de>
> Cc: Luotao Fu <l.fu@pengutronix.de>
> Cc: linux-input@vger.kernel.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> Cc: linux-arm-kernel@lists.infradead.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>

Applied, thank you.

-- 
Dmitry
