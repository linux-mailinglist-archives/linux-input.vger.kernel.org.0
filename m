Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 84E4D63702C
	for <lists+linux-input@lfdr.de>; Thu, 24 Nov 2022 03:00:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229509AbiKXCAZ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 23 Nov 2022 21:00:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229693AbiKXCAW (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 23 Nov 2022 21:00:22 -0500
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB43AE3D32
        for <linux-input@vger.kernel.org>; Wed, 23 Nov 2022 18:00:19 -0800 (PST)
Received: by mail-ed1-x52b.google.com with SMTP id z63so712384ede.1
        for <linux-input@vger.kernel.org>; Wed, 23 Nov 2022 18:00:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xWQrNL5PjdM2W+ShEUqCddQsm79so6pFXoseYbBoCSQ=;
        b=lavrJPPcpA29v3/U6ODNEKTq5h9Gtupkr+lL2OfDcQs4As5VMXaWRETzUui/YNosrG
         TaYfqkIcS4i8Y0ZC1LSIAhhKGRROPzzL7HQkSq5qCQliCnZ/tYqB68TFH/rd5oV16zP1
         kASCfXvxhrNKRxhm8fQuHPUFFq6P8X4BTDaUeqAJ5CyCZ8SrtdgcVVI9XOq+zlxIWdpa
         +8TqQ9zuGKZ1tXkY4v6l4/3swV5hZbfUo9jZ8oZwFTpInh0cTUU9r/wmDC0B8ou8HeRQ
         BT/Iq66ofac/686fLCBeb6gFMVnVHBZX/vIRIej8bhQb8B22U6c7tHUfFOqeUuce4KiX
         0GSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xWQrNL5PjdM2W+ShEUqCddQsm79so6pFXoseYbBoCSQ=;
        b=EfGTGe0g86mIdVdLxOLK2sA5N/W1HQvPUJvo0CamoucrXc+FcbsmHbW+tCX9do+ziz
         iDmLz+g4a1UBPc26iRnU6GHA5sCHAo7kwHUXxP+/GmfUKAdxUfneN7PhOjppRQKkVkkg
         FHj3i9L8wsGYGf0J42BHZ45PPTMP/KDoXMTnQThgwgUj5jJFMSUD3giRcup2IXg5b7OI
         d0STGj9q66StBbE/2sSJUSmH5YhwbqOB4p8rIliDNgKXJZX6jmky5+DfCnEo56EjAVVY
         FnIn9/qMTekfpNt6puAurxQESEykiM3NvHO91fCYaaWTZ1ss9xicFvr/7sjSdRig4MYx
         mMEA==
X-Gm-Message-State: ANoB5plEIv5XQ4gujryPacf10Gq5AKfA049sv3v3ihBMuOJqi7fm4tQy
        z6zMw7btHOZbOKrTNocqtjhywfOQv4XB4+GrqoRwWuyWATq1tg==
X-Google-Smtp-Source: AA0mqf4icQOqhxd2yB6KjB8gD8TjoYp9Fv187pmcsBO023Pr3N/pyO2+fMauzd158SvkFdd1KOQQ0Xeqdr1MBixlyzE=
X-Received: by 2002:a05:6402:1ca5:b0:468:f02a:f523 with SMTP id
 cz5-20020a0564021ca500b00468f02af523mr12186366edb.362.1669255209726; Wed, 23
 Nov 2022 18:00:09 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:6f02:103:b0:25:fa51:a759 with HTTP; Wed, 23 Nov 2022
 18:00:09 -0800 (PST)
From:   Mamdooh Bukhari <maku1348@gmail.com>
Date:   Thu, 24 Nov 2022 05:00:09 +0300
Message-ID: <CA+=9+=uvY6K=5xCHYZ+KzLDVb3dmNB31Xz_M=-EGpWPpV9e5fA@mail.gmail.com>
Subject: Re:lucy weah
To:     breslevoutreachusa <breslevoutreachusa@gmail.com>,
        kissarmyargentina <kissarmyargentina@gmail.com>,
        bjordt <bjordt@gmail.com>,
        PortfolioErikGriott <PortfolioErikGriott@gmail.com>,
        ErikGriott <ErikGriott@gmail.com>,
        maramaopercheseimorto <maramaopercheseimorto@gmail.com>,
        linux input <linux-input@vger.kernel.org>,
        dmitry torokhov <dmitry.torokhov@gmail.com>,
        linux arm kernel <linux-arm-kernel@lists.infradead.org>,
        danhavlik <danhavlik@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=3.2 required=5.0 tests=BAYES_50,BODY_SINGLE_URI,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
        SHORT_SHORTNER,SPF_HELO_NONE,SPF_PASS,TVD_SPACE_RATIO,
        T_PDS_SHORTFWD_URISHRT_FP,T_TONOM_EQ_TOLOC_SHRT_SHRTNER autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: ***
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

https://bit.ly/3VoeMAU
