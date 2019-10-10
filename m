Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6D39ED3175
	for <lists+linux-input@lfdr.de>; Thu, 10 Oct 2019 21:36:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726053AbfJJTgz (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 10 Oct 2019 15:36:55 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:40929 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725867AbfJJTgz (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 10 Oct 2019 15:36:55 -0400
Received: by mail-ot1-f68.google.com with SMTP id y39so5928878ota.7;
        Thu, 10 Oct 2019 12:36:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=GrIfYxv7zzQIzL0PIvdg+DwKKuRhoX4+xlthC9D4qis=;
        b=o/rLZwxkvrpt9Ur6fPzawGJnj9LPC6abGA1qaWF7Kh5YNfwjIrNssfdbZO6YmM7w2U
         NHt3XMOqEvtIvAwJOQT6SjS7j3LTBEKnU62pDo15CJUhCtEQHlrADCywyaPXGQp3Ebwy
         IuDS6u5m+Guv98YIsFlqPKyPNAwXOOSQiYKqEYFtnu+acNyfWLJlZqAdqLOCDAMcU5LS
         z9P/+bM5gE29fv0dO2zlJbvKHqirfgJ2CBndpknr1RKO9eUfWk32kInu/R5anNWosX8O
         /k1hf3xjXEVUEF0lwl/LRC/osFF1XGIS3VbGnEO/ogW264xXmFwgikWCDyTmnLPCN9Ib
         QAxw==
X-Gm-Message-State: APjAAAVW9kW3DUimqJTAJK6fgAV5Lt3Fh0JComFLOAQQZOh4g6kheKaZ
        v1dv+cBBdKpsqTliYN3i7g==
X-Google-Smtp-Source: APXvYqzI1UBOf7SOrmgneo0vg0V0hSLG6fFDH2ZK0WOo4j8Dy9ksMUNQuzUM9uZXwfTbZMzAFILo1g==
X-Received: by 2002:a9d:144:: with SMTP id 62mr9664039otu.187.1570736212705;
        Thu, 10 Oct 2019 12:36:52 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id c21sm1894957otp.15.2019.10.10.12.36.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2019 12:36:52 -0700 (PDT)
Date:   Thu, 10 Oct 2019 14:36:51 -0500
From:   Rob Herring <robh@kernel.org>
To:     Michal =?utf-8?B?Vm9rw6HEjQ==?= <michal.vokac@ysoft.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        Michal =?utf-8?B?Vm9rw6HEjQ==?= <michal.vokac@ysoft.com>
Subject: Re: [PATCH v3 2/5] dt-bindings: input: Convert mpr121 binding to
 json-schema
Message-ID: <20191010193651.GA16598@bogus>
References: <1570083176-8231-1-git-send-email-michal.vokac@ysoft.com>
 <1570083176-8231-3-git-send-email-michal.vokac@ysoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1570083176-8231-3-git-send-email-michal.vokac@ysoft.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu,  3 Oct 2019 08:12:53 +0200, =?UTF-8?q?Michal=20Vok=C3=A1=C4=8D?= wrote:
> Convert the mpr121 binding to DT schema format using json-schema.
> 
> Signed-off-by: Michal Vokáč <michal.vokac@ysoft.com>
> ---
> Changes since v2:
>  - None
> 
> Changes since v1:
>  - Extract the common input properties into the input.yaml schema.
>  - Fix the wakeup-source description.
>  - Fix the example to pass validation. Put the mpr121 device sub-node
>    into a i2c {} node.
> 
> The linux,keycodes property is not valid as it is. If I put the minItems
> and maxItems into the common schema, it is valid and the min/max length
> check works fine. Rob, could you advice how to fix this please?
> 
> The error is not very specific..
> 
> $ make dt_binding_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/input/fsl,mpr121-touchkey.yaml
>   SCHEMA  Documentation/devicetree/bindings/processed-schema.yaml
> /home/vokac/development/sources/linux-fslc/Documentation/devicetree/bindings/input/fsl,mpr121-touchkey.yaml: ignoring, error in schema 'linux,ke
> warning: no schema found in file: /home/vokac/development/sources/linux-fslc/Documentation/devicetree/bindings/input/fsl,mpr121-touchkey.yaml
> /home/vokac/development/sources/linux-fslc/Documentation/devicetree/bindings/Makefile:33: recipe for target 'Documentation/devicetree/bindings/p
> make[3]: *** [Documentation/devicetree/bindings/processed-schema.yaml] Error 255
> /home/vokac/development/sources/linux-fslc/Makefile:1264: recipe for target 'dt_binding_check' failed
> 
>  .../bindings/input/fsl,mpr121-touchkey.yaml        | 66 ++++++++++++++++++++++
>  .../devicetree/bindings/input/mpr121-touchkey.txt  | 30 ----------
>  2 files changed, 66 insertions(+), 30 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/input/fsl,mpr121-touchkey.yaml
>  delete mode 100644 Documentation/devicetree/bindings/input/mpr121-touchkey.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
