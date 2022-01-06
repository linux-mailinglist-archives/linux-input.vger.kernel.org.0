Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6FA0A486203
	for <lists+linux-input@lfdr.de>; Thu,  6 Jan 2022 10:21:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237317AbiAFJVI (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 6 Jan 2022 04:21:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237292AbiAFJVH (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 6 Jan 2022 04:21:07 -0500
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4A38C061245
        for <linux-input@vger.kernel.org>; Thu,  6 Jan 2022 01:21:07 -0800 (PST)
Received: by mail-pf1-x42a.google.com with SMTP id t19so2007057pfg.9
        for <linux-input@vger.kernel.org>; Thu, 06 Jan 2022 01:21:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Fzgt9zxSHcPkh1WkdxXMfweNiiTBX5PEz7HmeOWT72Q=;
        b=xoAuLNJ9bvyJ8CGNT5J54S/w/ze31xAIvby4o95vD1lBjujxunZXp9gJ8X0ahDAOWq
         KsWBKyH/BAy4hQEtaFfExdVBYZULlGbVJ900Jdj5CtNg5fRUjN11j26fYqXGwUjoaTkQ
         oiMmYaqWIihvOf8KuoSLx4ror9iZzooiFYeNtxlroaRErX4SQmS/Lb6anQ86b9SqJSND
         wZYJtGe1uRnVdUBoMFlJgmpQ7YIzwMNUWYKs3qzdTUATQXiohO0+7G7032MqgZ5eWTHy
         T2Mpz7SM8dCRqFVR6iPswoeRi40ODQ99DZF7JRILgI9tPirNDjbt9FkYotJSZo6X30Fl
         oTwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Fzgt9zxSHcPkh1WkdxXMfweNiiTBX5PEz7HmeOWT72Q=;
        b=I4nNLaUIR41iimKJqOnkaaaGFPPHuFTccYkgHhEOhYD1Yrcpg6oxrdRBnBYGjxi8pa
         nAaX9BuyoceZv/00utxSxW5zmyL4F4e51oh4lYvNEqeAEt3R60riZPieQsAnnpJesGaU
         gV+VD18dYvMqdL2AKk5i3mYE8niSeYhKABTerNq8/+J5N6gb8Y0Wdc9FpEjR/3kijxdv
         Ye9l/EC70Kkrf3BMfCCUgRskcCoN487S1Pzm+S7s9BPpXEB2G0tqhXt8C5sv5OnEJLVG
         E8pc2QUJfrjVLVlnJ2fyVTHFuhIlQ6yWgPG28Ubu1yMyopCdvHikgVggoicNB8po0kAC
         XRpQ==
X-Gm-Message-State: AOAM532foWemNMgXLMVAVLX4mJH/dtgDZ6IcQUFZVrb8rxhJGA3SN0cA
        niI/Rizvfgzg2R7opEFo2W1lhQ==
X-Google-Smtp-Source: ABdhPJyjUy+PMpsgqKthOHIuAudhDSM/tYbR3spYsGrZeQtiJXV91F8xbkATdwPhlfz2kHYI+UFL1w==
X-Received: by 2002:a05:6a00:a84:b0:4ba:557e:12cb with SMTP id b4-20020a056a000a8400b004ba557e12cbmr58762298pfl.85.1641460867294;
        Thu, 06 Jan 2022 01:21:07 -0800 (PST)
Received: from ubuntu.huaqin.com ([101.78.151.213])
        by smtp.gmail.com with ESMTPSA id v70sm1423214pgd.91.2022.01.06.01.21.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jan 2022 01:21:06 -0800 (PST)
From:   xiazhengqiao <xiazhengqiao@huaqin.corp-partner.google.com>
To:     jikos@kernel.org, benjamin.tissoires@redhat.com,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     phoenixshen@google.com
Subject: Re: [PATCH] HID: google: modify HID device groups of eel
Date:   Thu,  6 Jan 2022 17:21:03 +0800
Message-Id: <20220106092103.2283-1-xiazhengqiao@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211228114650.31981-1-xiazhengqiao@huaqin.corp-partner.google.com>
References: <20211228114650.31981-1-xiazhengqiao@huaqin.corp-partner.google.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

  EEL keyboard belongs to VIVALDI device. I have tested it.

please help to review this.

thanks.
