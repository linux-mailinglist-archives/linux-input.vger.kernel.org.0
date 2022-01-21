Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18D814958A9
	for <lists+linux-input@lfdr.de>; Fri, 21 Jan 2022 04:51:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233642AbiAUDvt (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 20 Jan 2022 22:51:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233633AbiAUDvt (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 20 Jan 2022 22:51:49 -0500
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com [IPv6:2607:f8b0:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C7D7C06173F
        for <linux-input@vger.kernel.org>; Thu, 20 Jan 2022 19:51:49 -0800 (PST)
Received: by mail-ot1-x333.google.com with SMTP id v8-20020a9d6048000000b005960952c694so10229560otj.12
        for <linux-input@vger.kernel.org>; Thu, 20 Jan 2022 19:51:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=Zw1xGM3pPLEzfNT4ahmA+22OV1IFhkPDNDA/xee9U6A=;
        b=Fohh4ir2XtxYGDzTYT3a1zOzmn7NemInzjufhZGhE9kjaycZw3rvx/ZTOJMWAql8+u
         kjWXZNqWBTkh9C7rHMoQbzUi5zy88CG5B1mj9ubIOiYH94ZxbWuVjysjy10qmPvIK31v
         yat5XS6hJlkC47ErkXZpKGpn0rf2V0uEoSJUg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=Zw1xGM3pPLEzfNT4ahmA+22OV1IFhkPDNDA/xee9U6A=;
        b=z7NeONkP9416/iK3AtvvBOmSSMB6aUOJat3VloBKQ36CiuqsFVICOgZSvHLgbgm0qW
         N9WwwB2rJy36iHPQIpOfLwtUi2mOTBMLH/eL8+4lacsop3rAE+pQLk/9iJ9GamB16GuY
         nA7uinTAjOh6UPMbrvVrR5X0o/fSZpdGQ5nm0W5/o1Laaax/oBPez3kfrEUfzPD+8bQ2
         h1rGRRGD0o2/r0dh41xpzoPipiBLrMPOajyG8MsaHNh763x6pzQPFBP5/XPXXaFTA1+m
         CejVOT4gzSL0KlWon8ylSw6XlKgFSUD/y63d3jTaoMshzLUaqJr5SU+Bj2wBZr/GjM0g
         YtnQ==
X-Gm-Message-State: AOAM530kU6YPpfHYBoD5Jyi4R/wIycDJdwhJs8Psxe8e+F70pEu2Ee1p
        nGdoieGEMzzeDSXzxglGUIl1MZmhM1jOUlY9tPUawA==
X-Google-Smtp-Source: ABdhPJzOelKqjZaLkZxZNxOOsZNh2/VT97M0GdTnwWRDH9mrRyfMV1pVkXwDFHR/qX7u73GKaERNQBUCZpdLMd7EyYo=
X-Received: by 2002:a9d:7f93:: with SMTP id t19mr1422121otp.159.1642737108375;
 Thu, 20 Jan 2022 19:51:48 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 20 Jan 2022 19:51:48 -0800
MIME-Version: 1.0
In-Reply-To: <20220120204132.17875-1-quic_amelende@quicinc.com>
References: <20220120204132.17875-1-quic_amelende@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Thu, 20 Jan 2022 19:51:47 -0800
Message-ID: <CAE-0n530ddsusCO7ZB1X2GZ8NN4dPphdhAYCbexEr5jRPoACVA@mail.gmail.com>
Subject: Re: [PATCH 0/3] Add support for pm8941-pwrkey.c
To:     Anjelique Melendez <quic_amelende@quicinc.com>,
        dmitry.torokhov@gmail.com
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, collinsd@codeaurora.org,
        bjorn.andersson@linaro.org, skakit@codeaurora.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

"Add support" in the subject sounds like it is new. Maybe "extend
pm8941-pwrkey driver" would be more appropriate.

Quoting Anjelique Melendez (2022-01-20 12:41:30)
> This change series includes support and fixes in pm8941-pwrkey.c.
> Change details and description can be found in each patch. Thanks!
>
> David Collins (3):
>   input: misc: pm8941-pwrkey: simulate missed key press events
>   input: misc: pm8941-pwrkey: add software key press debouncing support
>   input: misc: pm8941-pwrkey: avoid potential null pointer dereference
