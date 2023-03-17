Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4FF426BE762
	for <lists+linux-input@lfdr.de>; Fri, 17 Mar 2023 11:58:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229924AbjCQK57 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 17 Mar 2023 06:57:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229849AbjCQK5x (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 17 Mar 2023 06:57:53 -0400
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4255E91A4
        for <linux-input@vger.kernel.org>; Fri, 17 Mar 2023 03:57:46 -0700 (PDT)
Received: by mail-pg1-x533.google.com with SMTP id d22so2636659pgw.2
        for <linux-input@vger.kernel.org>; Fri, 17 Mar 2023 03:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679050666;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ji1XGbCMTjPNvpQPg1Xxsq0AhwgOAWcjGkaQzkYl7Vc=;
        b=frdnNBoLSbKvQA152azJ0uX+nO+xhsD4IbUT442WuP7zh+7jkEExL/i95kyQ19owLQ
         Viy1LWbX8LjTXqGnrQ2f8ao9xkMNFAY7IWR/iUn9For5YrzsF8ejkacN657ymdB8JT2Q
         WbXXPfnpFOOfqnAfUC86eV4wO6SNj3kvvulwcJcm5UID8zdxUg9No+1iDRQVuRB5zGSC
         ZwJ4lPzbB1+xvtFyT2lmDYzy7F+Bepu+R+imWE5ZJXMz9saKCY7iVvTRGWX9Nj9Eu2mp
         f2G9k+KIZFkuC1mG/1lQF+7b9mcXoMcYjMCF+yA3duiyNYfM9vTtkYTXeH/NuwyTNNr6
         kBwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679050666;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ji1XGbCMTjPNvpQPg1Xxsq0AhwgOAWcjGkaQzkYl7Vc=;
        b=n9TEFDORnLVCOe3ALpCxX+5rNce2elGwQpvevX3jqy9gCB2UTNivIFBybo2bpXSGl6
         oH35H1frIQ5dETnZYkjyx6LCbBQ1tvXcMIlIg/ifeYR/DUl0d5KN8rSOJkzG+WjgH3cM
         wGkgxdrMPThy+lsim4Rkz7zWvCjsELzz090teaVAN2PDDYeozJpTBXH9YaakZFCkScNv
         kBEL154kBIofp33bMN6MNs4zHSkffZiktl+5H1VY9DSeEtdzaBtNUkrJKzUlsTK82kcO
         OPBP2K8Jxu00553xdOut5qSIY2cfC2ChyIC9Fj4edO7JN0hzix/9zwPfz5Ng421q7IWX
         LpwQ==
X-Gm-Message-State: AO0yUKVrWhLyndqhiO+Or9eVuVPi8VsxANE3nBZOkh5yUx7aBC2AbfRR
        Anfe4bAufGGtPPGUPAJqO8NuDkded2ns1w==
X-Google-Smtp-Source: AK7set8yVStpbjnGGCGVwsuHChcbYHk/879YItZ7qehcPFBBVlbhYEEeHP50MZDtodFiKeN4qyB5fg==
X-Received: by 2002:aa7:8f37:0:b0:625:d875:5987 with SMTP id y23-20020aa78f37000000b00625d8755987mr6570413pfr.6.1679050666316;
        Fri, 17 Mar 2023 03:57:46 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:d084:8252:e846:af61])
        by smtp.gmail.com with ESMTPSA id i21-20020aa787d5000000b00571cdbd0771sm1289446pfo.102.2023.03.17.03.57.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Mar 2023 03:57:45 -0700 (PDT)
Date:   Fri, 17 Mar 2023 03:57:43 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Krzysztof Kozlowski <krzk@kernel.org>, linux-input@vger.kernel.org
Subject: Re: [PATCH v5 1/2] Input: hideep - Silence error in SW_RESET()
Message-ID: <ZBRHpwgdQfjr8uHY@google.com>
References: <20230311114726.182789-1-hdegoede@redhat.com>
 <20230311114726.182789-2-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230311114726.182789-2-hdegoede@redhat.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, Mar 11, 2023 at 12:47:25PM +0100, Hans de Goede wrote:
> On some models the first HIDEEP_SYSCON_WDT_CON write alone is enough to
> cause the controller to reset, causing the second write to fail:
> 
> i2c-hideep_ts: write to register 0x52000014 (0x000001) failed: -121
> 
> Switch this write to a raw hideep_pgm_w_mem() to avoid an error getting
> logged in this case.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Applied, thank you.

-- 
Dmitry
