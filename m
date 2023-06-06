Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 01A5C724CA8
	for <lists+linux-input@lfdr.de>; Tue,  6 Jun 2023 21:13:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239528AbjFFTNo (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 6 Jun 2023 15:13:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239139AbjFFTNY (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 6 Jun 2023 15:13:24 -0400
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99DB62712;
        Tue,  6 Jun 2023 12:12:22 -0700 (PDT)
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-655d1fc8ad8so2014230b3a.1;
        Tue, 06 Jun 2023 12:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686078742; x=1688670742;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=myHWNBLr2ViWpWSXk6DC5P0fjO5cRVP1k7W8A6XCSnU=;
        b=J0OpCL6QJ1SMigWOJXXAowo9VhxNce0mMByc6GQjW0zsP3V//ryQKcWbWzn0YrjAom
         Fdd+YKQwkCzskIMSPaJ1NQVERu8kjZx/1m7NM2Qn92kJu+nX8jIKtkZ62v4pgdJRotLz
         id6wVFlJi0l38SVzAg5cHbFYVzPEoijF458H3sR11sAGWuCPD9wtB5hvZ2GjZH9HoEDo
         //aBlS9nAgEQJtqrMBunEUa3vWfJqHT40G46CnLxXnsNV/z9UEMyGGhEFpiPprJm4u14
         dCEKf2JZfbwZotsSaKvsL2Rk57AJ6OwjMuYxJRzycqDfU1pz+rWO0ELDhirW0VugLTep
         bPcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686078742; x=1688670742;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=myHWNBLr2ViWpWSXk6DC5P0fjO5cRVP1k7W8A6XCSnU=;
        b=cjDi4dhB00hzIhdih1Yt9OlcPVKhFuytB1uZMFjoayCTznriLxEATETtjKBnd/73Gt
         07K3vpwKV050W2PxCdz17TV93A/6rFGG5rjUlhVbqWHdV3/M7o0uYL/q14Zy4nhqKaJn
         PWHt1LFe/qa9qgB3O14BBjK5DIYrCr6ssk0ZWjZa0X4Yk3m3S5va2/4oUR0RnyTp8Tck
         iPdk+KEc+6uk9eRcM6hg4dxqAtTGw2EtCyVtvU4HkaCxJHX0jccWJbE5rfYaQQa8nRWC
         Zt7tu23r1V0YiFAIPOcmWfolMTguqkBVh8CVhc45bUwZ80Z7gvXII2jnqZST4Ys/QxnL
         R8dQ==
X-Gm-Message-State: AC+VfDwGMGnANdQwZS30G2YXqr5xoAHsBA5F895gxw+ALaP0OcoYvEbv
        HurHGPFaHL2TV11B+4xJnhg=
X-Google-Smtp-Source: ACHHUZ5cnwAlo8K5PwHnVl+eYXjjzjGTXPLh93kBIzInBQrxPrLvwMLMc1jANHo0n2q/0zgh2BU4+A==
X-Received: by 2002:a05:6a00:ccc:b0:64d:1185:243c with SMTP id b12-20020a056a000ccc00b0064d1185243cmr1503299pfv.5.1686078741967;
        Tue, 06 Jun 2023 12:12:21 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:f59e:5ad5:28cc:2003])
        by smtp.gmail.com with ESMTPSA id a8-20020aa780c8000000b0064d31ddb5e4sm7142203pfn.43.2023.06.06.12.12.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jun 2023 12:12:21 -0700 (PDT)
Date:   Tue, 6 Jun 2023 12:12:18 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Caleb Connolly <caleb.connolly@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-input@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        phone-devel@vger.kernel.org
Subject: Re: [PATCH 2/2] Input: pm8941-powerkey - fix debounce on gen2+ PMICs
Message-ID: <ZH+FEuWtDBGg7bEK@google.com>
References: <20230529-pm8941-pwrkey-debounce-v1-0-c043a6d5c814@linaro.org>
 <20230529-pm8941-pwrkey-debounce-v1-2-c043a6d5c814@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230529-pm8941-pwrkey-debounce-v1-2-c043a6d5c814@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FSL_HELO_FAKE,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, May 29, 2023 at 08:55:07PM +0100, Caleb Connolly wrote:
> Since PM8998/PM660, the power key debounce register was redefined to
> support shorter debounce times. On PM8941 the shortest debounce time
> (represented by register value 0) was 15625us, on PM8998 the shortest
> debounce time is 62us, with the default being 2ms.
> 
> Adjust the bit shift to correctly program debounce on PM8998 and newer.
> 
> Fixes: 68c581d5e7d8 ("Input: add Qualcomm PM8941 power key driver")
> Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>

Applied, thank you.

-- 
Dmitry
