Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30BE923DF2F
	for <lists+linux-input@lfdr.de>; Thu,  6 Aug 2020 19:40:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727103AbgHFRkj (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 6 Aug 2020 13:40:39 -0400
Received: from mail-qk1-f170.google.com ([209.85.222.170]:39842 "EHLO
        mail-qk1-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729994AbgHFRkf (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 6 Aug 2020 13:40:35 -0400
Received: by mail-qk1-f170.google.com with SMTP id l6so45697416qkc.6
        for <linux-input@vger.kernel.org>; Thu, 06 Aug 2020 10:40:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Gc23MbsN7Py2AbboYagkFP2z88M/HrX+ProFw+VbFVM=;
        b=Q1b4C/2a5menQT2Fc6LZjS36vCKzfoHUTJOUEJHZulO9jZLzUp+vjfzQDIgaPKzM+7
         9UjqbeFi+xBpiB6ZNggQsaMr3c/zdkAz7vNnoscFNOZhYNStCgANY5/+/oOEoLUVuWn7
         LEtRZ1ckF6+3PrS5eu0QMzQeu1daN+y/j0CLXRHOJOGYj39xJYQ4cksCeKLaHnRmHskp
         ghgtnADDELPufqXdKMktFhFtotVB7bqkwoea86JXJwR3yonoHJakDkSCBhFgAJffrinw
         yssseJuCFxoPvK6phU73MwQAN+nO9x6kds1NnjlAy3baVRk+sPe0zTg/C5bYlYMqKZJY
         yLyg==
X-Gm-Message-State: AOAM5326ipirfzi1px4y/EPhVvACvJbSjMgS9cndUujxY/PyQg3RiuGB
        iY+LL1bOQb64SdIBABX7Lojt3XM=
X-Google-Smtp-Source: ABdhPJyL1DZXcZGnPUV+B06ZfrnB9Tblb5Z4e91WZYwHydSuUfJe04oo3xFTp2utb9Cfoqi/+eTqGA==
X-Received: by 2002:a02:3445:: with SMTP id z5mr12031366jaz.134.1596725365863;
        Thu, 06 Aug 2020 07:49:25 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id n10sm4371029ila.2.2020.08.06.07.49.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2020 07:49:25 -0700 (PDT)
Received: (nullmailer pid 838369 invoked by uid 1000);
        Thu, 06 Aug 2020 14:49:23 -0000
Date:   Thu, 6 Aug 2020 08:49:23 -0600
From:   Rob Herring <robh@kernel.org>
To:     Sebastian Reichel <sebastian.reichel@collabora.com>
Cc:     linux-input@vger.kernel.org, Ahmet Inan <inan@distec.de>,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Martin Fuzzey <martin.fuzzey@flowbird.group>,
        kernel@collabora.com, devicetree@vger.kernel.org
Subject: Re: [PATCHv4 1/4] dt-bindings: touchscreen: Convert EETI EXC3000
 touchscreen to json-schema
Message-ID: <20200806144923.GA838296@bogus>
References: <20200805160520.456570-1-sebastian.reichel@collabora.com>
 <20200805160520.456570-2-sebastian.reichel@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200805160520.456570-2-sebastian.reichel@collabora.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, 05 Aug 2020 18:05:17 +0200, Sebastian Reichel wrote:
> Convert the EETI EXC3000 binding to DT schema format using json-schema
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>  .../input/touchscreen/eeti,exc3000.yaml       | 53 +++++++++++++++++++
>  .../bindings/input/touchscreen/exc3000.txt    | 26 ---------
>  2 files changed, 53 insertions(+), 26 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/input/touchscreen/eeti,exc3000.yaml
>  delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/exc3000.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
