Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44D94482C58
	for <lists+linux-input@lfdr.de>; Sun,  2 Jan 2022 18:20:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230023AbiABRU4 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 2 Jan 2022 12:20:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229446AbiABRU4 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 2 Jan 2022 12:20:56 -0500
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86717C061761
        for <linux-input@vger.kernel.org>; Sun,  2 Jan 2022 09:20:55 -0800 (PST)
Received: by mail-wm1-x331.google.com with SMTP id p1-20020a1c7401000000b00345c2d068bdso17522913wmc.3
        for <linux-input@vger.kernel.org>; Sun, 02 Jan 2022 09:20:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fTS/g3wvn8ZwWJw7+1qQI6MgKYVnxcDrR7zo/fd7qFc=;
        b=LLNQtpXfaYSuGNglIoZFjV7l4fC9Pp8viL4GDOv5s0MjLP/zm6eoopqwA5uOGUjVNW
         oqRxT9tMq85UBQAiA7Xb1RjtCiA/ONADaujzg3qN6xEahTpdbIpcVAx3acY7aUAv7L86
         Bioov+6XqPWMMBZWaOvPpEAvp6QfeBiaNbzsDwgvRO76/teEBNQXMwOqnTV32+hiNDbo
         AqT8n0GGlVuqCQ5YfGco/NBrifMUtju4BiLqmHZylkpKgoaWQxyC71vzPSDlnCzu+7L/
         jiax1PEkMS9HHOJj4WAO5a1iGqgIOLPu+ppoVK5KEkB7l3sKxZyq29e0Pblt/ALkIC/H
         Kj+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fTS/g3wvn8ZwWJw7+1qQI6MgKYVnxcDrR7zo/fd7qFc=;
        b=ciOKilsTTOo5ZruXDyLmj2ATJq1EFYNrDZt1CNeA3jmxl3htBWXanOFHd5mUw7+gFu
         5ff3uB+HBQ+aHseIiOu1+GmuYHKLCZb7cInDw+XnNssLZ03Jwe209japcMTXEXKyAOo/
         nogEtdYj4jI7qutTzaQpfUz+Qz6fai9Fr+vLwOYU3CeVC1PHNVSzkbklmjWsTq0vGM69
         k0/Z2YNfmdh42cFqv+623qOjK47bedYeNAUCGTxAEK0L4Mk2IqXLR+s96nDHmW35nI65
         Za9WLvJ3f4JJQ8RhA+qBXZWWuwTxSEtcdYxFimeOcqoViOuZBgT1Z+pRAUT+T8I1kCSd
         ZeqQ==
X-Gm-Message-State: AOAM533iPhUVbvDnsVQLHxWuIjFsqtKNXtor/6ks6QCe0YJxCh1e+wDZ
        vJMqUWSWCoFDOdg+nMnG0ZE=
X-Google-Smtp-Source: ABdhPJyySOfJjRFkk/NXrmoBAe4P8MqsL/tpSnQO92Q5ypF5gSbQ0EqcVvjRj0cpzUHUFaBR1Y8zkQ==
X-Received: by 2002:a05:600c:4f91:: with SMTP id n17mr33146278wmq.195.1641144053643;
        Sun, 02 Jan 2022 09:20:53 -0800 (PST)
Received: from localhost.localdomain ([217.113.240.86])
        by smtp.gmail.com with ESMTPSA id b2sm36010766wrd.35.2022.01.02.09.20.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jan 2022 09:20:53 -0800 (PST)
From:   =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To:     alexhenrie24@gmail.com
Cc:     bberg@redhat.com, benjamin@sipsolutions.net, jikos@kernel.org,
        jose.exposito89@gmail.com, linux-input@vger.kernel.org
Subject: Re: [PATCH 2/2] HID: apple: Add 2021 Magic Keyboard with number pad
Date:   Sun,  2 Jan 2022 18:20:45 +0100
Message-Id: <20220102172045.164534-1-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211202061651.115548-2-alexhenrie24@gmail.com>
References: <20211202061651.115548-2-alexhenrie24@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi!

Thanks a lot for the patches Alex.

I tested them on the following hardware:

 - Magic Keyboard 2021 without fingerprint reader. ANSI, ISO and JIS.
 - Magic Keyboard 2021 with fingerprint reader. ANSI.
 - Magic Keyboard 2021 with fingerprint reader and numpad. ANSI

Code looks good as well.

Tested-by: José Expósito <jose.exposito89@gmail.com>

