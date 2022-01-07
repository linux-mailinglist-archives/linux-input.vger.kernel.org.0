Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34C4F4874B3
	for <lists+linux-input@lfdr.de>; Fri,  7 Jan 2022 10:31:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346440AbiAGJbK (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 7 Jan 2022 04:31:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346437AbiAGJbJ (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 7 Jan 2022 04:31:09 -0500
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F143C061245
        for <linux-input@vger.kernel.org>; Fri,  7 Jan 2022 01:31:09 -0800 (PST)
Received: by mail-pg1-x52c.google.com with SMTP id v25so5013420pge.2
        for <linux-input@vger.kernel.org>; Fri, 07 Jan 2022 01:31:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=0VX+LU/oO4ctedZAaUPNY0slgo7bzXMlO/k88hrsdAg=;
        b=UjTylrfh2+PtH21LZ2TWmYcVLD/J19gUnO6SRzxajDG0Inp0x64j0GCL8Xxu6vPJEn
         gr3WTJ8lkGWa4kzqoseCMr0RN80a1StmXJkkVpUp1i1yVni23wI3AQeWNzF1yA+mArk/
         fL6ycgQnOU4G7oHR+UpU9npus9nX8Mq08KxfiXhwsNvrt9VOGtKS4UgOzh3CgthHN7nA
         5vnNfwVX+cTdWQF43Tqfv7cA9iBeQoScRX0bjfQ784HY2NdiKhXhRfK8ZIdONCPmVsNv
         fQ/g3H2uGUVcyvTHJ+1d0OjstDBK8aP1C3rg+CXPAV6e5igcCV6u90DiNPSlI+uo1duM
         30og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=0VX+LU/oO4ctedZAaUPNY0slgo7bzXMlO/k88hrsdAg=;
        b=fFpoAeyLxbq0eO7RORioEH5Cpf4Ud35cdVkwZ31S8OLeY8Vdg8IaTRjJ8h4yog/x0y
         t029sC7DBforFPkTgTnCdxdmxS8tc82FhvNhEW9569jCSnwd7qhBLWweUsN2oPWzOK9M
         gRoE+0CjGCSDfM08eBNuIAKS0JjW2IoUMRNVgXsPtcycD9h62lspWzlK3+Nmt3DWWP6g
         u9AbtsponUGRlPudzNciuFeBm6s0N0GlB1t0k9pu1rCUEds9U0LDAJiiKkUcbNKq8d0B
         smaxWG/sdlQsKcPZJxxm5Xvy2k6fDjFRhOB11Oh6vrq4PDS1k04Und5rNhqHIq8xp90e
         nq8w==
X-Gm-Message-State: AOAM533bCClsLoN+3G0hjyXqtwH2uVGoS4uQAz53VOmCujqKchkFRew/
        bMWnjiuyEIp9ArJrxVwMHPGwaA==
X-Google-Smtp-Source: ABdhPJzW/zc99UpA7FpUgpLj0Lnof9910pOfjm2h2fPHN2cJf0tzWztW0br8JjZp+H+5bjyc6qhk2A==
X-Received: by 2002:a62:ea11:0:b0:4bc:9be8:9b2a with SMTP id t17-20020a62ea11000000b004bc9be89b2amr24789353pfh.64.1641547869145;
        Fri, 07 Jan 2022 01:31:09 -0800 (PST)
Received: from ubuntu.huaqin.com ([101.78.151.213])
        by smtp.gmail.com with ESMTPSA id b65sm4772024pfg.209.2022.01.07.01.31.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jan 2022 01:31:08 -0800 (PST)
From:   Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
To:     jikos@kernel.org, benjamin.tissoires@redhat.com,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     dianders@google.com
Subject: Re: [PATCH v2] HID: google: modify HID device groups of eel
Date:   Fri,  7 Jan 2022 17:31:05 +0800
Message-Id: <20220107093105.9689-1-xiazhengqiao@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220107091357.28960-1-xiazhengqiao@huaqin.corp-partner.google.com>
References: <20220107091357.28960-1-xiazhengqiao@huaqin.corp-partner.google.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Jiri,

  As your suggestions in https://patchwork.kernel.org/project/linux-input/patch/20211228114650.31981-1-xiazhengqiao@huaqin.corp-partner.google.com/ ,

I add verbose changelog, and change my email name, please help to review.

thanks.
