Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C9282D71AC
	for <lists+linux-input@lfdr.de>; Fri, 11 Dec 2020 09:27:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436868AbgLKIYD (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 11 Dec 2020 03:24:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2436850AbgLKIXz (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 11 Dec 2020 03:23:55 -0500
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 227CBC0617B0;
        Fri, 11 Dec 2020 00:22:34 -0800 (PST)
Received: by mail-pj1-x1044.google.com with SMTP id z12so1832639pjn.1;
        Fri, 11 Dec 2020 00:22:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=XcEcSr5to6HvuNXKcfIecpj69ar1vtmfturacBpcHIQ=;
        b=lufsuZX6rG1AE4MtLo652LHCiVXgZaZfH00Ei6n7KHyDwrlzSufHN8EDaszRMANdfe
         Id6jkC5Y6VAb3F5e5WKzfXaC0DsdbmbmrNxbY2II42T55isrVwD8Gv2M1C1jHmGr78WE
         PqvSMk2jr766ajEafF9FySWOAuPG65i+/onGW8h1q1PqW51Qga8UQWG4AYgJX9ryL8Gu
         0SaO3BRwAOelP2ZWeNCLydU7j+gOjM234jUU7+5kSdBCZw7aWrWwJkcNbHNgf8CQyxpR
         3Reytt0GXXeGD337rHmRtnn4sL3aKmFEdcUlExaL60V+AkCIwxTVhtTZwAnR7qbxZe1A
         /Gmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=XcEcSr5to6HvuNXKcfIecpj69ar1vtmfturacBpcHIQ=;
        b=QOw09tWS4jaNhOKAzMTiKL4NUol3b2aI+GGBhhUcSt7LTJkrOK7fF9z0R+WTMDkbVW
         tjPGB524xA3lEZs8T2MA6pSAxyMp8Ev8KoyTqrxel8gnPx+oRqGy1DOrffKyUMbja8Up
         wN2A5Xb30YJsUeeTerTmeRxaPe5UCz9Dj2LEHcmAOd/YkwRWXzsyLDrx5If3iKwCDJlX
         O4FSgbBcl4MyR2QtBAosrFuoiBm6Sw9Q1c6fHQFg0aNgFqk7p4H0ax77RUqQj5pgw0hm
         qJqrbckmz4ujjpTXBDUH5GqzuqBsO068w0W3Zv0yJo2/hAZP/soUTHVzotFfTdMC34Yf
         hHBg==
X-Gm-Message-State: AOAM533of7xdOoVFkFgbJDxtftPGcEZSWRzUitrEExTvbpwkenC3kin+
        5RQtT+Oj8tY2ZI4s8b/PdJDLOrCSO7o=
X-Google-Smtp-Source: ABdhPJyZt6bpYaVg/TXsjnbwtU3bbU35k1LS0TVb+MLh8YLNn7keJeFBAo0g/I/TXzsyVLfsYUVqAA==
X-Received: by 2002:a17:90a:bf05:: with SMTP id c5mr11967824pjs.95.1607674953735;
        Fri, 11 Dec 2020 00:22:33 -0800 (PST)
Received: from google.com ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id a23sm9170960pju.31.2020.12.11.00.22.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Dec 2020 00:22:32 -0800 (PST)
Date:   Fri, 11 Dec 2020 00:22:30 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Roy Im <roy.im.opensource@diasemi.com>
Cc:     Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Support Opensource <support.opensource@diasemi.com>,
        devicetree@vger.kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [RESEND PATCH V20 2/3] dt-bindings: input: Add document bindings
 for DA7280
Message-ID: <X9MsRoE4esfVMTDY@google.com>
References: <cover.1606320459.git.Roy.Im@diasemi.com>
 <2bc9a4a9d083ea8f360ec75f6281b6de6c4ef284.1606320459.git.Roy.Im@diasemi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2bc9a4a9d083ea8f360ec75f6281b6de6c4ef284.1606320459.git.Roy.Im@diasemi.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Nov 26, 2020 at 01:07:39AM +0900, Roy Im wrote:
> Add device tree binding information for DA7280 haptic driver.
> Example bindings for DA7280 are added.
> 
> Reviewed-by: Rob Herring <robh@kernel.org>.
> 
> Signed-off-by: Roy Im <roy.im.opensource@diasemi.com>
> 

Applied, thank you.

-- 
Dmitry
