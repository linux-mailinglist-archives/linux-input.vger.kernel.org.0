Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 781D1A61FA
	for <lists+linux-input@lfdr.de>; Tue,  3 Sep 2019 08:56:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727173AbfICG4S (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 3 Sep 2019 02:56:18 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:34861 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725919AbfICG4S (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 3 Sep 2019 02:56:18 -0400
Received: by mail-wr1-f67.google.com with SMTP id g7so16171563wrx.2;
        Mon, 02 Sep 2019 23:56:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=gPy6fOC9u4A5SyRwQGW1CeXL58GG3z/lyzlsRrRvE20=;
        b=VKTnUeL1mvffjZp4HF1qYIC2ohPVatfSPDn4E3v26n2MUOIvaL/G15Yj9rrY8sWR9i
         /lUBGN3u7FxJeklQVJZCh6rpFS9sX5xp6BufHv3a/hRtX+N2tUiQeh0jNh9aJ560A242
         k1vVgHggrMRgudIZUpH7EWW1ML0e9p0bvVCOgHUKwtmdPrnS2rwxHZHAfzhdfxXYmuhM
         Uarx0LafsMIWuQYmJ9x6VufTZw6olqgjZlm/dx+vwssVoMGsZ2JXJytXXUQAUzbPXFit
         iJHoWTckyZ2ONWvdc9X2q3S/Zeb3mYuzKz3dpC3EWX7XFGc7C7/hgZW9Hb5E8mTETx2O
         2uoA==
X-Gm-Message-State: APjAAAWFgLr2BkqJ59qqHnlQU8Lo2rjjJcZkQlesW7Gxij6XUE5tFW14
        BEYKjuPp6KTEdyOSahHwtg==
X-Google-Smtp-Source: APXvYqxJ37+E2Wt1cMkG1bIYf8QUq1oQul1fNEtgAa89fMSnJ82GfZWC1/Yz60NM8CdkofiMDuBe1Q==
X-Received: by 2002:adf:f5c5:: with SMTP id k5mr38074077wrp.42.1567493776372;
        Mon, 02 Sep 2019 23:56:16 -0700 (PDT)
Received: from localhost ([212.187.182.166])
        by smtp.gmail.com with ESMTPSA id x15sm10963383wmc.16.2019.09.02.23.56.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2019 23:56:15 -0700 (PDT)
Date:   Tue, 3 Sep 2019 07:56:15 +0100
From:   Rob Herring <robh@kernel.org>
To:     Michal =?utf-8?B?Vm9rw6HEjQ==?= <michal.vokac@ysoft.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH input-next 1/4] dt-bindings: input: Convert mpr121
 binding to json-schema
Message-ID: <20190903065615.GA17646@bogus>
References: <1567424417-3914-1-git-send-email-michal.vokac@ysoft.com>
 <1567424417-3914-2-git-send-email-michal.vokac@ysoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1567424417-3914-2-git-send-email-michal.vokac@ysoft.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Sep 02, 2019 at 01:40:14PM +0200, Michal Vokáč wrote:
> Convert the mpr121 binding to DT schema format using json-schema.
> 
> Signed-off-by: Michal Vokáč <michal.vokac@ysoft.com>
> ---
> Hi Rob,
> 
> I will appreciate your help converting this binding. Currently
> the scheme is not valid and the error output of dt_binding_check
> is not really helpful.

What's the error? I don't see anything obvious.

> 
> Also, who shoud be the maintainer of this binding?
> I put Dmitry in there as he is the input subsystem maintainer but
> I am not sure it is correct.

My preference is the author or driver maintainer.

>  .../bindings/input/fsl,mpr121-touchkey.yaml        | 64 ++++++++++++++++++++++
>  .../devicetree/bindings/input/mpr121-touchkey.txt  | 30 ----------
>  2 files changed, 64 insertions(+), 30 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/input/fsl,mpr121-touchkey.yaml
>  delete mode 100644 Documentation/devicetree/bindings/input/mpr121-touchkey.txt
