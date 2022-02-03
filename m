Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 382EE4A8FB5
	for <lists+linux-input@lfdr.de>; Thu,  3 Feb 2022 22:20:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354628AbiBCVUq (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 3 Feb 2022 16:20:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348952AbiBCVUp (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 3 Feb 2022 16:20:45 -0500
Received: from mail-oo1-xc31.google.com (mail-oo1-xc31.google.com [IPv6:2607:f8b0:4864:20::c31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 579F2C061714
        for <linux-input@vger.kernel.org>; Thu,  3 Feb 2022 13:20:45 -0800 (PST)
Received: by mail-oo1-xc31.google.com with SMTP id v10-20020a4a860a000000b002ddc59f8900so2668386ooh.7
        for <linux-input@vger.kernel.org>; Thu, 03 Feb 2022 13:20:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=y95VeXJpx3vOoeikTCD1Ve6P/I02Gee/QGrE9GHvt58=;
        b=Hwy8ON0gG1kh+ZTpl33LE55dFkF7cMNSwBU+IDKTLPfYa6tqKfxAJFe49sUn0vO69V
         JPT2hu3wAB/ef+R0ClcvvjISRSyq2uTNpGXa+bFl/FjuCt8XJjsJAxlbUoUq0mzQ4hxH
         ni2gqqiJcNw/QkcHZMICYFkXaggG4jeMSMk1s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=y95VeXJpx3vOoeikTCD1Ve6P/I02Gee/QGrE9GHvt58=;
        b=Xy0voiRRikzTQeTAP5dHX8vrD095z0aetlb0yoyvtDcFX2VL9ILhrvPi3CbEImGqlN
         3ypSrTZlMb+Z8Y4Mej6s5ZLySRa81mdlO4uHwoXM27Tw7syry8rIwTeB/rJ/3brywgu9
         Hx3jwR1TEykgkNbw47CwB1SA+wTs4iT5IA5dVttQewhcGqcKkXWfQH727uc/q5JepGhj
         Xbc4ZoWeKlx11W+7t4wh/H2SDD73OCItCboz3qeig8yR7FcLivzvnD3Y2Bv4CWKG8rlX
         fp0Oydr2J1UOIOh863J2mHVFIAp91H2yNqclTw8sUB7v1nntI/e1PhWXX0IZ1LiwBOIN
         XE/Q==
X-Gm-Message-State: AOAM5329EWv16sRJwiSjshhHEf9qpLx/ND1v8+/j3YUKMSvejIwmZ8hN
        NIo/shryvIX4opGdPzNHMlrQXiw2mKaUAOUULXjqH5stWr0=
X-Google-Smtp-Source: ABdhPJwCeGS8kNr/2zxHh1m/MtXFFZAELvD42aHlsAqE89sWlAEPmMLPDGJyD6Q/Q0dnBmicx6SdIjBi35DJeMNhhJE=
X-Received: by 2002:a05:6870:6256:: with SMTP id r22mr1865oak.8.1643923244734;
 Thu, 03 Feb 2022 13:20:44 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 3 Feb 2022 21:20:44 +0000
MIME-Version: 1.0
In-Reply-To: <20220203010804.20883-4-quic_amelende@quicinc.com>
References: <20220203010804.20883-2-quic_amelende@quicinc.com> <20220203010804.20883-4-quic_amelende@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Thu, 3 Feb 2022 21:20:44 +0000
Message-ID: <CAE-0n51WVcbvgRrbi84JWDYAciXrz0LyHHym2VLXhiz_hoX7sg@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] input: misc: pm8941-pwrkey: add software key press
 debouncing support
To:     Anjelique Melendez <quic_amelende@quicinc.com>,
        dmitry.torokhov@gmail.com
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, collinsd@codeaurora.org,
        bjorn.andersson@linaro.org, skakit@codeaurora.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Quoting Anjelique Melendez (2022-02-02 17:08:07)
> From: David Collins <collinsd@codeaurora.org>
>
> On certain PMICs, an unexpected assertion of KPDPWR_DEB (the
> positive logic hardware debounced power key signal) may be seen
> during the falling edge of KPDPWR_N (i.e. a power key press) when
> it occurs close to the rising edge of SLEEP_CLK.  This then
> triggers a spurious KPDPWR interrupt.
>
> Handle this issue by adding software debouncing support to ignore
> key events that occur within the hardware debounce delay after the
> most recent key release event.
>
> Signed-off-by: David Collins <collinsd@codeaurora.org>
> Signed-off-by: Anjelique Melendez <quic_amelende@quicinc.com>
> ---

Is there a Fixes tag that should be here? Is it a new problem with newer
PMICs?
