Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 52B9D4B7D34
	for <lists+linux-input@lfdr.de>; Wed, 16 Feb 2022 03:21:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231384AbiBPCKF (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 15 Feb 2022 21:10:05 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:49096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343531AbiBPCKE (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 15 Feb 2022 21:10:04 -0500
Received: from mail-oo1-xc2d.google.com (mail-oo1-xc2d.google.com [IPv6:2607:f8b0:4864:20::c2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE6C6FBA63
        for <linux-input@vger.kernel.org>; Tue, 15 Feb 2022 18:09:53 -0800 (PST)
Received: by mail-oo1-xc2d.google.com with SMTP id s203-20020a4a3bd4000000b003191c2dcbe8so860305oos.9
        for <linux-input@vger.kernel.org>; Tue, 15 Feb 2022 18:09:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc:content-transfer-encoding;
        bh=xYF0pO2IgFFXUS+S+srQLj8t9yqUYK8NKQTShN2w85A=;
        b=DBgR2HKCuDDuDibXockHuf+4mT2HMWTFfCQfgcpfnrt9+u9CPW/q6iRnqsEl9qY5mX
         jkn7P7IA4hC1uY8sjpebe4rpNJ3M0cBEhEpAwgtjrvMZw0W1FX156l1YwuvRh4IzGuHs
         iWCyDTEfU7pB7ABUmGc1+EF9B55dqojGiJ4pQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc:content-transfer-encoding;
        bh=xYF0pO2IgFFXUS+S+srQLj8t9yqUYK8NKQTShN2w85A=;
        b=p3RVvt3Z9baaDII9kwAnVXZQx6sUs/hSoPD5xsGzJxQw75OJdFLkn7t7nP8JgpzaZQ
         oAaWwLdOJFnkGd0vFqHI7WX5vui9jFqZxI6AMFYm3P376VzuA2di0fzWAq83b4fraOmj
         2/s5HT5Md3bFgJFEVZgq7HpRJmNDzP35b0/y6OvU/LYTBwqYeWypFhY42PXmMEKCxRYJ
         r34ZuzF1vl3Rj5mrIYmto/i8FB1ZBteGZldJtPDN50vBjyu12TxslzZxXVZ+pCHL84Fy
         x+hHpKizoCCczFfREyCZiltWmzSx+nk6XIcvR9okpC0oTIVu1cwoKt2FMo3YCFpa409o
         Q3pw==
X-Gm-Message-State: AOAM532E/VN+ZsaYeaGr5Y9cYp86azPzxlH2vbdwxLbOY2xYjscibj46
        PsL5rqA9Z7UDjGH5eOGdQWINfEkysJVzxeXkYgnKxg==
X-Google-Smtp-Source: ABdhPJw/KDAgE0FdHBRrKIXoSn234wcOgh4yzCcAHECcfKZ1d1mwF/UbuwfaqjuDp9dlk+kLltLS8k0JkJ3SxZ6KhIs=
X-Received: by 2002:a05:6870:631a:b0:d1:7d97:806 with SMTP id
 s26-20020a056870631a00b000d17d970806mr277376oao.8.1644977392226; Tue, 15 Feb
 2022 18:09:52 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 15 Feb 2022 18:09:51 -0800
MIME-Version: 1.0
In-Reply-To: <CAOOzhkpDvR14-D9YcZzbAQdQkDmas_XUtV-CLBR7+a3AuxgstQ@mail.gmail.com>
References: <20220211012510.1198155-1-swboyd@chromium.org> <20220211012510.1198155-2-swboyd@chromium.org>
 <CAOOzhkpDvR14-D9YcZzbAQdQkDmas_XUtV-CLBR7+a3AuxgstQ@mail.gmail.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Tue, 15 Feb 2022 18:09:51 -0800
Message-ID: <CAE-0n52aueW5N+d2d6tjWtca31werhwk6-6yqDm-XibtTfJsTA@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] Input: Extract ChromeOS vivaldi physmap show function
To:     "Sean O'Brien" <seobrien@chromium.org>
Cc:     benjamin.tissoires@redhat.com,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jiri Kosina <jikos@kernel.org>, linux-kernel@vger.kernel.org,
        linux-input@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Quoting Sean O'Brien (2022-02-15 13:50:03)
> Hi Stephen,
>
> Thanks for updating the vivaldi functionality with these patches.=C2=A0 I=
 took
> a look at your changes and I don't have any objections.=C2=A0 I also test=
ed
> on a couple of HID vivaldi keyboards and they worked as expected.

Thanks. Can you provide a Tested-by: tag with your name and email?
