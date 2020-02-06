Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 36B47154E61
	for <lists+linux-input@lfdr.de>; Thu,  6 Feb 2020 22:53:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727441AbgBFVxZ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 6 Feb 2020 16:53:25 -0500
Received: from mail-pg1-f196.google.com ([209.85.215.196]:39310 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726765AbgBFVxZ (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 6 Feb 2020 16:53:25 -0500
Received: by mail-pg1-f196.google.com with SMTP id j15so8448pgm.6;
        Thu, 06 Feb 2020 13:53:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=8T1V38W5InTL1ntbQpn0paEkXJSeVE+sBMZNsYeKt+Q=;
        b=PE4KOYnVhZgLSmguPfsstdtbWmCsvGlpxamc96BgxMXizuK97gs8RwoYdURG98tzGC
         utodzcg3tlb/e2hTbYIAAjOmqzEHlW/WcrRQYqu7YA/r6PYzc0F+ieLc6jqpb+FCDT62
         dFWIcFGmEBcQsxBEhBNKRFPPEkmJKWlvkpKn9TAr6dtzeb2NxriZA4Eo0GXaRpSK8B+L
         u32TSGU80NNUbhONVhBeBICitaUvCGOyZKKFgRinovptOHeIiN07ACoxXQ4Gm0kuGIZK
         +dDAZdT37Wk1cH4JPaIPhDiJJeUPWOtrBuGfTxVppYdNN6Z7PneA5MMeSBRtWGHfl2SG
         kjZw==
X-Gm-Message-State: APjAAAX0Ivs7Lt6GgQr4Me0iRuG5DFbsN27xJZRRdRxwddN/YoF4VKm9
        BCO31qQHlR9DX77GqGEP2Q==
X-Google-Smtp-Source: APXvYqxwfSB9rD8wKssgqYc0bxXd5ezj/OQINqf5YEcYx/FXYBgHAuI127vduMLt5QWUIz7pAyzY7g==
X-Received: by 2002:a63:6c09:: with SMTP id h9mr5884788pgc.34.1581026004705;
        Thu, 06 Feb 2020 13:53:24 -0800 (PST)
Received: from rob-hp-laptop (63-158-47-182.dia.static.qwest.net. [63.158.47.182])
        by smtp.gmail.com with ESMTPSA id y6sm360844pgc.10.2020.02.06.13.53.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2020 13:53:24 -0800 (PST)
Received: (nullmailer pid 13011 invoked by uid 1000);
        Thu, 06 Feb 2020 21:53:22 -0000
Date:   Thu, 6 Feb 2020 14:53:22 -0700
From:   Rob Herring <robh@kernel.org>
To:     Benjamin Gaignard <benjamin.gaignard@st.com>
Cc:     dmitry.torokhov@gmail.com, robh+dt@kernel.org,
        mark.rutland@arm.com, megous@megous.com,
        mylene.josserand@bootlin.com, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Benjamin Gaignard <benjamin.gaignard@st.com>
Subject: Re: [PATCH v2] dt-bindings: touchscreen: Convert edt-ft5x06 to
 json-schema
Message-ID: <20200206215322.GA12956@bogus>
References: <20200206101434.30209-1-benjamin.gaignard@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200206101434.30209-1-benjamin.gaignard@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, 6 Feb 2020 11:14:34 +0100, Benjamin Gaignard wrote:
> Convert the EDT-FT5x06 to DT schema using json-schema.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
> ---
> version 2:
> - preserve formatting in description
> - use 'const' rather than 'enum' for reg property
> - fix max/min issues 
>  .../bindings/input/touchscreen/edt-ft5x06.txt      |  75 -------------
>  .../bindings/input/touchscreen/edt-ft5x06.yaml     | 123 +++++++++++++++++++++
>  2 files changed, 123 insertions(+), 75 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.txt
>  create mode 100644 Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
