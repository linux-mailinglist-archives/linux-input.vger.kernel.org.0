Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2B1F35ED26B
	for <lists+linux-input@lfdr.de>; Wed, 28 Sep 2022 03:04:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229907AbiI1BEb (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 27 Sep 2022 21:04:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229567AbiI1BE3 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 27 Sep 2022 21:04:29 -0400
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24C171E0C4D
        for <linux-input@vger.kernel.org>; Tue, 27 Sep 2022 18:04:29 -0700 (PDT)
Received: by mail-pf1-x42f.google.com with SMTP id b23so11148590pfp.9
        for <linux-input@vger.kernel.org>; Tue, 27 Sep 2022 18:04:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=gUHOLGJJtszepWK53mpqIg6cE11EZhwhUrj8SWBOZGc=;
        b=WgGV3xsEHph6cuzdn4IAFvDoi34E5H7r+oNrZQkZB7f6FYoMiGvNMQ0muMK4HWs0+c
         1mANU74EWCq3yMCINP9kD0JmWKiEsbFhljEKv/zRFFSoe03jY938dFdGg0as0lgpZ2ol
         Z8fzjKAWjaDu97SXjzHXt9hymjyuGQpgcxXV1w/UvJ8+6pfvO20gs7UgO350R4YNfTY8
         TrOs38HoJozmXhMmkX1daCpvU6x0HcPLCChGkVmPQnr6KVNpqlYP5+OPAA34Rv41FFKS
         l4McoBhqFhdO1pn9LCp6ONpe4D3rgKU5aNahuit0DJgydwgXfOCbrWeZSWhj9QS4pAkL
         TyFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=gUHOLGJJtszepWK53mpqIg6cE11EZhwhUrj8SWBOZGc=;
        b=W1SdKWdV4gn8+DNonlp+Boo2bWnPFurri5qjZbhl4HdqhnveVfwPUBmYDrNPA8GnGK
         dU8BYHW4lgpF4VUIbFwOTazNkau8JvJlFgpBjyImROMmlzZE8hn6/+wTsBzAj6EUVjgZ
         R5lekjhCT+5kR+3W28Ck2MbQ8U5cSAO2te5HlDsvf8KH+HCk9TseqtZJK7d1mSrfDUGA
         75MSZWLJizHFbd9tLBYSXaNYRVLMY26sXw9r2Ob8476n4yAtkqA4YyO6SfMvyx7LPX9q
         bsuLVIXr8RpOdgs3zCcnSELGPvyOFeUumobA4fgrrY/opfdPejvC/Ixhnjcepb2lPzxC
         M2Mw==
X-Gm-Message-State: ACrzQf0bhkSOUD9Tz35vN71Gg74lTITCLyKLLH/CMieu4HWSuq2qtJgS
        ubitQaHcedat9cn6xXSXNFg42RJ6ktk=
X-Google-Smtp-Source: AMsMyM5xcAZTCeC3EHG8LgvPMRgZkMl8vj7mMAGf7akT9bWVwdubM5u0Pl/wH8ZlUrsUDeYngsBMKA==
X-Received: by 2002:a63:2c8b:0:b0:41c:5f9e:a1d6 with SMTP id s133-20020a632c8b000000b0041c5f9ea1d6mr26428152pgs.601.1664327068458;
        Tue, 27 Sep 2022 18:04:28 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:1a91:59b8:faf:7b4f])
        by smtp.gmail.com with ESMTPSA id p7-20020a170902e74700b001789ee5c821sm2249444plf.61.2022.09.27.18.04.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Sep 2022 18:04:28 -0700 (PDT)
Date:   Tue, 27 Sep 2022 18:04:25 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Pavel Rojtberg <rojtberg@gmail.com>
Cc:     linux-input@vger.kernel.org, gregkh@linuxfoundation.org
Subject: Re: [PATCH 2/2] Input: xpad - decipher xpadone packages with GIP
 defines
Message-ID: <YzOdmepnphyV333D@google.com>
References: <20220913213133.584979-1-rojtberg@gmail.com>
 <20220913213133.584979-3-rojtberg@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220913213133.584979-3-rojtberg@gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Sep 13, 2022 at 11:31:33PM +0200, Pavel Rojtberg wrote:
> From: Pavel Rojtberg <rojtberg@gmail.com>
> 
> only renames, no functional changes. Some of the packets we send
> seem superfluous now. Unfortunately I dont have the hardware to verify
> whether they are.
> 
> Signed-off-by: Pavel Rojtberg <rojtberg@gmail.com>

Applied, thank you.

-- 
Dmitry
