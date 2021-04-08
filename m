Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7F1B358E2E
	for <lists+linux-input@lfdr.de>; Thu,  8 Apr 2021 22:16:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231676AbhDHUQf (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 8 Apr 2021 16:16:35 -0400
Received: from mail-ot1-f50.google.com ([209.85.210.50]:38409 "EHLO
        mail-ot1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231451AbhDHUQe (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 8 Apr 2021 16:16:34 -0400
Received: by mail-ot1-f50.google.com with SMTP id w21-20020a9d63950000b02901ce7b8c45b4so3564689otk.5;
        Thu, 08 Apr 2021 13:16:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=CLvREP8cSkaXDbZqsQ3pwOZ5gunBfoSYtS8rLqMUnRE=;
        b=d8uTKvacWqmKDnSOw8ohZmzXnY1wIPlwr1dWDzmsdcehMa4T/mpMVWTWgbQWz1kihb
         yCsG31+vA4He4WNAYSxc8vobUbdsza8RpVLxldNRL39xKtsiYSUC4LIizlfKw7ffXQIP
         vCk2hYj1oq2jxoEwpH3is4+zgy3sw8JGBiB09rG5lfm7FWrO76JW0LMWmR5qQO95NPbr
         enU8ITG9lBDDdmLm+3jMpqeHIyl2DSPW447qt1chgTRpe4NKJhCpNq/h4sExFSMcW1c7
         mCHRYDkNYdjHOnLQiKGlOXtD72HowukJV17w+FPlm107s5uaeLUy241PMcBxz2+iToPq
         LBsQ==
X-Gm-Message-State: AOAM531jiv3EaVKQX6h4GmoflmSoSOCtS8ZtNDuMeZRyEoAxftLMLbOW
        8FSk/A79dpBt3Mu09aeehw==
X-Google-Smtp-Source: ABdhPJwHE1KAxgeUupVEo1jaKtlfkwHjdF92MHNCbyWYv6lX+CBk8bl+YGNNxTyOTZZ8wNLtYHQrJg==
X-Received: by 2002:a9d:928:: with SMTP id 37mr2802691otp.98.1617912981480;
        Thu, 08 Apr 2021 13:16:21 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id l71sm96104oib.30.2021.04.08.13.16.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 13:16:20 -0700 (PDT)
Received: (nullmailer pid 1890250 invoked by uid 1000);
        Thu, 08 Apr 2021 20:16:19 -0000
Date:   Thu, 8 Apr 2021 15:16:19 -0500
From:   Rob Herring <robh@kernel.org>
To:     Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc:     Henrik Rydberg <rydberg@bitmath.org>, linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v4 1/3] dt-bindings: Add Hycon Technology vendor prefix
Message-ID: <20210408201619.GA1890216@robh.at.kernel.org>
References: <YGxkB6icZSJfx/VB@latitude>
 <20210407174909.1475150-1-giulio.benetti@benettiengineering.com>
 <20210407174909.1475150-2-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210407174909.1475150-2-giulio.benetti@benettiengineering.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, 07 Apr 2021 19:49:07 +0200, Giulio Benetti wrote:
> Update Documentation/devicetree/bindings/vendor-prefixes.yaml to
> include "hycon" as a vendor prefix for "Hycon Technology".
> Company website: https://www.hycontek.com/
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> Reviewed-by: Jonathan Neuschäfer <j.neuschaefer@gmx.net>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
