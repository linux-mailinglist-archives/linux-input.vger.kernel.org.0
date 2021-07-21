Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09DA93D1A38
	for <lists+linux-input@lfdr.de>; Thu, 22 Jul 2021 01:10:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230443AbhGUW3X (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 21 Jul 2021 18:29:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230410AbhGUW3W (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 21 Jul 2021 18:29:22 -0400
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com [IPv6:2607:f8b0:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C889C0613C1
        for <linux-input@vger.kernel.org>; Wed, 21 Jul 2021 16:09:58 -0700 (PDT)
Received: by mail-oi1-x22a.google.com with SMTP id h9so4656634oih.4
        for <linux-input@vger.kernel.org>; Wed, 21 Jul 2021 16:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=Gihwn3u1CA//Y2FYO8sjHJoK0E6zkWWxZ3vwSmM/v80=;
        b=aJRfQbI/2/h8CVGj+mkdHCYttV3qiqpfue/bLp7pwQd09k1Wc8dV5R1FdMbgJZ4syW
         2LWPtD2HMiCtno1IaEKN+y/hHcpifhqPKCIAieTdWo4sex5pWN417mHwF+VeycneYPCc
         Gdd0IDu2YDEKHIOvx+dbo7Ulb/wR/5mbcWip4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=Gihwn3u1CA//Y2FYO8sjHJoK0E6zkWWxZ3vwSmM/v80=;
        b=NM24uxoqVPN9SdnxsrgJ+dUHmfcHK1dCdUD6zXngyFIz4eG5KMdR2UE833JXtznBvr
         ++m0t2GOdekF8mLfo4zXmUEG0vKKojGlLUai3bai/fUpcjdtzwMB3jgfyl9LoJ5nCzXA
         9SCHRYJ2OtopP6HAYOpT493wsLnJSHVWjB5LvnJK3l7dE02zlExlUxoblYcZLsRUZCKn
         4fk/6HfyHmY/ICtWyA19l2cTV90AS3R5Ade1vyzGITL3hlLuNC54sjZcWOBSbnL4+kM+
         4vpBPhPcW7CdPAEgF1Vle1gGwExSMA1U/HchRMImVxct8/GNvLPjS+XTRJB1zqNwH74b
         6Gpg==
X-Gm-Message-State: AOAM531bMcUQ1ys8TaIgOvJ+1u4n4cslnZXUeybSER2yAEoaXMUx8hnL
        cjfHIBcsDisIwq11IN9lNkwfLfLgCisIrAreGkTDqA==
X-Google-Smtp-Source: ABdhPJw8OL85ER3w5f08dIQEicAAKoExCiSYkzd/2jMw4Yf82GfH2ONsrDXtaqrVRIu15hsL51z9+WRkyKsvws816aM=
X-Received: by 2002:a05:6808:114a:: with SMTP id u10mr7388998oiu.19.1626908997559;
 Wed, 21 Jul 2021 16:09:57 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 21 Jul 2021 23:09:57 +0000
MIME-Version: 1.0
In-Reply-To: <1620800053-26405-2-git-send-email-skakit@codeaurora.org>
References: <1620800053-26405-1-git-send-email-skakit@codeaurora.org> <1620800053-26405-2-git-send-email-skakit@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Wed, 21 Jul 2021 23:09:57 +0000
Message-ID: <CAE-0n5315FfpLBp3X1AGunHExTeJ3dE6YN=gRUCv+p10dpGDpA@mail.gmail.com>
Subject: Re: [PATCH V4 1/5] input: pm8941-pwrkey: add support for PMK8350
 PON_HLOS PMIC peripheral
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

Quoting satya priya (2021-05-11 23:14:09)
> From: David Collins <collinsd@codeaurora.org>
>
> On Qualcomm Technologies, Inc. PMIC PMK8350, the PON peripheral
> is split into two peripherals: PON_HLOS and PON_PBS.  The
> application processor only has write access to PON_HLOS which
> limits it to only receiving PON interrupts.
>
> Add support for the PMK8350 PON_HLOS peripheral so that its
> KPDPWR_N and RESIN_N interrupts can be used to detect key
> presses.
>
> Signed-off-by: David Collins <collinsd@codeaurora.org>
> Signed-off-by: satya priya <skakit@codeaurora.org>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
