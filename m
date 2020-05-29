Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A5C0C1E844B
	for <lists+linux-input@lfdr.de>; Fri, 29 May 2020 19:07:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726446AbgE2RHs (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 29 May 2020 13:07:48 -0400
Received: from mail-il1-f193.google.com ([209.85.166.193]:41963 "EHLO
        mail-il1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725601AbgE2RHs (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 29 May 2020 13:07:48 -0400
Received: by mail-il1-f193.google.com with SMTP id d1so3181715ila.8;
        Fri, 29 May 2020 10:07:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=MUooCf11G+wzFa88ewKcb5EHAEEa+XEEiZTRljzO3gM=;
        b=KlQW+GxlLEh/0KTfk6YJU1Rfo/2EMPJ+t6nNxB2sXdKVIdQ1QaSrdUH9smVn/A43ZF
         jKIVbnIf1gAbcolVffFUeMwyMFhxnmoijMwDOTsSB+2b+TMED5cy9zvR5qrWD3OAjzJ/
         RUFqBuuziYcqILrU6TtcKSy5a9qMwhP/et7ONtNI8SLLSja88gtsNVyBSnuZzN3ixtTm
         EkwvAZ210Za0052iTqNa7xMz6prBepmV1zc/uA8mzu1kA87FycgPWPAjzR2a/Ib9Mm6i
         HTit7FY3EGWQ23QTukvuW1yTAYBSRCGxQj4B7QDdj4uNUxDl7of0C4AJyma6egXdf8mb
         4duA==
X-Gm-Message-State: AOAM532UBEV/7vZge/sWbbF4dpR6xYMWE72OM0y7XsCWnSPY3J87kJbs
        WX03EF76kXF5TqdIa/kvBQ==
X-Google-Smtp-Source: ABdhPJxBmlK7urpI9ApsfbfQd7gBioqSkjdj2dSXUO1JzWzfzgFdYXxVnOPUDRqf46kOGQCOV5afxQ==
X-Received: by 2002:a92:8496:: with SMTP id y22mr1243486ilk.115.1590772067110;
        Fri, 29 May 2020 10:07:47 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id c23sm3276894ioc.28.2020.05.29.10.07.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2020 10:07:45 -0700 (PDT)
Received: (nullmailer pid 2577192 invoked by uid 1000);
        Fri, 29 May 2020 17:07:44 -0000
Date:   Fri, 29 May 2020 11:07:44 -0600
From:   Rob Herring <robh@kernel.org>
To:     Johan Jonker <jbx6244@gmail.com>
Cc:     linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        heiko@sntech.de, linux-input@vger.kernel.org,
        dmitry.torokhov@gmail.com, robh+dt@kernel.org
Subject: Re: [PATCH] dt-bindings: input: touchscreen: edt-ft5x06: change reg
 property
Message-ID: <20200529170744.GA2577033@bogus>
References: <20200520073327.6016-1-jbx6244@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200520073327.6016-1-jbx6244@gmail.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, 20 May 2020 09:33:27 +0200, Johan Jonker wrote:
> A test with the command below gives this error:
> 
> arch/arm/boot/dts/rk3188-bqedison2qc.dt.yaml:
> touchscreen@3e: reg:0:0: 56 was expected
> 
> The touchscreen chip on 'rk3188-bqedison2qc' and other BQ models
> was shipped with different addresses then the binding currently allows.
> Change the reg property that any address will pass.
> 
> make ARCH=arm dtbs_check
> DT_SCHEMA_FILES=Documentation/devicetree/bindings/input/touchscreen/
> edt-ft5x06.yaml
> 
> Signed-off-by: Johan Jonker <jbx6244@gmail.com>
> ---
>  Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Applied, thanks!
