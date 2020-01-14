Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0C56113B5DA
	for <lists+linux-input@lfdr.de>; Wed, 15 Jan 2020 00:30:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728874AbgANXaO (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 14 Jan 2020 18:30:14 -0500
Received: from mail-oi1-f196.google.com ([209.85.167.196]:44715 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728978AbgANXaN (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 14 Jan 2020 18:30:13 -0500
Received: by mail-oi1-f196.google.com with SMTP id d62so13596853oia.11
        for <linux-input@vger.kernel.org>; Tue, 14 Jan 2020 15:30:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=fIrwJWeNixjwwvurnQiJ8LKkUrdrIhXQmbfrBg5Oibw=;
        b=Ib0ZdLYWVRuEV1lovA8Mbpa29E8hM8S02yGRcBAsqQXTHAUoA8APFPbL8m2lcrh+kL
         2WpXUBgfYHNBQk91NHS1oh9981j6+fLtnEuxgj2FnOtoW2G6ewRODBozR57ozZAY6eyK
         PZUnbLFfzB9LyaAHDxMRm6AAhkB8GLY3ZT9One4vSH3DLWv2X4oXTLUeuC3/QEUEp00u
         QaYOKf/l25fR3fikPXnoE6XzSwoFvzWpvh/G9kUYInii+d8eUD16ghIdbh6W/YCSwL8D
         xYUKt7gzNDQlnbeQtf2Q1te60rr/DiNBzqrUeXQ+q/SPt68KihxrdrN9wCtWMcNjVCDf
         yBWA==
X-Gm-Message-State: APjAAAUNeAOhgly7hrxGi18WiZBOqI54IySpwYxlE8vRuIzJyFWymA78
        a6+XrE4P0GZG0R3F3qZTxAGRZg4=
X-Google-Smtp-Source: APXvYqz8aHJbaIlHW8D4unixxAF1Rrv7ZZ3ohxxbaYkicoILa1AgCyDtGABAky8CjtS7z9e74qygAQ==
X-Received: by 2002:aca:cdca:: with SMTP id d193mr19078217oig.152.1579044612354;
        Tue, 14 Jan 2020 15:30:12 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id n7sm5089891oij.14.2020.01.14.15.30.11
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2020 15:30:11 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 220a2e
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Tue, 14 Jan 2020 17:30:10 -0600
Date:   Tue, 14 Jan 2020 17:30:10 -0600
From:   Rob Herring <robh@kernel.org>
To:     Benjamin Gaignard <benjamin.gaignard@st.com>
Cc:     dmitry.torokhov@gmail.com, robh+dt@kernel.org,
        mark.rutland@arm.com, hadess@hadess.net,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, yannick.fertre@st.com,
        Benjamin Gaignard <benjamin.gaignard@st.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: touchscreen: Add touchscreen schema
Message-ID: <20200114233010.GA21560@bogus>
References: <20200108091118.5130-1-benjamin.gaignard@st.com>
 <20200108091118.5130-2-benjamin.gaignard@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200108091118.5130-2-benjamin.gaignard@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, 8 Jan 2020 10:11:17 +0100, Benjamin Gaignard wrote:
> Add touchscreen schema for common properties
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
> ---
> version 2:
> - remove old definition in touchscreen.txt
> - add type for all properties
> - add dependencies between properties 
> 
>  .../bindings/input/touchscreen/touchscreen.txt     | 40 +----------
>  .../bindings/input/touchscreen/touchscreen.yaml    | 83 ++++++++++++++++++++++
>  2 files changed, 84 insertions(+), 39 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/input/touchscreen/touchscreen.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
