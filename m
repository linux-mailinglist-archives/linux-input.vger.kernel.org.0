Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77436375C31
	for <lists+linux-input@lfdr.de>; Thu,  6 May 2021 22:29:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230216AbhEFUaG (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 6 May 2021 16:30:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229951AbhEFUaG (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 6 May 2021 16:30:06 -0400
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A0A0C061574;
        Thu,  6 May 2021 13:29:08 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id a11so4015943plh.3;
        Thu, 06 May 2021 13:29:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=iwf+nOOCEgbUxlspUEBgEc5odgKJ47dzf/SoGf1/jEI=;
        b=OCm4UjrM9h/x4t3WwBBRE8jhRIRA1NleXc4ilmOhPY48Fxr7UJZycxS/wvffN4/5UL
         PR4+EL3udgdTZK9F6si4EKKlxift2e94SFzw8br09EFPSMfXDbe52Ukaoaj9LZYVDUKP
         h9dpb3ae+wX5IZSXyUBJxJPfJ03IBUuQK7cT0p/KvD9VM3Dkdcqlhf+nuXzoZgo0bXfC
         dvkBdy/qP6TlP5Ggqk4W78o+HXtJkn9dcB7HAQCFdgsQnsxs+1V/GlU1uzJ1hEJwUbbj
         m/n94O/PxLHvNCMQIORz4cQqbj1P2OsEmgDMKldiuTmdqKRBTjh4vN+JZ0z7oJkcPjJe
         psYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=iwf+nOOCEgbUxlspUEBgEc5odgKJ47dzf/SoGf1/jEI=;
        b=sb3afbhONCph88Wl05EU3WMHfkas6aVCGEOilVcCOeC67KQi5vIw8dGB36UjKN6zSu
         94MtcAkp3/lE2TtK6Pm9cgr5DEtBE6U8tJOs5M/27HVhBL+co9w4pvow74sIW5bWtPeJ
         6/gvz7Eos3ADmTPZgX/383Hs3GnpR6naKUbGuGCFEcLkqTIysRD2tr/RMgf5JckP9kz3
         rrWnMgoAlRUf1BwUuJZCKh8Ezkk6ezruH7AI7ilGmcehzwZUIjsKdKUA+hGeWiWFTgt4
         QN23EBO/uL0f4uG2K+RTHG0bnFAtTC2vfB13PGO+CPa9dssg14D/W8CPqK5pASvEyxN1
         afLA==
X-Gm-Message-State: AOAM530SW8R1EOpur5aPw6jE1vkaepckXXXzP7U7IzDQ06rWfmUMxM/n
        GAwbvC6gmcdUHbT7TlFuXYVqWh5TBNI=
X-Google-Smtp-Source: ABdhPJzRvJ8Xs12E62UYAaLeWVH4m8lwKjjSj9dqbTJCKkyPfyCNxGXCdYuabHXlpsNOFfYURU74XA==
X-Received: by 2002:a17:902:74c5:b029:ed:d41:1ca0 with SMTP id f5-20020a17090274c5b02900ed0d411ca0mr6456670plt.66.1620332947595;
        Thu, 06 May 2021 13:29:07 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:5228:3770:a497:742])
        by smtp.gmail.com with ESMTPSA id v185sm2773820pfb.190.2021.05.06.13.29.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 May 2021 13:29:06 -0700 (PDT)
Date:   Thu, 6 May 2021 13:29:04 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Hansem Ro <hansemro@outlook.com>
Cc:     marex@denx.de, mjsakellaropoulos@gmail.com,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] Input: ili210x - add missing negation for touch
 indication on ili210x
Message-ID: <YJRRkMOfkxEfV/+9@google.com>
References: <a07a1804-28cd-bd07-f3cd-3307be433534@denx.de>
 <DS7PR19MB442159ACE7E2C03013917956DD589@DS7PR19MB4421.namprd19.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DS7PR19MB442159ACE7E2C03013917956DD589@DS7PR19MB4421.namprd19.prod.outlook.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, May 06, 2021 at 12:38:19PM -0700, Hansem Ro wrote:
> This adds the negation needed for proper finger detection on Ilitek
> ili2107/ili210x. This fixes polling issues (on Amazon Kindle Fire)
> caused by returning false for the cooresponding finger on the touchscreen.
> 
> Signed-off-by: Hansem Ro <hansemro@outlook.com>
> Fixes: e3559442afd2a ("ili210x - rework the touchscreen sample processing")

Applied, thank you.

-- 
Dmitry
