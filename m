Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E3EE75EE12B
	for <lists+linux-input@lfdr.de>; Wed, 28 Sep 2022 18:03:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234225AbiI1QDO (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 28 Sep 2022 12:03:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234046AbiI1QDN (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 28 Sep 2022 12:03:13 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81EC8DF396
        for <linux-input@vger.kernel.org>; Wed, 28 Sep 2022 09:03:12 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id h8-20020a17090a054800b00205ccbae31eso2881070pjf.5
        for <linux-input@vger.kernel.org>; Wed, 28 Sep 2022 09:03:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=arKrPmIVU/Xw7pRowmxk1t41L3ODxA0W+iM2X9X8C9w=;
        b=VfE123tBJpbwb9pJyr1HZWPc1te35dJ6JQhsz4ZD8u9hPK9xgfckhnyqdTSGDZVXMP
         IlTtzg2DeUhyezxV2Fcc3uy0FLDZa7gpDsL/C8w9n19k8zNzsM5ZDLiqWMs6G/C8hgzd
         SWq2L247biQCELBLMoM7R8FmmcscQlopufQ3GEkKM2k8F+VMNZXE7wVv+jewTrQlMa53
         KxuWI2dCSNtGWD4vftHKyERUdr3pJNmjwIaBUsupNuH9xWj/WZRzWs8lJEo5ltbnp+eD
         glVaJNwZi1yeSfih3LUKi9AZgEdqa2s1a+u2s4qGjzwtVzQqaoEIakjuZDuPTa68S2VN
         JsHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=arKrPmIVU/Xw7pRowmxk1t41L3ODxA0W+iM2X9X8C9w=;
        b=lh9pwKFUAqgaDmxfBkIvX3OtMAGSiIowgQvegJjdZB79CM/NNBuy1/1vqXwlRssw5I
         HZr0B9LYseA8bvWo90isrP1jPs/MmGSESMaT/XwX4HQ7XmvqYjlENzOaLVlREjigEPnO
         5ne9hrGd94gZkq3/pDrgHOUxG1wzuc/cXQ94mEBL/muZNQ3nYryDq1XhEQZ96jWzydVd
         vYO6V2mjniN8VDl0oEr+drdH+n4Mr2meQRUwR1YVXEQ646DMxMhkzE51LuOA4gkATVKT
         qrfB8Blgkltca/pZvsRbKedQeJKpbQCJvnkfPSMvFc0ykoTtGvfLruoXyFgzbwrgDy88
         9lXQ==
X-Gm-Message-State: ACrzQf1//rYpPoKNGQ15uFosYf82iekxOD6SdBYzHLF4e5EbsRTaG76V
        SP9whFetELGUYwKXMf7zDNY=
X-Google-Smtp-Source: AMsMyM7ZmgJ5ruG5j+aFL/bh0i1qmLDsT0anclQYJEZq8ErNvo7cnELKOBmBOIqO9YrLqKrIvGGiWA==
X-Received: by 2002:a17:902:e84c:b0:178:2a08:501c with SMTP id t12-20020a170902e84c00b001782a08501cmr531100plg.110.1664380991886;
        Wed, 28 Sep 2022 09:03:11 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:1a91:59b8:faf:7b4f])
        by smtp.gmail.com with ESMTPSA id h7-20020a628307000000b00553d5920a29sm4138313pfe.101.2022.09.28.09.03.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Sep 2022 09:03:11 -0700 (PDT)
Date:   Wed, 28 Sep 2022 09:03:09 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Zeng Heng <zengheng4@huawei.com>
Cc:     eajames@linux.ibm.com, linux-input@vger.kernel.org,
        liwei391@huawei.com
Subject: Re: [PATCH -next] misc: ibm-panel: add missing MODULE_DEVICE_TABLE
Message-ID: <YzRwPTODLxQAfme1@google.com>
References: <20220928143133.1809491-1-zengheng4@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220928143133.1809491-1-zengheng4@huawei.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Sep 28, 2022 at 10:31:33PM +0800, Zeng Heng wrote:
> This patch adds missing MODULE_DEVICE_TABLE definition
> which generates correct modalias for automatic loading
> of this driver when it is built as an external module.
> 
> Signed-off-by: Zeng Heng <zengheng4@huawei.com>

Applied, thank you.

-- 
Dmitry
