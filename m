Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0261A3970D3
	for <lists+linux-input@lfdr.de>; Tue,  1 Jun 2021 12:02:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231576AbhFAKDo (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 1 Jun 2021 06:03:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230262AbhFAKDn (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 1 Jun 2021 06:03:43 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD40CC061574
        for <linux-input@vger.kernel.org>; Tue,  1 Jun 2021 03:02:01 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id a2so20841989lfc.9
        for <linux-input@vger.kernel.org>; Tue, 01 Jun 2021 03:02:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WpI8GHLsJcrZ58Z+YoJaB7PSP+47yWiasjYAw5B6Hg8=;
        b=AA74wBTPZSpiPxChVnNfVNN4bpKUdDKtSW4Hiek8lM/LP0cE+23moWVD+cf0MbpiS8
         gT3lreTwLL+F6pTLDk7pd0yYKIDVJF6lE0EAbirEtXkePAgA7XYWix94XETfWAw/uJnR
         I0n1mfFFFeIJbjDWTHKEyvgWO5q9FpKijlESGpwUDEvZmdqNMmtgPmNvJuS0qOPyqrow
         b9QqEBc8c5HJ/U9Mw19/fSd4+W4hiEDPuWNMAN1nCvclpVquVBRZj5lN+FRg1+V+0Bv2
         AyfYSsQf3lbuVNJqdO05id1ryzuAsvmizFzIweWzj9+RK6tbgm++hd2Ufs1joCde5YRP
         p6PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WpI8GHLsJcrZ58Z+YoJaB7PSP+47yWiasjYAw5B6Hg8=;
        b=RT/9xESCc8YjVPK8QhfaJ/dQDg0zhG7zPstV0fRmS88fmIMX547hIfzWqZuT5J1CXg
         Rc2Jhzsv9MTBrrxDx1rqYHohLRBsZMNe8YHavg/rdwieZb4LYuhefSuNhPxAegG4V7+b
         PiTH1/gXSlampsnBuwY5ler9p4vjRJvJDzoQCOk/y95PtC619W4yY5Tb/dYpbzUGKUwi
         QYJoH3tU8n4cCpg6C7TxDuGC2qLMhe2rgosHmWMgeLdlwg7vwcobs/h8zKIUzBZ/JWjk
         YNx1wq+X+J9EzcBQcTsFehSk8l3F0CY/85XmktchwNDBkXJNnMVmlVdZGsm7limctRRZ
         K7DA==
X-Gm-Message-State: AOAM5308cGzuGnFx/q8cnrcHsVOGw2pHkILxhkYg21YoASAb9JIbv+ap
        pFrj2kgerP5bheF1FKZvieokXA6Mg4eoQg3WJqqlUA==
X-Google-Smtp-Source: ABdhPJyENCN6slN50xDFDVXreOas+przMVWpk1EoCHMp7aoF1LFbRhdFgFsjN6uAweYWTB+ajbTiy1nNeLUMf4vm4t0=
X-Received: by 2002:ac2:544f:: with SMTP id d15mr18089239lfn.465.1622541720092;
 Tue, 01 Jun 2021 03:02:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210531052307.1433979-1-dmitry.torokhov@gmail.com> <20210531052307.1433979-2-dmitry.torokhov@gmail.com>
In-Reply-To: <20210531052307.1433979-2-dmitry.torokhov@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 1 Jun 2021 12:01:49 +0200
Message-ID: <CACRpkdb180Gp5xgQUO6LGuCxgvgWB1qirLu9wP6Uky9Qnw+w7w@mail.gmail.com>
Subject: Re: [PATCH 2/2] Input: cyttsp - remove public header
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Linux Input <linux-input@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, May 31, 2021 at 7:23 AM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:

> There is nothing in include/linux/input/cyttsp.h that might be of interes
> to the kernel at large, so let's move this information into the driver
> code and remove the header.
>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
