Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F385E375C8F
	for <lists+linux-input@lfdr.de>; Thu,  6 May 2021 23:06:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230096AbhEFVHD (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 6 May 2021 17:07:03 -0400
Received: from mail-oi1-f169.google.com ([209.85.167.169]:43792 "EHLO
        mail-oi1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229672AbhEFVHD (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 6 May 2021 17:07:03 -0400
Received: by mail-oi1-f169.google.com with SMTP id j75so6760791oih.10;
        Thu, 06 May 2021 14:06:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=62X0aGUaM6WdBTo/Cm3BxRFcDkXCvap7yNkBf8S6dTg=;
        b=c6jrVXWtG3dpOo2TpontA/+gUc6qA/5rL/RtrxVa7mWMrTaBM7QCYv/4s8LEzUj23n
         uq9Re73K2dGrwCijF8fp2rsv+nv07CiZbAtqozp6CT62mWh+qWjVgipB53W7i3xKzKjr
         Teb9418Rz4qAeSVfqAJ/WjDuby3Ucr1tpt4VpPRmTzjfIw/9nST0NptBAAJ1Jm3iaek4
         ylCAEQpBvjKk/abuo7RAenih6JJIt9tOmIP87VuqTbFfk36Dw3wV9ZJFO7uso1z1G/z+
         5EHTA7+4ijJGjH/FHvcMTEAQKqoKFqBqByGDlzGf7WfwCYmA9g3ZcbXO4EXVhaz06abz
         uLTw==
X-Gm-Message-State: AOAM533v26SpjN46knbyek1pz1Fz8LY3ORc+z94fiEesbg1NndpGXWSZ
        NLJ7Uo87nX+4vMWwd9Z/eg==
X-Google-Smtp-Source: ABdhPJzL1tkLyA0cg9ifZjde1OBU7ZT8HPm7GimCobQnG2FccbevwgGI8m5l484rIaGHkhMLrVRNDQ==
X-Received: by 2002:a05:6808:14c8:: with SMTP id f8mr12602518oiw.55.1620335163991;
        Thu, 06 May 2021 14:06:03 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id k7sm729029ood.36.2021.05.06.14.06.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 May 2021 14:06:03 -0700 (PDT)
Received: (nullmailer pid 800533 invoked by uid 1000);
        Thu, 06 May 2021 21:06:02 -0000
Date:   Thu, 6 May 2021 16:06:02 -0500
From:   Rob Herring <robh@kernel.org>
To:     Yassine Oudjana <y.oudjana@protonmail.com>
Cc:     "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "phone-devel@vger.kernel.org" <phone-devel@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "~postmarketos/upstreaming@lists.sr.ht" 
        <~postmarketos/upstreaming@lists.sr.ht>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
Subject: Re: [PATCH v2 2/2] dt-bindings: input: Add binding for cypress-sf
Message-ID: <20210506210602.GA800483@robh.at.kernel.org>
References: <BmgtYLgM0FI0tmBcQQLEPss7D2v0jW1Ci8LWeLLd3g@cp3-web-020.plabs.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BmgtYLgM0FI0tmBcQQLEPss7D2v0jW1Ci8LWeLLd3g@cp3-web-020.plabs.ch>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, 04 May 2021 19:20:50 +0000, Yassine Oudjana wrote:
> Add a device tree binding for Cypress StreetFighter.
> 
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
> ---
>  .../devicetree/bindings/input/cypress-sf.yaml | 61 +++++++++++++++++++
>  1 file changed, 61 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/input/cypress-sf.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
