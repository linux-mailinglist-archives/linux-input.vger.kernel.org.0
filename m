Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0177949EE26
	for <lists+linux-input@lfdr.de>; Thu, 27 Jan 2022 23:38:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242188AbiA0WiS (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 27 Jan 2022 17:38:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241601AbiA0WiR (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 27 Jan 2022 17:38:17 -0500
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com [IPv6:2607:f8b0:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD0CDC06173B
        for <linux-input@vger.kernel.org>; Thu, 27 Jan 2022 14:38:16 -0800 (PST)
Received: by mail-ot1-x336.google.com with SMTP id d18-20020a9d51d2000000b005a09728a8c2so4021053oth.3
        for <linux-input@vger.kernel.org>; Thu, 27 Jan 2022 14:38:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=aWR05E2RbmTNpLCVEo/Nlpzpd++Ks+Sv/wViyuVZ2Rg=;
        b=kr3dWMmJobBg6sNZ1ICv7/u1CP5GdbsvIczxiNurwvUB1VlunPRxvusxmu5XNwGTSp
         iPeFwaNVErAcmADRBOtbxeXPIggXATkkMb8TiX7U6wGWu8DMmHNsr7ZpgOpGKSizQlu9
         GC0idl+9+QMH3pSaf1EnuSyXKFs2eDQMyeCcI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=aWR05E2RbmTNpLCVEo/Nlpzpd++Ks+Sv/wViyuVZ2Rg=;
        b=b+8BJ78YC0jg19BXTNCuVpWK/nD/OaaYuHRW4JblXZkLO4a8A7h1LvKIS+I8rmSNrg
         6gYZ8CgVFNkoTKN6vuOqOUw3pHM2afY6JRtcdS8TNBU7lJJzDtQqhQg4Pfkme3kA9aSz
         NzSxevwCCX5kkpHJPopSN/yu7nz0j5jkQ8Gh29v1kFXQNqvG1l9LVrtGxsklGM1Q5xKj
         s2BH8vsZmwnzhX+xnF8c5aM9SBOy8LLfeQNxDkJDWz23bPGjwzBL3jaNAjiV0X1f578B
         lBqgeDkkxxULdB6weozfe8e43JHQoPRATO2g+uygSM40K3zWfN9/zPf/8JmSkRJFoB3s
         LyaQ==
X-Gm-Message-State: AOAM531D3G9yQYv/IkJgUOAVER9wmTlobfnZ36pv+l78qT8A+sCdKy1T
        vfZ9Tb6biv1Bo/ObSm9QB8brcLcXnkciqTCtoJ1Kf3LGpwM=
X-Google-Smtp-Source: ABdhPJwOl4nucpur1NNMFQb0AV1jZ4bD7IxweXx7PXRCypu/M+7h5rfna8Nc2q9193z3yZhBOWplxPqRgMkAyzl6ZaI=
X-Received: by 2002:a05:6830:1489:: with SMTP id s9mr3462776otq.126.1643323096056;
 Thu, 27 Jan 2022 14:38:16 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 27 Jan 2022 14:38:15 -0800
MIME-Version: 1.0
In-Reply-To: <20220127210024.25597-2-quic_amelende@quicinc.com>
References: <20220127210024.25597-1-quic_amelende@quicinc.com> <20220127210024.25597-2-quic_amelende@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Thu, 27 Jan 2022 14:38:15 -0800
Message-ID: <CAE-0n505BCr5sJ_21WpAYJmEddsgOtCUMqG=vnjo_VVTjQ3SHQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] input: misc: pm8941-pwrkey: fix error message
To:     Anjelique Melendez <quic_amelende@quicinc.com>,
        dmitry.torokhov@gmail.com
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, collinsd@codeaurora.org,
        bjorn.andersson@linaro.org, skakit@codeaurora.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Quoting Anjelique Melendez (2022-01-27 13:00:23)
> Currently, error message reads "failed to set debounce". However,
> code is attempting to read revision not set debounce. Fix this.
>
> Signed-off-by: Anjelique Melendez <quic_amelende@quicinc.com>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
