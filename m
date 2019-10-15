Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6047AD8386
	for <lists+linux-input@lfdr.de>; Wed, 16 Oct 2019 00:21:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389354AbfJOWVj (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 15 Oct 2019 18:21:39 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:39853 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726417AbfJOWVi (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 15 Oct 2019 18:21:38 -0400
Received: by mail-ot1-f65.google.com with SMTP id s22so18389073otr.6;
        Tue, 15 Oct 2019 15:21:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=TQVKfQ0EPrH9rwXUS6s9Y7ThrS4ruNqIvq5HwSXIrek=;
        b=dtUKOGJ01PN8kuhaX5l30/hcl8WfPRJoMSuURQwAIARrU27EALZhCbbRoooIhsEBLs
         DOD8d6MNAepG/cYDIXyiTNdhYxWeUbOAusP7Dre9IdWLiVUTsptye5cxZYfaj2dOGXrl
         HflIzpPXz6p35GaxC+lRA95aoutPm3DOLvWLoh94SU+s1rVINz8a/CG5bHbxHh7wTvOQ
         ZKb8aCuN5GovMM9RfawM8hrSACPjRfPVWJoTRSA1Eby2L0TyC2aYdFpZSTPI1BriXoph
         junB0Z2OAMkjPZ/mvHwLsZkqA6De7J0qyi0U5sIYxL5fq6csaZxGHt+S0KXKLg0TgNsa
         ChTw==
X-Gm-Message-State: APjAAAWYkQgml05nJ8vNrpbITUbRVZ2HJSG1JfJ7802kmrFdX10V2a+Y
        nkTjUckMljX5TnuuuTOtYw==
X-Google-Smtp-Source: APXvYqx0UaqLhY/bEIQPxb4fE5uWfzu7ziGYgSUyLujfrv/qLO2LOhU/6Y0BrO/FaaIpEiRN5xx+Wg==
X-Received: by 2002:a9d:6ad9:: with SMTP id m25mr17660619otq.181.1571178097586;
        Tue, 15 Oct 2019 15:21:37 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id d69sm6745459oig.32.2019.10.15.15.21.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2019 15:21:36 -0700 (PDT)
Date:   Tue, 15 Oct 2019 17:21:36 -0500
From:   Rob Herring <robh@kernel.org>
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Andi Shyti <andi@etezian.org>,
        Andi Shyti <andi.shyti@samsung.com>,
        Simon Shields <simon@lineageos.org>,
        linux-input@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Stephan Gerhold <stephan@gerhold.net>
Subject: Re: [PATCH 2/3] dt-bindings: mms114: document melfas,mms345l binding
Message-ID: <20191015222136.GA6924@bogus>
References: <20191007203343.101466-1-stephan@gerhold.net>
 <20191007203343.101466-3-stephan@gerhold.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191007203343.101466-3-stephan@gerhold.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon,  7 Oct 2019 22:33:42 +0200, Stephan Gerhold wrote:
> The mms114 driver now supports MMS345L; document the
> melfas,mms345l binding that is used for it.
> 
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> ---
>  Documentation/devicetree/bindings/input/touchscreen/mms114.txt | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
