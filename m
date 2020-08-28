Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D037F255DEB
	for <lists+linux-input@lfdr.de>; Fri, 28 Aug 2020 17:34:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726307AbgH1Peq (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 28 Aug 2020 11:34:46 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:42048 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725814AbgH1Pep (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 28 Aug 2020 11:34:45 -0400
Received: by mail-lj1-f194.google.com with SMTP id t6so1765405ljk.9;
        Fri, 28 Aug 2020 08:34:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FC4YoOWKkObbCsONr9IcEp9WxXgX44hIZg/2WcmJjM4=;
        b=BIFRo/cIjrSBoY5LJQM9kdaASoNIAjRVdi5qAGTuhrqn8BLpEb1dDeaMF027Wh8uNK
         ysjBxd5QPQJcGtTPuzKpvcWaZGEzEOOruhqElOXY+qrIOzZd8X+zAR4jokCHCNe3ctHA
         eqfWyxmotztRMvNg+xntOp6k3gM6NZcO0oRY6P53AmrEiA7DBnaGvRcpNp2n9LumXcl2
         qJKCukF7c/hAG9adi8O7ouyDrNPwFg5WhWVlL26dPrOuJTtxPOuPLktGSRKMsLkHSbE4
         7kc3WWzT9AGGKrVK3qrefLC40eE4kXwLeGKCCtRUHc0d5+5+2/xg/vX3Jk+Svjw+R492
         TIsQ==
X-Gm-Message-State: AOAM531TvwO1xtbbM9D5Z8fvgV6Gnw2ym720nVmfSxNhM1Z1TvnyGTbJ
        A5gNOUiSDoCXYp+x4r1gtr0NoNraoiOtUw==
X-Google-Smtp-Source: ABdhPJwVow/iwMM80sP8KWr350kRKmBMO50q1PzWWHxZjn68ivCOfx3aqhRBNSh1/vok7MrIDKLcFQ==
X-Received: by 2002:a2e:9990:: with SMTP id w16mr1062012lji.156.1598628882678;
        Fri, 28 Aug 2020 08:34:42 -0700 (PDT)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com. [209.85.208.175])
        by smtp.gmail.com with ESMTPSA id i131sm372710lfd.27.2020.08.28.08.34.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Aug 2020 08:34:42 -0700 (PDT)
Received: by mail-lj1-f175.google.com with SMTP id i10so1805581ljn.2;
        Fri, 28 Aug 2020 08:34:41 -0700 (PDT)
X-Received: by 2002:a2e:9b8e:: with SMTP id z14mr1141291lji.47.1598628881828;
 Fri, 28 Aug 2020 08:34:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200828145744.3636-1-krzk@kernel.org> <20200828145744.3636-4-krzk@kernel.org>
In-Reply-To: <20200828145744.3636-4-krzk@kernel.org>
From:   Chen-Yu Tsai <wens@csie.org>
Date:   Fri, 28 Aug 2020 23:34:28 +0800
X-Gmail-Original-Message-ID: <CAGb2v67mZTm4QuB=_T9Gih60KZ7E8n+J3OBk28rrO6kb_-JZKg@mail.gmail.com>
Message-ID: <CAGb2v67mZTm4QuB=_T9Gih60KZ7E8n+J3OBk28rrO6kb_-JZKg@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] Input: sun4i-ps2 - Fix handling of
 platform_get_irq() error
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        linux-input@vger.kernel.org,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Aug 28, 2020 at 10:58 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> platform_get_irq() returns -ERRNO on error.  In such case comparison
> to 0 would pass the check.
>
> Fixes: e443631d20f5 ("Input: serio - add support for Alwinner A10/A20 PS/2 controller")
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Acked-by: Chen-Yu Tsai <wens@csie.org>
