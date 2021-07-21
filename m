Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74D6B3D1A44
	for <lists+linux-input@lfdr.de>; Thu, 22 Jul 2021 01:12:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230521AbhGUWan (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 21 Jul 2021 18:30:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230513AbhGUWan (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 21 Jul 2021 18:30:43 -0400
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com [IPv6:2607:f8b0:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3F4EC0613C1
        for <linux-input@vger.kernel.org>; Wed, 21 Jul 2021 16:11:18 -0700 (PDT)
Received: by mail-ot1-x330.google.com with SMTP id j1-20020a0568302701b02904d1f8b9db81so3597805otu.12
        for <linux-input@vger.kernel.org>; Wed, 21 Jul 2021 16:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=l6NCsljiQrmdmWs5o+gfYgXEIbXvOSPe/7s85UmcUXY=;
        b=Ng2sdbS+bbOryLSPSyNKeMVAf5mGYfLp6eg3+fKUB/+chx8u8IoRiUVIPGFW4pDqsb
         YJkC6+Tt5wtHSzJ0SR11hqOPDULPmiJEQWqfFrE+b4iQXYA/YMyRDVx6aFRzEgzxgi+p
         EQwWkKFKG2v2uTbDUpIdmioqKXDdBE2JwQrOU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=l6NCsljiQrmdmWs5o+gfYgXEIbXvOSPe/7s85UmcUXY=;
        b=dmduKZJ53IJnJZxW6omn4cxtjocQrgGBfAId37FdEIQhFc8mrf2i6Bb6+7n2VgDu8x
         AHv0vMqx68YtuYioQEZjlxbaKwcN1IG/zvlFkv5LkpyzO8T1liMG1MdxDDWuXiRkRIpx
         gsp5AN79QmC1xBRrWQ2g8j5aoszWmbKBFgkTj8GuX69w0/AzzV+7J8tbqT0nVcg2bnFZ
         N4YL+Nqdw46TKe0oczBad5deTzkgNUe9vs16Fwc5yh7QEImkiu8n+N70qxvZATTWZ1cF
         JonJ+WGDr+ychECWqOv0sDrUV/oxxWNOb7lqws/PzP1A7cVZak2rOI+4j5GlfdR5+i0T
         +GGg==
X-Gm-Message-State: AOAM531s523pfV6jdICeyBq1A4KvbFkHaB85ULs5N2j0XW2Kc6s6WmJ9
        duqSzavAIRlDVpEow3Bpp3Nnc+ia0CITZEG3w1WP8A==
X-Google-Smtp-Source: ABdhPJwuI0iSIKzOgj4iQbbvNukC602d4rDbSTR126JlCcUekJzNHeCuIfzTWkK9MqLlu9vEEjVTu/4CH6znZ33wrLg=
X-Received: by 2002:a9d:1b6e:: with SMTP id l101mr12661331otl.34.1626909078087;
 Wed, 21 Jul 2021 16:11:18 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 21 Jul 2021 23:11:17 +0000
MIME-Version: 1.0
In-Reply-To: <1620800053-26405-4-git-send-email-skakit@codeaurora.org>
References: <1620800053-26405-1-git-send-email-skakit@codeaurora.org> <1620800053-26405-4-git-send-email-skakit@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Wed, 21 Jul 2021 23:11:17 +0000
Message-ID: <CAE-0n50rYuZKa2jXNGUb8oUFsa+zo1Zehqsw9qr1ZXoYQe92pA@mail.gmail.com>
Subject: Re: [PATCH V4 3/5] dt-bindings: power: reset: Change
 'additionalProperties' to true
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sebastian Reichel <sre@kernel.org>,
        satya priya <skakit@codeaurora.org>
Cc:     David Collins <collinsd@codeaurora.org>, kgunda@codeaurora.org,
        linux-input@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
        Andy Yan <andy.yan@rock-chips.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Quoting satya priya (2021-05-11 23:14:11)
> Change 'additionalProperties' to true as this is a generic binding.
>
> Signed-off-by: satya priya <skakit@codeaurora.org>
> Acked-by: Rob Herring <robh@kernel.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
