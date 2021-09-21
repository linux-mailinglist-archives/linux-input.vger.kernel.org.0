Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7126A413A17
	for <lists+linux-input@lfdr.de>; Tue, 21 Sep 2021 20:29:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233095AbhIUSa7 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 21 Sep 2021 14:30:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233090AbhIUSa7 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 21 Sep 2021 14:30:59 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC396C061575
        for <linux-input@vger.kernel.org>; Tue, 21 Sep 2021 11:29:30 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id b15so1170921lfe.7
        for <linux-input@vger.kernel.org>; Tue, 21 Sep 2021 11:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=H8Wo2U3fZZPbINkKPHgF5f7NF214eZln9lkI6++RKwQ=;
        b=EIj/r7YAOR4TxSFqtc0XezwotcPykhRbz8ISMtniL5l072qU1Z+ERmN3lveAjpoBK0
         vSgcUkbcqqBXAZCFZNe3AVHSJwdMknvcYAjd2iAijfzGnKDG2GUJZZjDgZg9jD4mpEB0
         lNvDtdHeZPcdYBwgF++ZjBvmBuxqm3SANvk/lvAZ4/NpGHCaGQ3eFo4x181/HgQUJEs5
         FIzysxC6YjCspxjPwnernK1SypdP416uUtU369zSvSiJsTFYVGFGJYCXxHYX9OBbfCVd
         nZt7hJD7RE6HLgXfXiVRneeBxZQ7Afw06UDaMBDrmRvi1cQz2SLpZg28DdCBRgO+mE3Y
         1cZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=H8Wo2U3fZZPbINkKPHgF5f7NF214eZln9lkI6++RKwQ=;
        b=WnyLR8b5ueB4TC0W6s+vGNi1B1AZJN8JjiJQNW/WRwJb0Wz2g8r7svb/F0ORE3LmuA
         hOLXOFNvBx8NZn03T6f0dfZ3YSWx/S8u01JDACqPWQpGlSX6GXJqxHu1f6ool8GQuBSI
         l1VCr8AVDb8UYRWKcKk2npzx8c6P9vgUSnjQUkORaOrFKE+6VWy00wXKYi/D5evqyX5l
         EUpPSJBr+4jrbakOuQxWONSsOwJMfZs6NQ160ksDmBIj0Hd3pPbP+sCGlsfnlblGxfF3
         g6xbdf4bD/T34H1FhJIEgLBH7jAUtyF2AOck8b9l9o/M95D70ACK0P7E+AVmd5WiPKOT
         DukQ==
X-Gm-Message-State: AOAM531/opmaelPlUTFZG6Wv33MHq2rc4yLmvjPRzhXX5tprysazvsc0
        8oLrrc7kf4cdWqE483EJjlhYwkNvjxHH+VHCh8hO3Q==
X-Google-Smtp-Source: ABdhPJxiJW0IlyMzcIpmX7lPi/2jCIPM5++vLf0SHJS3hopPHH2k7+Pp1sHDHM2f5OBfm+DHHjqBilrIupGH3UYqDkY=
X-Received: by 2002:a05:6512:3c92:: with SMTP id h18mr23624483lfv.656.1632248969067;
 Tue, 21 Sep 2021 11:29:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210920103335.243-1-caihuoqing@baidu.com>
In-Reply-To: <20210920103335.243-1-caihuoqing@baidu.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 21 Sep 2021 20:29:18 +0200
Message-ID: <CACRpkdZHUpHj8eWc21tYPFwA7BpWdj-dS-sbzxgoi=n02jctbA@mail.gmail.com>
Subject: Re: [PATCH v2] Input: cyttsp - Make use of the helper function dev_err_probe()
To:     Cai Huoqing <caihuoqing@baidu.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Linux Input <linux-input@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Sep 20, 2021 at 12:33 PM Cai Huoqing <caihuoqing@baidu.com> wrote:

> When possible use dev_err_probe help to properly deal with the
> PROBE_DEFER error, the benefit is that DEFER issue will be logged
> in the devices_deferred debugfs file.
> Using dev_err_probe() can reduce code size, and the error value
> gets printed.
>
> Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
