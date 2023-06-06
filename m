Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2A681724CA6
	for <lists+linux-input@lfdr.de>; Tue,  6 Jun 2023 21:13:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239469AbjFFTNl (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 6 Jun 2023 15:13:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239520AbjFFTNT (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 6 Jun 2023 15:13:19 -0400
Received: from mail-oa1-x29.google.com (mail-oa1-x29.google.com [IPv6:2001:4860:4864:20::29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 486251BDF;
        Tue,  6 Jun 2023 12:12:13 -0700 (PDT)
Received: by mail-oa1-x29.google.com with SMTP id 586e51a60fabf-19e7008a20aso5920659fac.1;
        Tue, 06 Jun 2023 12:12:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686078732; x=1688670732;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pYmXlwlNlqu1aS3DpIG1pLZKIKZ3QBEVtT7TAsgr7lo=;
        b=N9qIXf0TlQPmsX/zvV6gAm3Xlmx/9CC4/qclMAkIoDNsDgcu/UGwRid6HuxFSRvnyi
         MxIP579+F2EPvIbLgxU/lfg1ONjK2GeA0IqCyNN+f9G8zWW95QDDHSoK5JCogBhNDMLV
         z8wDArRoVKEwE+IcrLTunzvKY/7jkjDMR2YS0uoPYB/LueHkSGOSvteAvDTrbijpxYSV
         kcaJ9mHcKOkqiXOqOnF72s4R3tHUF8v/+tv5N2Ko1ll7fzgNe2Jw7ZNJ6UP5VLV3QiFd
         Ufk/cmJ6I4wOGc+3Jm7g2volD+N7ptI/TDV/af2UhQfFPRGuNI3bvV6Gr7gtGcn5Cxeo
         2saA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686078732; x=1688670732;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pYmXlwlNlqu1aS3DpIG1pLZKIKZ3QBEVtT7TAsgr7lo=;
        b=LQ0UbJFbTq6yvyToXLgSyi0faTQa/B9DETaR4SgKgkd62/0rqgjDTetdXSnuYPi7dp
         Esm3GMvhnO2WdvmD5hhFJIL7XuweKZI+/vqSclLbSq2XkcvoOmWePf8qgUJgOJILBuMS
         QbwcivmUJ/fOb6puRnTHCorst45MQY1Cb69URONXdp82++TLxYDVBRlejjSZIsghNAfL
         L519gznglD8BbRt3msSjc0279fE5MjCzM81I5aLuHlx8IUu04TFJk4fh48Jdz0RojDix
         uHGm1n9iklngJ0gKeKMF9cl32A4in6CUt61Bal0qlhgC1iEt9bnAz1j/h755P2uL+GJn
         jSlQ==
X-Gm-Message-State: AC+VfDzqwihE+m5oclLznes9xCzSdpSW4JGDzZLR12ooZ6XXf7uLbpXi
        OeYFDqiW+1hSMc1MQXGTd7o=
X-Google-Smtp-Source: ACHHUZ4DQ8U6awdwmeg6L/dX0hWrf4foOyfjTwHtxWa/6jiw8Se/9CablpDJi1Xp3Wg027X4Gg+RYA==
X-Received: by 2002:a05:6358:b506:b0:129:1c2e:6487 with SMTP id de6-20020a056358b50600b001291c2e6487mr690282rwb.13.1686078732316;
        Tue, 06 Jun 2023 12:12:12 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:f59e:5ad5:28cc:2003])
        by smtp.gmail.com with ESMTPSA id s1-20020a17090a13c100b00258f9597e9fsm6721841pjf.45.2023.06.06.12.12.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jun 2023 12:12:11 -0700 (PDT)
Date:   Tue, 6 Jun 2023 12:12:08 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Caleb Connolly <caleb.connolly@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-input@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        phone-devel@vger.kernel.org
Subject: Re: [PATCH 1/2] MAINTAINERS: Adjust Qualcomm driver globbing
Message-ID: <ZH+FCC35uux5zrrG@google.com>
References: <20230529-pm8941-pwrkey-debounce-v1-0-c043a6d5c814@linaro.org>
 <20230529-pm8941-pwrkey-debounce-v1-1-c043a6d5c814@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230529-pm8941-pwrkey-debounce-v1-1-c043a6d5c814@linaro.org>
X-Spam-Status: No, score=1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FSL_HELO_FAKE,
        RCVD_IN_DNSWL_NONE,RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, May 29, 2023 at 08:55:06PM +0100, Caleb Connolly wrote:
> The only drivers matching pm8???-* are two levels deep, adjust the glob
> to match them.
> 
> Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>

Applied, thank you.

-- 
Dmitry
