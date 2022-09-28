Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 765C25ED26C
	for <lists+linux-input@lfdr.de>; Wed, 28 Sep 2022 03:04:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229567AbiI1BEc (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 27 Sep 2022 21:04:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232231AbiI1BEV (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 27 Sep 2022 21:04:21 -0400
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29FE51E0C5B
        for <linux-input@vger.kernel.org>; Tue, 27 Sep 2022 18:04:20 -0700 (PDT)
Received: by mail-pl1-x62a.google.com with SMTP id x1so10531564plv.5
        for <linux-input@vger.kernel.org>; Tue, 27 Sep 2022 18:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=H6q5F+koHGNFm48jEtQ8bmf+yjStzztQJMUsXWNr1QU=;
        b=XU9IQ/N4ZlBnSHZUHDKyf7nKRllOOoQIAItEIfAr8JLS/OtmrQI49D3TaqileKRpNr
         Fz6/bCvC9wUNzYg6a7cR9VNQxbeD3OdeuP8J1Ccfvm4eicSWMTTzO/bI/vpcIWaYCyTi
         9g5cU5R6cJ8YSck0qO/gXtgLVr7oYoAwH6AszWKPTVDryAo4tt0FJUNfpCmV+ISPmcdM
         4Fj8NgJ5rPbuRdmPc2RWbQ41lXUv/yXiM+FyQk2Ko8trE0TkaavjUxDl5F85r2Tc9AUK
         FUHFBxF9M1UYZ9Kn02rOvRWouCzrl4A5jlG0T+65M3xHlhBD1udnr5n9vJ0WvPiUL8WB
         dr7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=H6q5F+koHGNFm48jEtQ8bmf+yjStzztQJMUsXWNr1QU=;
        b=kJZ6wgM96682Csl7RZUbM5PPQ0DoE3eVNl9GHOBGkSFgCrDSlqH012u4K8DLtKE9QF
         IGdm77p8P52uJuAwmKGih5crLEH6ePnlk3zoXBP9sEG8PlqbzIEDFvmZJUbmfQi0YpLK
         li3Y08iHiC4C+FQt5cEFfbkjtSAe47G+vc3uuijJBIcYOfMuaxd9Wzn6DBM7/w3YyXCX
         670HLF4PLPPXRo6ed6ZqTnvRgITGnEk/RegGe3gnUGDpgoyS/GEgT2j0k0FGLQHHUPjM
         n9YO29w4YDTPVzqqAGm/BLb/Tf7qyS5hzRSzKLwVHLPKenDV+/XnShOVODsoF1TK+KW9
         UL5w==
X-Gm-Message-State: ACrzQf32ne7PBw4eQSokKnq72A/98onkqcw/cxPTg1b0egGscxU3ddO0
        vWYJtjPVto8Ma/bcOGikOIJ90Bd4x1Y=
X-Google-Smtp-Source: AMsMyM4LVJXLo3eOGv5hrziaU+tQLarF82FTXs6vicXmibIYEyT0SVJe5cYSW+U1bUCNWw9uXw4MFw==
X-Received: by 2002:a17:90b:4c8a:b0:202:b3cd:f960 with SMTP id my10-20020a17090b4c8a00b00202b3cdf960mr7543555pjb.129.1664327059536;
        Tue, 27 Sep 2022 18:04:19 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:1a91:59b8:faf:7b4f])
        by smtp.gmail.com with ESMTPSA id f68-20020a625147000000b00537eb0084f9sm2505057pfb.83.2022.09.27.18.04.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Sep 2022 18:04:19 -0700 (PDT)
Date:   Tue, 27 Sep 2022 18:04:16 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Pavel Rojtberg <rojtberg@gmail.com>
Cc:     linux-input@vger.kernel.org, gregkh@linuxfoundation.org
Subject: Re: [PATCH 1/2] Input: xpad - refactor using BIT() macro
Message-ID: <YzOdkGkkA9n+hFEN@google.com>
References: <20220913213133.584979-1-rojtberg@gmail.com>
 <20220913213133.584979-2-rojtberg@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220913213133.584979-2-rojtberg@gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Sep 13, 2022 at 11:31:32PM +0200, Pavel Rojtberg wrote:
> From: Pavel Rojtberg <rojtberg@gmail.com>
> 
> reduces the amount of magic numbers and makes the code more readable
> 

It is nice to include headers defining used APIs directly, so I added
"#include <linux/bits.h>" and applied, thank you.

-- 
Dmitry
