Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A8E9302B68
	for <lists+linux-input@lfdr.de>; Mon, 25 Jan 2021 20:20:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731026AbhAYTTW (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 25 Jan 2021 14:19:22 -0500
Received: from mail-ot1-f48.google.com ([209.85.210.48]:35474 "EHLO
        mail-ot1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731714AbhAYTS7 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 25 Jan 2021 14:18:59 -0500
Received: by mail-ot1-f48.google.com with SMTP id 36so13865470otp.2;
        Mon, 25 Jan 2021 11:18:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ErqAg2y9hs1L+kCRiFT/cc4ljw/VF8qC2nINOTViShA=;
        b=tSuB3/2WINckNJoF9j/LP7D4bzzDosYCnR8Xp0LunQRAzQHxE37FJYTEX6OvxraMzX
         uOcz/NEIGMtZAEamy+B6K6TPjJ7S7Xn0h1KTZq2VFgK/yPfmuljK1acZjk3E9eyeX+tz
         B7AsV9f/HPIw6zK9+9ZTc6YEM8kt6lF1OU+09PpFKus3gDOoZm4VlgpKemkkyu0r9kRo
         LoEI8Gdb+2kgXOVfBp1sXLWpviJ3BfMK7UCaKHyyL/P1JnFGPKPRhoUVcvDt/a8DMStD
         E0AvkrbgBjyn9HxgOISbDaJiSbpKq4E//ltZtN0Ygd507jHqPC7F4v/aXPiYybnbEV1y
         3zVw==
X-Gm-Message-State: AOAM533/IXd63oCJEelLURGz3wnRZvwcqoMYsJ0J7XvKKRUjRbE8vOBs
        QplRwexBDJtYw4sJ0jWYXC2bjlLDFA==
X-Google-Smtp-Source: ABdhPJxS3Td2D1qEwVYkiS0V5TCXWefaoE1oDxv4liSO3HZpq6boaHywUbznHMOC01Lk9pSB968fsQ==
X-Received: by 2002:a9d:65:: with SMTP id 92mr1439847ota.207.1611602085885;
        Mon, 25 Jan 2021 11:14:45 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id m9sm2172811oih.35.2021.01.25.11.14.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jan 2021 11:14:44 -0800 (PST)
Received: (nullmailer pid 790835 invoked by uid 1000);
        Mon, 25 Jan 2021 19:14:43 -0000
Date:   Mon, 25 Jan 2021 13:14:43 -0600
From:   Rob Herring <robh@kernel.org>
To:     Samuel Holland <samuel@sholland.org>
Cc:     Maxime Ripard <mripard@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        devicetree@vger.kernel.org, linux-input@vger.kernel.org,
        linux-sunxi@googlegroups.com,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-kernel@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>
Subject: Re: [PATCH v2 1/3] dt-bindings: sun4i-a10-lradc-keys: Accept
 wakeup-source property
Message-ID: <20210125191443.GA790778@robh.at.kernel.org>
References: <20210113040542.34247-1-samuel@sholland.org>
 <20210113040542.34247-2-samuel@sholland.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210113040542.34247-2-samuel@sholland.org>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, 12 Jan 2021 22:05:40 -0600, Samuel Holland wrote:
> The LRADC provides an interrupt that can be used to wake the system.
> Signify this by accepting a "wakeup-source" property in the binding.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
>  .../bindings/input/allwinner,sun4i-a10-lradc-keys.yaml          | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
