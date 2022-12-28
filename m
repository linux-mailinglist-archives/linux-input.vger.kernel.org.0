Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A6F7F658724
	for <lists+linux-input@lfdr.de>; Wed, 28 Dec 2022 22:58:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230106AbiL1V6p (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 28 Dec 2022 16:58:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229603AbiL1V6o (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 28 Dec 2022 16:58:44 -0500
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3659011A2A
        for <linux-input@vger.kernel.org>; Wed, 28 Dec 2022 13:58:41 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id co23so15945356wrb.4
        for <linux-input@vger.kernel.org>; Wed, 28 Dec 2022 13:58:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=93y9wqetooj4GvgixJbsglx4KYzbi2Llo2O28wnB/SM=;
        b=huSDH91NfmpcULSwx2R9HF5cODLVrHBEQxfRvkCmRsNpTucrNsHH9B6nYJ5kcXtliO
         y8LLsgoyudI+TjX9EiFoKzqQmCnJeeV8iobfnuLDR5E07GX/jwrXgPetNK6fX2d54HHv
         dBhOhkVoVyoDFn76J299Vnfuqy9qJQRw0pkD+KUsm4P1bv5LIER3cW7nnERh9cp8g8aS
         Zb8jOngqBtXo63WfU7PtwWcKw/MY57TeKhP0hsoGpZ4Di3WrAAJXLpi0OVC6pgvWBMCu
         +aA5g8nMoytPF3nrfm582lutWwvjvFFE2MOZOLG1VkaFvsgCAkIBeOUGcNDBVNasfZTQ
         qHSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=93y9wqetooj4GvgixJbsglx4KYzbi2Llo2O28wnB/SM=;
        b=eqYMoyRpuWG002JGUGnusXui+2lJ8iqRhm+DDCnD1lgDYir95D6/MCmb2kq+3e1Hw4
         t68y4olsoozQdkI56YkLOcq7vGrpoCR2hSptSr6degccs8FTBxsLhPUnlf7snPiYGnoK
         cp8uBsrvW+zvqCkpB97YSUnma8W9nDCIKIaCXQ5Kk11P9/lmr18mAslfBZI96HfJ/Lhj
         Y4bQUq2nQHDml0aIo1zSwlf7PPjKLKbyX9PsngmfdSrhurBlz8zxPNsGTDfCdbTKda/8
         3YF/08KOQv9MMKwKruyu9P4T9N7VDCEv7eMI5UjHUVhhkoD7iv76i5Y3uW7aY51o712v
         aJQg==
X-Gm-Message-State: AFqh2kq3qrDcEAUQmvFlNGdF62vzlqxT/m+N8JpAlafjiMBDsp6gFWo1
        ddFOp1GPusdUlsNL97y4dh+vKAu5ArSYdg==
X-Google-Smtp-Source: AMrXdXsjlLCv3EC9Jv4qrBgusOYiV0aa+9AOEdyyNuGSSLzZv4UF5b90KktB1I7D0Uqus0h1yCvmhQ==
X-Received: by 2002:a5d:4587:0:b0:27f:a81:b819 with SMTP id p7-20020a5d4587000000b0027f0a81b819mr8559863wrq.22.1672264719674;
        Wed, 28 Dec 2022 13:58:39 -0800 (PST)
Received: from localhost (net-93-66-65-174.cust.vodafonedsl.it. [93.66.65.174])
        by smtp.gmail.com with ESMTPSA id o2-20020adfcf02000000b00241d21d4652sm16457662wrj.21.2022.12.28.13.58.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Dec 2022 13:58:38 -0800 (PST)
Date:   Wed, 28 Dec 2022 22:58:38 +0100
From:   Alain Carlucci <alain.carlucci@gmail.com>
To:     Roderick Colenbrander <thunderbird2k@gmail.com>
Cc:     linux-input <linux-input@vger.kernel.org>,
        Jiri Kosina <jikos@kernel.org>
Subject: Re: [PATCH] HID: sony: Fix division by zero
Message-ID: <20221228215838.7rxsevi4wfldmm2j@ananas>
References: <20221226000722.2xgbvsnrl6k7f7tk@ananas>
 <CAEc3jaDf_TqzxRt3m=OscjLcg=L-jYhNq2r7jEyD6Z1pFo3NRA@mail.gmail.com>
 <20221228180130.47ix3afwbv4bmqfc@ananas>
 <CAEc3jaD-Z4F8CQBHKrBV=H1JwO3LhQMxy1rv2k30rCYhkr1CmQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAEc3jaD-Z4F8CQBHKrBV=H1JwO3LhQMxy1rv2k30rCYhkr1CmQ@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Dec 28, 2022 at 11:38:03AM -0800, Roderick Colenbrander wrote:
>Hi Alain,
>
>Thanks for the info. Out of curiosity are the reported sensor values in the
>hid report non zero?

Just wrote the print code and unexpectedly.. yes!

Here's a report of the raw_data variable in dualshock4_parse_report()
using printk:

[10793.137066] rd0=4 rd1=1  rd2=17 rd3=707 rd4=-8063 rd5=-1536 
[10793.141121] rd0=4 rd1=0  rd2=17 rd3=698 rd4=-8061 rd5=-1546 
[10793.145101] rd0=4 rd1=-1 rd2=19 rd3=699 rd4=-8062 rd5=-1544 
[10793.149059] rd0=3 rd1=0  rd2=19 rd3=695 rd4=-8052 rd5=-1554 
[10793.153085] rd0=4 rd1=-1 rd2=19 rd3=691 rd4=-8052 rd5=-1547 
[10793.157059] rd0=4 rd1=0  rd2=18 rd3=709 rd4=-8057 rd5=-1551 

>As for testing there are no good apps. Evtest can at least do gamepad and
>touchpad. Unfortunately we didn't make a proper desktop test app. Hopefully
>in the future.
Ok got it, thank you.

Thanks,
Alain
