Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B8AC46E3EE
	for <lists+linux-input@lfdr.de>; Thu,  9 Dec 2021 09:14:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230297AbhLIISL (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 9 Dec 2021 03:18:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229536AbhLIISK (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 9 Dec 2021 03:18:10 -0500
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B771FC061746
        for <linux-input@vger.kernel.org>; Thu,  9 Dec 2021 00:14:37 -0800 (PST)
Received: by mail-pl1-x62a.google.com with SMTP id m24so3301207pls.10
        for <linux-input@vger.kernel.org>; Thu, 09 Dec 2021 00:14:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=OETdcSml20UUyOIbalyCCytdEEn5Q8wKvxc+7n7NjPc=;
        b=eZj+WTNZYxce7sa/OZ/0DRmB80l3RbFsY1yUlDO+NVOMOew9fPFRsfMyWojoUsEhhR
         9sGfatVecnMYX2XPFfPNYPvxBcR6CPdM621SNPYTyMpGb+GR9omdU6JIMOxe7YJ6MTmu
         DbNzlKxRRiXMT+LBRR1LfsQ9KaNh42i8wLTTwCGFzi4I45apyh1e296wecVcPEYAiuTt
         k3SyRBsv3q3Yy7+nvaTU2IK2emeMqgVgIvRee0M0P+/Q4kz/ZT73p8qpaFf8+UGtIKoy
         rwR8n5WagukWefA8HICsVBbn9wdSPgzKzYB1VuXQBqL/mMiFnw+MasGYA7jlURISC7es
         Sefw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=OETdcSml20UUyOIbalyCCytdEEn5Q8wKvxc+7n7NjPc=;
        b=6eaeDZ98deszpsc6sGZ5f7t8xm4d7HZ/JvP3tXys1nw2wDxNncFggogrNeHcNWjeEm
         G3QEG8Mc/QcS/C411Mq1C29Z75ttHXtVQPCbFBsyitkpZY2SknxtkedCzGzQLSQbuOKW
         u+zb7IdAtWg9OnBPAYtrmKHXuDSoRdCeai4vxKOmH/woq87x6rAu5thd73Q6Jw2DpbY6
         re13Epg5s/UIzKwI3w3xr7uQpzIRVzbK37OhMeWJx75Iu6g7TlQCgFWRn+i2yIKBie7E
         2r7s/hrwiTDEYhuuWhVuKNsXr+FGTtbtHBvdJmWcP+91BimcO7Tzs8/HcrMEnP7Seuaz
         5ZAQ==
X-Gm-Message-State: AOAM532pUVaDopEii3EZ7B6oCj7i5qVexE29LQqgw3kDSZ1q2H8vnQ9Z
        pOdSTkwcly7i+rHtM2WriSC+todMSU4=
X-Google-Smtp-Source: ABdhPJwYDrj0Ri7qVg+0aC+Lvkvo8Qlix5RCbsFRtb/KW+U3XZlvciJGk/femb+dCgmIq7jTtu+KvQ==
X-Received: by 2002:a17:90a:c398:: with SMTP id h24mr13711640pjt.73.1639037676986;
        Thu, 09 Dec 2021 00:14:36 -0800 (PST)
Received: from google.com ([2620:15c:202:201:6d46:aa95:8d47:21f4])
        by smtp.gmail.com with ESMTPSA id b19sm6490615pfv.63.2021.12.09.00.14.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Dec 2021 00:14:36 -0800 (PST)
Date:   Thu, 9 Dec 2021 00:14:33 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Bastien Nocera <hadess@hadess.net>, linux-input@vger.kernel.org
Subject: Re: [PATCH v2 3/3] Input: goodix - Add pen support
Message-ID: <YbG66QuBzgwJSuqJ@google.com>
References: <20211207100754.31155-1-hdegoede@redhat.com>
 <20211207100754.31155-3-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211207100754.31155-3-hdegoede@redhat.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Dec 07, 2021 at 11:07:54AM +0100, Hans de Goede wrote:
> Some Goodix touchscreens have support for a (Goodix) active pen, add
> support for this. The info on how to detect when a pen is down and to
> detect when the stylus buttons are pressed was lifted from the out
> of tree Goodix driver with pen support written by Adya:
> https://gitlab.com/AdyaAdya/goodix-touchscreen-linux-driver/
> 
> Since there is no way to tell if pen support is present, the registering
> of the pen input_dev is delayed till the first pen event is detected.
> 
> This has been tested on a Trekstor Surftab duo W1, a Chuwi Hi13 and
> a Cyberbook T116 tablet.
> 
> Link: https://gitlab.com/AdyaAdya/goodix-touchscreen-linux-driver/
> BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=202161
> BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=204513
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Applied, thank you.

-- 
Dmitry
