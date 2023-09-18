Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E60AA7A4073
	for <lists+linux-input@lfdr.de>; Mon, 18 Sep 2023 07:31:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239628AbjIRFaq (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 18 Sep 2023 01:30:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239637AbjIRFaN (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 18 Sep 2023 01:30:13 -0400
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9740B122
        for <linux-input@vger.kernel.org>; Sun, 17 Sep 2023 22:30:02 -0700 (PDT)
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-577f6b414a4so3407844a12.0
        for <linux-input@vger.kernel.org>; Sun, 17 Sep 2023 22:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695015002; x=1695619802; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qwboaLKTAqwZ7EF/FXDgvVyaZ7fsMImKe1nyY60ueAU=;
        b=NJiT8gc7M4m/HRrUcshRew6ZitJUOOt7z9XAd9NTuHABxFSxJniFRK8exj2GdtwnCJ
         VpDD4Rl2/1vDccDrcyW0bbFX8tVQl86OerFYH712oK2UsaWrhEuzcqY1DNFz5LemVez6
         P1dwOAUevossMwaM1w0e3tM2/Z8xJgph7TILHdtxgmP8s9gF/nq/RDt7kJcIHmVDQtxu
         hLm3bNKyKTlKnApDyWY1KSDkibsD9fRmoGIwbc+Yf8muqNkZHvQ/YDDCaYsUdm09PquX
         YcIjs/jMnEUC2iDpdlza35+GutPVTvsY7IDy+74lxb1yvbDBVL1+XOKj7rF17yr01Wj2
         2Dug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695015002; x=1695619802;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qwboaLKTAqwZ7EF/FXDgvVyaZ7fsMImKe1nyY60ueAU=;
        b=fkYgsw7a0FjRSFCMHQciTGxoNqbSg7v56QhqnmNjH4hYw1xvc9AmnAuc16vA0kTLlj
         wBy9HKDR+EHgumytWdPZnSsKmeRpiGgLna3ipmil5JHcnaT4lOpH7po+gm3TXmKgrqtm
         1k0mKsRSGQP0lrL03VavTdzkByDJ/joZccOvPijV/h0mMSNm/tZXRMWWNYfj6zHUqK3C
         TZY8SDHV43R5/i+oztAnS1l3/4AYElz9HnWPEsfAeyeUA8luRCfJhfbOajdqQ7zhtUxE
         ekKXXrS2Sgi4BXueuLmrXvGXSF63oz6tcIrwRxI6stu35fHhL/Mnyej6E/1DfyWch7Mf
         MbkQ==
X-Gm-Message-State: AOJu0YxO0a6gqXP+F5botPtsTmLr/xBEDqWZOgNjz5Yf4SBxL2VVgVNs
        SAWa5M8NZZc0rkgcpba+PTdmZa8yAP0=
X-Google-Smtp-Source: AGHT+IF7p/WK+tJtXY/jlQtVxbWM7riUR5Rgf7W7g1bGgrSyuyLrBJQDs5V3jLjnysYr01u6iCCcsw==
X-Received: by 2002:a05:6a21:1f25:b0:141:a70:6c26 with SMTP id ry37-20020a056a211f2500b001410a706c26mr8235259pzb.57.1695015002012;
        Sun, 17 Sep 2023 22:30:02 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:c47c:e02c:1cf1:ece6])
        by smtp.gmail.com with ESMTPSA id k6-20020aa790c6000000b0069028bdd24dsm6385085pfk.34.2023.09.17.22.30.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Sep 2023 22:30:01 -0700 (PDT)
Date:   Sun, 17 Sep 2023 22:29:59 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     HP Dev <hphyperxdev@gmail.com>
Cc:     maxwell.nguyen@hp.com, chris.toledanes@hp.com, carl.ng@hp.com,
        linux-input@vger.kernel.org
Subject: Re: [PATCH RESEND] Input: xpad - Add HyperX Clutch Gladiate Support
Message-ID: <ZQfgV76yld8XGtG9@google.com>
References: <ZQTEZEdd7xwHz9CN@google.com>
 <20230916014452.5241-1-hphyperxdev@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230916014452.5241-1-hphyperxdev@gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Sep 15, 2023 at 06:44:52PM -0700, HP Dev wrote:
> Hi Dmitry,
> That should be ok.  Thanks again for your support.

Great, applied, thank you.

-- 
Dmitry
