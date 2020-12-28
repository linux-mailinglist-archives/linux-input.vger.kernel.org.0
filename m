Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AEE0B2E34D4
	for <lists+linux-input@lfdr.de>; Mon, 28 Dec 2020 08:49:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726313AbgL1Htg (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 28 Dec 2020 02:49:36 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:34897 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726300AbgL1Htg (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 28 Dec 2020 02:49:36 -0500
Received: from mail-pg1-f200.google.com ([209.85.215.200])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <po-hsu.lin@canonical.com>)
        id 1ktnGw-0003l8-1A
        for linux-input@vger.kernel.org; Mon, 28 Dec 2020 07:48:54 +0000
Received: by mail-pg1-f200.google.com with SMTP id y2so7649122pgq.23
        for <linux-input@vger.kernel.org>; Sun, 27 Dec 2020 23:48:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=4MT251GRhyk8xqpVMvfb8sAxTW18BvVvWuyUti8uEK8=;
        b=Akw1xucgScp3wF5HCuhOHKo2BydNJsr/rX5jaJ/QqocwMTi8rIQ6kZSzb+cpt35gAd
         D4PZcV+fBhHz2/q81sc9lR1f3FAh5LV0Np3v+IXTVOMtnAnBTLDTfgQgy1lXhIdhGkH0
         iKWMxPIsK6wBj7KjXJfhcYT1yGVaOXa0b4n2cdAwxUpuRGoyWPkq/34QXk3aTgl2dP1D
         mBR7Dt55gu4yqOEXLyHT/zJIYtXftZcW2wX3bSEwyRV2HE8NqxwXFkteIkIA/187X4ik
         A4eZr3BQcrCo64dS0IzfTgBXMvXwe31T7XEJuV21LuPoL+r9/ILy6P254AePE/bVATU7
         CE1g==
X-Gm-Message-State: AOAM5325Qz9QAN4UaudxNoJAlmyX1zvZqZ9IKqnatuNF0Jsv5BNHFL9o
        c/pM5HsowaW+igNGKyfoQGy3hdjDHlVpGdwqxg9wmcsG9Q8hBMedu7wn0OcBv8F5YA3pLdirKKn
        QvULkTSoXPxA1s1xEAsry9A2HaSsrvJQWIUy7hs4=
X-Received: by 2002:a63:1b22:: with SMTP id b34mr12768042pgb.132.1609141732368;
        Sun, 27 Dec 2020 23:48:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxJnEeK/c56yti4kEbq7PFM2Sj6GE0Rw2y2IwHUfLxHDcRTynQVm4jECoTMKJ+KVKnWXAbvqg==
X-Received: by 2002:a63:1b22:: with SMTP id b34mr12768028pgb.132.1609141732067;
        Sun, 27 Dec 2020 23:48:52 -0800 (PST)
Received: from Leggiero.taipei.internal (61-220-137-38.HINET-IP.hinet.net. [61.220.137.38])
        by smtp.gmail.com with ESMTPSA id jz20sm12948043pjb.4.2020.12.27.23.48.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Dec 2020 23:48:51 -0800 (PST)
From:   Po-Hsu Lin <po-hsu.lin@canonical.com>
To:     dmitry.torokhov@gmail.com
Cc:     linux-input@vger.kernel.org
Subject: ACK: [PATCH] input, i8042: unbreak Pegatron C15B
Date:   Mon, 28 Dec 2020 15:48:36 +0800
Message-Id: <20201228074836.23298-1-po-hsu.lin@canonical.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201228072335.GA27766@localhost.localdomain>
References: <20201228072335.GA27766@localhost.localdomain>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

LGTM, thanks for spotting this!

Acked-by: Po-Hsu Lin <po-hsu.lin@canonical.com>
