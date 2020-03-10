Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AF89A1807F9
	for <lists+linux-input@lfdr.de>; Tue, 10 Mar 2020 20:27:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727082AbgCJT16 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 10 Mar 2020 15:27:58 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:47062 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726545AbgCJT16 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 10 Mar 2020 15:27:58 -0400
Received: by mail-ot1-f65.google.com with SMTP id 111so10003605oth.13;
        Tue, 10 Mar 2020 12:27:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=GMblklwGuYnd4HKcMeDfii4QUNvN+SrSLwnqf+Uv1jc=;
        b=e+77TBPlq7XeOnLfoAiBMRBa8DLVfMbsLBDCeFB+QXwC4zs2CtlCooVhAndjLRSzUr
         5EoYaKWO2Zr7YXBcrHMJLplkj5NRQTsfKJcv+XRrD6UqTg4cPczFYO9bDNQrGfpEU9Xf
         y9mSCmRiBOHWHECda+PEneVIrIrGsMICTqaB7FDjk7SavJLYcBR7yK0r40540Bg+WeaZ
         xlr6lZ4iW3TOLltmUDGcP+Xo8Hhp9YQudVAtk09dba9QtDaP4Zh3aUSLaYIFjJCmn7Q8
         frA66bjRbxYhWzQ7kLP1LdAG4FPz2ABRUxWzNj2Q+tx/giGEZriHxNmBsP8WBAb6IE/E
         NU0A==
X-Gm-Message-State: ANhLgQ3Gmg4AsqHy4af4CjRbDov/D6DTIm1uDgKaelKukBIg1F8+mW/t
        x9MooxgE0ATNK5Z1tDTVDaPd3e4=
X-Google-Smtp-Source: ADFU+vtD6dsuuBcjWJZbnFsoJpOa6UnoZukuuH/KHh4qlbcwuMbsrTAVuyAWjxdZFF0e9+0+qpYTKA==
X-Received: by 2002:a9d:5888:: with SMTP id x8mr17511896otg.361.1583868476324;
        Tue, 10 Mar 2020 12:27:56 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id q23sm12305227otn.19.2020.03.10.12.27.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2020 12:27:55 -0700 (PDT)
Received: (nullmailer pid 15146 invoked by uid 1000);
        Tue, 10 Mar 2020 19:27:54 -0000
Date:   Tue, 10 Mar 2020 14:27:54 -0500
From:   Rob Herring <robh@kernel.org>
To:     Yannick Fertre <yannick.fertre@st.com>
Cc:     Bastien Nocera <hadess@hadess.net>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Benjamin Gaignard <benjamin.gaignard@st.com>,
        Yannick Fertre <yannick.fertre@st.com>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/2] dt-bindings: touchscreen: goodix: support of
 gt9147
Message-ID: <20200310192754.GA15113@bogus>
References: <1583144308-3781-1-git-send-email-yannick.fertre@st.com>
 <1583144308-3781-2-git-send-email-yannick.fertre@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1583144308-3781-2-git-send-email-yannick.fertre@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, 2 Mar 2020 11:18:27 +0100, Yannick Fertre wrote:
> Add support for it by adding compatible.
> The chip data on GT9147 is similar to GT912, like
> - config data register has 0x8047 address
> - config data register max len is 240
> - config data checksum has 8-bit
> 
> Signed-off-by: Yannick Fertre <yannick.fertre@st.com>
> ---
>  Documentation/devicetree/bindings/input/touchscreen/goodix.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
