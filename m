Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 33B18724CAB
	for <lists+linux-input@lfdr.de>; Tue,  6 Jun 2023 21:13:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239516AbjFFTNx (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 6 Jun 2023 15:13:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239544AbjFFTNi (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 6 Jun 2023 15:13:38 -0400
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com [IPv6:2607:f8b0:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C5A4E6C
        for <linux-input@vger.kernel.org>; Tue,  6 Jun 2023 12:12:58 -0700 (PDT)
Received: by mail-ot1-x331.google.com with SMTP id 46e09a7af769-6b2041315a5so1695485a34.0
        for <linux-input@vger.kernel.org>; Tue, 06 Jun 2023 12:12:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686078778; x=1688670778;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rsq0aVuqxOFF2SC4Ls5VoIwxjCRRSUOzo7gvCR5Xc+0=;
        b=hcBGvyw8oUocbHMVAh9XaTsptJ8+GRagjIRgtESRlPt7B3Y7YEaSL0B7o9phwNDKjL
         QwWCcnX+DGDf5xZnNgJ/eDj3CW9dsYXIZIlR9nVTHWtEN175TqShVBq3sAI1abaHobGF
         9vmp1znRA+MllUXi0grmeLNbm2wc2mAIU3/JqkzzNhZiTnbx+sIb4Odxn5127fYclDHI
         ogL1vMPK/CwMhCx/yeGR48KToJ20p4E0dRoGNt3bSrBmiFLKiS81Wn+e2a8QN+yDwely
         Wk+BexKQRRwTlXJxe2MpqMGSDQjKDTR1egklhCbGcmCi31pdAutqOGdypDS3VMuz4ZHI
         3DVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686078778; x=1688670778;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rsq0aVuqxOFF2SC4Ls5VoIwxjCRRSUOzo7gvCR5Xc+0=;
        b=OFKPFexgTfgdu/I1wQhNYm4R7oCswBu2rCLhToZyx82beepUjp3tkGpfbDDMAN3NBj
         wrqaDYgvj+agF+BmB8j4xCeS8aLoqSwsjctIoJIoGLKf2OkZEozCbR2RHzRCKQZJmOZq
         eqilUrxV2NZK7iDk+8rkHQOWxeZbl70o/n2EsOREknCHN2xsSZG3jYKL4ZAf34c9RinP
         ZqXZ3bsG0BCqtAxDbEi61e+z7hikZ7XgqKFFfhuz4cibjix+qeGDFYzwLFQVSAFuSGlE
         6CQWR8WsyfLnBGYGhNp0OQWoiIB472xhnC0PrB0rfU2pv1wnyOyWV6CzU9Ib/MzQoCDG
         CHOQ==
X-Gm-Message-State: AC+VfDwI0fsSxsaSoA2sUK1tqZgNCFPmj3Rfe8k+8fpjPYzS+F4hGUPv
        WuBICARv+pPHhXNFdy8l2Lc=
X-Google-Smtp-Source: ACHHUZ6khq5ZD3qc9akJ67SheM9ZWP1lErKYRBg1ITWX+MrFoq9ktYWVGpT3k71PNL2opt4WS8UXyA==
X-Received: by 2002:a05:6358:c581:b0:128:b20b:925a with SMTP id fc1-20020a056358c58100b00128b20b925amr628539rwb.9.1686078777680;
        Tue, 06 Jun 2023 12:12:57 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:f59e:5ad5:28cc:2003])
        by smtp.gmail.com with ESMTPSA id n35-20020a635923000000b0051303d3e3c5sm7725961pgb.42.2023.06.06.12.12.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jun 2023 12:12:57 -0700 (PDT)
Date:   Tue, 6 Jun 2023 12:12:54 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Markus Schneider-Pargmann <msp@baylibre.com>,
        linux-input@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH 2/2] Input: tps65219-pwrbutton - Use regmap_set_bits()
Message-ID: <ZH+FNhNc0Fpi/U2j@google.com>
References: <20230605161458.117361-1-u.kleine-koenig@pengutronix.de>
 <20230605161458.117361-2-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230605161458.117361-2-u.kleine-koenig@pengutronix.de>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FSL_HELO_FAKE,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Jun 05, 2023 at 06:14:58PM +0200, Uwe Kleine-König wrote:
> regmap_set_bits() is equivalent to regmap_update_bits() if mask == val.
> The probe function uses regmap_clear_bits() to enable irqs, so
> symmetrically make use of regmap_set_bits() to disable them. There is no
> semantic difference.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Applied, thank you.

-- 
Dmitry
