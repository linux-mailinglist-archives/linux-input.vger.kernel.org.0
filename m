Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD4E83AD7DE
	for <lists+linux-input@lfdr.de>; Sat, 19 Jun 2021 06:39:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231331AbhFSElV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 19 Jun 2021 00:41:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229971AbhFSElU (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 19 Jun 2021 00:41:20 -0400
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94C14C061574;
        Fri, 18 Jun 2021 21:39:09 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id x22so4172491pll.11;
        Fri, 18 Jun 2021 21:39:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=iyt/u0jv88QbcDTXxMYPiGMZ2lbJ769BQa65qiSt3+I=;
        b=PWWjroFi8DJuu/g1kd9BLqWBaSCLeB7Kh4YEJpDee2qeWP9I313BYpyQ0XOLTuT3Gp
         sEk4j3KDxdSh/GN3Bre10sDzX/CamOfW9Hc40NyShDaBYwYcXRPDEHGxCBpExny24E7+
         H3X3W9p4sHUZ8FRoZ29ItH5OaxBpPDBhQrZtqhZ+B2ZtzdiJYRlVSjFzFfq2O2p1mwcL
         +Ipst2JYQHc6yj6ztGw1BlSArKbtNOBm5Kp3BONMizf05CHWH4rgXfYUcYY22Sn3WJlV
         YMtAbbwFTiK6huJ9cmfpSrnPTFvvE6k5U6VU43Q7PnSmaLgQGm7DvQhswLWSNWvmto5B
         /RWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=iyt/u0jv88QbcDTXxMYPiGMZ2lbJ769BQa65qiSt3+I=;
        b=G4dq+R3g0CE2dm4JV/MWgOF+e4NQ4N5mHDwsV1M9HOl+LUKdL6BMlYdv5vQOpGNkAL
         iTT/rV81RrSzwN9u2vtL2tyrvpgtfcroxW6dHZG82YEML0QZ1BJAgUo3vcTjtMoKE74h
         fqp20w3+nATIenhfS2uDULZnMzIr9ukIOrT4C3eik1nPnEANNyQklJjqAq+YuuKIVDek
         2PJZdjkugp2Jk7aSDxkep5RTLnpcDlmsG5f7bS680kS1sVJ/1+NYcHsXTT8sn7ZY9Eix
         J3dWAEwvnBbH46XaLNBR8Wyg4g6HoP12iM/JG7LaLt7CMgwAFK5AGU6ohY88E8n25HEk
         o9rQ==
X-Gm-Message-State: AOAM5331CbPU4XHQTT1s89AJYj00brTzI6nHUdER8ndL5+mVYuU0Xw2S
        /XAH+eiKa1iRoEKp/USoo2k=
X-Google-Smtp-Source: ABdhPJwPqSnvVnqHoI2MsnY7GW5M9bLxDRGh6JTIQ26ZFojwKt0a94ksr/PB/hmoaQ+Qo3ncbSJPYg==
X-Received: by 2002:a17:90a:390d:: with SMTP id y13mr25120531pjb.133.1624077548304;
        Fri, 18 Jun 2021 21:39:08 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:4b8:6c70:14fd:a727])
        by smtp.gmail.com with ESMTPSA id o72sm3958677pfg.102.2021.06.18.21.39.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jun 2021 21:39:07 -0700 (PDT)
Date:   Fri, 18 Jun 2021 21:39:04 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Rob Herring <robh+dt@kernel.org>, Bastian Hecht <hechtb@gmail.com>,
        Martin Kepplinger <martink@posteo.de>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: input: touchscreen: st1232: Convert to
 json-schema
Message-ID: <YM106GBekX7aPxer@google.com>
References: <fbba650cff07780c28ad6dd8dbef5cc1451b7762.1623418065.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fbba650cff07780c28ad6dd8dbef5cc1451b7762.1623418065.git.geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Jun 11, 2021 at 03:30:05PM +0200, Geert Uytterhoeven wrote:
> Convert the Sitronix st1232/st1633 touchscreen controller Device Tree
> binding documentation to json-schema.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Applied, thank you.

-- 
Dmitry
