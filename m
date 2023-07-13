Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7AB3A752946
	for <lists+linux-input@lfdr.de>; Thu, 13 Jul 2023 19:00:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229828AbjGMRAL (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 13 Jul 2023 13:00:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229838AbjGMRAK (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 13 Jul 2023 13:00:10 -0400
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A0F02738
        for <linux-input@vger.kernel.org>; Thu, 13 Jul 2023 10:00:09 -0700 (PDT)
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-666ed230c81so987062b3a.0
        for <linux-input@vger.kernel.org>; Thu, 13 Jul 2023 10:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689267609; x=1691859609;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AmpAUYVJ8nWF3p1lqOv4/d07HnlTHyroYa+E5zHtsOs=;
        b=Uc1nH4OOlPstj9B8EP6VFAFtYWsewuDREToJcGJ+5HDDHkQTyEs+lkbU1770/FtszY
         JUlikkITmi9zHtvYYMff0lnyi5b6YU0LdvpLAOXIapCibF7UIzd0BhnQpTpzZdGFBPFL
         tz0rgXaIYiqMFxl+IvdBRWz/z21tRciewfxcEi/JXQGy15cY215v3waMJMizyVEI3kTL
         zKnS/0vpTtRh6TcGiebDLU1G7i2tc0KDhQFS28DoJ8EedqBlOiPZse2fW/qcvLLvLyat
         ZcAb15UNLY66gbbDWxRwAdtRKItPPR2kqaBxaYjMwGfUcotWdf1pdSYC4M1QpCJKtjKQ
         FbaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689267609; x=1691859609;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AmpAUYVJ8nWF3p1lqOv4/d07HnlTHyroYa+E5zHtsOs=;
        b=V/LvoQM5Jm8wxBu5oCiV/JEnmU0mQcab/zeHhfx9Fi7OahAMcMGXxckaq6SoplR2OT
         58V3juZAGbgc/e9pd2R9Akn1FUPVzP7hd/I0dscJW+3yOs+fovAA60ycmEd7dijJlJ8W
         Vk1A08OrfCtGbnGv94hfkdpijtj2L+9FDCdDRBszDG2OmOT/IfJ5DZjpNIKN6jiggim5
         MkrvkSD/J6+XsL8Y14nYIUorEeYDD1NFzGzMf7NYq8wjTZ08MfZ/6l2kfeFqZNijf68C
         fC1/1Xlrjb05v7xwzUF49ZRT9hpbo+nNoCLK7QbfI5Yu/j34J3rySuUzoh1MVGSdaF0A
         az1g==
X-Gm-Message-State: ABy/qLYk58LcTHUC296rCBl5ytHDAemxdlXSaAzx7xsL3owTbOvPEFPx
        H8FnZlHq3fXdvvwk8bhGazQ=
X-Google-Smtp-Source: APBJJlG3+hbXlNnHaFJufMrOhR5ibF1oghua7uPmps+4oC76JmmZg6kSRTXshTu8YfYd83u23oMVQA==
X-Received: by 2002:a05:6a00:1353:b0:682:537f:2cb8 with SMTP id k19-20020a056a00135300b00682537f2cb8mr2682933pfu.26.1689267608763;
        Thu, 13 Jul 2023 10:00:08 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:75e2:8bbb:e3b8:95b3])
        by smtp.gmail.com with ESMTPSA id fk13-20020a056a003a8d00b0067903510abbsm5672539pfb.163.2023.07.13.10.00.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jul 2023 10:00:08 -0700 (PDT)
Date:   Thu, 13 Jul 2023 10:00:05 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Jeff LaBundy <jeff@labundy.com>
Cc:     linux-input@vger.kernel.org
Subject: Re: [PATCH] Input: iqs7211 - point to match data directly
Message-ID: <ZLAtlfhUMXKRzdoE@google.com>
References: <ZLAhFgOatNoReBa2@nixie71>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZLAhFgOatNoReBa2@nixie71>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FSL_HELO_FAKE,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Jeff,

On Thu, Jul 13, 2023 at 11:06:46AM -0500, Jeff LaBundy wrote:
> @@ -2460,13 +2451,11 @@ static int iqs7211_probe(struct i2c_client *client)
>  
>  	INIT_LIST_HEAD(&iqs7211->reg_field_head);
>  
> -	if (client->dev.of_node)
> -		dev_id = (enum iqs7211_dev_id)of_device_get_match_data(&client->dev);
> -	else
> -		dev_id = i2c_match_id(iqs7211_id, client)->driver_data;
> +	iqs7211->dev_desc = of_device_get_match_data(&client->dev);

Can we make it device_get_match_data() instead of using OF-specific
variant?

Thanks.

-- 
Dmitry
