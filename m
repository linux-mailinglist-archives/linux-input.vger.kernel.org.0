Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 363542EB54E
	for <lists+linux-input@lfdr.de>; Tue,  5 Jan 2021 23:22:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727008AbhAEWWG (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 5 Jan 2021 17:22:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726306AbhAEWWG (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 5 Jan 2021 17:22:06 -0500
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2A51C061574;
        Tue,  5 Jan 2021 14:21:25 -0800 (PST)
Received: by mail-pl1-x629.google.com with SMTP id t6so524560plq.1;
        Tue, 05 Jan 2021 14:21:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=UdG2SC7kDwBcsA3Hnj9cpw6DXDt6rLi9pRoI/LYlp+Y=;
        b=GEDZAZC/Ve5dK7dgu/OtLH3a5TFyYeajGf8O6AP5C1yHVx1pgvJY3rrU3oinarOqLG
         9d2JLbzY+jPwVEdIuCT4TCE1p+DYwVn6VI/EsCYPrHlIZglHsCurJicfcbC1/kY6myGZ
         dkdMUZBR1JDNA5Su62YneqSX/Qc24iKRAwf00tqKLdVw6Y+/dTsZdFGM10n4c1o+KDVY
         PK0MoQChFIarvQtPqvItHYsePwPYel6ohOKYFFCPRefLPZPDJiurqsj/gKLhjuGUCTcy
         UAXFEov6v2EZNS3t1FX2DjbHuwHVvE/lfRLdc31CnyL7uz4HtKasR7Umebyvvp2//8zA
         lPkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=UdG2SC7kDwBcsA3Hnj9cpw6DXDt6rLi9pRoI/LYlp+Y=;
        b=c9cbonBBul4PrrWun0WoN+hsq9K2xDtp7LCiOoiNqag6pryCaa5tBYXgKmGB30Mvxa
         IKuul0pBDAuTRhan9vRS4J6CzJIH2+Ruy0+5f7uPEjcfwr0+9ooWG9HJFLtIEgBtDTir
         wS5YDVKApWlMWJJy6psWkp51aSVzQR1HNSqpiAioh0Xv457aAygkDGPrToXbQoCSPxqz
         duBBSh/uFOigvnvF5gfAG61P4AXZ0oiO5Ez3TZ2muIKuTGYmtPNPNMBQ97D4z3Q6d3U1
         RpvmoKWCuI2YshjmGdWQM83OfAdQrKcsFlxYxfVDdtKzdMFS4QLx1zlK2kxRumSBQ61J
         VqOA==
X-Gm-Message-State: AOAM530039+xQPi3D274BXZocvpyqc+tUD5E/yZHUG7wsNEGfpkYrh4c
        AcOF9O755yLh5PGTgA7yeWY=
X-Google-Smtp-Source: ABdhPJxQn1m7NqTw6ysIM+RrHWp4pPKEikNtONNvAaS5SYaxo+ZpewASW2T/RGhN/hkc2Q0iNbEi3A==
X-Received: by 2002:a17:90a:8b8a:: with SMTP id z10mr1247004pjn.67.1609885285130;
        Tue, 05 Jan 2021 14:21:25 -0800 (PST)
Received: from google.com ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id fw12sm203527pjb.43.2021.01.05.14.21.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jan 2021 14:21:24 -0800 (PST)
Date:   Tue, 5 Jan 2021 14:21:22 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Heinrich Schuchardt <xypron.glpk@gmx.de>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] dt-bindings: adc-keys.txt: clarify description
Message-ID: <X/TmYvLivYJcFBkd@google.com>
References: <20201222110815.24121-1-xypron.glpk@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201222110815.24121-1-xypron.glpk@gmx.de>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Dec 22, 2020 at 12:08:15PM +0100, Heinrich Schuchardt wrote:
> The current description of ADC keys is not precise enough.
> 
> "when this key is pressed" leaves it open if a key is considered pressed
> below or above the threshold. This has led to confusion:
> drivers/input/keyboard/adc-keys.c ignores the meaning of thresholds and
> sets the key that is closest to press-threshold-microvolt.
> 
> This patch nails down the definitions and provides an interpretation of the
> supplied example.
> 
> Signed-off-by: Heinrich Schuchardt <xypron.glpk@gmx.de>

Applied, thank you.

-- 
Dmitry
